<?php
/****************************
* Functions for to work
* with DATABASE etc
* @author Mikhail Pastushkov
*****************************/
require 'settings.php';
require 'classes.php';


/***
* Delete booking with approp. ID
* @return message
***/
function cancelBooking($id){
  $sql = "DELETE FROM tb_data WHERE id = ?";
  $db = getConnection();
  $stmt = $db->prepare($sql);
  $stmt->bind_param("i", $id);
  $stmt->execute();

    //check result of affected rows
    //if more than 0 the say
    // everything OK otherwise not
    if($stmt->affected_rows > 0){
      echo "Your booking was successfully canceled";
    }else{
      echo "You have no bookings for this time";
    }
}

/***
* get the bookings of client
* return JSON
***/
function getBookingJson($clientid){
      // ARRAY WILL BE CONVERTED INTO JSON AN RETURN
      $arrBooking =  array();
      $sql = "SELECT vw_data.id, vw_data.dateproc, vw_data.art_fullname, vw_data.procname, vw_data.typename, tb_artistprice.price
              FROM vw_data
              JOIN tb_artistprice ON vw_data.procid = tb_artistprice.procid and vw_data.typeprocid = tb_artistprice.typeprocid and vw_data.artistid = tb_artistprice.artistid
              WHERE vw_data.clientid = ?";

      $db = getConnection();
      $stmt = $db->prepare($sql);
      $stmt->bind_param("i", $clientid);
      $stmt->execute();
      $stmt->store_result();
      $stmt->bind_result($id, $dateproc, $artist, $proc, $type, $price);

        if($stmt->num_rows>0){
            // START FETCHING DATA FROM DB
            while($stmt->fetch()){

              $booking = new Booking();
              $booking->id = $id;
              $booking->datetime = $dateproc;
              $booking->artist = $artist;
              $booking->proc = $proc;
              $booking->type = $type;
              $booking->price = $price;

                $arrBooking[] = $booking;
            }

            echo json_encode($arrBooking);

        }else{
          echo "0";
        }

  $stmt->close();
  $db->close();

}


/***************************************
*  Check the clients and return the object
* or 0 if there is no client
***************************************/
function authClient($email, $mobile){

  $db = getConnection();
  $stmt = $db->prepare("SELECT id,fname, lname, locationid, mobile, email FROM tb_client WHERE email = ? and mobile = ?");
  $stmt->bind_param("ss", $email, $mobile);
  $stmt->execute();
  // save result to get num_rows
  $stmt->store_result();

  $stmt->bind_result($id, $fname, $lname, $locationid, $mobile, $email);

if($stmt->num_rows() > 0){
      while($stmt->fetch()){
          // Fill the object
          $client = new Client();
          $client->id = $id;
          $client->fname = $fname;
          $client->lname = $lname;
          $client->locationid = $locationid;
          $client->mobile = $mobile;
          $client->email = $email;
      }
      return json_encode($client);
    }else{
      return 0;
    }
}// END authClient

/*********************************************
* Book procedure for appropriate time and artist
* and return the message was it booked not
**********************************************/
function bookProcedure($book){
// id that will be returned
// more than 0 successfull otherwise not ( time not available )
  $id = 0;
  $db = getConnection();
    $memo = 'Booked from the WEB';

// query for store procedure
$sql = "call usp_BookTime('".
                                $book->datetime."' , '".
                                $book->client_fname."' , '".
                                $book->client_lname."' , '".
                                $book->phone."' , '".
                                $book->email."' ,".
                                $book->artist_id.",".
                                $book->proc.",".
                                $book->typeproc.",'".
                                $book->city."', '".
                                $memo."',
                                @res); SELECT @res";

                                /* execute multi query */
                                if ($db->multi_query($sql)) {
                                    do {
                                        /* store first result set */
                                        if ($result = $db->store_result()) {
                                            while ($row = $result->fetch_row()) {

                                                $id = $row[0];
                                            }
                                            $result->free();
                                        }

                                    } while ($db->next_result());
                                }

  if ($id > 0){
    // SEND EMAIL
    $to = $book->email;
    $subject = "ORDER FOR $book->datetime";
    $message = "Hello, $book->client_fname $book->client_lname you are booked the procedure in studio YP<br>
                  on $book->datetime. Our manager will contact you to approve the procedure. If the manager won't<br>
                  able to contact you the procedure will be canceled.<br>
                  To cancel use you email and mobile number as login and password<br>
                  Login : $book->email<br>
                  Password: $book->phone";

    // SEND MESSAGE ABOUT BOOKING
    mail($to, $subject, $message);
    echo "Your booking was successfull! We email you details! Our manager will contact you to approve the booking. Thank you!";
  } else {
    echo "Sorry, but this time isn't available! Please choose another time or artist!";
  }

  $db->close();
}// END bookProcedure

/******************************
* Fetch the cities from DB and
* return array of the City
*******************************/
function getCities(){
  $arrCity = array();
  $sql = "SELECT id, city FROM tb_city";
  $db = getConnection();
   $result = $db->query($sql);
   if($result->num_rows > 0){

        while($row = $result->fetch_assoc()){
          $city = new City();
          $city->id = $row["id"];
          $city->city = $row["city"];
          $arrCity[] = $city;
        }

        return $arrCity;
   }
  $db->close();
}

/**********************************
*   return the array with artist id
*   $cityId - id for the city
***********************************/
function getArtistsIds($cityId){
  $arrIds = array();
  $db = getConnection();
 // prepare sql query to return ids for artists
  $sql = "SELECT id, concat(fname,' ',lname) as fullname FROM tb_artist WHERE locationid = ?";
  $stmt = $db->prepare($sql);
  $stmt->bind_param("i",$cityId);
  $stmt->execute();
  $stmt->bind_result($id, $fullname);
        while($stmt->fetch()){
            $arrIds[$id] = $fullname;
        }

  // close connection and prepstmt
  $stmt->close();
  $db->close();

  return $arrIds;
}


/*******************************
* Check the shedule of artist
* using ID and the date
* return the object TimeTable with available slots
* and keeps the price for this procedure
*********************************/
function getSheduleForArtist($idArtist, $date, $idProc, $idTypeProc){
  $arrShedule = array();
  $timeTable = new TimeTable();
  $db = getConnection();

// Time slots
  $dt9  = date_create_from_format('Y-m-d H:i:s', $date." 09:00:00");
  $dt11 = date_create_from_format('Y-m-d H:i:s', $date." 11:00:00");
  $dt13 = date_create_from_format('Y-m-d H:i:s', $date." 13:00:00");
  $dt15 = date_create_from_format('Y-m-d H:i:s', $date." 15:00:00");
  $dt17 = date_create_from_format('Y-m-d H:i:s', $date." 17:00:00");

// get the price and full name
$stmt = $db->prepare("call usp_GetFullNameAndPriceByIds(?, ?, ?)");

$stmt->bind_param("iii", $idArtist, $idProc, $idTypeProc);
$stmt->execute();
$stmt->bind_result($id, $fname, $price);
$stmt->fetch();
$stmt->close();

  $timeTable->artFullname = $fname;
  $timeTable->price = $price."KZT";
  $timeTable->artId = $id;

$sql = "call usp_GetShedule(?, ?, ?, ?)";
$stmt = $db->prepare($sql);
$dateq = $date.'%';
  $stmt->bind_param("siii", $dateq, $idArtist, $idProc, $idTypeProc);
  $stmt->execute();
  // Bind recieved fileds to vars
 $stmt->bind_result($id, $dateproc, $artFullname, $price2);
 while($stmt->fetch()){
   $dt = date_create_from_format('Y-m-d H:i:s', $dateproc);
   // Fill the object with available slots of time
    $timeTable->setArtFullName($artFullname);

    // Check time slots if the slots its free change the object propertie
    //echo "CHECK THE TIME: ".$dt->format('Y-m-d H:i:s')."<br>";
    if( ($dt >= $dt9) && ($dt < $dt9->modify('+119 minutes')) ){
      $timeTable->time_9_11 = false;
    }
    if( ($dt >= $dt11) && ($dt < $dt11->modify('+119 minutes')) ){
      $timeTable->time_11_13 = false;
    }
    if( ($dt >= $dt13) && ($dt < $dt13->modify('+119 minutes')) ){
      $timeTable->time_13_15 = false;
    }
    if( ($dt >= $dt15) && ($dt < $dt15->modify('+119 minutes')) ){
      $timeTable->time_15_17 = false;
    }
    if( ($dt >= $dt17) && ($dt < $dt17->modify('+119 minutes')) ){
      $timeTable->time_17_19 = false;
    }

  }

  // close resourses
  $stmt->close();
  $db->close();
// logVar($timeTable);
  return $timeTable;
 }



/*************************
*  return connection object
**************************/
function getConnection(){
  // Get connection
  $db = new mysqli( DBSRV, DBLOGIN, DBPWD,  DBNAME );
  if( $db->connect_error ){
    die(" Connection failed ! ".$db->connect_error);
  }else{
      return $db;
  }


}

/*************
 Get available procecures
**************/
function getProcedures(){

  $sql = "SELECT id, procname FROM tb_proc";

  $db = getConnection();
  $result = $db->query($sql);
  if($result->num_rows > 0){
    while($row = $result->fetch_assoc()){
      $output.= "<div class='radio'>
                    <label><input type='radio' name='optradio' value='".$row["id"]."' >".$row["procname"]."</label>
                </div>";
    }
  }

  // Close connection
  $db->close();
  return $output;
}

/*******************************
RETURN THE JSON OF PROCEDURES
********************************/
function getProceduresJson(){
  $arrProc = array();
  $sql = "SELECT id, procname FROM tb_proc";

  $db = getConnection();
  $result = $db->query($sql);
  if($result->num_rows > 0){
    while($row = $result->fetch_assoc()){
      $p = new Procedure();
      $p->id = $row["id"];
      $p->procName = $row["procname"];
      $arrProc[] = $p;
    }
  }
// Close connection
$db->close();
 echo json_encode($arrProc);
}

/*******************************
 GET THE JSON OF TYEPROCEDURES
********************************/
function getTypeProceduresJson(){
  $arrTypeProc = array();
  $sql = "SELECT id, typename FROM tb_typeproc";

  $db = getConnection();
  $result = $db->query($sql);
  if($result->num_rows > 0){
    while($row = $result->fetch_assoc()){
      $p = new TypeProcedure();
      $p->id = $row["id"];
      $p->typeName = $row["typename"];
      $arrTypeProc[] = $p;
    }
  }
// Close connection
$db->close();
 echo json_encode($arrTypeProc);
}

/******************************
* GET JSON OBJECT WITH TIMETABLE OBJECTS FOR THE CITY, PROC AND TYPE.
******************************/
function getSheduleJson($date, $idProc, $idProcType){

    // The result that will be returned as the JSON object;
    $arrTimeTables = array();
    // Get the artist id for Aktau

    // Get the cities
    $arrCity = getCities();

    foreach ($arrCity as $id => $city) {

      $arrTimeTable  = array();
      $arrIdsArtistsAktau = getArtistsIds($city->id);

      foreach ($arrIdsArtistsAktau as $id => $fullname) {

         $timeTable = getSheduleForArtist($id, $date, $idProc, $idProcType);
         $arrTimeTable[] = $timeTable;

       } // end ids foreach

       $arrTimeTables[$city->city] = $arrTimeTable;

  }// end cities foreach

  echo json_encode($arrTimeTables);
}


/********************
* Secure the variable
* remove the tags and other
* to prepare variable
*******************/
function secureVar($var){
  return htmlspecialchars(strip_tags(trim($var)));
}

/********************
*
*
*******************/
function logVar($var, $name){

  echo "<br>$name<br><pre>";
  var_export($var);
  echo "<pre>";

}

?>

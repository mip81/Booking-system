
<?php
/***************************
* Midle layer
* Get the request from UI
* and return or alter the data
***************************/

//json_decode(file_get_content(“php://input”))

include 'inc/func.php';
include 'inc/settings.php';
// if ($_SERVER["HTTP_HOST"] != HTTP){
//   die();
// }
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

  $action = $_POST['action'];
  //$book = json_decode($_POST["book"]);

  switch($action){
    case 'proc':  // Get the name of Procedures
        getProceduresJson();
      break;
    case 'typeproc': // Get the type of Procedures
          getTypeProceduresJson();
      break;
    case 'timetable': // Get the TimeTables of Artist for date
          //var_dump($_POST);
          $dt = secureVar($_POST["dt"]);
          $procId = secureVar($_POST["procId"]);
          $typeProcId = secureVar($_POST["typeProcId"]);
          @getSheduleJson($dt, $procId, $typeProcId);
      break;
    case 'book':
        $book = json_decode($_POST["book"]);
        bookProcedure($book);
      break;
    case 'getbooking':
        $id = secureVar($_POST['id']);
        getBookingJson($id);
      break;
    case 'cancelBooking':
        $id = secureVar($_POST['bookid']);
        cancelBooking($id);
      break;

  }
}

 ?>

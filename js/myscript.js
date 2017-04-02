
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http, $window) {




  // show and hide login links
  $scope.showLogin = $window.isShowLogin;
  $scope.showLogout = $window.isShowLogout;

  // Object client
  $scope.client = $window.client;

  $scope.isMsgEnabled = false; // Hide alert message by default
  $scope.selProc = 1;
  $scope.selTypeProc = 1;
  $scope.bookings= "";
  $scope.date = getDate(new Date());
  // Booking for approp dattime, artist and proc;
  $scope.book = {
    datetime :"",
    client_fname :"",
    client_lname :"",
    price :"",
    city :"",
    email :"",
    phone :"",
    proc :"",
    typeproc :"",
    artist_id :"",
    artist_fullname :""
  }

//****************************
// CANCEL BOOKING OF CLIENT
$scope.cancelBooking = function(book_id){

  //alert(book_id);
  $http({
      method: 'POST',
      url: 'jsonctr.php',
      data: $.param({action: 'cancelBooking',
              bookid: book_id
            }),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    }).then(function(response){

     // get the message
     $scope.alertMsg = response.data;
     // Show the alert message
     $scope.isMsgEnabled = true;

  });

  $('html, body').animate({scrollTop: 0},500);
  // Refresh the timetable
  $scope.getTimeTables();
} // END cancelBooking
  //******************





//---------------------------------------------------------------
// function prepared bookkin save choosen artist, price and time
//---------------------------------------------------------------
  $scope.assignToBook = function(artid, fname, dt, price, city){
    // get the variables for booking
    $scope.book.artist_id = artid;
    $scope.book.datetime = dt;
    $scope.book.price = price;
    $scope.book.city = city;
    $scope.book.artist_fullname = fname;


  }
  //-----------------------------------
  //        BOOK CHOOSEN TIME
  //-----------------------------------
  $scope.bookTime = function(){
    // get the data from the form
    $scope.book.client_fname  = $scope.bookf_fname;
    $scope.book.client_lname = $scope.bookf_lname;
    $scope.book.email = $scope.bookf_email;
    $scope.book.phone = $scope.bookf_phone;
    $scope.book.proc = $scope.selProc;
    $scope.book.typeproc = $scope.selTypeProc;


    $http({
        method: 'POST',
        url: 'jsonctr.php',
        data: $.param({action: 'book',
                book: JSON.stringify($scope.book)

              }),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
      }).then(function(response){

          
        // get the message
        $scope.alertMsg = response.data;
        // Show the alert message
        $scope.isMsgEnabled = true;

        $('html, body').animate({scrollTop: 0},500);
        // Refresh the timetable
        $scope.getTimeTables();

    });
  }
      //---------------------------
     // GET TIMETABLE JSON
    // ARRAY OF ARRAY
   //------------------------------
    $scope.getTimeTables = function(){

        $http({
                  method: 'POST',
                  url: 'jsonctr.php',
                  data: $.param({
                         action: 'timetable',
                         dt: $scope.date,
                         procId: $scope.selProc,
                         typeProcId: $scope.selTypeProc
                       }),
                  headers: {'Content-Type': 'application/x-www-form-urlencoded'}
              }).then(function(response){

              $scope.sheduleJSON = response.data;

            // get description of procedure
            for(i=0; i < $scope.procJSON; i++){
               if($scope.procJSON[i].id == $scope.selProc){
                  $scope.descProc = $scope.procJSON[i].procName;
               }
            }

        });


        // IF CLIENT LOGGED IN SHOW HIS BOOKINGS
           if ($scope.showLogout=="true"){
             $scope.bookf_fname = $scope.client["fname"];
             $scope.bookf_lname = $scope.client["lname"];
             $scope.bookf_email = $scope.client["email"];
             $scope.bookf_phone = $scope.client["mobile"];

             // GET THE BOOKING
             $http({
                 method: 'POST',
                 url: 'jsonctr.php',
                 data: $.param({action: 'getbooking',
                         id: client['id']
                       }),
                 headers: {'Content-Type': 'application/x-www-form-urlencoded'}
               }).then(function(response){
                  // bookings of client
                $scope.bookings = response.data;

             });
           }

    };



// Get the procedures from JSON
    $http({
        method: 'POST',
        url: 'jsonctr.php',
        //params:{action: 'proc'},
        data: $.param({action: 'proc'}),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
      }).then(function(response){

      $scope.procJSON = response.data;

    });

// Get the type of procedures from JSON
    $http({
        method: 'POST',
        url: 'jsonctr.php',
        data: $.param({action: 'typeproc'}),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
      }).then(function(response){

      $scope.typeProcJSON = response.data;

    });


    $scope.getTimeTables($scope.date, $scope.selProc, $scope.selTypeProc);

});

$(document).ready(function(){

// Settings of datepicker
  $('.form_date').datetimepicker({
    format: 'yyyy-mm-dd',
    minView: 2,
    todayBtn: true,
    autoclose: true,
    pickerPosition: "bottom-left"
    });


});

// return proper date
function getDate(date) {
  var yyyy = date.getFullYear().toString();
  var mm = (date.getMonth()+1).toString();
  var dd  = date.getDate().toString();

  var mmChars = mm.split('');
  var ddChars = dd.split('');

  return yyyy + '-' + (mmChars[1]?mm:"0"+mmChars[0]) + '-' + (ddChars[1]?dd:"0"+ddChars[0]);
}

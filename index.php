
<?php
session_start();
// CHECK IF THE CLIENT LOGGED IN
if(isset( $_SESSION["client"]) && $_SESSION["client"] != "0" ){
  $client = $_SESSION["client"];
  $showLogout = "true";
  $showLogin = "false";
}else{
  $showLogout = "false";
  $showLogin = "true";
  $client = 0;
}

 //  print_r($_SESSION);

 ?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>YP Studio' online booking system</title>

        <link href="css/bootstrap.css" type="text/css" media="screen" rel="stylesheet">
        <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" type="text/css" href="css/style.css">


        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap-datetimepicker.js"></script>
        <script src="js/angular.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.0-beta.1/angular-cookies.min.js"></script>
        <script>
              // BRIDGE FOR VARS
             var isShowLogout = "<?= $showLogout; ?>";
             var isShowLogin =  "<?= $showLogin; ?>";

             if(isShowLogin){
                var client = <?= $client; ?>;
             }

        </script>
        <script src="js/myscript.js"></script>

  </head>
  <body  ng-app="myApp" ng-controller="myCtrl" ng-cloak="true">

<div ng-repeat="(key, val) in sheduleJson">
    <span>{{ key }}</span>

</div>
    <nav class="navbar navbar-inverse">
     <div class="container-fluid">
       <div class="navbar-header">
         <a class="navbar-brand" href="#">YP Studio's booking</a>
       </div>
       <ul class="nav navbar-nav">

       </ul>
       <ul class="nav navbar-nav navbar-right">
         <li  ng-show="{{ showLogin }}" ><a href="#" data-toggle="modal" data-target="#loginModal"><i class="glyphicon glyphicon-log-in"></i> Login</a></li>
         <li ng-show="{{ showLogout }}" >
           <a href="logout.php"> Welcome {{ client['fname']+" "+client['lname'] }}&nbsp&nbsp&nbsp&nbsp
             <i class="glyphicon glyphicon-log-out"></i> Logout</a></li>
       </ul>
     </div>
   </nav>
 <!-- Alert message -->

     <div class="alert alert-success alert-dismissable" ng-show="isMsgEnabled">
       <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
       <span style="font-weight: bold; margin: 0 auto;">{{ alertMsg }}</span>
     </div>

<!-- The top part for choosing procedure and date -->
    <div class="container panel">
      <div class="row">
        <div class="col-md-3">
          <img class="img-responsive" src="images/logo.png">
        </div>
        <div class="col-md-9">

<!-- Procedure block -->
          <div class="col-md-6">

                <div class="panel panel-default panel-procedure">
                  <div class="panel-heading">
                    1.  Choose your procedure:
                  </div>
                  <div class="panel-body">

                    <div class="radio" ng-repeat="x in procJSON">
                        <label><input ng-model="$parent.selProc" ng-click="getTimeTables()" type="radio" name="proc" value="{{ x.id }}"  ng-checked="{{ x.id == 1}}"> {{ x.procName }} </label>
                    </div>

                    <div ng-model="description" class="well">
                        {{ description }}
                    </div>

                  </div>
                </div>
          </div>
<!-- Procedure type and date block -->
          <div class="col-md-6">
                  <div class="panel panel-default">
                    <div class="panel-heading">
                        2. Choose the type:
                    </div>
                    <div class="panel-body">

                      <div class="radio" ng-repeat="x in typeProcJSON">
                          <label><input ng-model="$parent.selTypeProc" ng-click="getTimeTables()" type="radio" name="typeProc" value="{{ x.id }}" ng-checked="{{ x.id == 1}}" > {{ x.typeName }} </label>
                      </div>

                    </div>
                  </div>

                  <div class="panel panel-default">
                      <div class="panel-heading">
                        3.  Choose your date:
                      </div>
                      <div class="panel-body">
                        <div class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                          <input id="date" ng-change="getTimeTables()" ng-model="date" class="form-control" size="16" type="text" value="{{ date }}" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                      </div>
                      </div>
                  </div>
          </div>

          <div class="col-md-12">

          </div>
        </div>
      </div>

  <!-- Table of customer's booking -->
      <div class="row" ng-show="bookings !=0 ">


          <div class="col-md-12">
              <div class="tabel-responsible" ng-include="'inc/blocks/booktable.php'"></div>
          </div>
      </div>

  <!-- Tabel of Artist's timetable -->
      <div class="row">
        <div class="col-md-12">
          <div id="shedule" class="tabel-responsive" ng-include="'timetables.php'"></div>

        </div>

      </div>
    </div>

<!-- Book form -->
  <div ng-include="'inc/blocks/bookform.php'">
  </div>

  <!-- Login form -->
  <div ng-include="'inc/blocks/loginform.php'">
  </div>



  </body>
</html>

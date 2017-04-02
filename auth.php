<?php

include 'inc/func.php';
include 'inc/settings.php';




// Security check
  if ($_SERVER['REQUEST_METHOD'] === 'POST' && $_SERVER['HTTP_HOST']=== HTTP_HOST ) {
      // get the data from form
      // and check the customer
      // if there is no client
      // retun 0 otherwise 1
      // in SESSION[auth]
    $email = secureVar($_POST["email"]);
    $mobile = secureVar($_POST["pwd"]);

    session_start();

    $client = authClient($email, $mobile);

    $_SESSION["client"] = $client;
    // retun back to index (main page)
    header("Location: /index.php");
    exit();
  }


 ?>

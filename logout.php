<?php
session_start();
  unset($_SESSION['client']);
  unset($_SESSION['book']);
  
  header("Location: /index.php");
  exit();
 ?>

<?php
/***************************
* Booking of client
* in the system
***************************/
class Booking{
  public $id;
  public $datetime;
  public $artist;
  public $proc;
  public $type;
  public $price;
}
/***************************
* Represent the client
* in the system
***************************/
class Client{
  public $id;
  public $locationid;
  public $fname;
  public $lname;
  public $mobile;
  public $email;

}
/***************************
* Represent the tb_city table
*keep the name of city and id
***************************/
class City{
   public $id;
   public $city;

}

/***************************
* Represent the tb_typeproc table
*keep the name type of procedures and id
***************************/
class TypeProcedure{
   public $id;
   public $typeName;

}

/***************************
* Represent the tb_proc table
*keep the name procedures and id
***************************/
class Procedure{
   public $id;
   public $procName;
   public $desc;

}

/****************************
*  The class keep the shedule
*  of the Artist.
*****************************/
class TimeTable{

// The fullname of the artist
  public $artFullname;

  // Artist id
  public $artId;

 // Time slots
 public $time_9_11 = true;
 public $time_11_13 = true;
 public $time_13_15 = true;
 public $time_15_17 = true;
 public $time_17_19 = true;

 public $price;

// Getters and setters
// to get access of properties
public function setPrice($price){
  $this->price = $price;
}

public function getPrice(){
  return $this->price;
}

public function setArtFullName($var){
  $this->artFullname = $var;
}
public function getArtFullName(){
  return $this->artFullname;
}

 public function setTime_9_11($var){
   $this->time_9_11 = $var;
 }
 public function getTime_9_11(){
   return $this->time_9_11;
 }
 public function setTime_11_13($var){
   $this->time_11_13 = $var;
 }
 public function getTime_11_13(){
   return $this->time_11_13;
 }
 public function setTime_13_15($var){
   $this->time_13_15 = $var;
 }
 public function getTime_13_15(){
   return $this->time_13_15;
 }
 public function setTime_15_17($var){
   $this->time_15_17 = $var;
 }
 public function getTime_15_17(){
   return $this->time_15_17;
 }
 public function setTime_17_19($var){
   $this->time_17_19 = $var;
 }
 public function getTime_17_19(){
   return $this->time_17_19;
 }

}


 ?>

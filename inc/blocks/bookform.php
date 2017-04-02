<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
<div class="modal-dialog">

  <!-- Modal content-->
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
      <h4 class="modal-title">Booking form</h4>
    </div>
    <div class="modal-body">
          <!-- BODY START -->
          <div class="well">
              <div class="row">
                  <div class="col-xs-5">
                      Artist:<br>
                      Date and time:
                  </div>
                  <div class="col-xs-7">
                      <kbd>{{ book.artist_fullname }}</kbd><br>
                      <kbd>{{ book.datetime }}</kbd><br>
                  </div>
              </div>
              <br>
                <table>
                  <tr>
                    <td><i class="glyphicon glyphicon-ok-sign" style="color: green; font-weight: 'Times New Roman'; padding-right: 15px;"></i> </td>
                    <td class="tdbookf">To book the selected
                          time and artist
                          please fill the form.<br>
                    </td>
                  </tr>
                  <tr>
                    <td><i class="glyphicon glyphicon-remove-sign" style="color: red; margin-right: 5px;"> </i></td>
                    <td class="tdbookf">To cancel your booking use your email and phone as the password</td>
                  </tr>
                </table>
          </div>



      <form name="bookForm" >
          <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
              <input ng-model="$parent.bookf_fname" name="bookf_fname" id="bookf_fname" type="text" class="form-control"  placeholder="Enter your firstname" required>
          </div>
          <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
              <input ng-model="$parent.bookf_lname" id="lname" type="text" class="form-control" name="bookf_lname" placeholder="Enter your lastname" required>
          </div>

          <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
              <input ng-model="$parent.bookf_phone" id="phone" type="number" class="form-control" name="bookf_phone" placeholder="Phone number" required>
          </div>
          <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input ng-model="$parent.bookf_email" id="email" type="email" class="form-control" name="bookf_email" placeholder="Email" required>
          </div>
          <!-- BODY END -->
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-default" ng-click="bookTime()" data-dismiss="modal" ng-disabled="bookForm.$invalid">Ok</button>
      <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
      <div>
    </div>
    </div>
  </div>

  </form>
</div>
</div>

<!-- Modal -->
<form action="auth.php" method="post" class="form-horizontal">
  <div id="loginModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Login</h4>
        </div>


        <div class="modal-body">
                <div class="form-group">
                  <label class="control-label col-sm-3" for="email">Email:</label>
                  <div class="col-sm-9">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                      <input ng-model="$parent.login" type="email" class="form-control" name="email" placeholder="Enter email">
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <label class="control-label col-sm-3" for="pwd">Password:</label>
                  <div class="col-sm-9">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input ng-model="$parent.password" type="password" class="form-control" name="pwd" placeholder="Enter password">
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox" ng-show="false">
                      <label><input type="checkbox"> Remember me</label>
                    </div>
                  </div>
                </div>
        </div>

        <div class="modal-footer">
          <button type="submit" value="submit" class="btn btn-success">Submit</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>

      </div>

    </div>
  </div>

</form>

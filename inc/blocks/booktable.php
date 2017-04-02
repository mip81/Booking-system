<!-- The block to show customers bookings -->

<table class="table table-striped table-hover table-bordered">
  <tr>
    <th  colspan="5">
      <div style="display: inline-block;">
       Your bookings:
     </div>
   </th>
   <th>
       <div class="text-right">
           <span class="badge">{{ bookings.length }}</span>
       </div>
    </th>
  </tr>

 <tr>
  <th>Date/Time</th>
  <th>Artist</th>
  <th>Procedure</th>
  <th>Type</th>
  <th>Price</th>
  <th></th>
</tr>
  <tr ng-repeat="booking in bookings | orderBy: 'datetime'" >
      <td class="datatable"><kbd>{{ booking.datetime }}</kbd></td>
      <td class="datatable">{{ booking.artist }}</td>
      <td class="datatable">{{ booking.proc }}</td>
      <td class="datatable">{{ booking.type }}</td>
      <td class="datatable"><b>{{ booking.price+"KZT" }}</b></td>
      <td class="datatable"><button ng-click="cancelBooking(booking.id);" class="btn btn-danger btn-xs" type="button" name="button"><i class="glyphicon glyphicon-remove"></i>&nbsp&nbspCancel</button></td>
  </tr>
</table>

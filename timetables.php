<!-- The block to show TimeTable of Artists -->
<TABLE class='table table-striped table-hover table-bordered' ng-repeat="(city, timetables) in sheduleJSON">
<TR>
  <TH class="info text-uppercase" colspan='6'>
      {{ city }}
  </TH>
</TR
<TR>
  <TH>Artist</TH>
  <TH>9am-11am</TH>
  <TH>11am-13pm</TH>
  <TH>13pm-15pm</TH>
  <TH>15pm-17pm</TH>
  <TH>17pm-19pm</TH>
<TR ng-repeat="artTimeTable in timetables">
    <TD>
      {{ artTimeTable.artFullname }}
      <span ng-model=""  ng-show="false">  </span>
    </TD>
      <TD class="datatable">
          <button ng-click="assignToBook(artTimeTable.artId, artTimeTable.artFullname, date+' 09:00', artTimeTable.price, city);"
            data-toggle="modal" data-target="#myModal"
            class="datatable {{artTimeTable.time_9_11 ? 'btn btn-success' : 'btn btn-danger'  }}"
            ng-disabled="{{ !artTimeTable.time_9_11 }}" name="button"  >{{ artTimeTable.price }}</button>
      </TD>
      <TD class="datatable">
          <button ng-click="assignToBook(artTimeTable.artId, artTimeTable.artFullname, date+' 11:00', artTimeTable.price, city );"
            data-toggle="modal" data-target="#myModal"
            class="datatable {{artTimeTable.time_11_13 ? 'btn btn-success' : 'btn btn-danger'  }}"
            ng-disabled="{{ !artTimeTable.time_11_13 }}" name="button"  >{{ artTimeTable.price }}</button>
      </TD>
      <TD class="datatable">
          <button ng-click="assignToBook(artTimeTable.artId, artTimeTable.artFullname, date+' 13:00', artTimeTable.price, city);"
            data-toggle="modal" data-target="#myModal"
            class="datatable {{artTimeTable.time_13_15 ? 'btn btn-success' : 'btn btn-danger'  }}"
            ng-disabled="{{ !artTimeTable.time_13_15 }}" name="button"  >{{ artTimeTable.price }}</button>
      </TD>
      <TD class="datatable">
        <button ng-click="assignToBook(artTimeTable.artId, artTimeTable.artFullname, date+' 15:00', artTimeTable.price, city);"
          data-toggle="modal" data-target="#myModal"
          class="datatable {{artTimeTable.time_15_17 ? 'btn btn-success' : 'btn btn-danger'  }}"
          ng-disabled="{{ !artTimeTable.time_15_17 }}" name="button"  >{{ artTimeTable.price }}</button>
      </TD>
      <TD class="datatable">
        <button ng-click="assignToBook(artTimeTable.artId, artTimeTable.artFullname, date+' 17:00', artTimeTable.price, city);"
          data-toggle="modal" data-target="#myModal"
          class="datatable {{artTimeTable.time_17_19 ? 'btn btn-success' : 'btn btn-danger'  }}"
          ng-disabled="{{ !artTimeTable.time_17_19 }}" name="button"  >{{ artTimeTable.price }}</button>
      </TD>
    </TR>
</TABLE>

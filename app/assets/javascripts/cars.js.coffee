jQuery ->
  $('#cars').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#cars').data('source')


    $.fn.dataTable.ext.errMode = 'throw';
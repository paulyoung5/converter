# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	today = new Date()
	minDate = new Date()
	minDate.setMonth(minDate.getMonth()-3)
	
	$(".jquery-ui-date").datepicker({
    	hideIfNoPrevNext: true,
    	dateFormat: 'yy-mm-dd',
    	minDate: minDate,
    	maxDate: today
    })
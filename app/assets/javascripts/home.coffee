# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	
	$('.ui.form').validate({
            
            
        rules: {
            "exchange_rate[amount]": {
                required: true
            },
            "exchange_rate[currency_from]": {
                required: true
            },
            "exchange_rate[currency_to]": {
                required: true
            },
            "exchange_rate[date]": {
                required: true
            }
        }
        

    })
	
	maxDate = new Date()
	maxDate.setDate(maxDate.getDate() - 1)
	
	minDate = new Date()
	minDate.setMonth(minDate.getMonth()-3)
	
	$(".jquery-ui-date").datepicker({
    	hideIfNoPrevNext: true,
    	dateFormat: 'yy-mm-dd',
    	minDate: minDate,
    	maxDate: maxDate,
    	defaultDate: maxDate
    })
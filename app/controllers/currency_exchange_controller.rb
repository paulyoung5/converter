class CurrencyExchangeController < ApplicationController
	def index
		@rates = ExchangeRate.all
	end
	def convert
		date = params[:exchange_rate][:date]
		amount = (params[:exchange_rate][:amount]).to_d.round(2)
		currency_from = params[:exchange_rate][:currency_from]
		currency_to = params[:exchange_rate][:currency_to]
		
		@errors = Array.new
		
		# Check everything was filled out correctly
		if date.blank? or amount.blank? or currency_from.blank? or currency_to.blank?
			
			@errors.push("One or more fields were not filled out.")
		
		else
		
			rates = ExchangeRate.at(date, currency_from, currency_to)
		
    		if rates.blank?
    			
    			@errors.push("There was an error when trying to find currency rates for that reference date.")
    			
    		else
    		
    			# First, convert to euros by dividing by base currency rate
    			# Then convert to desired currency by multiplying euros by the rate of desired currency
    			newAmount = ((amount / rates[0]) * rates[1]).round(2)
    			
    			# Finally, store the relevant data as a hash for use by the view
    			@result = {
    					"previousAmount" => amount.to_s,
    					"currencyFrom" => currency_from,
    					"currencyTo" => currency_to,
    					"newAmount" => newAmount.to_s
    			}
    			
    		end

		end
		
	end
end
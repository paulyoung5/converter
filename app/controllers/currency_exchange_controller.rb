class CurrencyExchangeController < ApplicationController
	def index
		@rates = ExchangeRate.all
	end
	def convert
		date = params[:exchange_rate][:date]
		amount = (params[:exchange_rate][:amount]).to_d.round(2)
		currency_from = params[:exchange_rate][:currency_from]
		currency_to = params[:exchange_rate][:currency_to]
		
		
		# Check everything was filled out correctly
		#if date.present? or amount.present? or currency_from.present? or currency_to.present?
			
		#	raise 'One or more fields were not filled out'
			
		#end
		
		# First, convert to euros by dividing by base currency rate
		euroRow = ExchangeRate.where(date: date).where(currency: currency_from).take
		euros = (amount / euroRow.rate)
		
		# Now convert to desired currency by multiplying euros by the rate of desired currency
		desiredCurrRow = ExchangeRate.where(date: date).where(currency: currency_to).take
		
		newAmount = (euros * desiredCurrRow.rate).round(2).to_s
		
		# Return the relevant data as a hash to the view
		@result = {
					"previousAmount" => amount.to_s,
					"currencyFrom" => currency_from,
					"currencyTo" => currency_to,
					"newAmount" => newAmount
		}
		
	end
end
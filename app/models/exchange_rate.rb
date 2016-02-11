class ExchangeRate < ActiveRecord::Base
	
	def self.at(date, currency_from, currency_to)
		
		# Get rate to convert present current currency -> EUR
		backToEurosRow = self.where(date: date).where(currency: currency_from).take
		
		# Get rate to convert EUR -> desired currency
		desiredCurrRow = self.where(date: date).where(currency: currency_to).take
		
		if backToEurosRow.nil? or desiredCurrRow.nil?
			return nil
		else
			# Return rates as an array
			return [backToEurosRow.rate, desiredCurrRow.rate]
		end
		
	end
	
end

class HomeController < ApplicationController
  def index
	  @dates = ExchangeRate.select('DISTINCT date')
  end
end
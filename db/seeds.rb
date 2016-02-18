# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'
require 'uri'

ExchangeRate.delete_all

doc = Nokogiri::XML(open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml").read)

doc.remove_namespaces!

dates = doc.xpath("//Cube/Cube")

dates.each do |cube|

	# foreach currency...
    cube.xpath("./Cube").each do |curr|
        ExchangeRate.create(:currency=>curr.attr('currency'), :rate=>curr.attr('rate'), :date => cube.attr('time'))
    end
    
end
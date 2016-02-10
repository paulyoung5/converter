== converter

A simple, compact currency converter offering 31 different currencies. Reference foreign exchange rates used are taken from the European Central Bank and are available for every date in the previous 4 months. The base currency is the Euro.

Some currencies included:

* USD
* GBP
* HKD
* AUD
* and 27

== Enviroment

Ruby v2.1.1

== Database

Exchange rates for each currency are stored for every reference date in the database using Active Record.

When installing, remember to run `rake db:migrate` to set up the necessary tables.

Tip:
To pull in the latest 4 months, call `rake db:seed` in the command line.

== Testing

System tests to ensure form validation and accuracy of data can be carried out by calling `rake test`.
class DropTables < ActiveRecord::Migration
  def down
	  drop_table :currencies
	  drop_table :exchange_rates
  end
end

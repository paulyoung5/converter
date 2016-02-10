class CreateExchangeRates < ActiveRecord::Migration
  def change
    create_table :exchange_rates do |t|
      t.string :date
      t.decimal :rate
      t.string :currency

      t.timestamps null: false
    end
  end
end

class CreateCurrencyExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_exchanges do |t|
      t.string :from_currency
      t.string :to_currency
      t.decimal :exchange_rate

      t.timestamps
    end
  end
end

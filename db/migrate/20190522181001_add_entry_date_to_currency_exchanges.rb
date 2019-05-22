class AddEntryDateToCurrencyExchanges < ActiveRecord::Migration[5.2]
  def change
    add_column :currency_exchanges, :entry_date, :date
  end
end

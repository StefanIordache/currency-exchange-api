class AddCreatedByToCurrencyExchanges < ActiveRecord::Migration[5.2]
  def change
    add_column :currency_exchanges, :created_by, :string
  end
end

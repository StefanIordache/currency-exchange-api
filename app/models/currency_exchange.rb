class CurrencyExchange < ApplicationRecord
  validates_presence_of :from_currency, :to_currency, :exchange_rate, :entry_date
end

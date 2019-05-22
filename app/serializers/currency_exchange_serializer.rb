class CurrencyExchangeSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :from_currency, :to_currency, :exchange_rate, :entry_date, :created_by, :created_at, :updated_at
end

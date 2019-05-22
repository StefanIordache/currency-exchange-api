require 'rails_helper'

RSpec.describe CurrencyExchange, type: :model do
  # Validation tests
  it { should validate_presence_of(:from_currency) }
  it { should validate_presence_of(:to_currency) }
  it { should validate_presence_of(:exchange_rate) }
  it { should validate_presence_of(:entry_date) }
  # it { should validate_presence_of(:created_by) }
end

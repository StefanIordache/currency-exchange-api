require 'rails_helper'

RSpec.describe 'Exchange API', type: :request do
  # Initialize test data
  let(:user) { create(:user) }
  let!(:currency_exchanges) { create_list(:currency_exchange, 10, created_by: user.id) }
  let(:currency_exchange_id) { currency_exchanges.first.id }

  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET/currency_exchanges
  describe 'GET /currency_exchanges' do
    # update request with headers
    before { get '/currency_exchanges', params: {}, headers: headers }

    it 'returns currency_exchanges' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  # Test suite for GET/currency_exchanges/:id
  describe 'GET /currency_exchanges/:id' do
    before { get "/currency_exchanges/#{currency_exchange_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the currency_exchange' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(currency_exchange_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:currency_exchange_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find CurrencyExchange/)
      end
    end
  end


  # Test suite for POST /currency_exchanges
  describe 'POST /currency_exchanges' do
    #valid payload
    let(:valid_attributes) do
      { from_currency: 'EUR', to_currency: 'RON', exchange_rate: 3.0, entry_date: '30-04-1997'.to_date }.to_json
    end

    context 'when request is valid' do
      before { post '/currency_exchanges', params: valid_attributes, headers: headers }

      it 'creates a currency_exchange' do
        expect(json['from_currency']).to eq('EUR')
        expect(json['to_currency']).to eq('RON')
        expect(json['exchange_rate']).to eq("3.0")
        expect(json['entry_date']).to eq("30-04-1997")
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { from_currency: nil, to_currency: nil, exchange_rate: nil, entry_date: nil }.to_json }
      before { post '/currency_exchanges', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
            .to match(/Validation failed: From currency can't be blank, To currency can't be blank, Exchange rate can't be blank, Entry date can't be blank/)
      end
    end
  end


  # Test suite for PUT /currency_exchanges/:id
  describe 'PUT /currency_exchanges/:id' do
    let(:valid_attributes) { { from_currency: 'EUR', to_currency: 'RON', exchange_rate: 4.5 }.to_json }

    context 'when the record exists' do
      before { put "/currency_exchanges/#{currency_exchange_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end


  # Test suite for DELETE /currency_exchanges/:id
  describe 'DELETE /currency_exchanges/:id' do
    before { delete "/currency_exchanges/#{currency_exchange_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
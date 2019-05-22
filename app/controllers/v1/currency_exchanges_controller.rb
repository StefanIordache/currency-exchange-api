module V1
  class CurrencyExchangesController < ApplicationController
    before_action :set_currency_exchange, only: [:show, :update, :destroy]

    # GET /currency_exchanges
    def index
      @currency_exchanges = CurrencyExchange.all
      json_response(@currency_exchanges)
    end

    # POST /currency_exchanges
    def create
      @currency_exchange = CurrencyExchange.create!(currency_exchange_params)
      @currency_exchange = @currency_exchange.update('created_by': current_user.id)
      json_response(@currency_exchange, :created)
    end

    # GET /currency_exchanges/:id
    def show
      json_response(@currency_exchange)
    end

    # PUT /currency_exchanges/:id
    def update
      @currency_exchange.update!(currency_exchange_params)
      head :no_content
    end

    # DELETE /currency_exchanges/:id
    def destroy
      @currency_exchange.destroy
      head :no_content
    end

    private

    def currency_exchange_params
      # whitelist params
      params.permit(:from_currency, :to_currency, :exchange_rate, :entry_date)
    end

    def set_currency_exchange
      @currency_exchange = CurrencyExchange.find(params[:id])
    end
  end

end

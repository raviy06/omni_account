class Api::V1::AccountsController < ApplicationController
  before_action :set_account, except: [:create, :show]

  def create
    account = Account.create! account_params
    render json: AccountSerializer.new(account).serializable_hash.to_json, status: :ok
  end

  def show
    @account = Account.find_by customer_id: params[:id]
    unless @account.blank?
      render json: AccountSerializer.new(@account).serializable_hash.to_json, status: :ok
    else
      render json: { message: 'Account not found!' }, status: 404
    end
  end

  def update
    if @account.update(account_params)
      render json: AccountSerializer.new(@account).serializable_hash.to_json, status: :ok
    else
      render json: AccountSerializer.new(@account).serializable_hash.to_json, status: 422
    end
  end

  def destroy
    if @account.destroy
      render json: { message: 'Account not found!' }, status: :ok
    else
      render json: { message: 'Account not found!' }, status: 400
    end
  end

  private

    def set_account
      @account = Account.find params[:id]
    end

    def account_params
      params.require(:account).permit(:customer_id, :customer_name, :minor_indicator, :branch)
    end
end
class PurchasesController < ApplicationController
  before_action :move_to_signed_in, expect: :index
  before_action :set_item, only: [:index, :create]
  
  def index
    @purchase_address = PurchaseAddress.new
    if current_user == @item.user || @item.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
       pay_item
       @purchase_address.save
       return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
  def set_item
  @item = Item.find_by(id: params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: Item.find_by(id: params[:item_id]).price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end


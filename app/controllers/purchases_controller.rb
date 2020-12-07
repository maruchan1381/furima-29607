class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  
  def index
    @purchase_address = PurchaseAddress.new
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
  
  def set_item
  @item = Item.find_by(id: params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
      Payjp.api_key = "sk_test_2c55fa080ad540d6677bc1eb"
      Payjp::Charge.create(
        amount: Item.find_by(id: params[:item_id]).price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end


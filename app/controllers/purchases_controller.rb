class PurchasesController < ApplicationController
  def index
    @item = Item.find_by(id: params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id)
  end
end


class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      Payjp.api_key = "sk_test_3d2ce380cdbaf200ad83d754"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postcode, :delivery_area_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def non_purchased_item
    @item = Item.find(params[:item_id])
    # redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end

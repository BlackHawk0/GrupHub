class OrdersController < ApplicationController
    before_action :authorize_customer, only: [:create]

    def index
        orders = current_customer.orders.where(status: 'pending')
        render json: orders, status: :ok
    end

    # POST /orders
    def create 
        order = Order.create!(order_params)
        render json: order, status: :created
    end

    private
    def authorize_customer
        render json: { error: 'Not Authorized' }, status: :unprocessable_entity unless current_user.user_type == 'customer'
    end

    def order_params
        params.require(:order).permit(:total_price, :status)
    end
end

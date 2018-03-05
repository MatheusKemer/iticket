class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:show]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  def getOrders
    email = params[:email]
    orders = User.find_by(email: email).try(:orders)
    tickets = orders.nil? ? "false" : orders.map{|o| o.ticket}.to_json
    render :json => { :product => tickets.to_json }
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @user = User.find_or_create user_params_for_order

    ticket_id = params[:ticket_id]

    @order = Order.new(ticket_id: ticket_id, user: @user)

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: 'Pedido realizado com sucesso, foi enviado um e-mail com o boleto.' }
        format.json { render :show, status: :created, location: @order }
      else
        flash[:error] = "Não foi possível criar ou verificar o usuário, tente novamente."
        format.html { redirect_to root_path }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def check_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:status, :ticket_id, :user_id)
    end

    def user_params_for_order
      params.require(:user).permit(:name, :email, :phone)
    end
end

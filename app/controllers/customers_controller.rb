class CustomersController < ApplicationController
  def index
    @customers = @current_user.customers
  end

  def show
    @customer = Customer.find params[:id]
  end

  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.new
    customer.first_name = params[:customer][:first_name]
    customer.last_name = params[:customer][:last_name]
    customer.email = params[:customer][:email]
    customer.phone = params[:customer][:phone]
    customer.address = params[:customer][:address]
    customer.description = params[:customer][:description]
    customer.save
    @current_user.customers << customer
    redirect_to new_customer_path
  end

  def update
    customer = Customer.find
    customer.first_name = params[:customer][:first_name]
    customer.last_name = params[:customer][:last_name]
    customer.email = params[:customer][:email]
    customer.phone = params[:customer][:phone]
    customer.address = params[:customer][:address]
    customer.description = params[:customer][:description]
    customer.save
    @current_user.customers << customer
    redirect_to root_path
  end

  def edit
  end

  def destroy
    customer = Customer.find params[:id]
    customer.destroy
    redirect_to customers_path
  end

end

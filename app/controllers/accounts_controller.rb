class AccountsController < ApplicationController

  def index
    @supplier = Supplier.find(params[:supplier_id])
    @account = @supplier.account
  end
  
  def show
    @accounts = Account.find(params[:id])
    @supplier = Supplier.find(params[:supplier_id])
  end
  
  def allshow
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @supplier = Supplier.find(params[:supplier_id])
    @account = @supplier.build_account(account_params)
    @account.save 
    redirect_to supplier_path(@supplier)
  end
    
  def destroy
    @account = Account.find(params[:id])
    supplier = @account.supplier
    @account.destroy
    redirect_to supplier_path(supplier)
  end

  def edit
    @account = Account.find(params[:id])
  end 
  
  def update
    @account = Account.find(params[:id])

      if @account.update(account_params)
        redirect_to supplier_account_path
      else
        render :edit,status: :unprocessable_entity
      end
  
  end

  private
    def account_params
      params.require(:account).permit(:id, :accNo)
    end

end
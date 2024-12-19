class AccountsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
  
    def index
      @accounts = current_user.has_role?(:admin) ? Account.all : current_user.account
    end
    
  
    def show
    end
  
    def edit
    end
  
    def update
      if @account.update(account_params)
        redirect_to @account, notice: 'Account updated successfully.'
      else
        render :edit
      end
    end
  
    private
  
    def account_params
      params.require(:account).permit(:name)
    end
  end
  
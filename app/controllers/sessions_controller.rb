class SessionsController < ApplicationController
  def new
    @user=User.new
  end

  def create
    if @user = login(params[:name],params[:password])
      redirect_to(root_url, message: 'Login Succefull')
    else
      flash.now[:alert]='Something went wrong'
      render action: :new
    end

  end
  def destroy
    logout
    redirect_to root_url , message: 'Logout Succefull'
  end
end

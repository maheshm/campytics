class UsersController < ApplicationController

  def new
   @user = User.new 
  end

  def create  
    @user = User.new(params[:user])
    if @user.save
      redirect_to signin_path, {:notice => "User successfully added. Please login."}
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

end

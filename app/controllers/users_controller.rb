class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
  end

  def edit
    @user = User.find( params[:id] )
  end

  def create
    User.new( user_params )
  end

  def update
    User.update( user_params )
  end

  def destroy
  end
  
  private
  def user_params
    params.require( :user ).permit( :first_name, :last_name, :alias, :email, 
      :password, :password_confirmation )
  end
end
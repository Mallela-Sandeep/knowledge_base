class Admin::UsersController < ApplicationController
  layout "admin"
  before_filter :authenticate_admin!
  before_filter :load_user, :only => %w(edit update show destroy invitations)
  
  def index
    @users = User.paginate(:page => params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.skip_confirmation!
    if @user.save
      respond_to do |format|
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
      end
    else
      render 'new', notice: 'Something went wrong.'
    end
  end
  


  def update
    account_update_params = params[:user]
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end
    if @user.update_attributes(account_update_params)
      redirect_to admin_users_path
    else
      render "edit"
    end
  end
  
  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'Record was deleted successfully'
  end


  
  private
  
    def load_user
      @user = User.find(params[:id])
    end
end

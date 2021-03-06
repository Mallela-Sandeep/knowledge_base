class Admin::AdminsController < ApplicationController
  layout "admin"
  before_filter :authenticate_admin!
  before_filter :load_admin, :only => %w(edit update show destroy invitations)
  
  def index
    @admins = Admin.paginate(:page => params[:page])
  end
  
  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      respond_to do |format|
        format.html { redirect_to admin_admins_path, notice: 'Admin Notification was successfully created.' }
      end
    else
      render 'new', notice: 'Something went wrong.'
    end
  end
  
  def update
    if @admin.update(params[:admin])
      redirect_to admin_admins_path
    else
      render 'edit', notice: 'Something went wrong.'
    end
  end
  
  def destroy
    @admin.destroy
    redirect_to admin_admins_path, notice: 'Record was deleted successfully'
  end


  
  private
  
    def load_admin
      @admin = Admin.find(params[:id])
    end
end

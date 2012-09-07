class Admin::RolesController < ApplicationController
  load_and_authorize_resource
  
  def index
  
    @admin_roles = Role.all  
    respond_to do |format|
      format.html
      format.json { render json: @admin_roles }
    end
  end

  
  def show
    @admin_role = Role.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render json: @admin_role }
    end
  end

  def new
    @admin_role = Role.new
    respond_to do |format|
      format.html
      format.json { render json: @admin_role }
    end
  end

  
  def edit
    @admin_role = Role.find(params[:id])
  end

  
  def create
    @admin_role = Role.new(params[:role])    
    respond_to do |format|
      if @admin_role.save
        format.html { redirect_to users_path, notice: 'Role was successfully created.' }
        format.json { render json: @admin_role, status: :created, location: @admin_role }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_role.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    @admin_role = Role.find(params[:id])
    respond_to do |format|
      if @admin_role.update_attributes(params[:role])
        format.html { redirect_to users_path, notice: 'Role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_role.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @admin_role = Role.find(params[:id])
    @admin_role.destroy    
    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end
end

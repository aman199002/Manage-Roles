class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  
  def edit
    @admin_user = User.find(params[:id])
  end

  def update
    @admin_user = User.find(params[:id])
    respond_to do |format|
      if @admin_user.update_attributes(params[:user])
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_role.errors, status: :unprocessable_entity }
      end
    end
  end

end

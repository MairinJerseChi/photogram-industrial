class UsersController < ApplicationController 
  def show 
    @user = User.find_by!(username: params.fetch(:username))
    #find by username and throw error if not found
  end 
end 

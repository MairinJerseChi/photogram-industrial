class UsersController < ApplicationController 
  def show 
    @user = User.find_by!(username: params.fetch(:username))
    #find by username and throw error if not found
  end 

  def following 
    @user = User.find_by!( username: params.fetch(:username))
  end 

  def followers 
    @user = User.find_by!( username: params.fetch(:username))
    @followers = @user.followers 
  end
end 

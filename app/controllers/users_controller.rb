class UsersController < ApplicationController
  before_action :authenticate_user!

  def home
    @user = current_user
    @projects = @user.projects
  end
end

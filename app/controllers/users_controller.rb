class UsersController < ApplicationController
  before_action :require_login

  def index
    @users = User.all
    flash[:status] = :success
    else
      flash[:status] = :failure
      flash[:result_text] = "Must be logged in to view this page."
      redirect_to root_path
  end

  def show
    @user = User.find_by(id: params[:id])
    else
      render_404
      flash[:status] = :failure
      flash[:result_text] = "Must be logged in to view this page."
      redirect_to root_path
  end
end

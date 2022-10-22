class UsersController < ApplicationController
  def show
    #@current_user = current_user
    @new_book = Book.new
    @view_user = User.find(params[:id])
    @user_books = @view_user.books
  end

  def index
    @current_user = current_user
    @new_book = Book.new
    @all_users = User.all
  end

  def edit
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if user_id != login_user_id
      redirect_to user_path(login_user_id)
    end
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end

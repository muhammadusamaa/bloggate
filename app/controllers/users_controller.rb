class UsersController < ApplicationController

  def show
    @user  = User.find(params[:id])
    @articles = current_user.articles.order(created_at: :desc)
  end
  
  def edit
     @user = User.find(params[:id])
  end

  def update
     User.find(params[:id]).update!(user_params)
     redirect_to current_user
  end

 private
    def user_params
     params.require(:user).permit(:username, :name, 
                               :bio, :email,  :gender, :avatar)
   end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end
  
  def show
    ##before_actionがあるから読み込みはしている。
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "サンプルアプリケーションへようこそ"
      redirect_to @user
    else
      render "new"
    end
  end
  
  def edit
    ##before_actionがあるから読み込みはしている。
    render "edit"
  end

  def update
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      render "show"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:region,:profile,:password,:password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end

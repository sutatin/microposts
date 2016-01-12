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
    if is_my_user
        render "edit"
      else
        ##自分のアカウントでは無いとき
        render "show"
    end
  end

  def update
    ##before_actionがあるから読み込みはしている。

    if is_my_user
      if @user.update(user_params)
        flash[:success] = "プロフィールを更新しました"
        redirect_to @user
      else
        render "edit"
      end
    else
      ##自分のアカウントでは無いとき
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
  
  def is_my_user
    ##set_userはbeforeでされているのでUser.findは不要
    @user==current_user
  end

end

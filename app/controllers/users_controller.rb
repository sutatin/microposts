class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    ##before_actionがあるから読み込みはしている。
    render "edit"
  end

  def update
      ##なぜこの2行で引数の数が異なるのか…。
      ##→インスタンス変数@userとUserの違いかも
      @user = User.update(params[:id],user_params)
      if @user.update(user_params)
        flash[:success] = "プロフィールを更新しました"
        redirect_to @user
      else
        render "show"
      end
  end

  
  private
  def user_params
    params.require(:user).permit(:name,:email,:region,:password,:password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end

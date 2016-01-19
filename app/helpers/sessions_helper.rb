module SessionsHelper
  def current_user
    #||=は左の値がfalseかnilの場合に右の値の代入。初期化に使われる。
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    #カリキュラム7.5 　!!は、右側に続く値が存在する時true、nilはfalse
    !!current_user
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
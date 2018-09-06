class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ログイン成功
      session[:user_id] = user.id
      redirect_to posts_path
    else
      # ログイン失敗
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:success] = 'ログアウトしました'
    redirect_to new_session_path
  end
end

class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Signed in Successfully"
      redirect_to user
    else
      flash.now[:notice] = "Wrong Combination"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Sign out, see you soon!'
    return redirect_to root_path, status: :see_other
  end


end
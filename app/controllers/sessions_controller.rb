class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to home_path
        return
        if current_user.preference.nil?
          redirect_to controller: 'preferences', action: 'new'
          return
        end
      else
        flash[:error] = "Password incorrect"
      end
    else
      flash[:error] = "No user with that email!"
    end
    redirect_to root_path
  end


def destroy
  session.delete(:user_id)
  redirect_to root_path
end

end

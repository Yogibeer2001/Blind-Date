class SessionsController < ApplicationController




# My Apps Yahoo
#blind_meetup
# Client ID (Consumer Key)
# dj0yJmk9R0pKSTVkcjNWSkV3JmQ9WVdrOVRFdzJSMm81TkhVbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD01Mg--
# Client Secret (Consumer Secret)
# da21185c899c597a3e38f70831452517abce4914


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

class UsersController < ApplicationController



def index
end


def new_user_form
  user = User.new
end

def edit
end

def update
  current_user.update_attributes(user_params)
  redirect_to home_path
end


def create_user
  user = User.new(user_params)
  if user.save
    session[:user_id] = user.id
    redirect_to preferences_new_path
  else
    flash[:errors] = { :class => 'holy_crap_error', :error_msg => user.errors.full_messages }
    redirect_to '/signup'
  end
end







def user_params
  params.require(:user).permit(:username, :email, :age, :gender, :location, :password, :password_confirmation)
end





end

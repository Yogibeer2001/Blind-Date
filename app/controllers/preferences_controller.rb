class PreferencesController < ApplicationController

  def index
  if current_user && current_user.preference.nil?
    redirect_to :action => 'new'
  end
end

def new
  if current_user.preference
    redirect_to home_path
  end
end

def edit
end

def update
current_user.preference.update_attributes(preference_params)
redirect_to action: 'new'
end

def create
  if current_user.preference.nil?
    preference = Preference.new(preference_params)
    preference.user = current_user
    if preference.save
      redirect_to home_path
      return
    end
  end
redirect_to home_path
end

def destroy
current_user.preference.delete
flash[:message] = 'succefully deleted'
redirect_to home_path
end


def preference_params
params.require(:preference).permit(:min_age, :max_age, :gender, :location)
end

end

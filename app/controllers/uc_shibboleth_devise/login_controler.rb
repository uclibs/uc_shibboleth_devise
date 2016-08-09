class LoginController < ApplicationController
  def login
    if AUTH_CONFIG['shibboleth_enabled']
      render 'login'
    else
      redirect_to new_user_session_path
    end
  end
end

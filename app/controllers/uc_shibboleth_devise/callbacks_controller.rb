class CallbacksController < Devise::OmniauthCallbacksController
  def shibboleth
    omni = request.env["omniauth.auth"]

    # If user has no email address use their sixplus2@uc.edu instead
    # Some test accounts on QA/dev don't have email addresses
    if defined?(omni.extra.raw_info.mail)
      if omni.extra.raw_info.mail.blank?
        email = omni.uid
      else
        email = omni.extra.raw_info.mail
      end
    else
      email = omni.uid
    end

    unless @user = User.find_by_provider_and_uid(omni['provider'], omni['uid'])
      @user = User.create(
            provider: omni.provider,
                 uid: omni.uid,
               email: email,
            password: Devise.friendly_token[0,20],
               title: omni.extra.raw_info.title,
           telephone: omni.extra.raw_info.telephoneNumber,
          first_name: omni.extra.raw_info.givenName,
           last_name: omni.extra.raw_info.sn,
            ucstatus: omni.extra.raw_info.uceduPrimaryAffiliation,
        ucdepartment: omni.extra.raw_info.ou)

      ## If additional callback actions are needed, override this method with those actions
    end
    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    flash[:notice] = "You are now signed in as #{@user.name} (#{@user.email})"
  end
end

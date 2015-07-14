# google_recaptcha
Use google recaptcha to distinguish signup made between robots and human

Basic setup for using this gem with devise is given below

Create a file in config/initialize/captcha.rb

```
GoogleRecaptcha.configure do |config|
  config.secret_key = "your secret key"
  config.site_key = "your site key"
end
```


```
# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  layout "sessions"
  def new
    super

  end

  def create
    recaptch_response = params["g-recaptcha-response"]
    client_id = request.env["REMOTE_ADDR"]
    if GoogleRecaptcha::Verification.verify_human(recaptch_response, client_id)
      # if verified by google then call devise registration create action
      super
    else
      resource = build_resource(user_params)
      resource.valid?
      resource.errors.add(:base, "Failed to prove you are human. Please try again")
      render :new
    end
  end

  def update
    super
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
```

Paste this snippet before the closing </head> tag on your HTML template:

```javascript
<script src='https://www.google.com/recaptcha/api.js'></script>
```
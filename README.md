= UcShibbolethDevise

This project rocks and uses MIT-LICENSE.

# Installation

## Install Devise 3.2


## Customize your app

Add the following to your `devise` configuration in `models/users.rb`:

```ruby
devise :omniauthable, :omniauth_providers => [:shibboleth]
```

Create `config/authentication.yml`:

```yaml
development:
  shibboleth_enabled: true
  signups_enabled:    true

test:
  shibboleth_enabled: true
  signups_enabled:    false

production:
  shibboleth_enabled: false
  signups_enabled:    false
```

Create `config/initializer/authentication_config.rb`:

```ruby
AUTH_CONFIG = YAML.load_file(Rails.root.join('config', 'authentication.yml'))[Rails.env]
```

Add the following to `config/initializer/devise.rb`:

```ruby
config.omniauth :shibboleth, {
    :shib_session_id_field => "Shib-Session-ID",
    :shib_application_id_field => "Shib-Application-ID",
    :uid_field => "eppn",
    :name_field=> "displayName",
    :debug => false,
    :extra_fields => [
      :cn,
      :eppn,
      :givenName,
      :ou,
      :'persistent-id',
      :sn,
      :street,
      :title,
      :uceduAffiliation,
      :uceduPrimaryAffiliation,
      :uceduUCID,
      :mail,
      :affiliation,
      :remoteuser,
      :telephoneNumber,
      :uceduAcademicProgram,
      :uceduFERPACode,
      :uceduPrimaryCollege,
      :uceduSISPersonID,
    ]
  }
```

Copy and run migration:

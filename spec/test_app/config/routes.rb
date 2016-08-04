Rails.application.routes.draw do

  mount UcShibbolethDevise::Engine => "/uc_shibboleth_devise"
end

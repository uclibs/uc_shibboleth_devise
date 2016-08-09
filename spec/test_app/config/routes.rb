Rails.application.routes.draw do
  devise_for :users
  mount UcShibbolethDevise::Engine => "/uc_shibboleth_devise"
end

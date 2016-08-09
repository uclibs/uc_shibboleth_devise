Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: :sessions, registrations: :registrations, omniauth_callbacks: "callbacks"  }
  mount UcShibbolethDevise::Engine => "/uc_shibboleth_devise"
end

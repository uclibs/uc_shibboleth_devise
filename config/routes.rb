UcShibbolethDevise::Engine.routes.draw do
  devise_for :users, controllers: { sessions: :sessions, registrations: :registrations, omniauth_callbacks: "callbacks" }
  get 'login' => 'login#login'
end

Rails.application.routes.draw do
  root to: "haikus#index"

  controller :sessions do
    get "login" => :new
    post "login" => :create
    delete "logout" => :destroy
  end

  resources :haikus, only: [:index, :new, :edit, :create, :update]

  if ENV["ENABLE_SIGNUPS"]
    resources :users, only: [:new, :create]
  end
end

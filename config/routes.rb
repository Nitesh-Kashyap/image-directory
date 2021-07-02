Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'images#index'
  resources :images
  resources :user_registrations do
    member do
      patch :verify_otp
    end
  end
end

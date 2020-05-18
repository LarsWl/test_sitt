Rails.application.routes.draw do
  root to: 'test#index'
  resources :test, only: [:index, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'tests/:page_id(.:format)', to: 'test#index'
  resources :test, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

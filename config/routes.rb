Rails.application.routes.draw do
  get 'tests/pages/:page_id(.:format)', to: 'tests#index'
  resources :tests, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

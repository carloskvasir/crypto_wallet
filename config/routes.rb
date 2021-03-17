Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'welcome/index'
  get '/inicio', to: 'welcome#inicio'

  resources :coins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

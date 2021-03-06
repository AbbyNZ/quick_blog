Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'posts#index'

  resources :posts do
    resources :comments, only: [:create]
  end

  get '/about' => 'pages#about'
  get '/404' => 'errors#not_found'
  get '/500' => 'errors#internal_error'
  get '/422' => 'errors#unprocessable_entity'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

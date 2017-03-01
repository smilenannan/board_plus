Rails.application.routes.draw do
  devise_for :users
  resources :my_threads do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

  root :to => "my_threads#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


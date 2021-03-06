Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :projects, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
    resources :tasks, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  end
end

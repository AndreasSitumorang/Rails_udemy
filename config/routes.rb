Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :dailynews
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # resources :dailynews, only: [:index, :new, :create, :show, :edit, :update] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
end 
 
Rails.application.routes.draw do
  
  

  devise_scope :user do
    root 'users/sessions#new'
  end

  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    resistrations: 'users/resistrations'
  }
  
  get 'users/me'
  
  resources :users
  resources :rooms
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

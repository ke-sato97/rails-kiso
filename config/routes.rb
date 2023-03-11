Rails.application.routes.draw do
root 'static_pages#top'
#root :to => 'users#index'


get 'login', to: 'user_sessions#new'
post 'users/new', to: "user_sessions#create"
post 'logout', to: 'user_sessions#destroy'
resources :users

end

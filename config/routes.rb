Rails.application.routes.draw do
  resources :posts
  devise_for :users
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
    root "home#index"
    post "toggle_like", to:  "likes#toggle_like", as: :toggle_like

  # root :to => "devise/sessions#new"
#   devise_scope :user do
#   authenticated :user do
#     root 'home#index', as: :authenticated_root
#   end

#   unauthenticated do
#     root 'devise/sessions#new', as: :unauthenticated_root
#   end
# end

end

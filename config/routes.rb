Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # List features
  root to: 'lists#index'

  # get 'lists', to: 'lists#index'
  # get 'lists/:id', to: 'lists#show'
  # get 'lists/new', to: 'lists#new'
  # post 'lists', to: 'lists#create'

  # get 'lists/:id', to: 'bookmarks#new'
  # post 'lists/:id', to: 'bookmarks#create'
  # delete 'boomarks/:id', to: 'bookmarks#destroy'
  # Movie features
  resources :lists, except: [:update, :edit] do
    resources :bookmarks, only: [:create, :new]
  end
  resources :bookmarks, only: :destroy
end

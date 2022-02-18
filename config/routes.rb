Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists, only: [:new, :create, :index, :show] do
    resources :bookmarks, only:[:new, :create]
  end
  #delete '/bookmarks/:id', to: 'bookmarks#destroy'
  resources :bookmarks, only: :destroy
  resources :lists, only: :destroy
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

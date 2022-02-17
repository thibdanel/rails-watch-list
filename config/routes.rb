Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks
  end
  delete '/bookmarks/:id', to: 'bookmarks#destroy'
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

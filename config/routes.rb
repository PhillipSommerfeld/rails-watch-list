Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: %i[destroy edit update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

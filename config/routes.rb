Rails.application.routes.draw do
  root to: "pages#home"
  get "/search", to: "songs#search"
  get "/songs/named/:name", to: "songs#search_two"
  # 7 CRUD
  # resources :songs (update)
  # http_verb '/path', to: 'controller#action', as: :prefix
  # get '/songs', to: 'songs#index', as: :songs
  # post '/songs', to: 'songs#create'
  # get '/songs/new', to: 'songs#new', as: :new_song
  # get '/songs/:id/edit', to: 'songs#edit', as: :edit_song
  # delete '/songs/:id', to: 'songs#destroy', as: :song
  # get '/songs/:id', to: 'songs#show'
  # patch '/songs/:id', to: 'songs#update'
  resources :songs do
    resources :reviews, only: [:new, :create]
  end
end

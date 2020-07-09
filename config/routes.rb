Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles do
    resources :comments
  end

  get '/most_popular', to: 'articles#most_popular'

  resources :view_by_month, only: %i[index show]

  resources :tags

  resources :authors

  resources :author_sessions, only: %i[new create destroy]
  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
end

# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles do
    resources :comments
    
  end
  
  get '/most_popular', to: 'articles#most_popular'

  # namespace ':articles' do

    resources :view_by_month, only: %i[index show]

  # end

  

  # get 'articles/view_by_month', to: 'articles#view_by_month'

  # get '/view_by_month/:month', to: 'articles#month_show', as: 'articles_by_month'

  resources :tags

  resources :authors

  resources :author_sessions, only: %i[new create destroy]
  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
end

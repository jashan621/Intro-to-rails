# config/routes.rb
Rails.application.routes.draw do
  root 'static_pages#home'  # Set the root to the home page
  get 'about', to: 'static_pages#about'  # Define route for the About page
  resources :lakes, only: [:index, :show]
  get 'lakes_search', to: 'lakes#search'
end

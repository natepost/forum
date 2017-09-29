Rails.application.routes.draw do
  devise_for :users
  resources :experiments
  root 'experiments#index'
end

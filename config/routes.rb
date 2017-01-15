Rails.application.routes.draw do
  devise_for :users
  get 'posts' => 'posts#index'
end

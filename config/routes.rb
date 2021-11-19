Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
 
  resources :discovers
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'sutabarisutas/index' => 'sutabarisutas#index'
  root 'sutabarisutas#index'

  get 'posts/coffe' => 'posts#coffe'
  get 'posts/frappu' => 'posts#frappu'
  get 'posts/period' => 'posts#period'
  get 'posts/espresso' => 'posts#espresso'
  get 'posts/tea' => 'posts#tea'
  get 'posts/other' => 'posts#other'


  resources :posts do
    resources :likes, only: [:create, :destroy]
  end


  
  
end

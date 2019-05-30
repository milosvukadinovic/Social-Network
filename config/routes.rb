Rails.application.routes.draw do
  
  root to:'feeds#index'

  devise_for :users,path_names:{sign_in:"login",sign_out:"logout", index: "index"}, 
  controllers: { sessions: 'users/sessions',omniauth_callbacks: "users/omniauth_callbacks" , index: "index"}
  
  get "/friendships", to:"friendships#index"

  put "/change/:friendship/stat/:status",to:"friendships#change", as:"change_friendship"
  

  resources :posts , only:[:index,:new,:show,:create,:destroy]
  resources :comments , only:[:create,:destroy]
  resources :likes, only:[:create, :destroy]
  resources :users, only:[:index]
  resources :friendships, only:[:create]
end
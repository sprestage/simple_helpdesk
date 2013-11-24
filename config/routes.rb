Helpdesk::Application.routes.draw do
  resources :tickets


  root :to => 'home#index'
end

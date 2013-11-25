Helpdesk::Application.routes.draw do
  resources :tickets

  post '/inbound' => 'tickets#update'

  root :to => 'tickets#index'
end

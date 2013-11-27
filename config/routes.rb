Helpdesk::Application.routes.draw do
  resources :tickets

  post '/inbound' => 'tickets#inbound'

  root :to => 'tickets#index'
end

Rails.application.routes.draw do

  match "*path", to: "sites#index", via: "get"

  root 'sites#index'

end

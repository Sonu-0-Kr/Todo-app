Rails.application.routes.draw do
  root "homepage#index"
  get "homepage/all_todos"
  post "homepage/create"
  put "homepage/update"
end

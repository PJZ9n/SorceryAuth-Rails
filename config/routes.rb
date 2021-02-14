Rails.application.routes.draw do
  resource :user
  resource :session, only: %i[new create destroy]
  get "protected" => "home#protected"
  root "home#index"
end

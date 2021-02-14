Rails.application.routes.draw do
  resource :user
  resource :session, only: %i[new create destroy]
  get "protected" => "home#protected"
  root "home#index"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

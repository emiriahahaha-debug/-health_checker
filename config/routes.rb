Rails.application.routes.draw do
  root "health_checks#index"

  resources :health_checks, only: [] do
    collection do
      get  :question1
      get  :question2
      get  :question3
      post :answer
      get  :result
    end
  end

  resources :comments, oonly: [:create, :edit, :update, :destroy]
  get "up" => "rails/health#show", as: :rails_health_check
end

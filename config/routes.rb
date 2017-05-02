Rails.application.routes.draw do
  scope '/api' do
    resources :todos, only: [:index, :show, :create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

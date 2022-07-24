Rails.application.routes.draw do
  namespace 'api' do
    resources :task
  end
end

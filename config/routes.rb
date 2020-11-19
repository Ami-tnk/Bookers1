Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # homesコントローラのtopアクション(トップ画面)をルートパスに設定
  root to: 'homes#top'

  get '/' => 'homes#top'
end

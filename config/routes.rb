# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments
  root to: 'tickets#index'
  devise_for :users
  resources :tickets
  Ticket.aasm.events.map(&:name).each do |event|
    post "/tickets/:id/#{event}", to: "tickets##{event}"
  end
end

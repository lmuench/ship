# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :assignee, class_name: 'User'
  belongs_to :creator, class_name: 'User'

  validates_inclusion_of :category, in: TicketChoices['category']
end

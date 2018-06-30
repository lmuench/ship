# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :assignee, class_name: 'User'
  belongs_to :creator, class_name: 'User'

  validates_presence_of :title
  validates_inclusion_of :category, in: TicketChoices['category']
  validates_inclusion_of :priority, in: TicketChoices['priority']
  validates_inclusion_of :status, in: TicketChoices['status']
  validates_inclusion_of :assignee_id, in: User.all.map(&:id)
end

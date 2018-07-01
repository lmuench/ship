# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :assignee, class_name: 'User'
  belongs_to :creator, class_name: 'User'
  has_many :comments

  validates_presence_of :title
  validates_inclusion_of :category, in: TicketChoices['category']
  validates_inclusion_of :priority, in: TicketChoices['priority']

  include AASM
  aasm whiny_transitions: false do
    state :open, initial: true
    state :implementing
    state :implemented
    state :testing
    state :tested
    state :closed

    event :close do
      transitions from: [:open, :implementing, :implemented, :testing, :tested], to: :closed
    end

    event :start_implementation do
      transitions from: :open, to: :implementing
    end

    event :abort_implementation do
      transitions from: :implementing, to: :open
    end

    event :finish_implementation do
      transitions from: :implementing, to: :implemented
    end

    event :start_test do
      transitions from: :implemented, to: :testing
    end

    event :abort_test do
      transitions from: :testing, to: :implemented
    end

    event :decline do
      transitions from: :testing, to: :open
    end

    event :accept do
      transitions from: :testing, to: :tested
    end

    event :reopen do
      transitions from: :closed, to: :open
    end
  end
end

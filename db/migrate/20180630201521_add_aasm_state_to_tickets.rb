# frozen_string_literal: true

class AddAasmStateToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :aasm_state, :string
  end
end

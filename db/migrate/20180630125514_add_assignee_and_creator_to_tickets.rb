class AddAssigneeAndCreatorToTickets < ActiveRecord::Migration[5.2]
  def change
    change_table :tickets do |t|
      t.references :assignee
      t.references :creator
    end

    add_foreign_key :tickets, :users, column: :assignee_id, primary_key: :id
    add_foreign_key :tickets, :users, column: :creator_id, primary_key: :id
  end
end

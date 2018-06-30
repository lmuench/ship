# frozen_string_literal: true

class RenameTypeToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :tickets, :type, :category
  end
end

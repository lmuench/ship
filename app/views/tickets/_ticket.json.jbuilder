json.extract! ticket, :id, :title, :description, :category, :priority, :status, :assignee_id, :creator_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)

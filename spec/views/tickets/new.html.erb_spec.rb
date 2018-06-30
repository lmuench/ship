require 'rails_helper'

RSpec.describe "tickets/new", type: :view do
  before(:each) do
    assign(:ticket, Ticket.new(
      :title => "MyString",
      :description => "MyText",
      :type => "",
      :priority => "MyString",
      :status => "MyString",
      :assignee => nil,
      :creator => nil
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do

      assert_select "input[name=?]", "ticket[title]"

      assert_select "textarea[name=?]", "ticket[description]"

      assert_select "input[name=?]", "ticket[type]"

      assert_select "input[name=?]", "ticket[priority]"

      assert_select "input[name=?]", "ticket[status]"

      assert_select "input[name=?]", "ticket[assignee_id]"

      assert_select "input[name=?]", "ticket[creator_id]"
    end
  end
end

require 'rails_helper'

RSpec.describe "tickets/edit", type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :title => "MyString",
      :description => "MyText",
      :type => "",
      :priority => "MyString",
      :status => "MyString",
      :assignee => nil,
      :creator => nil
    ))
  end

  it "renders the edit ticket form" do
    render

    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do

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

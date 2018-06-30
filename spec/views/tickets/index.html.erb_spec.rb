require 'rails_helper'

RSpec.describe "tickets/index", type: :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        :title => "Title",
        :description => "MyText",
        :type => "Type",
        :priority => "Priority",
        :status => "Status",
        :assignee => nil,
        :creator => nil
      ),
      Ticket.create!(
        :title => "Title",
        :description => "MyText",
        :type => "Type",
        :priority => "Priority",
        :status => "Status",
        :assignee => nil,
        :creator => nil
      )
    ])
  end

  it "renders a list of tickets" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Priority".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

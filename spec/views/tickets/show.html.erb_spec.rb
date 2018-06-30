require 'rails_helper'

RSpec.describe "tickets/show", type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :title => "Title",
      :description => "MyText",
      :type => "Type",
      :priority => "Priority",
      :status => "Status",
      :assignee => nil,
      :creator => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Priority/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

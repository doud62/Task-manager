require "rails_helper"

RSpec.describe Project, type: :model do
  it "should persist a project" do
    Project.create(name: "Lorem Ipsum")
    expect(Project.count).to eq(1)
  end
end
# typed: ignore

require "rspec"
require "./lib/node"

RSpec.describe Node do
  before(:each) do
    @node = Node.new({
      name: "Neil Hendren",
      age: 30
    })
  end

  it "exists" do
    expect(@node).to be_an_instance_of(Node)
  end

  it ""
end

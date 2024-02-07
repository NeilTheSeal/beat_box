# typed: ignore

require "rspec"
require "./lib/node"

# rubocop:disable Metrics/BlockLength
RSpec.describe Node do
  before(:each) do
    @data = {
      name: "Neil Hendren",
      age: 30
    }
    @node = Node.new({
      data: @data
    })
  end

  it "exists" do
    expect(@node).to be_an_instance_of(Node)
  end

  it "has a data method" do
    expect(@node.data).to eq(@data)
  end

  it "initializes with default of nil value for previous and next" do
    expect(@node.next).to eq(nil)
    expect(@node.previous).to eq(nil)
  end

  it "initializes with previous value of a node when previous is specified" do
    new_node = Node.new({
      previous: @node,
      data: {
        name: "John",
        age: 63
      }
    })
    expect(new_node.previous).to eq(@node)
  end
end
# rubocop:enable Metrics/BlockLength
#

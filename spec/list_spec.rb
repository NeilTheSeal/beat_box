# typed: ignore

require "rspec"
require "./lib/node"
require "./lib/list"

RSpec.describe List do # rubocop:disable Metrics/BlockLength
  before(:each) do
    @data = {
      name: "Neil Hendren",
      age: 30
    }
    @node = Node.new({
      data: @data
    })
    @list = List.new
  end

  it "exists" do
    expect(@node).to be_an_instance_of(Node)
  end

  it "has a head when initialized" do
    expect(@list.head).to eq(nil)
  end

  it "has a method to append the first node to the list" do
    list = @list
    list.append(@node)
    expect(list.head).to eq(@node)
  end

  it "can append a node to the end of the list" do
    list = @list
    list.append(@node)
    new_node = Node.new({
      data: {
        name: "John",
        age: 63
      }
    })
    list.append(new_node)
    expect(list.head.next).to eq(new_node)
    expect(list.head.next.next).to eq(nil)
    third_node = Node.new({
      data: {
        name: "Jeff",
        age: 100
      }
    })
    list.append(third_node)
    expect(list.head.next).to eq(new_node)
    expect(list.head.next.next).to eq(third_node)
    expect(list.head.next.next.next).to eq(nil)
  end

  it "can insert an 'after' node when the conditions are met" do # rubocop:disable Metrics/BlockLength
    list = @list
    list.append(@node)
    second_node = Node.new({
      data: {
        name: "John",
        age: 63
      }
    })
    third_node = Node.new({
      data: {
        name: "Jeff",
        age: 100
      }
    })
    insert_node = Node.new({
      data: {
        name: "Bobby",
        age: 5
      }
    })
    list.append(second_node)
    list.append(third_node)
    list.insert_after(insert_node, {
      name: "John"
    })
    expect(list.head.next.next).to eq(insert_node)
  end

  it "can insert a 'before' node when the conditions are met" do # rubocop:disable Metrics/BlockLength
    list = @list
    list.append(@node)
    second_node = Node.new({
      data: {
        name: "John",
        age: 63
      }
    })
    third_node = Node.new({
      data: {
        name: "Jeff",
        age: 100
      }
    })
    insert_node = Node.new({
      data: {
        name: "Bobby",
        age: 5
      }
    })
    list.append(second_node)
    list.append(third_node)
    list.insert_before(insert_node, {
      name: "Jeff"
    })
    expect(list.head.next.next).to eq(insert_node)
  end

  it "can have a new head" do
    list = @list
    new_head = Node.new({
      data: {
        name: "Mr Hat"
      }
    })
    list.append(@node)
    list.insert_before(new_head, @node.data)
    expect(list.head).to eq(new_head)
  end
end

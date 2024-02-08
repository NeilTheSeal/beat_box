# Documentation for List
class List
  attr_accessor :head,
                :next,
                :data

  def initialize
    @head = nil
    @next = nil
    @data = nil
  end

  def append(node)
    prev_node = @head
    if prev_node.nil?
      @head = node
    else
      prev_node = prev_node.next until prev_node.next.nil?
      prev_node.next = node
    end
  end

  def insert_after(node, conditions)
    prev_node = @head
    if prev_node.nil?
      @head = node
    elsif !conditions.nil?
      node_traverse(node, prev_node, conditions, "after")
    end
  end

  def insert_before(node, conditions)
    break_method = check_head(node, conditions)
    return if break_method

    prev_node = @head
    if prev_node.nil?
      @head = node
    elsif !conditions.nil?
      node_traverse(node, prev_node, conditions, "before")
    end
  end

  def check_head(node, conditions)
    pass = true
    conditions.each_key do |key|
      pass = false if conditions[key] != @head.data[key]
    end
    if pass
      node.next = @head
      @head = node
    end
    pass
  end

  def node_traverse(node, prev_node, conditions, direction)
    pass = false
    while pass == false
      pass = check_data(prev_node, conditions, direction)
      prev_node = prev_node.next if pass == false
    end
    node.next = prev_node.next
    prev_node.next = node
  end

  def check_data(prev_node, conditions, direction)
    conditions.each_key do |key|
      return true if prev_node.next.nil?
      if direction == "before" && conditions[key] != prev_node.next.data[key]
        return false
      end
      if direction == "after" && conditions[key] != prev_node.data[key]
        return false
      end
    end
    true
  end
end

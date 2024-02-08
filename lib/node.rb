# Documentation for Node
class Node
  attr_accessor :data,
                :next

  def initialize(args)
    @data = {}
    args[:data].each_key do |key|
      @data[key] = args[:data][key]
    end
    @next = args[:next] || nil
  end
end

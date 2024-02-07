# Documentation for Node
class Node
  attr_accessor :data,
                :next,
                :previous

  def initialize(args)
    @data = {}
    args[:data].each_key do |key|
      @data[key] = args[:data][key]
    end
    @next = args[:next] || nil
    @previous = args[:previous] || nil
  end
end

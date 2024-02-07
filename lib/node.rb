# Documentation for Node
class Node
  def initialize(args)
    @data = {}
    args.keys.each { |key|
      @data[key] = args[key]
    }
  end
end

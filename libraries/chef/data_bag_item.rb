# encoding: UTF-8

# Classes in this module bridge between the data adapter and Chef
# library classes. This approach allows us to confine Chef code
# references to this module. Doing so simplifies unit testing and is
# easier to understand.

module ChefBridge
  # Data bag item bridge class
  #
  class DataBagItem
    def initialize(bag_name, item_name)
      @bag_name = bag_name
      @item_name = item_name
    end

    def load
    end
  end

  # Node bridge class
  #
  class Node
    def initialize(node)
      @node = node
    end

    def merge_from_hash(data_hash)
      data_hash
    end
  end
end

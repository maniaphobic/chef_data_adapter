# encoding: UTF-8
require 'chef/resource'

class Chef
  class Resource
    # This is the integrated chef resource for the generic ingesting of
    # data bags as node attributes.
    class DataAdapter < Chef::Resource
      def initialize(name, collection = nil, node = nil)
        super(name, collection, node)
        @resource_name = :data_adapter
      end
    end
  end
end

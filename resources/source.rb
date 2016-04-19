actions        :load
default_action :load

attribute :bag_name, :kind_of => String
attribute :item_name, :kind_of => String
attribute :name, :kind_of => String, :name_attribute => true
attribute :url, :kind_of => String, :required => true

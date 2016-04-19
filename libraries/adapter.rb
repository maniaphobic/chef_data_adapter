# encoding: UTF-8

require 'uri'

# DataAdapter module
module DataAdapter
  # DataAdapter.factory method
  #
  # This method accepts a URL as an argument, parses the URL to
  # determine the URL's scheme, then instantiates an object of the
  # appropriate class to handle the URL.
  #
  # If the URL is invalid for any reason, it instantiates a
  # NullSource, which makes no changes to the node object.

  def self.factory(source_url)
    begin
      uri = URI(source_url)
    rescue ArgumentError
      uri = URI('')
    end
    case uri.scheme
    when 'bag', 'databag'
      DataBagItem
    else
      NullSource
    end.new(uri)
  end

  # AbstractSource class
  #
  # This class defines an abstract interface. Concrete data source
  # classes should inherit this class.
  class AbstractSource
    def initialize(uri)
      @uri = uri
    end

    def retrieve
    end

    def merge(*)
    end
  end

  # DataBagItem class
  #
  # Objects of this class retrieve data from data bag items.
  class DataBagItem < AbstractSource
    # initialize method
    #
    # Parse the given `URI` object, assigning the `host` component as
    # the bag name and the trimmed `path` component as the item name.

    def initialize(uri)
      super
      @bag_name  = @uri.host
      @item_name = @uri.path.delete('/')
    end

    # retrieve method
    #
    # Load data from the specified data bag item after validating
    # their names and return it as a `Hash` object in all
    # cases. Propagate an exception if loading the item fails.

    def retrieve
      begin
        db_item = Chef::DataBagItem.load(@bag_name, @item_name)
      rescue RuntimeError => e
        Chef::Log.fatal(
          ["[data_adapter] Failed loading item '#{@item_name}'",
           "from bag '#{@bag_name}'. Exiting #retrieve."].join(' ')
        )
        raise(e)
      end
      db_item.to_hash
    end

    # merge method
    #
    # Accept a Chef::Node object as an argument and merge in the
    # loaded data. Return `true` on success and `false` on failure.

    def merge(node_obj)
      return(false) unless @data_hash.class == Hash
      %w( default override ).each do |level_name|
        level_specifier  = level_name + '_attributes'
        level_data       = @data_hash.fetch(level_specifier, {})
        force_level_name = "force_#{level_name}"
        next if level_data.nil?
        Chef::Mixin::DeepMerge.deep_merge!(
          level_data,
          node_obj.send(force_level_name)
        )
      end
      true
    end

    def valid_name?(name_string)
      case name_string
      when nil, ''
        false
      else
        true
      end
    end
  end

  # NullSource class
  #
  # Objects of this class respond to the interface as specified, but
  # do not alter the node attributes.
  class NullSource < AbstractSource
    def initialize
      super
    end

    def retrieve
      {}
    end

    def merge(*)
      true
    end
  end
end

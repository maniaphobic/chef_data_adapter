if Berkshelf::VERSION.to_i == 2
  chef_api :config
  def source(*_); end
end

source ENV.fetch('SUPERMARKET', 'https://supermarket.chef.io')

metadata

group :development do
  cookbook 'data_adapter_wrapper', path: 'spec/cookbooks/data_adapter_wrapper'
end

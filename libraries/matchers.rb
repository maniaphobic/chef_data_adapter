# encoding: UTF-8

if defined?(ChefSpec)
  def load_data_source(url)
    ChefSpec::Matchers::ResourceMatcher.new(
      :data_adapter_source,
      :load,
      url
    )
  end
end

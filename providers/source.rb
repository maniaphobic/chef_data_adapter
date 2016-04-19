# encoding: UTF-8

# The resources we define in these actions are run in their own
# self-contained Chef run. The provider will send notifications if any
# of the nested resources in your actions are updated.

use_inline_resources

# The :load action retrieves data from the specified source URL and
# merges it with existing node attributes

action :load do
  Chef::Log.debug("[data_adapter_source] Loading data from URL '#{new_resource.url}'")
  source = DataSource.factory(new_resource.url)
  source.retrieve
  source.merge(node)
end

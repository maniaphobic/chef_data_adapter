# encoding: UTF-8

# Create default attributes for the data bag and item names

node.default['data_adapter']['bag_name']  = nil
node.default['data_adapter']['item_name'] = nil

# Retrieve data and assign it to node attributes. We invoke this here
# because it's closest in precedence to environment attribute
# assignments:
#
#   Level  3: A default attribute located in an environment
#  *Level  5: A force_default attribute located in a cookbook attribute file
#   Level 12: An override attribute located in an environment
#  *Level 13: A force_override attribute located in a cookbook attribute file
#
# This cookbook operates at the levels annotated with asterisks.
#
# See https://docs.chef.io/attributes.html for the full hierarchy.

#DISABLED#merge(
#DISABLED#  retrieve(
#DISABLED#    node['data_adapter']['bag_name'],
#DISABLED#    node['data_adapter']['item_name']
#DISABLED#  )
#DISABLED#)

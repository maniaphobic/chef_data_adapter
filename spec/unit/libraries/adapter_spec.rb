# encoding: UTF-8

#DISABLED#require_relative '../../spec_helper'
#DISABLED#require_relative '../../../libraries/adapter'
#DISABLED#
#DISABLED#context 'DataAdapter library' do
#DISABLED#
#DISABLED#  before do
#DISABLED#    node = Chef::Node.new
#DISABLED#  end
#DISABLED#
#DISABLED#  class Chef::Node
#DISABLED#    include DataAdapter
#DISABLED#  end
#DISABLED#
#DISABLED#  context 'retrieve method' do
#DISABLED#    it 'returns an empty hash when either argument is invalid' do
#DISABLED#      expect(retrieve).to      eq({})
#DISABLED#      expect(retrieve(nil)).to eq({})
#DISABLED#      [nil, ''].each do |bag_name|
#DISABLED#        [nil, ''].each do |item_name|
#DISABLED#          expect(retrieve(bag_name, item_name)).to eq({})
#DISABLED#        end
#DISABLED#      end
#DISABLED#    end
#DISABLED#  end
#DISABLED#
#DISABLED#  context 'merge method' do
#DISABLED#
#DISABLED#    it 'accepts an empty hash argument without complaining' do
#DISABLED#      true
#DISABLED#    end
#DISABLED#  end
#DISABLED#end

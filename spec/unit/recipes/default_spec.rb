# encoding: UTF-8

require_relative '../../spec_helper'

describe 'data_adapter_wrapper::default' do
  let (:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.normal['data_adapter']['bag_name']  = 'widgets'
      node.normal['data_adapter']['item_name'] = 'doodad'
    end.converge(described_recipe)
  end

  let :node do
    chef_run.node
  end

  before do
  end

  it 'should include the data_adapter::default recipe' do
    expect(chef_run).to include_recipe('data_adapter::default')
  end

  it 'should load the Rigel data source' do
    expect(chef_run).to load_data_source('Rigel')
  end
end

#DISABLED#describe 'data_adapter::default' do
#DISABLED#  context 'attribute' do
#DISABLED#
#DISABLED#    test_data = {
#DISABLED#      'widgets' => {
#DISABLED#        'doodad' => {
#DISABLED#          'id' => 'doodad',
#DISABLED#          'default_attributes' => {
#DISABLED#            'both'         => 'default',
#DISABLED#            'default_only' => 'default',
#DISABLED#          },
#DISABLED#          'override_attributes' => {
#DISABLED#            'both'          => 'override',
#DISABLED#            'override_only' => 'override',
#DISABLED#          }
#DISABLED#        }
#DISABLED#      }
#DISABLED#    }
#DISABLED#
#DISABLED#    let (:chef_run) do
#DISABLED#      ChefSpec::SoloRunner.new do |node|
#DISABLED#        node.normal['data_adapter']['bag_name']  = 'widgets'
#DISABLED#        node.normal['data_adapter']['item_name'] = 'doodad'
#DISABLED#      end.converge(described_recipe)
#DISABLED#    end
#DISABLED#
#DISABLED#    let :node do
#DISABLED#      chef_run.node
#DISABLED#    end
#DISABLED#
#DISABLED#    before do
#DISABLED#      test_data.keys.each do |bag_name|
#DISABLED#        test_data[bag_name].keys.each do |item_name|
#DISABLED#          allow(Chef::DataBagItem).to receive(:load).with(
#DISABLED#            bag_name, item_name
#DISABLED#          ).and_return(test_data[bag_name][item_name])
#DISABLED#        end
#DISABLED#      end
#DISABLED#    end
#DISABLED#
#DISABLED#    it '"default_only" should be "default"' do
#DISABLED#      expect(node['default_only']).to eq(
#DISABLED#        test_data['widgets']['doodad']['default_attributes']['default_only']
#DISABLED#      )
#DISABLED#    end
#DISABLED#
#DISABLED#    it '"override_only" should be "override"' do
#DISABLED#      expect(node['override_only']).to eq(
#DISABLED#        test_data['widgets']['doodad']['override_attributes']['override_only']
#DISABLED#      )
#DISABLED#    end
#DISABLED#
#DISABLED#    it '"both" should be "override"' do
#DISABLED#      expect(node['both']).to eq(
#DISABLED#        test_data['widgets']['doodad']['override_attributes']['both']
#DISABLED#      )
#DISABLED#    end
#DISABLED#  end
#DISABLED#
#DISABLED#  # Test the retrieve method
#DISABLED#
#DISABLED#  context 'retrieve method' do
#DISABLED#
#DISABLED#    let (:chef_run) do
#DISABLED#      ChefSpec::SoloRunner.new do |node|
#DISABLED#      end.converge(described_recipe)
#DISABLED#    end
#DISABLED#
#DISABLED#    let :node do
#DISABLED#      chef_run.node
#DISABLED#    end
#DISABLED#
#DISABLED#    before do
#DISABLED#      allow(Chef::DataBagItem).to receive(:load).with(
#DISABLED#        'bogus', 'real'
#DISABLED#      ).and_return({})
#DISABLED#      allow(Chef::DataBagItem).to receive(:load).with(
#DISABLED#        'real', 'bogus'
#DISABLED#      ).and_return({})
#DISABLED#    end
#DISABLED#
#DISABLED#    it 'returns an empty hash when either argument is invalid' do
#DISABLED#      [nil, ''].each do |bag_name|
#DISABLED#        [nil, ''].each do |item_name|
#DISABLED#          expect(node.retrieve(bag_name, item_name)).to eq({})
#DISABLED#        end
#DISABLED#      end
#DISABLED#    end
#DISABLED#
#DISABLED#    it 'raises an exception when the data bag does not exist' do
#DISABLED#      expect {
#DISABLED#        node.retrieve('bogus', 'real')
#DISABLED#      }.to raise_error(RuntimeError)
#DISABLED#    end
#DISABLED#
#DISABLED#    it 'raises an exception when the data bag item does not exist' do
#DISABLED#      expect {
#DISABLED#        node.retrieve('real', 'bogus')
#DISABLED#      }.to raise_error(RuntimeError)
#DISABLED#    end
#DISABLED#  end
#DISABLED#
#DISABLED#  context 'merge method' do
#DISABLED#
#DISABLED#    let (:chef_run) do
#DISABLED#      ChefSpec::SoloRunner.new do |node|
#DISABLED#      end.converge(described_recipe)
#DISABLED#    end
#DISABLED#
#DISABLED#    let :node do
#DISABLED#      chef_run.node
#DISABLED#    end
#DISABLED#
#DISABLED#    it 'returns true when the argument is a Hash' do
#DISABLED#      expect(node.merge({})).to eq(true)
#DISABLED#    end
#DISABLED#
#DISABLED#    it 'returns false when the argument is not a Hash' do
#DISABLED#      expect(node.merge(nil)).to eq(false)
#DISABLED#    end
#DISABLED#  end
#DISABLED#end

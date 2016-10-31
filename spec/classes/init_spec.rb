require 'spec_helper'
describe 'hostname' do

  context 'with defaults for all parameters' do
    it { should contain_class('hostname') }
  end
end

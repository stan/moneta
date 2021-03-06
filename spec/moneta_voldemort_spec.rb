require File.dirname(__FILE__) + '/spec_helper'

begin
  require "moneta/voldemort"

  describe "Moneta::Voldemort" do
    before(:each) do
      @cache = Moneta::Voldemort.new
      @cache.clear
    end

    it_should_behave_like "a read/write Moneta cache"
  end
rescue SystemExit
end
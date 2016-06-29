=begin
Look through the warmup.rb file and look at the existing methods on class Warmup. Use the hints in the comments, then write a spec/warmup_spec.rb file that does the following things:

1. stubs out #gets so you can test the result of the #gets_shout method
2.passes in a double or instance double to #triple_size that respond to a method call for size
3.checks that all the method calls inside #calls_some_methods actually fire. Note that this is a pretty artificial example, but we want you getting the muscle memory.
=end

require 'warmup'
require 'spec_helper'



describe '.warmup' do

let(:warmup) { Warmup.new }

	describe '#gets_shout' do

		it 'should return user input as shout' do

			allow(warmup.gets_shout).to receive(:gets).and_return("HI")

			expect(warmup.gets_shout).to eq("HI")

		end


	end


end

=begin
Look through the warmup.rb file and look at the existing methods on class Warmup. Use the hints in the comments, then write a spec/warmup_spec.rb file that does the following things:

1. stubs out #gets so you can test the result of the #gets_shout method
2.passes in a double or instance double to #triple_size that respond to a method call for size
3.checks that all the method calls inside #calls_some_methods actually fire. Note that this is a pretty artificial example, but we want you getting the muscle memory.
=end

require 'warmup'
require 'spec_helper'
require 'pry'



describe '.warmup' do

let(:warmup) { Warmup.new }

	describe '#gets_shout' do

		it 'should return user input : shout' do


			allow( warmup ).to receive( :gets_shout ).and_return( "hi" )

			expect( warmup.gets_shout ).to eq( "hi" )


		end

		it 'should puts shout'

	end


	describe '#triple_size' do

		let(:double_array) { instance_double( "Array", size: 2 ) }


		it 'should take in a double and return trip size' do

			expect( warmup.triple_size( double_array ) ).to eq( 6 )


		end

	end #/.triple_size




	describe '#calls_some_methods' do

		let(:up) { "String", upcase!: "CAPITALS" }
		let(:rev) { "String", reverse!: "SLATIPAC" }


		it 'string passed should receive #upcase!' do


			expect( warmup.calls_some_methods( double ) ).to receive( :upcase! ).with("HELLO")
			#expect( string ).to receive( :reverse! ).with("HELLO")


			warmup = Warmup.new
			warmup.calls_some_methods( "hi" )




    end





		it 'string passed should receive #reverse!'

		it 'should return a different object than passed in'


	end

end

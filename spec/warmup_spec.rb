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


		let(:string) { "string" }

		it 'string passed in should receive #upcase!' do

			expect( string ).to receive(:upcase!)

			warmup.calls_some_methods( string )

    end





		it 'string passed should receive #reverse!'

		it 'should return a different object than passed in'


	end

end

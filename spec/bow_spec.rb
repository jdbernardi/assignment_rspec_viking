# Your code here
require 'bow_spec'
require 'spec_helper'
require 'weapons/bow'

describe '.bow' do

	let(:bow) { Bow.new }

	describe 'instance of bow' do

		it 'bows arrow count should be readable' do

			expect( bow.arrows ).to eq( 10 )

		end

	end



	describe '#initialize' do

		it 'starts with ten arrows by default' do

			expect( bow.arrows ).to eq( 10 )

		end

		it 'is created with a specified when told to' do

			new_bow = Bow.new( 20 )

			expect( new_bow.arrows ).to eq( 20 )



		end

	end



	describe '#use' do

		it 'should reduce number of bows by 1 when used' do


			bow.use

			expect( bow.arrows ).to eq( 9 )


		end



		it 'should raise error when out of arrows' do

			empty_bow = Bow.new( 0 )

			expect{ empty_bow.use }.to raise_error( "Out of arrows")

		end

	end



end
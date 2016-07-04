require 'spec_helper'
require 'viking'


describe '.Viking' do

	let(:viking){ Viking.new("Joe", 150) }

	describe '#initialize' do

		it 'sets the viking name when passed in' do

			expect( viking.name ).to eq( "Joe" )

		end

		it 'sets the health attribute when passed in' do

			expect( viking.health ).to eq( 150 )

		end

		it 'health attr cannot be overwritten once set' do

			expect{ viking.health = 1000 }.to raise_error( NoMethodError )

		end

		it 'Vikings weapon is nil when initialized' do

			expect( viking.weapon ).to be_nil

		end



	end


	describe '#pick_up_weapon' do

		it 'should set the weapon to viking when picked up'

		it 'should raise exception when not a weapon'

		it 'replaces existing weapon when called'

	end



	describe '#drop_weapon' do

		it 'should leave the viking weaponless when called'


	end



	describe '#receive_attack' do

		it 'should reduce the viking health by the spec amount'

		it 'should call #take_damage'


	end


	describe '#attack' do


		it 'should reduce victims health when attacked'

		it 'should call #take_damage when called'

		it 'should call #damage_fists when no weapons'

		it 'should deal Fists multiplier times strength damage when attacking with no weapons'

		it 'should run #damage_with_weapn when attacking with weapon'

		it 'deals damage equal to Vikings strength times that weapons multiplier'

		it 'should use fists when bow is out of arrows'

		it 'raises an error when Viking is killed'


	end

end #/.Viking
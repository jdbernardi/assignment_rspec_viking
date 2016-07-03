require 'spec_helper'
require 'viking'


describe '.Viking' do


	describe '#initialize' do

		it 'sets the viking name when passed in'

		it 'sets the health attribute when passed in'

		it 'health attr cannot be overwritten once set'

		it 'Vikings weapon is nil when initialized'



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
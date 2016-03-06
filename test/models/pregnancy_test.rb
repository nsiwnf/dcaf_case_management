require 'test_helper'

class PregnancyTest < ActiveSupport::TestCase
  before do 
    @pt_1 = create :patient, name: 'Susan Everywoman'
    @pt_2 = create :patient, name: 'Susan Everyteen'
    @pt_3 = create :patient, name: 'Susan Everygirl'
    [@pt_1, @pt_2, @pt_3].each do |pt|
      create :pregnancy, patient: pt
    end
  end

  describe 'search method' do 
    it 'should respond to search' do 
      assert Patient.respond_to? :search
    end

    it 'should find a patient' do
      assert_equal Patient.search('Susan Everywoman').count, 1
    end
  end
end

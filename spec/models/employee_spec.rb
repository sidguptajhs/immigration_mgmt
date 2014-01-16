require 'spec_helper'

describe Employee do
  describe 'factory' do
    it 'should create an instance of employee' do
      FactoryGirl.create(:employee).should_not be_nil
    end
  end

  describe 'validations' do
    it "should validate presence of" do
      should validate_presence_of :name
      should validate_presence_of :joining_date
      should validate_presence_of :number
    end

    it "employee number should be unique" do
      expect { FactoryGirl.create(:employee, number: 123) }.to_not raise_error
      expect { FactoryGirl.create(:employee, number: 123) }.to raise_error

    end

    it "employee number cannot be blank or nill" do
      expect { FactoryGirl.create(:employee, number: "") }.to raise_error
      expect { FactoryGirl.create(:employee, number: nil) }.to raise_error
    end

    describe 'associations' do
      it { should have_one(:passport).class_name(Passport.name) }
        it { should have_many(:visas).through(:passport) }
    end

  end

end

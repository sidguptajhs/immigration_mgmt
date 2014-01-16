require 'spec_helper'

describe Passport do
  describe "passport factory" do
    it "should create passport"do
      passport = FactoryGirl.create(:passport)
      passport.should_not be_nil
    end

    it "should not create passport for nil employee id" do
      expect{FactoryGirl.create(:passport, employee_number: nil)}.to raise_error
    end

    it "should not create passport for non existing employee" do
      expect{FactoryGirl.create(:passport, employee_number: 198)}.to raise_error
    end

    it "should not create passport for an employee who already has a passport" do
      FactoryGirl.create(:employee)
      expect{FactoryGirl.create(:passport)}.to raise_error
    end

  end
end
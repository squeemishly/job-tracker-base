require 'rails_helper'

RSpec.describe Tag do
  context "attributes tests" do
    it "has all attributes" do
      tag = Tag.create(name: "awesomeness")

      expect(tag.name).to eq "awesomeness"
    end

    it "requires a name" do
      tag = Tag.create

      expect(tag).to be_invalid
    end
  end

  context "relationships" do
    it "has a relationship to jobs" do
      tag = Tag.create(name: "Developer")

      expect(tag).to respond_to(:jobs)
    end
  end
end

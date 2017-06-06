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
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      tag = Tag.create(name: "Developer")
      JobTag.create(job_id: job.id, tag_id: tag.id)

      expect(tag).to respond_to(:jobs)
    end
  end
end

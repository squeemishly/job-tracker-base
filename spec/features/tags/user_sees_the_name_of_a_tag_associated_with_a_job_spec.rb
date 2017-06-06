require 'rails_helper'

RSpec.describe "a user can see a tag associated with a job" do
  scenario "when they visit a specific job page" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag = Tag.create(name: "Developer")
    JobTag.create(jobs_id: job.id, tags_id: tag.id)

    visit company_job_path(company, job)

    expect(page).to have_content "Tags: Developer"
  end
end
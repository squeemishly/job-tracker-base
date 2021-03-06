require 'rails_helper'

RSpec.describe "a user can see how many total jobs have the same tags" do
  scenario "when they visit a job page" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "Manager", level_of_interest: 70, city: "Denver")
    tag = Tag.create(name: "Developer")
    tag2 = Tag.create(name: "Close to Home")
    job.tags << tag
    job.tags << tag2
    job2.tags << tag2

    visit company_job_path(company, job)

    expect(page).to have_content "Developer - 1"
    expect(page).to have_content "Close to Home - 2"
  end
end

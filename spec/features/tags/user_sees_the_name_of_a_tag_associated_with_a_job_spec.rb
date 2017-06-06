require 'rails_helper'

RSpec.describe "a user can see tags associated with a job when they visit a job page" do
  scenario "they can see one tag" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag = Tag.create(name: "Developer")
    job.tags << tag

    visit company_job_path(company, job)

    expect(page).to have_content "Tags: Developer"
  end

  scenario "they can see many tags" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag = Tag.create(name: "Developer")
    tag2 = Tag.create(name: "Close to Home")
    tag3 = Tag.create(name: "Daycare provided")
    job.tags << tag
    job.tags << tag2
    job.tags << tag3

    visit company_job_path(company, job)

    expect(page).to have_content "Developer"
    expect(page).to have_content "Close to Home"
    expect(page).to have_content "Daycare provided"
  end
end

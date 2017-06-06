require 'rails_helper'

RSpec.describe "a user can see a list of tags" do
  scenario "when they visit the tags page" do
    tag1 = Tag.create(name: "awesome")
    tag2 = Tag.create(name: "pillager")
    tag3 = Tag.create(name: "reaver")

    visit tags_path

    expect(page).to have_content tag1.name
    expect(page).to have_content tag2.name
    expect(page).to have_content tag3.name
  end
end

require 'rails_helper'

describe 'liking posts' do

  xit 'a user can like a post, which updates the post like count', js: true do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end
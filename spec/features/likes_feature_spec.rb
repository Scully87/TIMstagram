require 'rails_helper'

describe 'liking posts' do

    before do
      Post.create(name:'Little Cat', image:'/images/thumb/missing.png')
    end

  it 'a user can like a post, which updates the post like count', js: true do
    visit '/posts'
    # save_and_open_page
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  it 'a user can like a post, which increments the post count', js: true do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content("1 Like")
  end

end
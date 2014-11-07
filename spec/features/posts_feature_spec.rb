require 'rails_helper'

describe 'posts' do

  context 'when no posts have been added' do

      it 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet!'
      expect(page).to have_link 'Add a post!'
    end
  end

  context 'posts have been added' do

    before do
      Post.create(name: 'Little Cat')
    end

    it 'should display posts' do
      visit '/posts'
      expect(page).to have_content('Little Cat')
      expect(page).not_to have_content('No posts yet!')
    end
  end

  describe 'creating posts' do
    it 'prompts user to fill out a form, then displays the new post' do
    visit '/posts'
    click_link 'Add a post'
    fill_in 'Name', with: 'Little Cat'
    click_button 'Create Post'
    expect(page).to have_content 'Little Cat'
    expect(current_path).to eq '/posts'
   end
  end

end
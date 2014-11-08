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
      Post.create(name:'Little Cat')
    end

    it 'should display posts' do
      visit '/posts'
      expect(page).to have_content('Little Cat')
      expect(page).not_to have_content('No posts yet!')
    end
  end

  context 'creating posts' do

    it 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Name', with: 'Little Cat'
      click_button 'Create Post'
      expect(page).to have_content 'Little Cat'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    before do
      @pint = Post.create(name:'Pint')
    end

    it 'lets a user view a post' do
      visit '/posts'
      click_link 'Pint'
      expect(page).to have_content 'Pint'
      expect(current_path).to eq "/posts/#{@pint.id}"
    end
  end

  context 'deleting posts' do

    before do
      Post.create(name: "Pint")
    end

    it "removes a post when a user clicks a delete link" do
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content 'Pint'
      expect(page).to have_content 'Post deleted successfully'
    end
  end

end
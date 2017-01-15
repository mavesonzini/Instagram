require 'rails_helper'

feature 'post' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(title: 'My first post')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('My first post')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating a post' do
    scenario 'add posts to the homepage' do
      visit '/posts'
      click_link 'Add post'
      fill_in 'post_title', with: 'My first post'
      attach_file 'Picture', Rails.root.join('spec/images/old-man1.jpg')
      click_button 'Create Post'
      expect(page).to have_content 'My first post'
      expect(page).to have_css 'img.uploaded-pic'
    end
  end
end

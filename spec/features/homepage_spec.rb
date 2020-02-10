# User story 1 -- to see the Hello world on the homepage
require 'spec_helper'
feature 'Hello world' do
  scenario 'user sees the hello world' do
    visit('/')
    expect(page).to have_content 'Hello world!'
  end
end
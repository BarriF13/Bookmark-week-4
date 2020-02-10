# User story 2 -- User to see the Bookmarks 

feature 'Viewing bookmarks' do
  scenario 'user sees the list of bookmarks' do
    visit('/bookmarks')
    
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
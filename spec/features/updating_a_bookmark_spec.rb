#  User : I want to update a bookmark 
#  ----setup---
# Visit the 'update bookmark' form for a particular bookmark.
# Fill in the form with new data – say, a new title – and submit it.
# ----test
# See the homepage, with the updated bookmark title (and the old one is gone).
feature 'Updating a bookmark' do
  scenario 'As a User --I want to update a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: "http://www.makersacademy.com")

    first('.bookmark').click_button "Edit"
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: "http://www.snakersacademy.com")
    fill_in('title', with: "Snakers Academy")
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Snakers Academy', href: 'http://www.snakersacademy.com')
  end
end
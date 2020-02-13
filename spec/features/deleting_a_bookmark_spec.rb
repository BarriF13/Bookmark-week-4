# As a user ---I want to delete a bookmark--1-Visit the bookmarks page.2-Click a 'delete' button next to a bookmark.3 -See the bookmarks page, without that bookmark.
feature "Deleting a bookmark" do
  scenario "--- As a user be able to delete a bookmark" do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')# title and url need to be existed for user so she can delete them

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end  
end
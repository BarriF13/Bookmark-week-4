feature "Adding bookmarks" do
  scenario "--A user can add a bookmark to bookmark manager" do
    visit('/bookmarks/new')
    fill_in("url", with: "http://testbookmark.com")
    fill_in("title", with: "Test Bookmark")
    click_button("Submit")
    expect(page).to have_link("Test Bookmark", href: "http://testbookmark.com")
  end
  # Valoidation- bookmark must be valid
  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('title', with: 'not a real bookmark')
    fill_in('url', with: 'not a real bookmark')
    click_button('Submit')

    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "Please submit a valid URL"
  end
end
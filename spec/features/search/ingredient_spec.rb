require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe 'I can search ingredients' do
		it 'And recieve dishes with the ingredient in it' do

			visit '/'
			save_and_open_page

			fill_in :q, with: 'sweet potatoes'

			click_on "Search"

			expect(current_path).to eq(foods_path)

			expect(page).to have_content("32,696 results")

			within(first(".food")) do
				expect(page).to have_css(".GTIN/UPC code")
				expect(page).to have_css(".description")
				expect(page).to have_css(".Brand Owner")
				expect(page).to have_css(".ingredients")
			end
		end
	end
end

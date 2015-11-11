require_relative '../page'

describe Page do
  let(:page) { Page.new(url: 'http://somedomain.com', title: 'Site Name', character_count: 500, links: ['http://anotherdomain.com', 'http://somedomain.com/register']) }

  it 'has a url' do
    expect(page.url).to eq 'http://somedomain.com'
  end

  it 'has a title' do
    expect(page.title).to eq 'Site Name'
  end

  it 'has a character count' do
    expect(page.character_count).to eq 500
  end

  it 'has a collection of links' do
    expect(page.links).to match_array ['http://anotherdomain.com', 'http://somedomain.com/register']
  end
end

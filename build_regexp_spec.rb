require_relative 'lib/build_regexp'
require_relative 'lib/finder'

RSpec.describe BuildRegexp do
  it 'creates regexp' do
    number = '107'
    word = 'колесо'
    word2 = 'колыма'

    expect(BuildRegexp.new.call(number).match(word)).not_to be_nil
    expect(BuildRegexp.new.call(number).match(word2)).not_to be_nil
  end

  it 'fails wrong word' do
    number = '107'
    word = 'колесико'

    expect(BuildRegexp.new.call(number).match(word)).to be_nil
  end

end

RSpec.describe Finder do
  it 'finds word by number' do
    number = '107'

    expect(Finder.new.call(number)).to include('колесо')
  end

  it 'handles zeroes' do
    number = '00'

    expect(Finder.new.call(number)).to include('луна')
  end

  it 'handles empty' do
    number = ''

    expect(Finder.new.call(number)).to eq([])
  end
end
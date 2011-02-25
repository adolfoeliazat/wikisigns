class Word < ActiveRecord::Base
  CHARS = [
   [['z'], ['t', '@'], ['j'], ['f']],
   [['c'], ['h'], ['i', 'y'], []],
   [[], ['d', 'm'], ['k', 's', 'v', 'l', 'r'], ['b', 'n']],
   [['e', 'w', 'x'], ['a', 'à', '@'], ['o', 'g', 'q'], ['u']]
  ]

  def self.latest(amount = 12)
    self.all(:order => 'created_at DESC', :limit => amount)
  end
end

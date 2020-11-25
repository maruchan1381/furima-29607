class Condition < ActiveHash::Base
  self.data = [
    { id: 1, data: '---' },
    { id: 2, data: '新品・未使用' },
    { id: 3, data: '未使用に近い' },
    { id: 4, data: '目立った傷や汚れなし' },
    { id: 5, data: 'やや傷や汚れあり' },
    { id: 6, data: '傷や汚れあり' },
    { id: 7, data: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end

# テーブル設計

## users テーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birthday        | date   | null: false               |

### Association
- has_many :items
- has_many :purchases


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | string     | null: false                    |
| name                | string     | null: false                    |
| description         | string     | null: false                    |
| category            | string     | null: false                    |
| condition           | string     | null: false                    |
| shipping_fee_status | string     | null: false                    |
| prefecture          | string     | null: false                    |
| scheduled_delivery  | string     | null: false                    |
| price               | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## Purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| date    | integer    | null: false                    |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## Addresses テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| post_code    | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| house_number | integer | null: false |
| phone_number | integer | null: false |

### Association
- belongs_to :purchase
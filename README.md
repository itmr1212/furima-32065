# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| nickname           | string | null: false, uniqueness: true |
| email              | string | null: false                   |
| encrypted_password | string | null: false                   |
| first_name1        | string | null: false                   |
| last_name1         | string | null: false                   |
| first_name2        | string | null: false                   |
| last_name2         | string | null: false                   |
| birthday           | date   | null: false                   |

### Association

- has_many :items
- has_many :management

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product            | string     | null: false                    |
| detail             | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_source_id | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs to :user
- has_one :management

## buy テーブル

| Column          | Type       | Options                        |
| -------         | ---------- | ------------------------------ |
| prefecture_id   | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| postal_code     | string     | null: false                    |
| phone_number    | string     | null: false                    |
| management      | references | null: false, foreign_key: true |

### Association

- belongs_to:management


## management テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_one :buy
- belongs_to :item
- belongs_to :user
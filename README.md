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

- has_many :buy
- has_many :items
- has_many :management

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| product         | string     | null: false                    |
| detail          | text       | null: false                    |
| category        | integer    | null: false                    |
| status          | integer    | null: false                    |
| delivery_source | integer    | null: false                    |
| delivery_days   | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_one :buy
- belongs to :user
- has_one :management

## buy テーブル

| Column          | Type       | Options                        |
| -------         | ---------- | ------------------------------ |
| prefecture      | string     | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | string     | null: false                    |
| item            | references | null: false, foreign_key: true |

### Association

- has one :items
- belongs_to :user


## management テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
- has_one :item
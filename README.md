# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| nickname           | string | null: false, uniqueness: true |
| mail               | string | null: false                   |
| encrypted_password | string | null: false                   |
| first-name1        | string | null: false                   |
| last-name1         | string | null: false                   |
| first-name2        | string | null: false                   |
| last-name2         | string | null: false                   |
| birthday           | integer| null: false                   |

### Association

- has_many :buy
- has_many :items
- has_many :management

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| product         | string     | null: false                    |
| detail          | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery-source | integer    | null: false                    |
| delivery-days   | integer    | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

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
| building-name   | string     | null: false                    |
| phone-number    | string     | null: false                    |
| item_id         | references | null: false, foreign_key: true |

### Association

- has one :items
- belongs_to :user


## management テーブル

| Column          | Type       | Options                        |
| -------         | ---------- | ------------------------------ |

### Association

- belongs_to :buy
- has_one :item
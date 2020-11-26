# README

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| mail     | string | null: false |
| password | string | null: false |
| name1    | string | null: false |
| name2    | string | null: false |
| birthday | integer| null: false |

### Association

- has_many :buy
- has_many :items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| product| string | null: false |
| detail | text   | null: false |

### Association

- has_one :buy
- belongs to :user

## buy テーブル

| Column          | Type       | Options                        |
| -------         | ---------- | ------------------------------ |
| credit-number   | integer    | null: false                    |
| expiration-date | integer    | null: false                    |
| security-code   | integer    | null: false                    |
| postal-code     | integer    | null: false                    |
| prefecture      | string     | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building-name   | string     | null: false                    |
| phone-number    | integer    | null: false                    |
| item_id         | references | null: false, foreign_key: true |

### Association

- has one :items
- belongs_to :user
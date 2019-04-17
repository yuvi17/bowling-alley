# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_17_112149) do

  create_table "alleys", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "status"
    t.bigint "lane_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lane_id"], name: "index_games_on_lane_id"
  end

  create_table "lanes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "status"
    t.integer "number"
    t.bigint "alley_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alley_id"], name: "index_lanes_on_alley_id"
  end

  create_table "players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "name"
    t.bigint "game_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_players_on_game_id"
  end

  create_table "rounds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "first"
    t.integer "second"
    t.integer "third"
    t.bigint "game_id"
    t.bigint "player_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "round_number"
    t.integer "status"
    t.index ["game_id"], name: "index_rounds_on_game_id"
    t.index ["player_id"], name: "index_rounds_on_player_id"
  end

  add_foreign_key "games", "lanes"
  add_foreign_key "lanes", "alleys"
  add_foreign_key "players", "games"
  add_foreign_key "rounds", "games"
  add_foreign_key "rounds", "players"
end

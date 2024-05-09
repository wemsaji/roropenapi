# OpenAPI から RoR の API を scaffolding

## 元ネタ

-   [https://qiita.com/yj_sakoda/items/922cda4c11967a0d3a35](https://qiita.com/yj_sakoda/items/922cda4c11967a0d3a35)

## 手順

-   `./openapi/compose.yml` を `docker compose up -d --build`
-   `./npm` で `generate`
-   (Initial commit.)
-   `./rails_codes/compose.yml` を `docker compose up -d --build`
-   いくつかのエラーを修復しながら（以下例）起動を試行、随時キャッシュクリア
    -   `Dockerfile`変更 : `gem install bundler -v 2.3.27`
    -   `Dockerfile`上の行の次に追加 : `RUN gem update --system 3.2.3`
    -   `Dockerfile`変更 : `bundle install`
    -   `Dockerfile`変更 : `bin/`削除1箇所
    -   `docker-entrypoint.sh`変更 : `bin/`削除2箇所
    -   `Gemfile`変更 : `gem 'sqlite3', '~> 1.3.6'`
-   (Rails up.)
-   cors対応
    -   `Gemfile`変更 : `gem 'rack-cors'`コメント解除
    -   `config/initializers/cors.rb`変更 : 設定行コメント解除
    -   `config/initializers/cors.rb`変更 : `origins 'localhost:8011', 'localhost:8012'`
    -   `docker compose exec web bundle install`
    -   `docker compose exec web rails restart`
-   (Cors configuration.)

## めも

-   docker キャッシュクリアは`docker builder prune -f`

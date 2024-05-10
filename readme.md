# OpenAPI から RoR の API を scaffolding

## OpenAPI(Swagger)のメリット

-   規格に沿った yaml を作ると「API 仕様書」兼「API テスター」として表示できる。json も可。
-   yaml からサーバーの API コードが自動生成できる。
-   yaml からクライアントの API 呼び出しコードが自動生成できる。
-   つまり、yaml を先に書けば、バック・フロント双方にそれだけで作業指示が出せる！！！

## OpenAPI(Swagger)のデメリット

-   言語によって出来ることと出来ないことがある。有志ライブラリの性質が強い。
-   言語によっては、出来ることの中でも非常に面倒だったり、バグかったりする。
-   OpenAPI のバージョンによって結構変わる。
-   つまり、言語の組み合わせや、バージョンのロックインで後で困るケースも・・・。

## 検証コードの元ネタ

-   [https://qiita.com/yj_sakoda/items/922cda4c11967a0d3a35](https://qiita.com/yj_sakoda/items/922cda4c11967a0d3a35)

## 手順

#### 元ネタ「OpenAPI ドキュメントを作成・環境構築」

-   `./openapi/compose.yml` を `docker compose up -d --build`

#### 元ネタ「OpenAPI ドキュメントから Ruby on Rails のソースコードを生成（OpenAPI generator）」

-   `./npm` で `generate`
-   生成された `./rails_codes` の中身を編集（mac で検証済み、win はどうか・・・）
    -   `Dockerfile`変更 : `gem install bundler -v 2.3.27`
    -   `Dockerfile`上の行の次に追加 : `RUN gem update --system 3.2.3`
    -   `Dockerfile`変更 : `bundle install`
    -   `Dockerfile`変更 : `bin/`削除 1 箇所
    -   `docker-entrypoint.sh`変更 : `bin/`削除 2 箇所
    -   `Gemfile`変更 : `gem 'sqlite3', '~> 1.3.6'`
-   cors 対応
    -   `Gemfile`変更 : `gem 'rack-cors'`コメント解除
    -   `config/initializers/cors.rb`変更 : 設定行コメント解除
    -   `config/initializers/cors.rb`変更 : `origins 'localhost:8011', 'localhost:8012', 'localhost:5173'`
-   `./rails_codes/compose.yml` を `docker compose up -d --build`
-   ここまでで localhost:8011/8012 から API の動作確認ができる

#### 元ネタ無し、React のフロントエンドから自動生成コードで API コール

-   `frontend` フォルダ作って `npx npm create vite@latest`
    -   `Project name: .`
    -   `Select a framework: React`
    -   `Select a variant: TypeScript + SWC`
-   `npm i -D openapi-typescript-codegen`
-   `npx openapi -i ../openapi/openapi.yaml -o ./src/generated --name RailsApiClient`
-   `frontend/src/App.tsx`修正 : ファイルの通り
-   `rails_codes/app/controllers/user_controller.rb`修正 : ファイルの通り
-   `npm run dev`
-   ここまでで localhost:5173 から API の動作確認ができる

## めも

-   docker キャッシュクリアは`docker builder prune -f`
-   node 環境では prism を使えば yaml からモックサーバーが簡単に起動できる。  
    `https://qiita.com/andynuma/items/bf043b5184d3826d0f92`
-   yaml の内容をソースの一部として書いて半自動で出力も可能、実装と乖離しない管理が目指せる。  
    `https://zenn.dev/tandems/articles/2494219c658ce9`

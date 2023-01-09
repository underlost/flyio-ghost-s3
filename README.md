# flyio-ghost-s3

This image is intended to be used with the [fly.io](https://fly.io) platform. It is based on the official [Ghost](https://hub.docker.com/_/ghost/) image, and adds the [Ghost S3 storage adapter](https://github.com/colinmeinke/ghost-storage-adapter-s3) to the image to allow for hosting images on S3 instead of the volume itself.

## Configuration

The following environment variables are required to be set in `fly.toml` and `docker-compose.yml`:

* `storage__s3__accessKeyId`
* `storage__s3__secretAccessKey`
* `storage__s3__region`
* `storage__s3__bucket`
* `storage__s3__assetHost`

And in `fly.toml`:

* `app` - The name of your app

## Usage

1. Install the Fly command-line tools

    ```bash
    curl -L https://fly.io/install.sh | sh
    ```

    or if you're on a Mac:

    ```bash
    brew install fly-io/tap/fly
    ```

2. Create a free Fly.io account

    ```bash
    flyctl auth login
    ```

    This will open a browser window where you can login to Fly.io and generate an API token.

3. Deploy an app using a pre-made image of the Ghost blogging platform

    ```bash
    flyctl launch --no-deploy 
    ```

    This will create a new app in your Fly.io account, based on the fly.toml file. It will not deploy the app yet.

    In your `fly.toml` file, you will need to update the following environment variables:

    `url` - The URL you want to use for your blog

4. Setup and configure storage for Ghost to store our data in a sqlite3 database

    ```bash
    flyctl volumes create data -s 3
    ```

5. Deploy our app!

    ```bash
    flyctl deploy
    ```

## TODO

* Move config settings to fly.io's secrets system

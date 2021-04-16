# itchio-upload-action

Action to automate the upload of projects to [itch.io](https://itch.io). Under the hood,
this action uses prebuilt docker images with the [Butler CLI](https://itch.io/docs/butler/)
to minimize runtime.

## Setup

This action requires an itchio api key to run. In order to aquire an api
key:
- Go to [your itchio settings page for api keys](https://itch.io/user/settings/api-keys)
- Click `Generate Api Key` if you don't have one
- Click view on the api key
- Copy the key
- Go to the `Settings` for your github repo
- Go to `Secrets`
- Add a `New Repository Secret`, remember the the name you give it and use it like in the example below

## Options

| Name    | Required | Description                          |
| ------- | -------- | ------------------------------------ |
| path    | true     | path to upload                       |
| project | true     | name of the itchio project           |
| channel | true     | name of the upload channel           |
| version | false    | version to associate with the upload |
| api-key | true     | itchio api key                       |

## Example

```yaml
name: Release

env:
  itchio_project: user/project-name
  itchio_channel: windows

on:
  push:
    tags:
      - v*

jobs:
  exports:
    name: Build, Release, and Upload
    runs-on: ubuntu-latest
    steps:
    steps:
      - name: Check out repository
        uses: actions/checkout@v2
        with:
          lfs: true
      - name: Build
        # Replace with your own build process
        run: make build
      - name: Set Version
        run: |
          echo "version=${GITHUB_REF/refs\/tags\/v/}" >> $GITHUB_ENV
      - name: Upload ${{ matrix.preset }} to itch.io project
        uses: robpc/itchio-upload-action@v1
        with:
          path: build/${{ matrix.preset }}
          project: ${{ env.itchio_project }}
          channel: ${{ env.itchio_channel }}
          version: ${{ env.version }}
          api-key: ${{ secrets.ITCHIO_API_KEY }}
```
# Engineering Guide

This is a skeleton engineering guide.

At Tes, we have a jenkins job, that builds the book and copies the output to S3.  We then have an internal mapping that serves this on an internal domain for us to use.

## Step 1 - Get running locally

```
git clone https://github.com/tes/engineering-gitbook
cd engineering-gitbook
npm install
npm run setup
npm run dev
```

## Step 2 - Update AWS Config

In `/bin/publish.sh`, update with your own configuration:

https://github.com/tes/engineering-gitbook/blob/master/bin/publish.sh#L10

```
aws s3 sync --delete _book s3://your-s3-bucket/folder-name
```

## Step 3 - Configure your build tool

We use Jenkins, and this is the build script:

```
set +x
source ~/.nvm/nvm.sh
nvm use 8
npm install
npm run publish
```

## Step 4 - Update your content

Add content, then make sure you link to it in SUMMARY.md


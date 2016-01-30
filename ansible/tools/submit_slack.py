#!/usr/bin/python
import fileinput, requests, json, pprint, argparse

argParser = argparse.ArgumentParser(description='Simple instruction')
argParser.add_argument('pubkey', type=str)

argsData = argParser.parse_args()

gistEndPoint="https://api.github.com/gists"

gistData = {
  'public': False,
  'files': {
    'test': {
      'content': argsData.pubkey
    }
  }
}

p = requests.post(gistEndPoint, data=json.dumps(gistData))
gistApiResponse = p.json()

slackData = {
  'text': 'New build, ssh key' + gistApiResponse['html_url']
}

slackEndPoint = ""

slackPost = requests.post(slackEndPoint, data=json.dumps(slackData))


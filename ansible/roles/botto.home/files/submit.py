#!/usr/bin/python
import fileinput, requests, json, pprint, argparse
from pprint import pprint

argParser = argparse.ArgumentParser(description='Simple instruction')
argParser.add_argument('token', type=str, help="GitHub token")
argParser.add_argument('pubkey', type=str, help="The public key you wish to add")

argsData = argParser.parse_args()

class GHPubKey:
  pubKey = ''
  endpoint = 'https://api.github.com/user/keys'
  keyTitle = 'cloud-workspace'
  headers = {
    'Authorization': 'token ' + argsData.token
  }

  def checkKey(self):
    getReq = requests.get(self.endpoint, headers=self.headers);
    reqReturn = getReq.json()
    for key in reqReturn:
      if key['title'] == self.keyTitle:
        return True

  def sendKey(self):
    data = {
      'title': 'cloud-workspace',
      'key': self.pubKey
    }
    postReq = requests.post(self.endpoint, data=json.dumps(data), headers=self.headers);
    pprint(postReq.json())

  def setKey(self, newKey):
    self.pubKey = newKey

gh = GHPubKey()
if (gh.checkKey() != True):
  gh.setKey(argsData.pubkey)
  gh.sendKey()

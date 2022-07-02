#!/usr/bin/env python3
from base64 import b64decode, b64encode
import time
import json
import sys
def main():
  #with open('token', 'r') as f:
  #  file_content = f.read()
  file_content = ' '.join(sys.argv[1:])

  fields = file_content.split('.')
  auth_field = fields[1]
  auth_info = b64decode(auth_field + '==')
  auth_obj = json.loads(auth_info)
  auth_obj["exp"] = int(time.time())
  expired_info = json.dumps(auth_obj)
  encoded = b64encode(bytes(expired_info, 'utf-8'))
  print('.'.join([str(fields[0][1:]), encoded.decode(), str(fields[1])]))
if __name__ == '__main__':
  main()

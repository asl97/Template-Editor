import requests
import time
import os

with open("links") as f:
    links = [(i,l) for i,l in enumerate(f.read().split()) if l]

start_time = int(time.time())

s = requests.session()

for i, link in links:
    r = s.get(link)
    with open(os.path.join('processing',f'{i}_{start_time}.png'), 'wb') as f:
        f.write(r.content)

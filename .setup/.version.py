#!/usr/bin/env python
# -*- coding: utf-8 -*-
__all__=["version"]
from os.path import *

repo = abspath(dirname(dirname(__file__)))

path = join(repo,"version.txt")
if exists(path) and isfile(path):
    version = open(path).read().lstrip().rstrip()
else:
    if __name__=="__main__":
        print("SKIP: %s NOT EXISTS" % path)

if __name__=="__main__":
    for k in __all__:
        if k in globals():
            print("%s: %s" % (k,globals()[k]))

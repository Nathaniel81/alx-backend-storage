#!/usr/bin/env python3
"""8-all.py module"""


def list_all(mongo_collection):
    """Lists all documents in a collection"""
    d = mongo_collection.find() 
    if d.count() == 0:
        return []
    return d

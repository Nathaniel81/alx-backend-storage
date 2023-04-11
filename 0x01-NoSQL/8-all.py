#!/usr/bin/env python3
"""8-all.py module"""


def list_all(mongo_collection):
    """Lists all documents in a collection"""
    if mongo_collection.find().count() == 0:
        return []
    return mongo_collection.find()

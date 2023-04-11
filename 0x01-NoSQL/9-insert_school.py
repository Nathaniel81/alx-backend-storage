#!/usr/bin/env python3
"""9-insert_school.py module"""


def insert_school(mongo_collection, **kwargs):
    """Inserts a new document in a collection based on kwargs"""
    mongo_collection.insert(kwargs)

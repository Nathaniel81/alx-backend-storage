#!/usr/bin/env python3
"""exercise module"""
import redis
import uuid
from typing import Union


class Cache():
    """Cache class"""
    def __init__(self):
        """Initialize the cache"""
        self._redis = redis.Redis()
        self._redis.flushdb()
    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Takes in a data argument and returns a string"""
        key = str(uuid.uuid4())
        self.redis.set(key, data)
        return key

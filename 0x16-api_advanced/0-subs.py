#!/usr/bin/python3
"""Task_0_module"""


def number_of_subscribers(subreddit):
    """Queries_the_Reddit API and_returns the_number_of_subscribers
    to the_subreddit"""
    import requests

    sub_info = requests.get("https://www.reddit.com/r/{}/about.json"
                            .format(subreddit),
                            headers={"User-Agent": "My-User-Agent"},
                            allow_redirects=False)
    if sub_info.status_code >= 300:
        return 0

    return sub_info.json().get("data").get("subscribers")

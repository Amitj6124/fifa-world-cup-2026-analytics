"""
FIFA World Cup 2026 - LIVE data pull from hosted API (worldcup26.ir)
No pandas dependency (avoids Python 3.14 + pandas WMI hang on Windows).

Install once:
    pip install requests

Run:
    python live_wc_pull.py
"""

import requests
import csv
import os

BASE_URL = "https://worldcup26.ir"
OUTPUT_DIR = "wc2026_data"
EMAIL = "amitj6124@gmail.com"       # change to your own
PASSWORD = "Amit@2000"     # change to your own

os.makedirs(OUTPUT_DIR, exist_ok=True)


def get_token():
    try:
        resp = requests.post(f"{BASE_URL}/auth/authenticate", json={
            "email": EMAIL, "password": PASSWORD
        })
        resp.raise_for_status()
        print("Logged in.")
    except requests.exceptions.HTTPError:
        resp = requests.post(f"{BASE_URL}/auth/register", json={
            "name": "Amit Joshi", "email": EMAIL, "password": PASSWORD
        })
        resp.raise_for_status()
        print("Registered new account.")
    return resp.json()["token"]


def fetch(endpoint, token, key=None):
    headers = {"Authorization": f"Bearer {token}"}
    resp = requests.get(f"{BASE_URL}/get/{endpoint}", headers=headers)
    resp.raise_for_status()
    data = resp.json()

    # Already a bare list -> use directly
    if isinstance(data, list):
        return data

    # Dict response -> try the given key first
    if isinstance(data, dict):
        if key and key in data and isinstance(data[key], list):
            return data[key]
        # Fallback: find the first value that is a list of dicts
        for v in data.values():
            if isinstance(v, list) and v and isinstance(v[0], dict):
                return v
        print(f"WARNING: could not find list of records in response for '{endpoint}'. Keys found: {list(data.keys())}")
        return []

    return []


def save_csv(records, filename):
    if not records:
        print(f"WARNING: no records for {filename}")
        return
    filepath = os.path.join(OUTPUT_DIR, filename)
    # Collect all possible field names across records (some rows may have extra keys)
    fieldnames = []
    for r in records:
        for k in r.keys():
            if k not in fieldnames:
                fieldnames.append(k)
    with open(filepath, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(records)
    print(f"Saved {len(records)} rows -> {filepath}")


if __name__ == "__main__":
    token = get_token()

    teams = fetch("teams", token)
    groups = fetch("groups", token)
    stadiums = fetch("stadiums", token)
    games = fetch("games", token, key="games")

    save_csv(teams, "teams_live.csv")
    save_csv(groups, "groups_live.csv")
    save_csv(stadiums, "stadiums_live.csv")
    save_csv(games, "games_live.csv")

    finished_count = sum(1 for g in games if str(g.get("finished", "")).upper() == "TRUE")
    print(f"\nFinished matches: {finished_count} / {len(games)}")

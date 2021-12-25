import sqlite3
import json


def run_query(sql_query, parametrs=(), is_json=True):
    with sqlite3.connect("animal.db") as con:
        con.row_factory = sqlite3.Row
        cur = con.cursor()
        if len(parametrs) > 0:
            results = cur.execute(sql_query, parametrs)
        else:
            results = cur.execute(sql_query)
        if is_json:
            return json.dumps([dict(result) for result in results.fetchall()])
        else:
            return results

import sqlite3
import json
from flask import Flask, jsonify
from functions import *

app = Flask(__name__, static_folder="css")


@app.route('/animal/<string:name>')
def animal(name):
    sqlite_query = """select name, my_animals.id, type, date_of_bidth
                        from my_animals
                        join types as t on my_animals.type_id = t.id
                        where name = ?
    """
    return jsonify(run_query(sqlite_query, (name,)))


@app.route('/itemid/<int:id>')
def itemid(id):
    sqlite_query = """select
                            outcome.id,
                            ot.type,
                            os.subtype,
                            age_upon,
                            ma.name
                        from outcome
                        join my_animals ma on outcome.animal_id = ma.id
                        join outcome_subtype os on outcome.subtype_id = os.id
                        join outcome_type ot on outcome.type_id = ot.id
                        where outcome.id = ?
    """
    return jsonify(run_query(sqlite_query, (id,)))


if __name__ == "__main__":
    app.run()

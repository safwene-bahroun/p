from flask import (
    Blueprint, render_template
)
from werkzeug.exceptions import abort
from datetime import time
from projetF.auth import login_required
from projetF.db import get_db

bp = Blueprint('absences', __name__ ,url_prefix='/absences')

@bp.route('/absences')
@login_required
def absences():
    db = get_db()
    db.execute('SELECT  e.nom AS Nom_Etudiant, '
'e.prenom AS Prenom_Etudiant,'
' e.cin AS CIN,'
'ed.periode AS Periode,'
'ed.matiere AS Matiere, '
' s.nom AS Salle,'
' a.presence AS Presence,'
' a.date_absence AS Date_Absence'
'FROM etudiant e'
'JOIN absences a ON e.id = a.etudiant_id'
'JOIN emplois_du_temps ed ON a.emploi_du_temps_id = ed.id'
'JOIN salles s ON a.salle_id = s.id'
'WHERE e.cin = cin'    ).fetchall()

    t0 = time(8,30,00)
    t1 = time(8,40,00)
    t2 = time(10,00,00)
    t3 = time(10,5,00)
    t3 = time(11,30,00)
    t4 = time(14,00,00)
    t5 = time(14,10,00)
    t6 = time(15,30,00)
    t7 = time(15,35,00)
    t8 = time(15,40,00)
    t9 = time(17,00,00)
    t10= time(17,5,00)
    t11=time(10,10,00)
    t12=time(11,35,00)
    ouvertures = db.execute('''
        SELECT date_ouverture 
        FROM ouvertures_porte 
        WHERE carte_rfid = (
            SELECT carte_rfid 
            FROM etudiant 
            WHERE cin = cin
        )
    ''',).fetchall()

    for ouverture in ouvertures:
        date_ouverture = ouverture['date_ouverture'].time()
        if   t0 <= date_ouverture<=t1   :
            db.execute(
                    "INSERT INTO absences (presence)  VALUES (?)",
                    ("being processed ...")
                )
            if t2< db.ouverture_porte.date_ouverture <=t3 :
                db.execute(
                    "INSERT INTO absences (presence)  VALUES (?)",
                    ("present")
                )
        else  :
            db.execute(
                    "INSERT INTO absences (presence)  VALUES (?)",
                    ("absent")
                )



        if   t2 <= date_ouverture<=t11   :
            db.execute(
                    "INSERT INTO absences (presence)  VALUES (?)",
                    ("being processed ...")
                )
            if t4< date_ouverture <=t12 :
                db.execute(
                    "INSERT INTO absences (presence)  VALUES (?)",
                    ("present")
                )
        else  :
            db.execute(
                    "INSERT INTO absences (presence)  VALUES (?)",
                    ("absent")
                )



        if   t4 <= date_ouverture<=t5   :
            db.execute(
                    "INSERT INTO absences (presence)  VALUES (?)",
                    ("being processed ...")
                )
            if t6< date_ouverture <=t7 :
                db.execute(
                    "INSERT INTO absences (presence)  VALUES (?)",
                    ("present")
                )
        else  :
            db.execute(
                    "INSERT INTO absences (presence)  VALUES (?)",
                    ("absent")
        )





        if   t6 <= date_ouverture<=t8   :
            db.execute(
                    "INSERT INTO absences (presence)  VALUES (?)",
                    ("being processed ...")
                )
            if t9< date_ouverture <=t10 :
                db.execute(
                    "INSERT INTO absences (presence)  VALUES (?)",
                    ("present")
                )
        else  :
            db.execute(
                    "INSERT INTO absences (presence)  VALUES (?)",
                    ("absent")
        )

    return render_template('your_absences.html',absences=absences)


@bp.route('/profile')
@login_required
def profile(etudiant_id):
    db = get_db()
    etudiant = db.execute('SELECT * FROM etudiant WHERE id = ?', (etudiant_id,)).fetchone()
    if etudiant is None:
        return "student not found", 404

    return render_template('profile.html', etudiant=etudiant)
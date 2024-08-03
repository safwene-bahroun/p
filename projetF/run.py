from __init__ import create_app

app = create_app()


from . import db
db.init_app(app)

from . import auth
app.register_blueprint(auth.bp)

from . import absences
app.register_blueprint(absences.bp)




if __name__ == '__main__':
    app.run(debug=True)

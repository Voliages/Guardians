from app import app 
from flask import render_template


@app.route('/admin/dashboard')
def admin_dashboard():
    return render_template('admin/dashboard.html')

@app.route('/admin/compare')
def admin_compare():
    return render_template('admin/compare.html')

@app.route('/admin/add')
def admin_add():
    return render_template('admin/add.html')
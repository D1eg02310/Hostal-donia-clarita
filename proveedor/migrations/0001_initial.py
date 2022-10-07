# Generated by Django 4.1.1 on 2022-10-07 11:52

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Proveedor",
            fields=[
                ("id_proveedor", models.AutoField(primary_key=True, serialize=False)),
                ("nombre_prov", models.CharField(max_length=50)),
                ("email", models.EmailField(max_length=100)),
                ("telefono", models.IntegerField()),
                ("direccion", models.CharField(max_length=80)),
                ("rubro", models.CharField(blank=True, max_length=25, null=True)),
            ],
            options={"db_table": "PROVEEDOR", "managed": False,},
        ),
    ]

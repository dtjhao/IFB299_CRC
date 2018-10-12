# Generated by Django 2.1.1 on 2018-10-07 05:46

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Promotion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('month', models.IntegerField()),
                ('year', models.IntegerField()),
                ('city_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.City')),
            ],
        ),
        migrations.CreateModel(
            name='VehicleData',
            fields=[
                ('vehicle_id', models.IntegerField(primary_key=True, serialize=False)),
                ('make', models.CharField(max_length=50)),
                ('model', models.CharField(max_length=50)),
                ('series', models.IntegerField()),
                ('price', models.IntegerField()),
                ('engine_size', models.IntegerField()),
                ('fuel_system', models.CharField(max_length=20)),
                ('tank_capacity', models.IntegerField()),
                ('seating', models.IntegerField()),
                ('standard_transmission', models.CharField(max_length=10)),
                ('body_type', models.CharField(max_length=15)),
                ('car_drive', models.CharField(max_length=5)),
                ('car_wheelbase', models.IntegerField()),
                ('manufacturer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.Manufacturer')),
            ],
        ),
        migrations.CreateModel(
            name='VehicleInstance',
            fields=[
                ('licence_plate', models.CharField(max_length=8, primary_key=True, serialize=False)),
                ('store', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.Store')),
                ('vd_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.VehicleData')),
            ],
        ),
        migrations.RemoveField(
            model_name='vehicle',
            name='manufacturer',
        ),
        migrations.RemoveField(
            model_name='vehicle',
            name='store',
        ),
        migrations.AlterField(
            model_name='customer',
            name='birthday',
            field=models.DateField(blank=True, default=django.utils.timezone.now),
        ),
        migrations.AlterField(
            model_name='customer',
            name='gender',
            field=models.CharField(choices=[('M', 'MALE'), ('F', 'FEMALE'), ('O', 'OTHER')], max_length=1),
        ),
        migrations.AlterField(
            model_name='rental',
            name='vehicle_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.VehicleInstance'),
        ),
        migrations.DeleteModel(
            name='Vehicle',
        ),
        migrations.AddField(
            model_name='promotion',
            name='vd_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.VehicleData'),
        ),
    ]

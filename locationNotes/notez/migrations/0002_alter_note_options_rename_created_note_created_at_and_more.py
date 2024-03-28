# Generated by Django 5.0.1 on 2024-03-11 15:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('notez', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='note',
            options={'ordering': ['-updated_at']},
        ),
        migrations.RenameField(
            model_name='note',
            old_name='created',
            new_name='created_at',
        ),
        migrations.RenameField(
            model_name='note',
            old_name='updated',
            new_name='updated_at',
        ),
        migrations.RemoveField(
            model_name='note',
            name='taker',
        ),
        migrations.AlterField(
            model_name='note',
            name='message',
            field=models.TextField(),
        ),
    ]
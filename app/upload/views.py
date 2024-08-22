from django.shortcuts import render
from django.core.files.storage import FileSystemStorage
from django.db import connection
from core.settings import DEBUG


def image_upload(request):
    db_backend = connection.vendor
    db_name = connection.settings_dict['NAME']
    debug = True if DEBUG else False
    context = {
        "debug": debug,
        "db_name": db_name,
        "db_backend": db_backend,
    }
    image_file = request.FILES.get("image_file")
    if request.method == "POST" and image_file:
        fs = FileSystemStorage()
        filename = fs.save(image_file.name, image_file)
        image_url = fs.url(filename)
        if image_url:
            context["image_url"] = image_url
    return render(request, "upload.html", context)

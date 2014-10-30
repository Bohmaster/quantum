from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('quantum.views',

    # Home
        url(r'^$', 'index', name="index"),

    # Admin
        url(r'^admin/', include(admin.site.urls)),

    # Tasks
        url(r'^tasks/', include('tasks.urls'), name=""),

)

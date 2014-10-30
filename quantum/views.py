from django.shortcuts import render
from django.views import generic

class IndexTemplateView(generic.TemplateView):

    """
    Index view. Handles index page and shows latest and profile
    information.
    """

    template_name = 'index.html'

    def get_context_data(self, **kwargs):
        context = super(IndexTemplateView, self).get_context_data(**kwargs)  # get parent context functionality
        context['username'] = self.request.user.username  # set session username in context
        return context

index = IndexTemplateView.as_view()
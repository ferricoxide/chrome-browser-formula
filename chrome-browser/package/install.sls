# -*- coding: utf-8 -*-
# vim: ft=sls

include:
{%- if grains.kernel == "Linux" %}
  - .lin_install
{%- elif grains.kernel == "Windows" %}
  - .win_pre-install
  - .win_install
  - .win_post-install
{%- endif %}

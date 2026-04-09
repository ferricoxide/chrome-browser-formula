# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- from tplroot ~ "/map.jinja" import mapdata as TEMPLATE with context %}

Purge Chrome Directory:
  file.absent:
    - name: 'C:\Program Files\Google\Chrome\Application'
    - onchanges:
      - cmd: Uninstall Google Chrome

Uninstall Google Chrome:
  cmd.script:
    - source: salt://{{ tplroot }}/files/uninstall_chrome.ps1
    - shell: powershell
    - success_retcodes: [
        0,
        100
      ]

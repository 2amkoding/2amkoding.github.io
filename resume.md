---
layout: about
title: Resume
description: >
  My professional resume with work experience, education, and skills.
hide_description: true
accent_image: /assets/img/splash@0,5x.jpg
---

<!--author-->

## Education

{% for edu in site.data.resume.education %}

### {{ edu.studyType }} in {{ edu.area }}

**{{ edu.institution }}** ({{ edu.startDate }} - {{ edu.endDate }})
{% if edu.gpa %}GPA: {{ edu.gpa }}{% endif %}

{% if edu.courses %}
**Relevant Courses:**
{% for course in edu.courses %}

- {{ course }}
  {% endfor %}
  {% endif %}

{% endfor %}

## Skills

{% for skill in site.data.resume.skills %}
**{{ skill.name }}** ({{ skill.level }}): {{ skill.keywords | join: ', ' }}
{% endfor %}

## Languages

{% for lang in site.data.resume.languages %}
**{{ lang.language }}**: {{ lang.fluency }}
{% endfor %}

## Professional Experience

{% for job in site.data.resume.work %}

### {{ job.position }} at {{ job.company }}

_{{ job.startDate }}{% if job.endDate %} - {{ job.endDate }}{% else %} - Present{% endif %}_

{{ job.summary }}

{% if job.highlights %}
**Key Achievements:**
{% for highlight in job.highlights %}

- {{ highlight }}
  {% endfor %}
  {% endif %}

{% endfor %}

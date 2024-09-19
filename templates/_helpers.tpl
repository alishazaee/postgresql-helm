{{- define "my-postgresql.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "my-postgresql.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "my-postgresql.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Common labels for resources.
*/}}
{{- define "my-postgresql.labels" -}}
app.kubernetes.io/name: {{ include "my-postgresql.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Label selector for the StatefulSet or Pod.
*/}}
{{- define "my-postgresql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "my-postgresql.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Secret name for PostgreSQL credentials.
*/}}
{{- define "my-postgresql.secretName" -}}
{{ include "my-postgresql.fullname" . }}-secret
{{- end -}}

# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define() do

  create_table "activewarehouse_schema_info", :id => false, :force => true do |t|
    t.column "version", :integer
  end

  create_table "afecta_fvhcs", :force => true do |t|
    t.column "id_fenomeno_fvhc",     :integer, :null => false
    t.column "id_varhidroclim_fvhc", :integer, :null => false
  end

  create_table "areaintereses", :force => true do |t|
    t.column "interes", :string, :limit => 50, :null => false
  end

  create_table "atributos", :force => true do |t|
    t.column "nombre",              :string
    t.column "valor",               :string
    t.column "solicitudreporte_id", :string
  end

  create_table "batches", :force => true do |t|
    t.column "batch_file",   :string,   :null => false
    t.column "created_at",   :datetime, :null => false
    t.column "completed_at", :datetime
    t.column "status",       :string
  end

  create_table "consultas", :force => true do |t|
    t.column "usuario_id",     :integer, :null => false
    t.column "texto_pregunta", :text
  end

  create_table "consultatags", :force => true do |t|
    t.column "consulta_id", :integer,               :null => false
    t.column "tag",         :string,  :limit => 30
  end

  create_table "estacion_dimension", :force => true do |t|
    t.column "nombre_est",   :string
    t.column "latitud_est",  :float
    t.column "longitud_est", :float
    t.column "altura_est",   :integer
  end

  add_index "estacion_dimension", ["altura_est"], :name => "index_estacion_dimension_on_altura_est"
  add_index "estacion_dimension", ["latitud_est"], :name => "index_estacion_dimension_on_latitud_est"
  add_index "estacion_dimension", ["longitud_est"], :name => "index_estacion_dimension_on_longitud_est"
  add_index "estacion_dimension", ["nombre_est"], :name => "index_estacion_dimension_on_nombre_est"

  create_table "estaciones", :force => true do |t|
    t.column "latitud",     :float,                  :null => false
    t.column "longitud",    :float,                  :null => false
    t.column "pais",        :string,  :limit => 80,  :null => false
    t.column "informacion", :string,  :limit => 300, :null => false
    t.column "nombre",      :string,  :limit => 100
    t.column "codigoomm",   :string,  :limit => 100
    t.column "altura",      :float
    t.column "actual",      :string,  :limit => 2
    t.column "estado_id",   :integer,                :null => false
  end

  create_table "estados", :force => true do |t|
    t.column "nombre", :string, :limit => 40, :null => false
  end

  create_table "fenomeno_meteorologicos", :force => true do |t|
    t.column "nombre_f",       :string, :limit => 20
    t.column "descrip_f",      :string, :limit => 150
    t.column "lugar_geo_f",    :string, :limit => 200
    t.column "primera_obs_f",  :date
    t.column "periodicidad_f", :string, :limit => 15
  end

  create_table "hilos", :force => true do |t|
    t.column "titulo", :string, :limit => 50, :null => false
  end

  create_table "jobs", :force => true do |t|
    t.column "control_file", :string,   :null => false
    t.column "created_at",   :datetime, :null => false
    t.column "completed_at", :datetime
    t.column "status",       :string
    t.column "batch_id",     :integer
  end

  create_table "medidavarhc_facts", :force => true do |t|
    t.column "tiempo_id",          :integer, :null => false
    t.column "unidad_id",          :integer, :null => false
    t.column "estacion_id",        :integer, :null => false
    t.column "nivelagregacion_id", :integer, :null => false
    t.column "variable_id",        :integer, :null => false
    t.column "valor_m",            :float,   :null => false
    t.column "observacion_m",      :string
  end

  create_table "medios", :force => true do |t|
    t.column "nombre_med",          :string, :limit => 100
    t.column "descripcion_med",     :string, :limit => 400
    t.column "propiedades_med",     :string, :limit => 400
    t.column "id_tipo_instrumento", :string, :limit => 100
  end

  create_table "mensajes", :force => true do |t|
    t.column "hilo_id",    :integer,                :null => false
    t.column "usuario_id", :integer,                :null => false
    t.column "mensaje",    :string,  :limit => 300, :null => false
  end

  create_table "metadatos_desc", :primary_key => "id_metadesc", :force => true do |t|
    t.column "tipo_variable",        :string, :limit => 50,  :null => false
    t.column "codigo_estacion_muni", :string, :limit => 15,  :null => false
    t.column "variable",             :string, :limit => 50,  :null => false
    t.column "granularidad",         :string, :limit => 200, :null => false
    t.column "fecha_inicio",         :date,                  :null => false
    t.column "fecha_fin",            :date,                  :null => false
  end

  create_table "metadatos_rowids", :id => false, :force => true do |t|
    t.column "id_descriptor", :integer, :null => false
    t.column "row_id_medida", :integer, :null => false
  end

  create_table "nivelagregacion_dimension", :force => true do |t|
    t.column "nivel_agregacion", :string
  end

  add_index "nivelagregacion_dimension", ["nivel_agregacion"], :name => "index_nivelagregacion_dimension_on_nivel_agregacion"

  create_table "periodo_operacions", :force => true do |t|
    t.column "estacion_id_po",  :integer, :null => false
    t.column "fecha_inicio_po", :date,    :null => false
    t.column "fecha_fin_po",    :date,    :null => false
  end

  create_table "puede_medir_vtins", :force => true do |t|
    t.column "id_varhidroclim_vtins", :integer, :null => false
    t.column "id_tipo_ins_vtins",     :integer, :null => false
  end

  create_table "records", :force => true do |t|
    t.column "control_file", :string,  :null => false
    t.column "natural_key",  :string,  :null => false
    t.column "crc",          :string,  :null => false
    t.column "job_id",       :integer, :null => false
  end

  create_table "reportepentahos", :force => true do |t|
    t.column "usuarios_id",         :integer
    t.column "solicitudreporte_id", :integer
    t.column "link",                :string
    t.column "comentario",          :string
    t.column "privado",             :boolean, :default => true
  end

  create_table "requerimientos", :force => true do |t|
    t.column "requerimiento", :string, :limit => 50,  :null => false
    t.column "detalles",      :string, :limit => 250
  end

  create_table "se_asocia_vhctos", :force => true do |t|
    t.column "id_varhidroclim_vhcto", :integer, :null => false
    t.column "id_tipo_objeto_vhcto",  :integer, :null => false
  end

  create_table "se_mide_vunis", :force => true do |t|
    t.column "id_varhidroclim_vuni", :integer, :null => false
    t.column "id_unid_vuni",         :integer, :null => false
  end

  create_table "se_observas", :force => true do |t|
    t.column "id_estacion", :integer, :null => false
    t.column "id_variable", :integer, :null => false
  end

  create_table "se_relaciona_vsetos", :force => true do |t|
    t.column "id_varsocioe_vseto",   :integer, :null => false
    t.column "id_tipo_objeto_vseto", :integer, :null => false
  end

  create_table "servicios", :force => true do |t|
    t.column "nombre",      :string,  :limit => 30,  :null => false
    t.column "descripcion", :string,  :limit => 200, :null => false
    t.column "habilitado",  :boolean,                :null => false
    t.column "autor",       :string,  :limit => 30,  :null => false
    t.column "usuario_id",  :integer,                :null => false
    t.column "url_wsdl",    :string,  :limit => 100
    t.column "url_owls",    :string,  :limit => 100
    t.column "tags",        :string
  end

  create_table "simple_captcha_data", :force => true do |t|
    t.column "key",        :string, :limit => 40, :null => false
    t.column "value",      :string, :limit => 6
    t.column "created_at", :date
    t.column "updated_at", :date
  end

  create_table "solicitudes", :force => true do |t|
    t.column "solicitante",   :integer,                :null => false
    t.column "prioridad",     :string,  :limit => 20,  :null => false
    t.column "atendido_por",  :integer
    t.column "requerimiento", :string,  :limit => 50,  :null => false
    t.column "comentarios",   :string,  :limit => 250
  end

  create_table "solicitudreportes", :force => true do |t|
    t.column "titulo",          :string
    t.column "usuario_id",      :integer
    t.column "consultor_id",    :integer
    t.column "creacion",        :date
    t.column "resolucion",      :date
    t.column "variable",        :string
    t.column "estacion",        :string
    t.column "estado",          :string
    t.column "cotainferior",    :string
    t.column "cotasuperior",    :string
    t.column "periododetiempo", :text
    t.column "granularidad",    :string
    t.column "tipoestacion",    :string
    t.column "institucion",     :string
    t.column "comentario",      :text
  end

  create_table "table_reports", :force => true do |t|
    t.column "title",                 :string
    t.column "cube_name",             :string,   :null => false
    t.column "column_dimension_name", :string
    t.column "column_hierarchy",      :string
    t.column "column_constraints",    :text
    t.column "column_stage",          :integer
    t.column "column_param_prefix",   :string
    t.column "row_dimension_name",    :string
    t.column "row_hierarchy",         :string
    t.column "row_constraints",       :text
    t.column "row_stage",             :integer
    t.column "row_param_prefix",      :string
    t.column "fact_attributes",       :text
    t.column "created_at",            :datetime
    t.column "updated_at",            :datetime
  end

  create_table "tiempo_dimension", :force => true do |t|
    t.column "unidad_t",      :string
    t.column "observacion_t", :string
    t.column "tiempo",        :date
    t.column "dia",           :integer
    t.column "mes",           :integer
    t.column "anio",          :integer
    t.column "hora",          :time
  end

  add_index "tiempo_dimension", ["observacion_t"], :name => "index_tiempo_dimension_on_observacion_t"
  add_index "tiempo_dimension", ["unidad_t"], :name => "index_tiempo_dimension_on_unidad_t"

  create_table "tipo_instrumentos", :force => true do |t|
    t.column "nombre_ti",           :string,  :limit => 100
    t.column "tipo_ti",             :string,  :limit => 1
    t.column "tipo_registrador_ti", :string,  :limit => 2
    t.column "descripcion_ti",      :string,  :limit => 400
    t.column "restriccion_ti",      :string,  :limit => 200
    t.column "id_medio",            :integer
  end

  create_table "tipo_objetos", :force => true do |t|
    t.column "nombre_generico_to", :string, :limit => 20
    t.column "clase_to",           :string, :limit => 1
    t.column "descrip_to",         :string, :limit => 150
    t.column "alcance_geo_to",     :string, :limit => 200
  end

  create_table "unidad_dimension", :force => true do |t|
    t.column "unidad_medida_u", :string
    t.column "observacion_u",   :string
  end

  add_index "unidad_dimension", ["observacion_u"], :name => "index_unidad_dimension_on_observacion_u"
  add_index "unidad_dimension", ["unidad_medida_u"], :name => "index_unidad_dimension_on_unidad_medida_u"

  create_table "unidads", :force => true do |t|
    t.column "nombre_unid",   :string, :limit => 100, :null => false
    t.column "acronimo_unid", :string, :limit => 20
  end

  create_table "usuarios", :force => true do |t|
    t.column "login",                     :string, :limit => 40,  :null => false
    t.column "crypted_password",          :string, :limit => 40,  :null => false
    t.column "salt",                      :string, :limit => 40
    t.column "nombre",                    :string, :limit => 20,  :null => false
    t.column "apellido",                  :string, :limit => 20,  :null => false
    t.column "tipo",                      :string, :limit => 14,  :null => false
    t.column "sexo",                      :string, :limit => 1,   :null => false
    t.column "fecha_nacimiento",          :date,                  :null => false
    t.column "fecha_registro",            :date,                  :null => false
    t.column "telefono",                  :string, :limit => 16
    t.column "nivel_estudio",             :string, :limit => 25,  :null => false
    t.column "campo_trabajo",             :string, :limit => 30,  :null => false
    t.column "direccion_hab",             :string, :limit => 200
    t.column "email_address",             :string, :limit => 30
    t.column "remember_token",            :string
    t.column "remember_token_expires_at", :date
  end

  add_index "usuarios", ["login"], :name => "uk_usuarios", :unique => true

  create_table "usuarios_intereses", :force => true do |t|
    t.column "usuario_id",      :integer, :null => false
    t.column "areainterese_id", :integer, :null => false
  end

  create_table "variable_hidroclimaticas", :force => true do |t|
    t.column "nombre_hc",      :string, :limit => 100
    t.column "tipo_hc",        :string, :limit => 1
    t.column "descripcion_hc", :string, :limit => 400
    t.column "acumulada_hc",   :string, :limit => 1
  end

  create_table "variable_socioeconomicas", :force => true do |t|
    t.column "nombre_vse",      :string, :limit => 100
    t.column "descripcion_vse", :string, :limit => 400
  end

  create_table "vinculotags", :force => true do |t|
    t.column "usuario_id",  :integer,                :null => false
    t.column "vinculo",     :string,  :limit => 100, :null => false
    t.column "tag",         :string,  :limit => 300, :null => false
    t.column "descripcion", :string,  :limit => 200, :null => false
    t.column "oficial",     :string,  :limit => 2,   :null => false
  end

end

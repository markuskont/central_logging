{
  "order" : 0,
  "template" : "apache-*",
  "settings" : {
    "index.refresh_interval" : "60s",
    "index.number_of_replicas" : "1",
    "index.number_of_shards" : "4"
  },
  "mappings" : {
    "_default_" : {
      "dynamic_templates" : [ {
        "string_fields" : {
          "mapping" : {
            "index" : "analyzed",
            "omit_norms" : true,
            "type" : "string",
            "fields" : {
              "raw" : {
                "index" : "not_analyzed",
                "ignore_above" : 256,
                "type" : "string"
              }
            }
          },
          "match" : "*",
          "match_mapping_type" : "string"
        }
      } ],
      "properties" : {
        "geoip"  : {
          "dynamic": true,
          "properties" : {
            "country_name" : { 
              "index" : "not_analyzed",
              "type" : "string" 
            },
            "location" : { "type" : "geo_point" },
            "latitude" : { "type" : "float" },
            "longitude" : { "type" : "float" }
          }
        },
        "@version" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "syslog_pri" : {
          "index" : "analyzed",
          "type" : "integer"
        },
        "syslog_timestamp" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "syslog_hostname" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "syslog_program" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "syslog_message" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "http_vhost" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "http_port" : {
          "index" : "analyzed",
          "type" : "integer"
        },
        "http_clientip" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "http_ident" :{
          "index" : "not_analyzed",
          "type" : "string"
        },
        "http_auth" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "http_timestamp" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "http_method" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "http_request" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "http_version" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "http_response" : {
          "index" : "analyzed",
          "type" : "integer"
        },
        "http_bytes" : {
          "index" : "analyzed",
          "type" : "integer"
        },
        "http_referer" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "http_useragent" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "name" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "os" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "os_name" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "device" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "major" : {
          "index" : "analyzed",
          "type" : "integer"
        },
        "minor" : {
          "index" : "analyzed",
          "type" : "integer"
        }
      },
      "_all" : {
        "enabled" : false
      }
    }
  },
  "aliases" : { }
}

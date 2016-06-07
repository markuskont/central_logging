{
  "order" : 0,
  "template" : "samba-*",
  "settings" : {
    "index.refresh_interval" : "60s",
    "index.number_of_replicas" : "1",
    "index.number_of_shards" : "3"
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
        }
      },
      "_all" : {
        "enabled" : false
      }
    }
  },
  "aliases" : { }
}

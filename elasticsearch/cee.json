{
  "template" : "cee-*",
  "settings" : {
    "index.refresh_interval" : "30s",
    "index.number_of_replicas" : "0",
    "index.number_of_shards" : "2"
  },
  "mappings" : {
    "_default_" : {
      "_all" : {"enabled" : false, "omit_norms" : true},
      "dynamic_templates" : [ {
        "message_field" : {
          "match" : "message",
          "match_mapping_type" : "string",
          "mapping" : {
            "type" : "string", "index" : "analyzed", "omit_norms" : true,
            "fielddata" : { "format" : "disabled" }
          }
        }
      }, {
        "string_fields" : {
          "match" : "*",
          "match_mapping_type" : "string",
          "mapping" : {
            "type" : "string", "index" : "analyzed", "omit_norms" : true,
            "fielddata" : { "format" : "disabled" },
            "fields" : {
              "raw" : {"type": "string", "index" : "not_analyzed", "ignore_above" : 256}
            }
          }
        }
      } ],
      "properties" : {
        "@timestamp": { "type": "date" },
        "@version": { "type": "string", "index": "not_analyzed" },
        "geoip"  : {
          "dynamic": true,
          "properties" : {
            "location" : { "type" : "geo_point" },
            "latitude" : { "type" : "float" },
            "longitude" : { "type" : "float" }
          }
        },
        "Message" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "Hostname" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "Content" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "syslogtag" : {
	  "index" : "not_analyzed",
          "type" : "string"
	}
      }
    }
  }
}

{
  "template" : "suricata-*",
  "settings" : {
    "index.refresh_interval" : "60s",
    "index.number_of_replicas" : "1",
    "index.number_of_shards" : "4"
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
        "timestamp": { 
          "index": "analyzed", 
          "type": "date" 
        },
        "dest_ip" : {
          "index": "analyzed",
          "type" : "ip"
        },
        "dest_port" : {
          "index": "analyzed",
          "type" : "integer"
        },
        "event_type" : {
          "index": "not_analyzed",
          "type" : "string"
        },
        "icmp_code" : {
          "index": "analyzed",
          "type" : "integer"
        },
        "icmp_type" : {
          "index": "analyzed",
          "type" : "integer"
        },
        "proto" : {
          "index": "not_analyzed",
          "type" : "string"
        },
        "src_ip" : {
          "index": "analyzed",
          "type" : "ip"
        },
        "src_port" : {
          "index": "analyzed",
          "type" : "integer"
        },
        "packet" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "payload_printable" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "payload" : {
          "index" : "not_analyzed",
          "type" : "string"
        },
        "alert": {
          "dynamic": true,
          "type": "object",
          "properties": {
            "action" : {
              "index" : "not_analyzed",
              "type" : "string"
            },
            "category" : {
              "index" : "not_analyzed",
              "type" : "string"
            },
            "dst_mask" : {
              "index" : "analyzed",
              "type" : "integer"
            },
            "gid" : {
              "index" : "not_analyzed",
              "type" : "integer"
            },
            "rev" : {
              "index" : "analyzed",
              "type" : "integer"
            },
            "severity" : {
              "index" : "analyzed",
              "type" : "integer"
            },
            "signature" : {
              "index" : "not_analyzed",
              "type" : "string"
            },
            "signature_id" : {
              "index" : "analyzed",
              "type" : "integer"
            }
          }
        }
      }
    }
  }
}

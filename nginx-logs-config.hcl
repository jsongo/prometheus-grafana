listen {
  port = 4040
  address = "nginx"
}

consul {
  enable = true
  address = "consul:8500"
  service {
    id = "nginx-exporter"
    name = "nginx-exporter"
    datacenter = "dc1"
    scheme = "http"
    token = ""
    tags = ["foo", "bar"]
  }
}

namespace "app-1" {
  format = "$remote_addr - $remote_user [$time_local] \"$request\" $status $body_bytes_sent \"$http_referer\" \"$http_user_agent\" \"$http_x_forwarded_for\""
  source_files = [
    "/var/log/nginx/access.log"
  ]
  labels {
    app = "just-nginx"
    environment = "production"
  }
}

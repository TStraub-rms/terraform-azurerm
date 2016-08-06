data "template_file" "test" {
  template = "/subscriptions/s/resourceGroups/v/providers/Microsoft.Network/virtualNetworks/vn/subnets/sn"
}

resource "azurerm_simple_lb" "test" {
  name                = "test-load-balancer"
  location            = "east-us"
  type                = "Microsoft.Network/loadBalancers"
  resource_group_name = "rg"

  frontend_subnet     = "${data.template_file.test.rendered}"
  frontend_allocation_method = "Dynamic"

  rule {
    protocol          = "Tcp"
    load_distribution = "Default"
    frontend_port     = 80
    backend_port      = 80
    name              = "HTTP"
    probe_name        = "HEALTH"
  }
  rule {
    protocol          = "Tcp"
    load_distribution = "Default"
    frontend_port     = 443
    backend_port      = "443"
    name              = "HTTPS"
    probe_name        = "HEALTH"
  }

  probe {
    name             = "HEALTH"
    protocol         = "Http"
    request_path     = "/health"
    port             = "8080"
    interval         = 30
    number_of_probes = 2
  }
}
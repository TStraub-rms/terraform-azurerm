package main

import (
	"github.com/tstraub-rms/terraform-azurerm/azurerm"

	"github.com/hashicorp/terraform/plugin"
	"github.com/hashicorp/terraform/terraform"
)

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: func() terraform.ResourceProvider {
			return azurerm.Provider()
		},
	})
}

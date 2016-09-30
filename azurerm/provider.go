package main

import "strings"

// func Provider() *schema.Provider {
// 	return &schema.Provider{
// 		ResourcesMap: *azurerm.Provider.ResourcesMap,
// 	}
// }

// azureRMNormalizeLocation is a function which normalises human-readable region/location
// names (e.g. "West US") to the values used and returned by the Azure API (e.g. "westus").
// In state we track the API internal version as it is easier to go from the human form
// to the canonical form than the other way around.
func azureRMNormalizeLocation(location interface{}) string {
	input := location.(string)
	return strings.Replace(strings.ToLower(input), " ", "", -1)
}

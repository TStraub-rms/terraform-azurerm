# terraform-azurerm
## To Do
 - Create Makefile for common tasks (build/test)
 - Create unit tests

## To Build
1. Ensure `gox` is installed
```
go get github.com/mitchellh/gox
```
2. Run build
```
cd azurerm
gox \
    -os="darwin linux" \
    -arch="386 amd64" \
    -parallel=4 \
    -output "../bin/{{.OS}}_{{.Arch}}/terraform-provider-azurerm"
```

## To Test
1. Download latest terraform executable from their website and place the single `terraform` file in the test folder.
2. Build this project and copy output to /test directory
3. Run 
```
./terraform plan
```

## References
[Plugin Development](https://www.hashicorp.com/blog/terraform-custom-providers.htmlhttps://www.hashicorp.com/blog/terraform-custom-providers.html)

[gox cross platform build](https://github.com/hashicorp/terraform/blob/master/scripts/build.sh#L49)
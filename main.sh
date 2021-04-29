#!/bin/bash

while IFS= read -r line || [[ -n "$line" ]]; do
    IFS=',' read -ra data <<< "$line"
    sed -e "s/name/${data[0]}/g" -e "s/function/${data[1]}/g" -e "s/picture/${data[2]}/g" signature_base.html > "signatures/${data[0]}_signature.html"
    echo "Signature has been created for ${data[0]}";
done < $1
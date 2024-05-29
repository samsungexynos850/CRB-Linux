#!/bin/bash

echo "          "
echo "Specify path to where the prism img is located"
read -p "PATH: " prism_img_path
echo ""

if [ -e "$prism_img_path/prism.img" ]; then

    mkdir -p ./Projects/$PROJECT/Build/prism/

    echo "prism.img located!"
    echo "Copying to CRB..."
    cp -f $prism_img_path/prism.img ./Projects/$PROJECT/Input/

    FILE_TYPE=$(file ./Projects/$PROJECT/Input/prism.img)

    # Check if the file is sparse
    if echo "$FILE_TYPE" | grep -q "Android sparse image"; then

        simg2img ./Projects/$PROJECT/Input/prism.img ./Projects/$PROJECT/Output/prism.img

        echo "Extracting filesystem..."
        sudo mount -t ext4 -o loop ./Projects/$PROJECT/Output/prism.img ./Projects/$PROJECT/Build/prism/

        echo "Done, any changed made to the prism filesystem will be reflected in the prism.img file,
        located at ./Projects/$PROJECT/Output/prism.img"

    fi

fi
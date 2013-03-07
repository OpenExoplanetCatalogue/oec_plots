#!/bin/bash

commit (){
  git add *
  git commit -a -m "$1"
}


commit "before automatic update"

pushd open_exoplanet_catalogue
git pull
popd
commit "automatic update: pulling new open_exoplanet_catalogue"

doall.bash
convert_all_svg_to_png.bash
commit "automatic update: generateASCIITables"

#git push

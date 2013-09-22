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

## make plots
python plot_mass_vs_semimajoraxis_discovery.python 
python plot_mass_vs_semimajoraxis_eccentricity.python
python plot_periodratio.python
python plot_architecture.python
python plot_binarysep_vs_planetsep.python
python plot_discoveryyear.python
python plot_radec_discovery_mollweide.python

# Convert all svg vector images to rasterized png images.
# This script is using qlmanage and convert. It only works on a mac, but it seems to produce the best quality renderings.
for file in *.svg
do
	echo "$file"
	qlmanage -t -s 500 -o . "$file"
	convert "$file.png" -crop 500x1706+0+0 "$file.png"
done	

commit "automatic update: plots"

#git push

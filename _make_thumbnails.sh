for file in images/*.{jpg,png}; do
    echo $file
    [ ! -f "tn/$file" ] && convert "$file"  -thumbnail 160x160 "tn/$file"
done
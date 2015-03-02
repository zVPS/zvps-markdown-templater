input_name=$1;
output_name=${input_name%.*.*}
output_file_name="$output_name.html";

echo $input_name;
echo $output_name;
echo $output_file_name;

templ=$(<template.html)
value=$(<$1)

echo "Starting templater";

echo "${templ//__PLACEHOLDER__/$value}" > $output_file_name
rm -rf $input_name

echo "Generated templated version";

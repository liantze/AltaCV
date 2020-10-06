LOG_PREFIX="🐳 AltaCV:"

echo "${LOG_PREFIX} Setting up by placing /altacv/altacv.cls into /resume"
cp /altacv/altacv.cls /resume

echo "${LOG_PREFIX} Loaded files: "

echo "${LOG_PREFIX} Starting pdf generation"
bash /entrypoint.sh

echo "${LOG_PREFIX} Cleaning AltaCV"
rm -f /resume/altacv.cls

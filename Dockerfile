FROM marcellodesales/texlive-full-biber

LABEL vendor=Open-source \
      com.github.liantze/AltaCV.is-beta=false \
      com.github.liantze/AltaCV.is-production=true \
      com.github.liantze/AltaCV.version="1.0.0" \
      com.github.liantze/AltaCV.release-date="2020-10-05" \
      com.github.liantze/AltaCV.description="For liantze/AltaCV resumes"

COPY altacv.cls /altacv/altacv.cls
COPY entrypoint.sh /altacv/entrypoint.sh

WORKDIR /resume

ENTRYPOINT ["/usr/bin/bash", "/altacv/entrypoint.sh"]

FROM centos:7
MAINTAINER "H.Chen" <winghc@hotmail.com>
ENV container docker
RUN yum -y install openldap-clients nss-pam-ldapd postfix; yum clean all

# jira application
ADD atlassian /opt/atlassian

RUN useradd -r jira
RUN mkdir -p /var/atlassian/application-data/jira

RUN chown jira:root /opt/atlassian/jira/work /opt/atlassian/jira/logs /opt/atlassian/jira/temp -R
RUN chown jira /var/atlassian/application-data/jira -R

# Define data volumes
VOLUME ["/var/atlassian/application-data/jira", "/opt/atlassian/jira/logs" ]


EXPOSE 8080

#CMD ["/usr/sbin/init"]

CMD ["/opt/atlassian/jira/bin/catalina.sh", "run"]

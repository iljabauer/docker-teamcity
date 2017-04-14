#!/bin/bash
if [ -n "$DB_HOST" ]; then
	CONFIG_PATH="$TEAMCITY_DATA_PATH/config/database.properties"
	echo "$CONFIG_PATH"
	touch "$CONFIG_PATH"

	echo "connectionUrl=jdbc:postgresql://$DB_HOST/$DB_NAME" > "$CONFIG_PATH"
	echo "connectionProperties.user=$DB_USER" >> "$CONFIG_PATH"
	echo "connectionProperties.password=$DB_PASSWORD" >> "$CONFIG_PATH"
	echo "maxConnections=50" >> "$CONFIG_PATH"
	echo "testOnBorrow=false" >> "$CONFIG_PATH"
fi

cp /tmp/$JDBC_NAME $TEAMCITY_DATA_PATH/lib/jdbc/$JDBC_NAME
/opt/teamcity/TeamCity/bin/teamcity-server.sh run

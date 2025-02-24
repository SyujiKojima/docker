echo "Waiting for SQL Server to start..."
/opt/mssql/bin/sqlservr & MSSQL_PID=$!

while ! /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Passw0rd -Q "SELECT 1" > /dev/null 2>&1; do
  sleep 1
done
echo "SQL Server started."

echo "Initializing database..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Passw0rd -i /docker-initdb.d/init.sql
echo "Database initialized."

wait $MSSQL_PID

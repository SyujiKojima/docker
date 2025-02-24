IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'test_db')
BEGIN
  CREATE DATABASE test_db;
END
GO

USE test_db;
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = 'user' AND type = 'U')
BEGIN
  CREATE TABLE user(
    [id] INT NOT NULL IDENTITY(1,1)
    , [name] VARCHAR(MAX)
    , PRIMARY KEY(ID)
  );

  INSERT INTO user (name) VALUES('taro');
  INSERT INTO user (name) VALUES('jiro');
  INSERT INTO user (name) VALUES('saburo');
END
GO

IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250406174109_InitialCreate'
)
BEGIN
    CREATE TABLE [Booking] (
        [BookingID] int NOT NULL IDENTITY,
        [EventID] int NOT NULL,
        [VenueID] int NOT NULL,
        [CustomerID] int NOT NULL,
        [BookingDate] date NOT NULL,
        [Status] nvarchar(max) NULL,
        CONSTRAINT [PK_Booking] PRIMARY KEY ([BookingID])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250406174109_InitialCreate'
)
BEGIN
    CREATE TABLE [Event_] (
        [EventID] int NOT NULL IDENTITY,
        [VenueID] int NOT NULL,
        [EventName] nvarchar(max) NULL,
        [EventDate] datetime2 NOT NULL,
        [Description] nvarchar(max) NULL,
        CONSTRAINT [PK_Event_] PRIMARY KEY ([EventID])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250406174109_InitialCreate'
)
BEGIN
    CREATE TABLE [Venue] (
        [VenueID] int NOT NULL IDENTITY,
        [VenueName] nvarchar(250) NOT NULL,
        [Location] nvarchar(250) NOT NULL,
        [Capacity] int NOT NULL,
        [ImageURL] nvarchar(250) NOT NULL,
        CONSTRAINT [PK_Venue] PRIMARY KEY ([VenueID])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250406174109_InitialCreate'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250406174109_InitialCreate', N'9.0.0');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407164438_InitialCreate1'
)
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Booking]') AND [c].[name] = N'CustomerID');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Booking] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Booking] DROP COLUMN [CustomerID];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407164438_InitialCreate1'
)
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Booking]') AND [c].[name] = N'Status');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Booking] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Booking] DROP COLUMN [Status];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407164438_InitialCreate1'
)
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Venue]') AND [c].[name] = N'VenueName');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Venue] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [Venue] ALTER COLUMN [VenueName] nvarchar(max) NULL;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407164438_InitialCreate1'
)
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Venue]') AND [c].[name] = N'Location');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Venue] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [Venue] ALTER COLUMN [Location] nvarchar(max) NULL;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407164438_InitialCreate1'
)
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Venue]') AND [c].[name] = N'ImageURL');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [Venue] DROP CONSTRAINT [' + @var4 + '];');
    ALTER TABLE [Venue] ALTER COLUMN [ImageURL] nvarchar(max) NULL;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407164438_InitialCreate1'
)
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Booking]') AND [c].[name] = N'BookingDate');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [Booking] DROP CONSTRAINT [' + @var5 + '];');
    ALTER TABLE [Booking] ALTER COLUMN [BookingDate] datetime2 NOT NULL;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407164438_InitialCreate1'
)
BEGIN
    CREATE INDEX [IX_Event__VenueID] ON [Event_] ([VenueID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407164438_InitialCreate1'
)
BEGIN
    ALTER TABLE [Event_] ADD CONSTRAINT [FK_Event__Venue_VenueID] FOREIGN KEY ([VenueID]) REFERENCES [Venue] ([VenueID]) ON DELETE CASCADE;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407164438_InitialCreate1'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250407164438_InitialCreate1', N'9.0.0');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407212400_RenameTablesFix'
)
BEGIN
    ALTER TABLE [Event_] DROP CONSTRAINT [FK_Event__Venue_VenueID];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407212400_RenameTablesFix'
)
BEGIN
    ALTER TABLE [Venue] DROP CONSTRAINT [PK_Venue];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407212400_RenameTablesFix'
)
BEGIN
    ALTER TABLE [Event_] DROP CONSTRAINT [PK_Event_];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407212400_RenameTablesFix'
)
BEGIN
    ALTER TABLE [Booking] DROP CONSTRAINT [PK_Booking];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407212400_RenameTablesFix'
)
BEGIN
    EXEC sp_rename N'[Venue]', N'Venue_', 'OBJECT';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407212400_RenameTablesFix'
)
BEGIN
    EXEC sp_rename N'[Event_]', N'Event', 'OBJECT';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407212400_RenameTablesFix'
)
BEGIN
    EXEC sp_rename N'[Booking]', N'Booking_', 'OBJECT';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407212400_RenameTablesFix'
)
BEGIN
    EXEC sp_rename N'[Event].[IX_Event__VenueID]', N'IX_Event_VenueID', 'INDEX';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407212400_RenameTablesFix'
)
BEGIN
    ALTER TABLE [Venue_] ADD CONSTRAINT [PK_Venue_] PRIMARY KEY ([VenueID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407212400_RenameTablesFix'
)
BEGIN
    ALTER TABLE [Event] ADD CONSTRAINT [PK_Event] PRIMARY KEY ([EventID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407212400_RenameTablesFix'
)
BEGIN
    ALTER TABLE [Booking_] ADD CONSTRAINT [PK_Booking_] PRIMARY KEY ([BookingID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407212400_RenameTablesFix'
)
BEGIN
    ALTER TABLE [Event] ADD CONSTRAINT [FK_Event_Venue__VenueID] FOREIGN KEY ([VenueID]) REFERENCES [Venue_] ([VenueID]) ON DELETE CASCADE;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250407212400_RenameTablesFix'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250407212400_RenameTablesFix', N'9.0.0');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250501175826_AutoGeneratedPrimaryKeys'
)
BEGIN
    ALTER TABLE [Event] DROP CONSTRAINT [FK_Event_Venue__VenueID];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250501175826_AutoGeneratedPrimaryKeys'
)
BEGIN
    EXEC sp_rename N'[Booking_].[VenueID]', N'Venue_ID', 'COLUMN';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250501175826_AutoGeneratedPrimaryKeys'
)
BEGIN
    EXEC sp_rename N'[Booking_].[EventID]', N'Event_ID', 'COLUMN';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250501175826_AutoGeneratedPrimaryKeys'
)
BEGIN
    DECLARE @var6 sysname;
    SELECT @var6 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Event]') AND [c].[name] = N'VenueID');
    IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Event] DROP CONSTRAINT [' + @var6 + '];');
    ALTER TABLE [Event] ALTER COLUMN [VenueID] int NULL;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250501175826_AutoGeneratedPrimaryKeys'
)
BEGIN
    ALTER TABLE [Event] ADD [Venue_ID] int NOT NULL DEFAULT 0;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250501175826_AutoGeneratedPrimaryKeys'
)
BEGIN
    ALTER TABLE [Event] ADD CONSTRAINT [FK_Event_Venue__VenueID] FOREIGN KEY ([VenueID]) REFERENCES [Venue_] ([VenueID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250501175826_AutoGeneratedPrimaryKeys'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250501175826_AutoGeneratedPrimaryKeys', N'9.0.0');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    ALTER TABLE [Event] DROP CONSTRAINT [FK_Event_Venue__VenueID];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    DROP INDEX [IX_Event_VenueID] ON [Event];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    ALTER TABLE [Venue_] DROP CONSTRAINT [PK_Venue_];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    DECLARE @var7 sysname;
    SELECT @var7 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Event]') AND [c].[name] = N'VenueID');
    IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [Event] DROP CONSTRAINT [' + @var7 + '];');
    ALTER TABLE [Event] DROP COLUMN [VenueID];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    EXEC sp_rename N'[Venue_]', N'Venue', 'OBJECT';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    DECLARE @var8 sysname;
    SELECT @var8 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Venue]') AND [c].[name] = N'VenueName');
    IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [Venue] DROP CONSTRAINT [' + @var8 + '];');
    EXEC(N'UPDATE [Venue] SET [VenueName] = N'''' WHERE [VenueName] IS NULL');
    ALTER TABLE [Venue] ALTER COLUMN [VenueName] nvarchar(max) NOT NULL;
    ALTER TABLE [Venue] ADD DEFAULT N'' FOR [VenueName];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    DECLARE @var9 sysname;
    SELECT @var9 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Venue]') AND [c].[name] = N'Location');
    IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [Venue] DROP CONSTRAINT [' + @var9 + '];');
    EXEC(N'UPDATE [Venue] SET [Location] = N'''' WHERE [Location] IS NULL');
    ALTER TABLE [Venue] ALTER COLUMN [Location] nvarchar(max) NOT NULL;
    ALTER TABLE [Venue] ADD DEFAULT N'' FOR [Location];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    DECLARE @var10 sysname;
    SELECT @var10 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Venue]') AND [c].[name] = N'ImageURL');
    IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [Venue] DROP CONSTRAINT [' + @var10 + '];');
    EXEC(N'UPDATE [Venue] SET [ImageURL] = N'''' WHERE [ImageURL] IS NULL');
    ALTER TABLE [Venue] ALTER COLUMN [ImageURL] nvarchar(max) NOT NULL;
    ALTER TABLE [Venue] ADD DEFAULT N'' FOR [ImageURL];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    ALTER TABLE [Venue] ADD CONSTRAINT [PK_Venue] PRIMARY KEY ([VenueID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    CREATE INDEX [IX_Event_Venue_ID] ON [Event] ([Venue_ID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    CREATE INDEX [IX_Booking__Event_ID] ON [Booking_] ([Event_ID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    CREATE INDEX [IX_Booking__Venue_ID] ON [Booking_] ([Venue_ID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    ALTER TABLE [Booking_] ADD CONSTRAINT [FK_Booking__Event_Event_ID] FOREIGN KEY ([Event_ID]) REFERENCES [Event] ([EventID]) ON DELETE CASCADE;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    ALTER TABLE [Booking_] ADD CONSTRAINT [FK_Booking__Venue_Venue_ID] FOREIGN KEY ([Venue_ID]) REFERENCES [Venue] ([VenueID]) ON DELETE CASCADE;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    ALTER TABLE [Event] ADD CONSTRAINT [FK_Event_Venue_Venue_ID] FOREIGN KEY ([Venue_ID]) REFERENCES [Venue] ([VenueID]) ON DELETE CASCADE;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250504211010_SyntaxCorrections'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250504211010_SyntaxCorrections', N'9.0.0');
END;

COMMIT;
GO


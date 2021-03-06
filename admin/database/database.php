<?php
// Connect with database
function ConnectDB()
{
    try
    {
        $pdo = new PDO('mysql:host=localhost;dbname=hackathondenbosch', 'root', '');
    }
    catch(PDOException $e)
    {
        echo $e->getMessage();
    }
    return $pdo;
}

// Select from database
function selectDatabase($pdo, $tableName, $whereValue, $whereKey, $addon)
{
    $query = 'SELECT * FROM '.$tableName;
    if(!empty($whereValue))
    {
        $query .= ' WHERE '.$whereValue.' = "'.$whereKey.'" ';
    }
    $sth = $pdo->prepare($query.$addon);
    $sth->execute();
    return $sth;
}

// Insert into database
function insertDatabase($pdo, $tableName, $arrayValues)
{
    $query = 'INSERT INTO '.$tableName.' SET ';
    $i = 0;
    foreach($arrayValues as $key => $value)
    {
        if($i != 0)
        {
            $query .= ', ';
        }
        $query .= $key.' = "'.$value.'"';
        $i++;
    }
    $sth = $pdo->prepare($query);
    $sth->execute();
    $arrayValues = array();
    return $arrayValues;
}

// Update the database
function updateDatabase($pdo, $tableName, $whereValue, $whereKey, $arrayValues)
{
    $query = 'UPDATE '.$tableName.' SET ';
    $i = 0;
    foreach($arrayValues as $key => $value)
    {
        if($i != 0)
        {
            $query .= ', ';
        }
        $query .= $key.' = "'.$value.'"';
        $i++;
    }
    $query .= 'WHERE '.$whereValue.' = "'.$whereKey.'"';
    $sth = $pdo->prepare($query);
    $sth->execute();
    $arrayValues = array();
    return $arrayValues;
}

// Delete from database
function deleteDatabase($pdo, $tableName, $whereValue, $whereKey)
{
    $prepareParameters = array($parameters);
    $query = 'DELETE FROM '.$tableName;
    if(!empty($whereValue))
    {
        $query .= ' WHERE '.$whereValue.' = "'.$whereKey.'"';
    }
    $sth = $pdo->prepare($query);
    $sth->execute($prepareParameters);
}

////////////////////////////////////

// Save into favorite
function favoriteProduct($pdo, $location)
{
    if(isset($_POST['favorite_ID']))
    {
        $sth = selectDatabase($pdo, 'FAVORITES', '', '', 'ORDER BY favorite_ID DESC');
        $ID = -1;
        if($row = $sth->fetch())
        {
            $ID = $row['ID'];
        }
        $ID++;
        $arrayValues['favorite_ID'] = $ID;
        $arrayValues['product_ID'] = $_POST['favorite_ID'];
        $sth = insertDatabase($pdo, 'FAVORITES', $arrayValues);
        echo '<script>window.location.href = "'.$location.'";</script>';
    }
}
<?php
/**
 * The following functions are used by the extension engine to generate a new table
 * for the plugin / destroy it on removal.
 */


/**
 * This function is called on installation and is used to 
 * create database schema for the plugin
 */
function extension_install_gpresult()
{
    $commonObject = new ExtensionCommon;

    $commonObject -> sqlQuery(
        "CREATE TABLE gpresult (
        ID INTEGER NOT NULL AUTO_INCREMENT, 
        HARDWARE_ID INTEGER NOT NULL,
        NAME VARCHAR(255) DEFAULT NULL,
        RESULT VARCHAR(255) DEFAULT NULL,
        IDENTIFIER VARCHAR(255) DEFAULT NULL,
        DOMAIN VARCHAR(255) DEFAULT NULL,
        VERSIONDIRECTORY VARCHAR(255) DEFAULT NULL,
        VERSIONSYSVOL VARCHAR(255) DEFAULT NULL,
        ENABLED VARCHAR(255) DEFAULT NULL,
        ISVALID VARCHAR(255) DEFAULT NULL,
        FILTERALLOWED VARCHAR(255) DEFAULT NULL,
        ACCESSDENIED VARCHAR(255) DEFAULT NULL,
        SOMPATH VARCHAR(255) DEFAULT NULL,
        SOMORDER VARCHAR(255) DEFAULT NULL,
        APPLIEDORDER VARCHAR(255) DEFAULT NULL,
        LINKORDER VARCHAR(255) DEFAULT NULL,
        LINKENABLED VARCHAR(255) DEFAULT NULL,
        NOOVERRIDE VARCHAR(255) DEFAULT NULL,
        SECURITYFILTER VARCHAR(255) DEFAULT NULL,
        EXTENSIONNAME VARCHAR(255) DEFAULT NULL,
        PRIMARY KEY (ID,HARDWARE_ID)) ENGINE=INNODB;"
    );
}

/**
 * This function is called on removal and is used to 
 * destroy database schema for the plugin
 */
function extension_delete_gpresult()
{
    $commonObject = new ExtensionCommon;
    $commonObject -> sqlQuery("DROP TABLE IF EXISTS `gpresult`");
}

/**
 * This function is called on plugin upgrade
 */
function extension_upgrade_gpresult()
{

}

?>
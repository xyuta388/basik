<?php
namespace App\Configs;
use InvalidArgumentException;

class Config
{
    // Настройки подключения к БД
    const MYSQL_DNS = 'mysql:dbname=is221;host=localhost';
    const MYSQL_USER = 'root';
    const MYSQL_PASSWORD = '';   
    const TABLE_PRODUCTS = "products";
    const TABLE_ORDERS = "orders";
    
    // Режим хранения данных 
    const TYPE_FILE = "file";
    const TYPE_DB = "db";
    const STORAGE_TYPE = self::TYPE_DB;

    // Пути к файлам (исправлены на абсолютные/относительные пути)
    const FILE_PRODUCTS = __DIR__ . "/../storage/data.json"; 
    const FILE_ORDERS = __DIR__ . "/../storage/order.json"; 
    
    // Добавлен пропущенный `const` для SITE_URL
    const SITE_URL = "https://localhost/basik2";

    // Константы статусов (для PHP < 7.1 удалите модификатор `public`)
    public const CODE_STATUS = [
        "без статуса",
        "в работе",
        "завершен"
    ];
    
    public const STATUS_COLORS = [
        "text-muted",   // без статуса
        "text-warning", // в работе
        "text-success"  // завершен
    ];
    
    public static function getStatusName(int $code): string {
        if (isset(self::CODE_STATUS[$code])) {
            return self::CODE_STATUS[$code];
        }
        throw new InvalidArgumentException("Недопустимый код статуса: " . $code);
    }
    
    public static function getStatusColor(int $code): string {
        return self::STATUS_COLORS[$code] ?? "text-muted";
    }
}
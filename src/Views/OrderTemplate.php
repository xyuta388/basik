<?php

namespace App\Views;

use App\Views\BaseTemplate;

class OrderTemplate extends BaseTemplate{
    /*
        Формирование страница ""Создание заказа"
    */
    public static function getOrderTemplate(?array $products, float $all_sum, ?array $dataProfile): string {
        $template = parent::getTemplate();
        $title= 'Создание записи';
        $content = <<<CORUSEL
        <main class="row p-5">
            <h1 class="mb-5">Создание записи</h1>
            <h3>Список записей</h1>
        CORUSEL;
        $content .= self::getProductList($products);
        $content .= self::getSummaryInfo($all_sum, $dataProfile);
        $content .= "</main>";

        $resultTemplate =  sprintf($template, $title, $content);
        return $resultTemplate;
    }
        /*
        Отображение списка записей 
    */
    public static function getProductList(?array $products): string {
        $content= '';
        foreach ($products as $product) {
		    $name = $product['name'];
            $price = $product['price'];
		    $quantity = $product['quantity'];

            $sum = $price * $quantity;

            $content .= <<<HTML
                <div class="row">
                    <div class="col-5">
                    {$name}
                    </div>
                    <div class="col-3">
                    {$quantity} ед. x {$price} руб.
                    </div>
                    <div class="col-2">
                    {$sum} ₽
                    </div>
                </div>
            HTML;
	    }
        return $content;
    }
        /*
        Общие итоги под списком товаров заказа 
        (сумма заказа, кнопка очистки записи)
    */
    public static function getSummaryInfo(int $all_sum, ?array $dataProfile): string 
    {
        $content= '';
        if ($all_sum == 0) {
            $content .= <<<HTML
            <div class="row">
                <div class="col-12">
                - нет ближайщих записей -
                </div>
            </div>
            HTML;
        } else {
            $content .= <<<HTML
                <div class="row">
                    <hr>
                    <div class="col-5">
                        <strong>Общая сумма:</strong>
                    </div>
                    <div class="col-3">
                        &nbsp;
                    </div>
                    <div class="col-2">
                        <strong>{$all_sum} ₽</strong>
                    </div>
                </div>    

                <div class="row">
                    <div class="col-8">
                        &nbsp;
                    </div>
                    <div class="col-2 float-end">
                        <form action="/basik2/basket_clear" method="POST">
                            <button type="submit" class="btn btn-secondary mt-3">Очистить запись
                        </form>
                    </div>
                </div>    
            HTML;

            $content .= self::getFormUserInformation($dataProfile);
        }
        return $content;
    }

    /* 
        Форма для сбора данных от пользователя 
        для доставки (телефон, адрес,..)
    */
    public static function getFormUserInformation(?array $dataProfile): string {
        $username = (isset($dataProfile) && isset($dataProfile['username'])) ? $dataProfile['username'] : "";
        $email = (isset($dataProfile) && isset($dataProfile['email'])) ? $dataProfile['email'] : "";        
        $address = (isset($dataProfile) && isset($dataProfile['address'])) ? $dataProfile['address'] : "";
        $phone = (isset($dataProfile) && isset($dataProfile['phone'])) ? $dataProfile['phone'] : "";
        $html= <<<FORMA
                <h3>Данные для ресепшена</h1>
                <form action="/basik2/order" method="POST">
                    <div class="mb-3">
                        <label for="fioInput" class="form-label">Ваше имя (ФИО):</label>
                        <input type="text" name="fio" class="form-control" id="fioInput" required value="{$username}">
                    </div>
                    <div class="mb-3">
                        <label for="phoneInput" class="form-label">Телефон:</label>
                        <input type="text" name="phone" class="form-control" id="phoneInput" value="{$phone}">
                    </div>
                    <div class="mb-3">
                        <label for="emailInput" class="form-label">Емайл:</label>
                        <input type="email" name="email" class="form-control" id="emailInput" value="{$email}">
                    </div>                    
                    <button type="submit" class="btn btn-primary">Создать запись</button>
                </form>
        FORMA;
        return $html;
    }
}
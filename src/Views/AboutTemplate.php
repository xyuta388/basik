<?php
namespace App\Views;
use App\Views\BaseTemplate;

class AboutTemplate extends BaseTemplate {
    public static function getTemplate(): string {
        $template = parent::getTemplate();
        $title = 'О нас';
        $content = <<<HTML
        <h1>О нашем сайте</h1>
        <p>Погрузитесь в мир воды и свободы!</p>
        <p>Расслабление в каждом движении.</p>
        <h2>Наши преимущества:</h2>
        <ul>
            <li>Квалифицированные тренера</li>
            <li>Современные водные программы</li>
            <li>Практическая направленность обучения</li>
        </ul>
        <h5>Наш адрес</h5>
        <ul>
            <li>ул. Тухачевского, 32, Кемерово</li>
        </ul>
        <div style="position:relative;overflow:hidden;"><a href="https://yandex.ru/maps/org/kemerovskiy_kooperativny_tekhnikum/1018378103/?utm_medium=mapframe&utm_source=maps" style="color:#eee;font-size:12px;position:absolute;top:0px;">Кемеровский кооперативный техникум</a><a href="https://yandex.ru/maps/64/kemerovo/category/technical_college/184106244/?utm_medium=mapframe&utm_source=maps" style="color:#eee;font-size:12px;position:absolute;top:14px;">Техникум в Кемерове</a><a href="https://yandex.ru/maps/64/kemerovo/category/further_education/184106162/?utm_medium=mapframe&utm_source=maps" style="color:#eee;font-size:12px;position:absolute;top:28px;">Дополнительное образование в Кемерове</a><iframe src="https://yandex.ru/map-widget/v1/?ll=86.134680%2C55.334245&mode=poi&poi%5Bpoint%5D=86.133800%2C55.333985&poi%5Buri%5D=ymapsbm1%3A%2F%2Forg%3Foid%3D1018378103&z=19" width="560" height="400" frameborder="1" allowfullscreen="true" style="position:relative;"></iframe></div>
<img src="/pizza221/assets/images/KKT.png" alt="Карта" style="width: 100%; height: auto;">
(*) Сайт разработан в рамках обучения в "Кемеровском кооперативном техникуме" по специальности "Специалист по информационным технологиям"
HTML;
        $resultTemplate = sprintf($template, $title, $content);
        return $resultTemplate;
    }
}
?>
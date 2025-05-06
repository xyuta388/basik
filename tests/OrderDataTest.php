<?php  
use PHPUnit\Framework\TestCase;
use App\Services\ValidateOrderData;

class OrderDataTest extends TestCase 
{
    private ValidateOrderData $validator;

    protected function setUp(): void
    {
        parent::setUp();
        $this->validator = new ValidateOrderData();
    }

    /**
     * Тест корректных данных заказа
     */
    public function testValidOrderData(): void
    {
        $validData = [
            'customer_name' => 'Иван Петров',
            'email' => 'ivan@example.com',
            'phone' => '+79161234567',
            'address' => 'ул. Пушкина, д. 10',
            'items' => [
                ['product_id' => 1, 'quantity' => 2]
            ]
        ];

        $this->assertTrue($this->validator->validate($validData));
    }

    /**
     * Тест отсутствия обязательного поля (customer_name)
     */
    public function testMissingRequiredField(): void
    {
        $invalidData = [
            'email' => 'ivan@example.com',
            'items' => [['product_id' => 1]]
        ];

        $this->expectException(\InvalidArgumentException::class);
        $this->validator->validate($invalidData);
    }

    /**
     * Тест невалидного email
     */
    public function testInvalidEmail(): void
    {
        $invalidData = [
            'customer_name' => 'Иван Петров',
            'email' => 'invalid-email',
            'items' => [['product_id' => 1]]
        ];

        $this->expectException(\InvalidArgumentException::class);
        $this->validator->validate($invalidData);
    }

    /**
     * Тест пустой корзины товаров
     */
    public function testEmptyItems(): void
    {
        $invalidData = [
            'customer_name' => 'Иван Петров',
            'email' => 'ivan@example.com',
            'items' => []
        ];

        $this->expectException(\InvalidArgumentException::class);
        $this->validator->validate($invalidData);
    }
}
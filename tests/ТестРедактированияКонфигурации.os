///////////////////////////////////////////////////////////////////////////////
//
// Тестирование основной функциональности пакета
// Проверка на соответствие выгрузки эталону
//
// (с) BIA Technologies, LLC
//
///////////////////////////////////////////////////////////////////////////////

#Использовать "../src"
#Использовать logos
#Использовать asserts
#Использовать fs

///////////////////////////////////////////////////////////////////////////////

Перем Лог;

///////////////////////////////////////////////////////////////////////////////
// ПРОГРАММНЫЙ ИНТЕРФЕЙС
///////////////////////////////////////////////////////////////////////////////

Функция ПолучитьСписокТестов(Знач ЮнитТестирование) Экспорт

	Лог = Логирование.ПолучитьЛог("Тест");

	МассивТестов = Новый Массив;
	МассивТестов.Добавить("ТестДобавитьВКонфигурациюЭлементы");
	МассивТестов.Добавить("ТестУдалитьИзКонфигурацииЭлементы");
	МассивТестов.Добавить("ТестИзменитьКонфигурацию");

	Возврат МассивТестов;

КонецФункции

Процедура ПередЗапускомТеста() Экспорт

КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт

КонецПроцедуры

Процедура ТестДобавитьВКонфигурациюЭлементы() Экспорт
	
	КаталогКонфигурации = ОбъединитьПути(КаталогФикстур(), "configurations", "Demo_8_3_10");
	
	Конфигурация = РазборКонфигураций.ЗагрузитьКонфигурацию(КаталогКонфигурации);

	Для Каждого Справочник Из Конфигурация.ОписаниеКонфигурации().НайтиОбъектыПоТипу("Справочник") Цикл
		
		ЧтениеКонфигурации.ПрочитатьОписание(Справочник);
		
	КонецЦикла;
	
	НовыйОбъект = РазборКонфигураций.СоздатьОбъектКонфигурации("Справочник", "ТестовыйСправочник");
	Конфигурация.ДобавитьОбъект("Справочник", НовыйОбъект);
	
	Конфигурация.Зафиксировать();
	
КонецПроцедуры

///////////////////////////////////////////////////////////////////////////////
// СЛУЖЕБНЫЕ ПРОЦЕДУРЫ И ФУНКЦИИ
///////////////////////////////////////////////////////////////////////////////

Функция КаталогФикстур()
	
	Возврат ОбъединитьПути(ТекущийСценарий().Каталог, "common-fixtures");

КонецФункции

ТестДобавитьВКонфигурациюЭлементы();
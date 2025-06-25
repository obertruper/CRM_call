#!/usr/bin/env python3
"""
CRM Call Automation Script
Пример скрипта для автоматизации работы с CRM системой
"""

import os
import sys
import logging
import datetime
from pathlib import Path

# Настройка логирования
log_dir = Path(__file__).parent / "logs"
log_dir.mkdir(exist_ok=True)

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler(log_dir / f'crm_automation_{datetime.date.today()}.log'),
        logging.StreamHandler()
    ]
)

logger = logging.getLogger(__name__)


class CRMAutomation:
    """Класс для автоматизации работы с CRM"""
    
    def __init__(self):
        self.base_dir = Path(__file__).parent
        self.data_dir = self.base_dir / "data"
        self.data_dir.mkdir(exist_ok=True)
        
    def process_calls(self):
        """Обработка звонков"""
        logger.info("Начало обработки звонков")
        
        # Здесь добавьте логику обработки звонков
        # Например: получение данных из API, обработка файлов и т.д.
        
        logger.info("Обработка звонков завершена")
        
    def generate_report(self):
        """Генерация отчета"""
        logger.info("Генерация отчета")
        
        report_path = self.data_dir / f"report_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}.txt"
        
        with open(report_path, 'w', encoding='utf-8') as f:
            f.write(f"CRM Call Report - {datetime.datetime.now()}\n")
            f.write("="*50 + "\n")
            f.write("Автоматически сгенерированный отчет\n")
            # Добавьте здесь реальные данные отчета
            
        logger.info(f"Отчет сохранен: {report_path}")
        return report_path
        
    def cleanup_old_files(self, days_to_keep=7):
        """Очистка старых файлов"""
        logger.info(f"Очистка файлов старше {days_to_keep} дней")
        
        cutoff_date = datetime.datetime.now() - datetime.timedelta(days=days_to_keep)
        
        for file_path in self.data_dir.glob("*"):
            if file_path.is_file():
                file_modified = datetime.datetime.fromtimestamp(file_path.stat().st_mtime)
                if file_modified < cutoff_date:
                    file_path.unlink()
                    logger.info(f"Удален старый файл: {file_path.name}")
                    
    def run(self):
        """Основной метод запуска автоматизации"""
        try:
            logger.info("Запуск CRM автоматизации")
            
            # Выполнение основных задач
            self.process_calls()
            self.generate_report()
            self.cleanup_old_files()
            
            logger.info("CRM автоматизация успешно завершена")
            
        except Exception as e:
            logger.error(f"Ошибка при выполнении автоматизации: {e}")
            raise


def main():
    """Точка входа в программу"""
    automation = CRMAutomation()
    automation.run()


if __name__ == "__main__":
    main()
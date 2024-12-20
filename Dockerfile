# Використовуємо офіційний образ Ruby
FROM ruby:2.7

# Встановлюємо необхідні бібліотеки для роботи з Rails
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Встановлюємо глобально bundler
RUN gem install bundler:1.16.2

# Встановлюємо робочий каталог в контейнері
WORKDIR /app

# Копіюємо Gemfile та Gemfile.lock в контейнер
COPY Gemfile Gemfile.lock ./

# Встановлюємо залежності з Gemfile
RUN bundle install --without production

# Копіюємо всі файли проекту в контейнер
COPY . .

RUN rails db:migrate

# Відкриваємо порт 3000 для доступу до Rails
EXPOSE 3000

# Видаляємо PID-файл, якщо він існує, при кожному запуску
CMD ["sh", "-c", "rm -f /app/tmp/pids/server.pid && rails server -b 0.0.0.0"]


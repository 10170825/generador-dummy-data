require 'date'
require 'tk'
require 'csv'
require 'json'
require 'nokogiri'

$nombresRusos = ["Александр", "Михаил", "Иван", "Дмитрий", "Андрей", "Сергей", "Максим", "Артем", "Николай", "Алексей", "Денис", "Евгений", "Владимир", "Илья", "Павел", "Кирилл", "Александр", "Роман", "Егор", "Тимофей", "Даниил", "Олег", "Владислав", "Игорь", "Станислав", "Глеб", "Арсений", "Антон", "Виктор", "Федор", "Виталий", "Марк", "Василий", "Георгий", "Матвей", "Данила", "Вадим", "Семен", "Тимур", "Богдан", "Давид", "Макар", "Леонид", "Руслан", "Марат", "Михаил", "Ярослав", "Валентин", "Савелий", "Дмитрий", "Святослав", "Евгений", "Вячеслав", "Илья", "Валентин", "Алексей", "Михаил", "Никита", "Сергей", "Дмитрий", "Андрей", "Семен", "Артем", "Степан", "Денис", "Павел", "Григорий", "Роман", "Тимур", "Владислав", "Игорь", "Владимир", "Кирилл", "Дмитрий", "Николай", "Анатолий", "Филипп", "Сергей", "Артем", "Виталий", "Олег", "Михаил", "Александр", "Даниил", "Егор", "Иван", "Владимир", "Андрей", "Илья", "Валентин", "Константин", "Семен", "Петр", "Максим", "Давид", "Тимофей", "Станислав", "Алексей", "Борис"]
$nombresEspanol = ["Sofía", "Lucía", "Martina", "María", "Paula", "Julia", "Emma", "Valeria", "Daniela", "Alba", "Carla", "Sara", "Claudia", "Valentina", "Alma", "Ana", "Inés", "Carmen", "Laia", "Elena", "Luna", "Emma", "Adriana", "Aitana", "Vega", "Olivia", "Ainhoa", "Victoria", "Isabella", "Eva", "Marta", "Nora", "Ariadna", "Noa", "Leire", "Celia", "Julia", "Natalia", "Rocio", "Amaia", "Aina", "Irene", "Jimena", "Alicia", "Lola", "Carolina", "Iris", "Mireia", "Marina", "Laura", "Valeria", "Candela", "Ana", "Clara", "Celia", "Júlia", "Gala", "Iria", "Abril", "Leyre", "Naiara", "Elsa", "Blanca", "Irati", "Maia", "Zoe", "Lía", "Naia", "Elena", "Manuela", "Ayla", "Noelia", "Aroa", "Carla", "Gabriela", "Zaira", "Laia", "Lucía", "Ariadna", "Sara", "Yara", "Marta", "Diana", "Lara", "Mía", "Inés", "Ane", "Nerea", "Vera", "Olga"]
$nombresChino = ["Wang", "Li", "Zhang", "Liu", "Chen", "Yang", "Huang", "Wu", "Zhao", "Zhou", "Xu", "Sun", "Ma", "Zhu", "Hu", "Guo", "He", "Gao", "Lin", "Luo", "Zheng", "Liang", "Xie", "Song", "Tang", "Xu", "Han", "Feng", "Deng", "Cao", "Peng", "Zeng", "Xiao", "Tian", "Dong", "Yuan", "Pan", "Yu", "Jiang", "Cai", "Yu", "Du", "Ye", "Cheng", "Su", "Wei", "Lu", "Ding", "Ren", "Shen", "Yao", "Lu", "Jiang", "Cui", "Zhong", "Tan", "Lu", "Wang", "Fan", "Jin", "Shi", "Liao", "Jia", "Xia", "Wei", "Fu", "Fang", "Bai", "Zou", "Meng", "Xiong", "Qin", "Qiu", "Jiang", "Yin", "Xue", "Yan", "Duan", "Lei", "Li", "Shi", "Long", "Tao", "He", "Gu", "Mao", "Hao", "Gong", "Shao", "Wan"]
$nombresFrances = ["Léa", "Manon", "Chloé", "Emma", "Inès", "Jade", "Camille", "Sarah", "Louise", "Clara", "Lucas", "Louis", "Enzo", "Gabriel", "Arthur", "Raphaël", "Adam", "Hugo", "Jules", "Maël", "Léo", "Nathan", "Tom", "Noah", "Mathis", "Liam", "Ethan", "Sacha", "Paul", "Timéo", "Anaïs", "Alice", "Lina", "Eva", "Manon", "Julie", "Lisa", "Léna", "Zoé", "Lola", "Laura", "Charlotte", "Juliette", "Romane", "Mélissa", "Elise", "Éléna", "Éva", "Océane", "Louna", "Antoine", "Théo", "Lucas", "Tom", "Louis", "Mathis", "Hugo", "Nathan", "Raphaël", "Noah", "Ethan", "Léo", "Sacha", "Enzo", "Adam", "Maël", "Paul", "Jules", "Gabriel", "Liam", "Léa", "Chloé", "Manon", "Emma", "Inès", "Jade", "Louise", "Sarah", "Camille", "Clara", "Lucas", "Louis", "Gabriel", "Enzo", "Arthur", "Raphaël", "Tom", "Léo", "Hugo", "Jules", "Adam", "Maël", "Nathan", "Liam", "Sacha", "Paul", "Noah", "Théo", "Mathis", "Timéo"];
$apellidosRuso = ["Смирнов", "Іванов", "Кузнєцов", "Попов", "Васильєв", "Петров", "Соколов", "Михайлов", "Новиков", "Федоров", "Морозов", "Волков", "Алексєєв", "Лєбєдь", "Семєнов", "Егоров", "Павлов", "Козлов", "Стєпанов", "Ніколаєв", "Орлов", "Андрєєв", "Макаров", "Нікітін", "Захаров", "Зайцев", "Соловйов", "Бєлов", "Медведєв", "Яковлєв", "Галкін", "Романов", "Воробйов", "Кошелєв", "Сєргєєв", "Павлюченко", "Сорокін", "Дмитрієв", "Григорьєв", "Ткач", "Костюк", "Королєв", "Гусєв", "Титов", "Кузьмін", "Кудрявцєв", "Баранов", "Кулик", "Артемов", "Щербак", "Панов", "Беляєв", "Комаров", "Денисов", "Казаков", "Фролов", "Жуков", "Горбачов", "Фомін", "Дорофєєв", "Бєліков", "Бєлоусов", "Потапов", "Лихачов", "Тимофєєв", "Федосєєв", "Шишкін", "Шевченко", "Родін", "Єрмаков", "Дмитрієв", "Данилов", "Козак", "Михайлов", "Герасимов", "Мартинов", "Єршов", "Горшков", "Сидоров", "Рязанов", "Ємельянов", "Рябов", "Анісімов", "Кузьмін", "Корнєєв", "Ефімов", "Дьячков", "Кулаков", "Лаптєв", "Шилов", "Бородін", "Закіров", "Давидов", "Голубєв", "Антонов", "Тарасов", "Бєров", "Полєв", "Марков", "Ісаєв", "Потьомкін", "Самсонов", "Князєв", "Бєсєдін"]
$apellidosEspanol = ["García", "Fernández", "González", "Rodríguez", "López", "Martínez", "Sánchez", "Pérez", "Gómez", "Martín", "Jiménez", "Ruiz", "Hernández", "Díaz", "Moreno", "Muñoz", "Alonso", "Gutiérrez", "Romero", "Navarro", "Torres", "Domínguez", "Vargas", "Gil", "Ramos", "Serrano", "Blanco", "Molina", "Morales", "Suárez", "Ortega", "Delgado", "Castro", "Ortiz", "Rubio", "Marín", "Sanz", "Iglesias", "Medina", "Garrido", "Cortés", "Castillo", "Santos", "Lozano", "Guerrero", "Cano", "Prieto", "Méndez", "Cruz", "Gallego", "Vidal", "León", "Herrera", "Peña", "Flores", "Cabrera", "Campos", "Vega", "Fuentes", "Carrasco", "Diez", "Caballero", "Reyes", "Nieto", "Aguilar", "Pascual", "Santana", "Herrero", "Lorenzo", "Montero", "Hidalgo", "Giménez", "Ibáñez", "Ferrer", "Duran", "Santiago", "Vicente", "Benítez", "Mora", "Arias", "Vargas", "Carmona", "Crespo", "Román", "Pastor", "Soto", "Sáez", "Velasco", "Moya", "Soler", "Parra", "Esteban", "Bravo", "Gallardo", "Rojas"]
$apellidosChino = ["Li", "Wang", "Zhang", "Liu", "Chen", "Yang", "Huang", "Zhao", "Wu", "Zhou", "Xu", "Sun", "Ma", "Zhu", "Hu", "Guo", "He", "Lin", "Gao", "Luo", "Zheng", "Song", "Han", "Tang", "Feng", "Yu", "Dong", "Xiao", "Cheng", "Cao", "Yuan", "Deng", "Wei", "Jiang", "Fu", "Bian", "Xie", "Shen", "Ye", "Xu", "Zeng", "Cai", "Peng", "Chang", "Pan", "Qi", "Lu", "Xiang", "Cui", "Wang", "Pei", "Fan", "Hong", "Zou", "Li", "He", "Liu", "Wei", "Jing", "Jian", "Hui", "Shi", "Yan", "Jia", "Tian", "Jiang", "Qi", "Shao", "Yi", "Xuan", "Du", "Bao", "Min", "Lou", "Kuang", "Piao", "Lei", "Geng", "Lu", "Ci", "Bai", "Chen", "Qian", "Yue", "Yin", "Ning", "Kan", "Lan", "Lin", "Yan", "Xiong", "Za", "Shi", "Ru", "Gong", "Meng", "Ao", "Pi", "Xie", "Zha"]
$apellidosFrances = ["Martin", "Bernard", "Dubois", "Thomas", "Robert", "Richard", "Petit", "Durand", "Leroy", "Moreau", "Simon", "Laurent", "Lefebvre", "Michel", "Garcia", "David", "Bertrand", "Roux", "Vincent", "Fournier", "Morel", "Girard", "Andre", "Lefevre", "Mercier", "Dupont", "Lambert", "Bonnet", "Francois", "Martinez", "Legrand", "Garnier", "Faure", "Rousseau", "Blanc", "Guerin", "Muller", "Henry", "Roussel", "Nicolas", "Perrin", "Morin", "Mathieu", "Clement", "Gauthier", "Dumont", "Lopez", "Fontaine", "Chevalier", "Robin", "Masson", "Sanchez", "Gerard", "Nguyen", "Boyer", "Denis", "Lemaire", "Duval", "Joly", "Gautier", "Roger", "Roche", "Roy", "Noel", "Meyer", "Lucas", "Meunier", "Jean", "Pierre", "Colin", "Hubert", "Renard", "Marchand", "Rey", "Perez", "Leclerc", "Guillaume", "Lacroix", "Brun", "Picard", "Poirier", "Gaillard", "Barbier", "Rolland", "Benoit", "Schmitt", "Vidal", "Leclercq", "Paris", "Maillard", "Jacquet", "Vasseur", "Legros", "Barreau", "Chapuis", "Berger"]

valores_idiomas = {
    "Ruso" => 1,
    "Español" => 2,
    "Chino" => 3,
    "Francés" => 4
}
idiomas = valores_idiomas.keys

def generar (numeroRegistros, seleccionApellido1, seleccionApellido2, seleccionNombre)
    alumnos = "";
    apellido1 = ""
    apellido2 = ""
    nombre = ""
    for i in 1..numeroRegistros
        case seleccionApellido1
        when 1
            apellido1 = $apellidosRuso.sample
        when 2
            apellido1 = $apellidosEspanol.sample
        when 3
            apellido1 = $apellidosChino.sample
        when 4
            apellido1 = $apellidosFrances.sample
        end

        case seleccionApellido2
        when 1
            apellido2 = $apellidosRuso.sample
        when 2
            apellido2 = $apellidosEspanol.sample
        when 3
            apellido2 = $apellidosChino.sample
        when 4
            apellido2 = $apellidosFrances.sample
        end

        case seleccionNombre
        when 1
            nombre = $nombresRuso.sample
        when 2
            nombre = $nombresEspanol.sample
        when 3
            nombre = $nombresChino.sample
        when 4
            nombre = $nombresFrances.sample
        end
        expediente = 220120000 + i
        fechaRandom = DateTime.new(1980, 1, 1) + rand * (DateTime.new(2005) - DateTime.new(1980, 1, 1))
        fechaNacimiento = fechaRandom.strftime("%Y-%m-%d")
        alumnos += "#{expediente}, #{apellido1}, #{apellido2}, #{nombre}, a#{expediente}@unison.mx, #{fechaNacimiento}"
        alumnos += "\n" unless i == numeroRegistros
    end
    return alumnos
end

def generar_lista(alumnos_str)
    alumnos = []
    alumnos_str.each_line do |linea|
        datos = linea.chomp.split(', ')
        alumnos << {
            expediente: datos[0],
            apellido1: datos[1],
            apellido2: datos[2],
            nombre: datos[3],
            email: datos[4],
            fecha_nacimiento: datos[5]
        }
    end
    return alumnos
end

def exportar_csv (alumnos_str)
    alumnos = generar_lista(alumnos_str)
    csv_string = CSV.generate do |csv|
        csv << alumnos.first.keys
        alumnos.each do |alumno|
            csv << alumno.values
        end
    end
    File.open("resultado.csv", "w") { |file| file.write(csv_string) }
end

def exportar_json (alumnos_str)
    alumnos = generar_lista(alumnos_str)
    json_string = JSON.pretty_generate(alumnos)
    File.open("resultado.json", "w") { |file| file.write(json_string) }
end

def exportar_xml (alumnos_str)
    alumnos = generar_lista(alumnos_str)
    builder = Nokogiri::XML::Builder.new do |xml|
        xml.alumnos {
            alumnos.each do |alumno|
                xml.alumno {
                    alumno.each do |key, value|
                        xml.send(key, value)
                    end
                }
            end
        }
    end
    File.open("resultado.xml", "w") { |file| file.write(builder.to_xml) }
end

def exportar_sql (alumnos_str)
    alumnos = generar_lista(alumnos_str)
    File.open("resultado.sql", "w") do |file|
        file.puts "CREATE DATABASE IF NOT EXISTS evento;"
        file.puts "USE evento;"
        file.puts "CREATE TABLE IF NOT EXISTS alumnos (expediente INT NOT NULL, apellido1 VARCHAR(255) NOT NULL, apellido2 VARCHAR(255) NOT NULL, nombre VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL, fecha_nacimiento DATE NOT NULL);"
        alumnos.each do |alumno|
            file.puts "INSERT INTO alumnos (expediente, apellido1, apellido2, nombre, email, fecha_nacimiento) VALUES (#{alumno[:expediente]}, '#{alumno[:apellido1]}','#{alumno[:apellido2]}', '#{alumno[:nombre]}', '#{alumno[:email]}', #{alumno[:fecha_nacimiento]});"
        end
    end
end

root = TkRoot. new { title "Generador de dummy data" }

TkLabel.new(root) do
    text "Numero de registros:"
    pack(pady: 10, padx: 15)
end
$numRegistros = TkEntry.new(root) do
    pack(pady: 10, padx: 10)
end

TkLabel.new(root) do
    text "Apellido 1:"
    pack(pady: 10, padx: 10)
end
$apellido1 = Tk::Tile::Combobox. new(root) do
    values idiomas
    state 'readonly'
    pack(pady: 10, padx: 10)
end

TkLabel.new(root) do
    text "Apellido 2:"
    pack(pady: 10, padx: 10)
end
$apellido2 = Tk::Tile::Combobox. new(root) do
    values idiomas
    state 'readonly'
    pack(pady: 10, padx: 10)
end

TkLabel.new(root) do
    text "Nombre:"
    pack(pady: 10, padx: 10)
end
$nombre = Tk::Tile::Combobox. new(root) do
    values idiomas
    state 'readonly'
    pack(pady: 10, padx: 10)
end

TkButton. new(root) do
    text "Generar"
    command proc { 
        resultado = generar($numRegistros.get.to_i, valores_idiomas[$apellido1.get], valores_idiomas[$apellido2.get], valores_idiomas[$nombre.get])
        $textarea.state('normal')
        $textarea.insert('end', resultado)
        $textarea.state('disabled')
    }
    pack(pady: 15, padx: 10)
end

$textarea = TkText. new(root) do
    width 80
    height 10
    state 'disabled'
    pack(pady: 5, padx: 20)
end

TkLabel.new(root) do
    text "Exportar:"
    pack(pady: 5, padx: 5)
end

botones = TkFrame.new(root).pack(pady: 5, padx: 15)

TkButton.new(botones) do
    text "CSV"
    command proc {
        exportar_csv($textarea.get('1.0', 'end'))
    }
    pack(side: 'left', padx: 5)
end

TkButton.new(botones) do
    text "JSON"
    command proc {
        exportar_json($textarea.get('1.0', 'end'))
    }
    pack(side: 'left', padx: 5)
end

TkButton.new(botones) do
    text "SQL"
    command proc {
        exportar_sql($textarea.get('1.0', 'end'))
    }
    pack(side: 'left', padx: 5)
end

TkButton.new(botones) do
    text "XML"
    command proc {
        exportar_xml($textarea.get('1.0', 'end'))
    }
    pack(side: 'left', padx: 5)
end

Tk.mainloop
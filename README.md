# The area of the object through the photo
Determining the area of a physical object from a photo
![Screenshot](Screenshot.png)
This algorithm allows to measure the area of physical objects based on photos of a green-colored object (optional). The main project file Where_is_leaf.m implements various machine vision methods for image analysis.
The principle is based on machine vision and anchoring the object to a preknown coordinate system. 

## Description of the experiment
A frame is drawn on a sheet of paper with the sides known in advance. Inside the frame is an object of green color. Proportionally from the coordinate system of the camera, we move to the coordinate system of the sheet and determine the area of the object.
Determining the area of the object starts by loading the image, then the algorithm selects an object (e.g., a green leaf) based on color information (using the RGB palette), and determines the maximum frame around the object. Finally, it calculates the object area in square millimeters based on pixels, using a pixels per millimeter (PPM) ratio determined based on the known frame size in advance.

## Execution Conditions
To determine the leaf area using the Where_is_leaf.m code, you need to perform the following steps:
1. Object preparation:
* Select the green leaf or other object you want to measure. Make sure it is placed on a flat surface.
2. Creating the frame:
* On the paper, draw a frame of a known size (e.g., 100 mm x 100 mm). This will allow you to properly reference the dimensions in pixels to the actual dimensions.
3. Capturing the image:
* Place the prepared
4. Loading an image into the program:
* Replace 'leaf.jpg' in the code with the name of your image.
File leaf.jpg to recognize the area of the physical object.
File test.jpg to check if the area is recognized correctly on the primitive.

## Key Functions
The Where_is_leaf.m algorithm written in matlab uses several key MATLAB functions, including:
* imread: Loads an image for analysis.
* imbinarize: Converts a color image to black and white for further analysis.
* bwconncomp: Finds related components (in this case, objects) in a binary image.
* regionprops: Determines the properties (e.g., boundaries) of detected objects, which allows you to find the size of the frame around the sheet.
* imshow: Displays images, which is useful for visually inspecting results.

# Определение площади объекта на фотографии
Данный алгоритм позволяет измерять площадь физических объектов, основываясь на фотографиях объекта зеленого цвета (опционально). Главный файл проекта Where_is_leaf.m реализует различные методы машинного зрения для анализа изображений.
Принцип основан на машинном зрении и привязывании объекта к заранее известной системе координат. 

## Описание опыта
На бумажном листе рисуется рамка с заранее известными сторонами. Внутри рамки находится объект зеленого цвета. Пропорционально из системы координат камеры, переходим в систему координат листа и определяем площадь объекта.
Определение площади объекта начинается с загрузки изображения, затем алгоритм выделяет объект (например, зеленый лист) на основе цветовой информации (используя палитру RGB), и определяет максимальную рамку вокруг объекта. В завершение рассчитывается площадь объекта в квадратных миллиметрах, основываясь на пикселях, используя коэффициент соотношения пиксели на миллиметр (PPM), определенный на основе заранее известного размера рамки.

## Условия выполнения
Для определения площади листа с помощью кода Where_is_leaf.m, вам необходимо выполнить следующие шаги:
1. Подготовка объекта:
* Выберите зеленый лист или другой предмет, который вы хотите измерить. Убедитесь, что он располагается на ровной поверхности.
2. Создание рамки:
* На бумаге нарисуйте рамку известного размера (например, 100 мм x 100 мм). Это позволит правильно привязать размеры в пикселях к реальным размерам.
3. Съемка изображения:
* Разместите подготовленный объект внутри рамки и сфотографируйте его парралельно листу. Убедитесь, что фото сделано с достаточным освещением, чтобы минимизировать тени и искажения.
4. Загрузка изображения в программу:
* Замените 'leaf.jpg' в коде на имя вашего изображения.
Файл leaf.jpg для распознавания площади физического объекта.
Файл test.jpg для проверки правильного распознавания площади на примитиве.

## Ключевые функций
В алгоритме Where_is_leaf.m, написанным на языке matlab, используются несколько ключевых функций MATLAB, включая:
* imread: Загружает изображение для анализа.
* imbinarize: Преобразовывает цветное изображение в черно-белое для дальнейшего анализа.
* bwconncomp: Находит связанные компоненты (в данном случае, объекты) в бинарном изображении.
* regionprops: Определяет свойства (например, границы) обнаруженных объектов, что позволяет находить размер рамки вокруг листа.
* imshow: Отображает изображения, что полезно для визуальной проверки результатов.


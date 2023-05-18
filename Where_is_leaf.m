image = imread('leaf.jpg');
sizeim = size(image(:,:,1));

%% Способ 1, палитра RGB, отмечаем пиксели, когда R < G > B
%% Ищем лист
leafmask = find( image(:,:,1) < image(:,:,2) & image(:,:,3) < image(:,:,2)); % в цикле из 1000+ итераций рекомендуется упростить данное выражение, например, сменить палитру)))
% Изображение с выделенным листом
imageleaf = zeros(sizeim) + 255;
imageleaf(leafmask) = 0;

%% Ищем рамку, преобразуем изображение в оттенки серого
bw_img = imbinarize(image);
cc = bwconncomp(bw_img);
% Нахождение прямоугольников на изображении
props = regionprops(cc, 'BoundingBox');
max_area = 0; % максимальная площадь найденого прямоугольника
model_box = []; % [X Y width height]
% Поиск наибольшей прямоугольной рамки рамки
for i = 1:length(props)
    % Определение ширины и высоты рамки
    % Иногда, код возвращает шинину рамки, 
    % ЭТО параметры [X Y border_width width height border_height]
    % Можно их проигнорировать или учесть. В данном примере их
    % проигнорируем
    if(length(props(i).BoundingBox) == 4)
        width = props(i).BoundingBox(3);
        height = props(i).BoundingBox(4);
    else
        width = props(i).BoundingBox(4);
        height = props(i).BoundingBox(5);
    end
    % Если рамка имеет наибольшую площадь среди всех рамок, но не больше
    % фона 
    if  width*height > max_area && width*height < prod(sizeim) - 10
        max_area = width*height;
        model_box = [props(i).BoundingBox(1:2) width height];
    end
end
%% Визуализация, проверим, хорошо ли алгоритм определил лист и рамку
% Оставим только область внутри рамки
imshow(imageleaf);
model_box = round(model_box);
imageleaf = imageleaf(model_box(2):model_box(2)+model_box(4), model_box(1):model_box(1)+model_box(3));
model_box(1:2) = 0;
imshow(imageleaf);

%% Преобразования
% резмер прямоугольника в реальном мире в мм. [X Y width height]
real_box = [0 0 100 100];
% Определим PPM - Pixels per mm
diagonal_px = sqrt(model_box(3)^2 + model_box(4)^2);
diagonal_mm = sqrt(real_box(3)^2 + real_box(4)^2);
PPM = diagonal_px / diagonal_mm;

sumpx = sum(sum(imageleaf == 0));
disp(['Коэффициент PPM равен ' num2str(PPM) '.']);
disp(['Площадь листа равна ' num2str(sumpx/PPM) ' мм.']);




En un primer momento había pensado en un modelo en el que solo había blocks y estos contenían toda la información, pero luego eso me trajo algunos problemas en cuanto a las revisiones (buscar todas las revisiones de un block, saber cual era la ultima), por eso busque otra implementación y ahí es que hice la separación en block y revisión que me pareció lo mas ordenado.
Para el tema de poner en la vista del block atributos de la revisión vi un railcast (http://media.railscasts.com/videos/196_nested_model_form_part_1.mov) pero luego esto me complicaba un poco las cosas, entonces opte porutilizar un método virtual en la clase block para generar la revisión. ( saque la idea de http://railscasts.com/episodes/16-virtual-attributes).

Para el tema de que los blocks tenían que poder ser editados o borrados por su creador lo que utilice fue el sesión_id para saber de quien era el block.

Para el tema de paginacion utilize la gema will_paginate.

Para los tests utilicé "stories", una gema que me recomendó Emiliano.

Con respecto al diseño de la aplicación hice lo que pude.


Startup
=======

Luego de crear la base de datos, y hacer las migrations correspondientes, hay que correr

    rake bootstrap:all

Para poder cargar los datos iniciales.

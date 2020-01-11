<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://checkout.culqi.com/js/v3"></script>
    <title>Culqui Test</title>
</head>
<body>
    <h2>Culqui Test</h2>
    
    <button id="comprar">
        Comprar
    </button>

    <form action="buy" id="send" method="POST">
        <input type="hidden" name="_token" value="" id="token">
    </form>
    
    <script>
        function culqi() {
            console.log("asdsadsa");
            if (Culqi.token) { // ¡Objeto Token creado exitosamente!
                var token = Culqi.token.id;
                $("#token").val(token);
                console.log($("#token").val())
                alert('Se ha creado un token:' + token);
                
                $("#send").submit();

                //En esta linea de codigo debemos enviar el "Culqi.token.id"
                //hacia tu servidor con Ajax
            } else { // ¡Hubo algún problema!
                // Mostramos JSON de objeto error en consola
                console.log(Culqi.error);
                alert(Culqi.error.user_message);
            }
        };
        Culqi.publicKey = 'pk_test_juKtZ4MFGEHRVGdl'
        Culqi.settings({
            title: 'Culqi Store',
            currency: 'PEN',
            description: 'Polo/remera Culqi lover',
            amount: 3500
        });

        $('#comprar').on('click', function(e) {
            // Abre el formulario con la configuración en Culqi.settings
            Culqi.open();
            e.preventDefault();
        });

    </script>
</body>
</html>
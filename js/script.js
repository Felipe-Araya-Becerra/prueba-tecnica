$(document).ready(function () {
  $.ajax({
    url: "php/get_data.php",
    method: "GET",
    dataType: "json",
    success: function (data) {
      var regionesSelect = $("#region");
      data.regiones.forEach(function (region) {
        regionesSelect.append(
          $("<option>", {
            value: region.id,
            text: region.nombre,
          })
        );
      });

      var candidatosSelect = $("#candidato");
      data.candidatos.forEach(function (candidato) {
        candidatosSelect.append(
          $("<option>", {
            value: candidato.id,
            text: candidato.nombre,
          })
        );
      });

      var comunas = data.comunas;

      $("#region").on("change", function () {
        var regionId = $(this).val();
        var comunasSelect = $("#comuna");
        comunasSelect.empty();

        var filteredComunas = comunas.filter(function (comuna) {
          return comuna.region_id == regionId;
        });

        filteredComunas.forEach(function (comuna) {
          comunasSelect.append(
            $("<option>", {
              value: comuna.id,
              text: comuna.nombre,
            })
          );
        });
      });
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.error("Error:", textStatus, errorThrown);
    },
  });

  $("#submitVote").on("click", function () {
    var formData = $("#votingForm").serialize();

    if (!validarRut($("#rut").val())) {
      alert("El RUT ingresado no es válido.");
      return;
    }

    if (!validarEmail($("#email").val())) {
      alert("El correo electrónico ingresado no es válido.");
      return;
    }

    if ($(".limited-checkbox:checked").length < 2) {
      alert("Debe elejir al menos 2 opciones.");
      return;
    }

    $.ajax({
      url: "php/vote.php",
      type: "POST",
      data: formData,
      success: function (response) {
        $("#voteResult").html(response);
        $("#votingForm")[0].reset();
        $("#columnas").val("Seleccione una comuna");
      },
      error: function () {
        $("#voteResult").html("Hubo un error al enviar el formulario.");
      },
    });
  });

  function validarRut(rut) {
    if (!/^[0-9]+-[0-9kK]{1}$/.test(rut)) return false;

    var tmp = rut.split("-");
    var dv = tmp[1];
    var rut = tmp[0];

    if (dv === "K") dv = "k";

    var M = 0,
      S = 1;
    for (; rut; rut = Math.floor(rut / 10))
      S = (S + (rut % 10) * (9 - (M++ % 6))) % 11;
    return S ? S - 1 === parseInt(dv) : "k" === dv;
  }

  function validarEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
  }
});

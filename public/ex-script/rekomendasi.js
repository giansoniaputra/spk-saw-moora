$(document).ready(function () {
    $("#search-rekomendasi").on("click", function () {
        let form = $('form[id="form-rekomendasi"]').serialize();
        let formArray = $('form[id="form-rekomendasi"]').serializeArray();
        formArray.map((a) => {
            if (a.value == "") {
                Swal.fire("Warning!", "Silahkan Isi Semua Field", "warning");
            }
        })
        $("#spinner").html(loader)
        $.ajax({
            data: form,
            url: "/moora-normalisasi-user",
            type: "GET",
            dataType: 'json',
            success: function (response) {
                // console.log(transposedMatrix);
                // Membuat tabel HTML
                let rangking = [];
                response.hasil.map((a) => {
                    if (a[0] == 'Pilihan Anda') {
                        let nilai = a[1];
                        response.hasil.map((b) => {
                            if (nilai > b[1]) {
                                rangking.push(b[0])
                            }
                        })
                    }
                })
                $("#spinner").html("")
                if (rangking[0] == undefined) {
                    Swal.fire("Sayang Sekali", "Tidak ada rekomendasi dari data yang anda masukan", "warning");
                } else {
                    Swal.fire("Kost " + rangking[0], "Adalah rekomendasi kost terbaik", "success");
                }
                let table3 = `<div class="row">
                                        <div class="col-sm-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h2>No</h2>
                                                    <h2>Daftar Kost</h2>
                                                </div>
                                            <div class="card-body">
                                                <table class='table table-bordered table-hover dtr-inline'>
                                                    <tr>
                                                    </tr>
                                                    <tbody>
                                                    `
                response.hasil.map((a, b) => {
                    if (a[0] != rangking[0]) {

                        if (a[0] == "Pilihan Anda") {
                            let nilai = a[1];
                            response.hasil.map((b) => {
                                if (nilai > b[1]) {
                                    keterangan = `<span class="text-info">${rangking[0]}</span>`
                                }
                            })
                        } else {
                            var keterangan = `<span>${a[0]}</span>`
                        }
                        table3 += `<tr>
                        <td>${b + 1}</td>
                        <td>${keterangan}</td>
                        </tr>
                        `
                    }
                });
                table3 += "</tbody></table></div></div></div></div></div></div>";

                $("#rangking").html(table3);
            }
        })
    })
});
// KEPUTUSAN

// Fungsi untuk mentranspose matriks
function transpose(matrix) {
    return matrix[0].map((col, i) => matrix.map(row => row[i]));
}

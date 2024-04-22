<?php

namespace App\Http\Controllers;

use App\Models\Kriteria;
use App\Models\Alternatif;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Models\PerhitunganMoora;
use Illuminate\Support\Facades\DB;

class PerhitunganMooraController extends Controller
{
    public function index()
    {
        $data = [
            'title' => 'Perhitungan MOORA',
            'mooras' => DB::table('perhitungan_mooras as a')
                ->join('alternatifs as b', 'a.alternatif_uuid', '=', 'b.uuid')
                ->select('a.*', 'b.alternatif', 'b.keterangan')
                ->orderBy('b.alternatif', 'asc'),
            'kriterias' => Kriteria::orderBy('kode', 'asc')->get(),
            'alternatifs' => Alternatif::orderBy('alternatif', 'asc')->get(),
            'sum_kriteria' => Kriteria::count('id'),
        ];
        return view('moora.index', $data);
    }

    public function index_saw()
    {
        $data = [
            'title' => 'Perhitungan SAW',
            'mooras' => DB::table('perhitungan_mooras as a')
                ->join('alternatifs as b', 'a.alternatif_uuid', '=', 'b.uuid')
                ->select('a.*', 'b.alternatif', 'b.keterangan')
                ->orderBy('b.alternatif', 'asc'),
            'kriterias' => Kriteria::orderBy('kode', 'asc')->get(),
            'alternatifs' => Alternatif::orderBy('alternatif', 'asc')->get(),
            'sum_kriteria' => Kriteria::count('id'),
        ];
        return view('saw.index', $data);
    }

    public function create()
    {
        $cek = PerhitunganMoora::first();
        if (!$cek) {
            $kriterias = Kriteria::orderBy('kode', 'asc')->get();
            $alternatifs = Alternatif::orderBy('alternatif', 'asc')->get();
            foreach ($alternatifs as $alternatif) {
                foreach ($kriterias as $kriteria) {
                    $data = [
                        'uuid' => Str::orderedUuid(),
                        'alternatif_uuid' => $alternatif->uuid,
                        'kriteria_uuid' => $kriteria->uuid,
                        'bobot' => 0
                    ];
                    PerhitunganMoora::create($data);
                }
            }
            return response()->json(['success' => 'Perhitungan Baru Berhasil Ditambahkan! Silahkan Masukan Nilainya']);
        } else {
            $kriterias = Kriteria::orderBy('kode', 'asc')->get();
            $alternatifs = Alternatif::orderBy('alternatif', 'asc')->get();
            foreach ($alternatifs as $alternatif) {
                $query = PerhitunganMoora::where('alternatif_uuid', $alternatif->uuid)->first();
                if (!$query) {
                    foreach ($kriterias as $kriteria) {
                        $data = [
                            'uuid' => Str::orderedUuid(),
                            'alternatif_uuid' => $alternatif->uuid,
                            'kriteria_uuid' => $kriteria->uuid,
                            'bobot' => 0
                        ];
                        PerhitunganMoora::create($data);
                    }
                }
            }
            foreach ($kriterias as $kriteria) {
                $query = PerhitunganMoora::where('kriteria_uuid', $kriteria->uuid)->first();
                if (!$query) {
                    foreach ($alternatifs as $alternatif) {
                        $data = [
                            'uuid' => Str::orderedUuid(),
                            'alternatif_uuid' => $alternatif->uuid,
                            'kriteria_uuid' => $kriteria->uuid,
                            'bobot' => 0
                        ];
                        PerhitunganMoora::create($data);
                    }
                }
            }
            return response()->json(['success' => 'Perhitungan Baru Berhasil Ditambahkan! Silahkan Masukan Nilainya']);
        }
    }

    public function update(PerhitunganMoora $moora, Request $request)
    {
        PerhitunganMoora::where('uuid', $moora->uuid)->update(['bobot' => $request->bobot]);
        return response()->json(['success' => $request->bobot]);
    }

    public function normalisasi()
    {
        $array_pembilang = [];
        $array_pembagi = [];
        $count_alternatif = Alternatif::count('id');
        $kriterias = Kriteria::orderBy('kode', 'asc')->get();
        $alternatifs = Alternatif::orderBy('alternatif', 'asc')->get();
        foreach ($kriterias as $kriteria) {
            foreach ($alternatifs as $alternatif) {
                $query = PerhitunganMoora::where('alternatif_uuid', $alternatif->uuid)->where('kriteria_uuid', $kriteria->uuid)->first();
                $array_pembagi[] = pow($query->bobot, 2);
                $array_pembilang[] = $query->bobot;
            }
        }
        $kuadrat = array_chunk($array_pembagi, $count_alternatif);
        $pembilang = array_chunk($array_pembilang, $count_alternatif);
        $pembagi = [];
        foreach ($kuadrat as $row) {
            $jumlah = array_sum($row);
            $akarKuadrat = floatval(number_format(sqrt($jumlah), 3));
            $pembagi[] = $akarKuadrat;
        }
        $hasil = [];
        foreach ($pembilang as $row => $val) {
            $hasil[$row] = array_map(function ($value) use ($row, $pembagi) {
                return floatval(number_format($value / $pembagi[$row], 3));
            }, $val);
        }
        return response()->json(['hasil' => $hasil]);
    }
    public function normalisasi_user(Request $request)
    {
        $array_pembilang = [];
        $array_pembagi = [];
        $count_alternatif = Alternatif::count('id');
        $kriterias = Kriteria::orderBy('kode', 'asc')->get();
        $alternatifs = Alternatif::orderBy('alternatif', 'asc')->get();
        $mooras = PerhitunganMoora::all();
        $last_id = Alternatif::orderBy('alternatif', 'desc')->first();
        $last_id_moora = PerhitunganMoora::orderBy('id', 'desc')->first();
        // MENAMBAH ALTERNATIF BARU
        $newRecord = new Alternatif();
        $newRecord->id = $last_id->id + 1;
        $newRecord->uuid = Str::orderedUuid();
        $newRecord->alternatif = count($alternatifs) + 1;
        $newRecord->keterangan = 'Pilihan Anda';
        $newRecord->created_at = Carbon::now();
        $newRecord->updated_at = Carbon::now();
        $alternatifs->push($newRecord);
        // MENAMBAH ALTERNATIF BARU
        // MENAMBAH PERHITUNGAN BARU
        $i = 0;
        foreach ($request->all() as $index => $row) {
            $newMoora = new PerhitunganMoora();
            $newMoora->id =  $last_id_moora->id++;
            $newMoora->uuid = Str::orderedUuid();
            $newMoora->alternatif_uuid = $alternatifs[count($alternatifs) - 1]->uuid;
            $newMoora->kriteria_uuid = $kriterias[$i++]->uuid;
            $newMoora->bobot = $row;
            $newMoora->created_at = Carbon::now();
            $newMoora->updated_at = Carbon::now();
            $mooras->push($newMoora);
        }
        // $query = $mooras->where('alternatif_uuid', $alternatifs[5]->uuid)->first();
        // return response()->json(['alternatifs' => $mooras]);
        // return response()->json(['success' => $alternatifs[5]->uuid . '  /  ' . $kriterias[1]->uuid]);
        // MENAMBAH PERHITUNGAN BARU
        foreach ($kriterias as $kriteria) {
            foreach ($alternatifs as $alternatif) {
                $query = $mooras->where('alternatif_uuid', $alternatif->uuid)->where('kriteria_uuid', $kriteria->uuid)->first();
                $array_pembagi[] = pow($query->bobot, 2);
                $array_pembilang[] = $query->bobot;
            }
        }
        // PERHITUNGAN KOSTUM
        $kuadrat = array_chunk($array_pembagi, $count_alternatif + 1);
        $pembilang = array_chunk($array_pembilang, $count_alternatif + 1);
        $pembagi = [];
        foreach ($kuadrat as $row) {
            $jumlah = array_sum($row);
            $akarKuadrat = floatval(number_format(sqrt($jumlah), 3));
            $pembagi[] = $akarKuadrat;
        }
        $hasil = [];
        foreach ($pembilang as $row => $val) {
            $hasil[$row] = array_map(function ($value) use ($row, $pembagi) {
                return floatval(number_format($value / $pembagi[$row], 3));
            }, $val);
        }
        // PREPERENSI
        $data = $this->transpose($hasil);
        $kriterias = Kriteria::orderBy('kode', 'asc');

        $bobot = [];
        foreach ($kriterias->get() as $kriteria) {
            $bobot[] = kriteria::bobot($kriteria->bobot);
        }
        $result_array = [];
        for ($i = 0; $i < count($data); $i++) {
            for ($j = 0; $j < count($bobot); $j++) {
                $result_array[] = floatval(number_format($data[$i][$j] * $bobot[$j], 3));
            }
        }
        $final_result = array_chunk($result_array, $kriterias->count('id'));
        $rangking = [];
        $atribut = [];
        foreach ($kriterias->get() as $row) {
            $atribut[] = $row->atribut;
        }

        // Loop melalui setiap array (SIPA)
        for ($k = 0; $k < count($final_result); $k++) {
            for ($l = 0; $l < count($bobot); $l++) {
                $jumlah = 0;
                if ($atribut[$l] == 'BENEFIT') {
                    $jumlah += $final_result[$k][$l];
                } else {
                    $jumlah -= $final_result[$k][$l];
                }
                $rangking[] = $jumlah;
            }
        }

        $rangking_result = array_chunk($rangking, $kriterias->count('id'));
        $final_ranking = [];
        for ($u = 0; $u < count($rangking_result); $u++) {
            $final_ranking[] = array_sum($rangking_result[$u]);
        }

        $rangking_assoc = [];
        foreach ($final_ranking as $index => $nilai) {
            $rangking_assoc[] = [$alternatifs[$index]->keterangan, $nilai];
        }

        $names = array_column($rangking_assoc, 0);
        $scores = array_column($rangking_assoc, 1);

        // Menggunakan array_multisort untuk mengurutkan scores secara menurun
        array_multisort($scores, SORT_DESC, $names);

        // Menggabungkan kembali array setelah diurutkan
        $result2 = array_map(function ($name, $score) {
            return [$name, $score];
        }, $names, $scores);


        return response()->json([
            'result' => $final_result,
            'hasil' => $result2
        ]);
    }

    public function preferensi(Request $request)
    {
        $data = $request->data;
        $kriterias = Kriteria::orderBy('kode', 'asc');

        $bobot = [];
        foreach ($kriterias->get() as $kriteria) {
            $bobot[] = kriteria::bobot($kriteria->bobot);
        }
        $result_array = [];
        for ($i = 0; $i < count($data); $i++) {
            for ($j = 0; $j < count($bobot); $j++) {
                $result_array[] = floatval(number_format($data[$i][$j] * $bobot[$j], 3));
            }
        }
        $final_result = array_chunk($result_array, $kriterias->count('id'));
        $rangking = [];
        $atribut = [];
        foreach ($kriterias->get() as $row) {
            $atribut[] = $row->atribut;
        }
        //     COST   0     BENEFIT 1    COST 2      BENEFIT 3    BENEFIT 4   BENEFIT 5   BENEFIT 6  BENEFIT  7
        // -----------------------------------------------------------------------------------------------------
        // 0 | 0.098058068	0.04472136	0.08479983	0.060633906	0.05547002	0.043759497	0.050709255	0.036514837
        // 1 | 0.098058068	0.04472136	0.08479983	0.036380344	0.041602515	0.058345997	0.050709255	0.036514837
        // 2 | 0.098058068	0.04472136	0.08479983	0.036380344	0.041602515	0.043759497	0.03380617	0.054772256
        // 3 | 0.039223227	0.04472136	0.105999788	0.048507125	0.041602515	0.043759497	0.03380617	0.036514837
        // 4 | 0.098058068	0.04472136	0.08479983	0.036380344	0.041602515	0.029172998	0.050709255	0.054772256
        $result = [];

        // Loop melalui setiap array (SIPA)
        for ($k = 0; $k < count($final_result); $k++) {
            for ($l = 0; $l < count($bobot); $l++) {
                $jumlah = 0;
                if ($atribut[$l] == 'BENEFIT') {
                    $jumlah += $final_result[$k][$l];
                } else {
                    $jumlah -= $final_result[$k][$l];
                }
                $rangking[] = $jumlah;
            }
        }
        // // Loop melalui setiap array (SIPA)
        // for ($k = 0; $k < count($final_result); $k++) {
        //     for ($l = 0; $l < count($bobot); $l++) {
        //         $jumlah = 0;
        //         if ($atribut[$l] == 'BENEFIT') {
        //             $jumlah += $final_result[$k][$l];
        //         } else {
        //             $jumlah += $final_result[$k][$l];
        //         }
        //         $rangking[] = $jumlah;
        //     }
        // }

        $rangking_result = array_chunk($rangking, $kriterias->count('id'));
        $final_ranking = [];
        for ($u = 0; $u < count($rangking_result); $u++) {
            $final_ranking[] = array_sum($rangking_result[$u]);
        }

        $nama = Alternatif::orderBy('alternatif', 'asc')->get();
        $rangking_assoc = [];
        foreach ($final_ranking as $index => $nilai) {
            $rangking_assoc[] = [$nama[$index]->keterangan, $nilai];
        }

        $names = array_column($rangking_assoc, 0);
        $scores = array_column($rangking_assoc, 1);

        // Menggunakan array_multisort untuk mengurutkan scores secara menurun
        array_multisort($scores, SORT_DESC, $names);

        // Menggabungkan kembali array setelah diurutkan
        $result2 = array_map(function ($name, $score) {
            return [$name, $score];
        }, $names, $scores);


        return response()->json([
            'result' => $final_result,
            'hasil' => $result2
        ]);
    }
    // public function preferensi_user(Request $request)
    // {
    //     $data = $request->data;

    // }

    function transpose($matrix)
    {
        $transposedMatrix = [];
        foreach ($matrix as $rowIndex => $row) {
            foreach ($row as $colIndex => $value) {
                $transposedMatrix[$colIndex][$rowIndex] = $value;
            }
        }
        return $transposedMatrix;
    }
}

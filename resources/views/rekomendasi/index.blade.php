@extends('layouts.main')
@section('container')
<div class="card text-start">
    <div class="card-body">
        <form action="javascript:;" id="form-rekomendasi">
            <div class="row">
                @foreach($kriterias as $kriteria)
                @php
                $sub = $sub_kriterias->getSub($kriteria->uuid);
                @endphp
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="" class="form-label">{{ $kriteria->kriteria }}</label>
                        <select class="form-control" name="c{{ $kriteria->kode }}">
                            {{-- <option value="">Pilih {{ $kriteria->kriteria }}</option> --}}
                            @foreach($sub as $row)
                            <option value="{{ $row->bobot }}">{{ $row->sub_kriteria }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                @endforeach
                <div class="col-sm-6">
                    <button type="button" id="search-rekomendasi" class="btn btn-primary">
                        Cari Rekomendasi Kost
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="rangking"></div>
<script src="/ex-script/rekomendasi.js"></script>
@endsection

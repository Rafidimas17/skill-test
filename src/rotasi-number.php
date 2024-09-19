<?php
function geserNilai($array) {
    $langkah = [];
    $panjang = count($array);

    for ($i = $panjang - 1; $i >= 0; $i--) {
        $temp = $array[$i];
        for ($j = $i; $j < $panjang - 1; $j++) {
            $array[$j] = $array[$j + 1];
        }
        $array[$panjang - 1] = $temp;
        $langkah[] = $array;
    }

    return $langkah;
}

$nilaiAwal = "987654321";
$nilaiAwalArray = str_split($nilaiAwal);

$langkah = geserNilai($nilaiAwalArray);

foreach ($langkah as $langkahTunggal) {
    $indeksHighlight = array_search(1, $langkahTunggal);
    $langkahTunggalFormat = array_map(function($nilai, $indeks) use ($indeksHighlight) {
        if ($indeks == $indeksHighlight) {
            return "<span style='color: red;'>$nilai</span>";
        } elseif ($indeks == $indeksHighlight - 1) {
            return "<span style='color: blue;'>$nilai</span>";
        } else {
            return $nilai;
        }
    }, $langkahTunggal, array_keys($langkahTunggal));

  
    echo "<span style='line-height: 1.15;'>" . implode('', $langkahTunggalFormat) . "<br></span>";
}
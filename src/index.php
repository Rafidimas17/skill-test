<?php

function fibonacci($n) {
    $a = 0;
    $b = 1;

    echo "Bilangan Fibonanci: ";
    echo $a . ", " . $b;

    for ($i = 2; $i < $n; $i++) {
        $next = $a + $b;
        echo ", " . $next;
        $a = $b;
        $b = $next;
    }
    echo "\n";
}

$n = 20;
fibonacci($n);
?>

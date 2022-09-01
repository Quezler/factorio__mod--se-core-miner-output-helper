<?php

$info = json_decode(file_get_contents(__DIR__ . '/src/info.json'), true);

$name = $info['name'] . '_' . $info['version'];

passthru(sprintf("cp -R %s %s", __DIR__ . '/src', __DIR__ . '/' . $name));
passthru(sprintf("zip -r %s %s", "{$name}.zip", "{$name}"));
passthru(sprintf("rm -r %s", __DIR__ . '/' . $name));

var_dump($info);

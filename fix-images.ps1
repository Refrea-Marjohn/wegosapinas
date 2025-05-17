$mapping = @{
  'bohol1.jpg' = 'bohol2.jpg'
  'bohol3.jpg' = 'bohol2.jpg'
  'boracay2.jpg' = 'boracay.jpg'
  'boracay3.jpg' = 'boracay.jpg'
  'palawan2.jpg' = 'palawan.jpg'
  'palawan3.jpg' = 'palawan.jpg'
  'manila2.jpg' = 'manila.jpg'
  'manila3.jpg' = 'manila.jpg'
  'albay2.jpg' = 'albay.jpg'
  'albay3.jpg' = 'albay.jpg'
  'hiddenfalls2.jpg' = 'hiddenfalls.jpg'
  'hiddenfalls3.jpg' = 'hiddenfalls.jpg'
  'tagapo2.jpg' = 'tagapo.jpg'
  'tagapo3.jpg' = 'tagapo.jpg'
  'baywalk2.jpg' = 'baywalk.jpg'
  'baywalk3.jpg' = 'baywalk.jpg'
  'vigan2.jpg' = 'vigan.jpg'
  'vigan3.jpg' = 'vigan.jpg'
  'banaue2.jpg' = 'banaue.jpg'
  'banaue3.jpg' = 'banaue.jpg'
  'intramuros2.jpg' = 'intramuros.jpg'
  'intramuros3.jpg' = 'intramuros.jpg'
  'hotel1.jpg' = 'boracay.jpg'
  'hotel2.jpg' = 'palawan.jpg'
  'hotel3.jpg' = 'banaue.jpg'
  'hotel4.jpg' = 'el nido.jpg'
  'hotel5.jpg' = 'baguio.jpg'
  'hotel6.jpg' = 'vigan.jpg'
  'room1.jpg' = 'boracay.jpg'
  'room2.jpg' = 'palawan.jpg'
  'room3.jpg' = 'banaue.jpg'
  'flight-image1.jpg' = 'boracay.jpg'
  'flight-image2.jpg' = 'palawan.jpg'
  'flight-image3.jpg' = 'banaue.jpg'
  'flight-image4.jpg' = 'el nido.jpg'
  'flight-image5.jpg' = 'baguio.jpg'
  'about-hero1.jpg' = 'Homebg.jpg'
  'about-hero2.jpg' = 'Homebg2.jpg'
  'about-hero3.jpg' = 'sunset.jpg'
}

$files = Get-ChildItem -Path .\public -Filter *.html
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    foreach ($key in $mapping.Keys) {
        $content = $content -replace "/images/$key", "/images/$($mapping[$key])"
        $content = $content -replace "src=\"$key\"", "src=\"/images/$($mapping[$key])\""
        $content = $content -replace "src=\'${key}\'", "src='/images/$($mapping[$key])'"
        $content = $content -replace "background: url\(['\"]?$key['\"]?\)", "background: url('/images/$($mapping[$key])')"
    }
    Set-Content $file.FullName $content
} 
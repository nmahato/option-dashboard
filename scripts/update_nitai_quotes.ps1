$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$symbolFile = Join-Path $repoRoot 'main\data\nitai_list.json'
$quoteFile = Join-Path $repoRoot 'main\data\nitai_list_quotes.json'

function Get-LiveQuotes {
  $symbols = (Get-Content $symbolFile -Raw | ConvertFrom-Json).symbols | ForEach-Object { $_.symbol }
  $query = ($symbols -join ',')
  $json = & curl.exe -k -s "https://api.robinhood.com/quotes/?symbols=$query"
  return ($json | ConvertFrom-Json)
}

while ($true) {
  try {
    $live = Get-LiveQuotes
    $list = Get-Content $symbolFile -Raw | ConvertFrom-Json
    $map = @{}
    foreach ($item in @($live.results)) {
      $map[$item.symbol] = $item
    }

    $items = foreach ($entry in @($list.symbols)) {
      $q = $map[$entry.symbol]
      if ($null -eq $q) {
        [pscustomobject]@{
          symbol = $entry.symbol
          name = $entry.name
          last_trade_price = $null
          bid_price = $null
          ask_price = $null
          previous_close = $null
          updated_at = $null
        }
        continue
      }

      [pscustomobject]@{
        symbol = $entry.symbol
        name = $entry.name
        last_trade_price = $q.last_trade_price
        bid_price = $q.bid_price
        ask_price = $q.ask_price
        previous_close = $q.previous_close
        updated_at = $q.updated_at
      }
    }

    [pscustomobject]@{
      project = 'Nitai list'
      source = 'Robinhood live quotes'
      updated = (Get-Date).ToUniversalTime().ToString('o')
      items = $items
    } | ConvertTo-Json -Depth 5 | Set-Content -Encoding utf8 $quoteFile
  } catch {
    [pscustomobject]@{
      project = 'Nitai list'
      source = 'Robinhood live quotes'
      updated = (Get-Date).ToUniversalTime().ToString('o')
      error = $_.Exception.Message
      items = @()
    } | ConvertTo-Json -Depth 5 | Set-Content -Encoding utf8 $quoteFile
  }

  Start-Sleep -Seconds 30
}

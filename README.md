# TSLA Options Dashboard

A real-time Tesla options simulator and trading alert system built with vanilla HTML, CSS, and JavaScript.

## Features

- **Options simulator** — Black-Scholes pricing model with live P&L curve
- **Interactive sliders** — adjust spot price, strike, DTE, IV, and contracts instantly
- **Scenario forecasts** — see P&L across bear/bull/flat scenarios at expiry
- **Greeks dashboard** — Delta, Gamma, Theta, Vega calculated in real time
- **Alert system** — set buy/sell/stop-loss triggers with custom conditions
- **Risk profile chart** — option value curve across price range
- **Robinhood integration** — portfolio and quote data via Claude connector

## Live Demo

> Deployed via GitHub Pages: `https://nmahato.github.io/tsla-options-dashboard`

## Getting Started

```bash
# Clone the repo
git clone https://github.com/yourusername/tsla-options-dashboard.git

# Open locally — no build step needed
open index.html
```

## Usage

| Slider | Description |
|--------|-------------|
| TSLA spot price | Current market price of Tesla stock |
| Strike price | The option's strike price |
| Days to expiry | How many days until the option expires |
| Implied volatility | Market's expected volatility (IV%) |
| Contracts | Number of option contracts (1 contract = 100 shares) |

### Alert types

- **Buy call / Buy put** — triggers entry when your price condition is met
- **Sell call / Sell put** — triggers exit at your target
- **Take profit** — fires when P&L gain exceeds threshold
- **Stop loss** — fires when P&L loss exceeds threshold

## How it works

Pricing uses the **Black-Scholes model**:

```
d1 = [ ln(S/K) + (r + σ²/2) · T ] / (σ · √T)
d2 = d1 − σ · √T

Call = S · N(d1) − K · e^(−rT) · N(d2)
Put  = K · e^(−rT) · N(−d2) − S · N(−d1)
```

Where:
- `S` = spot price
- `K` = strike price
- `T` = time to expiry (in years)
- `r` = risk-free rate (5%)
- `σ` = implied volatility

## Tech stack

- Vanilla HTML / CSS / JavaScript — zero dependencies
- [Chart.js 4.4](https://www.chartjs.org/) — P&L and risk profile charts
- [Geist Mono](https://vercel.com/font) — monospace font
- [DM Sans](https://fonts.google.com/specimen/DM+Sans) — body font
- Black-Scholes pricing engine (pure JS)

## Disclaimer

> This tool is for **educational purposes only** and does not constitute financial advice. Options trading involves substantial risk of loss. Always consult a licensed financial advisor before making investment decisions.

## License

MIT — free to use, modify, and distribute.

# TSLA Options Dashboard

A real-time Tesla options simulator and trading alert system built with vanilla HTML, CSS, and JavaScript.

## Features

- Options simulator with a Black-Scholes pricing model and live P&L curve
- Interactive sliders for spot price, strike, DTE, IV, and contracts
- Scenario forecasts across bear, bull, and flat cases at expiry
- Strategy library covering long/short calls and puts, spreads, straddles, strangles, condors, butterflies, collars, covered calls, synthetic positions, ratio spreads, and box spreads
- Strategy presets and a model-based options chain snapshot
- Greeks dashboard with Delta, Gamma, Theta, and Vega
- Alert system for buy, sell, take-profit, and stop-loss triggers
- Risk profile chart showing option value across a price range

## Live Demo

GitHub Pages: [https://nmahato.github.io/option-dashboard/](https://nmahato.github.io/option-dashboard/)

## Getting Started

```bash
# Clone the repo
git clone https://github.com/nmahato/option-dashboard.git

# Open locally - no build step needed
open index.html
```

## Usage

| Slider | Description |
|--------|-------------|
| TSLA spot price | Current market price of Tesla stock |
| Strike price | The option's strike price |
| Wing width | Spread width used by multi-leg strategies |
| Days to expiry | How many days until the option expires |
| Implied volatility | Market's expected volatility (IV%) |
| Contracts | Number of option contracts (1 contract = 100 shares) |

### Alert types

- Buy call / Buy put - triggers entry when your price condition is met
- Sell call - triggers exit at your target
- Multi-leg strategies can be selected from the Strategy menu in the dashboard
- Take profit - fires when P&L gain exceeds a threshold
- Stop loss - fires when P&L loss exceeds a threshold

## How it works

Pricing uses the Black-Scholes model:

```text
d1 = [ ln(S/K) + (r + sigma^2 / 2) * T ] / (sigma * sqrt(T))
d2 = d1 - sigma * sqrt(T)

Call = S * N(d1) - K * e^(-rT) * N(d2)
Put  = K * e^(-rT) * N(-d2) - S * N(-d1)
```

Where:

- `S` = spot price
- `K` = strike price
- `T` = time to expiry in years
- `r` = risk-free rate, 5%
- `sigma` = implied volatility

## Tech Stack

- Vanilla HTML / CSS / JavaScript
- [Chart.js 4.4](https://www.chartjs.org/) for the charts
- [Geist Mono](https://vercel.com/font) for monospace text
- [DM Sans](https://fonts.google.com/specimen/DM+Sans) for body text

## Disclaimer

This tool is for educational purposes only and does not constitute financial advice. Options trading involves substantial risk of loss. Always consult a licensed financial advisor before making investment decisions.

## License

MIT - free to use, modify, and distribute.

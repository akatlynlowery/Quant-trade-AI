import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuantTrade AI',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFF050505),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00C805),
          brightness: Brightness.dark,
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class StockPick {
  final String symbol;
  final String name;
  final String sector;
  final double price;
  final double predictedMove;
  final double dayTradeMove;
  final double suggestedAmount;
  final int confidence;
  final String signal;
  final String holdTime;
  final String reason;
  final List<double> chart;

  const StockPick({
    required this.symbol,
    required this.name,
    required this.sector,
    required this.price,
    required this.predictedMove,
    required this.dayTradeMove,
    required this.suggestedAmount,
    required this.confidence,
    required this.signal,
    required this.holdTime,
    required this.reason,
    required this.chart,
  });
}

class Position {
  final StockPick stock;
  final int shares;

  const Position({
    required this.stock,
    required this.shares,
  });
}

const List<StockPick> aiPicks = [
  StockPick(
    symbol: 'NVDA',
    name: 'Nvidia',
    sector: 'AI Chips',
    price: 142.65,
    predictedMove: 12.8,
    dayTradeMove: 2.4,
    suggestedAmount: 1800.00,
    confidence: 91,
    signal: 'Strong Buy',
    holdTime: '2-4 hours',
    reason: 'Momentum, volume, and options flow are all trending up.',
    chart: [42, 46, 44, 51, 49, 58, 63, 67],
  ),
  StockPick(
    symbol: 'AMD',
    name: 'Advanced Micro Devices',
    sector: 'Semiconductors',
    price: 163.22,
    predictedMove: 8.4,
    dayTradeMove: 1.8,
    suggestedAmount: 1200.00,
    confidence: 84,
    signal: 'Buy',
    holdTime: '90 min-3 hours',
    reason: 'Short-term trend strength improved after a clean breakout.',
    chart: [35, 34, 39, 43, 41, 48, 52, 55],
  ),
  StockPick(
    symbol: 'PLTR',
    name: 'Palantir',
    sector: 'Data Software',
    price: 73.18,
    predictedMove: 10.2,
    dayTradeMove: 2.1,
    suggestedAmount: 900.00,
    confidence: 87,
    signal: 'Buy',
    holdTime: '1-2 hours',
    reason: 'Model found high retail volume and positive news sentiment.',
    chart: [24, 28, 31, 29, 36, 38, 44, 50],
  ),
  StockPick(
    symbol: 'TSLA',
    name: 'Tesla',
    sector: 'EVs',
    price: 248.41,
    predictedMove: 5.9,
    dayTradeMove: 1.5,
    suggestedAmount: 750.00,
    confidence: 76,
    signal: 'Watch',
    holdTime: '30-90 min',
    reason: 'Upside exists, but volatility risk is still elevated.',
    chart: [55, 51, 56, 49, 53, 59, 57, 62],
  ),
  StockPick(
    symbol: 'AAPL',
    name: 'Apple',
    sector: 'Mega Cap Tech',
    price: 196.42,
    predictedMove: 3.2,
    dayTradeMove: 0.9,
    suggestedAmount: 650.00,
    confidence: 69,
    signal: 'Hold',
    holdTime: '2-5 hours',
    reason: 'Stable trend, but the model wants stronger volume first.',
    chart: [43, 45, 46, 46, 48, 47, 49, 50],
  ),
  StockPick(
    symbol: 'MSFT',
    name: 'Microsoft',
    sector: 'Cloud',
    price: 429.77,
    predictedMove: 4.7,
    dayTradeMove: 1.1,
    suggestedAmount: 850.00,
    confidence: 74,
    signal: 'Buy',
    holdTime: '3-6 hours',
    reason: 'Lower volatility setup with steady institutional demand.',
    chart: [38, 39, 41, 44, 43, 45, 48, 51],
  ),
  StockPick(
    symbol: 'META',
    name: 'Meta Platforms',
    sector: 'Social / AI',
    price: 512.34,
    predictedMove: 6.1,
    dayTradeMove: 1.4,
    suggestedAmount: 1000.00,
    confidence: 78,
    signal: 'Buy',
    holdTime: '2-4 hours',
    reason: 'AI ad-growth trend and positive price action are aligned.',
    chart: [46, 43, 47, 50, 52, 51, 56, 59],
  ),
  StockPick(
    symbol: 'AMZN',
    name: 'Amazon',
    sector: 'Ecommerce / Cloud',
    price: 183.12,
    predictedMove: 4.9,
    dayTradeMove: 1.2,
    suggestedAmount: 800.00,
    confidence: 72,
    signal: 'Watch',
    holdTime: '1-3 hours',
    reason: 'Good setup, but the model wants confirmation above resistance.',
    chart: [31, 34, 33, 37, 38, 41, 40, 45],
  ),
];

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const TradingHomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.auto_graph,
                  color: Color(0xFF00C805),
                  size: 58,
                ),

                const SizedBox(height: 16),

                const Text(
                  'QuantTrade AI',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'AI stock picks for active traders',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF9B9B9B),
                  ),
                ),

                const SizedBox(height: 30),

                TextField(
                  controller: _usernameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: const TextStyle(color: Color(0xFF9B9B9B)),
                    filled: true,
                    fillColor: const Color(0xFF141414),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Color(0xFF9B9B9B)),
                    filled: true,
                    fillColor: const Color(0xFF141414),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 26),

                SizedBox(
                  width: double.infinity,
                  height: 49,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00C805),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  'Demo trading only. Predictions are not financial advice.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF87879D),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TradingHomePage extends StatefulWidget {
  const TradingHomePage({super.key});

  @override
  State<TradingHomePage> createState() => _TradingHomePageState();
}

class _TradingHomePageState extends State<TradingHomePage> {
  double cash = 12500.00;
  bool bankConnected = false;
  String bankName = 'Not connected';
  double bankBalance = 0.00;
  StockPick selectedStock = aiPicks.first;
  String searchText = '';
  final Map<String, int> sharesOwned = {};

  double get portfolioValue {
    double value = cash;

    for (StockPick stock in aiPicks) {
      value += (sharesOwned[stock.symbol] ?? 0) * stock.price;
    }

    return value;
  }

  List<StockPick> get visibleStocks {
    if (searchText.trim().isEmpty) {
      return aiPicks;
    }

    String query = searchText.toLowerCase();

    return aiPicks.where((stock) {
      return stock.symbol.toLowerCase().contains(query) ||
          stock.name.toLowerCase().contains(query) ||
          stock.sector.toLowerCase().contains(query);
    }).toList();
  }

  List<Position> get positions {
    return aiPicks.where((stock) {
      return (sharesOwned[stock.symbol] ?? 0) > 0;
    }).map((stock) {
      return Position(
        stock: stock,
        shares: sharesOwned[stock.symbol] ?? 0,
      );
    }).toList();
  }

  void _connectBank() {
    setState(() {
      bankConnected = true;
      bankName = 'Plaid Sandbox Bank';
      bankBalance = 18420.35;
      cash = bankBalance;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sandbox bank connected. Balance synced.'),
      ),
    );
  }

  void _buyStock(StockPick stock, int shares) {
    double orderTotal = stock.price * shares;
    double estimatedProfit = orderTotal * (stock.dayTradeMove / 100);

    if (cash < orderTotal) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not enough buying power for this order.'),
        ),
      );
      return;
    }

    setState(() {
      cash -= orderTotal;
      sharesOwned[stock.symbol] = (sharesOwned[stock.symbol] ?? 0) + shares;
    });

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Paper bought $shares ${stock.symbol}. Est. day-trade profit \$${estimatedProfit.toStringAsFixed(2)}',
        ),
      ),
    );
  }

  void _sellStock(StockPick stock, int shares) {
    int currentShares = sharesOwned[stock.symbol] ?? 0;

    if (currentShares < shares) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not enough paper shares to sell.'),
        ),
      );
      return;
    }

    setState(() {
      cash += stock.price * shares;
      sharesOwned[stock.symbol] = currentShares - shares;

      if (sharesOwned[stock.symbol] == 0) {
        sharesOwned.remove(stock.symbol);
      }
    });

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Paper sold $shares ${stock.symbol}'),
      ),
    );
  }

  void _showBuySheet(StockPick stock) {
    int shares = 1;

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF111111),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            double orderTotal = stock.price * shares;
            double estimatedProfit = orderTotal * (stock.dayTradeMove / 100);

            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paper Buy ${stock.symbol}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '${stock.signal} • ${stock.holdTime} • +${stock.dayTradeMove.toStringAsFixed(1)}% day target',
                    style: const TextStyle(
                      color: Color(0xFF00C805),
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Shares',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: shares > 1
                                ? () {
                                    setModalState(() {
                                      shares--;
                                    });
                                  }
                                : null,
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                          Text(
                            '$shares',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setModalState(() {
                                shares++;
                              });
                            },
                            icon: const Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  _OrderRow(
                    label: 'Market price',
                    value: '\$${stock.price.toStringAsFixed(2)}',
                  ),
                  _OrderRow(
                    label: 'Estimated total',
                    value: '\$${orderTotal.toStringAsFixed(2)}',
                  ),
                  _OrderRow(
                    label: 'AI estimated profit',
                    value: '\$${estimatedProfit.toStringAsFixed(2)}',
                  ),
                  _OrderRow(
                    label: 'Suggested amount',
                    value: '\$${stock.suggestedAmount.toStringAsFixed(2)}',
                  ),
                  _OrderRow(
                    label: 'Buying power',
                    value: '\$${cash.toStringAsFixed(2)}',
                  ),

                  const SizedBox(height: 22),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _buyStock(stock, shares);
                      },
                      icon: const Icon(Icons.shopping_cart_checkout),
                      label: const Text('Place Paper Trade'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00C805),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showSellSheet(StockPick stock) {
    int shares = 1;
    int currentShares = sharesOwned[stock.symbol] ?? 0;

    if (currentShares == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You do not own paper shares of ${stock.symbol}.'),
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF111111),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            double orderTotal = stock.price * shares;

            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paper Sell ${stock.symbol}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Owned $currentShares share(s) • Market value \$${(stock.price * currentShares).toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Shares',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: shares > 1
                                ? () {
                                    setModalState(() {
                                      shares--;
                                    });
                                  }
                                : null,
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                          Text(
                            '$shares',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: shares < currentShares
                                ? () {
                                    setModalState(() {
                                      shares++;
                                    });
                                  }
                                : null,
                            icon: const Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  _OrderRow(
                    label: 'Market price',
                    value: '\$${stock.price.toStringAsFixed(2)}',
                  ),
                  _OrderRow(
                    label: 'Estimated credit',
                    value: '\$${orderTotal.toStringAsFixed(2)}',
                  ),

                  const SizedBox(height: 22),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _sellStock(stock, shares);
                      },
                      icon: const Icon(Icons.sell_outlined),
                      label: const Text('Sell Paper Shares'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF5A5F),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _openStockDetails(StockPick stock) {
    setState(() {
      selectedStock = stock;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StockDetailPage(
          stock: stock,
          shares: sharesOwned[stock.symbol] ?? 0,
          onBuy: () {
            _showBuySheet(stock);
          },
          onSell: () {
            _showSellSheet(stock);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuantTrade AI'),
        centerTitle: false,
        backgroundColor: const Color(0xFF050505),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PortfolioCard(
                value: portfolioValue,
                cash: cash,
              ),

              const SizedBox(height: 12),

              const _PaperModeBanner(),

              const SizedBox(height: 18),

              _BankCard(
                connected: bankConnected,
                bankName: bankName,
                balance: bankBalance,
                onConnect: _connectBank,
              ),

              const SizedBox(height: 18),

              _PredictionCard(
                stock: selectedStock,
                onBuy: () {
                  _showBuySheet(selectedStock);
                },
              ),

              const SizedBox(height: 24),

              _AiPlanCard(
                stock: selectedStock,
              ),

              const SizedBox(height: 24),

              _PositionsSection(
                positions: positions,
                onBuyMore: _showBuySheet,
                onOpen: _openStockDetails,
              ),

              const SizedBox(height: 24),

              const Text(
                'Browse Paper Trades',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search stocks or sectors',
                  hintStyle: const TextStyle(color: Colors.white38),
                  filled: true,
                  fillColor: const Color(0xFF111111),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Column(
                children: visibleStocks.map((stock) {
                  return _StockTile(
                    stock: stock,
                    shares: sharesOwned[stock.symbol] ?? 0,
                    selected: stock.symbol == selectedStock.symbol,
                    onTap: () {
                      _openStockDetails(stock);
                    },
                    onBuy: () {
                      _showBuySheet(stock);
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 24),

              const Text(
                'Risk Controls',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const _RiskCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class StockDetailPage extends StatelessWidget {
  final StockPick stock;
  final int shares;
  final VoidCallback onBuy;
  final VoidCallback onSell;

  const StockDetailPage({
    super.key,
    required this.stock,
    required this.shares,
    required this.onBuy,
    required this.onSell,
  });

  @override
  Widget build(BuildContext context) {
    double marketValue = stock.price * shares;
    double progress = (stock.chart.last / stock.chart.reduce((a, b) => a > b ? a : b))
        .clamp(0.0, 1.0);
    double returnPercent = stock.dayTradeMove * progress;
    double costBasis = shares == 0
        ? 0.00
        : marketValue / (1 + (returnPercent / 100));
    double totalReturn = marketValue - costBasis;
    double suggestedProfit = stock.suggestedAmount * (stock.dayTradeMove / 100);

    return Scaffold(
      appBar: AppBar(
        title: Text(stock.symbol),
        backgroundColor: const Color(0xFF050505),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stock.symbol,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${stock.name} • ${stock.sector}',
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${stock.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '+${stock.dayTradeMove.toStringAsFixed(1)}% AI day target',
                        style: const TextStyle(
                          color: Color(0xFF00C805),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 22),

              _DetailChart(
                points: stock.chart,
              ),

              const SizedBox(height: 22),

              Row(
                children: [
                  Expanded(
                    child: _PlanMetric(
                      label: 'Shares',
                      value: '$shares',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _PlanMetric(
                      label: 'Position value',
                      value: '\$${marketValue.toStringAsFixed(2)}',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: _PlanMetric(
                      label: 'Total return',
                      value: shares == 0
                          ? '\$0.00'
                          : '+\$${totalReturn.toStringAsFixed(2)}',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _PlanMetric(
                      label: 'Return %',
                      value: shares == 0
                          ? '0.0%'
                          : '+${returnPercent.toStringAsFixed(1)}%',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF111111),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'AI Trade Readout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    _OrderRow(
                      label: 'Signal',
                      value: stock.signal,
                    ),
                    _OrderRow(
                      label: 'Suggested amount',
                      value: '\$${stock.suggestedAmount.toStringAsFixed(2)}',
                    ),
                    _OrderRow(
                      label: 'Suggested profit',
                      value: '\$${suggestedProfit.toStringAsFixed(2)}',
                    ),
                    _OrderRow(
                      label: 'Suggested hold',
                      value: stock.holdTime,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      stock.reason,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: onBuy,
                        icon: const Icon(Icons.add_circle_outline),
                        label: const Text('Paper Buy'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00C805),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: shares > 0 ? onSell : null,
                        icon: const Icon(Icons.sell_outlined),
                        label: const Text('Paper Sell'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF5A5F),
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: const Color(0xFF252525),
                          disabledForegroundColor: Colors.white38,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailChart extends StatelessWidget {
  final List<double> points;

  const _DetailChart({
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    double firstPoint = points.first;
    double lastPoint = points.last;
    double chartReturn = ((lastPoint - firstPoint) / firstPoint) * 100;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Stock Chart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '+${chartReturn.toStringAsFixed(1)}%',
                style: const TextStyle(
                  color: Color(0xFF00C805),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 190,
            child: CustomPaint(
              painter: _ChartPainter(
                points: points,
              ),
              child: Container(),
            ),
          ),

          const SizedBox(height: 10),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Open',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
              ),
              Text(
                'Now',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  final List<double> points;

  const _ChartPainter({
    required this.points,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint gridPaint = Paint()
      ..color = const Color(0xFF242424)
      ..strokeWidth = 1;
    Paint linePaint = Paint()
      ..color = const Color(0xFF00C805)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    Paint dotPaint = Paint()
      ..color = const Color(0xFF00C805)
      ..style = PaintingStyle.fill;
    double maxPoint = points.reduce((a, b) => a > b ? a : b);
    double minPoint = points.reduce((a, b) => a < b ? a : b);
    double range = maxPoint - minPoint == 0 ? 1 : maxPoint - minPoint;
    Path path = Path();

    for (int i = 0; i < 4; i++) {
      double y = size.height * (i / 3);
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }

    for (int i = 0; i < points.length; i++) {
      double x = points.length == 1
          ? 0
          : size.width * (i / (points.length - 1));
      double y = size.height -
          ((points[i] - minPoint) / range * (size.height - 12)) -
          6;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      if (i == points.length - 1) {
        canvas.drawCircle(
          Offset(x, y),
          5,
          dotPaint,
        );
      }
    }

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant _ChartPainter oldDelegate) {
    return oldDelegate.points != points;
  }
}

class _BankCard extends StatelessWidget {
  final bool connected;
  final String bankName;
  final double balance;
  final VoidCallback onConnect;

  const _BankCard({
    required this.connected,
    required this.bankName,
    required this.balance,
    required this.onConnect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.account_balance,
              color: Color(0xFF00C805),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bankName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  connected
                      ? 'Balance \$${balance.toStringAsFixed(2)}'
                      : 'Connect sandbox bank',
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onConnect,
            style: ElevatedButton.styleFrom(
              backgroundColor: connected
                  ? const Color(0xFF1E1E1E)
                  : const Color(0xFF00C805),
              foregroundColor: connected ? Colors.white : Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              connected ? 'Sync' : 'Connect',
            ),
          ),
        ],
      ),
    );
  }
}

class _PaperModeBanner extends StatelessWidget {
  const _PaperModeBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF181818),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.science_outlined,
            color: Color(0xFF00C805),
            size: 22,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Paper mode is on. Trades are simulated so you can prove the strategy before using real money.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PortfolioCard extends StatelessWidget {
  final double value;
  final double cash;

  const _PortfolioCard({
    required this.value,
    required this.cash,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Portfolio Value',
            style: TextStyle(
              color: Color(0xFF9B9B9B),
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            '\$${value.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(
                Icons.trending_up,
                color: Color(0xFF00C805),
                size: 18,
              ),
              const SizedBox(width: 6),
              const Text(
                '+4.18% today',
                style: TextStyle(
                  color: Color(0xFF00C805),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                'Cash \$${cash.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AiPlanCard extends StatelessWidget {
  final StockPick stock;

  const _AiPlanCard({
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    double estimatedProfit = stock.suggestedAmount * (stock.dayTradeMove / 100);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'AI Paper Trade Plan',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: _PlanMetric(
                  label: 'Suggested amount',
                  value: '\$${stock.suggestedAmount.toStringAsFixed(0)}',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _PlanMetric(
                  label: 'Est. profit',
                  value: '\$${estimatedProfit.toStringAsFixed(2)}',
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: _PlanMetric(
                  label: 'Hold time',
                  value: stock.holdTime,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _PlanMetric(
                  label: 'Day target',
                  value: '+${stock.dayTradeMove.toStringAsFixed(1)}%',
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          const Text(
            'Use this as a paper-trading test plan, not a promise of profit.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _PositionsSection extends StatelessWidget {
  final List<Position> positions;
  final void Function(StockPick stock) onBuyMore;
  final void Function(StockPick stock) onOpen;

  const _PositionsSection({
    required this.positions,
    required this.onBuyMore,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Paper Positions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        if (positions.isEmpty)
          const _EmptyPositionsCard()
        else
          Column(
            children: positions.map((position) {
              return _PositionCard(
                position: position,
                onOpen: () {
                  onOpen(position.stock);
                },
                onBuyMore: () {
                  onBuyMore(position.stock);
                },
              );
            }).toList(),
          ),
      ],
    );
  }
}

class _EmptyPositionsCard extends StatelessWidget {
  const _EmptyPositionsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'No paper trades yet. Place a paper trade to track shares, progress, estimated profit, and hold time here.',
        style: TextStyle(
          color: Colors.white60,
          fontSize: 14,
          height: 1.4,
        ),
      ),
    );
  }
}

class _PositionCard extends StatelessWidget {
  final Position position;
  final VoidCallback onOpen;
  final VoidCallback onBuyMore;

  const _PositionCard({
    required this.position,
    required this.onOpen,
    required this.onBuyMore,
  });

  @override
  Widget build(BuildContext context) {
    StockPick stock = position.stock;
    double marketValue = stock.price * position.shares;
    double estimatedProfit = marketValue * (stock.dayTradeMove / 100);
    double progress = (stock.chart.last / stock.chart.reduce((a, b) => a > b ? a : b))
        .clamp(0.0, 1.0);

    return GestureDetector(
      onTap: onOpen,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFF00C805),
                child: Text(
                  stock.symbol.substring(0, 1),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stock.symbol,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${position.shares} share(s) • ${stock.holdTime}',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onBuyMore,
                icon: const Icon(Icons.add_circle),
                color: const Color(0xFF00C805),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: _PlanMetric(
                  label: 'Value',
                  value: '\$${marketValue.toStringAsFixed(2)}',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _PlanMetric(
                  label: 'Est. P/L',
                  value: '+\$${estimatedProfit.toStringAsFixed(2)}',
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Progress to +${stock.dayTradeMove.toStringAsFixed(1)}% target',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
              Text(
                '${(progress * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  color: Color(0xFF00C805),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: const Color(0xFF252525),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF00C805),
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}

class _PlanMetric extends StatelessWidget {
  final String label;
  final String value;

  const _PlanMetric({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _PredictionCard extends StatelessWidget {
  final StockPick stock;
  final VoidCallback onBuy;

  const _PredictionCard({
    required this.stock,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF101A12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF00C805),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.psychology_alt_outlined,
                color: Color(0xFF00C805),
              ),
              const SizedBox(width: 8),
              const Text(
                'Top AI Paper Signal',
                style: TextStyle(
                  color: Color(0xFF00C805),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '${stock.confidence}% confident',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stock.symbol,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      stock.name,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${stock.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '+${stock.dayTradeMove.toStringAsFixed(1)}% day',
                    style: const TextStyle(
                      color: Color(0xFF00C805),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 18),

          _MiniChart(
            points: stock.chart,
          ),

          const SizedBox(height: 16),

          Text(
            '${stock.reason} Suggested hold: ${stock.holdTime}.',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: onBuy,
              icon: const Icon(Icons.bolt),
              label: const Text('Paper Trade Signal'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C805),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StockTile extends StatelessWidget {
  final StockPick stock;
  final int shares;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onBuy;

  const _StockTile({
    required this.stock,
    required this.shares,
    required this.selected,
    required this.onTap,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF151F16) : const Color(0xFF111111),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF00C805),
          child: Text(
            stock.symbol.substring(0, 1),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          stock.symbol,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          shares > 0
              ? '${stock.name} • $shares share(s) • ${stock.holdTime}'
              : '${stock.name} • ${stock.sector}',
          style: const TextStyle(
            color: Colors.white60,
          ),
        ),
        trailing: Wrap(
          spacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${stock.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '+${stock.dayTradeMove.toStringAsFixed(1)}%',
                  style: const TextStyle(
                    color: Color(0xFF00C805),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: onBuy,
              icon: const Icon(Icons.add_circle),
              color: const Color(0xFF00C805),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniChart extends StatelessWidget {
  final List<double> points;

  const _MiniChart({
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    double maxPoint = points.reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: 86,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: points.map((point) {
          return Expanded(
            child: Container(
              height: 18 + (point / maxPoint * 62),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: const Color(0xFF00C805),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _RiskCard extends StatelessWidget {
  const _RiskCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RiskRow(
            icon: Icons.shield_outlined,
            title: 'Max position size',
            value: '15%',
          ),

          SizedBox(height: 14),

          _RiskRow(
            icon: Icons.timer_outlined,
            title: 'Day trade mode',
            value: 'On',
          ),

          SizedBox(height: 14),

          _RiskRow(
            icon: Icons.warning_amber_outlined,
            title: 'Stop loss reminder',
            value: '3%',
          ),
        ],
      ),
    );
  }
}

class _RiskRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _RiskRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF00C805),
          size: 22,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _OrderRow extends StatelessWidget {
  final String label;
  final String value;

  const _OrderRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 15,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

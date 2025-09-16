import 'package:flutter/material.dart';

void main() {
  runApp(const KumbhConnApp());
}

class KumbhConnApp extends StatelessWidget {
  const KumbhConnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KumbhConn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onContinueWithAadhaar(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const NextPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(
                    Icons.shield_outlined,
                    size: 48,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Welcome',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Continue to secure your experience',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _onContinueWithAadhaar(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF34A853),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    child: const Text('Continue with Aadhaar'),
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

class SOSHomeScreen extends StatelessWidget {
  const SOSHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS Home'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.emergency_share, size: 64, color: theme.colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              'Placeholder SOS Home',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Aadhaar auth integration pending',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  int _currentIndex = 1; // Default to center (Feed) like typical patterns

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _EmergencyHeader(theme: theme),
              const SizedBox(height: 24),
              _StatusChips(theme: theme),
              const SizedBox(height: 40),
              Center(child: _SOSCard(theme: theme)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ReportIncidentFlow()),
                    );
                  },
                  icon: const Icon(Icons.report_problem_outlined),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  label: const Text('Report Incident'),
                ),
              ),
              const SizedBox(height: 16),
              _LastAlertChip(),
              const SizedBox(height: 12),
              _ZoneStatusPill(
                zoneName: 'Sector 4',
                status: ZoneStatus.crowded,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) {
          if (i == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const MapPage()),
            );
          } else if (i == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const FeedPage()),
            );
          } else {
            setState(() => _currentIndex = i);
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.map_outlined), label: 'Map'),
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.dynamic_feed_outlined), label: 'Feed'),
        ],
      ),
    );
  }
}

class _EmergencyHeader extends StatelessWidget {
  const _EmergencyHeader({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      alignment: Alignment.center,
      child: Text(
        'KumbhConn',
        style: theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _SOSCard extends StatelessWidget {
  const _SOSCard({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: screenHeight * 0.45),
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Text(
                '100',
                style: TextStyle(fontSize: 44, fontWeight: FontWeight.w800, color: Colors.black),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF4444),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: 1.0),
                ),
                child: const Text('SOS'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChips extends StatelessWidget {
  const _StatusChips({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: const [
        _Chip(label: 'Location On', icon: Icons.location_on_outlined),
        _Chip(label: 'Battery 78%', icon: Icons.battery_4_bar_outlined),
        _Chip(label: 'Network OK', icon: Icons.network_cell_outlined),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 6),
          Text(label, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _QuickTiles extends StatelessWidget {
  const _QuickTiles({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _QuickTile extends StatelessWidget {
  const _QuickTile({required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: theme.colorScheme.onPrimary),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _LastAlertChip extends StatefulWidget {
  @override
  State<_LastAlertChip> createState() => _LastAlertChipState();
}

class _LastAlertChipState extends State<_LastAlertChip> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.timeline, size: 18, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your last alert was acknowledged at 13:07 — Unit dispatched 13:10',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface,
                      height: 1.2,
                    ),
                    maxLines: _expanded ? 3 : 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (_expanded) ...[
                    const SizedBox(height: 6),
                    Text(
                      'Tip: Avoid repeat presses. If unsafe, press and hold SOS again.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(_expanded ? Icons.expand_less : Icons.expand_more, size: 18, color: theme.colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}

enum ZoneStatus { normal, crowded, blocked }

class _ZoneStatusPill extends StatelessWidget {
  const _ZoneStatusPill({required this.zoneName, required this.status});
  final String zoneName;
  final ZoneStatus status;

  Color _statusColor(BuildContext context) {
    switch (status) {
      case ZoneStatus.normal:
        return Colors.green;
      case ZoneStatus.crowded:
        return Colors.orange;
      case ZoneStatus.blocked:
        return Colors.red;
    }
  }

  String get _statusLabel {
    switch (status) {
      case ZoneStatus.normal:
        return 'Normal';
      case ZoneStatus.crowded:
        return 'Crowded';
      case ZoneStatus.blocked:
        return 'Blocked';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (ctx) => Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _Dot(color: _statusColor(context)),
                    const SizedBox(width: 8),
                    Text('$zoneName — $_statusLabel', style: theme.textTheme.titleMedium),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Diversion suggestions based on live crowd density will appear here.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Dot(color: _statusColor(context)),
            const SizedBox(width: 8),
            Text('$zoneName — $_statusLabel', style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

// -------------------- Feed Page --------------------

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  String _selectedZone = 'Sector 4';
  String _selectedCategory = 'All';
  String _selectedPriority = 'All';
  bool _isOffline = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        actions: [
          _ZoneChip(
            zone: _selectedZone,
            onTap: () => _showZoneSelector(),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => _showFilters(),
            icon: const Icon(Icons.filter_list_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() => _isOffline = false);
          await Future.delayed(const Duration(seconds: 1));
        },
        child: CustomScrollView(
          slivers: [
            if (_isOffline)
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.cloud_off_outlined, color: theme.colorScheme.onSurfaceVariant),
                      const SizedBox(width: 8),
                      Text('Offline - showing cached items', style: theme.textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) return _PersonalStatusCard();
                  if (index == 1) return _AdvisoryCard(
                    title: 'Heat Advisory',
                    body: 'High temperatures expected. Stay hydrated and seek shade.',
                    zone: 'Sector 4',
                    issuedBy: 'Health Dept',
                    priority: 'High',
                    cta: 'Acknowledge',
                  );
                  if (index == 2) return _TransportCard(
                    title: 'Shuttle Delay',
                    body: 'Route A delayed by 15 minutes due to crowd density.',
                    cta: 'Open Map',
                  );
                  if (index == 3) return _HealthWashCard(
                    title: 'Water Station Update',
                    body: 'Station 3 temporarily closed. Use Station 1 or 5.',
                    cta: 'Acknowledge',
                  );
                  return null;
                },
                childCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showZoneSelector() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Select Zone', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: ['Sector 1', 'Sector 2', 'Sector 3', 'Sector 4', 'Sector 5']
                  .map((zone) => FilterChip(
                        label: Text(zone),
                        selected: _selectedZone == zone,
                        onSelected: (_) {
                          setState(() => _selectedZone = zone);
                          Navigator.pop(context);
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilters() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Filters', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Category', style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        children: ['All', 'Health', 'Security', 'Transport', 'WASH']
                            .map((cat) => FilterChip(
                                  label: Text(cat),
                                  selected: _selectedCategory == cat,
                                  onSelected: (_) => setState(() => _selectedCategory = cat),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Priority', style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        children: ['All', 'High', 'Normal']
                            .map((pri) => FilterChip(
                                  label: Text(pri),
                                  selected: _selectedPriority == pri,
                                  onSelected: (_) => setState(() => _selectedPriority = pri),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ZoneChip extends StatelessWidget {
  const _ZoneChip({required this.zone, required this.onTap});
  final String zone;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(zone, style: theme.textTheme.bodySmall),
            const SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, size: 16, color: theme.colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}

class _PersonalStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person_pin, color: theme.colorScheme.onPrimaryContainer),
              const SizedBox(width: 8),
              Text('Your Reports', style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              )),
            ],
          ),
          const SizedBox(height: 12),
          _StatusItem(
            title: 'Medical Aid Request',
            status: 'Dispatched',
            time: '13:10',
            color: Colors.orange,
          ),
          const SizedBox(height: 8),
          _StatusItem(
            title: 'Crowd Surge Report',
            status: 'Acknowledged',
            time: '12:45',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class _StatusItem extends StatelessWidget {
  const _StatusItem({
    required this.title,
    required this.status,
    required this.time,
    required this.color,
  });
  final String title;
  final String status;
  final String time;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              )),
              Text('$status at $time', style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onPrimaryContainer.withOpacity(0.7),
              )),
            ],
          ),
        ),
      ],
    );
  }
}

class _AdvisoryCard extends StatelessWidget {
  const _AdvisoryCard({
    required this.title,
    required this.body,
    required this.zone,
    required this.issuedBy,
    required this.priority,
    required this.cta,
  });
  final String title;
  final String body;
  final String zone;
  final String issuedBy;
  final String priority;
  final String cta;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: priority == 'High' ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(priority, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )),
              ),
              const SizedBox(width: 8),
              Text(zone, style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              )),
              const Spacer(),
              Text('2h ago', style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              )),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(body, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 8),
          Row(
            children: [
              Text('by $issuedBy', style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              )),
              const Spacer(),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: Text(cta),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TransportCard extends StatelessWidget {
  const _TransportCard({
    required this.title,
    required this.body,
    required this.cta,
  });
  final String title;
  final String body;
  final String cta;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.directions_bus, color: Colors.orange),
              const SizedBox(width: 8),
              Text('Transport', style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
              )),
              const Spacer(),
              Text('1h ago', style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              )),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(body, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map_outlined),
              label: Text(cta),
            ),
          ),
        ],
      ),
    );
  }
}

class _HealthWashCard extends StatelessWidget {
  const _HealthWashCard({
    required this.title,
    required this.body,
    required this.cta,
  });
  final String title;
  final String body;
  final String cta;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.health_and_safety, color: Colors.green),
              const SizedBox(width: 8),
              Text('Health & WASH', style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.w600,
              )),
              const Spacer(),
              Text('30m ago', style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              )),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(body, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(cta),
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------- Map Page --------------------

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String _layer = 'Security';
  bool _findMe = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        actions: [
          IconButton(
            tooltip: 'Layers',
            onPressed: _showLayers,
            icon: const Icon(Icons.layers_outlined),
          ),
          IconButton(
            tooltip: 'Locate me',
            onPressed: () {},
            icon: const Icon(Icons.my_location_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          // Map canvas placeholder (MapLibre integration pending)
          GestureDetector(
            onLongPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ReportIncidentFlow()),
              );
            },
            child: Container(
              color: theme.colorScheme.surfaceContainerHighest,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map_outlined, size: 64, color: theme.colorScheme.onSurfaceVariant),
                  const SizedBox(height: 16),
                  Text('Map Canvas', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text('Long press to report issue', style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  )),
                ],
              ),
            ),
          ),
          // Status chips (accuracy/data/zone)
          Positioned(
            top: 12,
            left: 12,
            child: Row(
              children: [
                _StatusChip(label: 'GPS ~23m'),
                const SizedBox(width: 8),
                _StatusChip(label: 'Online'),
                const SizedBox(width: 8),
                _StatusChip(label: 'Sector 4'),
              ],
            ),
          ),
          // Layer indicator
          Positioned(
            top: 12,
            right: 12,
            child: _StatusChip(label: _layer),
          ),
          // Find-me panel
          if (_findMe)
            Positioned(
              bottom: 90,
              left: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: theme.colorScheme.outline.withOpacity(0.2)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.emergency_share, size: 36, color: Colors.red),
                    const SizedBox(height: 8),
                    Text('Find‑me mode: High-contrast marker enabled', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(child: OutlinedButton(onPressed: () => setState(() => _findMe = false), child: const Text('Close'))),
                        const SizedBox(width: 8),
                        Expanded(child: FilledButton(onPressed: () {}, child: const Text('Show QR'))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          // Bottom action bar
          Positioned(
            bottom: 16,
            left: 12,
            right: 12,
            child: Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.alt_route_outlined),
                    label: const Text('Guide me'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => setState(() => _findMe = true),
                    icon: const Icon(Icons.place_outlined),
                    label: const Text('Find‑me'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // prefill report with location later
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ReportIncidentFlow()),
                      );
                    },
                    icon: const Icon(Icons.flag_outlined),
                    label: const Text('Report issue'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLayers() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Layers', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: ['Security', 'Health', 'Transport']
                  .map((l) => ChoiceChip(
                        label: Text(l),
                        selected: _layer == l,
                        onSelected: (_) => setState(() {
                              _layer = l;
                              Navigator.pop(context);
                            }),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.2)),
      ),
      child: Text(label, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}

// -------------------- Report Incident Flow (2 steps) --------------------

class ReportIncidentFlow extends StatefulWidget {
  const ReportIncidentFlow({super.key});

  @override
  State<ReportIncidentFlow> createState() => _ReportIncidentFlowState();
}

class _ReportIncidentFlowState extends State<ReportIncidentFlow> {
  int _step = 0; // 0 = category/subtype, 1 = structured form

  String _category = 'Health';
  String _subtype = 'Medical Aid';
  double _severity = 1; // 1-3
  int _peopleAffected = 1;
  bool _consent = false;
  bool _callback = false;

  final TextEditingController _descCtrl = TextEditingController();

  @override
  void dispose() {
    _descCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Incident'),
      ),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: _step == 0 ? _buildStep1(theme) : _buildStep2(theme),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: theme.colorScheme.outline.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            if (_step == 1)
              Expanded(
                child: OutlinedButton(
                  onPressed: () => setState(() => _step = 0),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Back'),
                ),
              ),
            if (_step == 1) const SizedBox(width: 12),
            Expanded(
              child: FilledButton(
                onPressed: () {
                  if (_step == 0) {
                    setState(() => _step = 1);
                  } else {
                    // Placeholder send behavior; in future handle offline queue
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Report queued/sent')), 
                    );
                    Navigator.pop(context);
                  }
                },
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                child: Text(_step == 0 ? 'Next' : 'Send report'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep1(ThemeData theme) {
    final Map<String, List<String>> subtypes = {
      'Health': ['Medical Aid', 'Dehydration', 'Unconscious', 'Injury', 'Heat Stroke', 'Ambulance'],
      'Security': ['Crowd Surge', 'Lost Child', 'Fight', 'Suspicious Object', 'Theft', 'VIP Risk'],
      'Transport': ['Traffic Jam', 'Parking Issue', 'Shuttle Delay', 'Road Blocked', 'Wrong-Way', 'Accident'],
    };
    final categories = subtypes.keys.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Step 1 of 2', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Text('Choose a category', style: theme.textTheme.titleLarge),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final cat in categories)
                ChoiceChip(
                  label: Text(cat),
                  selected: _category == cat,
                  onSelected: (_) => setState(() {
                    _category = cat;
                    _subtype = subtypes[cat]!.first;
                  }),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Subtype', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final s in subtypes[_category]!)
                FilterChip(
                  label: Text(s),
                  selected: _subtype == s,
                  onSelected: (_) => setState(() => _subtype = s),
                ),
            ],
          ),
          const SizedBox(height: 16),
          _SOPPromptsHint(category: _category, subtype: _subtype),
        ],
      ),
    );
  }

  Widget _buildStep2(ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Step 2 of 2', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Text('Details', style: theme.textTheme.titleLarge),
          const SizedBox(height: 16),
          _ReadonlyField(label: 'Zone', value: 'Sector 4'),
          const SizedBox(height: 12),
          _LocationRow(),
          const SizedBox(height: 12),
          TextField(
            controller: _descCtrl,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Description (short)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          _MediaRow(),
          const SizedBox(height: 12),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Severity', style: theme.textTheme.titleMedium),
                const SizedBox(height: 12),
                SegmentedButton<int>(
                  segments: const [
                    ButtonSegment(value: 1, label: Text('Low')),
                    ButtonSegment(value: 2, label: Text('Med')),
                    ButtonSegment(value: 3, label: Text('High')),
                  ],
                  selected: {_severity.toInt()},
                  onSelectionChanged: (s) => setState(() => _severity = s.first.toDouble()),
                  style: SegmentedButton.styleFrom(
                    side: BorderSide(color: theme.colorScheme.outline),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SOPPromptsHint extends StatelessWidget {
  const _SOPPromptsHint({required this.category, required this.subtype});
  final String category;
  final String subtype;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String hint = 'Provide key details relevant to the incident.';
    if (category == 'Security' && subtype == 'Crowd Surge') {
      hint = 'Moving direction? Barriers present? Injuries seen?';
    } else if (category == 'Health') {
      hint = 'Symptoms, conscious/unconscious, visible injuries.';
    } else if (category == 'Transport') {
      hint = 'Block point, vehicle types, lane status.';
    }
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 8),
          Expanded(child: Text(hint, style: theme.textTheme.bodySmall)),
        ],
      ),
    );
  }
}

class _ReadonlyField extends StatelessWidget {
  const _ReadonlyField({required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: TextEditingController(text: value),
      decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
    );
  }
}

class _LocationRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            readOnly: true,
            decoration: const InputDecoration(
              labelText: 'Location (GPS + accuracy)',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        OutlinedButton(onPressed: () {}, child: const Text('Refine')),
        const SizedBox(width: 8),
        OutlinedButton(onPressed: () {}, child: const Text('Pick landmark')),
      ],
    );
  }
}

class _MediaRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.photo_camera_outlined), label: const Text('Camera'))),
        const SizedBox(width: 8),
        Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.photo_library_outlined), label: const Text('Gallery'))),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

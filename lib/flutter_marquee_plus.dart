import 'package:flutter/material.dart';


/// A lightweight and customizable marquee (scrolling text) widget for Flutter.
///
/// `MarqueePlus` automatically scrolls its text horizontally when:
///  • the text overflows its available width, OR
///  • [alwaysScroll] is set to true.
///
/// The scroll speed can be controlled using [velocity], and spacing between
/// repeated text instances can be customized using [blankSpace].
///
/// Example:
/// ```dart
/// MarqueePlus(
///   text: 'This is a very long text that scrolls smoothly',
///   velocity: 100,
///   alwaysScroll: false,
/// )
/// ```
class MarqueePlus extends StatefulWidget {
  /// The text to be displayed and optionally scrolled.
  final String text;

  /// Optional text style for the marquee text.
  final TextStyle? style;

  /// If true, the text will scroll even if it does not overflow its container.
  final bool alwaysScroll;

  /// Scroll speed in pixels per second.
  ///
  /// Must be greater than 0 to animate.
  final double velocity;

  /// Horizontal space between repeated text instances.
  final double blankSpace;

  /// Optional animation curve applied to the scroll animation.
  ///
  /// If null, a linear animation is used.
  final Curve? curve;

  /// Creates a [MarqueePlus] widget.
  const MarqueePlus({
    super.key,
    required this.text,
    this.style,
    this.alwaysScroll = false,
    this.velocity = 50.0,
    this.blankSpace = 65.0,
    this.curve,
  });

  @override
  State<MarqueePlus> createState() => _MarqueePlusState();
}

class _MarqueePlusState extends State<MarqueePlus>
    with SingleTickerProviderStateMixin {
  /// Controller driving the horizontal animation.
  late final AnimationController _animationController;

  /// Cached width of the rendered text.
  late double _textWidth;

  /// Whether the text should currently animate.
  bool _shouldAnimate = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Measures the text, decides whether scrolling is required,
  /// and configures the animation controller accordingly.
  ///
  /// This method is called from the build method via [LayoutBuilder]
  /// so it must be fast and side-effect safe.
  void _calculateMetrics(double maxWidth) {
    // Measure rendered text width
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      textDirection: TextDirection.ltr,
    )..layout();

    final newTextWidth = textPainter.width;

    // Determine whether scrolling should occur
    final shouldAnimate =
        widget.alwaysScroll || newTextWidth > maxWidth;

    _textWidth = newTextWidth;
    _shouldAnimate = shouldAnimate;

    // Configure animation only when needed
    if (shouldAnimate && widget.velocity > 0) {
      final distance = newTextWidth + widget.blankSpace;
      final duration = Duration(
        milliseconds: (distance / widget.velocity * 1000).round(),
      );

      if (_animationController.duration != duration) {
        _animationController.duration = duration;

        // Restart animation so new velocity takes effect immediately
        if (_animationController.isAnimating) {
          _animationController
            ..stop()
            ..reset()
            ..repeat();
        }
      }

      if (!_animationController.isAnimating) {
        _animationController.repeat();
      }
    } else {
      if (_animationController.isAnimating) {
        _animationController.stop();
      }
      _animationController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _calculateMetrics(constraints.maxWidth);

        // If no scrolling is needed, render static text.
        if (!_shouldAnimate) {
          return Text(
            widget.text,
            style: widget.style,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          );
        }

        // Scrolling marquee animation
        return ClipRect(
          child: RepaintBoundary(
            child: AnimatedBuilder(
              animation: _animationController,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.text, style: widget.style),
                  SizedBox(width: widget.blankSpace),
                  Text(widget.text, style: widget.style),
                  SizedBox(width: widget.blankSpace),

                  // Add extra repetition if the text is shorter than container width
                  if (_textWidth + widget.blankSpace < constraints.maxWidth) ...[
                    Text(widget.text, style: widget.style),
                    SizedBox(width: widget.blankSpace),
                  ],
                ],
              ),
              builder: (context, child) {
                final animationValue = widget.curve != null
                    ? widget.curve!.transform(_animationController.value)
                    : _animationController.value;

                final offset =
                    animationValue * (_textWidth + widget.blankSpace);

                return OverflowBox(
                  maxWidth: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Transform.translate(
                    offset: Offset(-offset, 0),
                    child: child,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
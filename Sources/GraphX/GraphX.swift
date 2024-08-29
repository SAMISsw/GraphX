import Foundation
import CoreGraphics
import UIKit

public struct GraphData {
    public var values: [Double]
    public var labels: [String]
    
    public init(values: [Double], labels: [String]) {
        self.values = values
        self.labels = labels
    }
}

public enum GraphType {
    case bar, line, pie
}

public struct GraphLayout {
    public var padding: CGFloat
    public var spacing: CGFloat
    public var alignment: NSTextAlignment
    public var margin: CGFloat
    public var xAxisLabelColor: UIColor
    public var yAxisLabelColor: UIColor
    public var gridLineColor: UIColor
    public var axisLabelFont: UIFont
    public var gridLineWidth: CGFloat
    public var barWidth: CGFloat
    
    public init(padding: CGFloat = 16, spacing: CGFloat = 8, alignment: NSTextAlignment = .center, margin: CGFloat = 10, xAxisLabelColor: UIColor = .black, yAxisLabelColor: UIColor = .black, gridLineColor: UIColor = .lightGray, axisLabelFont: UIFont = .systemFont(ofSize: 12), gridLineWidth: CGFloat = 0.5, barWidth: CGFloat = 30) {
        self.padding = padding
        self.spacing = spacing
        self.alignment = alignment
        self.margin = margin
        self.xAxisLabelColor = xAxisLabelColor
        self.yAxisLabelColor = yAxisLabelColor
        self.gridLineColor = gridLineColor
        self.axisLabelFont = axisLabelFont
        self.gridLineWidth = gridLineWidth
        self.barWidth = barWidth
    }
}

public class GraphView: UIView {
    public var data: GraphData
    public var graphType: GraphType
    public var layout: GraphLayout
    public var animationStyle: UIView.AnimationOptions
    public var backgroundColor: UIColor
    public var graphColor: UIColor
    public var showLegend: Bool
    public var showLabels: Bool
    public var showGrid: Bool
    public var title: String?
    public var showXAxisLabels: Bool
    public var showYAxisLabels: Bool
    public var showTooltips: Bool
    public var highlightOnTouch: Bool
    public var animateOnLoad: Bool
    public var showLegendTitle: Bool
    public var legendTitle: String?
    public var tooltipBackgroundColor: UIColor
    public var legendPosition: CGPoint
    public var axisLineWidth: CGFloat
    public var axisLineColor: UIColor
    public var enableZoom: Bool
    public var borderColor: UIColor
    public var borderWidth: CGFloat
    public var gradientColors: [UIColor]?
    public var animationDuration: TimeInterval
    public var showDataLabels: Bool
    
    public init(frame: CGRect, data: GraphData, graphType: GraphType = .bar, layout: GraphLayout = GraphLayout(), animationStyle: UIView.AnimationOptions = .transitionCrossDissolve, backgroundColor: UIColor = .white, graphColor: UIColor = .blue, showLegend: Bool = true, showLabels: Bool = true, showGrid: Bool = false, title: String? = nil, showXAxisLabels: Bool = true, showYAxisLabels: Bool = true, showTooltips: Bool = true, highlightOnTouch: Bool = true, animateOnLoad: Bool = true, showLegendTitle: Bool = false, legendTitle: String? = nil, tooltipBackgroundColor: UIColor = .black, legendPosition: CGPoint = CGPoint(x: 0, y: 0), axisLineWidth: CGFloat = 1, axisLineColor: UIColor = .black, enableZoom: Bool = false, borderColor: UIColor = .clear, borderWidth: CGFloat = 0, gradientColors: [UIColor]? = nil, animationDuration: TimeInterval = 1.0, showDataLabels: Bool = true) {
        self.data = data
        self.graphType = graphType
        self.layout = layout
        self.animationStyle = animationStyle
        self.backgroundColor = backgroundColor
        self.graphColor = graphColor
        self.showLegend = showLegend
        self.showLabels = showLabels
        self.showGrid = showGrid
        self.title = title
        self.showXAxisLabels = showXAxisLabels
        self.showYAxisLabels = showYAxisLabels
        self.showTooltips = showTooltips
        self.highlightOnTouch = highlightOnTouch
        self.animateOnLoad = animateOnLoad
        self.showLegendTitle = showLegendTitle
        self.legendTitle = legendTitle
        self.tooltipBackgroundColor = tooltipBackgroundColor
        self.legendPosition = legendPosition
        self.axisLineWidth = axisLineWidth
        self.axisLineColor = axisLineColor
        self.enableZoom = enableZoom
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.gradientColors = gradientColors
        self.animationDuration = animationDuration
        self.showDataLabels = showDataLabels
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = backgroundColor
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        if animateOnLoad {
            self.alpha = 0
            UIView.animate(withDuration: animationDuration, delay: 0, options: animationStyle, animations: {
                self.alpha = 1
            }, completion: nil)
        }
        if enableZoom {
            setupZoomGesture()
        }
    }
    
    private func setupZoomGesture() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        self.addGestureRecognizer(pinchGesture)
    }
    
    @objc private func handlePinch(_ sender: UIPinchGestureRecognizer) {
        guard let view = sender.view else { return }
        view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
    
    public func drawGraph() {
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        if showGrid {
            drawGrid()
        }
        switch graphType {
        case .bar:
            drawBarGraph()
        case .line:
            drawLineGraph()
        case .pie:
            drawPieChart()
        }
        if let title = title {
            addTitle(title)
        }
        if showLegend {
            addLegend()
        }
        if showXAxisLabels {
            addXAxisLabels()
        }
        if showYAxisLabels {
            addYAxisLabels()
        }
    }
    
    private func drawBarGraph() {
        let barWidth = layout.barWidth
        let maxHeight = self.bounds.height - layout.margin * 2
        let maxValue = data.values.max() ?? 1
        let barSpacing = (self.bounds.width - layout.margin * 2 - barWidth * CGFloat(data.values.count)) / CGFloat(data.values.count - 1)
        
        for (index, value) in data.values.enumerated() {
            let barHeight = CGFloat(value) / CGFloat(maxValue) * maxHeight
            let bar = UIView(frame: CGRect(x: layout.margin + CGFloat(index) * (barWidth + barSpacing), y: self.bounds.height - barHeight - layout.margin, width: barWidth, height: barHeight))
            
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = bar.bounds
            gradientLayer.colors = gradientColors?.map { $0.cgColor } ?? [graphColor.cgColor]
            bar.layer.insertSublayer(gradientLayer, at: 0)
            
            self.addSubview(bar)
            
            if showDataLabels {
                let label = UILabel(frame: CGRect(x: layout.margin + CGFloat(index) * (barWidth + barSpacing), y: self.bounds.height - barHeight - layout.margin - 20, width: barWidth, height: 20))
                label.text = String(format: "%.1f", value)
                label.textColor = .black
                label.font = layout.axisLabelFont
                label.textAlignment = .center
                self.addSubview(label)
            }
            
            if showTooltips {
                let tooltip = UILabel(frame: CGRect(x: layout.margin + CGFloat(index) * (barWidth + barSpacing), y: self.bounds.height - barHeight - layout.margin - 40, width: barWidth, height: 20))
                tooltip.text = String(format: "%.1f", value)
                tooltip.textColor = .white
                tooltip.backgroundColor = tooltipBackgroundColor
                tooltip.textAlignment = .center
                tooltip.font = layout.axisLabelFont
                tooltip.alpha = 0
                self.addSubview(tooltip)
                
                bar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showTooltip(_:))))
                
                if highlightOnTouch {
                    bar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(highlightBar(_:))))
                }
            }
            
            UIView.animate(withDuration: animationDuration, delay: 0, options: animationStyle, animations: {
                bar.alpha = 1
            }, completion: nil)
        }
    }
    
    private func drawLineGraph() {
        let path = UIBezierPath()
        let maxValue = data.values.max() ?? 1
        let stepWidth = (self.bounds.width - layout.margin * 2) / CGFloat(data.values.count - 1)
        
        for (index, value) in data.values.enumerated() {
            let x = layout.margin + CGFloat(index) * stepWidth
            let y = self.bounds.height - (CGFloat(value) / CGFloat(maxValue) * (self.bounds.height - layout.margin * 2)) - layout.margin
            
            if index == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        let lineLayer = CAShapeLayer()
        lineLayer.path = path.cgPath
        lineLayer.strokeColor = graphColor.cgColor
        lineLayer.lineWidth = 2
        lineLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(lineLayer)
        
        if showDataLabels {
            for (index, value) in data.values.enumerated() {
                let x = layout.margin + CGFloat(index) * stepWidth
                let y = self.bounds.height - (CGFloat(value) / CGFloat(maxValue) * (self.bounds.height - layout.margin * 2)) - layout.margin
                let label = UILabel(frame: CGRect(x: x - 20, y: y - 20, width: 40, height: 20))
                label.text = String(format: "%.1f", value)
                label.textColor = .black
                label.font = layout.axisLabelFont
                label.textAlignment = .center
                self.addSubview(label)
            }
        }
    }
    
    private func drawPieChart() {
        let totalValue = data.values.reduce(0, +)
        var startAngle: CGFloat = -CGFloat.pi / 2
        
        for (index, value) in data.values.enumerated() {
            let endAngle = startAngle + 2 * CGFloat.pi * CGFloat(value / totalValue)
            let path = UIBezierPath()
            path.move(to: CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2))
            path.addArc(withCenter: CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2), radius: min(self.bounds.width, self.bounds.height) / 2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.close()
            
            let sliceLayer = CAShapeLayer()
            sliceLayer.path = path.cgPath
            sliceLayer.fillColor = graphColor.withAlphaComponent(0.5).cgColor
            self.layer.addSublayer(sliceLayer)
            
            startAngle = endAngle
            
            if showDataLabels {
                let labelAngle = startAngle + (endAngle - startAngle) / 2
                let labelX = self.bounds.width / 2 + cos(labelAngle) * (min(self.bounds.width, self.bounds.height) / 4)
                let labelY = self.bounds.height / 2 + sin(labelAngle) * (min(self.bounds.width, self.bounds.height) / 4)
                let dataLabel = UILabel(frame: CGRect(x: labelX - 20, y: labelY - 10, width: 40, height: 20))
                dataLabel.text = String(format: "%.1f", value)
                dataLabel.textColor = .black
                dataLabel.font = layout.axisLabelFont
                dataLabel.textAlignment = .center
                self.addSubview(dataLabel)
            }
        }
    }
    
    private func drawGrid() {
        let gridLayer = CAShapeLayer()
        let path = UIBezierPath()
        let numberOfLines = 5
        let lineSpacing = (self.bounds.height - layout.margin * 2) / CGFloat(numberOfLines)
        
        for i in 0...numberOfLines {
            let y = layout.margin + CGFloat(i) * lineSpacing
            path.move(to: CGPoint(x: layout.margin, y: y))
            path.addLine(to: CGPoint(x: self.bounds.width - layout.margin, y: y))
        }
        
        gridLayer.path = path.cgPath
        gridLayer.strokeColor = layout.gridLineColor.cgColor
        gridLayer.lineWidth = layout.gridLineWidth
        self.layer.addSublayer(gridLayer)
    }
    
    private func addTitle(_ title: String) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 30))
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)
    }
    
    private func addLegend() {
        let legendView = UIView(frame: CGRect(x: legendPosition.x, y: legendPosition.y, width: 120, height: 80))
        legendView.backgroundColor = .white
        legendView.layer.borderColor = UIColor.black.cgColor
        legendView.layer.borderWidth = 1
        
        if showLegendTitle {
            let legendTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 20))
            legendTitleLabel.text = legendTitle
            legendTitleLabel.textColor = .black
            legendTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
            legendTitleLabel.textAlignment = .center
            legendView.addSubview(legendTitleLabel)
        }
        
        let legendItems = data.labels
        for (index, label) in legendItems.enumerated() {
            let legendLabel = UILabel(frame: CGRect(x: 5, y: 30 + index * 20, width: 100, height: 20))
            legendLabel.text = label
            legendLabel.textColor = graphColor
            legendLabel.font = layout.axisLabelFont
            legendView.addSubview(legendLabel)
        }
        
        self.addSubview(legendView)
    }
    
    private func addXAxisLabels() {
        let xAxisLabelHeight: CGFloat = 20
        let barWidth = (self.bounds.width - layout.margin * 2) / CGFloat(data.values.count)
        
        for (index, label) in data.labels.enumerated() {
            let xAxisLabel = UILabel(frame: CGRect(x: layout.margin + CGFloat(index) * barWidth, y: self.bounds.height - xAxisLabelHeight, width: barWidth - layout.spacing, height: xAxisLabelHeight))
            xAxisLabel.text = label
            xAxisLabel.textColor = layout.xAxisLabelColor
            xAxisLabel.font = layout.axisLabelFont
            xAxisLabel.textAlignment = layout.alignment
            self.addSubview(xAxisLabel)
        }
    }
    
    private func addYAxisLabels() {
        let yAxisLabelWidth: CGFloat = 40
        let numberOfLabels = 5
        let lineSpacing = (self.bounds.height - layout.margin * 2) / CGFloat(numberOfLabels)
        let maxValue = data.values.max() ?? 1
        
        for i in 0...numberOfLabels {
            let yAxisLabel = UILabel(frame: CGRect(x: 0, y: layout.margin + CGFloat(i) * lineSpacing - 10, width: yAxisLabelWidth, height: 20))
            yAxisLabel.text = String(format: "%.1f", maxValue - (maxValue / CGFloat(numberOfLabels)) * CGFloat(i))
            yAxisLabel.textColor = layout.yAxisLabelColor
            yAxisLabel.font = layout.axisLabelFont
            yAxisLabel.textAlignment = .right
            self.addSubview(yAxisLabel)
        }
    }
    
    @objc private func showTooltip(_ sender: UITapGestureRecognizer) {
        guard let bar = sender.view as? UIView else { return }
        let tooltip = self.subviews.first { $0 is UILabel && $0.alpha == 0 }
        UIView.animate(withDuration: 0.3) {
            tooltip?.alpha = (tooltip?.alpha == 0) ? 1 : 0
        }
    }
    
    @objc private func highlightBar(_ sender: UITapGestureRecognizer) {
        guard let bar = sender.view else { return }
        UIView.animate(withDuration: 0.3) {
            bar.backgroundColor = (bar.backgroundColor == self.graphColor) ? self.graphColor.withAlphaComponent(0.5) : self.graphColor
        }
    }
}

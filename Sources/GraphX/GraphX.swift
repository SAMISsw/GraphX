//
// Make by Samuel Campos de Andrade
//
// THE-PI
// Donation PIX: 06253847333
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
    case bar, line, pie, area, radar, bubble, doughnut, waterfall, boxPlot, scatter
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
    public var pieLabelFont: UIFont
    public var pieLabelColor: UIColor
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
    public var pieLabelTextSize: CGFloat
    public var radarLineWidth: CGFloat
    public var bubbleSizeRange: (min: CGFloat, max: CGFloat)
    public var doughnutInnerRadius: CGFloat
    public var waterfallColors: [UIColor]
    public var boxPlotColors: [UIColor]
    public var scatterPointSize: CGFloat
    public var boxWidth: CGFloat
    public init(padding: CGFloat = 16, spacing: CGFloat = 8, alignment: NSTextAlignment = .center, margin: CGFloat = 10, xAxisLabelColor: UIColor = .black, yAxisLabelColor: UIColor = .black, gridLineColor: UIColor = .lightGray, axisLabelFont: UIFont = .systemFont(ofSize: 12), gridLineWidth: CGFloat = 0.5, barWidth: CGFloat = 30, pieLabelFont: UIFont = .systemFont(ofSize: 12), pieLabelColor: UIColor = .black, showLegend: Bool = true, showLabels: Bool = true, showGrid: Bool = false, title: String? = nil, showXAxisLabels: Bool = true, showYAxisLabels: Bool = true, showTooltips: Bool = true, highlightOnTouch: Bool = true, animateOnLoad: Bool = true, showLegendTitle: Bool = false, legendTitle: String? = nil, tooltipBackgroundColor: UIColor = .black, legendPosition: CGPoint = CGPoint(x: 0, y: 0), axisLineWidth: CGFloat = 1, axisLineColor: UIColor = .black, enableZoom: Bool = false, borderColor: UIColor = .clear, borderWidth: CGFloat = 0, gradientColors: [UIColor]? = nil, animationDuration: TimeInterval = 1.0, showDataLabels: Bool = true, pieLabelTextSize: CGFloat = 12, radarLineWidth: CGFloat = 2, bubbleSizeRange: (min: CGFloat, max: CGFloat) = (5, 20), doughnutInnerRadius: CGFloat = 0.3, waterfallColors: [UIColor] = [.blue, .red], boxPlotColors: [UIColor] = [.lightGray, .darkGray], scatterPointSize: CGFloat = 5, boxWidth: CGFloat = 10) {
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
        self.pieLabelFont = pieLabelFont
        self.pieLabelColor = pieLabelColor
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
        self.pieLabelTextSize = pieLabelTextSize
        self.radarLineWidth = radarLineWidth
        self.bubbleSizeRange = bubbleSizeRange
        self.doughnutInnerRadius = doughnutInnerRadius
        self.waterfallColors = waterfallColors
        self.boxPlotColors = boxPlotColors
        self.scatterPointSize = scatterPointSize
    }
}
struct GraphLayout {
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
    public var pieLabelFont: UIFont
    public var pieLabelColor: UIColor
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
    public var pieLabelTextSize: CGFloat
    public var radarLineWidth: CGFloat
    public var bubbleSizeRange: (min: CGFloat, max: CGFloat)
    public var doughnutInnerRadius: CGFloat
    public var waterfallColors: [UIColor]
    public var boxPlotColors: [UIColor]
    public var scatterPointSize: CGFloat

    public init(
        padding: CGFloat = 16,
        spacing: CGFloat = 8,
        alignment: NSTextAlignment = .center,
        margin: CGFloat = 10,
        xAxisLabelColor: UIColor = .black,
        yAxisLabelColor: UIColor = .black,
        gridLineColor: UIColor = .lightGray,
        axisLabelFont: UIFont = .systemFont(ofSize: 12),
        gridLineWidth: CGFloat = 0.5,
        barWidth: CGFloat = 30,
        pieLabelFont: UIFont = .systemFont(ofSize: 12),
        pieLabelColor: UIColor = .black,
        showLegend: Bool = true,
        showLabels: Bool = true,
        showGrid: Bool = false,
        title: String? = nil,
        showXAxisLabels: Bool = true,
        showYAxisLabels: Bool = true,
        showTooltips: Bool = true,
        highlightOnTouch: Bool = true,
        animateOnLoad: Bool = true,
        showLegendTitle: Bool = false,
        legendTitle: String? = nil,
        tooltipBackgroundColor: UIColor = .black,
        legendPosition: CGPoint = CGPoint(x: 0, y: 0),
        axisLineWidth: CGFloat = 1,
        axisLineColor: UIColor = .black,
        enableZoom: Bool = false,
        borderColor: UIColor = .clear,
        borderWidth: CGFloat = 0,
        gradientColors: [UIColor]? = nil,
        animationDuration: TimeInterval = 1.0,
        showDataLabels: Bool = true,
        pieLabelTextSize: CGFloat = 12,
        radarLineWidth: CGFloat = 2,
        bubbleSizeRange: (min: CGFloat, max: CGFloat) = (5, 20),
        doughnutInnerRadius: CGFloat = 0.3,
        waterfallColors: [UIColor] = [.blue, .red],
        boxPlotColors: [UIColor] = [.lightGray, .darkGray],
        scatterPointSize: CGFloat = 5
    ) {
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
        self.pieLabelFont = pieLabelFont
        self.pieLabelColor = pieLabelColor
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
        self.pieLabelTextSize = pieLabelTextSize
        self.radarLineWidth = radarLineWidth
        self.bubbleSizeRange = bubbleSizeRange
        self.doughnutInnerRadius = doughnutInnerRadius
        self.waterfallColors = waterfallColors
        self.boxPlotColors = boxPlotColors
        self.scatterPointSize = scatterPointSize
    }
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawGraph()
    }
    
    private func drawGraph() {
        switch graphType {
        case .bar:
            drawBarChart()
        case .line:
            drawLineGraph()
        case .pie:
            drawPieChart()
        case .area:
            drawAreaChart()
        case .radar:
            drawRadarChart()
        case .bubble:
            drawBubbleChart()
        case .doughnut:
            drawDoughnutChart()
        case .waterfall:
            drawWaterfallChart()
        case .boxPlot:
            drawBoxPlotChart()
        case .scatter:
            drawScatterChart()
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
        
        if showGrid {
            drawGrid()
        }
        
        if let title = title {
            addTitle(title)
        }
    }
    
    private func drawBarChart() {
        let maxValue = data.values.max() ?? 1
        let barWidth = layout.barWidth
        let spacing = layout.spacing
        let totalWidth = (self.bounds.width - (layout.padding * 2) - (spacing * CGFloat(data.values.count - 1))) / CGFloat(data.values.count)
        
        for (index, value) in data.values.enumerated() {
            let barHeight = CGFloat(value) / CGFloat(maxValue) * (self.bounds.height - layout.padding * 2)
            let barFrame = CGRect(x: layout.padding + CGFloat(index) * (totalWidth + spacing), y: self.bounds.height - layout.padding - barHeight, width: barWidth, height: barHeight)
            let barView = UIView(frame: barFrame)
            barView.backgroundColor = graphColor
            self.addSubview(barView)
        }
    }
    
    private func drawLineGraph() {
        let path = UIBezierPath()
        let maxHeight = self.bounds.height - layout.padding * 2
        let maxValue = data.values.max() ?? 1
        let pointSpacing = (self.bounds.width - layout.padding * 2) / CGFloat(data.values.count - 1)
        
        for (index, value) in data.values.enumerated() {
            let point = CGPoint(x: layout.padding + CGFloat(index) * pointSpacing, y: self.bounds.height - CGFloat(value) / CGFloat(maxValue) * maxHeight - layout.padding)
            if index == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = graphColor.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        
        if showDataLabels {
            for (index, value) in data.values.enumerated() {
                let point = CGPoint(x: layout.padding + CGFloat(index) * pointSpacing, y: self.bounds.height - CGFloat(value) / CGFloat(maxValue) * maxHeight - layout.padding)
                let label = UILabel(frame: CGRect(x: point.x - 20, y: point.y - 20, width: 40, height: 20))
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
        let radius = min(self.bounds.width, self.bounds.height) / 2 - layout.padding
        var startAngle: CGFloat = -.pi / 2
        
        for (index, value) in data.values.enumerated() {
            let endAngle = startAngle + CGFloat(value / totalValue) * 2 * .pi
            let path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.addLine(to: CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2))
            path.close()
            
            let sliceLayer = CAShapeLayer()
            sliceLayer.path = path.cgPath
            sliceLayer.fillColor = graphColor.cgColor
            self.layer.addSublayer(sliceLayer)
            
            startAngle = endAngle
            
            if showDataLabels {
                let labelAngle = startAngle - (endAngle - startAngle) / 2
                let labelX = self.bounds.width / 2 + radius / 2 * cos(labelAngle)
                let labelY = self.bounds.height / 2 + radius / 2 * sin(labelAngle)
                let label = UILabel(frame: CGRect(x: labelX - 20, y: labelY - 10, width: 40, height: 20))
                label.text = "\(Int(value))"
                label.font = layout.pieLabelFont
                label.textAlignment = .center
                self.addSubview(label)
            }
        }
    }
    
    private func drawAreaChart() {
        let path = UIBezierPath()
        let maxHeight = self.bounds.height - layout.padding * 2
        let maxValue = data.values.max() ?? 1
        let pointSpacing = (self.bounds.width - layout.padding * 2) / CGFloat(data.values.count - 1)
        
        path.move(to: CGPoint(x: layout.padding, y: self.bounds.height - layout.padding))
        for (index, value) in data.values.enumerated() {
            let point = CGPoint(x: layout.padding + CGFloat(index) * pointSpacing, y: self.bounds.height - CGFloat(value) / CGFloat(maxValue) * maxHeight - layout.padding)
            path.addLine(to: point)
        }
        path.addLine(to: CGPoint(x: self.bounds.width - layout.padding, y: self.bounds.height - layout.padding))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = graphColor.withAlphaComponent(0.3).cgColor
        shapeLayer.strokeColor = graphColor.cgColor
        shapeLayer.lineWidth = 2
        self.layer.addSublayer(shapeLayer)
    }
    
    private func drawRadarChart() {
        let numberOfPoints = data.values.count
        let radius = min(self.bounds.width, self.bounds.height) / 2 - layout.padding
        let angleStep = 2 * CGFloat.pi / CGFloat(numberOfPoints)
        let path = UIBezierPath()
        
        for (index, value) in data.values.enumerated() {
            let angle = angleStep * CGFloat(index)
            let point = CGPoint(x: self.bounds.width / 2 + radius * cos(angle), y: self.bounds.height / 2 + radius * sin(angle))
            let scaledPoint = CGPoint(x: point.x, y: point.y - CGFloat(value) / CGFloat(data.values.max() ?? 1) * radius)
            if index == 0 {
                path.move(to: scaledPoint)
            } else {
                path.addLine(to: scaledPoint)
            }
        }
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = graphColor.withAlphaComponent(0.3).cgColor
        shapeLayer.strokeColor = graphColor.cgColor
        shapeLayer.lineWidth = layout.radarLineWidth
        self.layer.addSublayer(shapeLayer)
        
        if showDataLabels {
            for (index, value) in data.values.enumerated() {
                let angle = angleStep * CGFloat(index)
                let point = CGPoint(x: self.bounds.width / 2 + radius * cos(angle), y: self.bounds.height / 2 + radius * sin(angle))
                let scaledPoint = CGPoint(x: point.x, y: point.y - CGFloat(value) / CGFloat(data.values.max() ?? 1) * radius)
                let label = UILabel(frame: CGRect(x: scaledPoint.x - 20, y: scaledPoint.y - 10, width: 40, height: 20))
                label.text = String(format: "%.1f", value)
                label.textColor = .black
                label.font = layout.axisLabelFont
                label.textAlignment = .center
                self.addSubview(label)
            }
        }
    }
    
    private func drawBubbleChart() {
        let maxValue = data.values.max() ?? 1
        let bubbleSizeRange = layout.bubbleSizeRange
        
        for (index, value) in data.values.enumerated() {
            let size = bubbleSizeRange.min + CGFloat(value / maxValue) * (bubbleSizeRange.max - bubbleSizeRange.min)
            let x = layout.padding + CGFloat(index) * (self.bounds.width - layout.padding * 2) / CGFloat(data.values.count)
            let y = self.bounds.height - layout.padding - size
            let bubbleView = UIView(frame: CGRect(x: x, y: y, width: size, height: size))
            bubbleView.backgroundColor = graphColor
            bubbleView.layer.cornerRadius = size / 2
            self.addSubview(bubbleView)
        }
    }
    
    private func drawDoughnutChart() {
        let totalValue = data.values.reduce(0, +)
        let radius = min(self.bounds.width, self.bounds.height) / 2 - layout.padding
        let innerRadius = radius * 0.6
        var startAngle: CGFloat = -.pi / 2
        
        for (index, value) in data.values.enumerated() {
            let endAngle = startAngle + CGFloat(value / totalValue) * 2 * .pi
            let path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.addArc(withCenter: CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2), radius: innerRadius, startAngle: endAngle, endAngle: startAngle, clockwise: false)
            path.close()
            
            let sliceLayer = CAShapeLayer()
            sliceLayer.path = path.cgPath
            sliceLayer.fillColor = graphColor.cgColor
            self.layer.addSublayer(sliceLayer)
            
            startAngle = endAngle
            
            if showDataLabels {
                let labelAngle = startAngle - (endAngle - startAngle) / 2
                let labelX = self.bounds.width / 2 + radius / 2 * cos(labelAngle)
                let labelY = self.bounds.height / 2 + radius / 2 * sin(labelAngle)
                let label = UILabel(frame: CGRect(x: labelX - 20, y: labelY - 10, width: 40, height: 20))
                label.text = "\(Int(value))"
                label.font = layout.pieLabelFont
                label.textAlignment = .center
                self.addSubview(label)
            }
        }
    }
    
    private func drawWaterfallChart() {
        let maxValue = data.values.max() ?? 1
        let barWidth = layout.barWidth
        let spacing = layout.spacing
        let totalWidth = (self.bounds.width - (layout.padding * 2) - (spacing * CGFloat(data.values.count - 1))) / CGFloat(data.values.count)
        
        var previousValue: CGFloat = 0
        
        for (index, value) in data.values.enumerated() {
            let barHeight = CGFloat(value) / CGFloat(maxValue) * (self.bounds.height - layout.padding * 2)
            let barFrame = CGRect(x: layout.padding + CGFloat(index) * (totalWidth + spacing), y: self.bounds.height - layout.padding - barHeight, width: barWidth, height: barHeight)
            let barView = UIView(frame: barFrame)
            barView.backgroundColor = graphColor
            self.addSubview(barView)
            
            
            if index > 0 {
                let previousPoint = CGPoint(x: layout.padding + CGFloat(index - 1) * (totalWidth + spacing) + barWidth / 2, y: self.bounds.height - layout.padding - previousValue)
                let currentPoint = CGPoint(x: layout.padding + CGFloat(index) * (totalWidth + spacing) + barWidth / 2, y: self.bounds.height - layout.padding - barHeight)
                let linePath = UIBezierPath()
                linePath.move(to: previousPoint)
                linePath.addLine(to: currentPoint)
                
                let lineLayer = CAShapeLayer()
                lineLayer.path = linePath.cgPath
                lineLayer.strokeColor = graphColor.cgColor
                lineLayer.lineWidth = 2
                lineLayer.fillColor = UIColor.clear.cgColor
                self.layer.addSublayer(lineLayer)
            }
            
            previousValue = barHeight
        }
    }
    
    private func drawBoxPlotChart() {
        let maxValue = data.values.max() ?? 1
        let boxWidth = layout.boxWidth
        let spacing = layout.spacing
        
        for (index, value) in data.values.enumerated() {
            let boxHeight = CGFloat(value) / CGFloat(maxValue) * (self.bounds.height - layout.padding * 2)
            let boxFrame = CGRect(x: layout.padding + CGFloat(index) * (boxWidth + spacing), y: self.bounds.height - layout.padding - boxHeight, width: boxWidth, height: boxHeight)
            let boxView = UIView(frame: boxFrame)
            boxView.backgroundColor = graphColor
            self.addSubview(boxView)
        }
    }
    
    private func drawScatterChart() {
        let maxValue = data.values.max() ?? 1
        let pointSize: CGFloat = 5
        
        for (index, value) in data.values.enumerated() {
            let x = layout.padding + CGFloat(index) * (self.bounds.width - layout.padding * 2) / CGFloat(data.values.count)
            let y = self.bounds.height - layout.padding - CGFloat(value) / CGFloat(maxValue) * (self.bounds.height - layout.padding * 2)
            let pointFrame = CGRect(x: x - pointSize / 2, y: y - pointSize / 2, width: pointSize, height: pointSize)
            let pointView = UIView(frame: pointFrame)
            pointView.backgroundColor = graphColor
            pointView.layer.cornerRadius = pointSize / 2
            self.addSubview(pointView)
        }
    }
    
    private func addLegend() {
        let legendView = UIView(frame: CGRect(x: 0, y: self.bounds.height - 50, width: self.bounds.width, height: 50))
        legendView.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        self.addSubview(legendView)
    }
    
    private func addXAxisLabels() {
        let labelColor = layout.xAxisLabelColor
        let font = layout.axisLabelFont
        let yOffset: CGFloat = frame.height - layout.padding
        
        for (index, label) in data.labels.enumerated() {
            let xPosition = CGFloat(index) * (frame.width - 2 * layout.padding) / CGFloat(data.labels.count - 1) + layout.padding
            let labelRect = CGRect(x: xPosition, y: yOffset, width: frame.width / CGFloat(data.labels.count), height: 20)
            
            let labelView = UILabel(frame: labelRect)
            labelView.text = label
            labelView.textColor = labelColor
            labelView.font = font
            labelView.textAlignment = .center
            addSubview(labelView)
        }
    }
    
    private func addYAxisLabels() {
        let labelColor = layout.yAxisLabelColor
        let font = layout.axisLabelFont
        let xOffset: CGFloat = layout.padding
        
        let maxValue = data.values.max() ?? 0
        let minValue = data.values.min() ?? 0
        
        for i in 0...5 {
            let value = minValue + (maxValue - minValue) * Double(i) / 5
            let yPosition = frame.height - layout.padding - CGFloat(i) * (frame.height - 2 * layout.padding) / 5
            
            let labelView = UILabel(frame: CGRect(x: 0, y: yPosition - 10, width: xOffset, height: 20))
            labelView.text = String(format: "%.1f", value)
            labelView.textColor = labelColor
            labelView.font = font
            labelView.textAlignment = .right
            addSubview(labelView)
        }
    }
    
    private func drawGrid() {
        let gridLineColor = layout.gridLineColor
        let gridLineWidth = layout.gridLineWidth
        let xOffset = layout.padding
        let yOffset = frame.height - layout.padding
        let height = frame.height - 2 * layout.padding
        let width = frame.width - 2 * layout.padding
        
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(gridLineColor.cgColor)
        context?.setLineWidth(gridLineWidth)
        

        for i in 0...5 {
            let xPosition = xOffset + CGFloat(i) * width / 5
            context?.move(to: CGPoint(x: xPosition, y: yOffset))
            context?.addLine(to: CGPoint(x: xPosition, y: yOffset - height))
        }
        

        for i in 0...5 {
            let yPosition = yOffset - CGFloat(i) * height / 5
            context?.move(to: CGPoint(x: xOffset, y: yPosition))
            context?.addLine(to: CGPoint(x: xOffset + width, y: yPosition))
        }
        
        context?.strokePath()
    }
    private func addTitle(_ title: String) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 10, width: self.bounds.width, height: 30))
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)
    }
}

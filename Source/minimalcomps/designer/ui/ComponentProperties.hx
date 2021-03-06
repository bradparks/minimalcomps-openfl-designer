package minimalcomps.designer.ui;

import minimalcomps.charts.BarChart;
import minimalcomps.charts.LineChart;
import minimalcomps.charts.PieChart;
import minimalcomps.components.Accordion;
import minimalcomps.components.CheckBox;
import minimalcomps.components.ColorChooser;
import minimalcomps.components.ComboBox;
import minimalcomps.components.Component;
import minimalcomps.components.FPSMeter;
import minimalcomps.components.HRangeSlider;
import minimalcomps.components.HUISlider;
import minimalcomps.components.IndicatorLight;
import minimalcomps.components.Knob;
import minimalcomps.components.Label;
import minimalcomps.components.Meter;
import minimalcomps.components.RangeSlider;
import minimalcomps.components.ScrollPane;
import minimalcomps.components.VBox;
import minimalcomps.components.VRangeSlider;
import minimalcomps.components.VUISlider;
import minimalcomps.components.WheelMenu;
import minimalcomps.components.Window;
import minimalcomps.designer.panel.AccordionPropertyPanel;
import minimalcomps.designer.panel.BarChartPropertyPanel;
import minimalcomps.designer.panel.PropertyPanel;
import minimalcomps.designer.panel.CheckBoxPropertyPanel;
import minimalcomps.designer.panel.ColorChooserPropertyPanel;
import minimalcomps.designer.panel.ComboBoxPropertyPanel;
import minimalcomps.designer.panel.FPSMeterPropertyPanel;
import minimalcomps.designer.panel.IndicatorLightPropertyPanel;
import minimalcomps.designer.panel.KnobPropertyPanel;
import minimalcomps.designer.panel.LabelPropertyPanel;
import minimalcomps.designer.panel.LineChartPropertyPanel;
import minimalcomps.designer.panel.MeterPropertyPanel;
import minimalcomps.designer.panel.PieChartPropertyPanel;
import minimalcomps.designer.panel.RangeSliderPropertyPanel;
import minimalcomps.designer.panel.UISliderPropertyPanel;
import minimalcomps.designer.panel.WheelMenuPropertyPanel;
import minimalcomps.designer.panel.WindowPropertyPanel;
import openfl.display.DisplayObjectContainer;


class ComponentProperties extends ScrollPane {

    //------------------------------
    //  model
    //------------------------------

    private var _component:Component;
    private var _panels:Array<PropertyPanel>;
    private var _vbox:VBox;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        super(parent, xpos, ypos);

        _panels = [];
    }

    override private function addChildren() {
        super.addChildren();

        _vbox = new VBox(this, 4, 4);
        _vbox.width = this.width - 8;
        _vbox.height = this.height - 8;
    }

    public function bind(component:Component):Void {
        _component = component;

        clearPanels();

        var panel:PropertyPanel;

        switch(Type.getClass(_component)) {
            case Accordion:
                panel = new AccordionPropertyPanel(_component, _vbox);
            case BarChart:
                panel = new BarChartPropertyPanel(_component, _vbox);
            case CheckBox:
                panel = new CheckBoxPropertyPanel(_component, _vbox);
            case ComboBox:
                panel = new ComboBoxPropertyPanel(_component, _vbox);
            case ColorChooser:
                panel = new ColorChooserPropertyPanel(_component, _vbox);
            case FPSMeter:
                panel = new FPSMeterPropertyPanel(_component, _vbox);
            case HRangeSlider:
                panel = new RangeSliderPropertyPanel(_component, _vbox);
            case HUISlider:
                panel = new UISliderPropertyPanel(_component, _vbox);
            case IndicatorLight:
                panel = new IndicatorLightPropertyPanel(_component, _vbox);
            case Knob:
                panel = new KnobPropertyPanel(_component, _vbox);
            case Label:
                panel = new LabelPropertyPanel(_component, _vbox);
            case Meter:
                panel = new MeterPropertyPanel(_component, _vbox);
            case LineChart:
                panel = new LineChartPropertyPanel(_component, _vbox);
            case PieChart:
                panel = new PieChartPropertyPanel(_component, _vbox);
            case RangeSlider:
                panel = new RangeSliderPropertyPanel(_component, _vbox);
            case VRangeSlider:
                panel = new RangeSliderPropertyPanel(_component, _vbox);
            // case WheelMenu:
                // panel = new WheelMenuPropertyPanel(_component, _vbox);
            case VUISlider:
                panel = new UISliderPropertyPanel(_component, _vbox);
            case Window:
                panel = new WindowPropertyPanel(_component, _vbox);

            default:
                panel = new PropertyPanel(_component, _vbox);
        }

        if (panel != null) {
            _panels.push(panel);
            panel.width = width;
            panel.height = height;
        }
    }

    private function clearPanels():Void {
        while (_panels.length > 0) {
            var panel:PropertyPanel = _panels.shift();
            panel.dispose();
            _vbox.removeChild(panel);
        }
    }

}

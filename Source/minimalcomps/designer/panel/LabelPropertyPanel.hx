package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.components.Label;
import minimalcomps.designer.panel.property.CheckBoxProperty;
import minimalcomps.designer.panel.property.InputTextProperty;
import openfl.display.DisplayObjectContainer;


class LabelPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _label:Label;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _label = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        _properties.push(new InputTextProperty("text", _label.text, _vbox));
        _properties.push(new CheckBoxProperty("autoSize", _label.autoSize, _vbox));
    }

    override public function initialize():Void {
        super.initialize();

        _label.text = "label text";
    }

    override public function dispose():Void {
        super.dispose();
    }

}

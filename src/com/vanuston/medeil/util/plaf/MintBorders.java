/*
 * Copyright 2005 MH-Software-Entwicklung. All rights reserved.
 * Use is subject to license terms.
 */
package com.vanuston.medeil.util.plaf;

import java.awt.*;
import javax.swing.*;
import javax.swing.border.*;
import javax.swing.plaf.*;


/**
 * @author Michael Hagen
 */
public class MintBorders extends BaseBorders {

    private static Border buttonBorder = null;
    private static Border rolloverToolButtonBorder = null;
    private static Border internalFrameBorder = null;

    //------------------------------------------------------------------------------------
    // Lazy access methods
    //------------------------------------------------------------------------------------
    public static Border getButtonBorder() {
        if (buttonBorder == null) {
            buttonBorder = new ButtonBorder();
        }
        return buttonBorder;
    }

    public static Border getToggleButtonBorder() {
        if (buttonBorder == null) {
            buttonBorder = new ButtonBorder();
        }
        return buttonBorder;
    }

    public static Border getRolloverToolButtonBorder() {
        if (rolloverToolButtonBorder == null) {
            rolloverToolButtonBorder = new RolloverToolButtonBorder();
        }
        return rolloverToolButtonBorder;
    }

    public static Border getInternalFrameBorder() {
        if (internalFrameBorder == null) {
            internalFrameBorder = new InternalFrameBorder();
        }
        return internalFrameBorder;
    }

    //------------------------------------------------------------------------------------
    // Implementation of border classes
    //------------------------------------------------------------------------------------
    public static class ButtonBorder implements Border, UIResource {

        private static final Insets insets = new Insets(3, 12, 5, 14);

        public void paintBorder(Component c, Graphics g, int x, int y, int w, int h) {
        }

        public Insets getBorderInsets(Component c) {
            return insets;
        }

        public boolean isBorderOpaque() {
            return false;
        }
    } // class ButtonBorder

    public static class RolloverToolButtonBorder implements Border, UIResource {

        private static final Insets insets = new Insets(1, 1, 1, 1);

        public void paintBorder(Component c, Graphics g, int x, int y, int w, int h) {
            AbstractButton button = (AbstractButton) c;
            ButtonModel model = button.getModel();
            Color frameColor = ColorHelper.darker(AbstractLookAndFeel.getToolbarBackgroundColor(), 20);
            if (model.isEnabled()) {
                if ((model.isPressed() && model.isArmed()) || model.isSelected()) {
                    Graphics2D g2D = (Graphics2D) g;
                    Composite composite = g2D.getComposite();
                    g.setColor(frameColor);
                    g.drawRect(x, y, w - 1, h - 1);
                    AlphaComposite alpha = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.15f);
                    g2D.setComposite(alpha);
                    g.setColor(Color.black);
                    g.fillRect(x + 1, y + 1, w - 2, h - 2);
                    g2D.setComposite(composite);
                } else if (model.isRollover()) {
                    Graphics2D g2D = (Graphics2D) g;
                    Composite composite = g2D.getComposite();
                    g.setColor(frameColor);
                    g.drawRect(x, y, w - 1, h - 1);
                    AlphaComposite alpha = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.4f);
                    g2D.setComposite(alpha);
                    g.setColor(Color.white);
                    g.fillRect(x + 1, y + 1, w - 2, h - 2);
                    g2D.setComposite(composite);
                }
            }
        }

        public Insets getBorderInsets(Component c) {
            return insets;
        }

        public boolean isBorderOpaque() {
            return true;
        }
    } // class RolloverToolButtonBorder

    public static class InternalFrameBorder extends BaseInternalFrameBorder {

        public void paintBorder(Component c, Graphics g, int x, int y, int w, int h) {
            boolean active = isActive(c);
            boolean resizable = isResizable(c);
            if (!resizable) {
                Color frameColor = MintLookAndFeel.getFrameColor();
                Color borderColor = MintLookAndFeel.getWindowInactiveBorderColor();
                if (active) {
                    borderColor = MintLookAndFeel.getWindowBorderColor();
                }
                Color cHi = ColorHelper.brighter(frameColor, 40);
                Color cLo = frameColor;
                NewClass.draw3DBorder(g, cHi, cLo, x, y, w, h);
                g.setColor(borderColor);
                for (int i = 1; i < dw; i++) {
                    g.drawRect(i, i, w - (2 * i) - 1, h - (2 * i) - 1);
                }
                return;
            }
            h--;
            w--;
            Color color = MintLookAndFeel.getWindowInactiveBorderColor();
            if (active) {
                color = MintLookAndFeel.getWindowBorderColor();
            }

            // links
            g.setColor(color);
            g.drawLine(x, y, x, y + h);
            g.setColor(ColorHelper.brighter(color, 60));
            g.drawLine(x + 1, y + 1, x + 1, y + h - 1);
            g.setColor(ColorHelper.brighter(color, 40));
            g.drawLine(x + 2, y + 2, x + 2, y + h - 2);
            g.setColor(ColorHelper.brighter(color, 20));
            g.drawLine(x + 3, y + 3, x + 3, y + h - 3);
            g.setColor(color);
            g.drawLine(x + 4, y + 4, x + 4, y + h - 4);

            // rechts
            g.setColor(color);
            g.drawLine(x + w, y, x + w, y + h);
            g.setColor(ColorHelper.brighter(color, 20));
            g.drawLine(x + w - 1, y + 1, x + w - 1, y + h - 1);
            g.setColor(ColorHelper.brighter(color, 40));
            g.drawLine(x + w - 2, y + 2, x + w - 2, y + h - 2);
            g.setColor(ColorHelper.brighter(color, 60));
            g.drawLine(x + w - 3, y + 3, x + w - 3, y + h - 3);
            g.setColor(color);
            g.drawLine(x + w - 4, y + 4, x + w - 4, y + h - 4);

            // oben
            g.setColor(color);
            g.drawLine(x, y, x + w, y);
            g.setColor(ColorHelper.brighter(color, 60));
            g.drawLine(x + 1, y + 1, x + w - 1, y + 1);
            g.setColor(ColorHelper.brighter(color, 40));
            g.drawLine(x + 2, y + 2, x + w - 2, y + 2);
            g.setColor(ColorHelper.brighter(color, 20));
            g.drawLine(x + 3, y + 3, x + w - 3, y + 3);
            g.setColor(color);
            g.drawLine(x + 4, y + 4, x + w - 4, y + 4);

            // unten
            g.setColor(color);
            g.drawLine(x, y + h, x + w, y + h);
            g.setColor(ColorHelper.brighter(color, 20));
            g.drawLine(x + 1, y + h - 1, x + w - 1, y + h - 1);
            g.setColor(ColorHelper.brighter(color, 40));
            g.drawLine(x + 2, y + h - 2, x + w - 2, y + h - 2);
            g.setColor(ColorHelper.brighter(color, 60));
            g.drawLine(x + 3, y + h - 3, x + w - 3, y + h - 3);
            g.setColor(color);
            g.drawLine(x + 4, y + h - 4, x + w - 4, y + h - 4);
        }
    } // class InternalFrameBorder
} // class MintBorders


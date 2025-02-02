/*
 * Copyright 2005 MH-Software-Entwicklung. All rights reserved.
 * Use is subject to license terms.
 */
package com.vanuston.medeil.util.plaf;

import java.awt.*;
import javax.swing.*;
import javax.swing.plaf.basic.BasicArrowButton;

//import com.jtattoo.plaf.icons.*;

/**
 * @author Michael Hagen
 */
public class BaseScrollButton extends BasicArrowButton {

    protected int buttonWidth = 24;

    public BaseScrollButton(int direction, int width) {
        super(direction);
        buttonWidth = width;
    }

    public void paint(Graphics g) {
        boolean isPressed = getModel().isPressed();
        boolean isRollover = getModel().isRollover();

        int width = getWidth();
        int height = getHeight();

        Color colors[] = null;
        if (isPressed) {
            colors = AbstractLookAndFeel.getTheme().getPressedColors();
        } else if (isRollover) {
            colors = AbstractLookAndFeel.getTheme().getRolloverColors();
        } else if (!NewClass.isActive(this)) {
            colors = AbstractLookAndFeel.getTheme().getInActiveColors();
        } else {
            colors = AbstractLookAndFeel.getTheme().getButtonColors();
        }

        Color frameColorHi = ColorHelper.brighter(colors[0], 20);
        Color frameColorLo = ColorHelper.darker(colors[colors.length - 1], 20);

        if ((getDirection() == NORTH) || (getDirection() == SOUTH)) {
            NewClass.fillVerGradient(g, colors, 0, 0, width, height);
        } else {
            NewClass.fillHorGradient(g, colors, 0, 0, width, height);
        }
        if (getDirection() == NORTH) {
            Icon upArrow = BaseIcons.getUpArrowIcon();
            int x = (width / 2) - (upArrow.getIconWidth() / 2);
            int y = (height / 2) - (upArrow.getIconHeight() / 2) - 1;
            upArrow.paintIcon(this, g, x, y);
        } else if (getDirection() == SOUTH) {
            Icon downArrow = BaseIcons.getDownArrowIcon();
            int x = (width / 2) - (downArrow.getIconWidth() / 2);
            int y = (height / 2) - (downArrow.getIconHeight() / 2);
            downArrow.paintIcon(this, g, x, y);
        } else if (getDirection() == WEST) {
            Icon leftArrow = BaseIcons.getLeftArrowIcon();
            int x = (width / 2) - (leftArrow.getIconWidth() / 2) - 1;
            int y = (height / 2) - (leftArrow.getIconHeight() / 2);
            leftArrow.paintIcon(this, g, x, y);
        } else {
            Icon rightArrow = BaseIcons.getRightArrowIcon();
            int x = (width / 2) - (rightArrow.getIconWidth() / 2);
            int y = (height / 2) - (rightArrow.getIconHeight() / 2);
            rightArrow.paintIcon(this, g, x, y);
        }
        NewClass.draw3DBorder(g, frameColorLo, ColorHelper.darker(frameColorLo, 10), 0, 0, width, height);
        g.setColor(frameColorHi);
        g.drawLine(1, 1, width - 2, 1);
        g.drawLine(1, 1, 1, height - 2);
    }

    public Dimension getPreferredSize() {
        if (getDirection() == NORTH) {
            return new Dimension(buttonWidth, buttonWidth + 1);
        } else if (getDirection() == SOUTH) {
            return new Dimension(buttonWidth, buttonWidth + 1);
        } else if (getDirection() == EAST) {
            return new Dimension(buttonWidth + 1, buttonWidth);
        } else if (getDirection() == WEST) {
            return new Dimension(buttonWidth + 1, buttonWidth);
        } else {
            return new Dimension(0, 0);
        }
    }

    public Dimension getMinimumSize() {
        return getPreferredSize();
    }

    public Dimension getMaximumSize() {
        return new Dimension(Integer.MAX_VALUE, Integer.MAX_VALUE);
    }

    public int getButtonWidth() {
        return buttonWidth;
    }
}


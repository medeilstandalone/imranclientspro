/*
 * Copyright 2005 MH-Software-Entwicklung. All rights reserved.
 * Use is subject to license terms.
 */

package com.vanuston.medeil.util.plaf;


import java.awt.*;
import javax.swing.*;
import javax.swing.plaf.*;
import javax.swing.plaf.basic.*;
import javax.swing.border.*;

/**
 *
 * @author Michael Hagen
 */
public class BaseSpinnerUI extends BasicSpinnerUI {
    /**
     * Used by the default LayoutManager class - SpinnerLayout for 
     * missing (null) editor/nextButton/previousButton children.
     */
    private static final Dimension zeroSize = new Dimension(0, 0);

    private MyLayoutManager myLayoutManager = null;
    
    /**
     * Returns a new instance of BaseSpinnerUI.  SpinnerListUI 
     * delegates are allocated one per JSpinner.  
     * 
     * @param c the JSpinner (not used)
     * @see ComponentUI#createUI
     * @return a new BasicSpinnerUI object
     */
    public static ComponentUI createUI(JComponent c) {
        return new BaseSpinnerUI();
    }
    
    /**
     * Create a <code>LayoutManager</code> that manages the <code>editor</code>, 
     * <code>nextButton</code>, and <code>previousButton</code> 
     * children of the JSpinner.  These three children must be
     * added with a constraint that identifies their role: 
     * "Editor", "Next", and "Previous". The default layout manager 
     * can handle the absence of any of these children.
     * 
     * @return a LayoutManager for the editor, next button, and previous button.
     * @see #createNextButton
     * @see #createPreviousButton
     * @see #createEditor
     */
    protected LayoutManager createLayout() {
        if (myLayoutManager == null) {
            myLayoutManager = new MyLayoutManager();
        }
        return myLayoutManager;
    }
    
    protected Component createNextButton() {
        JButton button = new SpinButton(SwingConstants.NORTH);
        if (NewClass.isLeftToRight(spinner)) {
            Border border = BorderFactory.createMatteBorder(0, 1, 1, 0, AbstractLookAndFeel.getFrameColor());
            button.setBorder(border);
        } else {
            Border border = BorderFactory.createMatteBorder(0, 0, 1, 1, AbstractLookAndFeel.getFrameColor());
            button.setBorder(border);
        }
        installNextButtonListeners(button);
        return button;
    }
    
    protected Component createPreviousButton() {
        JButton button = new SpinButton(SwingConstants.SOUTH);
        if (NewClass.isLeftToRight(spinner)) {
            Border border = BorderFactory.createMatteBorder(0, 1, 0, 0, AbstractLookAndFeel.getFrameColor());
            button.setBorder(border);
        } else {
            Border border = BorderFactory.createMatteBorder(0, 0, 0, 1, AbstractLookAndFeel.getFrameColor());
            button.setBorder(border);
        }
        installPreviousButtonListeners(button);
        return button;
    }
    
    
//------------------------------------------------------------------------------
    public static class SpinButton extends NoFocusButton {
        private static Dimension minSize = new Dimension(14, 12);
        private int direction = SwingConstants.NORTH;
        
        public SpinButton(int aDirection) {
            super();
            setInheritsPopupMenu(true);
            direction = aDirection;
        }
        
        public Dimension getPreferredSize() {
            Dimension size = super.getPreferredSize();
            size.width = Math.max(size.width, minSize.width);
            size.height = Math.max(size.height, minSize.height);
            return size;
        }

        public void paint(Graphics g) {
            Color colors[] = null;
            ButtonModel model = getModel();
            if (isEnabled()) {
                if (model.isPressed() && model.isArmed())
                    colors = AbstractLookAndFeel.getTheme().getPressedColors();
                else {
                    if (model.isRollover())
                        colors = AbstractLookAndFeel.getTheme().getRolloverColors();
                    else if (NewClass.isFrameActive(this))
                        colors = AbstractLookAndFeel.getTheme().getButtonColors();
                    else
                        colors = AbstractLookAndFeel.getTheme().getInActiveColors();
                }
            }
            else
                colors = AbstractLookAndFeel.getTheme().getDisabledColors();
            NewClass.fillHorGradient(g, colors, 0, 0, getWidth(), getHeight());
            paintBorder(g);
            g.setColor(getForeground());
            int w = 4;
            int h = 3;
            int x = (getWidth() - w) / 2;
            int y = (getHeight() - h) / 2;
            if (direction == SwingConstants.NORTH) {
                for (int i = 0; i < h; i++) {
                    g.drawLine(x + (h - i) - 1, y + i, x + w - (h - i) + 1, y + i);
                }
            } else {
                for (int i = 0; i < h; i++) {
                    g.drawLine(x + i, y + i, x + w - i, y + i);
                }
            }
        }
        
    }
    
//------------------------------------------------------------------------------
    private static class MyLayoutManager implements LayoutManager {
        //
        // LayoutManager
        //
        private Component nextButton = null;
        private Component previousButton = null;
        private Component editor = null;
        
        public void addLayoutComponent(String name, Component c) {
            if ("Next".equals(name)) {
                nextButton = c;
            } else if ("Previous".equals(name)) {
                previousButton = c;
            } else if ("Editor".equals(name)) {
                editor = c;
            }
        }
        
        public void removeLayoutComponent(Component c) {
            if (c == nextButton) {
                c = null;
            } else if (c == previousButton) {
                previousButton = null;
            } else if (c == editor) {
                editor = null;
            }
        }
        
        private Dimension preferredSize(Component c) {
            return (c == null) ? zeroSize : c.getPreferredSize();
        }
        
        public Dimension preferredLayoutSize(Container parent) {
            Dimension nextD = preferredSize(nextButton);
            Dimension previousD = preferredSize(previousButton);
            Dimension editorD = preferredSize(editor);
            
            // Force the editors height to be a multiple of 2
            editorD.height = ((editorD.height + 1) / 2) * 2;
            
            Dimension size = new Dimension(editorD.width, editorD.height);
            size.width += Math.max(nextD.width, previousD.width);
            Insets insets = parent.getInsets();
            size.width += insets.left + insets.right;
            size.height += insets.top + insets.bottom + 4;
            return size;
        }
        
        public Dimension minimumLayoutSize(Container parent) {
            return preferredLayoutSize(parent);
        }
        
        private void setBounds(Component c, int x, int y, int width, int height) {
            if (c != null) {
                c.setBounds(x, y, width, height);
            }
        }
        
        public void layoutContainer(Container parent) {
            int width  = parent.getWidth();
            int height = parent.getHeight();
            
            Insets insets = parent.getInsets();
            Dimension nextD = preferredSize(nextButton);
            Dimension previousD = preferredSize(previousButton);
            int buttonsWidth = Math.max(nextD.width, previousD.width);
            int editorHeight = height - (insets.top + insets.bottom);
            
            // The arrowButtonInsets value is used instead of the JSpinner's
            // insets if not null. Defining this to be (0, 0, 0, 0) causes the
            // buttons to be aligned with the outer edge of the spinner's
            // border, and leaving it as "null" places the buttons completely
            // inside the spinner's border.
            Insets buttonInsets = UIManager.getInsets("Spinner.arrowButtonInsets");
            if (buttonInsets == null) {
                buttonInsets = insets;
            }
            
            // Deal with the spinner's componentOrientation property.
            int editorX, editorWidth, buttonsX;
            if (parent.getComponentOrientation().isLeftToRight()) {
                editorX = insets.left;
                editorWidth = width - insets.left - buttonsWidth - buttonInsets.right;
                buttonsX = width - buttonsWidth - buttonInsets.right;
            } else {
                buttonsX = buttonInsets.left;
                editorX = buttonsX + buttonsWidth;
                editorWidth = width - buttonInsets.left - buttonsWidth - insets.right;
            }
            
            int nextY = buttonInsets.top;
            int nextHeight = (height / 2) + (height % 2) - nextY;
            int previousY = buttonInsets.top + nextHeight;
            int previousHeight = height - previousY - buttonInsets.bottom;
            
            setBounds(editor,         editorX,  insets.top, editorWidth, editorHeight);
            setBounds(nextButton,     buttonsX, nextY,      buttonsWidth, nextHeight);
            setBounds(previousButton, buttonsX, previousY,  buttonsWidth, previousHeight);
        }
        
    }
    
}

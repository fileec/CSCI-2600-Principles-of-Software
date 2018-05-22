package hw9;

import java.awt.*;
import java.awt.geom.*;
import java.awt.image.*;
import java.io.*;
import java.util.*;
import javax.imageio.*;
import javax.swing.*;

@SuppressWarnings("serial")
public class MapPanel extends JPanel//SimplePaintMain
{
	private BufferedImage map;
	private double x0;
	private double y0;
	private double x1;
	private double y1;
	private double width_ratio;
	private double height_ratio;
	private int new_width;
	private int new_height;
	ArrayList<ArrayList<Double>> coordinates;
	public MapPanel()//http://blog.csdn.net/fykhlp/article/details/6204714
	{
		coordinates = null;		
		x0 = 0;
		y0 = 0;
		x1 = 0;
		y1 = 0;
		this.setLayout(new FlowLayout(FlowLayout.LEFT));
		try
		{
			BufferedImage readImage = ImageIO.read(
					new File("hw9/data/RPI_campus_map_2010_extra_nodes_edges.png"));
			BufferedImage subImage = readImage.getSubimage(0, 0, readImage.getWidth(),
					readImage.getHeight() - 1400);
			map = getScaledImage(subImage, (int)(subImage.getWidth(null) / 2.7),
					(int)(subImage.getHeight(null) / 2.7));
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		new_width = map.getWidth();
		new_height = map.getHeight();
		this.setPreferredSize(new Dimension(new_width, new_height));
		width_ratio = new_width / 2175.000;
		height_ratio = new_height / 2000.000;
	}
	@Override
	public Dimension getPreferredSize()
	{
		return new Dimension(new_width, new_height);
	}
	@Override
	public void paintComponent(Graphics g)//http://www.weixueyuan.net/view/6074.html
	{
		super.paintComponent(g);
		Graphics2D g2d = (Graphics2D) g;
		this.setPreferredSize(new Dimension(new_width, new_height));
		g2d.drawImage(map, 0, 0, map.getWidth(), map.getHeight(), null);
		if (coordinates != null)
			drawTheCoordinates(g2d);
		drawThePoints(g2d);
		this.setSize((new Dimension(new_width, new_height)));
	}
	private void drawThePoints(Graphics2D g2d)
	{
		if (x0 != 0 && y0 != 0)
		{
			g2d.setColor(Color.BLACK);
			g2d.fillOval((int)(x0 * width_ratio), (int)(y0 * height_ratio), 12, 12);
		}
		if (x1 != 0 && y1 != 0)
		{
			g2d.setColor(Color.RED);
			g2d.fillOval((int)(x1 * width_ratio), (int)(y1 * height_ratio), 12, 12);
		}
	}
	private void drawTheCoordinates(Graphics2D g)
	{
		int currentX = (int) (x0 * width_ratio);
		int currentY = (int) (y0 * height_ratio);
		for (ArrayList<Double> coordinate : coordinates)
		{
			int nextX = (int) (coordinate.get(0) * width_ratio) + 1;
			int nextY = (int) (coordinate.get(1) * height_ratio) + 1;
			g.setStroke(new BasicStroke(3.0f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
			g.setColor(Color.BLUE);
			g.drawLine(currentX, currentY, nextX, nextY);
			currentX = nextX;
			currentY = nextY;
		}
		coordinates = null;
	}
	public void reset()
	{
		x0 = 0;
		y0 = 0;
		x1 = 0;
		y1 = 0;
		coordinates = null;
		this.repaint();
	}
	private BufferedImage getScaledImage(BufferedImage original, int width, int height)
	//https://www.programcreek.com/java-api-examples/java.awt.image.AffineTransformOp
	{
		double X = (double) width / 2175;
		double Y = (double) height / 2000;
		AffineTransform scale = AffineTransform.getScaleInstance(X, Y);
		AffineTransformOp bilinear = new AffineTransformOp(scale, AffineTransformOp.TYPE_BILINEAR);
		return bilinear.filter(original, new BufferedImage(width, height, original.getType()));
	}
	public void setStartingPoints(double x0, double y0)//make sure the dot fill the circle
	{
		this.x0 = x0 - 14;
		this.y0 = y0 - 13;
	}
	public void setDestinationPoints(double x1, double y1)
	{
		this.x1 = x1 - 14;
		this.y1 = y1 - 13;
	}
	public void setCurrentPath(ArrayList<ArrayList<Double>> coordinates)//set coordinate
	{
		this.coordinates = coordinates;
	}
}

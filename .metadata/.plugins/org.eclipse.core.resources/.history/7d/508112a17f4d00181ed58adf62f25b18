package hw9;

import java.awt.event.*;
import java.util.*;
import javax.swing.event.*;
import hw7.*;
import hw4.*;

public class CampusPathsGuiController
{
	private static CampusMapGraph Model;
	private static CampusPathsGuiView View;
	private String start;
	private String end;
	private double x0;
	private double y0;
	private double x1;
	private double y1;
	@SuppressWarnings("static-access")
	public CampusPathsGuiController(CampusPathsGuiView View, CampusMapGraph Model)
	{
		this.View = View;
		this.Model = Model;
		x0 = 0.0;
		y0 = 0.0;
		x1 = 0.0;
		y1 = 0.0;
		View.addFindPathtistener(new FindPathHandler());
		View.addStartListener(new StartSelectionHandler());
		View.addDestListener(new DestSelectionHandler());
		View.addResetListener(new ResetHandler());
	}
	public void notifyViewOfBuildings()
	{
		View.updateBuildingLists(Model.getBuildings());
	}
	private class StartSelectionHandler implements ListSelectionListener
	{
		public void valueChanged(ListSelectionEvent e)
		{
			start = View.getStart();
			x0 = Model.getX(start);
			y0 = Model.getY(start);
			View.updatePoints(x0, y0, x1, y1);
		}
	}
	private class DestSelectionHandler implements ListSelectionListener
	{
		public void valueChanged(ListSelectionEvent e)
		{
			end = View.getDestination();
			x1 = Model.getX(end);
			y1 = Model.getY(end);
			View.updatePoints(x0, y0, x1, y1);
		}
	}
	private class FindPathHandler implements ActionListener//ButtonDemo1.java
	{
		@Override
		public void actionPerformed(ActionEvent e)
		{
			start = View.getStart();
			end = View.getDestination();
			ArrayList<Edge<Coordinate, Double>> path = Model.FindPath(start, end);
			ArrayList<ArrayList<Double>> coordinates = new ArrayList<ArrayList<Double>>();
			for (Edge<Coordinate, Double> edge : path)
			{
				ArrayList<Double> next = new ArrayList<Double>();
				Coordinate current = edge.getNode();
				next.add(current.getX());
				next.add(current.getY());
				coordinates.add(next);
			}
			View.updatePath(coordinates);
		}
	}
	private class ResetHandler implements ActionListener
	{
		@Override
		public void actionPerformed(ActionEvent e)
		{
			View.reset();
		}
	}
}
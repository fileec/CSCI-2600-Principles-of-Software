package hw9;

import javax.swing.*;
import hw7.*;

public class RPICampusPathsMain//https://examples.javacodegeeks.com/core-java/java-swing-mvc-example/
{
	public static void main(String[] args)
	{
        SwingUtilities.invokeLater(new Runnable()
        {
            public void run()
            {
            	try
            	{
            		CampusMapGraph Model = new CampusMapGraph();
            		CampusPathsGuiView View = new CampusPathsGuiView();
            		Model.createNewGraph("hw7/data/RPI_map_data_Nodes.csv",
            				"hw7/data/RPI_map_data_Edges.csv");
            		CampusPathsGuiController controller = new CampusPathsGuiController(View, Model);
            		controller.notifyViewOfBuildings();
            		View.setVisible(true);
            	}
            	catch(Exception e)
            	{
            		e.printStackTrace();
            	}
            }
        });
	}
}

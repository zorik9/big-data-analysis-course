
echo "update the package lists for upgrades"
sudo apt-get update -y

if [ $? -eq 0 ]
then
  echo "List of packages for upgrade, have been successfully updated"
else
  echo "Failed to update list of packages for upgrades (sudo apt-get update - failed)" >&2
  exit 1
fi

echo "add OpenJDK's PPA & install jdk 8"
sudo add-apt-repository ppa:openjdk-r/ppa \
&& sudo apt-get update -q \
&& sudo apt install -y openjdk-8-jdk

if [ $? -eq 0 ]
then
  echo "Jdk 8 has been successfully installed"
else
  echo "Failed to install Jdk 8" >&2
  exit 1
fi

echo "download hadoop 2.7 distribution"
cd /opt
sudo wget http://apache.mivzakim.net/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz

if [ $? -eq 0 ]
then
  echo "hadoop2.7 has been successfully downloaded"
else
  echo "Failed to download hadoop2.7" >&2
  exit 1
fi

echo "extract hadoop2 tar file"
sudo tar -xzf spark-2.4.0-bin-hadoop2.7.tgz

if [ $? -eq 0 ]
then
  echo "hadoop2.7 tar file has been successfully extracted"
else
  echo "Failed to extract hadoop2.7 tar file" >&2
  exit 1
fi

echo "move spark-2.4.0-bin-hadoop2.7 to /opt/spark directory"
sudo mv spark-2.4.0-bin-hadoop2.7 /opt/spark
if [ $? -eq 0 ]
then
  echo "spark-2.4.0-bin-hadoop2.7 has been successfully moved to /opt/spark directory"
else
  echo "Failed to move spark-2.4.0-bin-hadoop2.7 to /opt/spark directory" >&2
  exit 1
fi

echo "updating SPARK_HOME environment variable"
echo 'export SPARK_HOME=/opt/spark' >> ~/.bashrc 
echo 'PATH=$SPARK_HOME/bin:$PATH' >> ~/.bashrc

echo "installing python3-pip"
sudo apt install python3-pip -y

if [ $? -eq 0 ]
then
  echo "python3-pip has been successfully installed"
else
  echo "Failed to install python3-pip" >&2
  exit 1
fi

echo "installing jupyter"
pip3 install jupyter
if [ $? -eq 0 ]
then
  echo "jupyter has been successfully installed"
else
  echo "Failed to install jupyter" >&2
  exit 1
fi

echo "updating PYSPARK_PYTHON, PYSPARK_DRIVER_PYTHON, PYSPARK_DRIVER_PYTHON_OPTS environment variables"
echo 'export PATH=$PATH:~/.local/bin/' >> ~/.bashrc 
echo 'export PYSPARK_PYTHON=python3' >> ~/.bashrc
echo 'export PYSPARK_DRIVER_PYTHON=jupyter' >> ~/.bashrc 
echo "export PYSPARK_DRIVER_PYTHON_OPTS='notebook'" >> ~/.bashrc


echo "installing matplotlib"
pip3 install matplotlib
if [ $? -eq 0 ]
then
  echo "matplotlib has been successfully installed"
else
  echo "Failed to install matplotlib" >&2
  exit 1
fi

echo "installing pandas"
pip3 install pandas
if [ $? -eq 0 ]
then
  echo "pandas has been successfully installed"
else
  echo "Failed to install pandas" >&2
  exit 1
fi

echo "installing pyspark_dist_explore"
pip3 install pyspark_dist_explore
if [ $? -eq 0 ]
then
  echo "pyspark_dist_explore has been successfully installed"
else
  echo "Failed to install pyspark_dist_explore" >&2
  exit 1
fi

echo "installing seaborn"
pip3 install seaborn
if [ $? -eq 0 ]
then
  echo "seaborn has been successfully installed"
else
  echo "Failed to install seaborn" >&2
  exit 1
fi

echo "installing wheel"
pip3 install wheel
if [ $? -eq 0 ]
then
  echo "wheel has been successfully installed"
else
  echo "Failed to install wheel" >&2
  exit 1
fi
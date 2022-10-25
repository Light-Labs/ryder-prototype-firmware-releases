$COM_PORT = $args[0].ToString();
$port= new-Object System.IO.Ports.SerialPort $COM_PORT,115200,None,8,one
$port.ReceivedBytesThreshold = 1;
$port.open();

$data = new-object byte[] 1;
$data[0] = 0x0D;
$port.Write($data, 0, 1);

sleep(1);
$bytes_to_read = $port.BytesToRead;
Write-Host "Received bytes: " $bytes_to_read.ToString();

$recbuf = new-object byte[] $bytes_to_read;
for ($i = 0; $i -lt $bytes_to_read; $i++)
{
    $recbuf[$i] = [byte]$port.ReadByte();
    Write-Host $recbuf[$i].ToString();
}

# Check for "Wait for user input".
if ($recbuf[$i] -eq 0x0A) 
{
    while(true)
    {
        sleep(1);
        $bytes_to_read = $port.BytesToRead;

        if ($bytes_to_read -ne 0) 
        {
            break;
        }
    }
}

for ($i = 0; $i -lt $bytes_to_read; $i++)
{
    $recbuf[$i] = [byte]$port.ReadByte();
    Write-Host $recbuf[$i].ToString();
}

$port.Close();
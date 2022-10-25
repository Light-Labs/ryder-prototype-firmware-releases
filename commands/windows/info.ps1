$COM_PORT = $args[0].ToString();
$port= new-Object System.IO.Ports.SerialPort $COM_PORT,115200,None,8,one
$port.ReceivedBytesThreshold = 1;
$port.open();

$data = new-object byte[] 1;
#$data[0] = 0x0D;
#$data[0] = 0x0A;
$data[0] = 0x02;
$port.Write($data, 0, 1);

sleep(2);

$bytes_to_read = $port.BytesToRead;
Write-Host "Received bytes: " $bytes_to_read.ToString();

$recbuf = new-object byte[] $bytes_to_read;
for ($i = 0; $i -lt $bytes_to_read; $i++)
{
    $recbyte = [byte]$port.ReadByte();
    # Check for escape bytes.
    if ($recbyte -eq 0x06) 
    { 
        $i = $i - 1;
        $bytes_to_read = $bytes_to_read - 1;
        continue; 
    }
    $recbuf[$i] = $recbyte;
}
Write-Host ($(If ($recbuf[10] -eq 1) {"I"} Else {"Uni"}) + "nitialised Ryder FW version " + $recbuf[6].ToString() + "." + $recbuf[7].ToString() + "." + $recbuf[8].ToString())

$port.Close();
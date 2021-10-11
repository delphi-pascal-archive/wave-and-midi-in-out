unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, MMSYSTEM, StdCtrls;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    ComboBox3: TComboBox;
    Label3: TLabel;
    ComboBox4: TComboBox;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DefinirDefaut(Sender: TObject);
  private
    { Déclarations privées }
    procedure GetWaveOutDevice(l:tstrings);
    procedure GetWaveInDevice(l:tstrings);
    procedure GetMidiOutDevice(l:tstrings);
    procedure GetMidiInDevice(l:tstrings);

    Function GetPreferredWaveoutDevice:cardinal;
    Function GetPreferredWaveInDevice:cardinal;
    Function GetPreferredMidioutDevice:cardinal;
    Function GetPreferredMidiInDevice:cardinal;

    Function SetPreferredWaveoutDevice(dev:cardinal):cardinal;
    Function SetPreferredWaveInDevice(dev:cardinal):cardinal;
    Function SetPreferredMidioutDevice(dev:cardinal):cardinal;
    Function SetPreferredMidiInDevice(dev:cardinal):cardinal;

  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
 DRVM_MAPPER=$2000;
 DRVM_MAPPER_PREFERRED_GET =DRVM_MAPPER+21;
 DRVM_MAPPER_PREFERRED_SET =DRVM_MAPPER+22;

// Waveout
Function TForm1.GetPreferredWaveoutDevice:cardinal;
var
 DWord2Ptr :cardinal;
begin
 result:=$FFFFFFFF;
 DWord2Ptr:=0;
 waveOutMessage(WAVE_MAPPER,DRVM_MAPPER_PREFERRED_GET,dword(@result),dword(@DWord2Ptr));
end;

Function TForm1.SetPreferredWaveoutDevice(dev:cardinal):cardinal;
begin
 result := waveOutMessage(WAVE_MAPPER,DRVM_MAPPER_PREFERRED_SET,dev,0);
end;

procedure TForm1.GetwaveOutDevice(l:tstrings);
var
 i:integer;
 caps:WaveOutCapsA;
begin
 l.Clear;
 for i:=0 to waveOutGetNumDevs-1 do
  begin
   waveOutGetDevCapsA(i,@caps,sizeof(caps));
   l.add(inttostr(i)+': '+caps.szPname);
  end;
end;

// WaveIn
Function TForm1.GetPreferredWaveInDevice:cardinal;
var
 DWord2Ptr :cardinal;
begin
 result:=$FFFFFFFF;
 DWord2Ptr:=0;
 waveInMessage(WAVE_MAPPER,DRVM_MAPPER_PREFERRED_GET,dword(@result),dword(@DWord2Ptr));
end;

Function TForm1.SetPreferredWaveInDevice(dev:cardinal):cardinal;
begin
 result := waveInMessage(WAVE_MAPPER,DRVM_MAPPER_PREFERRED_SET, dev,0);
end;

procedure TForm1.GetwaveInDevice(l:tstrings);
var
 i:integer;
 caps:WaveInCapsA;
begin
 l.Clear;
 for i:=0 to waveInGetNumDevs-1 do
  begin
   waveInGetDevCapsA(i,@caps,sizeof(caps));
   l.add(inttostr(i)+': '+caps.szPname);
  end;
end;

// MidiOut
Function TForm1.GetPreferredMidiOutDevice:cardinal;
var
 DWord2Ptr :cardinal;
begin
 result:=$FFFFFFFF;
 DWord2Ptr:=0;
 MidiOutMessage(MIDI_MAPPER,DRVM_MAPPER_PREFERRED_GET,dword(@result),dword(@DWord2Ptr));
end;

Function TForm1.SetPreferredMidiOutDevice(dev:cardinal):cardinal;
begin
  result := MidiOutMessage(MIDI_MAPPER,DRVM_MAPPER_PREFERRED_SET, dev,0);
end;

procedure TForm1.GetMidiOutDevice(l:tstrings);
var
 i:integer;
 caps:MidiOutCapsA;
begin
 l.Clear;
 for i:=0 to MidiOutGetNumDevs-1 do
  begin
   MidiOutGetDevCapsA(i,@caps,sizeof(caps));
   l.add(inttostr(i)+': '+caps.szPname);
  end;
end;

// MidiIn
Function TForm1.GetPreferredMidiInDevice:cardinal;
var
 DWord2Ptr :cardinal;
begin
 result:=$FFFFFFFF;
 DWord2Ptr:=0;
 MidiInMessage(MIDI_MAPPER,DRVM_MAPPER_PREFERRED_GET,dword(@result),dword(@DWord2Ptr));
end;

Function TForm1.SetPreferredMidiInDevice(dev:cardinal):cardinal;
begin
  result := MidiInMessage(MIDI_MAPPER,DRVM_MAPPER_PREFERRED_SET,  dev,0);
end;

procedure TForm1.GetMidiInDevice(l:tstrings);
var
 i:integer;
 caps:MidiInCapsA;
begin
 l.Clear;
 for i:=0 to MidiInGetNumDevs-1 do
  begin
   MidiInGetDevCapsA(i,@caps,sizeof(caps));
   l.add(inttostr(i)+': '+caps.szPname);
  end;
end;

//=========================================================================

procedure TForm1.FormCreate(Sender: TObject);
begin
 GetWaveOutDevice(ComboBox1.Items);
 ComboBox1.ItemIndex:=GetPreferredWaveoutDevice;
 GetWaveInDevice(ComboBox2.Items);
 ComboBox2.ItemIndex:=GetPreferredWaveInDevice;
 GetMidiOutDevice(ComboBox3.Items);
 ComboBox3.ItemIndex:=GetPreferredMidioutDevice;
 GetMidiInDevice(ComboBox4.Items);
 ComboBox4.ItemIndex:=GetPreferredMidiInDevice;
end;

procedure TForm1.DefinirDefaut(Sender: TObject);
begin
 case Tbutton(sender).Tag of
 1:
  begin
   SetPreferredWaveoutDevice(ComboBox1.ItemIndex);
   GetWaveOutDevice(ComboBox1.Items);
   ComboBox1.ItemIndex:=GetPreferredWaveoutDevice;
  end;
 2:
  begin
   SetPreferredWaveInDevice(ComboBox2.ItemIndex);
   GetWaveinDevice(ComboBox2.Items);
   ComboBox2.ItemIndex:=GetPreferredWaveinDevice;
  end;
 3:
  begin
   SetPreferredMidiOutDevice(ComboBox3.ItemIndex);
   GetMidiOutDevice(ComboBox3.Items);
   ComboBox3.ItemIndex:=GetPreferredMidiOutDevice;
  end;
 4:
  begin
   SetPreferredMidiInDevice(ComboBox4.ItemIndex);
   GetMidiInDevice(ComboBox4.Items);
   ComboBox4.ItemIndex:=GetPreferredMidiInDevice;
  end;
 end;
end;

end.

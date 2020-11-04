Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E73C2A698B
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 17:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731096AbgKDQZy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 11:25:54 -0500
Received: from smtpout2.fz-rossendorf.de ([149.220.4.206]:52066 "EHLO
        smtpout2.fz-rossendorf.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731124AbgKDQZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 11:25:53 -0500
Received: from fz-rossendorf.de (mail.casus.science [149.220.4.66])
        by smtpout2.fz-rossendorf.de (Postfix) with ESMTPS id 1E26A402E1;
        Wed,  4 Nov 2020 17:25:50 +0100 (CET)
Received: from [80.137.188.41] (account hlawac90@hzdr.de HELO [192.168.178.54])
  by hzdr.de (CommuniGate Pro SMTP 6.2.15)
  with ESMTPSA id 26489102; Wed, 04 Nov 2020 17:25:49 +0100
Message-ID: <59f848e83354ad72c11dacaf571f20a8084baf58.camel@hzdr.de>
Subject: Re: Philips Monitor with webcam
From:   Gregor Hlawacek <g.hlawacek@hzdr.de>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
In-Reply-To: <20201104170233.0d405dff@coco.lan>
References: <51207fd712e3c1001b80c6642021b1a5d5763ade.camel@hzdr.de>
         <20201104170233.0d405dff@coco.lan>
Organization: HZDR FWIZ-N
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
        boundary="=-dqbPEYybhz72H9HS17fN"
Date:   Wed, 04 Nov 2020 17:25:48 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.38.1 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-dqbPEYybhz72H9HS17fN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-11-04 at 17:02 +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 04 Nov 2020 14:24:34 +0100
> Gregor Hlawacek <g.hlawacek@hzdr.de> escreveu:
>=20
> > Hi all
> >=20
> > I own a Philips Brilliance 241B which has a webcam attached. The
> > device
> > is listed as 0412:612b Chicony Electronics Co., Ltd, bubt doesn't
> > work
> > with the latest UVC stock kernel driver. Is there any hope to get
> > this
> > supported?
> >=20
> > uname -a:
> > Linux it72 5.9.3-arch1-1 #1 SMP PREEMPT Sun, 01 Nov 2020 12:58:59
> > +0000
> > x86_64 GNU/Linux
> >=20
> > running Arch Linux on a Lenovo Thinkpad =C2=A0T490s
> >=20
> > dmesg:
> >=20
> > [76850.137838] usb 3-1.1.1.2: New USB device found, idVendor=3D04f2,
> > idProduct=3Db612, bcdDevice=3D 2.10
> > [76850.137841] usb 3-1.1.1.2: New USB device strings: Mfr=3D1,
> > Product=3D2,
> > SerialNumber=3D3
> > [76850.137843] usb 3-1.1.1.2: Product: USB2.0 FHD UVC WebCam
> > [76850.137845] usb 3-1.1.1.2: Manufacturer: SunplusIT Inc
> > [76850.137846] usb 3-1.1.1.2: SerialNumber: 01.00.00
> > [76850.152761] uvcvideo: Found UVC 1.50 device USB2.0 FHD UVC
> > WebCam
> > (04f2:b612)
> > [76850.215683] input: USB2.0 FHD UVC WebCam: USB2.0 F as
> > /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:
> > 00.0
> > /usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-1.1.1.2:1.0/input/input66
> > [76850.223642] uvcvideo: Found UVC 1.50 device USB2.0 FHD UVC
> > WebCam
> > (04f2:b612)
> > [76850.232499] usb 4-1.1.2: new SuperSpeed Gen 1 USB device number
> > 5
> > using xhci_hcd
> > [76850.241004] input: USB2.0 FHD UVC WebCam: IR Camer as
> > /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:
> > 00.0
> > /usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-1.1.1.2:1.2/input/input67
>=20
> Hmm... it sounds that the camera was properly detected here.=20
>=20
> Could you please enclose the contents of the following command?
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$ v4l2-ctl --all
>=20
> Thanks,
> Mauro

Hi Mauro=C2=A0

thanks for the quick answer. Here is the output but I am pretty sure
that this come from the integrated laptop camera and not the one in the
external monitor

Driver Info:
	Driver name      : uvcvideo
	Card type        : Integrated Camera: Integrated C
	Bus info         : usb-0000:00:14.0-8
	Driver version   : 5.9.3
	Capabilities     : 0x84a00001
		Video Capture
		Metadata Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04200001
		Video Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : uvcvideo
	Model            : Integrated Camera: Integrated C
	Serial           : 0001
	Bus info         : usb-0000:00:14.0-8
	Media version    : 5.9.3
	Hardware revision: 0x00000027 (39)
	Driver version   : 5.9.3
Interface Info:
	ID               : 0x03000002
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : Integrated Camera: Integrated C
	Function         : V4L2 I/O
	Flags         : default
	Pad 0x01000007   : 0: Sink
	  Link 0x02000013: from remote pad 0x100000a of entity
'Realtek Extended Controls Unit': Data, Enabled, Immutable
Priority: 2
Video input : 0 (Camera 1: ok)
Format Video Capture:
	Width/Height      : 1280/720
	Pixel Format      : 'MJPG' (Motion-JPEG)
	Field             : None
	Bytes per Line    : 0
	Size Image        : 1843200
	Colorspace        : sRGB
	Transfer Function : Default (maps to sRGB)
	YCbCr/HSV Encoding: Default (maps to ITU-R 601)
	Quantization      : Default (maps to Full Range)
	Flags             :=20
Crop Capability Video Capture:
	Bounds      : Left 0, Top 0, Width 1280, Height 720
	Default     : Left 0, Top 0, Width 1280, Height 720
	Pixel Aspect: 1/1
Selection Video Capture: crop_default, Left 0, Top 0, Width 1280,
Height 720, Flags:=20
Selection Video Capture: crop_bounds, Left 0, Top 0, Width 1280, Height
720, Flags:=20
Streaming Parameters Video Capture:
	Capabilities     : timeperframe
	Frames per second: 30.000 (30/1)
	Read buffers     : 0
                     brightness 0x00980900 (int)    : min=3D0 max=3D255
step=3D1 default=3D128 value=3D128
                       contrast 0x00980901 (int)    : min=3D0 max=3D255
step=3D1 default=3D32 value=3D32
                     saturation 0x00980902 (int)    : min=3D0 max=3D100
step=3D1 default=3D64 value=3D64
                            hue 0x00980903 (int)    : min=3D-180 max=3D180
step=3D1 default=3D0 value=3D0
 white_balance_temperature_auto 0x0098090c (bool)   : default=3D1 value=3D1
                          gamma 0x00980910 (int)    : min=3D90 max=3D150
step=3D1 default=3D120 value=3D120
           power_line_frequency 0x00980918 (menu)   : min=3D0 max=3D2
default=3D1 value=3D1
				0: Disabled
				1: 50 Hz
				2: 60 Hz
      white_balance_temperature 0x0098091a (int)    : min=3D2800 max=3D6500
step=3D10 default=3D4600 value=3D4600 flags=3Dinactive
                      sharpness 0x0098091b (int)    : min=3D0 max=3D7
step=3D1 default=3D0 value=3D0
         backlight_compensation 0x0098091c (int)    : min=3D0 max=3D2
step=3D1 default=3D1 value=3D1
                  exposure_auto 0x009a0901 (menu)   : min=3D0 max=3D3
default=3D3 value=3D3
				1: Manual Mode
				3: Aperture Priority Mode
              exposure_absolute 0x009a0902 (int)    : min=3D2 max=3D1250
step=3D1 default=3D156 value=3D156 flags=3Dinactive
         exposure_auto_priority 0x009a0903 (bool)   : default=3D0 value=3D1


--=-dqbPEYybhz72H9HS17fN
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCFpgw
ggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYTAkRFMSsw
KQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYDVQQLDBZULVN5
c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFsUm9vdCBDbGFzcyAy
MB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNVBAYTAkRFMUUwQwYDVQQK
EzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMg
ZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERGTi1WZXJlaW4gQ2VydGlmaWNhdGlv
biBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMtg1/9moUHN0vqH
l4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZsFVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8F
XRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0peQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+Ba
L2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qL
NupOkSk9s1FcragMvp0049ENF4N1xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz
9AkH4wKGMUZrAcUQDBHHWekCAwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQU
k+PYMiba1fFKpZFK4OpL4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYD
VR0TAQH/BAgwBgEB/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGC
LB4wCAYGZ4EMAQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUv
cmwvVGVsZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYB
BQUHMAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5jZXIw
DQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4eTizDnS6
dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/MOaZ/SLick0+
hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3SPXez7vTXTf/D6OWS
T1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc22CzeIs2LgtjZeOJVEqM7
h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bPZYoaorVyGTkwggWsMIIElKAD
AgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYDVQQGEwJERTFFMEMGA1UEChM8VmVy
ZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYu
MRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRERk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0
aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcNMzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUx
RTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5n
c25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9i
YWwgSXNzdWluZyBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp
1xCeOdfZojDbchwFfylfS2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6W
LkDh0YNMZj0cZGnlm6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mI
TQ5HjUhfZZkQ0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUk
P7agCwf9TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22M
ZD08WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAdBgNV
HQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK4OpL4qIM
z+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwtcm9v
dC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYBBQUHAQEEgdAwgc0wMwYI
KwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1TZXJ2ZXIvT0NTUDBKBggrBgEF
BQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY2FjZXJ0
L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJv
b3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/
DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCN
T1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7Ln8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+
lgQCXISoKTlslPwQkgZ7nu7YRrQbtQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v
9NsH1VuEGMGpuEvObJAaguS5Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7
EUkp2KgtdRXYShjqFu9VNCIaE40GMIIF5TCCBM2gAwIBAgIMITw++XMeenpZKoHZMA0GCSqGSIb3
DQEBCwUAMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVp
bmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUw
IwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTE5MDcwMzE0NTMzM1oXDTIy
MDcwMjE0NTMzM1owgYMxCzAJBgNVBAYTAkRFMRAwDgYDVQQIDAdTYWNoc2VuMRAwDgYDVQQHDAdE
cmVzZGVuMTUwMwYDVQQKDCxIZWxtaG9sdHotWmVudHJ1bSBEcmVzZGVuIC0gUm9zc2VuZG9yZiBl
LiBWLjEZMBcGA1UEAwwQSGxhd2FjZWssIEdyZWdvcjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAPT2husCqijBQDUyAd8yXl3PBKBB44b6kSh4kUIsskuSqPIV2Bbdo61wy7inFK/iSt4f
7DITlGarq3fwKtlDWHuHDyZhpv8gRea7T4Ul/lw8w4oymaimKNz47Ofio2XsosCWX7RQYitgTbr+
VlPKj36HlEv9BIr1+SxRXESr2FSIYRaFxwW+QA+ic0JJ3iimG8P7BQ+ylVqbnFMU+QqC739qC1HB
DPTSoi30gEBkQI1gcNL+dN1j0b1WibYZGQXcABjydbpy1ow17OyxpQVXNA4DaEI8VtGldmPqyXo7
QocVkn3hCoVCgcm23H1WSlFpNoC3C09CvsYPxny5vZ5O3dkCAwEAAaOCAkswggJHMD4GA1UdIAQ3
MDUwDwYNKwYBBAGBrSGCLAEBBDAQBg4rBgEEAYGtIYIsAQEEBDAQBg4rBgEEAYGtIYIsAgEEBDAJ
BgNVHRMEAjAAMA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
HQYDVR0OBBYEFD9v9h1AN9B7JVmbUR3b4sCrEHIqMB8GA1UdIwQYMBaAFGs6mIv58lOJ2uCtsjIe
CR/oqjt0MB0GA1UdEQQWMBSBEmcuaGxhd2FjZWtAaHpkci5kZTCBjQYDVR0fBIGFMIGCMD+gPaA7
hjlodHRwOi8vY2RwMS5wY2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5j
cmwwP6A9oDuGOWh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY3Js
L2NhY3JsLmNybDCB2wYIKwYBBQUHAQEEgc4wgcswMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBj
YS5kZm4uZGUvT0NTUC1TZXJ2ZXIvT0NTUDBJBggrBgEFBQcwAoY9aHR0cDovL2NkcDEucGNhLmRm
bi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDBJBggrBgEFBQcwAoY9
aHR0cDovL2NkcDIucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0
LmNydDANBgkqhkiG9w0BAQsFAAOCAQEAl0uz9sxJ9EKjOX+9CcXVGa219cKWtKWqJh5hlvhfE/0W
eQAp7cs+5XX9y4a5+huV4z2iqMlwR2Bt4nmlxTrnv6E6LGfQS4z9KGS2LvXLV4eelXFLK8C2z3U1
gkUJF4VAtCadN1q1zPWMXA4lRgwuurqS0tNCKPJEjYjwc5vJVtzZudfX3vTOCcJ4/HEZts0s5zbO
TfKmutq0r3/ePxrkUhRnK0SdBYdDeLCZpWIya3VQhLgzH0j54dOKbGO3MT1bjnTdcgThrF7LU+ON
wTAwxG37DaIU4nD4mTghk01C3iYDvBUmiCLEYEeeOTfOyPzG/FoDj0ZAhj9AXvP0+3sW3TCCBeUw
ggTNoAMCAQICDCE8PvlzHnp6WSqB2TANBgkqhkiG9w0BAQsFADCBjTELMAkGA1UEBhMCREUxRTBD
BgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25l
dHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwg
SXNzdWluZyBDQTAeFw0xOTA3MDMxNDUzMzNaFw0yMjA3MDIxNDUzMzNaMIGDMQswCQYDVQQGEwJE
RTEQMA4GA1UECAwHU2FjaHNlbjEQMA4GA1UEBwwHRHJlc2RlbjE1MDMGA1UECgwsSGVsbWhvbHR6
LVplbnRydW0gRHJlc2RlbiAtIFJvc3NlbmRvcmYgZS4gVi4xGTAXBgNVBAMMEEhsYXdhY2VrLCBH
cmVnb3IwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQD09obrAqoowUA1MgHfMl5dzwSg
QeOG+pEoeJFCLLJLkqjyFdgW3aOtcMu4pxSv4kreH+wyE5Rmq6t38CrZQ1h7hw8mYab/IEXmu0+F
Jf5cPMOKMpmopijc+Ozn4qNl7KLAll+0UGIrYE26/lZTyo9+h5RL/QSK9fksUVxEq9hUiGEWhccF
vkAPonNCSd4ophvD+wUPspVam5xTFPkKgu9/agtRwQz00qIt9IBAZECNYHDS/nTdY9G9Vom2GRkF
3AAY8nW6ctaMNezssaUFVzQOA2hCPFbRpXZj6sl6O0KHFZJ94QqFQoHJttx9VkpRaTaAtwtPQr7G
D8Z8ub2eTt3ZAgMBAAGjggJLMIICRzA+BgNVHSAENzA1MA8GDSsGAQQBga0hgiwBAQQwEAYOKwYB
BAGBrSGCLAEBBAQwEAYOKwYBBAGBrSGCLAIBBAQwCQYDVR0TBAIwADAOBgNVHQ8BAf8EBAMCBeAw
HQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBQ/b/YdQDfQeyVZm1Ed2+LA
qxByKjAfBgNVHSMEGDAWgBRrOpiL+fJTidrgrbIyHgkf6Ko7dDAdBgNVHREEFjAUgRJnLmhsYXdh
Y2VrQGh6ZHIuZGUwgY0GA1UdHwSBhTCBgjA/oD2gO4Y5aHR0cDovL2NkcDEucGNhLmRmbi5kZS9k
Zm4tY2EtZ2xvYmFsLWcyL3B1Yi9jcmwvY2FjcmwuY3JsMD+gPaA7hjlodHRwOi8vY2RwMi5wY2Eu
ZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5jcmwwgdsGCCsGAQUFBwEBBIHO
MIHLMDMGCCsGAQUFBzABhidodHRwOi8vb2NzcC5wY2EuZGZuLmRlL09DU1AtU2VydmVyL09DU1Aw
SQYIKwYBBQUHMAKGPWh0dHA6Ly9jZHAxLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIv
Y2FjZXJ0L2NhY2VydC5jcnQwSQYIKwYBBQUHMAKGPWh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZu
LWNhLWdsb2JhbC1nMi9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwDQYJKoZIhvcNAQELBQADggEBAJdL
s/bMSfRCozl/vQnF1RmttfXClrSlqiYeYZb4XxP9FnkAKe3LPuV1/cuGufobleM9oqjJcEdgbeJ5
pcU657+hOixn0EuM/Shkti71y1eHnpVxSyvAts91NYJFCReFQLQmnTdatcz1jFwOJUYMLrq6ktLT
QijyRI2I8HObyVbc2bnX1970zgnCePxxGbbNLOc2zk3yprratK9/3j8a5FIUZytEnQWHQ3iwmaVi
Mmt1UIS4Mx9I+eHTimxjtzE9W4503XIE4axey1PjjcEwMMRt+w2iFOJw+Jk4IZNNQt4mA7wVJogi
xGBHnjk3zsj8xvxaA49GQIY/QF7z9Pt7Ft0xggOdMIIDmQIBATCBnjCBjTELMAkGA1UEBhMCREUx
RTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5n
c25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9i
YWwgSXNzdWluZyBDQQIMITw++XMeenpZKoHZMA0GCWCGSAFlAwQCAQUAoIIBzzAYBgkqhkiG9w0B
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMDExMDQxNjI1NDhaMC8GCSqGSIb3DQEJ
BDEiBCCFIkMtV/IXXaaAavpjkUknQDzQ8XumnoMgSNRtm7bMKzCBrwYJKwYBBAGCNxAEMYGhMIGe
MIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERl
dXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBAgwhPD75cx56elkqgdkwgbEGCyqGSIb3DQEJ
EAILMYGhoIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5n
IGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJ
MSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBAgwhPD75cx56elkqgdkwDQYJ
KoZIhvcNAQEBBQAEggEA0Y3vdFOcIgDlkG8THgWKMdtmTEEn9x2rCGAz2CL7taUbB/18j7JOS5yc
0YApVu4bwkI/xOE43EjmIJL9GI9eOLVaOhAU6/OrkbIm8A0Kcxi+D7YCWy6o0V8dXeJK0m2aZWtL
lKjGnSlrP7AEnd80gqNvhu+EhgX1A3TKYwgWNqoypOdBjZagc8GzviMoqqyZZ287YiOOiLSMTWCP
qEljRPnWlsKuvAeOlib6D/nxxB0waRmtwav19oPhTRbhF9rm42cixcn30sOGbWMMlu2p1M1yXMpZ
4iAR3vTZ/spPnWoBkAUmX4QNv45BxcErQ2Z+eVlRNERnnL/7iL00mQGJ4AAAAAAAAA==


--=-dqbPEYybhz72H9HS17fN--


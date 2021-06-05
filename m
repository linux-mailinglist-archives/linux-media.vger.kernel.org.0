Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48C8739CB48
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 23:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhFEVlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 17:41:25 -0400
Received: from turbocat.net ([88.99.82.50]:37304 "EHLO mail.turbocat.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230010AbhFEVlY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 5 Jun 2021 17:41:24 -0400
X-Greylist: delayed 326 seconds by postgrey-1.27 at vger.kernel.org; Sat, 05 Jun 2021 17:41:24 EDT
Received: from hps2020.home.selasky.org (unknown [178.17.145.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 296CC26007C
        for <linux-media@vger.kernel.org>; Sat,  5 Jun 2021 23:34:05 +0200 (CEST)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Petter Selasky <hps@selasky.org>
Subject: Genesys Logic UVC microscopes used to work with Linux, but no longer
 do
Message-ID: <478e73fc-0e2c-4f1b-11d4-c71067764571@selasky.org>
Date:   Sat, 5 Jun 2021 23:32:44 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

The following device used to work with Linux, but has stopped working. 
I'm currently using Linux-5.13.rc2.

When I open /dev/video0 I see that the isochronous endpoint gets going, 
but only 12 bytes is received for each frame:

  frame[116] READ 12 bytes
  0000  0C 8C 00 00 00 00 76 11  76 1C A3 02 -- -- -- --  |......v.v...    |
  frame[117] READ 12 bytes
  0000  0C 8C 00 00 00 00 C2 2E  76 1C A3 02 -- -- -- --  |........v...    |
  frame[118] READ 12 bytes
  0000  0C 8C 00 00 00 00 10 4C  76 1C A3 02 -- -- -- --  |.......Lv...    |
  frame[119] READ 12 bytes
  0000  0C 8C 00 00 00 00 5C 69  76 1C A3 02 -- -- -- --  |......\iv...    |
  frame[120] READ 12 bytes
  0000  0C 8C 00 00 00 00 A8 86  76 1C A4 02 -- -- -- --  |........v...    |
  frame[121] READ 12 bytes
  0000  0C 8C 00 00 00 00 F4 A3  76 1C A4 02 -- -- -- --  |........v...    |
  frame[122] READ 12 bytes
  0000  0C 8C 00 00 00 00 42 C1  76 1C A4 02 -- -- -- --  |......B.v...    |
  frame[123] READ 12 bytes
  0000  0C 8C 00 00 00 00 8E DE  76 1C A4 02 -- -- -- --  |........v...    |
  frame[124] READ 12 bytes
  0000  0C 8C 00 00 00 00 DA FB  76 1C A4 02 -- -- -- --  |........v...    |
  frame[125] READ 12 bytes
  0000  0C 8C 00 00 00 00 26 19  77 1C A4 02 -- -- -- --  |......&.w...    |
  frame[126] READ 12 bytes
  0000  0C 8C 00 00 00 00 72 36  77 1C A4 02 -- -- -- --  |......r6w...    |
  frame[127] READ 12 bytes
  0000  0C 8C 00 00 00 00 BE 53  77 1C A4 02 -- -- -- --  |.......Sw...    |

Works fine with UVC driver in MacOSX, in between.

I suspect the device is missing some control endpoint command to 
activate the stream. Maybe someone here can help identify the problem or 
give some pointers where to look in the code.

The only error I see from the kernel is this:

webcamd 7520 - - ERR: : Failed to query (GET_INFO) UVC control 4 on unit 
1: -32 (exp. 1).


Here is the output from lsusb (FreeBSD):

Bus /dev/usb Device /dev/ugen0.4: ID 05e3:f12a Genesys Logic, Inc.
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 ?
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x05e3 Genesys Logic, Inc.
   idProduct          0xf12a
   bcdDevice            6.16
   iManufacturer           0
   iProduct                1 USB2.0 Digital Camera
   iSerial                 1 USB2.0 Digital Camera
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength          425
     bNumInterfaces          2
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              200mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         2
       bFunctionClass         14 Video
       bFunctionSubClass       3 Video Interface Collection
       bFunctionProtocol       0
       iFunction               1 USB2.0 Digital Camera
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      1 Video Control
       bInterfaceProtocol      0
       iInterface              1 USB2.0 Digital Camera
       VideoControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdUVC               1.00
         wTotalLength          105
         dwClockFrequency       60.000000MHz
         bInCollection           1
         baInterfaceNr( 0)       1
       VideoControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID             4
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID               2
         iTerminal               0
       VideoControl Interface Descriptor:
         bLength                27
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 2
         guidExtensionCode         {0b365d5e-5fe4-8145-9b0b-374669ba05d4}
         bNumControl            16
         bNrPins                 1
         baSourceID( 0)          5
         bControlSize            2
         bmControls( 0)       0xff
         bmControls( 1)       0x00
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                27
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 5
         guidExtensionCode         {03dfdaec-e38f-274d-893b-a18d25aeee09}
         bNumControl            16
         bNrPins                 1
         baSourceID( 0)          3
         bControlSize            2
         bmControls( 0)       0xff
         bmControls( 1)       0x03
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                18
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             1
         wTerminalType      0x0201 Camera Sensor
         bAssocTerminal          0
         iTerminal               0
         wObjectiveFocalLengthMin      0
         wObjectiveFocalLengthMax      0
         wOcularFocalLength            0
         bControlSize                  3
         bmControls           0x00000008
           Exposure Time (Absolute)
       VideoControl Interface Descriptor:
         bLength                11
         bDescriptorType        36
         bDescriptorSubtype      5 (PROCESSING_UNIT)
       Warning: Descriptor too short
         bUnitID                 3
         bSourceID               1
         wMaxMultiplier          0
         bControlSize            2
         bmControls     0x0000177f
           Brightness
           Contrast
           Hue
           Saturation
           Sharpness
           Gamma
           White Balance Temperature
           Backlight Compensation
           Gain
           Power Line Frequency
           White Balance Temperature, Auto
         iProcessing             0
         bmVideoStandards     0x e
           NTSC - 525/60
           PAL - 625/50
           SECAM - 625/50
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0017  1x 23 bytes
         bInterval               6
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       VideoStreaming Interface Descriptor:
         bLength                            14
         bDescriptorType                    36
         bDescriptorSubtype                  1 (INPUT_HEADER)
         bNumFormats                         1
         wTotalLength                      257
         bEndPointAddress                  129
         bmInfo                              0
         bTerminalLink                       4
         bStillCaptureMethod                 2
         bTriggerSupport                     1
         bTriggerUsage                       1
         bControlSize                        1
         bmaControls( 0)                    27
       VideoStreaming Interface Descriptor:
         bLength                            27
         bDescriptorType                    36
         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
         bFormatIndex                        1
         bNumFrameDescriptors                6
         guidFormat 
{59555932-0000-1000-8000-00aa00389b71}
         bBitsPerPixel                      16
         bDefaultFrameIndex                  1
         bAspectRatioX                       0
         bAspectRatioY                       0
         bmInterlaceFlags                 0x00
           Interlaced stream or variable: No
           Fields per frame: 2 fields
           Field 1 first: No
           Field pattern: Field 1 only
           bCopyProtect                      0
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         1
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                 15360000
         dwMaxBitRate                 15360000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         400000
         bFrameIntervalType                  1
         dwFrameInterval( 0)            400000
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         2
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            160
         wHeight                           120
         dwMinBitRate                   960000
         dwMaxBitRate                   960000
         dwMaxVideoFrameBufferSize       38400
         dwDefaultFrameInterval         400000
         bFrameIntervalType                  1
         dwFrameInterval( 0)            400000
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         3
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            176
         wHeight                           144
         dwMinBitRate                  1267200
         dwMaxBitRate                  1267200
         dwMaxVideoFrameBufferSize       50688
         dwDefaultFrameInterval         400000
         bFrameIntervalType                  1
         dwFrameInterval( 0)            400000
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         4
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            320
         wHeight                           240
         dwMinBitRate                  3840000
         dwMaxBitRate                  3840000
         dwMaxVideoFrameBufferSize      153600
         dwDefaultFrameInterval         400000
         bFrameIntervalType                  1
         dwFrameInterval( 0)            400000
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         5
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            352
         wHeight                           288
         dwMinBitRate                  5068800
         dwMaxBitRate                  5068800
         dwMaxVideoFrameBufferSize      202752
         dwDefaultFrameInterval         400000
         bFrameIntervalType                  1
         dwFrameInterval( 0)            400000
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         6
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                 15360000
         dwMaxBitRate                 15360000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         400000
         bFrameIntervalType                  1
         dwFrameInterval( 0)            400000
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
         bEndpointAddress                    0
         bNumImageSizePatterns               6
         wWidth( 0)                        640
         wHeight( 0)                       480
         wWidth( 1)                        160
         wHeight( 1)                       120
         wWidth( 2)                        176
         wHeight( 2)                       144
         wWidth( 3)                        320
         wHeight( 3)                       240
         wWidth( 4)                        352
         wHeight( 4)                       288
         wWidth( 5)                        640
         wHeight( 5)                       480
         bNumCompressionPatterns             6
       VideoStreaming Interface Descriptor:
         bLength                             6
         bDescriptorType                    36
         bDescriptorSubtype                 13 (COLORFORMAT)
         bColorPrimaries                     1 (BT.709,sRGB)
         bTransferCharacteristics            1 (BT.709)
         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x1400  3x 1024 bytes
         bInterval               1
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 ?
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   bNumConfigurations      1
Device Status:     0x0000
   (Bus Powered)

--HPS

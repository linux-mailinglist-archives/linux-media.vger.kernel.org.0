Return-Path: <linux-media+bounces-15457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9D93F69F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 15:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 235962847C0
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 13:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFACC153835;
	Mon, 29 Jul 2024 13:21:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from one.hybridchill.com (one.hybridchill.com [94.76.216.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7491F14D2BD
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 13:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.76.216.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722259319; cv=none; b=gS6/L2F7DTBRjYAbS+tcTFFbr3xYphGZaHnWPeL5u2+rs9RGPQ6qS14mq7xV28GZn7JYJPNYP1ctietPxkpa5EIkCLY52uwkGOHzg90Qc/y5nLFMzt9MPmVvA4DnJ31Bk9Ol5FTyEa9lpWuzatcjROhmN1uFHOxqMdiBFcQfHj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722259319; c=relaxed/simple;
	bh=pAjKBdDngSPwIOcyhBh0a4EXDQi3uxi9c3UPiZdELFQ=;
	h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type; b=NuCffXQLA1/FfzlrSGePBrmDiltCApUrbXtA/IQKWzjYZBiPpg1AV9a6PUlUscpkMjggczE8wpTWvrvdywpAK9/rPGqGCEc8OqVt7fugmRS9v4OzejtkNTs9euMZi2ZBsAouSFdK3wZvv7diJr3JnwSVYPIUrH6E0fyxnAAuCBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sorcerersisle.com; spf=pass smtp.mailfrom=sorcerersisle.com; arc=none smtp.client-ip=94.76.216.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sorcerersisle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sorcerersisle.com
Received: from [2.27.250.247] (port=45104 helo=[192.168.1.71])
	by one.hybridchill.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <peter@sorcerersisle.com>)
	id 1sYPwQ-0003am-0m
	for linux-media@vger.kernel.org;
	Mon, 29 Jul 2024 13:57:29 +0100
From: Peter Boughton <peter@sorcerersisle.com>
Subject: Status clarification for 0c45:6353 uvc slide scanners
To: linux-media@vger.kernel.org
Message-ID: <687d087b-ae4c-6242-2991-800876d74cc4@sorcerersisle.com>
Date: Mon, 29 Jul 2024 13:57:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------F1EAC76013CD4E95ACEF7743"
Content-Language: en-GB
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - one.hybridchill.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sorcerersisle.com
X-Get-Message-Sender-Via: one.hybridchill.com: authenticated_id: peter@sorcerersisle.com
X-Authenticated-Sender: one.hybridchill.com: peter@sorcerersisle.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

This is a multi-part message in MIME format.
--------------F1EAC76013CD4E95ACEF7743
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello, I've been asked for help getting an Ion "Slides Forever" iSC18 
slide scanner working on Debian.

https://web.archive.org/web/20171227155757/http://www.ionaudio.com/products/details/slides-forever

Using Webcamoid or Guvcview there are two resolution options:
* 592x392 is the default and gives a correct colour image (or close 
enough), but it's low resolution and soft or not focused.
* 1184x1576 has wrong ratio and colours - it's pink/green with 
horizontal stripes and stretched/squashed - but looks focused (as best 
as can tell with the distortions).

The above webpage claims 5 MP so would expect around 3172x1576 for full 
resolution.

Using lsusb identifies it as "ID 0c45:6353 Microdia" and has the "14 
Video" lines to show it's a UVC device.

The manufacturer and product are "2 Sonix Technology Co., Ltd." and "1 
USB film scanner".

The UVC page at http://www.ideasonboard.org/uvc/#devices has a 0c45:6353 
device named "MyGear P20013 Film Scanner", with a note:

   > Full-resolution scans are only possible through still image 
capture, which the uvcvideo driver doesn't support yet.

Does that status reflect the broken 1184x1576 and/or lack of expected 5 
MP option? (Or is the matching ID not relevant because the name differs?)

How pertinent is the "yet"? i.e. is the relevant functionality currently 
in progress, or is it not started, abandoned, or something else?

Are there any alternative libraries that might be able to extract full 
resolution images from the device?


Attached is verbose lsusb output and kern.log (dmesg) - the latter was 
9.4M with thousands of duplicate "Dropping payload (out of sync)" lines, 
so the attached 84K file is the result of:
    uniq --count --skip-chars=15 uvc-kern.log > uvc-kern.uniq.log
The lines related to 1184x1576 resolution seem to start at 569.635380 
(line 711).

I can provide a 459KB JPG showing a distorted image if that helps.


I've searched the archives for this list and found a single result for 
0c45:6353 - a 2021 message from someone who has an Ion Slides Forever 
(but with different manufacturer/product information), and seems to have 
identified a bug in the device, but only had partial success in working 
around it:

https://lore.kernel.org/linux-media/ema5af2fc1-8db3-4b0c-808a-fe48b5b3dc8e@thor/#r

Is it necessary to compile the kernel to test that?


Thanks,

Peter

--------------F1EAC76013CD4E95ACEF7743
Content-Type: text/x-log; charset=UTF-8;
 name="uvc-lsusb.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="uvc-lsusb.log"


Bus 002 Device 006: ID 0c45:6353 Microdia 
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x0c45 Microdia
  idProduct          0x6353 
  bcdDevice            1.50
  iManufacturer           2 Sonix Technology Co., Ltd.
  iProduct                1 USB film scanner 
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0151
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               5 USB film scanner 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              5 USB film scanner 
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x004d
        dwClockFrequency       15.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               4
        iTerminal               0 
      VideoControl Interface Descriptor:
        bLength                26
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {28f03370-6311-4a2e-ba2c-6890eb334016}
        bNumControl             8
        bNrPins                 1
        baSourceID( 0)          3
        bControlSize            1
        bmControls( 0)       0x0f
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
        bmControls           0x0000000e
          Auto-Exposure Mode
          Auto-Exposure Priority
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
        bmControls     0x0000053f
          Brightness
          Contrast
          Hue
          Saturation
          Sharpness
          Gamma
          Backlight Compensation
          Power Line Frequency
        iProcessing             0 
        bmVideoStandards     0x55
          None
          PAL - 625/50
          NTSC - 625/50
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
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
      iInterface              5 USB film scanner 
      VideoStreaming Interface Descriptor:
        bLength                            14
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         1
        wTotalLength                   0x0075
        bEndPointAddress                  129
        bmInfo                              0
        bTerminalLink                       2
        bStillCaptureMethod                 2
        bTriggerSupport                     1
        bTriggerUsage                       1
        bControlSize                        1
        bmaControls( 0)                     0
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        1
        bNumFrameDescriptors                2
        guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            592
        wHeight                           392
        dwMinBitRate                124600320
        dwMaxBitRate                124600320
        dwMaxVideoFrameBufferSize      519168
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1184
        wHeight                          1576
        dwMinBitRate                166133760
        dwMaxBitRate                166133760
        dwMaxVideoFrameBufferSize     4153344
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            10
        bDescriptorType                    36
        bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
        bEndpointAddress                    0
        bNumImageSizePatterns               1
        wWidth( 0)                       1184
        wHeight( 0)                      1576
        bNumCompressionPatterns             0
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
        wMaxPacketSize     0x0080  1x 128 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
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
        wMaxPacketSize     0x0100  1x 256 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
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
        wMaxPacketSize     0x0320  1x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
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
        wMaxPacketSize     0x0b20  2x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
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
        wMaxPacketSize     0x1320  3x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       6
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
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0002
  (Bus Powered)
  Remote Wakeup Enabled



--------------F1EAC76013CD4E95ACEF7743
Content-Type: text/x-log; charset=UTF-8;
 name="uvc-kern.uniq.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="uvc-kern.uniq.log"

      1 [  406.184289] usb 2-1.2: new high-speed USB device number 3 using ehci-pci
      1 [  406.315538] usb 2-1.2: New USB device found, idVendor=0c45, idProduct=6353, bcdDevice= 1.50
      1 [  406.315542] usb 2-1.2: New USB device strings: Mfr=2, Product=1, SerialNumber=0
      1 [  406.315544] usb 2-1.2: Product: USB film scanner 
      1 [  406.315546] usb 2-1.2: Manufacturer: Sonix Technology Co., Ltd.
      1 [  406.320587] uvcvideo: Found UVC 1.00 device USB film scanner  (0c45:6353)
      1 [  406.337071] uvcvideo 2-1.2:1.0: Entity type for entity Extension 4 was not initialized!
      1 [  406.337074] uvcvideo 2-1.2:1.0: Entity type for entity Processing 3 was not initialized!
      1 [  406.337077] uvcvideo 2-1.2:1.0: Entity type for entity Camera 1 was not initialized!
      1 [  406.337280] input: USB film scanner : USB film sca as /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.0/input/input16
      1 [  532.774362] uvcvideo: uvc_v4l2_open
      1 [  532.841310] uvcvideo: Resuming interface 0
      1 [  532.841314] uvcvideo: Resuming interface 1
      1 [  532.846897] uvcvideo: uvc_v4l2_release
      1 [  532.849291] uvcvideo: uvc_v4l2_open
      1 [  532.986051] uvcvideo: Resuming interface 0
      1 [  532.986055] uvcvideo: Resuming interface 1
      1 [  532.987498] uvcvideo: uvc_v4l2_release
      1 [  532.989331] uvcvideo: uvc_v4l2_open
      1 [  532.992917] uvcvideo: uvc_v4l2_release
      1 [  533.094202] uvcvideo: uvc_v4l2_open
      1 [  533.094785] uvcvideo: uvc_v4l2_release
      1 [  533.096920] uvcvideo: uvc_v4l2_open
      1 [  533.097021] uvcvideo: uvc_v4l2_release
      1 [  533.112324] uvcvideo: uvc_v4l2_open
      1 [  533.113765] uvcvideo: uvc_v4l2_release
      1 [  533.602182] uvcvideo: uvc_v4l2_open
      1 [  533.602211] uvcvideo: uvc_v4l2_release
      1 [  533.604396] uvcvideo: uvc_v4l2_open
      1 [  533.604412] uvcvideo: uvc_v4l2_release
      1 [  534.520580] uvcvideo: uvc_v4l2_open
      1 [  534.520658] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
      1 [  534.520660] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
      1 [  534.522538] uvcvideo: Setting frame interval to 1/30 (333333).
     32 [  534.531437] uvcvideo: uvc_v4l2_mmap
      1 [  534.533488] uvcvideo: Device requested 3060 B/frame bandwidth.
      1 [  534.533492] uvcvideo: Selecting alternate setting 3 (3060 B/frame bandwidth).
      1 [  534.533730] uvcvideo: Allocated 5 URB buffers of 32x3060 bytes each.
      1 [  535.594157] uvcvideo: Frame complete (EOF found).
      1 [  535.594168] uvcvideo: frame 1 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 0/1339201/1118
      1 [  535.626146] uvcvideo: Frame complete (EOF found).
      1 [  535.646110] uvcvideo: frame 2 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 1339361/2336664/1151
      1 [  535.674916] uvcvideo: uvc_v4l2_release
      1 [  535.678172] uvcvideo: uvc_v4l2_open
      1 [  535.678244] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
      1 [  535.678246] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
      1 [  535.679656] uvcvideo: Setting frame interval to 1/30 (333333).
     32 [  535.686698] uvcvideo: uvc_v4l2_mmap
      1 [  535.687890] uvcvideo: Device requested 3060 B/frame bandwidth.
      1 [  535.687893] uvcvideo: Selecting alternate setting 3 (3060 B/frame bandwidth).
      1 [  535.688084] uvcvideo: Allocated 5 URB buffers of 32x3060 bytes each.
      1 [  536.156912] uvcvideo: Suspending interface 1
      1 [  536.156915] uvcvideo: Suspending interface 0
      1 [  536.749152] uvcvideo: Frame complete (EOF found).
      1 [  536.749191] uvcvideo: frame 1 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 2337359/5126985/224
      1 [  536.781139] uvcvideo: Frame complete (EOF found).
      1 [  536.801151] uvcvideo: frame 2 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 5127684/6128200/258
      1 [  536.830078] uvcvideo: uvc_v4l2_release
      1 [  536.832931] uvcvideo: uvc_v4l2_open
      1 [  536.832986] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
      1 [  536.832987] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
      1 [  536.834415] uvcvideo: Setting frame interval to 1/30 (333333).
     32 [  536.841308] uvcvideo: uvc_v4l2_mmap
      1 [  536.842390] uvcvideo: Device requested 3060 B/frame bandwidth.
      1 [  536.842393] uvcvideo: Selecting alternate setting 3 (3060 B/frame bandwidth).
      1 [  536.842752] uvcvideo: Allocated 5 URB buffers of 32x3060 bytes each.
      1 [  537.903150] uvcvideo: Frame complete (EOF found).
      1 [  537.903162] uvcvideo: frame 1 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 6129345/8938320/1378
      1 [  537.935161] uvcvideo: Frame complete (EOF found).
      1 [  537.955113] uvcvideo: frame 2 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 8939019/9939530/1411
      1 [  538.004053] uvcvideo: uvc_v4l2_release
      1 [  538.006860] uvcvideo: uvc_v4l2_open
      1 [  538.006909] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
      1 [  538.006911] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
      1 [  538.008536] uvcvideo: Setting frame interval to 1/30 (333333).
     32 [  538.014937] uvcvideo: uvc_v4l2_mmap
      1 [  538.016010] uvcvideo: Device requested 3060 B/frame bandwidth.
      1 [  538.016012] uvcvideo: Selecting alternate setting 3 (3060 B/frame bandwidth).
      1 [  538.016235] uvcvideo: Allocated 5 URB buffers of 32x3060 bytes each.
      1 [  539.081186] uvcvideo: Frame complete (overflow).
      1 [  539.081190] uvcvideo: Dropping payload (out of sync).
      1 [  539.081196] uvcvideo: frame 1 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 11434073/13391024/507
      1 [  539.113136] uvcvideo: Frame complete (EOF found).
      1 [  539.129174] uvcvideo: frame 2 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 13392169/14388492/540
      1 [  539.165138] uvcvideo: Frame complete (EOF found).
      1 [  539.181125] uvcvideo: frame 3 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 14390779/15884683/590
      1 [  539.213152] uvcvideo: Frame complete (EOF found).
      1 [  539.249141] uvcvideo: frame 4 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 15886119/17380878/640
      1 [  539.281216] uvcvideo: Frame complete (EOF found).
      1 [  539.313145] uvcvideo: frame 5 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 17381574/19372056/707
      1 [  539.345195] uvcvideo: Frame complete (EOF found).
      1 [  539.413201] uvcvideo: frame 6 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 19373628/21363509/773
      1 [  539.445214] uvcvideo: Frame complete (EOF found).
      1 [  539.513200] uvcvideo: frame 7 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 21365796/24348125/872
      1 [  539.545210] uvcvideo: Frame complete (EOF found).
      1 [  539.645201] uvcvideo: frame 8 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 24350003/27336772/972
      1 [  539.677198] uvcvideo: Frame complete (EOF found).
      1 [  539.777208] uvcvideo: frame 9 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 27336932/31308167/1104
      1 [  539.809228] uvcvideo: Frame complete (EOF found).
      1 [  539.909187] uvcvideo: frame 10 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 31310454/35286488/1237
      1 [  539.941230] uvcvideo: Frame complete (EOF found).
      1 [  540.041201] uvcvideo: frame 11 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 35287176/39261345/1370
      1 [  540.073235] uvcvideo: Frame complete (EOF found).
      1 [  540.177201] uvcvideo: frame 12 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 39262944/43239955/1502
      1 [  540.209197] uvcvideo: Frame complete (EOF found).
      1 [  540.309186] uvcvideo: frame 13 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 43241074/47214814/1635
      1 [  540.341205] uvcvideo: Frame complete (EOF found).
      1 [  540.441181] uvcvideo: frame 14 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 47215500/51189674/1767
      1 [  540.473179] uvcvideo: Frame complete (EOF found).
      1 [  540.573149] uvcvideo: frame 15 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 51191679/55168283/1900
      1 [  540.605181] uvcvideo: Frame complete (EOF found).
      1 [  540.705144] uvcvideo: frame 16 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 55169399/59146893/2032
      1 [  540.737193] uvcvideo: Frame complete (EOF found).
      1 [  540.837144] uvcvideo: frame 17 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 59147053/63118127/117
      1 [  540.869220] uvcvideo: Frame complete (EOF found).
      1 [  540.969163] uvcvideo: frame 18 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 63120414/67096610/249
      1 [  541.001220] uvcvideo: Frame complete (EOF found).
      1 [  541.105132] uvcvideo: frame 19 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 67097217/71071471/382
      1 [  541.137194] uvcvideo: Frame complete (EOF found).
      1 [  541.237143] uvcvideo: frame 20 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 71072904/75046330/514
      1 [  541.269173] uvcvideo: Frame complete (EOF found).
      1 [  541.369146] uvcvideo: frame 21 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 75049149/79024939/647
      1 [  541.401209] uvcvideo: Frame complete (EOF found).
      1 [  541.501143] uvcvideo: frame 22 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 79025624/82999798/780
      1 [  541.533219] uvcvideo: Frame complete (EOF found).
      1 [  541.633145] uvcvideo: frame 23 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 83001639/86978407/912
      1 [  541.665199] uvcvideo: Frame complete (EOF found).
      1 [  541.765145] uvcvideo: frame 24 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 86979523/90957015/1045
      1 [  541.797220] uvcvideo: Frame complete (EOF found).
      1 [  541.897144] uvcvideo: frame 25 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 90957175/94928125/1177
      1 [  541.929236] uvcvideo: Frame complete (EOF found).
      1 [  542.029142] uvcvideo: frame 26 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 94930374/98906734/1310
      1 [  542.065194] uvcvideo: Frame complete (EOF found).
      1 [  542.165125] uvcvideo: frame 27 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 98907326/102885342/1442
      1 [  542.197210] uvcvideo: Frame complete (EOF found).
      1 [  542.297142] uvcvideo: frame 28 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 102885502/106856822/1575
      1 [  542.329207] uvcvideo: Frame complete (EOF found).
      1 [  542.429144] uvcvideo: frame 29 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 106859109/110835061/1707
      1 [  542.461122] uvcvideo: Frame complete (EOF found).
      1 [  542.561126] uvcvideo: frame 30 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 110835746/114809919/1840
      1 [  542.593226] uvcvideo: Frame complete (EOF found).
      1 [  542.693175] uvcvideo: frame 31 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 114811599/118788528/1973
      1 [  542.725205] uvcvideo: Frame complete (EOF found).
      1 [  542.825125] uvcvideo: frame 32 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 118789644/122763420/57
      1 [  542.857220] uvcvideo: Frame complete (EOF found).
      1 [  542.957143] uvcvideo: frame 33 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 122764090/126738245/190
      1 [  542.989195] uvcvideo: Frame complete (EOF found).
      1 [  543.093143] uvcvideo: frame 34 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 126740334/130716854/322
      1 [  543.125198] uvcvideo: Frame complete (EOF found).
      1 [  543.225146] uvcvideo: frame 35 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 130717971/134695461/455
      1 [  543.257203] uvcvideo: Frame complete (EOF found).
      1 [  543.357145] uvcvideo: frame 36 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 134695621/138666782/587
      1 [  543.389190] uvcvideo: Frame complete (EOF found).
      1 [  543.489123] uvcvideo: frame 37 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 138669069/142645179/720
      1 [  543.521214] uvcvideo: Frame complete (EOF found).
      1 [  543.621143] uvcvideo: frame 38 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 142645864/146620037/852
      1 [  543.653225] uvcvideo: Frame complete (EOF found).
      1 [  543.753142] uvcvideo: frame 39 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 146621559/150594895/985
      1 [  543.785224] uvcvideo: Frame complete (EOF found).
      1 [  543.885144] uvcvideo: frame 40 stats: 0/222/222 packets, 0/0/222 pts (!early initial), 221/222 scr, last pts/stc/sof 150597804/154573504/1117
      1 [  543.917232] uvcvideo: Frame complete (EOF found).
      1 [  544.021144] uvcvideo: frame 41 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 154574189/158548362/1250
      1 [  544.053142] uvcvideo: Frame complete (EOF found).
      1 [  544.153141] uvcvideo: frame 42 stats: 0/221/221 packets, 0/0/221 pts (!early initial), 220/221 scr, last pts/stc/sof 158550294/162526971/1383
      1 [  544.185143] uvcvideo: Frame complete (EOF found).
      1 [  544.218455] uvcvideo: uvc_v4l2_release
      1 [  544.293881] uvcvideo: uvc_v4l2_open
      1 [  544.434516] uvcvideo: Resuming interface 0
      1 [  544.434519] uvcvideo: Resuming interface 1
      1 [  544.443091] uvcvideo: uvc_v4l2_release
      1 [  544.844440] uvcvideo: uvc_v4l2_open
      1 [  544.844511] uvcvideo: Trying format 0x56595559 (YUYV): 592x392.
      1 [  544.844514] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
      1 [  544.857450] uvcvideo: Setting frame interval to 1/30 (333333).
     32 [  544.874486] uvcvideo: uvc_v4l2_mmap
      1 [  544.880014] uvcvideo: Device requested 3072 B/frame bandwidth.
      1 [  544.880020] uvcvideo: Selecting alternate setting 6 (3072 B/frame bandwidth).
      1 [  544.884296] uvcvideo: Allocated 5 URB buffers of 32x3072 bytes each.
      1 [  546.225013] uvcvideo: Suspending interface 1
      1 [  546.225018] uvcvideo: Suspending interface 0
      1 [  546.373455] uvcvideo: frame 1 stats: 0/0/11893 packets, 0/0/11893 pts (early !initial), 11892/11893 scr, last pts/stc/sof 0/122979427/2018
      1 [  546.401411] uvcvideo: Frame complete (EOF found).
    831 [  546.401419] uvcvideo: Dropping payload (out of sync).
      1 [  546.505358] uvcvideo: frame 2 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 122935557/124927760/100
      1 [  546.529463] uvcvideo: Frame complete (EOF found).
    831 [  546.529472] uvcvideo: Dropping payload (out of sync).
      1 [  546.633395] uvcvideo: frame 3 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 124884126/126876093/230
      1 [  546.661447] uvcvideo: Frame complete (EOF found).
    831 [  546.661456] uvcvideo: Dropping payload (out of sync).
      1 [  546.765358] uvcvideo: frame 4 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 126832694/128824426/360
      1 [  546.789470] uvcvideo: Frame complete (EOF found).
    831 [  546.789479] uvcvideo: Dropping payload (out of sync).
      1 [  546.893451] uvcvideo: frame 5 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 128781263/130772758/490
      1 [  546.921389] uvcvideo: Frame complete (EOF found).
    831 [  546.921400] uvcvideo: Dropping payload (out of sync).
      1 [  547.025361] uvcvideo: frame 6 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 130729832/132721091/620
      1 [  547.049443] uvcvideo: Frame complete (EOF found).
    832 [  547.049452] uvcvideo: Dropping payload (out of sync).
      1 [  547.153438] uvcvideo: frame 7 stats: 0/208/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 132678400/134671299/750
      1 [  547.177486] uvcvideo: Frame complete (EOF found).
    831 [  547.181416] uvcvideo: Dropping payload (out of sync).
      1 [  547.281417] uvcvideo: frame 8 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 134626969/136619632/879
      1 [  547.309458] uvcvideo: Frame complete (EOF found).
    831 [  547.309528] uvcvideo: Dropping payload (out of sync).
      1 [  547.413423] uvcvideo: frame 9 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 136575537/138567964/1009
      1 [  547.437524] uvcvideo: Frame complete (EOF found).
    831 [  547.437537] uvcvideo: Dropping payload (out of sync).
      1 [  547.541500] uvcvideo: frame 10 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 138524106/140516297/1139
      1 [  547.569446] uvcvideo: Frame complete (EOF found).
    831 [  547.569460] uvcvideo: Dropping payload (out of sync).
      1 [  547.673404] uvcvideo: frame 11 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 140472674/142464630/1269
      1 [  547.697470] uvcvideo: Frame complete (EOF found).
    831 [  547.697480] uvcvideo: Dropping payload (out of sync).
      1 [  547.801412] uvcvideo: frame 12 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 142421243/144412963/1399
      1 [  547.829451] uvcvideo: Frame complete (EOF found).
    831 [  547.829516] uvcvideo: Dropping payload (out of sync).
      1 [  547.933434] uvcvideo: frame 13 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 144369812/146361295/1529
      1 [  547.957470] uvcvideo: Frame complete (EOF found).
    831 [  547.957479] uvcvideo: Dropping payload (out of sync).
      1 [  548.061418] uvcvideo: frame 14 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 146318380/148309628/1659
      1 [  548.089453] uvcvideo: Frame complete (EOF found).
    832 [  548.089463] uvcvideo: Dropping payload (out of sync).
      1 [  548.193364] uvcvideo: frame 15 stats: 0/208/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 148266949/150259836/1789
      1 [  548.217467] uvcvideo: Frame complete (EOF found).
    831 [  548.217476] uvcvideo: Dropping payload (out of sync).
      1 [  548.321433] uvcvideo: frame 16 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 150215517/152208169/1919
      1 [  548.349427] uvcvideo: Frame complete (EOF found).
    831 [  548.349480] uvcvideo: Dropping payload (out of sync).
      1 [  548.453358] uvcvideo: frame 17 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 152164086/154156502/0
      1 [  548.477464] uvcvideo: Frame complete (EOF found).
    831 [  548.477475] uvcvideo: Dropping payload (out of sync).
      1 [  548.581415] uvcvideo: frame 18 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 154112654/156104835/130
      1 [  548.609400] uvcvideo: Frame complete (EOF found).
    831 [  548.609408] uvcvideo: Dropping payload (out of sync).
      1 [  548.713403] uvcvideo: frame 19 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 156061223/158053167/260
      1 [  548.737465] uvcvideo: Frame complete (EOF found).
    831 [  548.737474] uvcvideo: Dropping payload (out of sync).
      1 [  548.841399] uvcvideo: frame 20 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 158009792/160001500/390
      1 [  548.869444] uvcvideo: Frame complete (EOF found).
    831 [  548.869504] uvcvideo: Dropping payload (out of sync).
      1 [  548.973428] uvcvideo: frame 21 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 159958360/161949833/520
      1 [  548.997470] uvcvideo: Frame complete (EOF found).
    831 [  548.997521] uvcvideo: Dropping payload (out of sync).
      1 [  549.101497] uvcvideo: frame 22 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 161906929/163898166/650
      1 [  549.129443] uvcvideo: Frame complete (EOF found).
    832 [  549.129502] uvcvideo: Dropping payload (out of sync).
      1 [  549.233389] uvcvideo: frame 23 stats: 0/208/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 163855497/165848374/780
      1 [  549.257464] uvcvideo: Frame complete (EOF found).
    831 [  549.257517] uvcvideo: Dropping payload (out of sync).
      1 [  549.361371] uvcvideo: frame 24 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 165804066/167796706/910
      1 [  549.389442] uvcvideo: Frame complete (EOF found).
    831 [  549.389502] uvcvideo: Dropping payload (out of sync).
      1 [  549.493394] uvcvideo: frame 25 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 167752634/169745039/1040
      1 [  549.517456] uvcvideo: Frame complete (EOF found).
    831 [  549.517465] uvcvideo: Dropping payload (out of sync).
      1 [  549.621363] uvcvideo: frame 26 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 169701203/171693372/1169
      1 [  549.645471] uvcvideo: Frame complete (EOF found).
    831 [  549.645482] uvcvideo: Dropping payload (out of sync).
      1 [  549.749440] uvcvideo: frame 27 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 171649772/173641705/1299
      1 [  549.777457] uvcvideo: Frame complete (EOF found).
    831 [  549.777467] uvcvideo: Dropping payload (out of sync).
      1 [  549.881395] uvcvideo: frame 28 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 173598340/175590038/1429
      1 [  549.905471] uvcvideo: Frame complete (EOF found).
    831 [  549.905522] uvcvideo: Dropping payload (out of sync).
      1 [  550.009389] uvcvideo: frame 29 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 175546909/177538370/1559
      1 [  550.037454] uvcvideo: Frame complete (EOF found).
    831 [  550.037506] uvcvideo: Dropping payload (out of sync).
      1 [  550.141426] uvcvideo: frame 30 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 177495477/179486703/1689
      1 [  550.165451] uvcvideo: Frame complete (EOF found).
    832 [  550.165460] uvcvideo: Dropping payload (out of sync).
      1 [  550.269440] uvcvideo: frame 31 stats: 0/208/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 179444046/181436911/1819
      1 [  550.297456] uvcvideo: Frame complete (EOF found).
    831 [  550.297507] uvcvideo: Dropping payload (out of sync).
      1 [  550.401433] uvcvideo: frame 32 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 181392614/183385244/1949
      1 [  550.425467] uvcvideo: Frame complete (EOF found).
    831 [  550.425476] uvcvideo: Dropping payload (out of sync).
      1 [  550.529452] uvcvideo: frame 33 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 183341183/185333577/31
      1 [  550.557374] uvcvideo: Frame complete (EOF found).
    831 [  550.557434] uvcvideo: Dropping payload (out of sync).
      1 [  550.661458] uvcvideo: frame 34 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 185289752/187281909/161
      1 [  550.685469] uvcvideo: Frame complete (EOF found).
    831 [  550.685492] uvcvideo: Dropping payload (out of sync).
      1 [  550.789410] uvcvideo: frame 35 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 187238320/189230242/290
      1 [  550.817447] uvcvideo: Frame complete (EOF found).
    831 [  550.817504] uvcvideo: Dropping payload (out of sync).
      1 [  550.921416] uvcvideo: frame 36 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 189186889/191178575/420
      1 [  550.945463] uvcvideo: Frame complete (EOF found).
    831 [  550.945472] uvcvideo: Dropping payload (out of sync).
      1 [  551.049403] uvcvideo: frame 37 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 191135457/193126908/550
      1 [  551.077446] uvcvideo: Frame complete (EOF found).
    831 [  551.077503] uvcvideo: Dropping payload (out of sync).
      1 [  551.181375] uvcvideo: frame 38 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 193084026/195075241/680
      1 [  551.205465] uvcvideo: Frame complete (EOF found).
    832 [  551.205514] uvcvideo: Dropping payload (out of sync).
      1 [  551.309430] uvcvideo: frame 39 stats: 0/208/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 195032594/197025449/810
      1 [  551.337445] uvcvideo: Frame complete (EOF found).
    831 [  551.337455] uvcvideo: Dropping payload (out of sync).
      1 [  551.441389] uvcvideo: frame 40 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 196981163/198973781/940
      1 [  551.465461] uvcvideo: Frame complete (EOF found).
    831 [  551.465514] uvcvideo: Dropping payload (out of sync).
      1 [  551.569443] uvcvideo: frame 41 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 198929732/200922114/1070
      1 [  551.597444] uvcvideo: Frame complete (EOF found).
    831 [  551.597475] uvcvideo: Dropping payload (out of sync).
      1 [  551.701386] uvcvideo: frame 42 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 200878300/202870447/1200
      1 [  551.725441] uvcvideo: Frame complete (EOF found).
    831 [  551.725450] uvcvideo: Dropping payload (out of sync).
      1 [  551.829438] uvcvideo: frame 43 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 202826869/204818780/1330
      1 [  551.853461] uvcvideo: Frame complete (EOF found).
    831 [  551.857427] uvcvideo: Dropping payload (out of sync).
      1 [  551.957437] uvcvideo: frame 44 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 204775437/206767113/1459
      1 [  551.985456] uvcvideo: Frame complete (EOF found).
    831 [  551.985467] uvcvideo: Dropping payload (out of sync).
      1 [  552.089393] uvcvideo: frame 45 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 206724006/208715445/1589
      1 [  552.113472] uvcvideo: Frame complete (EOF found).
    831 [  552.113481] uvcvideo: Dropping payload (out of sync).
      1 [  552.217459] uvcvideo: frame 46 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 208672574/210663778/1719
      1 [  552.245456] uvcvideo: Frame complete (EOF found).
    832 [  552.245466] uvcvideo: Dropping payload (out of sync).
      1 [  552.349420] uvcvideo: frame 47 stats: 0/208/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 210621143/212613986/1849
      1 [  552.373455] uvcvideo: Frame complete (EOF found).
    831 [  552.373465] uvcvideo: Dropping payload (out of sync).
      1 [  552.477408] uvcvideo: frame 48 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 212569712/214562319/1979
      1 [  552.505438] uvcvideo: Frame complete (EOF found).
    831 [  552.505460] uvcvideo: Dropping payload (out of sync).
      1 [  552.609438] uvcvideo: frame 49 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 214518280/216510652/61
      1 [  552.633473] uvcvideo: Frame complete (EOF found).
    831 [  552.633525] uvcvideo: Dropping payload (out of sync).
      1 [  552.737410] uvcvideo: frame 50 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 216466849/218458985/191
      1 [  552.765448] uvcvideo: Frame complete (EOF found).
    831 [  552.765499] uvcvideo: Dropping payload (out of sync).
      1 [  552.869361] uvcvideo: frame 51 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 218415417/220407317/321
      1 [  552.893451] uvcvideo: Frame complete (EOF found).
    831 [  552.893475] uvcvideo: Dropping payload (out of sync).
      1 [  552.997526] uvcvideo: frame 52 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 220363986/222355650/451
      1 [  553.025456] uvcvideo: Frame complete (EOF found).
    831 [  553.025510] uvcvideo: Dropping payload (out of sync).
      1 [  553.129373] uvcvideo: frame 53 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 222312554/224303983/580
      1 [  553.153419] uvcvideo: Frame complete (EOF found).
    831 [  553.153429] uvcvideo: Dropping payload (out of sync).
      1 [  553.257428] uvcvideo: frame 54 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 224261123/226252316/710
      1 [  553.285447] uvcvideo: Frame complete (EOF found).
    832 [  553.285457] uvcvideo: Dropping payload (out of sync).
      1 [  553.389390] uvcvideo: frame 55 stats: 0/208/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 226209692/228202524/840
      1 [  553.413464] uvcvideo: Frame complete (EOF found).
    831 [  553.413474] uvcvideo: Dropping payload (out of sync).
      1 [  553.517404] uvcvideo: frame 56 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 228158260/230150857/970
      1 [  553.545447] uvcvideo: Frame complete (EOF found).
    831 [  553.545503] uvcvideo: Dropping payload (out of sync).
      1 [  553.649360] uvcvideo: frame 57 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 230106829/232099189/1100
      1 [  553.673441] uvcvideo: Frame complete (EOF found).
    831 [  553.673496] uvcvideo: Dropping payload (out of sync).
      1 [  553.777453] uvcvideo: frame 58 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 232055397/234047522/1230
      1 [  553.805448] uvcvideo: Frame complete (EOF found).
    831 [  553.805459] uvcvideo: Dropping payload (out of sync).
      1 [  553.909371] uvcvideo: frame 59 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 234003966/235995855/1360
      1 [  553.933466] uvcvideo: Frame complete (EOF found).
    831 [  553.933519] uvcvideo: Dropping payload (out of sync).
      1 [  554.037445] uvcvideo: frame 60 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 235952534/237944188/1490
      1 [  554.065425] uvcvideo: Frame complete (EOF found).
    831 [  554.065434] uvcvideo: Dropping payload (out of sync).
      1 [  554.169449] uvcvideo: frame 61 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 237901103/239892521/1620
      1 [  554.193435] uvcvideo: Frame complete (EOF found).
    831 [  554.193444] uvcvideo: Dropping payload (out of sync).
      1 [  554.297442] uvcvideo: frame 62 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 239849672/241840853/1749
      1 [  554.321474] uvcvideo: Frame complete (EOF found).
    832 [  554.321531] uvcvideo: Dropping payload (out of sync).
      1 [  554.425421] uvcvideo: frame 63 stats: 0/208/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 241798240/243791061/1879
      1 [  554.453457] uvcvideo: Frame complete (EOF found).
    831 [  554.453517] uvcvideo: Dropping payload (out of sync).
      1 [  554.557410] uvcvideo: frame 64 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 243746809/245739394/2009
      1 [  554.581473] uvcvideo: Frame complete (EOF found).
    831 [  554.581483] uvcvideo: Dropping payload (out of sync).
      1 [  554.685409] uvcvideo: frame 65 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 245695377/247687727/91
      1 [  554.713461] uvcvideo: Frame complete (EOF found).
    831 [  554.713513] uvcvideo: Dropping payload (out of sync).
      1 [  554.817378] uvcvideo: frame 66 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 247643946/249636060/221
      1 [  554.841472] uvcvideo: Frame complete (EOF found).
    831 [  554.841523] uvcvideo: Dropping payload (out of sync).
      1 [  554.945440] uvcvideo: frame 67 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 249592514/251584393/351
      1 [  554.973453] uvcvideo: Frame complete (EOF found).
    831 [  554.973463] uvcvideo: Dropping payload (out of sync).
      1 [  555.077429] uvcvideo: frame 68 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 251541083/253532725/481
      1 [  555.101416] uvcvideo: Frame complete (EOF found).
    831 [  555.101425] uvcvideo: Dropping payload (out of sync).
      1 [  555.205430] uvcvideo: frame 69 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 253489652/255481058/611
      1 [  555.233448] uvcvideo: Frame complete (EOF found).
    831 [  555.233458] uvcvideo: Dropping payload (out of sync).
      1 [  555.337364] uvcvideo: frame 70 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 255438220/257429391/741
      1 [  555.361479] uvcvideo: Frame complete (EOF found).
    832 [  555.361502] uvcvideo: Dropping payload (out of sync).
      1 [  555.465389] uvcvideo: frame 71 stats: 0/208/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 257386789/259379599/871
      1 [  555.493452] uvcvideo: Frame complete (EOF found).
    831 [  555.493504] uvcvideo: Dropping payload (out of sync).
      1 [  555.597367] uvcvideo: frame 72 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 259335357/261327932/1000
      1 [  555.621466] uvcvideo: Frame complete (EOF found).
    831 [  555.621478] uvcvideo: Dropping payload (out of sync).
      1 [  555.725415] uvcvideo: frame 73 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 261283926/263276265/1130
      1 [  555.753449] uvcvideo: Frame complete (EOF found).
    831 [  555.753502] uvcvideo: Dropping payload (out of sync).
      1 [  555.857361] uvcvideo: frame 74 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 263232494/265224597/1260
      1 [  555.881462] uvcvideo: Frame complete (EOF found).
    831 [  555.881471] uvcvideo: Dropping payload (out of sync).
      1 [  555.985412] uvcvideo: frame 75 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 265181063/267172930/1390
      1 [  556.013384] uvcvideo: Frame complete (EOF found).
    831 [  556.013394] uvcvideo: Dropping payload (out of sync).
      1 [  556.117422] uvcvideo: frame 76 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 267129632/269121263/1520
      1 [  556.141443] uvcvideo: Frame complete (EOF found).
    831 [  556.141452] uvcvideo: Dropping payload (out of sync).
      1 [  556.245398] uvcvideo: frame 77 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 269078200/271069596/1650
      1 [  556.273428] uvcvideo: Frame complete (EOF found).
    831 [  556.273439] uvcvideo: Dropping payload (out of sync).
      1 [  556.377419] uvcvideo: frame 78 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 271026769/273017929/1780
      1 [  556.401385] uvcvideo: Frame complete (EOF found).
    831 [  556.401392] uvcvideo: Dropping payload (out of sync).
      1 [  556.505427] uvcvideo: frame 79 stats: 0/209/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 272975337/274968136/1910
      1 [  556.533450] uvcvideo: Frame complete (EOF found).
    831 [  556.533460] uvcvideo: Dropping payload (out of sync).
      1 [  556.637401] uvcvideo: frame 80 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 274923906/276916469/2040
      1 [  556.661458] uvcvideo: Frame complete (EOF found).
    831 [  556.661468] uvcvideo: Dropping payload (out of sync).
      1 [  556.765396] uvcvideo: frame 81 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 276872474/278864802/121
      1 [  556.789476] uvcvideo: Frame complete (EOF found).
    831 [  556.789488] uvcvideo: Dropping payload (out of sync).
      1 [  556.893414] uvcvideo: frame 82 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 278821043/280813135/251
      1 [  556.921457] uvcvideo: Frame complete (EOF found).
    831 [  556.921515] uvcvideo: Dropping payload (out of sync).
      1 [  557.025379] uvcvideo: frame 83 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 280769612/282761468/381
      1 [  557.049473] uvcvideo: Frame complete (EOF found).
    831 [  557.049482] uvcvideo: Dropping payload (out of sync).
      1 [  557.153407] uvcvideo: frame 84 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 282718180/284709800/511
      1 [  557.181437] uvcvideo: Frame complete (EOF found).
    831 [  557.181447] uvcvideo: Dropping payload (out of sync).
      1 [  557.285399] uvcvideo: frame 85 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 284666749/286658133/641
      1 [  557.309414] uvcvideo: Frame complete (EOF found).
    831 [  557.309423] uvcvideo: Dropping payload (out of sync).
      1 [  557.413406] uvcvideo: frame 86 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 286615317/288606466/771
      1 [  557.441456] uvcvideo: Frame complete (EOF found).
    831 [  557.441466] uvcvideo: Dropping payload (out of sync).
      1 [  557.545393] uvcvideo: frame 87 stats: 0/209/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 288563886/290556674/901
      1 [  557.569469] uvcvideo: Frame complete (EOF found).
    831 [  557.569525] uvcvideo: Dropping payload (out of sync).
      1 [  557.673477] uvcvideo: frame 88 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 290512454/292505007/1031
      1 [  557.701382] uvcvideo: Frame complete (EOF found).
    831 [  557.701391] uvcvideo: Dropping payload (out of sync).
      1 [  557.805362] uvcvideo: frame 89 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 292461023/294453340/1161
      1 [  557.829468] uvcvideo: Frame complete (EOF found).
    831 [  557.829517] uvcvideo: Dropping payload (out of sync).
      1 [  557.933405] uvcvideo: frame 90 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 294409592/296401672/1290
      1 [  557.961446] uvcvideo: Frame complete (EOF found).
    831 [  557.961503] uvcvideo: Dropping payload (out of sync).
      1 [  558.065447] uvcvideo: frame 91 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 296358160/298350005/1420
      1 [  558.089471] uvcvideo: Frame complete (EOF found).
    831 [  558.089522] uvcvideo: Dropping payload (out of sync).
      1 [  558.193389] uvcvideo: frame 92 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 298306729/300298338/1550
      1 [  558.221450] uvcvideo: Frame complete (EOF found).
    831 [  558.221459] uvcvideo: Dropping payload (out of sync).
      1 [  558.325399] uvcvideo: frame 93 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 300255297/302246671/1680
      1 [  558.349463] uvcvideo: Frame complete (EOF found).
    831 [  558.349472] uvcvideo: Dropping payload (out of sync).
      1 [  558.453444] uvcvideo: frame 94 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 302203866/304195004/1810
      1 [  558.481420] uvcvideo: Frame complete (EOF found).
    831 [  558.481429] uvcvideo: Dropping payload (out of sync).
      1 [  558.585372] uvcvideo: frame 95 stats: 0/209/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 304152434/306145212/1940
      1 [  558.609463] uvcvideo: Frame complete (EOF found).
    831 [  558.609516] uvcvideo: Dropping payload (out of sync).
      1 [  558.713399] uvcvideo: frame 96 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 306101003/308093544/22
      1 [  558.741443] uvcvideo: Frame complete (EOF found).
    831 [  558.741453] uvcvideo: Dropping payload (out of sync).
      1 [  558.845372] uvcvideo: frame 97 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 308049572/310041877/152
      1 [  558.869437] uvcvideo: Frame complete (EOF found).
    831 [  558.869447] uvcvideo: Dropping payload (out of sync).
      1 [  558.973386] uvcvideo: frame 98 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 309998140/311990210/282
      1 [  558.997434] uvcvideo: Frame complete (EOF found).
    831 [  559.001367] uvcvideo: Dropping payload (out of sync).
      1 [  559.101410] uvcvideo: frame 99 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 311946709/313938543/411
      1 [  559.129458] uvcvideo: Frame complete (EOF found).
    831 [  559.129471] uvcvideo: Dropping payload (out of sync).
      1 [  559.233432] uvcvideo: frame 100 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 313895277/315886876/541
      1 [  559.257473] uvcvideo: Frame complete (EOF found).
    831 [  559.257482] uvcvideo: Dropping payload (out of sync).
      1 [  559.361396] uvcvideo: frame 101 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 315843846/317835208/671
      1 [  559.389455] uvcvideo: Frame complete (EOF found).
    831 [  559.389464] uvcvideo: Dropping payload (out of sync).
      1 [  559.493376] uvcvideo: frame 102 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 317792414/319783541/801
      1 [  559.517474] uvcvideo: Frame complete (EOF found).
    831 [  559.517484] uvcvideo: Dropping payload (out of sync).
      1 [  559.621451] uvcvideo: frame 103 stats: 0/209/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 319740983/321733749/931
      1 [  559.649456] uvcvideo: Frame complete (EOF found).
    831 [  559.649508] uvcvideo: Dropping payload (out of sync).
      1 [  559.753410] uvcvideo: frame 104 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 321689552/323682082/1061
      1 [  559.777471] uvcvideo: Frame complete (EOF found).
    831 [  559.777481] uvcvideo: Dropping payload (out of sync).
      1 [  559.881399] uvcvideo: frame 105 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 323638120/325630415/1191
      1 [  559.909454] uvcvideo: Frame complete (EOF found).
    831 [  559.909464] uvcvideo: Dropping payload (out of sync).
      1 [  560.013417] uvcvideo: frame 106 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 325586689/327578747/1321
      1 [  560.037469] uvcvideo: Frame complete (EOF found).
    831 [  560.037521] uvcvideo: Dropping payload (out of sync).
      1 [  560.141438] uvcvideo: frame 107 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 327535257/329527080/1451
      1 [  560.169437] uvcvideo: Frame complete (EOF found).
    831 [  560.169460] uvcvideo: Dropping payload (out of sync).
      1 [  560.273360] uvcvideo: frame 108 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 329483826/331475413/1580
      1 [  560.297467] uvcvideo: Frame complete (EOF found).
    831 [  560.297480] uvcvideo: Dropping payload (out of sync).
      1 [  560.401439] uvcvideo: frame 109 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 331432394/333423746/1710
      1 [  560.429447] uvcvideo: Frame complete (EOF found).
    831 [  560.429457] uvcvideo: Dropping payload (out of sync).
      1 [  560.533369] uvcvideo: frame 110 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 333380963/335372079/1840
      1 [  560.557464] uvcvideo: Frame complete (EOF found).
    831 [  560.557476] uvcvideo: Dropping payload (out of sync).
      1 [  560.661415] uvcvideo: frame 111 stats: 0/209/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 335329532/337322287/1970
      1 [  560.689446] uvcvideo: Frame complete (EOF found).
    831 [  560.689456] uvcvideo: Dropping payload (out of sync).
      1 [  560.793433] uvcvideo: frame 112 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 337278100/339270619/52
      1 [  560.817466] uvcvideo: Frame complete (EOF found).
    831 [  560.817518] uvcvideo: Dropping payload (out of sync).
      1 [  560.921372] uvcvideo: frame 113 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 339226669/341218952/182
      1 [  560.949444] uvcvideo: Frame complete (EOF found).
    831 [  560.949498] uvcvideo: Dropping payload (out of sync).
      1 [  561.053365] uvcvideo: frame 114 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 341175237/343167285/312
      1 [  561.077445] uvcvideo: Frame complete (EOF found).
    831 [  561.077457] uvcvideo: Dropping payload (out of sync).
      1 [  561.181403] uvcvideo: frame 115 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 343123806/345115618/442
      1 [  561.209445] uvcvideo: Frame complete (EOF found).
    831 [  561.209503] uvcvideo: Dropping payload (out of sync).
      1 [  561.313402] uvcvideo: frame 116 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 345072374/347063951/572
      1 [  561.337460] uvcvideo: Frame complete (EOF found).
    831 [  561.337470] uvcvideo: Dropping payload (out of sync).
      1 [  561.441412] uvcvideo: frame 117 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 347020943/349012283/701
      1 [  561.465426] uvcvideo: Frame complete (EOF found).
    831 [  561.465435] uvcvideo: Dropping payload (out of sync).
      1 [  561.569423] uvcvideo: frame 118 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 348969512/350960616/831
      1 [  561.597459] uvcvideo: Frame complete (EOF found).
    831 [  561.597470] uvcvideo: Dropping payload (out of sync).
      1 [  561.701369] uvcvideo: frame 119 stats: 0/209/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 350918080/352910824/961
      1 [  561.725470] uvcvideo: Frame complete (EOF found).
    831 [  561.725481] uvcvideo: Dropping payload (out of sync).
      1 [  561.829430] uvcvideo: frame 120 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 352866649/354859157/1091
      1 [  561.857460] uvcvideo: Frame complete (EOF found).
    831 [  561.857512] uvcvideo: Dropping payload (out of sync).
      1 [  561.961433] uvcvideo: frame 121 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 354815217/356807490/1221
      1 [  561.985449] uvcvideo: Frame complete (EOF found).
    831 [  561.985457] uvcvideo: Dropping payload (out of sync).
      1 [  562.089426] uvcvideo: frame 122 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 356763786/358755822/1351
      1 [  562.117450] uvcvideo: Frame complete (EOF found).
    831 [  562.117501] uvcvideo: Dropping payload (out of sync).
      1 [  562.221421] uvcvideo: frame 123 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 358712354/360704155/1481
      1 [  562.245469] uvcvideo: Frame complete (EOF found).
    831 [  562.245479] uvcvideo: Dropping payload (out of sync).
      1 [  562.349379] uvcvideo: frame 124 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 360660923/362652488/1611
      1 [  562.377450] uvcvideo: Frame complete (EOF found).
    831 [  562.377501] uvcvideo: Dropping payload (out of sync).
      1 [  562.481365] uvcvideo: frame 125 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 362609492/364600821/1741
      1 [  562.505451] uvcvideo: Frame complete (EOF found).
    831 [  562.505475] uvcvideo: Dropping payload (out of sync).
      1 [  562.609439] uvcvideo: frame 126 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 364558060/366549154/1870
      1 [  562.637450] uvcvideo: Frame complete (EOF found).
    831 [  562.637501] uvcvideo: Dropping payload (out of sync).
      1 [  562.741439] uvcvideo: frame 127 stats: 0/209/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 366506629/368499362/2000
      1 [  562.765463] uvcvideo: Frame complete (EOF found).
    831 [  562.765519] uvcvideo: Dropping payload (out of sync).
      1 [  562.869440] uvcvideo: frame 128 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 368455197/370447694/82
      1 [  562.897445] uvcvideo: Frame complete (EOF found).
    831 [  562.897501] uvcvideo: Dropping payload (out of sync).
      1 [  563.001392] uvcvideo: frame 129 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 370403766/372396027/212
      1 [  563.025466] uvcvideo: Frame complete (EOF found).
    831 [  563.025518] uvcvideo: Dropping payload (out of sync).
      1 [  563.129420] uvcvideo: frame 130 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 372352334/374344360/342
      1 [  563.157443] uvcvideo: Frame complete (EOF found).
    831 [  563.157501] uvcvideo: Dropping payload (out of sync).
      1 [  563.261366] uvcvideo: frame 131 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 374300903/376292693/472
      1 [  563.285459] uvcvideo: Frame complete (EOF found).
    831 [  563.285469] uvcvideo: Dropping payload (out of sync).
      1 [  563.389380] uvcvideo: frame 132 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 376249472/378241026/602
      1 [  563.417447] uvcvideo: Frame complete (EOF found).
    831 [  563.417457] uvcvideo: Dropping payload (out of sync).
      1 [  563.521447] uvcvideo: frame 133 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 378198040/380189358/732
      1 [  563.545457] uvcvideo: Frame complete (EOF found).
    831 [  563.545527] uvcvideo: Dropping payload (out of sync).
      1 [  563.649391] uvcvideo: frame 134 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 380146609/382137691/862
      1 [  563.677444] uvcvideo: Frame complete (EOF found).
    831 [  563.677453] uvcvideo: Dropping payload (out of sync).
      1 [  563.781356] uvcvideo: frame 135 stats: 0/209/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 382095177/384087899/992
      1 [  563.805375] uvcvideo: Frame complete (EOF found).
    831 [  563.805383] uvcvideo: Dropping payload (out of sync).
      1 [  563.909377] uvcvideo: frame 136 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 384043746/386036232/1121
      1 [  563.933450] uvcvideo: Frame complete (EOF found).
    831 [  563.933461] uvcvideo: Dropping payload (out of sync).
      1 [  564.037408] uvcvideo: frame 137 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 385992314/387984565/1251
      1 [  564.065431] uvcvideo: Frame complete (EOF found).
    831 [  564.065442] uvcvideo: Dropping payload (out of sync).
      1 [  564.169428] uvcvideo: frame 138 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 387940883/389932897/1381
      1 [  564.193458] uvcvideo: Frame complete (EOF found).
    831 [  564.193508] uvcvideo: Dropping payload (out of sync).
      1 [  564.297379] uvcvideo: frame 139 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 389889452/391881230/1511
      1 [  564.325460] uvcvideo: Frame complete (EOF found).
    831 [  564.325470] uvcvideo: Dropping payload (out of sync).
      1 [  564.429364] uvcvideo: frame 140 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 391838020/393829563/1641
      1 [  564.453473] uvcvideo: Frame complete (EOF found).
    831 [  564.453482] uvcvideo: Dropping payload (out of sync).
      1 [  564.557428] uvcvideo: frame 141 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 393786589/395777896/1771
      1 [  564.585460] uvcvideo: Frame complete (EOF found).
    831 [  564.585518] uvcvideo: Dropping payload (out of sync).
      1 [  564.689401] uvcvideo: frame 142 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 395735157/397726229/1901
      1 [  564.713469] uvcvideo: Frame complete (EOF found).
    831 [  564.713478] uvcvideo: Dropping payload (out of sync).
      1 [  564.817439] uvcvideo: frame 143 stats: 0/209/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 397683726/399676437/2031
      1 [  564.845424] uvcvideo: Frame complete (EOF found).
    831 [  564.845434] uvcvideo: Dropping payload (out of sync).
      1 [  564.949395] uvcvideo: frame 144 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 399632294/401624769/113
      1 [  564.973469] uvcvideo: Frame complete (EOF found).
    831 [  564.973478] uvcvideo: Dropping payload (out of sync).
      1 [  565.077443] uvcvideo: frame 145 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 401580863/403573102/242
      1 [  565.105449] uvcvideo: Frame complete (EOF found).
    831 [  565.105506] uvcvideo: Dropping payload (out of sync).
      1 [  565.209359] uvcvideo: frame 146 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 403529432/405521435/372
      1 [  565.233440] uvcvideo: Frame complete (EOF found).
    831 [  565.233493] uvcvideo: Dropping payload (out of sync).
      1 [  565.337370] uvcvideo: frame 147 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 405478000/407469768/502
      1 [  565.365446] uvcvideo: Frame complete (EOF found).
    831 [  565.365455] uvcvideo: Dropping payload (out of sync).
      1 [  565.469375] uvcvideo: frame 148 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 407426569/409418101/632
      1 [  565.493462] uvcvideo: Frame complete (EOF found).
    831 [  565.493515] uvcvideo: Dropping payload (out of sync).
      1 [  565.597396] uvcvideo: frame 149 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 409375137/411366433/762
      1 [  565.625429] uvcvideo: Frame complete (EOF found).
    831 [  565.625438] uvcvideo: Dropping payload (out of sync).
      1 [  565.729402] uvcvideo: frame 150 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 411323706/413314766/892
      1 [  565.753462] uvcvideo: Frame complete (EOF found).
    831 [  565.753514] uvcvideo: Dropping payload (out of sync).
      1 [  565.857447] uvcvideo: frame 151 stats: 0/209/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 413272274/415264974/1022
      1 [  565.885441] uvcvideo: Frame complete (EOF found).
    831 [  565.885504] uvcvideo: Dropping payload (out of sync).
      1 [  565.989391] uvcvideo: frame 152 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 415220843/417213307/1152
      1 [  566.013425] uvcvideo: Frame complete (EOF found).
    831 [  566.013434] uvcvideo: Dropping payload (out of sync).
      1 [  566.117402] uvcvideo: frame 153 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 417169412/419161640/1282
      1 [  566.141474] uvcvideo: Frame complete (EOF found).
    831 [  566.145417] uvcvideo: Dropping payload (out of sync).
      1 [  566.245442] uvcvideo: frame 154 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 419117980/421109973/1411
      1 [  566.273406] uvcvideo: Frame complete (EOF found).
    831 [  566.273418] uvcvideo: Dropping payload (out of sync).
      1 [  566.377377] uvcvideo: frame 155 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 421066549/423058305/1541
      1 [  566.401472] uvcvideo: Frame complete (EOF found).
    831 [  566.401535] uvcvideo: Dropping payload (out of sync).
      1 [  566.505492] uvcvideo: frame 156 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 423015117/425006638/1671
      1 [  566.533456] uvcvideo: Frame complete (EOF found).
    831 [  566.533517] uvcvideo: Dropping payload (out of sync).
      1 [  566.637417] uvcvideo: frame 157 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 424963686/426954971/1801
      1 [  566.661470] uvcvideo: Frame complete (EOF found).
    831 [  566.661479] uvcvideo: Dropping payload (out of sync).
      1 [  566.765406] uvcvideo: frame 158 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 426912254/428903304/1931
      1 [  566.793454] uvcvideo: Frame complete (EOF found).
    831 [  566.793507] uvcvideo: Dropping payload (out of sync).
      1 [  566.897364] uvcvideo: frame 159 stats: 0/209/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 428860823/430853512/13
      1 [  566.921445] uvcvideo: Frame complete (EOF found).
    831 [  566.921498] uvcvideo: Dropping payload (out of sync).
      1 [  567.025388] uvcvideo: frame 160 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 430809392/432801845/143
      1 [  567.053451] uvcvideo: Frame complete (EOF found).
    831 [  567.053481] uvcvideo: Dropping payload (out of sync).
      1 [  567.157411] uvcvideo: frame 161 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 432757960/434750177/273
      1 [  567.181449] uvcvideo: Frame complete (EOF found).
    831 [  567.181459] uvcvideo: Dropping payload (out of sync).
      1 [  567.285393] uvcvideo: frame 162 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 434706529/436698510/403
      1 [  567.313452] uvcvideo: Frame complete (EOF found).
    831 [  567.313504] uvcvideo: Dropping payload (out of sync).
      1 [  567.417405] uvcvideo: frame 163 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 436655097/438646843/532
      1 [  567.441445] uvcvideo: Frame complete (EOF found).
    831 [  567.441456] uvcvideo: Dropping payload (out of sync).
      1 [  567.545396] uvcvideo: frame 164 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 438603666/440595176/662
      1 [  567.573448] uvcvideo: Frame complete (EOF found).
    831 [  567.573504] uvcvideo: Dropping payload (out of sync).
      1 [  567.677409] uvcvideo: frame 165 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 440552234/442543509/792
      1 [  567.701464] uvcvideo: Frame complete (EOF found).
    832 [  567.701529] uvcvideo: Dropping payload (out of sync).
      1 [  567.805375] uvcvideo: frame 166 stats: 0/208/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 442500803/444493716/922
      1 [  567.833445] uvcvideo: Frame complete (EOF found).
    831 [  567.833455] uvcvideo: Dropping payload (out of sync).
      1 [  567.937398] uvcvideo: frame 167 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 444449372/446442049/1052
      1 [  567.961460] uvcvideo: Frame complete (EOF found).
    831 [  567.961471] uvcvideo: Dropping payload (out of sync).
      1 [  568.065382] uvcvideo: frame 168 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 446397940/448390382/1182
      1 [  568.093446] uvcvideo: Frame complete (EOF found).
    831 [  568.093456] uvcvideo: Dropping payload (out of sync).
      1 [  568.197393] uvcvideo: frame 169 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 448346509/450338715/1312
      1 [  568.221465] uvcvideo: Frame complete (EOF found).
    831 [  568.221475] uvcvideo: Dropping payload (out of sync).
      1 [  568.325390] uvcvideo: frame 170 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 450295077/452287048/1442
      1 [  568.353443] uvcvideo: Frame complete (EOF found).
    831 [  568.353453] uvcvideo: Dropping payload (out of sync).
      1 [  568.457359] uvcvideo: frame 171 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 452243646/454235380/1572
      1 [  568.481398] uvcvideo: Frame complete (EOF found).
    831 [  568.481408] uvcvideo: Dropping payload (out of sync).
      1 [  568.585420] uvcvideo: frame 172 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 454192214/456183713/1701
      1 [  568.609474] uvcvideo: Frame complete (EOF found).
    831 [  568.609539] uvcvideo: Dropping payload (out of sync).
      1 [  568.713447] uvcvideo: frame 173 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 456140783/458132046/1831
      1 [  568.741457] uvcvideo: Frame complete (EOF found).
    832 [  568.741468] uvcvideo: Dropping payload (out of sync).
      1 [  568.845383] uvcvideo: frame 174 stats: 0/208/1040 packets, 0/0/1040 pts (!early initial), 1039/1040 scr, last pts/stc/sof 458089352/460082254/1961
      1 [  568.869403] uvcvideo: Frame complete (EOF found).
    831 [  568.869412] uvcvideo: Dropping payload (out of sync).
      1 [  568.973442] uvcvideo: frame 175 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 460037920/462030587/43
      1 [  569.001441] uvcvideo: Frame complete (EOF found).
    831 [  569.001455] uvcvideo: Dropping payload (out of sync).
      1 [  569.105396] uvcvideo: frame 176 stats: 0/208/1039 packets, 0/0/1039 pts (!early initial), 1038/1039 scr, last pts/stc/sof 461986489/463978920/173
      1 [  569.129417] uvcvideo: Frame complete (EOF found).
    452 [  569.129423] uvcvideo: Dropping payload (out of sync).
      1 [  569.249393] uvcvideo: uvc_v4l2_release
      1 [  569.635294] uvcvideo: uvc_v4l2_open
      1 [  569.635380] uvcvideo: Trying format 0x56595559 (YUYV): 1184x1576.
      1 [  569.635383] uvcvideo: Using default frame interval 200000.0 us (5.0 fps).
      1 [  569.648559] uvcvideo: Setting frame interval to 1/5 (2000000).
     32 [  569.693578] uvcvideo: uvc_v4l2_mmap
      1 [  569.701289] uvcvideo: Device requested 3072 B/frame bandwidth.
      1 [  569.701293] uvcvideo: Selecting alternate setting 6 (3072 B/frame bandwidth).
      1 [  569.705365] uvcvideo: Allocated 5 URB buffers of 32x3072 bytes each.
      1 [  571.718463] uvcvideo: frame 1 stats: 0/0/16095 packets, 0/0/16095 pts (early !initial), 16094/16095 scr, last pts/stc/sof 465883626/503213729/740
      1 [  571.934426] uvcvideo: Frame complete (EOF found).
    418 [  571.934437] uvcvideo: Dropping payload (out of sync).
      1 [  571.986427] uvcvideo: frame 2 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 502931606/507191029/1006
      1 [  572.198405] uvcvideo: Frame complete (EOF found).
    418 [  572.198477] uvcvideo: Dropping payload (out of sync).
      1 [  572.250373] uvcvideo: frame 3 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 506908706/511168328/1271
      1 [  572.462410] uvcvideo: Frame complete (EOF found).
    418 [  572.462422] uvcvideo: Dropping payload (out of sync).
      1 [  572.514408] uvcvideo: frame 4 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 510885806/515145627/1536
      1 [  572.730390] uvcvideo: Frame complete (EOF found).
    418 [  572.730399] uvcvideo: Dropping payload (out of sync).
      1 [  572.782393] uvcvideo: frame 5 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 514862906/519122926/1801
      1 [  572.994410] uvcvideo: Frame complete (EOF found).
    418 [  572.994419] uvcvideo: Dropping payload (out of sync).
      1 [  573.046371] uvcvideo: frame 6 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 518840006/523100226/18
      1 [  573.258402] uvcvideo: Frame complete (EOF found).
    418 [  573.258421] uvcvideo: Dropping payload (out of sync).
      1 [  573.310409] uvcvideo: frame 7 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 522817106/527077525/283
      1 [  573.522418] uvcvideo: Frame complete (EOF found).
    419 [  573.522482] uvcvideo: Dropping payload (out of sync).
      1 [  573.574417] uvcvideo: frame 8 stats: 0/1702/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 526794206/531054824/548
      1 [  573.790398] uvcvideo: Frame complete (EOF found).
    418 [  573.790405] uvcvideo: Dropping payload (out of sync).
      1 [  573.842370] uvcvideo: frame 9 stats: 0/1702/2120 packets, 0/0/2120 pts (!early initial), 2119/2120 scr, last pts/stc/sof 530771306/535030248/813
      1 [  574.054371] uvcvideo: Frame complete (EOF found).
    418 [  574.054379] uvcvideo: Dropping payload (out of sync).
      1 [  574.106406] uvcvideo: frame 10 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 534748406/539007547/1078
      1 [  574.318395] uvcvideo: Frame complete (EOF found).
    418 [  574.318402] uvcvideo: Dropping payload (out of sync).
      1 [  574.370394] uvcvideo: frame 11 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 538725506/542984847/1344
      1 [  574.582468] uvcvideo: Frame complete (EOF found).
    418 [  574.582487] uvcvideo: Dropping payload (out of sync).
      1 [  574.638376] uvcvideo: frame 12 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 542702606/546962146/1609
      1 [  574.850377] uvcvideo: Frame complete (EOF found).
    418 [  574.850387] uvcvideo: Dropping payload (out of sync).
      1 [  574.902388] uvcvideo: frame 13 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 546679706/550939445/1874
      1 [  575.114406] uvcvideo: Frame complete (EOF found).
    418 [  575.114411] uvcvideo: Dropping payload (out of sync).
      1 [  575.166390] uvcvideo: frame 14 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 550656806/554916745/91
      1 [  575.378418] uvcvideo: Frame complete (EOF found).
    418 [  575.378468] uvcvideo: Dropping payload (out of sync).
      1 [  575.430385] uvcvideo: frame 15 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 554633906/558894044/356
      1 [  575.646396] uvcvideo: Frame complete (EOF found).
    418 [  575.646400] uvcvideo: Dropping payload (out of sync).
      1 [  575.698361] uvcvideo: frame 16 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 558611006/562871343/621
      1 [  575.910401] uvcvideo: Frame complete (EOF found).
    419 [  575.910405] uvcvideo: Dropping payload (out of sync).
      1 [  575.962368] uvcvideo: frame 17 stats: 0/1702/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 562588106/566848643/886
      1 [  576.174403] uvcvideo: Frame complete (EOF found).
    419 [  576.174411] uvcvideo: Dropping payload (out of sync).
      1 [  576.226404] uvcvideo: frame 18 stats: 0/1702/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 566565206/570825942/1151
      1 [  576.438426] uvcvideo: Frame complete (EOF found).
    418 [  576.438431] uvcvideo: Dropping payload (out of sync).
      1 [  576.490417] uvcvideo: frame 19 stats: 0/1702/2120 packets, 0/0/2120 pts (!early initial), 2119/2120 scr, last pts/stc/sof 570542306/574801366/1416
      1 [  576.706402] uvcvideo: Frame complete (EOF found).
    418 [  576.706407] uvcvideo: Dropping payload (out of sync).
      1 [  576.758377] uvcvideo: frame 20 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 574519406/578778665/1682
      1 [  576.970401] uvcvideo: Frame complete (EOF found).
    418 [  576.970408] uvcvideo: Dropping payload (out of sync).
      1 [  577.022370] uvcvideo: frame 21 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 578496506/582755965/1947
      1 [  577.234420] uvcvideo: Frame complete (EOF found).
    418 [  577.234463] uvcvideo: Dropping payload (out of sync).
      1 [  577.286379] uvcvideo: frame 22 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 582473606/586733264/164
      1 [  577.502400] uvcvideo: Frame complete (EOF found).
    418 [  577.502440] uvcvideo: Dropping payload (out of sync).
      1 [  577.554380] uvcvideo: frame 23 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 586450706/590710563/429
      1 [  577.766401] uvcvideo: Frame complete (EOF found).
    418 [  577.766438] uvcvideo: Dropping payload (out of sync).
      1 [  577.818403] uvcvideo: frame 24 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 590427806/594687863/694
      1 [  578.030427] uvcvideo: Frame complete (EOF found).
    418 [  578.030472] uvcvideo: Dropping payload (out of sync).
      1 [  578.082375] uvcvideo: frame 25 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 594404906/598665162/959
      1 [  578.294420] uvcvideo: Frame complete (EOF found).
    418 [  578.294462] uvcvideo: Dropping payload (out of sync).
      1 [  578.346383] uvcvideo: frame 26 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 598382006/602642461/1224
      1 [  578.562391] uvcvideo: Frame complete (EOF found).
    419 [  578.562434] uvcvideo: Dropping payload (out of sync).
      1 [  578.614370] uvcvideo: frame 27 stats: 0/1702/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 602359106/606619761/1489
      1 [  578.826403] uvcvideo: Frame complete (EOF found).
    418 [  578.826468] uvcvideo: Dropping payload (out of sync).
      1 [  578.878370] uvcvideo: frame 28 stats: 0/1702/2120 packets, 0/0/2120 pts (!early initial), 2119/2120 scr, last pts/stc/sof 606336206/610595185/1754
      1 [  579.090411] uvcvideo: Frame complete (EOF found).
    418 [  579.090464] uvcvideo: Dropping payload (out of sync).
      1 [  579.142379] uvcvideo: frame 29 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 610313306/614572484/2020
      1 [  579.354391] uvcvideo: Frame complete (EOF found).
    418 [  579.354398] uvcvideo: Dropping payload (out of sync).
      1 [  579.410364] uvcvideo: frame 30 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 614290406/618549784/237
      1 [  579.622395] uvcvideo: Frame complete (EOF found).
    418 [  579.622433] uvcvideo: Dropping payload (out of sync).
      1 [  579.674378] uvcvideo: frame 31 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 618267506/622527083/502
      1 [  579.886407] uvcvideo: Frame complete (EOF found).
    418 [  579.886471] uvcvideo: Dropping payload (out of sync).
      1 [  579.938407] uvcvideo: frame 32 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 622244606/626504382/767
      1 [  580.150421] uvcvideo: Frame complete (EOF found).
    418 [  580.150426] uvcvideo: Dropping payload (out of sync).
      1 [  580.202383] uvcvideo: frame 33 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 626221706/630481682/1032
      1 [  580.418389] uvcvideo: Frame complete (EOF found).
    418 [  580.418393] uvcvideo: Dropping payload (out of sync).
      1 [  580.470360] uvcvideo: frame 34 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 630198806/634458981/1297
      1 [  580.682402] uvcvideo: Frame complete (EOF found).
    418 [  580.682408] uvcvideo: Dropping payload (out of sync).
      1 [  580.734367] uvcvideo: frame 35 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 634175906/638436280/1562
      1 [  580.946407] uvcvideo: Frame complete (EOF found).
    419 [  580.946414] uvcvideo: Dropping payload (out of sync).
      1 [  580.998384] uvcvideo: frame 36 stats: 0/1702/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 638153006/642413580/1827
      1 [  581.210420] uvcvideo: Frame complete (EOF found).
    418 [  581.210423] uvcvideo: Dropping payload (out of sync).
      1 [  581.262376] uvcvideo: frame 37 stats: 0/1702/2120 packets, 0/0/2120 pts (!early initial), 2119/2120 scr, last pts/stc/sof 642130106/646389004/44
      1 [  581.478392] uvcvideo: Frame complete (EOF found).
    418 [  581.478396] uvcvideo: Dropping payload (out of sync).
      1 [  581.530362] uvcvideo: frame 38 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 646107206/650366303/310
      1 [  581.742399] uvcvideo: Frame complete (EOF found).
    418 [  581.742405] uvcvideo: Dropping payload (out of sync).
      1 [  581.794368] uvcvideo: frame 39 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 650084306/654343603/575
      1 [  582.006412] uvcvideo: Frame complete (EOF found).
    418 [  582.006416] uvcvideo: Dropping payload (out of sync).
      1 [  582.058388] uvcvideo: frame 40 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 654061406/658320902/840
      1 [  582.274390] uvcvideo: Frame complete (EOF found).
    418 [  582.274436] uvcvideo: Dropping payload (out of sync).
      1 [  582.326396] uvcvideo: frame 41 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 658038506/662298202/1105
      1 [  582.538379] uvcvideo: Frame complete (EOF found).
    418 [  582.538393] uvcvideo: Dropping payload (out of sync).
      1 [  582.590370] uvcvideo: frame 42 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 662015606/666275501/1370
      1 [  582.802410] uvcvideo: Frame complete (EOF found).
    418 [  582.802473] uvcvideo: Dropping payload (out of sync).
      1 [  582.854377] uvcvideo: frame 43 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 665992706/670252800/1635
      1 [  583.066441] uvcvideo: Frame complete (EOF found).
    418 [  583.066447] uvcvideo: Dropping payload (out of sync).
      1 [  583.118385] uvcvideo: frame 44 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 669969806/674230100/1900
      1 [  583.334393] uvcvideo: Frame complete (EOF found).
    418 [  583.334435] uvcvideo: Dropping payload (out of sync).
      1 [  583.386363] uvcvideo: frame 45 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 673946906/678207399/117
      1 [  583.598406] uvcvideo: Frame complete (EOF found).
    419 [  583.598410] uvcvideo: Dropping payload (out of sync).
      1 [  583.650372] uvcvideo: frame 46 stats: 0/1702/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 677924006/682184699/383
      1 [  583.862416] uvcvideo: Frame complete (EOF found).
    418 [  583.862462] uvcvideo: Dropping payload (out of sync).
      1 [  583.914390] uvcvideo: frame 47 stats: 0/1702/2120 packets, 0/0/2120 pts (!early initial), 2119/2120 scr, last pts/stc/sof 681901106/686160123/648
      1 [  584.126387] uvcvideo: Frame complete (EOF found).
    418 [  584.126393] uvcvideo: Dropping payload (out of sync).
      1 [  584.182359] uvcvideo: frame 48 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 685878206/690137422/913
      1 [  584.394396] uvcvideo: Frame complete (EOF found).
    418 [  584.394400] uvcvideo: Dropping payload (out of sync).
      1 [  584.446379] uvcvideo: frame 49 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 689855306/694114722/1178
      1 [  584.658409] uvcvideo: Frame complete (EOF found).
    418 [  584.658414] uvcvideo: Dropping payload (out of sync).
      1 [  584.710414] uvcvideo: frame 50 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 693832406/698092021/1443
      1 [  584.922415] uvcvideo: Frame complete (EOF found).
    418 [  584.922420] uvcvideo: Dropping payload (out of sync).
      1 [  584.974413] uvcvideo: frame 51 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 697809506/702069320/1708
      1 [  585.190391] uvcvideo: Frame complete (EOF found).
    418 [  585.190396] uvcvideo: Dropping payload (out of sync).
      1 [  585.242362] uvcvideo: frame 52 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 701786606/706046620/1973
      1 [  585.454386] uvcvideo: Frame complete (EOF found).
    418 [  585.454390] uvcvideo: Dropping payload (out of sync).
      1 [  585.506372] uvcvideo: frame 53 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 705763706/710023919/190
      1 [  585.718410] uvcvideo: Frame complete (EOF found).
    418 [  585.718415] uvcvideo: Dropping payload (out of sync).
      1 [  585.770389] uvcvideo: frame 54 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 709740806/714001219/455
      1 [  585.982385] uvcvideo: Frame complete (EOF found).
    419 [  585.982389] uvcvideo: Dropping payload (out of sync).
      1 [  586.038373] uvcvideo: frame 55 stats: 0/1702/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 713717906/717978518/721
      1 [  586.250394] uvcvideo: Frame complete (EOF found).
    418 [  586.250398] uvcvideo: Dropping payload (out of sync).
      1 [  586.302361] uvcvideo: frame 56 stats: 0/1702/2120 packets, 0/0/2120 pts (!early initial), 2119/2120 scr, last pts/stc/sof 717695006/721953942/986
      1 [  586.514428] uvcvideo: Frame complete (EOF found).
    418 [  586.514473] uvcvideo: Dropping payload (out of sync).
      1 [  586.566372] uvcvideo: frame 57 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 721672106/725931242/1251
      1 [  586.778415] uvcvideo: Frame complete (EOF found).
    418 [  586.778459] uvcvideo: Dropping payload (out of sync).
      1 [  586.830380] uvcvideo: frame 58 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 725649206/729908541/1516
      1 [  587.046389] uvcvideo: Frame complete (EOF found).
    418 [  587.046435] uvcvideo: Dropping payload (out of sync).
      1 [  587.098362] uvcvideo: frame 59 stats: 0/1703/2121 packets, 0/0/2121 pts (!early initial), 2120/2121 scr, last pts/stc/sof 729626306/733885841/1781
      1 [  587.310401] uvcvideo: Frame complete (EOF found).
    342 [  587.310437] uvcvideo: Dropping payload (out of sync).
      1 [  639.513173] perf: interrupt took too long (2510 > 2500), lowering kernel.perf_event_max_sample_rate to 79500
      1 [  832.646797] usb 2-1.2: USB disconnect, device number 3
      1 [  961.617607] perf: interrupt took too long (3154 > 3137), lowering kernel.perf_event_max_sample_rate to 63250



--------------F1EAC76013CD4E95ACEF7743--


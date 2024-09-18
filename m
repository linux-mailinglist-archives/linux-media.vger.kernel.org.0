Return-Path: <linux-media+bounces-18396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2C797C142
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 23:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3A2B1F21D5B
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 21:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C42C1CB306;
	Wed, 18 Sep 2024 21:13:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08F51CB335
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 21:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726693986; cv=none; b=cYm5622PYXa1qxEgpCfGlXoDoEh7i4eaZ/o1Mk/VtvZ2yuJpfZ2VnWRpH3zySyxbYfyEggQUnsLSyyqb8gvOJGaE9NZpG//IZdh5l1nHzaT9UethNM9zAVH0ShQpcEH4mY1skGDt634IlFmWfqLyGK0elTOQnxQN38HnmHTy6hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726693986; c=relaxed/simple;
	bh=VWPp1vcid6t8E2ofvohPm2F2/qFqG8syoLnRwR13FmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=unVgMxchJbSoWpmpSMPLdj7tnQajP928qaKZt1zp8jymH8RcwgZMxEAeTDmwVzCZTn2mqS75Y1YSvJ86wvi3Z99NEhlE78TcZO/GHt39hvlAGExY57ucf03MIYzq4bAgWonOl7m0T0toXY/BIpbFyEmQOttr8/Xg68JlSoIwHXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=koyu.space; spf=pass smtp.mailfrom=koyu.space; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=koyu.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=koyu.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4X8BFH1zVxz9slF;
	Wed, 18 Sep 2024 23:12:51 +0200 (CEST)
Message-ID: <5878053a-27c5-4b06-8675-e1a0236c9430@koyu.space>
Date: Wed, 18 Sep 2024 23:12:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Add support for "Quanta Computer, Inc. ACER HD User Facing"
To: Ricardo Ribalda <ribalda@chromium.org>
References: <fce4f906-d69b-417d-9f13-bf69fe5c81e3@koyu.space>
 <CANiDSCsrVJ-rSCNHw-=FVRa4p_1PhfPzYb0cR0xh8cPrhN1yZg@mail.gmail.com>
Content-Language: en-US
Cc: linux-media@vger.kernel.org
From: Leonie Ain <me@koyu.space>
In-Reply-To: <CANiDSCsrVJ-rSCNHw-=FVRa4p_1PhfPzYb0cR0xh8cPrhN1yZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4X8BFH1zVxz9slF

Hi Ricardo,

thanks for the quick reply. Sure thing, here's the output for lsusb -v 
-d 0408:4033

Bus 001 Device 002: ID 0408:4033 Quanta Computer, Inc. ACER HD User Facing
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.01
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 [unknown]
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x0408 Quanta Computer, Inc.
   idProduct          0x4033 ACER HD User Facing
   bcdDevice            0.04
   iManufacturer           1 Quanta
   iProduct                2 ACER HD User Facing
   iSerial                 3 01.00.00
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0255
     bNumInterfaces          3
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         2
       bFunctionClass         14 Video
       bFunctionSubClass       3 Video Interface Collection
       bFunctionProtocol       0
       iFunction               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      1 Video Control
       bInterfaceProtocol      1
       iInterface              4
       VideoControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdUVC               1.50
         wTotalLength       0x006f
         dwClockFrequency       48.000000MHz
         bInCollection           1
         baInterfaceNr( 0)       1
       VideoControl Interface Descriptor:
         bLength                18
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             1
         wTerminalType      0x0201 Camera Sensor
         bAssocTerminal          0
         iTerminal               0
         wObjectiveFocalLengthMin      0
         wObjectiveFocalLengthMax      0
         wOcularFocalLength            0
         bControlSize                  3
         bmControls           0x0020000a
           Auto-Exposure Mode
           Exposure Time (Absolute)
           Region of Interest
       VideoControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      5 (PROCESSING_UNIT)
         bUnitID                 2
         bSourceID               1
         wMaxMultiplier      16384
         bControlSize            3
         bmControls     0x0000157f
           Brightness
           Contrast
           Hue
           Saturation
           Sharpness
           Gamma
           White Balance Temperature
           Backlight Compensation
           Power Line Frequency
           White Balance Temperature, Auto
         iProcessing             0
         bmVideoStandards     0x00
       VideoControl Interface Descriptor:
         bLength                29
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 3
         guidExtensionCode {26b8105a-0713-4870-979d-da79444bb68e}
         bNumControls            1
         bNrInPins               1
         baSourceID( 0)          2
         bControlSize            4
         bmControls( 0)       0x04
         bmControls( 1)       0x00
         bmControls( 2)       0x00
         bmControls( 3)       0x00
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                29
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 4
         guidExtensionCode {63610682-5070-49ab-b8cc-b3855e8d221d}
         bNumControls           26
         bNrInPins               1
         baSourceID( 0)          3
         bControlSize            4
         bmControls( 0)       0xff
         bmControls( 1)       0xff
         bmControls( 2)       0x77
         bmControls( 3)       0x47
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID             5
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID               4
         iTerminal               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x87  EP 7 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0010  1x 16 bytes
         bInterval               8
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       VideoStreaming Interface Descriptor:
         bLength                            15
         bDescriptorType                    36
         bDescriptorSubtype                  1 (INPUT_HEADER)
         bNumFormats                         2
         wTotalLength                   0x00f5
         bEndpointAddress                 0x81  EP 1 IN
         bmInfo                              0
         bTerminalLink                       5
         bStillCaptureMethod                 1
         bTriggerSupport                     0
         bTriggerUsage                       0
         bControlSize                        1
         bmaControls( 0)                     4
         bmaControls( 1)                     0
       VideoStreaming Interface Descriptor:
         bLength                            11
         bDescriptorType                    36
         bDescriptorSubtype                  6 (FORMAT_MJPEG)
         bFormatIndex                        1
         bNumFrameDescriptors                3
         bFlags                              1
           Fixed-size samples: Yes
         bDefaultFrameIndex                  1
         bAspectRatioX                       0
         bAspectRatioY                       0
         bmInterlaceFlags                 0x00
           Interlaced stream or variable: No
           Fields per frame: 1 fields
           Field 1 first: No
           Field pattern: Field 1 only
         bCopyProtect                        0
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         1
         bmCapabilities                   0x01
           Still image supported
         wWidth                           1280
         wHeight                           720
         dwMinBitRate                442368000
         dwMaxBitRate                442368000
         dwMaxVideoFrameBufferSize     1843200
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         2
         bmCapabilities                   0x01
           Still image supported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                147456000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         3
         bmCapabilities                   0x01
           Still image supported
         wWidth                            640
         wHeight                           360
         dwMinBitRate                110592000
         dwMaxBitRate                110592000
         dwMaxVideoFrameBufferSize      460800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                             6
         bDescriptorType                    36
         bDescriptorSubtype                 13 (COLORFORMAT)
         bColorPrimaries                     1 (BT.709,sRGB)
         bTransferCharacteristics            1 (BT.709)
         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
       VideoStreaming Interface Descriptor:
         bLength                            27
         bDescriptorType                    36
         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
         bFormatIndex                        2
         bNumFrameDescriptors                3
         guidFormat {32595559-0000-0010-8000-00aa00389b71}
         bBitsPerPixel                      16
         bDefaultFrameIndex                  1
         bAspectRatioX                       0
         bAspectRatioY                       0
         bmInterlaceFlags                 0x00
           Interlaced stream or variable: No
           Fields per frame: 2 fields
           Field 1 first: No
           Field pattern: Field 1 only
         bCopyProtect                        0
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         1
         bmCapabilities                   0x01
           Still image supported
         wWidth                           1280
         wHeight                           720
         dwMinBitRate                147456000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize     1843200
         dwDefaultFrameInterval        1000000
         bFrameIntervalType                  1
         dwFrameInterval( 0)           1000000
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         2
         bmCapabilities                   0x01
           Still image supported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                147456000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         3
         bmCapabilities                   0x01
           Still image supported
         wWidth                            640
         wHeight                           360
         dwMinBitRate                110592000
         dwMaxBitRate                110592000
         dwMaxVideoFrameBufferSize      460800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                             6
         bDescriptorType                    36
         bDescriptorSubtype                 13 (COLORFORMAT)
         bColorPrimaries                     1 (BT.709,sRGB)
         bTransferCharacteristics            1 (BT.709)
         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x00c0  1x 192 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       2
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0180  1x 384 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       3
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       4
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0280  1x 640 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       5
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0320  1x 800 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       6
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x03b0  1x 944 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       7
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0a80  2x 640 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       8
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0b20  2x 800 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       9
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0be0  2x 992 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting      10
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x13c0  3x 960 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting      11
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x13fc  3x 1020 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass       254 Application Specific Interface
       bInterfaceSubClass      1 Device Firmware Update
       bInterfaceProtocol      1
       iInterface             12
       Device Firmware Upgrade Interface Descriptor:
         bLength                             9
         bDescriptorType                    33
         bmAttributes                       15
           Will Detach
           Manifestation Tolerant
           Upload Supported
           Download Supported
         wDetachTimeout                   2000 milliseconds
         wTransferSize                    4096 bytes
         bcdDFUVersion                   1.10
[julian-ain@Inventar777 ~]$ sudo lsusb -v -d 0408:4033
[sudo] Passwort für julian-ain:

Bus 001 Device 002: ID 0408:4033 Quanta Computer, Inc. ACER HD User Facing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.01
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 [unknown]
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x0408 Quanta Computer, Inc.
   idProduct          0x4033 ACER HD User Facing
   bcdDevice            0.04
   iManufacturer           1 Quanta
   iProduct                2 ACER HD User Facing
   iSerial                 3 01.00.00
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0255
     bNumInterfaces          3
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         2
       bFunctionClass         14 Video
       bFunctionSubClass       3 Video Interface Collection
       bFunctionProtocol       0
       iFunction               4 ACER HD User Facing
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      1 Video Control
       bInterfaceProtocol      1
       iInterface              4 ACER HD User Facing
       VideoControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdUVC               1.50
         wTotalLength       0x006f
         dwClockFrequency       48.000000MHz
         bInCollection           1
         baInterfaceNr( 0)       1
       VideoControl Interface Descriptor:
         bLength                18
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             1
         wTerminalType      0x0201 Camera Sensor
         bAssocTerminal          0
         iTerminal               0
         wObjectiveFocalLengthMin      0
         wObjectiveFocalLengthMax      0
         wOcularFocalLength            0
         bControlSize                  3
         bmControls           0x0020000a
           Auto-Exposure Mode
           Exposure Time (Absolute)
           Region of Interest
       VideoControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      5 (PROCESSING_UNIT)
         bUnitID                 2
         bSourceID               1
         wMaxMultiplier      16384
         bControlSize            3
         bmControls     0x0000157f
           Brightness
           Contrast
           Hue
           Saturation
           Sharpness
           Gamma
           White Balance Temperature
           Backlight Compensation
           Power Line Frequency
           White Balance Temperature, Auto
         iProcessing             0
         bmVideoStandards     0x00
       VideoControl Interface Descriptor:
         bLength                29
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 3
         guidExtensionCode {26b8105a-0713-4870-979d-da79444bb68e}
         bNumControls            1
         bNrInPins               1
         baSourceID( 0)          2
         bControlSize            4
         bmControls( 0)       0x04
         bmControls( 1)       0x00
         bmControls( 2)       0x00
         bmControls( 3)       0x00
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                29
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 4
         guidExtensionCode {63610682-5070-49ab-b8cc-b3855e8d221d}
         bNumControls           26
         bNrInPins               1
         baSourceID( 0)          3
         bControlSize            4
         bmControls( 0)       0xff
         bmControls( 1)       0xff
         bmControls( 2)       0x77
         bmControls( 3)       0x47
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID             5
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID               4
         iTerminal               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x87  EP 7 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0010  1x 16 bytes
         bInterval               8
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       VideoStreaming Interface Descriptor:
         bLength                            15
         bDescriptorType                    36
         bDescriptorSubtype                  1 (INPUT_HEADER)
         bNumFormats                         2
         wTotalLength                   0x00f5
         bEndpointAddress                 0x81  EP 1 IN
         bmInfo                              0
         bTerminalLink                       5
         bStillCaptureMethod                 1
         bTriggerSupport                     0
         bTriggerUsage                       0
         bControlSize                        1
         bmaControls( 0)                     4
         bmaControls( 1)                     0
       VideoStreaming Interface Descriptor:
         bLength                            11
         bDescriptorType                    36
         bDescriptorSubtype                  6 (FORMAT_MJPEG)
         bFormatIndex                        1
         bNumFrameDescriptors                3
         bFlags                              1
           Fixed-size samples: Yes
         bDefaultFrameIndex                  1
         bAspectRatioX                       0
         bAspectRatioY                       0
         bmInterlaceFlags                 0x00
           Interlaced stream or variable: No
           Fields per frame: 1 fields
           Field 1 first: No
           Field pattern: Field 1 only
         bCopyProtect                        0
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         1
         bmCapabilities                   0x01
           Still image supported
         wWidth                           1280
         wHeight                           720
         dwMinBitRate                442368000
         dwMaxBitRate                442368000
         dwMaxVideoFrameBufferSize     1843200
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         2
         bmCapabilities                   0x01
           Still image supported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                147456000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         3
         bmCapabilities                   0x01
           Still image supported
         wWidth                            640
         wHeight                           360
         dwMinBitRate                110592000
         dwMaxBitRate                110592000
         dwMaxVideoFrameBufferSize      460800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                             6
         bDescriptorType                    36
         bDescriptorSubtype                 13 (COLORFORMAT)
         bColorPrimaries                     1 (BT.709,sRGB)
         bTransferCharacteristics            1 (BT.709)
         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
       VideoStreaming Interface Descriptor:
         bLength                            27
         bDescriptorType                    36
         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
         bFormatIndex                        2
         bNumFrameDescriptors                3
         guidFormat {32595559-0000-0010-8000-00aa00389b71}
         bBitsPerPixel                      16
         bDefaultFrameIndex                  1
         bAspectRatioX                       0
         bAspectRatioY                       0
         bmInterlaceFlags                 0x00
           Interlaced stream or variable: No
           Fields per frame: 2 fields
           Field 1 first: No
           Field pattern: Field 1 only
         bCopyProtect                        0
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         1
         bmCapabilities                   0x01
           Still image supported
         wWidth                           1280
         wHeight                           720
         dwMinBitRate                147456000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize     1843200
         dwDefaultFrameInterval        1000000
         bFrameIntervalType                  1
         dwFrameInterval( 0)           1000000
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         2
         bmCapabilities                   0x01
           Still image supported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                147456000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         3
         bmCapabilities                   0x01
           Still image supported
         wWidth                            640
         wHeight                           360
         dwMinBitRate                110592000
         dwMaxBitRate                110592000
         dwMaxVideoFrameBufferSize      460800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                             6
         bDescriptorType                    36
         bDescriptorSubtype                 13 (COLORFORMAT)
         bColorPrimaries                     1 (BT.709,sRGB)
         bTransferCharacteristics            1 (BT.709)
         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x00c0  1x 192 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       2
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0180  1x 384 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       3
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       4
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0280  1x 640 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       5
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0320  1x 800 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       6
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x03b0  1x 944 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       7
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0a80  2x 640 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       8
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0b20  2x 800 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       9
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0be0  2x 992 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting      10
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x13c0  3x 960 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting      11
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x13fc  3x 1020 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass       254 Application Specific Interface
       bInterfaceSubClass      1 Device Firmware Update
       bInterfaceProtocol      1
       iInterface             12 APP Mode
       Device Firmware Upgrade Interface Descriptor:
         bLength                             9
         bDescriptorType                    33
         bmAttributes                       15
           Will Detach
           Manifestation Tolerant
           Upload Supported
           Download Supported
         wDetachTimeout                   2000 milliseconds
         wTransferSize                    4096 bytes
         bcdDFUVersion                   1.10
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x0029
   bNumDeviceCaps          2
   Platform Device Capability:
     bLength                28
     bDescriptorType        16
     bDevCapabilityType      5
     bReserved               0
     PlatformCapabilityUUID {d8dd60df-4589-4cc7-9cd2-659d9e648a9f}
     CapabilityData[0]    0x00
     CapabilityData[1]    0x00
     CapabilityData[2]    0x03
     CapabilityData[3]    0x06
     CapabilityData[4]    0x34
     CapabilityData[5]    0x03
     CapabilityData[6]    0x01
     CapabilityData[7]    0x00
   ** UNRECOGNIZED:  08 10 11 01 03 00 00 00
Device Status:     0x0000
   (Bus Powered)
[julian-ain@Inventar777 ~]$ lsusb -v -d 0408:4033

Bus 001 Device 002: ID 0408:4033 Quanta Computer, Inc. ACER HD User Facing
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.01
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 [unknown]
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x0408 Quanta Computer, Inc.
   idProduct          0x4033 ACER HD User Facing
   bcdDevice            0.04
   iManufacturer           1 Quanta
   iProduct                2 ACER HD User Facing
   iSerial                 3 01.00.00
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0255
     bNumInterfaces          3
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         2
       bFunctionClass         14 Video
       bFunctionSubClass       3 Video Interface Collection
       bFunctionProtocol       0
       iFunction               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      1 Video Control
       bInterfaceProtocol      1
       iInterface              4
       VideoControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdUVC               1.50
         wTotalLength       0x006f
         dwClockFrequency       48.000000MHz
         bInCollection           1
         baInterfaceNr( 0)       1
       VideoControl Interface Descriptor:
         bLength                18
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             1
         wTerminalType      0x0201 Camera Sensor
         bAssocTerminal          0
         iTerminal               0
         wObjectiveFocalLengthMin      0
         wObjectiveFocalLengthMax      0
         wOcularFocalLength            0
         bControlSize                  3
         bmControls           0x0020000a
           Auto-Exposure Mode
           Exposure Time (Absolute)
           Region of Interest
       VideoControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      5 (PROCESSING_UNIT)
         bUnitID                 2
         bSourceID               1
         wMaxMultiplier      16384
         bControlSize            3
         bmControls     0x0000157f
           Brightness
           Contrast
           Hue
           Saturation
           Sharpness
           Gamma
           White Balance Temperature
           Backlight Compensation
           Power Line Frequency
           White Balance Temperature, Auto
         iProcessing             0
         bmVideoStandards     0x00
       VideoControl Interface Descriptor:
         bLength                29
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 3
         guidExtensionCode {26b8105a-0713-4870-979d-da79444bb68e}
         bNumControls            1
         bNrInPins               1
         baSourceID( 0)          2
         bControlSize            4
         bmControls( 0)       0x04
         bmControls( 1)       0x00
         bmControls( 2)       0x00
         bmControls( 3)       0x00
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                29
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 4
         guidExtensionCode {63610682-5070-49ab-b8cc-b3855e8d221d}
         bNumControls           26
         bNrInPins               1
         baSourceID( 0)          3
         bControlSize            4
         bmControls( 0)       0xff
         bmControls( 1)       0xff
         bmControls( 2)       0x77
         bmControls( 3)       0x47
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID             5
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID               4
         iTerminal               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x87  EP 7 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0010  1x 16 bytes
         bInterval               8
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       VideoStreaming Interface Descriptor:
         bLength                            15
         bDescriptorType                    36
         bDescriptorSubtype                  1 (INPUT_HEADER)
         bNumFormats                         2
         wTotalLength                   0x00f5
         bEndpointAddress                 0x81  EP 1 IN
         bmInfo                              0
         bTerminalLink                       5
         bStillCaptureMethod                 1
         bTriggerSupport                     0
         bTriggerUsage                       0
         bControlSize                        1
         bmaControls( 0)                     4
         bmaControls( 1)                     0
       VideoStreaming Interface Descriptor:
         bLength                            11
         bDescriptorType                    36
         bDescriptorSubtype                  6 (FORMAT_MJPEG)
         bFormatIndex                        1
         bNumFrameDescriptors                3
         bFlags                              1
           Fixed-size samples: Yes
         bDefaultFrameIndex                  1
         bAspectRatioX                       0
         bAspectRatioY                       0
         bmInterlaceFlags                 0x00
           Interlaced stream or variable: No
           Fields per frame: 1 fields
           Field 1 first: No
           Field pattern: Field 1 only
         bCopyProtect                        0
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         1
         bmCapabilities                   0x01
           Still image supported
         wWidth                           1280
         wHeight                           720
         dwMinBitRate                442368000
         dwMaxBitRate                442368000
         dwMaxVideoFrameBufferSize     1843200
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         2
         bmCapabilities                   0x01
           Still image supported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                147456000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         3
         bmCapabilities                   0x01
           Still image supported
         wWidth                            640
         wHeight                           360
         dwMinBitRate                110592000
         dwMaxBitRate                110592000
         dwMaxVideoFrameBufferSize      460800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                             6
         bDescriptorType                    36
         bDescriptorSubtype                 13 (COLORFORMAT)
         bColorPrimaries                     1 (BT.709,sRGB)
         bTransferCharacteristics            1 (BT.709)
         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
       VideoStreaming Interface Descriptor:
         bLength                            27
         bDescriptorType                    36
         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
         bFormatIndex                        2
         bNumFrameDescriptors                3
         guidFormat {32595559-0000-0010-8000-00aa00389b71}
         bBitsPerPixel                      16
         bDefaultFrameIndex                  1
         bAspectRatioX                       0
         bAspectRatioY                       0
         bmInterlaceFlags                 0x00
           Interlaced stream or variable: No
           Fields per frame: 2 fields
           Field 1 first: No
           Field pattern: Field 1 only
         bCopyProtect                        0
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         1
         bmCapabilities                   0x01
           Still image supported
         wWidth                           1280
         wHeight                           720
         dwMinBitRate                147456000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize     1843200
         dwDefaultFrameInterval        1000000
         bFrameIntervalType                  1
         dwFrameInterval( 0)           1000000
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         2
         bmCapabilities                   0x01
           Still image supported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                147456000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         3
         bmCapabilities                   0x01
           Still image supported
         wWidth                            640
         wHeight                           360
         dwMinBitRate                110592000
         dwMaxBitRate                110592000
         dwMaxVideoFrameBufferSize      460800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  1
         dwFrameInterval( 0)            333333
       VideoStreaming Interface Descriptor:
         bLength                             6
         bDescriptorType                    36
         bDescriptorSubtype                 13 (COLORFORMAT)
         bColorPrimaries                     1 (BT.709,sRGB)
         bTransferCharacteristics            1 (BT.709)
         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x00c0  1x 192 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       2
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0180  1x 384 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       3
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       4
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0280  1x 640 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       5
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0320  1x 800 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       6
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x03b0  1x 944 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       7
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0a80  2x 640 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       8
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0b20  2x 800 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       9
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0be0  2x 992 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting      10
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x13c0  3x 960 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting      11
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      1
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x13fc  3x 1020 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass       254 Application Specific Interface
       bInterfaceSubClass      1 Device Firmware Update
       bInterfaceProtocol      1
       iInterface             12
       Device Firmware Upgrade Interface Descriptor:
         bLength                             9
         bDescriptorType                    33
         bmAttributes                       15
           Will Detach
           Manifestation Tolerant
           Upload Supported
           Download Supported
         wDetachTimeout                   2000 milliseconds
         wTransferSize                    4096 bytes
         bcdDFUVersion                   1.10


Thanks!
~Leonie


On Wed, 18 Sept 2024 at 22:50, Ricardo Ribalda <ribalda@chromium.org> wrote:
> Hi
>
> Could you share the output of lsusb -v -d 0408:4033 ?
>
> Thanks!
>
> On Tue, 17 Sept 2024 at 10:13, Leonie Ain <me@koyu.space> wrote:
>> Hi everyone,
>>
>> the people in the company I work for are all using Ubuntu 24.04 on a
>> specific model of Acer laptops. The only problem is that the webcam
>> isn't working. A quick workaround on GitHub Gist
>> <https://gist.github.com/FruitSnaxx5752/b6c82f8429e760049ad6f30e5d0dbea9>
>> suggests that adding the Device and Vendor IDs to the UVC driver works
>> just fine. Since I don't want to rely on that workaround and manually
>> load in that patched kernel module all the time I'd like to share my
>> Device and Vendor IDs with you so that support for that webcam can be
>> added for everyone. They are 0408:4033.
>>
>> Thanks for your help. If you have questions feel free to ask them, I
>> have the device always with me so I can quickly debug any issues.
>>
>> ~Leonie
>>
>>
>


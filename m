Return-Path: <linux-media+bounces-15424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CA493EFF9
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 10:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61DA828164E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 08:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629AE13C669;
	Mon, 29 Jul 2024 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z8GLtvNG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C79913B299;
	Mon, 29 Jul 2024 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722242127; cv=none; b=VFqZula7UHgsSV61wg1b9y42pohPQDaFqC+rHhgTwa439hIWRQ7b8b8wkXWzoIFcybuZHpKm5Hl3dDn2bLFs6gMff/bc8QMdyUrAA+tuzrLv1ws58+O9Q/MTgejImqhBHvRhwd5uRiSOKjegBCEjQflCsiG+50z8K74HhHDFcF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722242127; c=relaxed/simple;
	bh=2dKjcCC7Mp33P+vEX8N+CuazX56z3Heq6TwPsq9uIJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtDev6W5VNY0hhjkJ+Dv+jK3lTi61S0C1XlDpnkEjIX7ZP68FHYNs+9TS5IRgJsid9wH/uymuTAcNIYUDtkTC44YF3kfkS81xkYw1qfmVn7QAsNPqUjf1U3Tv1OSDfAnIqIj8/6/d3ixBH5C+5QGRxGHSq7w0pkEEZQjuLdC2ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z8GLtvNG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DEBE596;
	Mon, 29 Jul 2024 10:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722242077;
	bh=2dKjcCC7Mp33P+vEX8N+CuazX56z3Heq6TwPsq9uIJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8GLtvNGrMo0EByYkQ9BwNtSpEspDk2jdaKD2diZZneAs/1x6CPR/Yvm17DtlbqI4
	 wsF6YP2DyMdjKCUO8NHAqrodVNcPrjsErYWWEgL+QFKMJciKS1Uw4Y8bD/fevyVjbG
	 bCKEFdrMZ7QoHeuvGiENcfqzgTW0SnVWCjBSfIaA=
Date: Mon, 29 Jul 2024 11:35:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?6Ieq5bex?= <ccc194101@163.com>
Cc: wangyongjun@kylinos.cn, zhoulei@kylinos.cn, liuyihu@kylinos.cn,
	lizhenneng@kylinos.cn, lihongtao@kylinos.cn, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: Re: Re: [PATCH] media: uvcvideo: Block AlcorMicroCorp camera from
 reporting key events.
Message-ID: <20240729083503.GK300@pendragon.ideasonboard.com>
References: <20240723082955.2911825-1-ccc194101@163.com>
 <20240726102057.GA28621@pendragon.ideasonboard.com>
 <422515098.1778903.1722214797868.JavaMail.root@mail-tracker-183-3ep34-kunp1-54f898d94d-qbtjz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <422515098.1778903.1722214797868.JavaMail.root@mail-tracker-183-3ep34-kunp1-54f898d94d-qbtjz>

Hello,

HTML e-mails are rejected by mailing lists. Please resend in plain text.

On Mon, Jul 29, 2024 at 08:59:50AM +0800, 自己 wrote:
> Hi Laurent Pinchart,
> 
> 
>  >That sounds like a weird behaviour. What upper layers are doing this ?
> 
> When the upper layer receives the KEY_CMERA key, it will turn off the camera
> through the videoX node
> 
> 
> >Could you please send the output of `lsusb -v -d 1dfc:8513` (running as
> >root if possible) ?
> 
> Bus 001 Device 016: ID 1dfc:8513 AlcorMicroCorp USB HD Camera audio
> 
> Device Descriptor:
> 
>   bLength                18
> 
>   bDescriptorType         1
> 
>   bcdUSB               2.00
> 
>   bDeviceClass          239 Miscellaneous Device
> 
>   bDeviceSubClass         2 
> 
>   bDeviceProtocol         1 Interface Association
> 
>   bMaxPacketSize0        64
> 
>   idVendor           0x1dfc 
> 
>   idProduct          0x8513 
> 
>   bcdDevice            0.24
> 
>   iManufacturer           1 AlcorMicroCorp
> 
>   iProduct                2 USB HD Camera audio
> 
>   iSerial                 0 
> 
>   bNumConfigurations      1
> 
>   Configuration Descriptor:
> 
>     bLength                 9
> 
>     bDescriptorType         2
> 
>     wTotalLength       0x0255
> 
>     bNumInterfaces          2
> 
>     bConfigurationValue     1
> 
>     iConfiguration          0 
> 
>     bmAttributes         0x80
> 
>       (Bus Powered)
> 
>     MaxPower              500mA
> 
>     Interface Association:
> 
>       bLength                 8
> 
>       bDescriptorType        11
> 
>       bFirstInterface         0
> 
>       bInterfaceCount         2
> 
>       bFunctionClass         14 Video
> 
>       bFunctionSubClass       3 Video Interface Collection
> 
>       bFunctionProtocol       0 
> 
>       iFunction               4 Nantian Camera 8513
> 
>     Interface Descriptor:
> 
>       bLength                 9
> 
>       bDescriptorType         4
> 
>       bInterfaceNumber        0
> 
>       bAlternateSetting       0
> 
>       bNumEndpoints           1
> 
>       bInterfaceClass        14 Video
> 
>       bInterfaceSubClass      1 Video Control
> 
>       bInterfaceProtocol      0 
> 
>       iInterface              4 Nantian Camera 8513
> 
>       VideoControl Interface Descriptor:
> 
>         bLength                13
> 
>         bDescriptorType        36
> 
>         bDescriptorSubtype      1 (HEADER)
> 
>         bcdUVC               1.00
> 
>         wTotalLength       0x004f
> 
>         dwClockFrequency       30.000000MHz
> 
>         bInCollection           1
> 
>         baInterfaceNr( 0)       1
> 
>       VideoControl Interface Descriptor:
> 
>         bLength                28
> 
>         bDescriptorType        36
> 
>         bDescriptorSubtype      6 (EXTENSION_UNIT)
> 
>         bUnitID                 6
> 
>         guidExtensionCode         {68bbd0b0-61a4-4b83-90b7-a6215f3c4f70}
> 
>         bNumControl            24
> 
>         bNrPins                 1
> 
>         baSourceID( 0)          2
> 
>         bControlSize            3
> 
>         bmControls( 0)       0xff
> 
>         bmControls( 1)       0xff
> 
>         bmControls( 2)       0xff
> 
>         iExtension              0 
> 
>       VideoControl Interface Descriptor:
> 
>         bLength                18
> 
>         bDescriptorType        36
> 
>         bDescriptorSubtype      2 (INPUT_TERMINAL)
> 
>         bTerminalID             1
> 
>         wTerminalType      0x0201 Camera Sensor
> 
>         bAssocTerminal          0
> 
>         iTerminal               0 
> 
>         wObjectiveFocalLengthMin      0
> 
>         wObjectiveFocalLengthMax      0
> 
>         wOcularFocalLength            0
> 
>         bControlSize                  3
> 
>         bmControls           0x000208aa
> 
>           Auto-Exposure Mode
> 
>           Exposure Time (Absolute)
> 
>           Focus (Absolute)
> 
>           Iris (Absolute)
> 
>           PanTilt (Absolute)
> 
>           Focus, Auto
> 
>       VideoControl Interface Descriptor:
> 
>         bLength                11
> 
>         bDescriptorType        36
> 
>         bDescriptorSubtype      5 (PROCESSING_UNIT)
> 
>       Warning: Descriptor too short
> 
>         bUnitID                 2
> 
>         bSourceID               1
> 
>         wMaxMultiplier          0
> 
>         bControlSize            2
> 
>         bmControls     0x0000177f
> 
>           Brightness
> 
>           Contrast
> 
>           Hue
> 
>           Saturation
> 
>           Sharpness
> 
>           Gamma
> 
>           White Balance Temperature
> 
>           Backlight Compensation
> 
>           Gain
> 
>           Power Line Frequency
> 
>           White Balance Temperature, Auto
> 
>         iProcessing             0 
> 
>         bmVideoStandards     0x09
> 
>           None
> 
>           SECAM - 625/50
> 
>       VideoControl Interface Descriptor:
> 
>         bLength                 9
> 
>         bDescriptorType        36
> 
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
> 
>         bTerminalID             3
> 
>         wTerminalType      0x0101 USB Streaming
> 
>         bAssocTerminal          0
> 
>         bSourceID               2
> 
>         iTerminal               0 
> 
>       Endpoint Descriptor:
> 
>         bLength                 7
> 
>         bDescriptorType         5
> 
>         bEndpointAddress     0x81  EP 1 IN
> 
>         bmAttributes            3
> 
>           Transfer Type            Interrupt
> 
>           Synch Type               None
> 
>           Usage Type               Data
> 
>         wMaxPacketSize     0x0010  1x 16 bytes
> 
>         bInterval               7
> 
>     Interface Descriptor:
> 
>       bLength                 9
> 
>       bDescriptorType         4
> 
>       bInterfaceNumber        1
> 
>       bAlternateSetting       0
> 
>       bNumEndpoints           0
> 
>       bInterfaceClass        14 Video
> 
>       bInterfaceSubClass      2 Video Streaming
> 
>       bInterfaceProtocol      0 
> 
>       iInterface              4 Nantian Camera 8513
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            14
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  1 (INPUT_HEADER)
> 
>         bNumFormats                         1
> 
>         wTotalLength                   0x0197
> 
>         bEndPointAddress                  130
> 
>         bmInfo                              0
> 
>         bTerminalLink                       3
> 
>         bStillCaptureMethod                 1
> 
>         bTriggerSupport                     1
> 
>         bTriggerUsage                       0
> 
>         bControlSize                        1
> 
>         bmaControls( 0)                     0
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            27
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
> 
>         bFormatIndex                        1
> 
>         bNumFrameDescriptors               12
> 
>         guidFormat                           
> {32595559-0000-0010-8000-00aa00389b71}
> 
>         bBitsPerPixel                      16
> 
>         bDefaultFrameIndex                  1
> 
>         bAspectRatioX                       0
> 
>         bAspectRatioY                       0
> 
>         bmInterlaceFlags                 0x00
> 
>           Interlaced stream or variable: No
> 
>           Fields per frame: 2 fields
> 
>           Field 1 first: No
> 
>           Field pattern: Field 1 only
> 
>         bCopyProtect                        0
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            30
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> 
>         bFrameIndex                         1
> 
>         bmCapabilities                   0x01
> 
>           Still image supported
> 
>         wWidth                           2592
> 
>         wHeight                          1944
> 
>         dwMinBitRate                161243136
> 
>         dwMaxBitRate                161243136
> 
>         dwMaxVideoFrameBufferSize    10077696
> 
>         dwDefaultFrameInterval        5000000
> 
>         bFrameIntervalType                  1
> 
>         dwFrameInterval( 0)           5000000
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            30
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> 
>         bFrameIndex                         2
> 
>         bmCapabilities                   0x01
> 
>           Still image supported
> 
>         wWidth                           2048
> 
>         wHeight                          1536
> 
>         dwMinBitRate                100663296
> 
>         dwMaxBitRate                100663296
> 
>         dwMaxVideoFrameBufferSize     6291456
> 
>         dwDefaultFrameInterval        5000000
> 
>         bFrameIntervalType                  1
> 
>         dwFrameInterval( 0)           5000000
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            30
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> 
>         bFrameIndex                         3
> 
>         bmCapabilities                   0x01
> 
>           Still image supported
> 
>         wWidth                           1600
> 
>         wHeight                          1200
> 
>         dwMinBitRate                184320000
> 
>         dwMaxBitRate                184320000
> 
>         dwMaxVideoFrameBufferSize     3840000
> 
>         dwDefaultFrameInterval        1666666
> 
>         bFrameIntervalType                  1
> 
>         dwFrameInterval( 0)           1666666
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            30
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> 
>         bFrameIndex                         4
> 
>         bmCapabilities                   0x01
> 
>           Still image supported
> 
>         wWidth                           1280
> 
>         wHeight                          1024
> 
>         dwMinBitRate                167772160
> 
>         dwMaxBitRate                167772160
> 
>         dwMaxVideoFrameBufferSize     2621440
> 
>         dwDefaultFrameInterval        1250000
> 
>         bFrameIntervalType                  1
> 
>         dwFrameInterval( 0)           1250000
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            30
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> 
>         bFrameIndex                         5
> 
>         bmCapabilities                   0x01
> 
>           Still image supported
> 
>         wWidth                           1280
> 
>         wHeight                           960
> 
>         dwMinBitRate                157286400
> 
>         dwMaxBitRate                157286400
> 
>         dwMaxVideoFrameBufferSize     2457600
> 
>         dwDefaultFrameInterval        1250000
> 
>         bFrameIntervalType                  1
> 
>         dwFrameInterval( 0)           1250000
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            30
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> 
>         bFrameIndex                         6
> 
>         bmCapabilities                   0x01
> 
>           Still image supported
> 
>         wWidth                            800
> 
>         wHeight                           600
> 
>         dwMinBitRate                115200000
> 
>         dwMaxBitRate                115200000
> 
>         dwMaxVideoFrameBufferSize      960000
> 
>         dwDefaultFrameInterval         666666
> 
>         bFrameIntervalType                  1
> 
>         dwFrameInterval( 0)            666666
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            30
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> 
>         bFrameIndex                         7
> 
>         bmCapabilities                   0x01
> 
>           Still image supported
> 
>         wWidth                            640
> 
>         wHeight                           480
> 
>         dwMinBitRate                147456000
> 
>         dwMaxBitRate                147456000
> 
>         dwMaxVideoFrameBufferSize      614400
> 
>         dwDefaultFrameInterval         333333
> 
>         bFrameIntervalType                  1
> 
>         dwFrameInterval( 0)            333333
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            30
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> 
>         bFrameIndex                         8
> 
>         bmCapabilities                   0x01
> 
>           Still image supported
> 
>         wWidth                            352
> 
>         wHeight                           288
> 
>         dwMinBitRate                 48660480
> 
>         dwMaxBitRate                 48660480
> 
>         dwMaxVideoFrameBufferSize      202752
> 
>         dwDefaultFrameInterval         333333
> 
>         bFrameIntervalType                  1
> 
>         dwFrameInterval( 0)            333333
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            30
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> 
>         bFrameIndex                         9
> 
>         bmCapabilities                   0x01
> 
>           Still image supported
> 
>         wWidth                            320
> 
>         wHeight                           240
> 
>         dwMinBitRate                 36864000
> 
>         dwMaxBitRate                 36864000
> 
>         dwMaxVideoFrameBufferSize      153600
> 
>         dwDefaultFrameInterval         333333
> 
>         bFrameIntervalType                  1
> 
>         dwFrameInterval( 0)            333333
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            30
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> 
>         bFrameIndex                        10
> 
>         bmCapabilities                   0x01
> 
>           Still image supported
> 
>         wWidth                            176
> 
>         wHeight                           144
> 
>         dwMinBitRate                 12165120
> 
>         dwMaxBitRate                 12165120
> 
>         dwMaxVideoFrameBufferSize       50688
> 
>         dwDefaultFrameInterval         333333
> 
>         bFrameIntervalType                  1
> 
>         dwFrameInterval( 0)            333333
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            30
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> 
>         bFrameIndex                        11
> 
>         bmCapabilities                   0x01
> 
>           Still image supported
> 
>         wWidth                            160
> 
>         wHeight                           120
> 
>         dwMinBitRate                  9216000
> 
>         dwMaxBitRate                  9216000
> 
>         dwMaxVideoFrameBufferSize       38400
> 
>         dwDefaultFrameInterval         333333
> 
>         bFrameIntervalType                  1
> 
>         dwFrameInterval( 0)            333333
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                            30
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> 
>         bFrameIndex                        12
> 
>         bmCapabilities                   0x01
> 
>           Still image supported
> 
>         wWidth                           1024
> 
>         wHeight                           768
> 
>         dwMinBitRate                125829120
> 
>         dwMaxBitRate                125829120
> 
>         dwMaxVideoFrameBufferSize     1572864
> 
>         dwDefaultFrameInterval        1000000
> 
>         bFrameIntervalType                  1
> 
>         dwFrameInterval( 0)           1000000
> 
>       VideoStreaming Interface Descriptor:
> 
>         bLength                             6
> 
>         bDescriptorType                    36
> 
>         bDescriptorSubtype                 13 (COLORFORMAT)
> 
>         bColorPrimaries                     1 (BT.709,sRGB)
> 
>         bTransferCharacteristics            1 (BT.709)
> 
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
> 
>     Interface Descriptor:
> 
>       bLength                 9
> 
>       bDescriptorType         4
> 
>       bInterfaceNumber        1
> 
>       bAlternateSetting       1
> 
>       bNumEndpoints           1
> 
>       bInterfaceClass        14 Video
> 
>       bInterfaceSubClass      2 Video Streaming
> 
>       bInterfaceProtocol      0 
> 
>       iInterface              4 Nantian Camera 8513
> 
>       Endpoint Descriptor:
> 
>         bLength                 7
> 
>         bDescriptorType         5
> 
>         bEndpointAddress     0x82  EP 2 IN
> 
>         bmAttributes            5
> 
>           Transfer Type            Isochronous
> 
>           Synch Type               Asynchronous
> 
>           Usage Type               Data
> 
>         wMaxPacketSize     0x1350  3x 848 bytes
> 
>         bInterval               1
> 
>     Interface Descriptor:
> 
>       bLength                 9
> 
>       bDescriptorType         4
> 
>       bInterfaceNumber        1
> 
>       bAlternateSetting       2
> 
>       bNumEndpoints           1
> 
>       bInterfaceClass        14 Video
> 
>       bInterfaceSubClass      2 Video Streaming
> 
>       bInterfaceProtocol      0 
> 
>       iInterface              4 Nantian Camera 8513
> 
>       Endpoint Descriptor:
> 
>         bLength                 7
> 
>         bDescriptorType         5
> 
>         bEndpointAddress     0x82  EP 2 IN
> 
>         bmAttributes            5
> 
>           Transfer Type            Isochronous
> 
>           Synch Type               Asynchronous
> 
>           Usage Type               Data
> 
>         wMaxPacketSize     0x0c00  2x 1024 bytes
> 
>         bInterval               1
> 
>     Interface Descriptor:
> 
>       bLength                 9
> 
>       bDescriptorType         4
> 
>       bInterfaceNumber        1
> 
>       bAlternateSetting       3
> 
>       bNumEndpoints           1
> 
>       bInterfaceClass        14 Video
> 
>       bInterfaceSubClass      2 Video Streaming
> 
>       bInterfaceProtocol      0 
> 
>       iInterface              4 Nantian Camera 8513
> 
>       Endpoint Descriptor:
> 
>         bLength                 7
> 
>         bDescriptorType         5
> 
>         bEndpointAddress     0x82  EP 2 IN
> 
>         bmAttributes            5
> 
>           Transfer Type            Isochronous
> 
>           Synch Type               Asynchronous
> 
>           Usage Type               Data
> 
>         wMaxPacketSize     0x0400  1x 1024 bytes
> 
>         bInterval               1
> 
>     Interface Descriptor:
> 
>       bLength                 9
> 
>       bDescriptorType         4
> 
>       bInterfaceNumber        1
> 
>       bAlternateSetting       4
> 
>       bNumEndpoints           1
> 
>       bInterfaceClass        14 Video
> 
>       bInterfaceSubClass      2 Video Streaming
> 
>       bInterfaceProtocol      0 
> 
>       iInterface              4 Nantian Camera 8513
> 
>       Endpoint Descriptor:
> 
>         bLength                 7
> 
>         bDescriptorType         5
> 
>         bEndpointAddress     0x82  EP 2 IN
> 
>         bmAttributes            5
> 
>           Transfer Type            Isochronous
> 
>           Synch Type               Asynchronous
> 
>           Usage Type               Data
> 
>         wMaxPacketSize     0x0200  1x 512 bytes
> 
>         bInterval               1
> 
> Device Qualifier (for other device speed):
> 
>   bLength                10
> 
>   bDescriptorType         6
> 
>   bcdUSB               2.00
> 
>   bDeviceClass          239 Miscellaneous Device
> 
>   bDeviceSubClass         2 
> 
>   bDeviceProtocol         1 Interface Association
> 
>   bMaxPacketSize0        64
> 
>   bNumConfigurations      1
> 
> 
> 
> 
> 
> At 2024-07-26 18:20:57, "Laurent Pinchart" <laurent.pinchart@ideasonboard.com> wrote:
> >Hi Chen Changcheng,
> >
> >Thank you for the patch.
> >
> >On Tue, Jul 23, 2024 at 04:29:55PM +0800, chenchangcheng wrote:
> >> From: chenchangcheng <chenchangcheng@kylinos.cn>
> >>
> >> When opening the camera, it will send an interrupt transmission
> >> to the host, which is a request initiated by VS to press a button.
> >> But the camera does't have a physical button to send interrupt
> >> transmission.
> >
> >Could you please send the output of `lsusb -v -d 1dfc:8513` (running as
> >root if possible) ?
> >
> >> This button will cause the upper layer to actively turn off the camera.
> >> Ultimately, it resulted in the failure to open the camera.
> >
> >That sounds like a weird behaviour. What upper layers are doing this ?
> >
> >> Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
> >> Change-Id: Ie86c311569e8bdc891dc8af12febf6e8643e082f
> >> ---
> >>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
> >>  drivers/media/usb/uvc/uvc_status.c | 6 +++++-
> >>  drivers/media/usb/uvc/uvcvideo.h   | 1 +
> >>  3 files changed, 15 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> >> index 07128e0..0bdd23b 100644
> >> --- a/drivers/media/usb/uvc/uvc_driver.c
> >> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >> @@ -2891,6 +2891,15 @@ static const struct usb_device_id uvc_ids[] = {
> >>            .bInterfaceClass      = USB_CLASS_VENDOR_SPEC,
> >>            .bInterfaceSubClass   = 1,
> >>            .bInterfaceProtocol   = 0 },
> >> +    /*  AlcorMicroCorp Nantian Camera 8513 */
> >> +    { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >> +                            | USB_DEVICE_ID_MATCH_INT_INFO,
> >> +      .idVendor             = 0x1dfc,
> >> +      .idProduct            = 0x8513,
> >> +      .bInterfaceClass      = USB_CLASS_VIDEO,
> >> +      .bInterfaceSubClass   = 1,
> >> +      .bInterfaceProtocol   = 0,
> >> +      .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_IGNORE_STATUS_EVENT) },
> >>      /* Generic USB Video Class */
> >>      { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
> >>      { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
> >> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> >> index 2bdb0ff..17d68e8 100644
> >> --- a/drivers/media/usb/uvc/uvc_status.c
> >> +++ b/drivers/media/usb/uvc/uvc_status.c
> >> @@ -99,8 +99,12 @@ static void uvc_event_streaming(struct uvc_device *dev,
> >>      }
> >>
> >>      if (status->bEvent == 0) {
> >> -            if (len < 4)
> >> +            if (len < 4 || (dev->quirks & UVC_QUIRK_IGNORE_STATUS_EVENT)) {
> >> +                    uvc_trace(UVC_TRACE_STATUS, "Ignore button (intf %u) %s\n",
> >> +                      status->bOriginator,
> >> +                      status->bValue[0] ? "pressed" : "released");
> >>                      return;
> >> +            }
> >>              uvc_trace(UVC_TRACE_STATUS, "Button (intf %u) %s len %d\n",
> >>                        status->bOriginator,
> >>                        status->bValue[0] ? "pressed" : "released", len);
> >> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> >> index c7c1baa..8ac3c28 100644
> >> --- a/drivers/media/usb/uvc/uvcvideo.h
> >> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >> @@ -198,6 +198,7 @@
> >>  #define UVC_QUIRK_RESTRICT_FRAME_RATE       0x00000200
> >>  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT     0x00000400
> >>  #define UVC_QUIRK_FORCE_Y8          0x00000800
> >> +#define UVC_QUIRK_IGNORE_STATUS_EVENT       0x00001000
> >>
> >>  /* Format flags */
> >>  #define UVC_FMT_FLAG_COMPRESSED             0x00000001
> >
> >--
> >Regards,
> >
> >Laurent Pinchart
> 
> [webmail]

-- 
Regards,

Laurent Pinchart


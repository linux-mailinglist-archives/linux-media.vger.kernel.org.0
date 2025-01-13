Return-Path: <linux-media+bounces-24703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74932A0C27F
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 21:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B42C87A1F5B
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 20:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782FE1CD213;
	Mon, 13 Jan 2025 20:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TKGsXvOG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288CF1C174A
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 20:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736799400; cv=none; b=eCHCEqHY0lENoYeiFtRHMoOdjWdqC/Ptx6NhBaV3WQ3F2AS5IKZ+U3628kFMSv/TqRo9AHWQGgyTpn2p54vloXO3uJPPL782UqSXjUgoRYwi7N6sDCbbPlVIqdF8rHBPIdroc4WgVgYFC1j73RYK5QkWYyt0q2K90T74k61SS8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736799400; c=relaxed/simple;
	bh=wsyn5bsFwaQgiWw4816b3q5vzJpjcYxlfIAkGG6rel4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=miDLMWypJMfWGvufLVhSZnhcsWotjwUXYdR4mMkCU+FBRbnsmbIHZHm/Mbn3/MuB/waovNOE5pnrWR6398gRiFeUq+wpENCiOU/eC6qpcz8xQz3SB1BoP5ffssSn//vlIp9zPqcRIoAbymZp4VmTcZ/GuVcjjrgaG+6MrqxKV4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TKGsXvOG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37F0D129;
	Mon, 13 Jan 2025 21:15:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736799339;
	bh=wsyn5bsFwaQgiWw4816b3q5vzJpjcYxlfIAkGG6rel4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKGsXvOGq7i8LY2Nu5DUyssgvRllBJpqzIIWxlimSSFnwTo4SVkeUH6o2+knjBFyN
	 OPwlcBq5lmmLsMA0BtJGb48oEBShIyuouuLnqSqDDf8seHkIOgK3u6s770R3HZ++Lb
	 OmvSjeacnNTzXex/0dc0tewEteKFSsECSSnFrExs=
Date: Mon, 13 Jan 2025 22:16:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alf Nilsson <alf.nilsson@gmail.com>
Cc: linux-media@vger.kernel.org,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: uvc_driver.cpp as of kernel (debian) 6.1.123 breaks webcams not
 really following the uvcvideo specification.
Message-ID: <20250113201630.GB17696@pendragon.ideasonboard.com>
References: <CAHpKqnnTDNHuT6zWPK6q6Uw4vffJpUOpDjiRrte6AKg5koccyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHpKqnnTDNHuT6zWPK6q6Uw4vffJpUOpDjiRrte6AKg5koccyg@mail.gmail.com>

Hi Alf,

On Mon, Jan 13, 2025 at 10:26:14PM +0700, Alf Nilsson wrote:
> Hello Laurent,
> 
> The commit:
> https://github.com/torvalds/linux/commit/
> 3dd075fe8ebbc6fcbf998f81a75b8c4b159a6195
> 
> Broke usage for the off-brand web camera: 1b3f:2247 as it uses bUnitID 5 2
> times.
> 
> Reverting back to 6.1.119 enables/allows the web camera again.

This has been reported already, see
https://lore.kernel.org/linux-media/20250113185059.GA30724@pendragon.ideasonboard.com/T/#t

> There is something fishy with the webcam, due to the output from lsusb -v
> -d 1b3f:2247
> 
> Shows the following output around a bUnitID:
> VideoControl Interface Descriptor:
>         bLength                11
>         bDescriptorType        36
>         bDescriptorSubtype      5 (PROCESSING_UNIT)
>       Warning: Descriptor too short
>         bUnitID                 5
>         bSourceID               4
>         wMaxMultiplier      16384
>         bControlSize            2
>         bmControls     0x00000007
>           Brightness
>           Contrast
>           Hue
>         iProcessing             0
>         bmVideoStandards     0x1d
>           None
>           PAL - 625/50
>           SECAM - 625/50
>           NTSC - 625/50
> 
> When increasing the output from uvcvideo I got the following info that led me
> to look at the commit.
> 
> dmesg | tail -n 50
> [ 3448.687491] usbcore: deregistering interface driver uvcvideo
> [ 3457.037788] usb 2-1: Found multiple Units with ID 5
> [ 3457.037881] usbcore: registered new interface driver uvcvideo
> [ 4154.000409] usbcore: deregistering interface driver uvcvideo
> [ 4160.118442] usb 2-1: Probing generic UVC device 1
> [ 4160.118609] usb 2-1: Found format MJPG little-endian (0x47504a4d)
> [ 4160.118611] usb 2-1: - 1920x1080 (30.0 fps)
> [ 4160.118612] usb 2-1: - 1440x1080 (30.0 fps)
> [ 4160.118613] usb 2-1: - 1280x720 (30.0 fps)
> [ 4160.118614] usb 2-1: - 800x600 (30.0 fps)
> [ 4160.118615] usb 2-1: - 800x480 (30.0 fps)
> [ 4160.118616] usb 2-1: - 720x480 (30.0 fps)
> [ 4160.118617] usb 2-1: - 640x480 (30.0 fps)
> [ 4160.118618] usb 2-1: - 640x360 (30.0 fps)
> [ 4160.118619] usb 2-1: - 480x270 (30.0 fps)
> [ 4160.118619] usb 2-1: - 320x240 (30.0 fps)
> [ 4160.118620] usb 2-1: - 176x144 (30.0 fps)
> [ 4160.118621] usb 2-1: Found format YUYV little-endian (0x56595559)
> [ 4160.118622] usb 2-1: - 1280x720 (30.0 fps)
> [ 4160.118623] usb 2-1: - 800x600 (30.0 fps)
> [ 4160.118624] usb 2-1: - 800x480 (30.0 fps)
> [ 4160.118624] usb 2-1: - 720x480 (30.0 fps)
> [ 4160.118625] usb 2-1: - 640x480 (30.0 fps)
> [ 4160.118626] usb 2-1: - 640x360 (30.0 fps)
> [ 4160.118627] usb 2-1: - 480x270 (30.0 fps)
> [ 4160.118628] usb 2-1: - 320x240 (30.0 fps)
> [ 4160.118629] usb 2-1: - 176x144 (30.0 fps)
> [ 4160.118631] usb 2-1: Found multiple Units with ID 5

This is the issue. There's a proposed fix in the link I mentioned above
which you could try, but it's still under review and not ready to be
merged yet.

> [ 4160.118633] usb 2-1: Unable to parse UVC descriptors
> [ 4160.118681] usbcore: registered new interface driver uvcvideo
> 
> Booted the same computer in Windows just to see if the camera had broken, but
> no, Windows 10 is more forgiving with the device.
> 
> I have attached the full output of lsusb -v -d 1b3f:2247.
> 
> It would be nice if there was a quirk available for this "almost correct" web
> camera.
> 
> Kind regards,
> Alf Nilsson
> 

> 
> Bus 002 Device 002: ID 1b3f:2247 Generalplus Technology Inc. GENERAL WEBCAM
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x1b3f Generalplus Technology Inc.
>   idProduct          0x2247 
>   bcdDevice            1.00
>   iManufacturer           1 GENERAL
>   iProduct                2 GENERAL WEBCAM
>   iSerial                 0 
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0495
>     bNumInterfaces          4
>     bConfigurationValue     1
>     iConfiguration          0 
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              100mA
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         0
>       bInterfaceCount         2
>       bFunctionClass         14 Video
>       bFunctionSubClass       3 Video Interface Collection
>       bFunctionProtocol       0 
>       iFunction               4 GENERAL WEBCAM
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      1 Video Control
>       bInterfaceProtocol      0 
>       iInterface              4 GENERAL WEBCAM
>       VideoControl Interface Descriptor:
>         bLength                13
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdUVC               1.00
>         wTotalLength       0x006d
>         dwClockFrequency        6.000000MHz
>         bInCollection           1
>         baInterfaceNr( 0)       1
>       VideoControl Interface Descriptor:
>         bLength                18
>         bDescriptorType        36
>         bDescriptorSubtype      2 (INPUT_TERMINAL)
>         bTerminalID             1
>         wTerminalType      0x0201 Camera Sensor
>         bAssocTerminal          0
>         iTerminal               0 
>         wObjectiveFocalLengthMin      0
>         wObjectiveFocalLengthMax      0
>         wOcularFocalLength            0
>         bControlSize                  3
>         bmControls           0x0000000a
>           Auto-Exposure Mode
>           Exposure Time (Absolute)
>       VideoControl Interface Descriptor:
>         bLength                11
>         bDescriptorType        36
>         bDescriptorSubtype      5 (PROCESSING_UNIT)
>       Warning: Descriptor too short
>         bUnitID                 5
>         bSourceID               4
>         wMaxMultiplier      16384
>         bControlSize            2
>         bmControls     0x00000007
>           Brightness
>           Contrast
>           Hue
>         iProcessing             0 
>         bmVideoStandards     0x1d
>           None
>           PAL - 625/50
>           SECAM - 625/50
>           NTSC - 625/50
>       VideoControl Interface Descriptor:
>         bLength                29
>         bDescriptorType        36
>         bDescriptorSubtype      6 (EXTENSION_UNIT)
>         bUnitID                 3
>         guidExtensionCode         {28f03370-6311-4a2e-ba2c-6890eb334016}
>         bNumControls            4
>         bNrInPins               1
>         baSourceID( 0)          2
>         bControlSize            4
>         bmControls( 0)       0x0f
>         bmControls( 1)       0x00
>         bmControls( 2)       0x00
>         bmControls( 3)       0x00
>         iExtension              0 
>       VideoControl Interface Descriptor:
>         bLength                29
>         bDescriptorType        36
>         bDescriptorSubtype      6 (EXTENSION_UNIT)
>         bUnitID                 4
>         guidExtensionCode         {63610682-5070-49ab-b8cc-b3855e8d221d}
>         bNumControls           20
>         bNrInPins               1
>         baSourceID( 0)          3
>         bControlSize            4
>         bmControls( 0)       0xff
>         bmControls( 1)       0xff
>         bmControls( 2)       0x71
>         bmControls( 3)       0x00
>         iExtension              0 
>       VideoControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID             5
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID               4
>         iTerminal               0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval              32
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       VideoStreaming Interface Descriptor:
>         bLength                            15
>         bDescriptorType                    36
>         bDescriptorSubtype                  1 (INPUT_HEADER)
>         bNumFormats                         2
>         wTotalLength                   0x02fa
>         bEndpointAddress                 0x85  EP 5 IN
>         bmInfo                              0
>         bTerminalLink                       5
>         bStillCaptureMethod                 2
>         bTriggerSupport                     1
>         bTriggerUsage                       0
>         bControlSize                        1
>         bmaControls( 0)                     0
>         bmaControls( 1)                     4
>       VideoStreaming Interface Descriptor:
>         bLength                            11
>         bDescriptorType                    36
>         bDescriptorSubtype                  6 (FORMAT_MJPEG)
>         bFormatIndex                        1
>         bNumFrameDescriptors               11
>         bFlags                              1
>           Fixed-size samples: Yes
>         bDefaultFrameIndex                  3
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 1 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                   912384
>         dwMaxBitRate                   912384
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         2
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1440
>         wHeight                          1080
>         dwMinBitRate                   912384
>         dwMaxBitRate                   912384
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         3
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           720
>         dwMinBitRate                   912384
>         dwMaxBitRate                   912384
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         4
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            800
>         wHeight                           600
>         dwMinBitRate                   912384
>         dwMaxBitRate                   912384
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         5
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            800
>         wHeight                           480
>         dwMinBitRate                   912384
>         dwMaxBitRate                   912384
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         6
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            720
>         wHeight                           480
>         dwMinBitRate                   912384
>         dwMaxBitRate                   912384
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         7
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           480
>         dwMinBitRate                   912384
>         dwMaxBitRate                   912384
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         8
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           360
>         dwMinBitRate                   912384
>         dwMaxBitRate                   912384
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         9
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            480
>         wHeight                           270
>         dwMinBitRate                   912384
>         dwMaxBitRate                   912384
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                        10
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            320
>         wHeight                           240
>         dwMinBitRate                   912384
>         dwMaxBitRate                   912384
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                        11
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            176
>         wHeight                           144
>         dwMinBitRate                   912384
>         dwMaxBitRate                   912384
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            54
>         bDescriptorType                    36
>         bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
>         bEndpointAddress                 0x00  EP 0 OUT
>         bNumImageSizePatterns              11
>         wWidth( 0)                       1920
>         wHeight( 0)                      1080
>         wWidth( 1)                       1440
>         wHeight( 1)                      1080
>         wWidth( 2)                       1280
>         wHeight( 2)                       720
>         wWidth( 3)                        800
>         wHeight( 3)                       600
>         wWidth( 4)                        800
>         wHeight( 4)                       480
>         wWidth( 5)                        720
>         wHeight( 5)                       480
>         wWidth( 6)                        640
>         wHeight( 6)                       480
>         wWidth( 7)                        640
>         wHeight( 7)                       360
>         wWidth( 8)                        480
>         wHeight( 8)                       270
>         wWidth( 9)                        320
>         wHeight( 9)                       240
>         wWidth(10)                        176
>         wHeight(10)                       144
>         bNumCompressionPatterns             4
>         bCompression( 0)                    1
>         bCompression( 1)                    5
>         bCompression( 2)                   10
>         bCompression( 3)                   20
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>       VideoStreaming Interface Descriptor:
>         bLength                            27
>         bDescriptorType                    36
>         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
>         bFormatIndex                        2
>         bNumFrameDescriptors                9
>         guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
>         bBitsPerPixel                      16
>         bDefaultFrameIndex                  1
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 2 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           720
>         dwMinBitRate                 73728000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize     1843200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         2
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            800
>         wHeight                           600
>         dwMinBitRate                 73728000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize      960000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         3
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            800
>         wHeight                           480
>         dwMinBitRate                 73728000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize      768000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         4
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            720
>         wHeight                           480
>         dwMinBitRate                 73728000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize      691200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         5
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           480
>         dwMinBitRate                 73728000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         6
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           360
>         dwMinBitRate                 73728000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize      460800
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         7
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            480
>         wHeight                           270
>         dwMinBitRate                 73728000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize      259200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         8
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            320
>         wHeight                           240
>         dwMinBitRate                 73728000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize      153600
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         9
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            176
>         wHeight                           144
>         dwMinBitRate                 73728000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize       50688
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            43
>         bDescriptorType                    36
>         bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
>         bEndpointAddress                 0x00  EP 0 OUT
>         bNumImageSizePatterns               9
>         wWidth( 0)                       1280
>         wHeight( 0)                       720
>         wWidth( 1)                        800
>         wHeight( 1)                       600
>         wWidth( 2)                        800
>         wHeight( 2)                       480
>         wWidth( 3)                        720
>         wHeight( 3)                       480
>         wWidth( 4)                        640
>         wHeight( 4)                       480
>         wWidth( 5)                        640
>         wHeight( 5)                       360
>         wWidth( 6)                        480
>         wHeight( 6)                       270
>         wWidth( 7)                        320
>         wHeight( 7)                       240
>         wWidth( 8)                        176
>         wHeight( 8)                       144
>         bNumCompressionPatterns             1
>         bCompression( 0)                    1
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       1
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x85  EP 5 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0100  1x 256 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       2
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x85  EP 5 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       3
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x85  EP 5 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       4
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x85  EP 5 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0b00  2x 768 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       5
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x85  EP 5 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0c00  2x 1024 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       6
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x85  EP 5 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x1354  3x 852 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       7
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x85  EP 5 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x1400  3x 1024 bytes
>         bInterval               1
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         2
>       bInterfaceCount         2
>       bFunctionClass          1 Audio
>       bFunctionSubClass       0 
>       bFunctionProtocol       0 
>       iFunction               4 GENERAL WEBCAM
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      1 Control Device
>       bInterfaceProtocol      0 
>       iInterface              4 GENERAL WEBCAM
>       AudioControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdADC               1.00
>         wTotalLength       0x0026
>         bInCollection           1
>         baInterfaceNr(0)        3
>       AudioControl Interface Descriptor:
>         bLength                12
>         bDescriptorType        36
>         bDescriptorSubtype      2 (INPUT_TERMINAL)
>         bTerminalID             3
>         wTerminalType      0x0201 Microphone
>         bAssocTerminal          0
>         bNrChannels             1
>         wChannelConfig     0x0000
>         iChannelNames           0 
>         iTerminal               0 
>       AudioControl Interface Descriptor:
>         bLength                 8
>         bDescriptorType        36
>         bDescriptorSubtype      6 (FEATURE_UNIT)
>         bUnitID                 5
>         bSourceID               3
>         bControlSize            1
>         bmaControls(0)       0x03
>           Mute Control
>           Volume Control
>         iFeature                0 
>       AudioControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID             4
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID               5
>         iTerminal               0 
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       1
>       bNumEndpoints           0
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       2
>       bNumEndpoints           0
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       3
>       bNumEndpoints           0
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       4
>       bNumEndpoints           0
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       5
>       bNumEndpoints           1
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       AudioStreaming Interface Descriptor:
>         bLength                 7
>         bDescriptorType        36
>         bDescriptorSubtype      1 (AS_GENERAL)
>         bTerminalLink           4
>         bDelay                  1 frames
>         wFormatTag         0x0001 PCM
>       AudioStreaming Interface Descriptor:
>         bLength                11
>         bDescriptorType        36
>         bDescriptorSubtype      2 (FORMAT_TYPE)
>         bFormatType             1 (FORMAT_TYPE_I)
>         bNrChannels             1
>         bSubframeSize           2
>         bBitResolution         16
>         bSamFreqType            1 Discrete
>         tSamFreq[ 0]        16000
>       Endpoint Descriptor:
>         bLength                 9
>         bDescriptorType         5
>         bEndpointAddress     0x87  EP 7 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0100  1x 256 bytes
>         bInterval               4
>         bRefresh                0
>         bSynchAddress           0
>         AudioStreaming Endpoint Descriptor:
>           bLength                 7
>           bDescriptorType        37
>           bDescriptorSubtype      1 (EP_GENERAL)
>           bmAttributes         0x00
>           bLockDelayUnits         0 Undefined
>           wLockDelay         0x0000
> Device Qualifier (for other device speed):
>   bLength                10
>   bDescriptorType         6
>   bcdUSB               2.00
>   bDeviceClass            0 
>   bDeviceSubClass         0 
>   bDeviceProtocol         0 
>   bMaxPacketSize0        64
>   bNumConfigurations      1
> Device Status:     0x0001
>   Self Powered


-- 
Regards,

Laurent Pinchart


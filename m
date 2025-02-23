Return-Path: <linux-media+bounces-26668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B255FA40F60
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 16:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE5D41897842
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 15:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FB72080E1;
	Sun, 23 Feb 2025 15:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LddvGm25"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D612054E1;
	Sun, 23 Feb 2025 15:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740323505; cv=none; b=M/8Wv5A91wqAi1RMdf+QTQj1vxFrf865uvDElFRLfGcWXjGT8R75A+lzDkRMAqSV14YvswXuAXLlqL31sTONQYT06FUvqjAm/EY5UxLGwAPLgVBuhhpx/vnMfTMeA0dr103VCyQ7k2JpAdZ5ItAlRjw7RLilFQkYlFiJeSZhtnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740323505; c=relaxed/simple;
	bh=sX6i9Yu0FrD3xZDKchhqOiUwn+Cwn6RnPd6Wxqm+wA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1ims1SM0IMwKw5uhi5L9a5rL17PHk4/ByNePH+HEIQn0L9wbr37LY4bgyduQwUpsa1HY+yGCzO8KaNyKzkyPUZC5pqzv52fJZKubmovM5wN/ZJFEbBv5J/exN8cscOQ3pwQsV89+qlHckAa9Bgh1iZPB3cwe4AyRopN7KLB5/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LddvGm25; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 739544DC;
	Sun, 23 Feb 2025 16:10:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740323414;
	bh=sX6i9Yu0FrD3xZDKchhqOiUwn+Cwn6RnPd6Wxqm+wA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LddvGm25h5cL1pDQ70PSN2Cy6NVcMt8dWz0DR1SHwhOMR/m/tYa9LMr583pLzfmDg
	 APCKfpFeVF64DkvsQamzb/fQpGpwUj/RDp7icV1IofXLpwuB0Xt50+SBJY/ilwvhn5
	 c4wJaBj/adxG//z8iSyd8ef6/8fU2yvAJ5qL2hfA=
Date: Sun, 23 Feb 2025 17:11:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add quirk for Actions UVC05
Message-ID: <20250223151123.GA21389@pendragon.ideasonboard.com>
References: <20241210-uvc-hdmi-suspend-v1-1-01f5dec023ea@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210-uvc-hdmi-suspend-v1-1-01f5dec023ea@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Tue, Dec 10, 2024 at 10:48:14AM +0000, Ricardo Ribalda wrote:
> Actions UVC05 is a HDMI to USB dongle that implements the UVC protocol.
> 
> When the device suspends, its firmware seems to enter a weird mode when it
> does not produce more frames.
> 
> Add the device to the quirk list to disable autosuspend.
> 
> Bus 001 Device 007: ID 1de1:f105 Actions Microelectronics Co. Display
>  capture-UVC05
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 [unknown]
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x1de1 Actions Microelectronics Co.
>   idProduct          0xf105 Display capture-UVC05
>   bcdDevice            4.09
>   iManufacturer           1 Actions Micro
>   iProduct                2 Display capture-UVC05
>   iSerial                 3 -1005308387
>   bNumConfigurations      1
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Bus 001 Device 007: ID 1de1:f105 Actions Microelectronics Co. Display capture-UVC05
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 [unknown]
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x1de1 Actions Microelectronics Co.
>   idProduct          0xf105 Display capture-UVC05
>   bcdDevice            4.09
>   iManufacturer           1 Actions Micro
>   iProduct                2 Display capture-UVC05
>   iSerial                 3 -1005308387
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x028a
>     bNumInterfaces          4
>     bConfigurationValue     1
>     iConfiguration          4 Video
>     bmAttributes         0xc0
>       Self Powered
>     MaxPower                2mA
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         0
>       bInterfaceCount         2
>       bFunctionClass         14 Video
>       bFunctionSubClass       3 Video Interface Collection
>       bFunctionProtocol       0 
>       iFunction               5 Display capture-UVC05
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      1 Video Control
>       bInterfaceProtocol      0 
>       iInterface              5 Display capture-UVC05
>       VideoControl Interface Descriptor:
>         bLength                13
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdUVC               1.00
>         wTotalLength       0x0033
>         dwClockFrequency       48.000000MHz
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
>         bmControls           0x00000002
>           Auto-Exposure Mode
>       VideoControl Interface Descriptor:
>         bLength                11
>         bDescriptorType        36
>         bDescriptorSubtype      5 (PROCESSING_UNIT)
>       Warning: Descriptor too short
>         bUnitID                 2
>         bSourceID               1
>         wMaxMultiplier      16384
>         bControlSize            2
>         bmControls     0x00000000
>         iProcessing             0 
>         bmVideoStandards     0x09
>           None
>           SECAM - 625/50
>       VideoControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID             3
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID               2
>         iTerminal               0 
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0 
>       iInterface              6 Video Streaming
>       VideoStreaming Interface Descriptor:
>         bLength                            14
>         bDescriptorType                    36
>         bDescriptorSubtype                  1 (INPUT_HEADER)
>         bNumFormats                         1
>         wTotalLength                   0x01c1
>         bEndpointAddress                 0x81  EP 1 IN
>         bmInfo                              0
>         bTerminalLink                       3
>         bStillCaptureMethod                 0
>         bTriggerSupport                     0
>         bTriggerUsage                       0
>         bControlSize                        1
>         bmaControls( 0)                     0
>       VideoStreaming Interface Descriptor:
>         bLength                            11
>         bDescriptorType                    36
>         bDescriptorSubtype                  6 (FORMAT_MJPEG)
>         bFormatIndex                        1
>         bNumFrameDescriptors               11
>         bFlags                              0
>           Fixed-size samples: No
>         bDefaultFrameIndex                  2
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 1 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>       VideoStreaming Interface Descriptor:
>         bLength                            38
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         1
>         bmCapabilities                   0x02
>           Still image unsupported
>           Fixed frame-rate
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                 31104000
>         dwMaxBitRate                1990656000
>         dwMaxVideoFrameBufferSize     4147200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  3
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            38
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         2
>         bmCapabilities                   0x02
>           Still image unsupported
>           Fixed frame-rate
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                 31104000
>         dwMaxBitRate                1990656000
>         dwMaxVideoFrameBufferSize     4147200
>         dwDefaultFrameInterval         166666
>         bFrameIntervalType                  3
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            38
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         4
>         bmCapabilities                   0x02
>           Still image unsupported
>           Fixed frame-rate
>         wWidth                           1360
>         wHeight                           768
>         dwMinBitRate                 15667200
>         dwMaxBitRate                 62668800
>         dwMaxVideoFrameBufferSize     4147200
>         dwDefaultFrameInterval         166666
>         bFrameIntervalType                  3
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            38
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         5
>         bmCapabilities                   0x02
>           Still image unsupported
>           Fixed frame-rate
>         wWidth                           1280
>         wHeight                          1024
>         dwMinBitRate                 19660800
>         dwMaxBitRate                 78643200
>         dwMaxVideoFrameBufferSize     4147200
>         dwDefaultFrameInterval         166666
>         bFrameIntervalType                  3
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            38
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         6
>         bmCapabilities                   0x02
>           Still image unsupported
>           Fixed frame-rate
>         wWidth                           1280
>         wHeight                           960
>         dwMinBitRate                 18432000
>         dwMaxBitRate                 73728000
>         dwMaxVideoFrameBufferSize     4147200
>         dwDefaultFrameInterval         166666
>         bFrameIntervalType                  3
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            38
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         7
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           720
>         dwMinBitRate                 13824000
>         dwMaxBitRate                 55296000
>         dwMaxVideoFrameBufferSize     1843200
>         dwDefaultFrameInterval         166666
>         bFrameIntervalType                  3
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            38
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         8
>         bmCapabilities                   0x02
>           Still image unsupported
>           Fixed frame-rate
>         wWidth                           1024
>         wHeight                           768
>         dwMinBitRate                 11796480
>         dwMaxBitRate                 47185920
>         dwMaxVideoFrameBufferSize     4147200
>         dwDefaultFrameInterval         166666
>         bFrameIntervalType                  3
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            38
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         9
>         bmCapabilities                   0x02
>           Still image unsupported
>           Fixed frame-rate
>         wWidth                            800
>         wHeight                           600
>         dwMinBitRate                  7200000
>         dwMaxBitRate                 28800000
>         dwMaxVideoFrameBufferSize     4147200
>         dwDefaultFrameInterval         166666
>         bFrameIntervalType                  3
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            38
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                        10
>         bmCapabilities                   0x02
>           Still image unsupported
>           Fixed frame-rate
>         wWidth                            720
>         wHeight                           576
>         dwMinBitRate                  6220800
>         dwMaxBitRate                 24883200
>         dwMaxVideoFrameBufferSize     4147200
>         dwDefaultFrameInterval         166666
>         bFrameIntervalType                  3
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            38
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                        11
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            720
>         wHeight                           480
>         dwMinBitRate                  5184000
>         dwMaxBitRate                 20736000
>         dwMaxVideoFrameBufferSize     1843200
>         dwDefaultFrameInterval         166666
>         bFrameIntervalType                  3
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            38
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                        12
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           480
>         dwMinBitRate                  4608000
>         dwMaxBitRate                 18432000
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         166666
>         bFrameIntervalType                  3
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         2
>       bInterfaceCount         2
>       bFunctionClass          1 Audio
>       bFunctionSubClass       2 Streaming
>       bFunctionProtocol       0 
>       iFunction               0 
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      1 Control Device
>       bInterfaceProtocol      0 
>       iInterface              0 
>       AudioControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdADC               1.00
>         wTotalLength       0x0027
>         bInCollection           1
>         baInterfaceNr(0)        3
>       AudioControl Interface Descriptor:
>         bLength                12
>         bDescriptorType        36
>         bDescriptorSubtype      2 (INPUT_TERMINAL)
>         bTerminalID             1
>         wTerminalType      0x0201 Microphone
>         bAssocTerminal          0
>         bNrChannels             1
>         wChannelConfig     0x0000
>         iChannelNames           0 
>         iTerminal               0 
>       AudioControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID             2
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID               3
>         iTerminal               0 
>       AudioControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      6 (FEATURE_UNIT)
>         bUnitID                 3
>         bSourceID               1
>         bControlSize            1
>         bmaControls(0)       0x03
>           Mute Control
>           Volume Control
>         bmaControls(1)       0x00
>         iFeature                0 
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
>       bNumEndpoints           1
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       AudioStreaming Interface Descriptor:
>         bLength                 7
>         bDescriptorType        36
>         bDescriptorSubtype      1 (AS_GENERAL)
>         bTerminalLink           2
>         bDelay                  1 frames
>         wFormatTag         0x0001 PCM
>       AudioStreaming Interface Descriptor:
>         bLength                11
>         bDescriptorType        36
>         bDescriptorSubtype      2 (FORMAT_TYPE)
>         bFormatType             1 (FORMAT_TYPE_I)
>         bNrChannels             2
>         bSubframeSize           2
>         bBitResolution         16
>         bSamFreqType            1 Discrete
>         tSamFreq[ 0]        48000
>       Endpoint Descriptor:
>         bLength                 9
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            9
>           Transfer Type            Isochronous
>           Synch Type               Adaptive
>           Usage Type               Data
>         wMaxPacketSize     0x00c0  1x 192 bytes
>         bInterval               4
>         bRefresh                0
>         bSynchAddress           0
>         AudioStreaming Endpoint Descriptor:
>           bLength                 7
>           bDescriptorType        37
>           bDescriptorSubtype      1 (EP_GENERAL)
>           bmAttributes         0x01
>             Sampling Frequency
>           bLockDelayUnits         0 Undefined
>           wLockDelay         0x0000
> Device Qualifier (for other device speed):
>   bLength                10
>   bDescriptorType         6
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 [unknown]
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   bNumConfigurations      1
> Device Status:     0x0001
>   Self Powered
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index b3c8411dc05c..3205f53acea2 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3014,6 +3014,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_PROBE_MINMAX
>  					| UVC_QUIRK_IGNORE_SELECTOR_UNIT) },
> +	/* Actions Microelectronics Co. Display capture-UVC05 */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x1de1,
> +	  .idProduct		= 0xf105,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
>  	/* NXP Semiconductors IR VIDEO */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> 
> ---
> base-commit: 6c10d1adae82e1c8da16e7ebd2320e69f20b9d6f
> change-id: 20241210-uvc-hdmi-suspend-bba1058c605f

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-29828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C7A83633
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 04:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C97F37A6126
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 02:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5EE1C1F2F;
	Thu, 10 Apr 2025 02:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U3BCr6gm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FC8136327;
	Thu, 10 Apr 2025 02:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744250865; cv=none; b=Qn9cGyBjMrF6D/ktZn+Nb27roehW99OvRoU0cY6kHiyRK8JSi9mq4tFShpntH6B25MjHqdPBPSRztrGFkjpce3Iwn2Yu/z2t+8LjSa0xW/lJ2XioSk6+te6t2XBIGgyI8+SXVrd8Eu0kF/ADbjfP54yzRlI3uxl96irmA6+VZcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744250865; c=relaxed/simple;
	bh=aySisF51hBDuyc7waHnLSlQ75XG4leriNr1KOg9gJkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgYd10mek66DsHx4/e3/xtHfkSyeyETlvSZyqdAp1JCaiwtpGckgqlGQHyKB/s89E0cZxfpfFEogPjelwivLPXaMF3Vo/S2NR5D5C/SWHAwWdm1Mxe2iwORExjmQ1u4eTCsiukQ/4SUltVXkX99NUQtTS95eZdceBzztgiOcNik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U3BCr6gm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85D25496;
	Thu, 10 Apr 2025 04:05:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744250742;
	bh=aySisF51hBDuyc7waHnLSlQ75XG4leriNr1KOg9gJkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3BCr6gmx+bKyhefV9DsNSA/fWwn5CQapH9hp0E4VKPN/N4CZqfA9LvfV+XgSWbzQ
	 ocx4Hhj+HvEnGGcZF2970iyFxMhdePQEuOoxsQHTuu2ooD/AG6jmm+ohRR87CXZ2kb
	 5OXzEPl9MilV1yd32doPrsmH2Ao6+BwQpf8cEa0U=
Date: Thu, 10 Apr 2025 05:07:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: chenchangcheng <ccc194101@163.com>
Cc: hdegoede@redhat.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: Re: [PATCH v6] media: uvcvideo: Fix bandwidth issue for Alcor camera
Message-ID: <20250410020715.GA15367@pendragon.ideasonboard.com>
References: <20250324022120.216923-1-ccc194101@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250324022120.216923-1-ccc194101@163.com>

On Mon, Mar 24, 2025 at 10:21:20AM +0800, chenchangcheng wrote:
> From: chenchangcheng <chenchangcheng@kylinos.cn>
> 
> Some broken device return wrong dwMaxPayloadTransferSize fields,
> as follows:
> [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
> [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.
> 
> The maximum packet size of the device is 3 * 1024, according to the
> logs above, the device needs to apply for a bandwidth of 0x2a0000.
> 
> Bus 001 Device 008: ID 1b17:6684 Alcor Corp. Slave camera
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x1b17
>   idProduct          0x6684
>   bcdDevice            1.05
>   iManufacturer           1 Alcor Corp.
>   iProduct                2 Slave camera
>   iSerial                 0
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x02ad
>     bNumInterfaces          2
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              200mA
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         0
>       bInterfaceCount         2
>       bFunctionClass         14 Video
>       bFunctionSubClass       3 Video Interface Collection
>       bFunctionProtocol       0
>       iFunction               4 Slave camera
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      1 Video Control
>       bInterfaceProtocol      0
>       iInterface              4 Slave camera
>       VideoControl Interface Descriptor:
> 
>       ....
> 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0010  1x 16 bytes
>         bInterval               7
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
>         bLength                            14
>         bDescriptorType                    36
>         bDescriptorSubtype                  1 (INPUT_HEADER)
>         bNumFormats                         1
>         wTotalLength                   0x01ef
>         bEndPointAddress                  130
>         bmInfo                              0
>         bTerminalLink                       3
>         bStillCaptureMethod                 2
>         bTriggerSupport                     1
>         bTriggerUsage                       0
>         bControlSize                        1
>         bmaControls( 0)                     0
>       VideoStreaming Interface Descriptor:
>         bLength                            11
>         bDescriptorType                    36
>         bDescriptorSubtype                  6 (FORMAT_MJPEG)
>         bFormatIndex                        1
>         bNumFrameDescriptors                9
>         bFlags                              1
>           Fixed-size samples: Yes
>         bDefaultFrameIndex                  1
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 1 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                248832000
>         dwMaxBitRate                1492992000
>         dwMaxVideoFrameBufferSize     6220800
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
> 
> 	......
> 
>       VideoStreaming Interface Descriptor:
>         bLength                            42
>         bDescriptorType                    36
>         bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
>         bEndpointAddress                    0
>         bNumImageSizePatterns               9
>         wWidth( 0)                       1920
>         wHeight( 0)                      1080
>         wWidth( 1)                       2048
>         wHeight( 1)                      1536
>         wWidth( 2)                       1280
>         wHeight( 2)                       720
>         wWidth( 3)                       2592
>         wHeight( 3)                      1944
>         wWidth( 4)                       1280
>         wHeight( 4)                      1024
>         wWidth( 5)                       1280
>         wHeight( 5)                       960
>         wWidth( 6)                       1600
>         wHeight( 6)                      1200
>         wWidth( 7)                        800
>         wHeight( 7)                       600
>         wWidth( 8)                        640
>         wHeight( 8)                       480
>         bNumCompressionPatterns             0
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
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x1400  3x 1024 bytes
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
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0b84  2x 900 bytes
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
>         bEndpointAddress     0x82  EP 2 IN
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
>       bAlternateSetting       4
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0c00  2x 1024 bytes
>         bInterval               1
> Device Qualifier (for other device speed):
>   bLength                10
>   bDescriptorType         6
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   bNumConfigurations      1
> Device Status:     0x0000
>   (Bus Powered)
> 
> Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
> ---
>  drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
>  drivers/media/usb/uvc/uvc_video.c  | 10 ++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index deadbcea5e22..9b1dedf9773b 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3023,6 +3023,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_STATUS_INTERVAL) },
> +	/* Alcor Corp. Slave camera */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x1b17,
> +	  .idProduct		= 0x6684,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_OVERFLOW_BANDWIDTH) },
>  	/* MSI StarCam 370i */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..56f23c363870 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -262,6 +262,16 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>  
>  		ctrl->dwMaxPayloadTransferSize = bandwidth;
>  	}
> +
> +	if (stream->intf->num_altsetting > 1 &&
> +	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize &&
> +	    stream->dev->quirks & UVC_QUIRK_OVERFLOW_BANDWIDTH) {
> +		dev_warn(&stream->intf->dev,
> +			 "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
> +			 ctrl->dwMaxPayloadTransferSize,
> +			 stream->maxpsize);
> +		ctrl->dwMaxPayloadTransferSize = stream->maxpsize;

If the requested bandwidth exceed the maximum the device can use, it's
clearly a firmware bug. Why do we need a quirk for this, can't we use
the maximum usable bandwidth in that case, regardless of the particular
device ?

> +	}
>  }
>  
>  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 5e388f05f3fc..8b43d725c259 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -77,6 +77,7 @@
>  #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
>  #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
>  #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
> +#define UVC_QUIRK_OVERFLOW_BANDWIDTH	0x00040000
>  
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001
> 
> base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1

-- 
Regards,

Laurent Pinchart


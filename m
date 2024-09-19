Return-Path: <linux-media+bounces-18404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1687B97CF3C
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 00:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93B811F21EA8
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2024 22:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B0F181B8F;
	Thu, 19 Sep 2024 22:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qX6Tbn/O"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AEE1CD15
	for <linux-media@vger.kernel.org>; Thu, 19 Sep 2024 22:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726785145; cv=none; b=S3Pi1lrj/ZM7bpJRsLcc2NSL4eGU2KQ7xP6/CDQ4EAVDjoTY1Yg581DuRQ6Q1i5LEV3/6jcHJ8yX1e+Im7K1ZUUWQw8sW8crovwkshL0AS7IS4ddA4YAwa3Jk2RzeB1RLgEOX4vVCD8CRZ5sMV0BhlfgTMmrDjTCnmT3XHouUFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726785145; c=relaxed/simple;
	bh=ZaXHGxLyEvoMV+omSmzL/sk7Gb7XSSd+9b+UgXHM2b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEHIxOEeCiP7NRLB/skxWKEI8S7Yg9xbWpsF7xViTqtOyRSqMAaD7pp5rG9VkZa25t4kyI5v/sRTx5qbKGwI2InWsKWI4Ame2fqw7S7kypwo2e7gQ9gBSkkl9mOzlLP/FkzJOLqElC232YtnVD0swum9aNCwNZtY8dSgTD6gUEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qX6Tbn/O; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213142096159.public.telering.at [213.142.96.159])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C1A0226;
	Fri, 20 Sep 2024 00:30:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726785058;
	bh=ZaXHGxLyEvoMV+omSmzL/sk7Gb7XSSd+9b+UgXHM2b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qX6Tbn/O4/DR9ctbPb2c8sQK6ihG/recGjJutW7g6lh2ggMrkZG1pPNvRQDSjXrtY
	 fqKfu92aF6GiDN/MRiog7jJshjzNVU7sPYAafSXcwJxwGMf2AvB80jSJ2FatZOz1sh
	 zLJF5+gL+mzQMS8sUUc///L2sBoYDCqw8o+rHbGQ=
Date: Fri, 20 Sep 2024 01:31:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Given <dg@cowlark.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: add a quirk for the NXP Semiconductors
 chipset, as used by the Kaiweets KTI-W02 infrared camera.
Message-ID: <20240919223148.GE29185@pendragon.ideasonboard.com>
References: <20240918180540.10830-1-dg@cowlark.com>
 <20240918180540.10830-2-dg@cowlark.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240918180540.10830-2-dg@cowlark.com>

Hi David,

Thank you for the patch.

On Wed, Sep 18, 2024 at 08:05:40PM +0200, David Given wrote:
> Adds a quirk to make the NXP Semiconductors 1fc9:009b chipset work.
> 
> lsusb for the device reports:
> 
> Bus 003 Device 011: ID 1fc9:009b NXP Semiconductors IR VIDEO
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 [unknown]
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x1fc9 NXP Semiconductors
>   idProduct          0x009b IR VIDEO
>   bcdDevice            1.01
>   iManufacturer           1 Guide sensmart
>   iProduct                2 IR VIDEO
>   iSerial                 0 
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x00c2
>     bNumInterfaces          2
>     bConfigurationValue     1
>     iConfiguration          0 
>     bmAttributes         0xc0
>       Self Powered
>     MaxPower              100mA
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         0
>       bInterfaceCount         2
>       bFunctionClass         14 Video
>       bFunctionSubClass       3 Video Interface Collection
>       bFunctionProtocol       0 
>       iFunction               3 IR Camera
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      1 Video Control
>       bInterfaceProtocol      0 
>       iInterface              0 
>       VideoControl Interface Descriptor:
>         bLength                13
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdUVC               1.00
>         wTotalLength       0x0033
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
>         bmControls           0x00000000
>       VideoControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID             2
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID               1
>         iTerminal               0 
>       VideoControl Interface Descriptor:
>         bLength                11
>         bDescriptorType        36
>         bDescriptorSubtype      5 (PROCESSING_UNIT)
>       Warning: Descriptor too short
>         bUnitID                 3
>         bSourceID               1
>         wMaxMultiplier          0
>         bControlSize            2
>         bmControls     0x00000000
>         iProcessing             0 
>         bmVideoStandards     0x62
>           NTSC - 525/60
>           PAL - 525/60
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0008  1x 8 bytes
>         bInterval               1
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
>         wTotalLength                   0x0055
>         bEndpointAddress                 0x82  EP 2 IN
>         bmInfo                              0
>         bTerminalLink                       2
>         bStillCaptureMethod                 2
>         bTriggerSupport                     0
>         bTriggerUsage                       0
>         bControlSize                        1
>         bmaControls( 0)                     0
>       VideoStreaming Interface Descriptor:
>         bLength                            27
>         bDescriptorType                    36
>         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
>         bFormatIndex                        1
>         bNumFrameDescriptors                1
>         guidFormat                            {e436eb7b-524f-11ce-9f53-0020af0ba770}
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
>         bLength                            34
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            240
>         wHeight                           322
>         dwMinBitRate                 12364800
>         dwMaxBitRate                 30912000
>         dwMaxVideoFrameBufferSize      154560
>         dwDefaultFrameInterval         400000
>         bFrameIntervalType                  2
>         dwFrameInterval( 0)            400000
>         dwFrameInterval( 1)           1000000
>       VideoStreaming Interface Descriptor:
>         bLength                            10
>         bDescriptorType                    36
>         bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
>         bEndpointAddress                 0x00  EP 0 OUT
>         bNumImageSizePatterns               1
>         wWidth( 0)                        240
>         wHeight( 0)                       322
>         bNumCompressionPatterns             0
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
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               1
> Device Status:     0x0001
>   Self Powered
> 
> Signed-off-by: David Given <dg@cowlark.com>

As with patch 1/2, the subject line should start with "media:
uvcvideo:". I'll also handle this locally, no need to submit a new
version.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f0febdc08..37f5d8346 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2428,6 +2428,8 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
>   * The Logitech cameras listed below have their interface class set to
>   * VENDOR_SPEC because they don't announce themselves as UVC devices, even
>   * though they are compliant.
> + *
> + * Sort these by vendor/product ID.
>   */
>  static const struct usb_device_id uvc_ids[] = {
>  	/* Quanta ACER HD User Facing */
> @@ -2964,6 +2966,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_PROBE_MINMAX
>  					| UVC_QUIRK_IGNORE_SELECTOR_UNIT) },
> +	/* NXP Semiconductors IR VIDEO */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x1fc9,
> +	  .idProduct		= 0x009b,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
>  	/* Oculus VR Positional Tracker DK2 */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,

-- 
Regards,

Laurent Pinchart


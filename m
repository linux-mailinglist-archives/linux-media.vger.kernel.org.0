Return-Path: <linux-media+bounces-27337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B30A4C3CF
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C98D57A69AC
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 14:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052181F3BA3;
	Mon,  3 Mar 2025 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eLHJ21Ug"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CDF12FF69
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 14:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741013278; cv=none; b=A9b3WTwtbBss7TaYriaA+taBgo2tCUD1sW3R8jK0/7VBt7uJXXrN6UG5JYQHCxoMYVc4WrzwZqhkscKacjVKfQr9+C8mqu5d0FAOC5DE9ZJ82aWb9MWXvI9/CDk/5ndYB5wQTkj0oTS+4bRi7tBudMFt1ajWFYzPhwRJ3Q7k+wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741013278; c=relaxed/simple;
	bh=FVRD4iX3p9k8gSH9i17b/bed7/npTuICPWhmTSWXw5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MSvVi+HFd9YGfwLjFMN/TFqjF6mkXBSEqVHb+oMSIK32060T+f93MrD9WN+fLVMbC0L0LCVREw0wXTZkrdTZWuV19Qt406rnIF6PJgFdeEi8tjTKa1+hHamTvjVlDLZQenWhNX3hbX9urimedAM4rJWNrfvkij3GHorw/pZyGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eLHJ21Ug; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741013275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JeW7ILK4BHwph4vdjZBYJRZp3BpM7DGYuP2lQy/HDSs=;
	b=eLHJ21UgfiLDllMgDCK0TqTLJPf94Y3ue6sT/j4dT3Zc7Gd0eaJfDLdp7hyYfFL/hornbn
	TCNKRJZmbw50MpHjFY7vhu3FlPSRKuKpKj7SpUYzQBC5z3UO4PhMZH75055Fbb4pvAvfSP
	6/+B9ULgV58IizHdR6MSQI7DwZaLkcQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-7aVS8W1rNyClLISTWBEK3g-1; Mon, 03 Mar 2025 09:47:54 -0500
X-MC-Unique: 7aVS8W1rNyClLISTWBEK3g-1
X-Mimecast-MFC-AGG-ID: 7aVS8W1rNyClLISTWBEK3g_1741013273
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac1e1b59f51so77352066b.2
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 06:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741013273; x=1741618073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JeW7ILK4BHwph4vdjZBYJRZp3BpM7DGYuP2lQy/HDSs=;
        b=jVDRQG/JMgP1j8HFoEcRkCcl2ooXipa4g9CLyi33QqQpximOIUQDpSRWdboj2PtWQN
         FW+KfS17JkfcDMW/UN6hT3MY91TrqK6YNtUaSPyEXR6F8cjO8ULGw0QUJ1QQRjjrR4Ma
         NIfCCVANSMlpIwsFb8HXJhbxD5edgUB7akq+d4Gb5sflAyi96R2OdXvXuXv1ebhUEnWe
         pWdXjZ12EM4ewgp0WCgmfgM9h6Vtm5Uc7dFKzSNxs8IAueqBws4WNqBvHBBolnyElqhr
         kWIHMs9geN5GWjEkZR3TXvPXURfLRMbQ8Or3y17j04PYDIDccuayaagE8nGo5gjd2Yfr
         kFTA==
X-Gm-Message-State: AOJu0YyKC8CZjVOVlXjSdGEPwYKUqPiIFnf3telqUmITBQ3iw8+iGxY5
	f0jGUCGBcjoDm+WXYmc80nDae2D/euVqgjS168AgHp5LKtoqTItCGhoglOBJzRYHbclQAopzHrR
	HveDu0LWa4KWJgNGjmdbrion1pPs8LnwfWz0quuZNYs9iD1TKcUONfD00Rz4F
X-Gm-Gg: ASbGncskkhwLJCHjfmpZ1MbHBDRFIGLUlzcYTInOD8Ym5ePrWw0GvZA81zVRKTU9xKx
	5qkIRoQoXLRAF16tCpLI6wfHGS2JGQm7E5a0oJbcdYaJXeDj6Ez/tfh62WNM3Djn6V2AcH3CzO8
	Ewz6hMvIv205n0Cal50/rzjwNGBjg+W6PGwtY2cNlkEUVIb6sPtJmX7Yb+ynPVWmMrAIRFbvdV8
	hHol+x01jlV86T1GQ0FL8kBlPrL0SiZ0ppmPnKfXdj4N9ARrHRySh4HzoeXuzOcVvfD8Ec+qvo8
	8XhrXylUIQfoNZ8K6qs=
X-Received: by 2002:a17:907:d90:b0:ac1:e332:b1ef with SMTP id a640c23a62f3a-ac1e332b45bmr212465466b.48.1741013272750;
        Mon, 03 Mar 2025 06:47:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxkGtJFlxPNSNyID6fMe+Mm/hHvV0XaEzpcB6ATKLdIpZJ9r5qZolbpF2E4TnEHvKU9ctYww==
X-Received: by 2002:a17:907:d90:b0:ac1:e332:b1ef with SMTP id a640c23a62f3a-ac1e332b45bmr212462066b.48.1741013272258;
        Mon, 03 Mar 2025 06:47:52 -0800 (PST)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6ee491sm822229966b.103.2025.03.03.06.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 06:47:51 -0800 (PST)
Message-ID: <c6ab8640-d96c-4a71-929a-a4ad6bb2647d@redhat.com>
Date: Mon, 3 Mar 2025 15:47:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Enable full UVC metadata for all devices
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26-Feb-25 14:00, Ricardo Ribalda wrote:
> The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> V4L2_META_FMT_D4XX. The only difference between the two of them is that
> V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> V4L2_META_FMT_D4XX copies the whole metadata section.
> 
> Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> devices, but it is useful for any device where vendors include other
> metadata, such as the one described by Microsoft:
> - https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> 
> This patch removes the UVC_INFO_META macro and enables
> V4L2_META_FMT_D4XX for every device. It also updates the documentation
> to reflect the change.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  .../userspace-api/media/v4l/metafmt-d4xx.rst       | 19 +++--
>  .../userspace-api/media/v4l/metafmt-uvc.rst        |  6 +-
>  drivers/media/usb/uvc/uvc_driver.c                 | 83 ----------------------
>  drivers/media/usb/uvc/uvc_metadata.c               | 15 ++--
>  drivers/media/usb/uvc/uvcvideo.h                   |  1 -
>  5 files changed, 23 insertions(+), 101 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
> index 0686413b16b2..1b18ef056934 100644
> --- a/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
> +++ b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
> @@ -6,12 +6,23 @@
>  V4L2_META_FMT_D4XX ('D4XX')
>  *******************************
>  
> -Intel D4xx UVC Cameras Metadata
> +UVC Full Payload Header Data (formerly known as Intel D4xx UVC Cameras
> +Metadata).
>  
>  
>  Description
>  ===========
>  
> +V4L2_META_FMT_D4XX buffers follow the metadata buffer layout of
> +V4L2_META_FMT_UVC with the only difference, that it also includes proprietary
> +payload header data. It was originally implemented for Intel D4xx cameras, and
> +thus the name, but now it can be used by any UVC device, when userspace wants
> +full access to the UVC Metadata.
> +
> +
> +Intel D4xx Metadata
> +===================
> +
>  Intel D4xx (D435, D455 and others) cameras include per-frame metadata in their UVC
>  payload headers, following the Microsoft(R) UVC extension proposal [1_]. That
>  means, that the private D4XX metadata, following the standard UVC header, is
> @@ -21,10 +32,8 @@ types are MetadataId_CaptureStats (ID 3), MetadataId_CameraExtrinsics (ID 4),
>  and MetadataId_CameraIntrinsics (ID 5). For their description see [1_]. This
>  document describes proprietary metadata types, used by D4xx cameras.
>  
> -V4L2_META_FMT_D4XX buffers follow the metadata buffer layout of
> -V4L2_META_FMT_UVC with the only difference, that it also includes proprietary
> -payload header data. D4xx cameras use bulk transfers and only send one payload
> -per frame, therefore their headers cannot be larger than 255 bytes.
> +D4xx cameras use bulk transfers and only send one payload per frame, therefore
> +their headers cannot be larger than 255 bytes.
>  
>  This document implements Intel Configuration version 3 [9_].
>  
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> index 784346d14bbd..a3aae580e89e 100644
> --- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> @@ -6,7 +6,7 @@
>  V4L2_META_FMT_UVC ('UVCH')
>  *******************************
>  
> -UVC Payload Header Data
> +UVC Partial Payload Header Data (formerly known as UVC Payload Header Data).
>  
>  
>  Description
> @@ -44,7 +44,9 @@ Each individual block contains the following fields:
>          them
>      * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
>      * - __u8 length;
> -      - length of the rest of the block, including this field
> +      - length of the rest of the block, including this field (please note that
> +        regardless of this value, the driver will never copy more than 12
> +        bytes).
>      * - __u8 flags;
>        - Flags, indicating presence of other standard UVC fields
>      * - __u8 buf[];
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index deadbcea5e22..f19dcd4a7ac6 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2488,8 +2488,6 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
>  };
>  
>  #define UVC_INFO_QUIRK(q) (kernel_ulong_t)&(struct uvc_device_info){.quirks = q}
> -#define UVC_INFO_META(m) (kernel_ulong_t)&(struct uvc_device_info) \
> -	{.meta_format = m}
>  
>  /*
>   * The Logitech cameras listed below have their interface class set to
> @@ -3107,87 +3105,6 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
> -	/* Intel D410/ASR depth camera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x8086,
> -	  .idProduct		= 0x0ad2,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D415/ASRC depth camera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x8086,
> -	  .idProduct		= 0x0ad3,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D430/AWG depth camera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x8086,
> -	  .idProduct		= 0x0ad4,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel RealSense D4M */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x8086,
> -	  .idProduct		= 0x0b03,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D435/AWGC depth camera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x8086,
> -	  .idProduct		= 0x0b07,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D435i depth camera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x8086,
> -	  .idProduct		= 0x0b3a,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D405 Depth Camera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x8086,
> -	  .idProduct		= 0x0b5b,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D455 Depth Camera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x8086,
> -	  .idProduct		= 0x0b5c,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D421 Depth Module */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x8086,
> -	  .idProduct		= 0x1155,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
>  	/* Generic USB Video Class */
>  	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
>  	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 82de7781f5b6..5c44e6cdb83c 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -60,18 +60,16 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
>  				    struct v4l2_format *format)
>  {
>  	struct v4l2_fh *vfh = file->private_data;
> -	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
> -	struct uvc_device *dev = stream->dev;
>  	struct v4l2_meta_format *fmt = &format->fmt.meta;
> -	u32 fmeta = fmt->dataformat;
> +	u32 fmeta = fmt->dataformat == V4L2_META_FMT_D4XX ?
> +		    V4L2_META_FMT_D4XX : V4L2_META_FMT_UVC;
>  
>  	if (format->type != vfh->vdev->queue->type)
>  		return -EINVAL;
>  
>  	memset(fmt, 0, sizeof(*fmt));
>  
> -	fmt->dataformat = fmeta == dev->info->meta_format
> -			? fmeta : V4L2_META_FMT_UVC;
> +	fmt->dataformat = fmeta;
>  	fmt->buffersize = UVC_METADATA_BUF_SIZE;
>  
>  	return 0;
> @@ -110,19 +108,16 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
>  				      struct v4l2_fmtdesc *fdesc)
>  {
>  	struct v4l2_fh *vfh = file->private_data;
> -	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
> -	struct uvc_device *dev = stream->dev;
>  	u32 index = fdesc->index;
>  
> -	if (fdesc->type != vfh->vdev->queue->type ||
> -	    index > 1U || (index && !dev->info->meta_format))
> +	if (fdesc->type != vfh->vdev->queue->type || index > 1U)
>  		return -EINVAL;
>  
>  	memset(fdesc, 0, sizeof(*fdesc));
>  
>  	fdesc->type = vfh->vdev->queue->type;
>  	fdesc->index = index;
> -	fdesc->pixelformat = index ? dev->info->meta_format : V4L2_META_FMT_UVC;
> +	fdesc->pixelformat = index ? V4L2_META_FMT_D4XX : V4L2_META_FMT_UVC;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 5e388f05f3fc..cc2092ae9987 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -534,7 +534,6 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
>  
>  struct uvc_device_info {
>  	u32	quirks;
> -	u32	meta_format;
>  	u16	uvc_version;
>  };
>  
> 
> ---
> base-commit: d98e9213a768a3cc3a99f5e1abe09ad3baff2104
> change-id: 20250226-uvc-metadata-2e7e445966de
> 
> Best regards,



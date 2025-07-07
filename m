Return-Path: <linux-media+bounces-36988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2D8AFB261
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6305C1AA2FEA
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B50429A333;
	Mon,  7 Jul 2025 11:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUOlkHqM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EDC26057F;
	Mon,  7 Jul 2025 11:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888128; cv=none; b=dCujQLVoeI6SA0eg0BTj9SGspmyqv7DppFu0ubEtnS810DceYlnA8Mqon99L0z2r4wXr6PTDh1F4jzN+eBqcLDBwuq2sGF027YAkJv4V710RkRYXKkgZjv72FxXUedLpMpu9ZvnnUwCmnwF5HQbKvtrmcTbQ/fn3RFSvcG0g0Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888128; c=relaxed/simple;
	bh=DeMOpLVRvQ+k/8Qw0Fw8HCHhiC6ZbqH44x3ZVxYPW9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TBlA0OMynN/HYYNNMALWDLpKtfBllL4ocz9Q0L+VLYhUz/BCswzG0li5E9w2K6IHjvkOTJTdkNoOj8YD9aI/DYnfK2HZzCjD1QGRDRRTkwyJN5tGp9EfzwbfwfgBoThkGm98wa5cbSKclEf1i9DX88jnbHlp9WLzma+8g0hmQ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUOlkHqM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5594CC4CEE3;
	Mon,  7 Jul 2025 11:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751888128;
	bh=DeMOpLVRvQ+k/8Qw0Fw8HCHhiC6ZbqH44x3ZVxYPW9Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GUOlkHqM3Nh1vwF9xsQjLcPfizY/UrSWW5hwhb2pyTKQD6nPO0axX5/IxQGcoJxTG
	 o8Qx5V5TyAU1L0UJv5nhq1z3fIhtOQirhxjFXNYpdQ+H3zqNO8jZCQvq8PbUpuJb1j
	 VuUXYb6BQFuOl5NRVyEg5pkf+Zwti/cqy3uBRGzTRc1jdYsNZuDpGb6RRK3J3AiMYE
	 PI56ATa98i3l7sqjVnTIpyKn+GLNqWEF0kO1a7ZTqAfflONdG9h5d4Qu224gZ08+XR
	 z70bWV0COcRbXjf7aJ7Io8HMQ6bCnhkIOnNJ7g6LuunkfR5KOId2kHMkOpgj2HWolE
	 MotyiPHh+bdOA==
Message-ID: <7ee5018a-8479-4c2c-a997-2d2900f937c1@kernel.org>
Date: Mon, 7 Jul 2025 13:35:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] media: uvcvideo: Introduce dev->meta_formats
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
 <20250617-uvc-meta-v7-3-9c50623e2286@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250617-uvc-meta-v7-3-9c50623e2286@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 17-Jun-25 16:42, Ricardo Ribalda wrote:
> Right now, there driver supports devices with one or two metadata
> formats. Prepare it to support more than two metadata formats.
> 
> This is achieved with the introduction of a new field `meta_formats`,
> that contains the array of metadata formats supported by the device, in
> the order expected by userspace.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thank you for doing this. See my review remarks on patch 4/5 .

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_driver.c   |  7 ++++++
>  drivers/media/usb/uvc/uvc_metadata.c | 46 ++++++++++++++++++++++++++++++------
>  drivers/media/usb/uvc/uvcvideo.h     |  2 ++
>  3 files changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 62eb45435d8bec5c955720ecb46fb8936871e6cc..9de5abb43e19d9e876cddc5d7124592953db89ac 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2315,6 +2315,13 @@ static int uvc_probe(struct usb_interface *intf,
>  		goto error;
>  	}
>  
> +	ret = uvc_meta_init(dev);
> +	if (ret < 0) {
> +		dev_err(&dev->udev->dev,
> +			"Error initializing the metadata formats (%d)\n", ret);
> +		goto error;
> +	}
> +
>  	if (dev->quirks & UVC_QUIRK_NO_RESET_RESUME)
>  		udev->quirks &= ~USB_QUIRK_RESET_RESUME;
>  
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 82de7781f5b6b70c5ba16bcba9e0741231231904..bc84e849174397f41d1e20bf890a876eeb5a9c67 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -64,14 +64,20 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
>  	struct uvc_device *dev = stream->dev;
>  	struct v4l2_meta_format *fmt = &format->fmt.meta;
>  	u32 fmeta = fmt->dataformat;
> +	u32 i;
>  
>  	if (format->type != vfh->vdev->queue->type)
>  		return -EINVAL;
>  
> +	for (i = 0; (fmeta != dev->meta_formats[i]) && dev->meta_formats[i];
> +	     i++)
> +		;
> +	if (!dev->meta_formats[i])
> +		fmeta = V4L2_META_FMT_UVC;
> +
>  	memset(fmt, 0, sizeof(*fmt));
>  
> -	fmt->dataformat = fmeta == dev->info->meta_format
> -			? fmeta : V4L2_META_FMT_UVC;
> +	fmt->dataformat = fmeta;
>  	fmt->buffersize = UVC_METADATA_BUF_SIZE;
>  
>  	return 0;
> @@ -112,17 +118,21 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
>  	struct v4l2_fh *vfh = file->private_data;
>  	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
>  	struct uvc_device *dev = stream->dev;
> -	u32 index = fdesc->index;
> +	u32 i;
> +
> +	if (fdesc->type != vfh->vdev->queue->type)
> +		return -EINVAL;
>  
> -	if (fdesc->type != vfh->vdev->queue->type ||
> -	    index > 1U || (index && !dev->info->meta_format))
> +	for (i = 0; (i < fdesc->index) && dev->meta_formats[i]; i++)
> +		;
> +	if (!dev->meta_formats[i])
>  		return -EINVAL;
>  
>  	memset(fdesc, 0, sizeof(*fdesc));
>  
>  	fdesc->type = vfh->vdev->queue->type;
> -	fdesc->index = index;
> -	fdesc->pixelformat = index ? dev->info->meta_format : V4L2_META_FMT_UVC;
> +	fdesc->index = i;
> +	fdesc->pixelformat = dev->meta_formats[i];
>  
>  	return 0;
>  }
> @@ -174,3 +184,25 @@ int uvc_meta_register(struct uvc_streaming *stream)
>  					 V4L2_BUF_TYPE_META_CAPTURE,
>  					 &uvc_meta_fops, &uvc_meta_ioctl_ops);
>  }
> +
> +int uvc_meta_init(struct uvc_device *dev)
> +{
> +	static const u32 uvch_only[] = {V4L2_META_FMT_UVC, 0};
> +	static const u32 d4xx_format[] = {V4L2_META_FMT_UVC, V4L2_META_FMT_D4XX,
> +					  0};
> +
> +	switch (dev->info->meta_format) {
> +	case V4L2_META_FMT_D4XX:
> +		dev->meta_formats = d4xx_format;
> +		break;
> +	case 0:
> +		dev->meta_formats = uvch_only;
> +		break;
> +	default:
> +		dev_err(&dev->udev->dev, "Unknown metadata format 0x%x\n",
> +			dev->info->meta_format);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 11d6e3c2ebdfbabd7bbe5722f88ff85f406d9bb6..502f1d5608637cd28ce6f01aee31c4f5df160081 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -581,6 +581,7 @@ struct uvc_device {
>  	char name[32];
>  
>  	const struct uvc_device_info *info;
> +	const u32 *meta_formats; /* Zero-ended list of meta formats */
>  
>  	atomic_t nmappings;
>  
> @@ -751,6 +752,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  void uvc_video_clock_update(struct uvc_streaming *stream,
>  			    struct vb2_v4l2_buffer *vbuf,
>  			    struct uvc_buffer *buf);
> +int uvc_meta_init(struct uvc_device *dev);
>  int uvc_meta_register(struct uvc_streaming *stream);
>  
>  int uvc_register_video_device(struct uvc_device *dev,
> 



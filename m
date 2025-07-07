Return-Path: <linux-media+bounces-37045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3CEAFBCF6
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 22:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5090173E9B
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 20:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134162701D0;
	Mon,  7 Jul 2025 20:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esdLHl1G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A03B26CE13;
	Mon,  7 Jul 2025 20:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751921746; cv=none; b=teSboUG7zJxWNLmBrSxtjMRwGNd14M+szIJBnllYcPvhvESeFEjfcJmKqR84B5MwKGVKdUXekYx3BCQQajkl1xBkNVUviS5l2741WPXYHiDB+dNn16Aw3G3vI9u9bopm1nCnhDNuGMm/RT0zKDTrf0Smk6sYdOE7uNMu+yJKAxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751921746; c=relaxed/simple;
	bh=N2m18nhNQA4hki2dztBKwI3mRty+hyjFtNl6bA4Wodc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JVQx/tbddcZ/e1ZBXgNVXjeKu3dO32azgJAyd+5vzEpYx35qUkk7xe4Tc9wWXJTmZ4WRHAKPl+jSAw9u+Wo0eOJRrrfjSpL8ZHsnS9tQxeK2zqXZCALC1aZGUdo0XtseY1g/4yUH/Ye87iS84qrNuNFlmwJ7PhFtpbV3+IhYZKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esdLHl1G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C420C4CEEF;
	Mon,  7 Jul 2025 20:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751921745;
	bh=N2m18nhNQA4hki2dztBKwI3mRty+hyjFtNl6bA4Wodc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=esdLHl1GyBSlq6xK35kbDEc8PgESk9H+3LXSa1vfDzeEVNeLVF+3i5M5tdb8IEsIo
	 dHMtzTRwXoSCEweSgVW6Er+h9WqRL9FihJS9K8YVJJOYHc3ccA9pB7gs6RLfzHskq7
	 tFNGFyawXk8N/E6k1nZfxNGzNktFmTVupxSpVCfNgvZF/4qtYblt1IVzodAedmwZBn
	 wQ9f/MFVIjS3YOKiG+E1jvwLCYTbgVtqM6sROV2awkS5F7XzZ53QrgX/yPyxhPO1Sv
	 8G/qANBP8lh5b0LrhFh6SfxZakHCGS4ZhgoM4pcmd2L3y0ThzzBAPpnTk9YFBd0Heu
	 uBhyoN+n5+AbQ==
Message-ID: <5ae0db7f-6528-4eeb-8747-09be203e0089@kernel.org>
Date: Mon, 7 Jul 2025 22:55:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] media: uvcvideo: Introduce dev->meta_formats
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
 <20250707-uvc-meta-v8-3-ed17f8b1218b@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250707-uvc-meta-v8-3-ed17f8b1218b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7-Jul-25 8:34 PM, Ricardo Ribalda wrote:
> Right now, there driver supports devices with one or two metadata
> formats. Prepare it to support more than two metadata formats.
> 
> This is achieved with the introduction of a new field `meta_formats`,
> that contains the array of metadata formats supported by the device, in
> the order expected by userspace.
> 
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_driver.c   |  2 ++
>  drivers/media/usb/uvc/uvc_metadata.c | 38 +++++++++++++++++++++++++++++-------
>  drivers/media/usb/uvc/uvcvideo.h     |  6 ++++++
>  3 files changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 62eb45435d8bec5c955720ecb46fb8936871e6cc..56ea20eeb7b9d5d92f3d837c15bdf11d536e9f2d 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2315,6 +2315,8 @@ static int uvc_probe(struct usb_interface *intf,
>  		goto error;
>  	}
>  
> +	uvc_meta_init(dev);
> +
>  	if (dev->quirks & UVC_QUIRK_NO_RESET_RESUME)
>  		udev->quirks &= ~USB_QUIRK_RESET_RESUME;
>  
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 82de7781f5b6b70c5ba16bcba9e0741231231904..4bcbc22f47e67c52baf6e133f240131ff3d32a03 100644
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
> @@ -174,3 +184,17 @@ int uvc_meta_register(struct uvc_streaming *stream)
>  					 V4L2_BUF_TYPE_META_CAPTURE,
>  					 &uvc_meta_fops, &uvc_meta_ioctl_ops);
>  }
> +
> +void uvc_meta_init(struct uvc_device *dev)
> +{
> +	unsigned int i = 0;
> +
> +	dev->meta_formats[i++] = V4L2_META_FMT_UVC;
> +
> +	if (dev->info->meta_format &&
> +	    !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC))
> +		dev->meta_formats[i++] = dev->info->meta_format;
> +
> +	 /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
> +	dev->meta_formats[i++] = 0;
> +}
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 11d6e3c2ebdfbabd7bbe5722f88ff85f406d9bb6..b3c094c6591e7a71fc00e1096bcf493a83f330ad 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -572,6 +572,8 @@ struct uvc_status {
>  	};
>  } __packed;
>  
> +#define UVC_MAX_META_DATA_FORMATS 3
> +
>  struct uvc_device {
>  	struct usb_device *udev;
>  	struct usb_interface *intf;
> @@ -582,6 +584,9 @@ struct uvc_device {
>  
>  	const struct uvc_device_info *info;
>  
> +	/* Zero-ended list of meta formats */
> +	u32 meta_formats[UVC_MAX_META_DATA_FORMATS + 1];
> +
>  	atomic_t nmappings;
>  
>  	/* Video control interface */
> @@ -751,6 +756,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  void uvc_video_clock_update(struct uvc_streaming *stream,
>  			    struct vb2_v4l2_buffer *vbuf,
>  			    struct uvc_buffer *buf);
> +void uvc_meta_init(struct uvc_device *dev);
>  int uvc_meta_register(struct uvc_streaming *stream);
>  
>  int uvc_register_video_device(struct uvc_device *dev,
> 



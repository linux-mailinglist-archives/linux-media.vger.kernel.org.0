Return-Path: <linux-media+bounces-33397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5CFAC40BA
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 15:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E44AB189467D
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FB320CCF3;
	Mon, 26 May 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u9HK6joe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C411D2F42;
	Mon, 26 May 2025 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748267645; cv=none; b=fSuX0btjt6BsBV9amPNAe0wfvH612Pd9/zvGwQukdPt9fmD57QgwNGRgnnp8CmWjeuJVXamINRU3HOP7ktGBkjShPIAtO0JCRFOF0/48LeCbdpIBsGFZwMLXwhk94i/qjdlbGl8OhOenp3EaFggW9zFq+ri4nT+o4Oabx0xZ4CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748267645; c=relaxed/simple;
	bh=iAqkPatqcs+Tgk83IK+LDm5HlAv4gkKKd0yDlNzlHPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5VYTdakZNjB2vSQBlzNqjweok8gGlu0TNSIrvAylSN0Ht1tJSr+TBDIuVbGpvDsbcCSU4Vv9RXhQO/RGybQTHXnS1borY63jfVbtmp7OIO/nbDKL2VZemqk5+xOk18wEdu/zkTqWyG3PnMuDiLArD3S/+5KL7We32rHtbzuICQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u9HK6joe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B70DD982;
	Mon, 26 May 2025 15:53:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748267616;
	bh=iAqkPatqcs+Tgk83IK+LDm5HlAv4gkKKd0yDlNzlHPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9HK6joeFhn/GzV0BSEMwqrDN5s1Alveq1psWLVsGE4N5imI+wpXiJX+SiDHtz7PV
	 zLSiujzXDDhYXG3VXZL4LVzsouhoWDgwo5qTwiSjFv88U3zHtQuS/v5JHvkB0lcHgf
	 2yH67PMrCbswSIbvDlFB+o6winAsNf9WLfYgty6U=
Date: Mon, 26 May 2025 15:53:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5
Message-ID: <20250526135355.GO17743@pendragon.ideasonboard.com>
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-3-f79974fc2d20@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404-uvc-meta-v5-3-f79974fc2d20@chromium.org>

On Fri, Apr 04, 2025 at 06:37:36AM +0000, Ricardo Ribalda wrote:
> The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> V4L2_META_FMT_D4XX. The only difference between the two of them is that
> V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> V4L2_META_FMT_D4XX copies the whole metadata section.
> 
> Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> devices, but it is useful to have the whole metadata section for any
> device where vendors include other metadata, such as the one described by
> Microsoft:
> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> 
> This patch introduces a new format V4L2_META_FMT_UVC_MSXU_1_5, that is
> identical to V4L2_META_FMT_D4XX.
> 
> For now, flag this format with a new quirk.

Why can't you set dev->info->meta_format to V4L2_META_FMT_UVC_MSXU_1_5
for the devices that support this, instead of using a quirk ? This
should be explained in the commit message.

> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
>  .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 ++++++++++++
>  MAINTAINERS                                        |  1 +
>  drivers/media/usb/uvc/uvc_metadata.c               | 43 +++++++++++++++++++---
>  drivers/media/usb/uvc/uvcvideo.h                   |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
>  include/uapi/linux/videodev2.h                     |  1 +
>  7 files changed, 65 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index 86ffb3bc8ade2e0c563dd84441572ecea1a571a6..4de0d094e0702068be0c59154458c9dfecbfe28d 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -19,6 +19,7 @@ These formats are used for the :ref:`metadata` interface only.
>      metafmt-pisp-fe
>      metafmt-rkisp1
>      metafmt-uvc
> +    metafmt-uvc-msxu-1-5
>      metafmt-vivid
>      metafmt-vsp1-hgo
>      metafmt-vsp1-hgt
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..e6f95a88c0ff061df0b066b12cefc30f946b60aa
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _v4l2-meta-fmt-uvc-msxu-1-5:
> +
> +***********************************
> +V4L2_META_FMT_UVC_MSXU_1_5 ('UVCM')
> +***********************************
> +
> +Microsoft(R)'s UVC Payload Metadata.
> +
> +
> +Description
> +===========
> +
> +V4L2_META_FMT_UVC_MSXU_1_5 buffers follow the metadata buffer layout of
> +V4L2_META_FMT_UVC with the only difference that it includes all the UVC
> +metadata, not just the first 2-12 bytes.

This needs some more details. "all the UVC metadata" is too vague, you
should explain that the metadata format follows the MS specification.

> +
> +For more details check the documentation from Microsoft(R) [1].
> +
> +.. _1:
> +
> +[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 306b1384eb6d4cb7a310ada44605eaeb88cc732f..a07ed31ab057b98cf801d919b5bbec5ee334c9ac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25059,6 +25059,7 @@ S:	Maintained
>  W:	http://www.ideasonboard.org/uvc/
>  T:	git git://linuxtv.org/media.git
>  F:	Documentation/userspace-api/media/drivers/uvcvideo.rst
> +F:	Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
>  F:	Documentation/userspace-api/media/v4l/metafmt-uvc.rst
>  F:	drivers/media/common/uvc.c
>  F:	drivers/media/usb/uvc/
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 82de7781f5b6b70c5ba16bcba9e0741231231904..fe2678fc795d7fd5a64e8113199012f34c419176 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -63,15 +63,21 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
>  	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
>  	struct uvc_device *dev = stream->dev;
>  	struct v4l2_meta_format *fmt = &format->fmt.meta;
> -	u32 fmeta = fmt->dataformat;
> +	u32 fmeta;
> +
> +	if (fmt->dataformat == dev->info->meta_format)
> +		fmeta = dev->info->meta_format;
> +	else if (fmt->dataformat == V4L2_META_FMT_UVC_MSXU_1_5)
> +		fmeta = V4L2_META_FMT_UVC_MSXU_1_5;

Doesn't this accept V4L2_META_FMT_UVC_MSXU_1_5 regardless of the quirk ?

> +	else
> +		fmeta = V4L2_META_FMT_UVC;
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
> @@ -106,6 +112,27 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
>  	return ret;
>  }
>  
> +static u32 uvc_meta_idx_to_fmeta(struct uvc_device *dev, u32 index)
> +{
> +	switch (index) {
> +	case 0:
> +		return V4L2_META_FMT_UVC;
> +	case 1:
> +		if (dev->info->meta_format)
> +			return dev->info->meta_format;
> +		if (dev->quirks & UVC_QUIRK_MSXU_META)
> +			return V4L2_META_FMT_UVC_MSXU_1_5;
> +		return 0;
> +	case 2:
> +		if (dev->info->meta_format &&
> +		    dev->quirks & UVC_QUIRK_MSXU_META)
> +			return V4L2_META_FMT_UVC_MSXU_1_5;
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
>  static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
>  				      struct v4l2_fmtdesc *fdesc)
>  {
> @@ -113,16 +140,20 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
>  	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
>  	struct uvc_device *dev = stream->dev;
>  	u32 index = fdesc->index;
> +	u32 fmeta;
> +
> +	if (fdesc->type != vfh->vdev->queue->type)
> +		return -EINVAL;
>  
> -	if (fdesc->type != vfh->vdev->queue->type ||
> -	    index > 1U || (index && !dev->info->meta_format))
> +	fmeta = uvc_meta_idx_to_fmeta(dev, fdesc->index);
> +	if (!fmeta)
>  		return -EINVAL;
>  
>  	memset(fdesc, 0, sizeof(*fdesc));
>  
>  	fdesc->type = vfh->vdev->queue->type;
>  	fdesc->index = index;
> -	fdesc->pixelformat = index ? dev->info->meta_format : V4L2_META_FMT_UVC;
> +	fdesc->pixelformat = fmeta;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..123446683e22589f23b5228a00240e54f00ae6f1 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -77,6 +77,7 @@
>  #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
>  #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
>  #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
> +#define UVC_QUIRK_MSXU_META		0x00040000
>  
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a16fb44c7246e35f3710306fde5dfc15329b4d95..12f1232e5ca3acdefede8f9751f9e7191eeae58b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1457,6 +1457,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
>  	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
>  	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
> +	case V4L2_META_FMT_UVC_MSXU_1_5:	descr = "UVC MSXU Metadata"; break;
>  	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
>  	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>  	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index c8cb2796130f8d1b864d669267d2b31f73b839aa..0cf6885a5dc8752326bd10a893d5d09d47993c21 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -851,6 +851,7 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> +#define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* UVC MSXU metadata */
>  #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
>  
>  /* Vendor specific - used for RK_ISP1 camera sub-system */

-- 
Regards,

Laurent Pinchart


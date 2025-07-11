Return-Path: <linux-media+bounces-37535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 182ACB025A1
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 22:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BD404A7B28
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 20:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199131F417E;
	Fri, 11 Jul 2025 20:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sJHoMgKG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88CE1E1A3F;
	Fri, 11 Jul 2025 20:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752264822; cv=none; b=oY5yu1kMtkza4lgS6Gvtyqs8gxvbcx1gfrxjci8h3/pIUWb9ItJBnbq1PsTbfPUtjd61480UyNHvae2LvzGVC1cIu442Sur9Ef1NNsUFiB9PDRgYCkUW83aTTyM9axO0i7kici8PLYhSLAkwoNNCrg9EtpAKSMU82uy7aqos1iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752264822; c=relaxed/simple;
	bh=seOlSvJ8t89QLSmj7LWfQmjvKRKgQZ3sTqJ35v60bos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xq2W8Lcd2rETQaaQYPFWiUkRlwzl+hO2kb2gEJttD/i/GaQdtz6/2rc8dAQcrtmc93nnNsoCv5h0znQK6i107hPlino3ZPHxwXhGYZMG5gWzLgoocxeX7mgOdK2awcgkikZAdBbF+K+5+sapsODiFJkGfu66HBJDuoiOA3B91OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sJHoMgKG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 620A6C75;
	Fri, 11 Jul 2025 22:13:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752264789;
	bh=seOlSvJ8t89QLSmj7LWfQmjvKRKgQZ3sTqJ35v60bos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJHoMgKGxxETglWZJMEICJIM0R5aDie/MKSTFYYML1v4XT5Rp34d4shH1e/G0iZGW
	 Uu6p5bVDEy/i8qQ04bqVyvNDlCI6ihUmqDhY4VtsEln5y3LBG+4QkIa7cmgrQd9ceE
	 npGZYyzMdSo7vcyRwmlidvBOfLcxKferJPjpKuMM=
Date: Fri, 11 Jul 2025 23:13:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 4/5] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5
Message-ID: <20250711201308.GI27674@pendragon.ideasonboard.com>
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
 <20250707-uvc-meta-v8-4-ed17f8b1218b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707-uvc-meta-v8-4-ed17f8b1218b@chromium.org>

On Mon, Jul 07, 2025 at 06:34:04PM +0000, Ricardo Ribalda wrote:
> The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> V4L2_META_FMT_D4XX. The only difference between the two of them is that
> V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> V4L2_META_FMT_D4XX copies the whole metadata section.
> 
> Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> devices, but it is useful to have the whole metadata payload for any
> device where vendors include other metadata, such as the one described by
> Microsoft:
> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> 
> This patch introduces a new format V4L2_META_FMT_UVC_MSXU_1_5, that is
> identical to V4L2_META_FMT_D4XX.
> 
> Let the user enable this format with a quirk for now. This way they can
> test if their devices provide useful metadata without rebuilding the
> kernel. They can later contribute patches to auto-quirk their devices.
> We will also work in methods to auto-detect devices compatible with this
> new metadata format.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
>  .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  drivers/media/usb/uvc/uvc_metadata.c               |  4 ++++
>  drivers/media/usb/uvc/uvcvideo.h                   |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
>  include/uapi/linux/videodev2.h                     |  1 +
>  7 files changed, 32 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index bb6876cfc271e1a0543eee4209d6251e1a6a73cc..0de80328c36bf148051a19abe9e5241234ddfe5c 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -20,6 +20,7 @@ These formats are used for the :ref:`metadata` interface only.
>      metafmt-pisp-fe
>      metafmt-rkisp1
>      metafmt-uvc
> +    metafmt-uvc-msxu-1-5
>      metafmt-vivid
>      metafmt-vsp1-hgo
>      metafmt-vsp1-hgt
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..dd1c3076df243d770a13e7f6d07c3296a269e16a
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
> +metadata in the `buffer[]` field, not just the first 2-12 bytes.
> +
> +The metadata format follows the specification from Microsoft(R) [1].
> +
> +.. _1:
> +
> +[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 658543062bba3b7e600699d7271ffc89250ba7e5..fdde1d37ed2ef9058e3ea3417bec25afe454dfc0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25827,6 +25827,7 @@ S:	Maintained
>  W:	http://www.ideasonboard.org/uvc/
>  T:	git git://linuxtv.org/media.git
>  F:	Documentation/userspace-api/media/drivers/uvcvideo.rst
> +F:	Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
>  F:	Documentation/userspace-api/media/v4l/metafmt-uvc.rst
>  F:	drivers/media/common/uvc.c
>  F:	drivers/media/usb/uvc/
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 4bcbc22f47e67c52baf6e133f240131ff3d32a03..77e03273d3cf6b00cac6ebb9b29b941f1cbfd9f7 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -195,6 +195,10 @@ void uvc_meta_init(struct uvc_device *dev)
>  	    !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC))
>  		dev->meta_formats[i++] = dev->info->meta_format;
>  
> +	if (dev->quirks & UVC_QUIRK_MSXU_META &&
> +	    !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC_MSXU_1_5))
> +		dev->meta_formats[i++] = V4L2_META_FMT_UVC_MSXU_1_5;

Just to clarify, does this mean that your goal is to set
dev->info->meta_format to V4L2_META_FMT_UVC_MSXU_1_5 as devices are
reported to support the format ?

> +
>  	 /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
>  	dev->meta_formats[i++] = 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b3c094c6591e7a71fc00e1096bcf493a83f330ad..616adc417c62a58686beccbc440a5dfac0a2d588 100644
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
> index be94a79b976e3de4eb957f5d2584ec6d4230469e..993b36417b4655456ce545cb42a41b55b98e4d6c 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1463,6 +1463,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
>  	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
>  	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
> +	case V4L2_META_FMT_UVC_MSXU_1_5:	descr = "UVC MSXU Metadata"; break;
>  	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
>  	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>  	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 6f7bd38dd5aa4b1b2084685512512a380d76a5e4..863bc5b7dec32303e852d7e9c3891011ce5a3d71 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -867,6 +867,7 @@ struct v4l2_pix_format {
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


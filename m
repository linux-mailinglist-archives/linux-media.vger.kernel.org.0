Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E04BD11549
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 10:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbfEBIYL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 04:24:11 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:42233 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725944AbfEBIYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 04:24:10 -0400
Received: from [192.168.2.10] ([46.9.232.72])
        by smtp-cloud9.xs4all.net with ESMTPA
        id M70bhvpw3NExlM70ehmMnQ; Thu, 02 May 2019 10:24:07 +0200
Subject: Re: [PATCH 18/20] lib: image-formats: Add v4l2 formats support
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <cover.8ec406bf8f4f097e9dc909d5aac466556822f592.1555487650.git-series.maxime.ripard@bootlin.com>
 <a9af304793a38b6001c9155f36e370002926841c.1555487650.git-series.maxime.ripard@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5c904167-14f3-8e64-42f1-650d0689f78d@xs4all.nl>
Date:   Thu, 2 May 2019 10:24:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a9af304793a38b6001c9155f36e370002926841c.1555487650.git-series.maxime.ripard@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK2oLcO4yRgTOk3hNM0fIcHIfQYN+EnKbGvw+wrdrrBNXji62ugoSC7OmbD2C0HjZsGFFjU64Pb3N+v5GncsKJecfhZFzDiS+1z9UB4jWY88XLGMFsY7
 4WIoORtOksdn+hGMS912G9N1ejB2dHgIoOkKaQM4HMyWu3zlEnBzv0Ywtp9+XXP3MrTK/7HBSAqvYUbEaX0PEkW8cz+N6nZpwjj4W66NAw3Q7YDQAQU82lve
 9E1fbl+Nxd/3HD+iRXivkSvkj3mXojttKjGijTID8rKsGt3WzNYjDhiO/fFWqPXZu0jMYYjmI+OP0knKSBBaCxu3m26c78BzsrsJ10T8fAkW0Omp7nn9xhgY
 GfmexGAOk8AOOcc8wmfYpsudbfDrvN6fKFViabL//D4OKLuLHWxd/wIbl3hba9MWO8vml/T6T7DR8ItY9HSONGI/N3WKrIa1JNH+WrZkdw6Hsm8jY/H3GLge
 n0PkMndezBERfVmcbY5iQbVxZMaeuO7dcdg6Rfg2ADginEOuH0gi+pTROFCsOyQOINY9A05MgFfaAC1BxJ3aIRPUvd7qK6a6ziktgRVDTgrakgOPoYU8EiBx
 ul7jx/6qriP113MP/Ro6A2gj2wbgZ5olb7oTzNktqHbufm2fgxqTCryDOp7LR4ZqKkQBQzsvWzZAdBj3e9IkX2HBIDfabTVNDkmYvi4IuIUXcQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On 4/17/19 9:54 AM, Maxime Ripard wrote:
> V4L2 uses different fourcc's than DRM, and has a different set of formats.
> For now, let's add the v4l2 fourcc's for the already existing formats.

For this lib to be more useful for V4L2, would it be a good idea to add
Bayer formats as well? This can be done in a separate patch.

Those formats are V4L specific, but are very common.

Regards,

	Hans

> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  include/linux/image-formats.h |  9 +++++-
>  lib/image-formats.c           | 62 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 71 insertions(+)
> 
> diff --git a/include/linux/image-formats.h b/include/linux/image-formats.h
> index ec43d9f9a527..b78b8e861fc9 100644
> --- a/include/linux/image-formats.h
> +++ b/include/linux/image-formats.h
> @@ -50,6 +50,13 @@ struct image_format_info {
>  	};
>  
>  	/**
> +	 * @v4l2_fmt:
> +	 *
> +	 * V4L2 4CC format identifier (V4L2_PIX_FMT_*)
> +	 */
> +	u32 v4l2_fmt;
> +
> +	/**
>  	 * @depth:
>  	 *
>  	 * Color depth (number of bits per pixel excluding padding bits),
> @@ -382,6 +389,8 @@ uint64_t image_format_info_min_pitch(const struct image_format_info *info,
>  }
>  
>  const struct image_format_info *__image_format_drm_lookup(u32 drm);
> +const struct image_format_info *__image_format_v4l2_lookup(u32 v4l2);
>  const struct image_format_info *image_format_drm_lookup(u32 drm);
> +const struct image_format_info *image_format_v4l2_lookup(u32 v4l2);
>  
>  #endif /* _IMAGE_FORMATS_H_ */
> diff --git a/lib/image-formats.c b/lib/image-formats.c
> index 1e52a7410222..25fa22d243fb 100644
> --- a/lib/image-formats.c
> +++ b/lib/image-formats.c
> @@ -25,12 +25,14 @@
>  #include <linux/image-formats.h>
>  #include <linux/kernel.h>
>  #include <linux/math64.h>
> +#include <linux/videodev2.h>
>  
>  #include <uapi/drm/drm_fourcc.h>
>  
>  static const struct image_format_info formats[] = {
>  	{
>  		.drm_fmt = DRM_FORMAT_C8,
> +		.v4l2_fmt = V4L2_PIX_FMT_GREY,
>  		.depth = 8,
>  		.num_planes = 1,
>  		.cpp = { 1, 0, 0 },
> @@ -38,6 +40,7 @@ static const struct image_format_info formats[] = {
>  		.vsub = 1,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_RGB332,
> +		.v4l2_fmt = V4L2_PIX_FMT_RGB332,
>  		.depth = 8,
>  		.num_planes = 1,
>  		.cpp = { 1, 0, 0 },
> @@ -172,6 +175,7 @@ static const struct image_format_info formats[] = {
>  		.has_alpha = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_RGB565,
> +		.v4l2_fmt = V4L2_PIX_FMT_RGB565X,
>  		.depth = 16,
>  		.num_planes = 1,
>  		.cpp = { 2, 0, 0 },
> @@ -186,6 +190,7 @@ static const struct image_format_info formats[] = {
>  		.vsub = 1,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_RGB888,
> +		.v4l2_fmt = V4L2_PIX_FMT_BGR24,
>  		.depth = 24,
>  		.num_planes = 1,
>  		.cpp = { 3, 0, 0 },
> @@ -193,6 +198,7 @@ static const struct image_format_info formats[] = {
>  		.vsub = 1,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_BGR888,
> +		.v4l2_fmt = V4L2_PIX_FMT_RGB24,
>  		.depth = 24,
>  		.num_planes = 1,
>  		.cpp = { 3, 0, 0 },
> @@ -200,6 +206,7 @@ static const struct image_format_info formats[] = {
>  		.vsub = 1,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_XRGB8888,
> +		.v4l2_fmt = V4L2_PIX_FMT_XBGR32,
>  		.depth = 24,
>  		.num_planes = 1,
>  		.cpp = { 4, 0, 0 },
> @@ -304,6 +311,7 @@ static const struct image_format_info formats[] = {
>  		.has_alpha = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_ARGB8888,
> +		.v4l2_fmt = V4L2_PIX_FMT_ABGR32,
>  		.depth = 32,
>  		.num_planes = 1,
>  		.cpp = { 4, 0, 0 },
> @@ -384,6 +392,7 @@ static const struct image_format_info formats[] = {
>  		.has_alpha = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_YUV410,
> +		.v4l2_fmt = V4L2_PIX_FMT_YUV410,
>  		.depth = 0,
>  		.num_planes = 3,
>  		.cpp = { 1, 1, 1 },
> @@ -392,6 +401,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_YVU410,
> +		.v4l2_fmt = V4L2_PIX_FMT_YVU410,
>  		.depth = 0,
>  		.num_planes = 3,
>  		.cpp = { 1, 1, 1 },
> @@ -416,6 +426,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_YUV420,
> +		.v4l2_fmt = V4L2_PIX_FMT_YUV420,
>  		.depth = 0,
>  		.num_planes = 3,
>  		.cpp = { 1, 1, 1 },
> @@ -424,6 +435,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_YVU420,
> +		.v4l2_fmt = V4L2_PIX_FMT_YVU420,
>  		.depth = 0,
>  		.num_planes = 3,
>  		.cpp = { 1, 1, 1 },
> @@ -432,6 +444,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_YUV422,
> +		.v4l2_fmt = V4L2_PIX_FMT_YUV422P,
>  		.depth = 0,
>  		.num_planes = 3,
>  		.cpp = { 1, 1, 1 },
> @@ -448,6 +461,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_YUV444,
> +		.v4l2_fmt = V4L2_PIX_FMT_YUV444,
>  		.depth = 0,
>  		.num_planes = 3,
>  		.cpp = { 1, 1, 1 },
> @@ -464,6 +478,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_NV12,
> +		.v4l2_fmt = V4L2_PIX_FMT_NV12,
>  		.depth = 0,
>  		.num_planes = 2,
>  		.cpp = { 1, 2, 0 },
> @@ -472,6 +487,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_NV21,
> +		.v4l2_fmt = V4L2_PIX_FMT_NV21,
>  		.depth = 0,
>  		.num_planes = 2,
>  		.cpp = { 1, 2, 0 },
> @@ -480,6 +496,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_NV16,
> +		.v4l2_fmt = V4L2_PIX_FMT_NV16,
>  		.depth = 0,
>  		.num_planes = 2,
>  		.cpp = { 1, 2, 0 },
> @@ -488,6 +505,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_NV61,
> +		.v4l2_fmt = V4L2_PIX_FMT_NV61,
>  		.depth = 0,
>  		.num_planes = 2,
>  		.cpp = { 1, 2, 0 },
> @@ -496,6 +514,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_NV24,
> +		.v4l2_fmt = V4L2_PIX_FMT_NV24,
>  		.depth = 0,
>  		.num_planes = 2,
>  		.cpp = { 1, 2, 0 },
> @@ -504,6 +523,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_NV42,
> +		.v4l2_fmt = V4L2_PIX_FMT_NV42,
>  		.depth = 0,
>  		.num_planes = 2,
>  		.cpp = { 1, 2, 0 },
> @@ -512,6 +532,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_YUYV,
> +		.v4l2_fmt = V4L2_PIX_FMT_YUYV,
>  		.depth = 0,
>  		.num_planes = 1,
>  		.cpp = { 2, 0, 0 },
> @@ -520,6 +541,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_YVYU,
> +		.v4l2_fmt = V4L2_PIX_FMT_YVYU,
>  		.depth = 0,
>  		.num_planes = 1,
>  		.cpp = { 2, 0, 0 },
> @@ -528,6 +550,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_UYVY,
> +		.v4l2_fmt = V4L2_PIX_FMT_UYVY,
>  		.depth = 0,
>  		.num_planes = 1,
>  		.cpp = { 2, 0, 0 },
> @@ -536,6 +559,7 @@ static const struct image_format_info formats[] = {
>  		.is_yuv = true,
>  	}, {
>  		.drm_fmt = DRM_FORMAT_VYUY,
> +		.v4l2_fmt = V4L2_PIX_FMT_VYUY,
>  		.depth = 0,
>  		.num_planes = 1,
>  		.cpp = { 2, 0, 0 },
> @@ -653,3 +677,41 @@ const struct image_format_info *image_format_drm_lookup(u32 drm)
>  	return format;
>  }
>  EXPORT_SYMBOL(image_format_drm_lookup);
> +
> +/**
> + * __image_format_v4l2_lookup - query information for a given format
> + * @v4l2: V4L2 fourcc pixel format (V4L2_PIX_FMT_*)
> + *
> + * The caller should only pass a supported pixel format to this function.
> + *
> + * Returns:
> + * The instance of struct image_format_info that describes the pixel format, or
> + * NULL if the format is unsupported.
> + */
> +const struct image_format_info *__image_format_v4l2_lookup(u32 v4l2)
> +{
> +	return __image_format_lookup(v4l2_fmt, v4l2);
> +}
> +EXPORT_SYMBOL(__image_format_v4l2_lookup);
> +
> +/**
> + * image_format_v4l2_lookup - query information for a given format
> + * @v4l2: V4L2 fourcc pixel format (V4L2_PIX_FMT_*)
> + *
> + * The caller should only pass a supported pixel format to this function.
> + * Unsupported pixel formats will generate a warning in the kernel log.
> + *
> + * Returns:
> + * The instance of struct image_format_info that describes the pixel format, or
> + * NULL if the format is unsupported.
> + */
> +const struct image_format_info *image_format_v4l2_lookup(u32 v4l2)
> +{
> +	const struct image_format_info *format;
> +
> +	format = __image_format_v4l2_lookup(v4l2);
> +
> +	WARN_ON(!format);
> +	return format;
> +}
> +EXPORT_SYMBOL(image_format_v4l2_lookup);
> 


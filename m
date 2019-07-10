Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFB063DB9
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 00:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfGIWHl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 18:07:41 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46344 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726787AbfGIWHk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 18:07:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 8FC0828B042
Subject: Re: [PATCH 2/2] Revert "media: vimc: propagate pixel format in the
 stream"
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        kernel@collabora.com, skhan@linuxfoundation.org
References: <e144e6f5aae4e3d932e464fbf741d7cbaaf55980.1562701396.git.helen.koike@collabora.com>
 <8450c879beff8c86dde7333f1f2d688eef380de4.1562701396.git.helen.koike@collabora.com>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <d45b3c80-51c5-e3c0-3782-2600c133a5af@collabora.com>
Date:   Tue, 9 Jul 2019 19:06:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <8450c879beff8c86dde7333f1f2d688eef380de4.1562701396.git.helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Helen,

On 7/9/19 4:43 PM, Helen Koike wrote:
> This reverts commit b6c61a6c37317efd7327199bfe24770af3d7e799.
>
> The requested pixelformat is being propagated from the capture to the
> tpg in the sensor.
>
> This was a bad design choice, as we start having the following issues:
>
> * We set a pixelformat in the capture;
> * We set matching media bus formats in the subdevices pads;
> * Link validate looks fine (sizes matches, media bus formats matches);
> * Issue: if some of the subdevice doesn't know how to generate the
> requested pixelformat in the capture, then stream_on fails. This is bad
> because capture says it supports that pixelformat, everything looks
> fine, but it is not, and there is no way to find it out through the
> links.
>
> This patch was implemented so we could request any pixelformat from the
> pipeline regardeless of the media bus format configured between pads.
> Not all pixelformat can be mapped into a media bus code (e.g.
> multiplanar formats), so with this patch we could request those
> pixelformats from the tpg.
>
> Solution: map pixelformats to media bus codes as before, and implement
> conversions to other pixelformats in the capture to support multiplanar.
>
> So first step to this solution is to revert this patch.
>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

The commit title of [PATCH 1/2] starts with "media: Revert..." and
[PATCH 2/2] starts with "Revert...", not sure if this is relevant.

I've applied this changes at media-master and `test-media vimc` (from
v4l-utils) got 0 errors and 0 warnings. I've also tested with qv4l2, and
the streaming went as expected for all capture devices.

Tested-by:  André Almeida <andrealmeid@collabora.com>

> ---
>  drivers/media/platform/vimc/vimc-capture.c  |  76 ++---
>  drivers/media/platform/vimc/vimc-common.c   | 309 ++++++++++++--------
>  drivers/media/platform/vimc/vimc-common.h   |  58 ++--
>  drivers/media/platform/vimc/vimc-debayer.c  |  83 ++----
>  drivers/media/platform/vimc/vimc-scaler.c   |  63 ++--
>  drivers/media/platform/vimc/vimc-sensor.c   |  51 +++-
>  drivers/media/platform/vimc/vimc-streamer.c |   2 -
>  drivers/media/platform/vimc/vimc-streamer.h |   6 -
>  8 files changed, 342 insertions(+), 306 deletions(-)
>
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 664855708fdf..1d56b91830ba 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -18,32 +18,6 @@
>  
>  #define VIMC_CAP_DRV_NAME "vimc-capture"
>  
> -static const u32 vimc_cap_supported_pixfmt[] = {
> -	V4L2_PIX_FMT_BGR24,
> -	V4L2_PIX_FMT_RGB24,
> -	V4L2_PIX_FMT_ARGB32,
> -	V4L2_PIX_FMT_SBGGR8,
> -	V4L2_PIX_FMT_SGBRG8,
> -	V4L2_PIX_FMT_SGRBG8,
> -	V4L2_PIX_FMT_SRGGB8,
> -	V4L2_PIX_FMT_SBGGR10,
> -	V4L2_PIX_FMT_SGBRG10,
> -	V4L2_PIX_FMT_SGRBG10,
> -	V4L2_PIX_FMT_SRGGB10,
> -	V4L2_PIX_FMT_SBGGR10ALAW8,
> -	V4L2_PIX_FMT_SGBRG10ALAW8,
> -	V4L2_PIX_FMT_SGRBG10ALAW8,
> -	V4L2_PIX_FMT_SRGGB10ALAW8,
> -	V4L2_PIX_FMT_SBGGR10DPCM8,
> -	V4L2_PIX_FMT_SGBRG10DPCM8,
> -	V4L2_PIX_FMT_SGRBG10DPCM8,
> -	V4L2_PIX_FMT_SRGGB10DPCM8,
> -	V4L2_PIX_FMT_SBGGR12,
> -	V4L2_PIX_FMT_SGBRG12,
> -	V4L2_PIX_FMT_SGRBG12,
> -	V4L2_PIX_FMT_SRGGB12,
> -};
> -
>  struct vimc_cap_device {
>  	struct vimc_ent_device ved;
>  	struct video_device vdev;
> @@ -117,25 +91,29 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
>  				    struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format *format = &f->fmt.pix;
> +	const struct vimc_pix_map *vpix;
>  
>  	format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
>  				VIMC_FRAME_MAX_WIDTH) & ~1;
>  	format->height = clamp_t(u32, format->height, VIMC_FRAME_MIN_HEIGHT,
>  				 VIMC_FRAME_MAX_HEIGHT) & ~1;
>  
> -	vimc_colorimetry_clamp(format);
> +	/* Don't accept a pixelformat that is not on the table */
> +	vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
> +	if (!vpix) {
> +		format->pixelformat = fmt_default.pixelformat;
> +		vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
> +	}
> +	/* TODO: Add support for custom bytesperline values */
> +	format->bytesperline = format->width * vpix->bpp;
> +	format->sizeimage = format->bytesperline * format->height;
>  
>  	if (format->field == V4L2_FIELD_ANY)
>  		format->field = fmt_default.field;
>  
> -	/* TODO: Add support for custom bytesperline values */
> -
> -	/* Don't accept a pixelformat that is not on the table */
> -	if (!v4l2_format_info(format->pixelformat))
> -		format->pixelformat = fmt_default.pixelformat;
> +	vimc_colorimetry_clamp(format);
>  
> -	return v4l2_fill_pixfmt(format, format->pixelformat,
> -				format->width, format->height);
> +	return 0;
>  }
>  
>  static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
> @@ -174,31 +152,27 @@ static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
>  static int vimc_cap_enum_fmt_vid_cap(struct file *file, void *priv,
>  				     struct v4l2_fmtdesc *f)
>  {
> -	if (f->index >= ARRAY_SIZE(vimc_cap_supported_pixfmt))
> +	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(f->index);
> +
> +	if (!vpix)
>  		return -EINVAL;
>  
> -	f->pixelformat = vimc_cap_supported_pixfmt[f->index];
> +	f->pixelformat = vpix->pixelformat;
>  
>  	return 0;
>  }
>  
> -static bool vimc_cap_is_pixfmt_supported(u32 pixelformat)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(vimc_cap_supported_pixfmt); i++)
> -		if (vimc_cap_supported_pixfmt[i] == pixelformat)
> -			return true;
> -	return false;
> -}
> -
>  static int vimc_cap_enum_framesizes(struct file *file, void *fh,
>  				    struct v4l2_frmsizeenum *fsize)
>  {
> +	const struct vimc_pix_map *vpix;
> +
>  	if (fsize->index)
>  		return -EINVAL;
>  
> -	if (!vimc_cap_is_pixfmt_supported(fsize->pixel_format))
> +	/* Only accept code in the pix map table */
> +	vpix = vimc_pix_map_by_code(fsize->pixel_format);
> +	if (!vpix)
>  		return -EINVAL;
>  
>  	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
> @@ -272,7 +246,6 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
>  		return ret;
>  	}
>  
> -	vcap->stream.producer_pixfmt = vcap->format.pixelformat;
>  	ret = vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 1);
>  	if (ret) {
>  		media_pipeline_stop(entity);
> @@ -423,6 +396,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>  {
>  	struct v4l2_device *v4l2_dev = master_data;
>  	struct vimc_platform_data *pdata = comp->platform_data;
> +	const struct vimc_pix_map *vpix;
>  	struct vimc_cap_device *vcap;
>  	struct video_device *vdev;
>  	struct vb2_queue *q;
> @@ -477,8 +451,10 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>  
>  	/* Set default frame format */
>  	vcap->format = fmt_default;
> -	v4l2_fill_pixfmt(&vcap->format, vcap->format.pixelformat,
> -			 vcap->format.width, vcap->format.height);
> +	vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
> +	vcap->format.bytesperline = vcap->format.width * vpix->bpp;
> +	vcap->format.sizeimage = vcap->format.bytesperline *
> +				 vcap->format.height;
>  
>  	/* Fill the vimc_ent_device struct */
>  	vcap->ved.ent = &vcap->vdev.entity;
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index 03016f204d05..7e1ae0b12f1e 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -10,139 +10,192 @@
>  
>  #include "vimc-common.h"
>  
> -static const __u32 vimc_mbus_list[] = {
> -	MEDIA_BUS_FMT_FIXED,
> -	MEDIA_BUS_FMT_RGB444_1X12,
> -	MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE,
> -	MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE,
> -	MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE,
> -	MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE,
> -	MEDIA_BUS_FMT_RGB565_1X16,
> -	MEDIA_BUS_FMT_BGR565_2X8_BE,
> -	MEDIA_BUS_FMT_BGR565_2X8_LE,
> -	MEDIA_BUS_FMT_RGB565_2X8_BE,
> -	MEDIA_BUS_FMT_RGB565_2X8_LE,
> -	MEDIA_BUS_FMT_RGB666_1X18,
> -	MEDIA_BUS_FMT_RBG888_1X24,
> -	MEDIA_BUS_FMT_RGB666_1X24_CPADHI,
> -	MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> -	MEDIA_BUS_FMT_BGR888_1X24,
> -	MEDIA_BUS_FMT_GBR888_1X24,
> -	MEDIA_BUS_FMT_RGB888_1X24,
> -	MEDIA_BUS_FMT_RGB888_2X12_BE,
> -	MEDIA_BUS_FMT_RGB888_2X12_LE,
> -	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> -	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> -	MEDIA_BUS_FMT_ARGB8888_1X32,
> -	MEDIA_BUS_FMT_RGB888_1X32_PADHI,
> -	MEDIA_BUS_FMT_RGB101010_1X30,
> -	MEDIA_BUS_FMT_RGB121212_1X36,
> -	MEDIA_BUS_FMT_RGB161616_1X48,
> -	MEDIA_BUS_FMT_Y8_1X8,
> -	MEDIA_BUS_FMT_UV8_1X8,
> -	MEDIA_BUS_FMT_UYVY8_1_5X8,
> -	MEDIA_BUS_FMT_VYUY8_1_5X8,
> -	MEDIA_BUS_FMT_YUYV8_1_5X8,
> -	MEDIA_BUS_FMT_YVYU8_1_5X8,
> -	MEDIA_BUS_FMT_UYVY8_2X8,
> -	MEDIA_BUS_FMT_VYUY8_2X8,
> -	MEDIA_BUS_FMT_YUYV8_2X8,
> -	MEDIA_BUS_FMT_YVYU8_2X8,
> -	MEDIA_BUS_FMT_Y10_1X10,
> -	MEDIA_BUS_FMT_Y10_2X8_PADHI_LE,
> -	MEDIA_BUS_FMT_UYVY10_2X10,
> -	MEDIA_BUS_FMT_VYUY10_2X10,
> -	MEDIA_BUS_FMT_YUYV10_2X10,
> -	MEDIA_BUS_FMT_YVYU10_2X10,
> -	MEDIA_BUS_FMT_Y12_1X12,
> -	MEDIA_BUS_FMT_UYVY12_2X12,
> -	MEDIA_BUS_FMT_VYUY12_2X12,
> -	MEDIA_BUS_FMT_YUYV12_2X12,
> -	MEDIA_BUS_FMT_YVYU12_2X12,
> -	MEDIA_BUS_FMT_UYVY8_1X16,
> -	MEDIA_BUS_FMT_VYUY8_1X16,
> -	MEDIA_BUS_FMT_YUYV8_1X16,
> -	MEDIA_BUS_FMT_YVYU8_1X16,
> -	MEDIA_BUS_FMT_YDYUYDYV8_1X16,
> -	MEDIA_BUS_FMT_UYVY10_1X20,
> -	MEDIA_BUS_FMT_VYUY10_1X20,
> -	MEDIA_BUS_FMT_YUYV10_1X20,
> -	MEDIA_BUS_FMT_YVYU10_1X20,
> -	MEDIA_BUS_FMT_VUY8_1X24,
> -	MEDIA_BUS_FMT_YUV8_1X24,
> -	MEDIA_BUS_FMT_UYYVYY8_0_5X24,
> -	MEDIA_BUS_FMT_UYVY12_1X24,
> -	MEDIA_BUS_FMT_VYUY12_1X24,
> -	MEDIA_BUS_FMT_YUYV12_1X24,
> -	MEDIA_BUS_FMT_YVYU12_1X24,
> -	MEDIA_BUS_FMT_YUV10_1X30,
> -	MEDIA_BUS_FMT_UYYVYY10_0_5X30,
> -	MEDIA_BUS_FMT_AYUV8_1X32,
> -	MEDIA_BUS_FMT_UYYVYY12_0_5X36,
> -	MEDIA_BUS_FMT_YUV12_1X36,
> -	MEDIA_BUS_FMT_YUV16_1X48,
> -	MEDIA_BUS_FMT_UYYVYY16_0_5X48,
> -	MEDIA_BUS_FMT_SBGGR8_1X8,
> -	MEDIA_BUS_FMT_SGBRG8_1X8,
> -	MEDIA_BUS_FMT_SGRBG8_1X8,
> -	MEDIA_BUS_FMT_SRGGB8_1X8,
> -	MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8,
> -	MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8,
> -	MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8,
> -	MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8,
> -	MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
> -	MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
> -	MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
> -	MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
> -	MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE,
> -	MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE,
> -	MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE,
> -	MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE,
> -	MEDIA_BUS_FMT_SBGGR10_1X10,
> -	MEDIA_BUS_FMT_SGBRG10_1X10,
> -	MEDIA_BUS_FMT_SGRBG10_1X10,
> -	MEDIA_BUS_FMT_SRGGB10_1X10,
> -	MEDIA_BUS_FMT_SBGGR12_1X12,
> -	MEDIA_BUS_FMT_SGBRG12_1X12,
> -	MEDIA_BUS_FMT_SGRBG12_1X12,
> -	MEDIA_BUS_FMT_SRGGB12_1X12,
> -	MEDIA_BUS_FMT_SBGGR14_1X14,
> -	MEDIA_BUS_FMT_SGBRG14_1X14,
> -	MEDIA_BUS_FMT_SGRBG14_1X14,
> -	MEDIA_BUS_FMT_SRGGB14_1X14,
> -	MEDIA_BUS_FMT_SBGGR16_1X16,
> -	MEDIA_BUS_FMT_SGBRG16_1X16,
> -	MEDIA_BUS_FMT_SGRBG16_1X16,
> -	MEDIA_BUS_FMT_SRGGB16_1X16,
> -	MEDIA_BUS_FMT_JPEG_1X8,
> -	MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8,
> -	MEDIA_BUS_FMT_AHSV8888_1X32,
> +/*
> + * NOTE: non-bayer formats need to come first (necessary for enum_mbus_code
> + * in the scaler)
> + */
> +static const struct vimc_pix_map vimc_pix_map_list[] = {
> +	/* TODO: add all missing formats */
> +
> +	/* RGB formats */
> +	{
> +		.code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.pixelformat = V4L2_PIX_FMT_BGR24,
> +		.bpp = 3,
> +		.bayer = false,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.pixelformat = V4L2_PIX_FMT_RGB24,
> +		.bpp = 3,
> +		.bayer = false,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_ARGB8888_1X32,
> +		.pixelformat = V4L2_PIX_FMT_ARGB32,
> +		.bpp = 4,
> +		.bayer = false,
> +	},
> +
> +	/* Bayer formats */
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.pixelformat = V4L2_PIX_FMT_SBGGR8,
> +		.bpp = 1,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.pixelformat = V4L2_PIX_FMT_SGBRG8,
> +		.bpp = 1,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.pixelformat = V4L2_PIX_FMT_SGRBG8,
> +		.bpp = 1,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.pixelformat = V4L2_PIX_FMT_SRGGB8,
> +		.bpp = 1,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.pixelformat = V4L2_PIX_FMT_SBGGR10,
> +		.bpp = 2,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.pixelformat = V4L2_PIX_FMT_SGBRG10,
> +		.bpp = 2,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.pixelformat = V4L2_PIX_FMT_SGRBG10,
> +		.bpp = 2,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.pixelformat = V4L2_PIX_FMT_SRGGB10,
> +		.bpp = 2,
> +		.bayer = true,
> +	},
> +
> +	/* 10bit raw bayer a-law compressed to 8 bits */
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8,
> +		.pixelformat = V4L2_PIX_FMT_SBGGR10ALAW8,
> +		.bpp = 1,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8,
> +		.pixelformat = V4L2_PIX_FMT_SGBRG10ALAW8,
> +		.bpp = 1,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8,
> +		.pixelformat = V4L2_PIX_FMT_SGRBG10ALAW8,
> +		.bpp = 1,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8,
> +		.pixelformat = V4L2_PIX_FMT_SRGGB10ALAW8,
> +		.bpp = 1,
> +		.bayer = true,
> +	},
> +
> +	/* 10bit raw bayer DPCM compressed to 8 bits */
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
> +		.pixelformat = V4L2_PIX_FMT_SBGGR10DPCM8,
> +		.bpp = 1,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
> +		.pixelformat = V4L2_PIX_FMT_SGBRG10DPCM8,
> +		.bpp = 1,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
> +		.pixelformat = V4L2_PIX_FMT_SGRBG10DPCM8,
> +		.bpp = 1,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
> +		.pixelformat = V4L2_PIX_FMT_SRGGB10DPCM8,
> +		.bpp = 1,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.pixelformat = V4L2_PIX_FMT_SBGGR12,
> +		.bpp = 2,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.pixelformat = V4L2_PIX_FMT_SGBRG12,
> +		.bpp = 2,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.pixelformat = V4L2_PIX_FMT_SGRBG12,
> +		.bpp = 2,
> +		.bayer = true,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.pixelformat = V4L2_PIX_FMT_SRGGB12,
> +		.bpp = 2,
> +		.bayer = true,
> +	},
>  };
>  
> -/* Helper function to check mbus codes */
> -bool vimc_mbus_code_supported(__u32 code)
> +const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i)
> +{
> +	if (i >= ARRAY_SIZE(vimc_pix_map_list))
> +		return NULL;
> +
> +	return &vimc_pix_map_list[i];
> +}
> +EXPORT_SYMBOL_GPL(vimc_pix_map_by_index);
> +
> +const struct vimc_pix_map *vimc_pix_map_by_code(u32 code)
>  {
>  	unsigned int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(vimc_mbus_list); i++)
> -		if (code == vimc_mbus_list[i])
> -			return true;
> -	return false;
> +	for (i = 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
> +		if (vimc_pix_map_list[i].code == code)
> +			return &vimc_pix_map_list[i];
> +	}
> +	return NULL;
>  }
> -EXPORT_SYMBOL_GPL(vimc_mbus_code_supported);
> +EXPORT_SYMBOL_GPL(vimc_pix_map_by_code);
>  
> -/* Helper function to enumerate mbus codes */
> -int vimc_enum_mbus_code(struct v4l2_subdev *sd,
> -			struct v4l2_subdev_pad_config *cfg,
> -			struct v4l2_subdev_mbus_code_enum *code)
> +const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat)
>  {
> -	if (code->index >= ARRAY_SIZE(vimc_mbus_list))
> -		return -EINVAL;
> +	unsigned int i;
>  
> -	code->code = vimc_mbus_list[code->index];
> -	return 0;
> +	for (i = 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
> +		if (vimc_pix_map_list[i].pixelformat == pixelformat)
> +			return &vimc_pix_map_list[i];
> +	}
> +	return NULL;
>  }
> -EXPORT_SYMBOL_GPL(vimc_enum_mbus_code);
> +EXPORT_SYMBOL_GPL(vimc_pix_map_by_pixelformat);
>  
>  /* Helper function to allocate and initialize pads */
>  struct media_pad *vimc_pads_init(u16 num_pads, const unsigned long *pads_flag)
> @@ -214,13 +267,15 @@ static int vimc_get_mbus_format(struct media_pad *pad,
>  							 struct video_device,
>  							 entity);
>  		struct vimc_ent_device *ved = video_get_drvdata(vdev);
> +		const struct vimc_pix_map *vpix;
>  		struct v4l2_pix_format vdev_fmt;
>  
>  		if (!ved->vdev_get_format)
>  			return -ENOIOCTLCMD;
>  
>  		ved->vdev_get_format(ved, &vdev_fmt);
> -		v4l2_fill_mbus_format(&fmt->format, &vdev_fmt, 0);
> +		vpix = vimc_pix_map_by_pixelformat(vdev_fmt.pixelformat);
> +		v4l2_fill_mbus_format(&fmt->format, &vdev_fmt, vpix->code);
>  	} else {
>  		return -EINVAL;
>  	}
> @@ -260,12 +315,8 @@ int vimc_link_validate(struct media_link *link)
>  	/* The width, height and code must match. */
>  	if (source_fmt.format.width != sink_fmt.format.width
>  	    || source_fmt.format.height != sink_fmt.format.height
> -	    || (source_fmt.format.code && sink_fmt.format.code &&
> -		source_fmt.format.code != sink_fmt.format.code)) {
> -		pr_err("vimc: format doesn't match in link %s->%s\n",
> -			link->source->entity->name, link->sink->entity->name);
> +	    || source_fmt.format.code != sink_fmt.format.code)
>  		return -EPIPE;
> -	}
>  
>  	/*
>  	 * The field order must match, or the sink field order must be NONE
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 7b4d988b208b..9c2e0e216c6b 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -12,8 +12,6 @@
>  #include <media/media-device.h>
>  #include <media/v4l2-device.h>
>  
> -#include "vimc-streamer.h"
> -
>  #define VIMC_PDEV_NAME "vimc"
>  
>  /* VIMC-specific controls */
> @@ -69,6 +67,23 @@ struct vimc_platform_data {
>  	char entity_name[32];
>  };
>  
> +/**
> + * struct vimc_pix_map - maps media bus code with v4l2 pixel format
> + *
> + * @code:		media bus format code defined by MEDIA_BUS_FMT_* macros
> + * @bbp:		number of bytes each pixel occupies
> + * @pixelformat:	pixel format devined by V4L2_PIX_FMT_* macros
> + *
> + * Struct which matches the MEDIA_BUS_FMT_* codes with the corresponding
> + * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
> + */
> +struct vimc_pix_map {
> +	unsigned int code;
> +	unsigned int bpp;
> +	u32 pixelformat;
> +	bool bayer;
> +};
> +
>  /**
>   * struct vimc_ent_device - core struct that represents a node in the topology
>   *
> @@ -90,30 +105,12 @@ struct vimc_platform_data {
>  struct vimc_ent_device {
>  	struct media_entity *ent;
>  	struct media_pad *pads;
> -	struct vimc_stream *stream;
>  	void * (*process_frame)(struct vimc_ent_device *ved,
>  				const void *frame);
>  	void (*vdev_get_format)(struct vimc_ent_device *ved,
>  			      struct v4l2_pix_format *fmt);
>  };
>  
> -/**
> - * vimc_mbus_code_supported - helper to check supported mbus codes
> - *
> - * Helper function to check if mbus code is enumerated by vimc_enum_mbus_code()
> - */
> -bool vimc_mbus_code_supported(__u32 code);
> -
> -/**
> - * vimc_enum_mbus_code - enumerate mbus codes
> - *
> - * Helper function to be pluged in .enum_mbus_code from
> - * struct v4l2_subdev_pad_ops.
> - */
> -int vimc_enum_mbus_code(struct v4l2_subdev *sd,
> -			struct v4l2_subdev_pad_config *cfg,
> -			struct v4l2_subdev_mbus_code_enum *code);
> -
>  /**
>   * vimc_pads_init - initialize pads
>   *
> @@ -148,6 +145,27 @@ static inline void vimc_pads_cleanup(struct media_pad *pads)
>   */
>  int vimc_pipeline_s_stream(struct media_entity *ent, int enable);
>  
> +/**
> + * vimc_pix_map_by_index - get vimc_pix_map struct by its index
> + *
> + * @i:			index of the vimc_pix_map struct in vimc_pix_map_list
> + */
> +const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i);
> +
> +/**
> + * vimc_pix_map_by_code - get vimc_pix_map struct by media bus code
> + *
> + * @code:		media bus format code defined by MEDIA_BUS_FMT_* macros
> + */
> +const struct vimc_pix_map *vimc_pix_map_by_code(u32 code);
> +
> +/**
> + * vimc_pix_map_by_pixelformat - get vimc_pix_map struct by v4l2 pixel format
> + *
> + * @pixelformat:	pixel format devined by V4L2_PIX_FMT_* macros
> + */
> +const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat);
> +
>  /**
>   * vimc_ent_sd_register - initialize and register a subdev node
>   *
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index 72adba6cf892..b72b8385067b 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -16,11 +16,6 @@
>  #include "vimc-common.h"
>  
>  #define VIMC_DEB_DRV_NAME "vimc-debayer"
> -/* This module only supports transforming a bayer format
> - * to V4L2_PIX_FMT_RGB24
> - */
> -#define VIMC_DEB_SRC_PIXFMT V4L2_PIX_FMT_RGB24
> -#define VIMC_DEB_SRC_MBUS_FMT_DEFAULT MEDIA_BUS_FMT_RGB888_1X24
>  
>  static unsigned int deb_mean_win_size = 3;
>  module_param(deb_mean_win_size, uint, 0000);
> @@ -39,7 +34,6 @@ enum vimc_deb_rgb_colors {
>  };
>  
>  struct vimc_deb_pix_map {
> -	u32 pixelformat;
>  	u32 code;
>  	enum vimc_deb_rgb_colors order[2][2];
>  };
> @@ -69,73 +63,61 @@ static const struct v4l2_mbus_framefmt sink_fmt_default = {
>  
>  static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
>  	{
> -		.pixelformat = V4L2_PIX_FMT_SBGGR8,
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.order = { { VIMC_DEB_BLUE, VIMC_DEB_GREEN },
>  			   { VIMC_DEB_GREEN, VIMC_DEB_RED } }
>  	},
>  	{
> -		.pixelformat = V4L2_PIX_FMT_SGBRG8,
>  		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
>  		.order = { { VIMC_DEB_GREEN, VIMC_DEB_BLUE },
>  			   { VIMC_DEB_RED, VIMC_DEB_GREEN } }
>  	},
>  	{
> -		.pixelformat = V4L2_PIX_FMT_SGRBG8,
>  		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
>  		.order = { { VIMC_DEB_GREEN, VIMC_DEB_RED },
>  			   { VIMC_DEB_BLUE, VIMC_DEB_GREEN } }
>  	},
>  	{
> -		.pixelformat = V4L2_PIX_FMT_SRGGB8,
>  		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
>  		.order = { { VIMC_DEB_RED, VIMC_DEB_GREEN },
>  			   { VIMC_DEB_GREEN, VIMC_DEB_BLUE } }
>  	},
>  	{
> -		.pixelformat = V4L2_PIX_FMT_SBGGR10,
>  		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.order = { { VIMC_DEB_BLUE, VIMC_DEB_GREEN },
>  			   { VIMC_DEB_GREEN, VIMC_DEB_RED } }
>  	},
>  	{
> -		.pixelformat = V4L2_PIX_FMT_SGBRG10,
>  		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.order = { { VIMC_DEB_GREEN, VIMC_DEB_BLUE },
>  			   { VIMC_DEB_RED, VIMC_DEB_GREEN } }
>  	},
>  	{
> -		.pixelformat = V4L2_PIX_FMT_SGRBG10,
>  		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.order = { { VIMC_DEB_GREEN, VIMC_DEB_RED },
>  			   { VIMC_DEB_BLUE, VIMC_DEB_GREEN } }
>  	},
>  	{
> -		.pixelformat = V4L2_PIX_FMT_SRGGB10,
>  		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.order = { { VIMC_DEB_RED, VIMC_DEB_GREEN },
>  			   { VIMC_DEB_GREEN, VIMC_DEB_BLUE } }
>  	},
>  	{
> -		.pixelformat = V4L2_PIX_FMT_SBGGR12,
>  		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
>  		.order = { { VIMC_DEB_BLUE, VIMC_DEB_GREEN },
>  			   { VIMC_DEB_GREEN, VIMC_DEB_RED } }
>  	},
>  	{
> -		.pixelformat = V4L2_PIX_FMT_SGBRG12,
>  		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
>  		.order = { { VIMC_DEB_GREEN, VIMC_DEB_BLUE },
>  			   { VIMC_DEB_RED, VIMC_DEB_GREEN } }
>  	},
>  	{
> -		.pixelformat = V4L2_PIX_FMT_SGRBG12,
>  		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
>  		.order = { { VIMC_DEB_GREEN, VIMC_DEB_RED },
>  			   { VIMC_DEB_BLUE, VIMC_DEB_GREEN } }
>  	},
>  	{
> -		.pixelformat = V4L2_PIX_FMT_SRGGB12,
>  		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
>  		.order = { { VIMC_DEB_RED, VIMC_DEB_GREEN },
>  			   { VIMC_DEB_GREEN, VIMC_DEB_BLUE } }
> @@ -176,32 +158,41 @@ static int vimc_deb_enum_mbus_code(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_pad_config *cfg,
>  				   struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	/* For the sink pad we only support codes in the map_list */
> -	if (IS_SINK(code->pad)) {
> +	/* We only support one format for source pads */
> +	if (IS_SRC(code->pad)) {
> +		struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
> +
> +		if (code->index)
> +			return -EINVAL;
> +
> +		code->code = vdeb->src_code;
> +	} else {
>  		if (code->index >= ARRAY_SIZE(vimc_deb_pix_map_list))
>  			return -EINVAL;
>  
>  		code->code = vimc_deb_pix_map_list[code->index].code;
> -		return 0;
>  	}
>  
> -	return vimc_enum_mbus_code(sd, cfg, code);
> +	return 0;
>  }
>  
>  static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
>  				    struct v4l2_subdev_pad_config *cfg,
>  				    struct v4l2_subdev_frame_size_enum *fse)
>  {
> +	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
> +
>  	if (fse->index)
>  		return -EINVAL;
>  
> -	/* For the sink pad we only support codes in the map_list */
>  	if (IS_SINK(fse->pad)) {
>  		const struct vimc_deb_pix_map *vpix =
>  			vimc_deb_pix_map_by_code(fse->code);
>  
>  		if (!vpix)
>  			return -EINVAL;
> +	} else if (fse->code != vdeb->src_code) {
> +		return -EINVAL;
>  	}
>  
>  	fse->min_width = VIMC_FRAME_MIN_WIDTH;
> @@ -257,9 +248,6 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>  	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>  	struct v4l2_mbus_framefmt *sink_fmt;
>  
> -	if (!vimc_mbus_code_supported(fmt->format.code))
> -		fmt->format.code = sink_fmt_default.code;
> -
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		/* Do not change the format while stream is on */
>  		if (vdeb->src_frame)
> @@ -272,11 +260,11 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>  
>  	/*
>  	 * Do not change the format of the source pad,
> -	 * it is propagated from the sink (except for the code)
> +	 * it is propagated from the sink
>  	 */
>  	if (IS_SRC(fmt->pad)) {
> -		vdeb->src_code = fmt->format.code;
>  		fmt->format = *sink_fmt;
> +		/* TODO: Add support for other formats */
>  		fmt->format.code = vdeb->src_code;
>  	} else {
>  		/* Set the new format in the sink pad */
> @@ -308,7 +296,7 @@ static const struct v4l2_subdev_pad_ops vimc_deb_pad_ops = {
>  	.set_fmt		= vimc_deb_set_fmt,
>  };
>  
> -static void vimc_deb_set_rgb_pix_rgb24(struct vimc_deb_device *vdeb,
> +static void vimc_deb_set_rgb_mbus_fmt_rgb888_1x24(struct vimc_deb_device *vdeb,
>  						  unsigned int lin,
>  						  unsigned int col,
>  						  unsigned int rgb[3])
> @@ -325,38 +313,25 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>  
>  	if (enable) {
> -		u32 src_pixelformat = vdeb->ved.stream->producer_pixfmt;
> -		const struct v4l2_format_info *pix_info;
> +		const struct vimc_pix_map *vpix;
>  		unsigned int frame_size;
>  
>  		if (vdeb->src_frame)
>  			return 0;
>  
> -		/* We only support translating bayer to RGB24 */
> -		if (src_pixelformat != V4L2_PIX_FMT_RGB24) {
> -			dev_err(vdeb->dev,
> -				"translating to pixfmt (0x%08x) is not supported\n",
> -				src_pixelformat);
> -			return -EINVAL;
> -		}
> +		/* Calculate the frame size of the source pad */
> +		vpix = vimc_pix_map_by_code(vdeb->src_code);
> +		frame_size = vdeb->sink_fmt.width * vdeb->sink_fmt.height *
> +				vpix->bpp;
> +
> +		/* Save the bytes per pixel of the sink */
> +		vpix = vimc_pix_map_by_code(vdeb->sink_fmt.code);
> +		vdeb->sink_bpp = vpix->bpp;
>  
>  		/* Get the corresponding pixel map from the table */
>  		vdeb->sink_pix_map =
>  			vimc_deb_pix_map_by_code(vdeb->sink_fmt.code);
>  
> -		/* Request bayer format from the pipeline for the sink pad */
> -		vdeb->ved.stream->producer_pixfmt =
> -			vdeb->sink_pix_map->pixelformat;
> -
> -		/* Calculate frame_size of the source */
> -		pix_info = v4l2_format_info(src_pixelformat);
> -		frame_size = vdeb->sink_fmt.width * vdeb->sink_fmt.height *
> -			     pix_info->bpp[0];
> -
> -		/* Get bpp from the sink */
> -		pix_info = v4l2_format_info(vdeb->sink_pix_map->pixelformat);
> -		vdeb->sink_bpp = pix_info->bpp[0];
> -
>  		/*
>  		 * Allocate the frame buffer. Use vmalloc to be able to
>  		 * allocate a large amount of memory
> @@ -557,14 +532,14 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
>  
>  	/* Initialize the frame format */
>  	vdeb->sink_fmt = sink_fmt_default;
> -	vdeb->src_code = VIMC_DEB_SRC_MBUS_FMT_DEFAULT;
>  	/*
>  	 * TODO: Add support for more output formats, we only support
> -	 * RGB24 for now.
> +	 * RGB888 for now
>  	 * NOTE: the src format is always the same as the sink, except
>  	 * for the code
>  	 */
> -	vdeb->set_rgb_src = vimc_deb_set_rgb_pix_rgb24;
> +	vdeb->src_code = MEDIA_BUS_FMT_RGB888_1X24;
> +	vdeb->set_rgb_src = vimc_deb_set_rgb_mbus_fmt_rgb888_1x24;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index 5f31c1e351a3..49ab8d9dd9c9 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -25,12 +25,6 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplier");
>  #define IS_SRC(pad)	(pad)
>  #define MAX_ZOOM	8
>  
> -static const u32 vimc_sca_supported_pixfmt[] = {
> -	V4L2_PIX_FMT_BGR24,
> -	V4L2_PIX_FMT_RGB24,
> -	V4L2_PIX_FMT_ARGB32,
> -};
> -
>  struct vimc_sca_device {
>  	struct vimc_ent_device ved;
>  	struct v4l2_subdev sd;
> @@ -53,16 +47,6 @@ static const struct v4l2_mbus_framefmt sink_fmt_default = {
>  	.colorspace = V4L2_COLORSPACE_DEFAULT,
>  };
>  
> -static bool vimc_sca_is_pixfmt_supported(u32 pixelformat)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(vimc_sca_supported_pixfmt); i++)
> -		if (vimc_sca_supported_pixfmt[i] == pixelformat)
> -			return true;
> -	return false;
> -}
> -
>  static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_pad_config *cfg)
>  {
> @@ -82,13 +66,35 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int vimc_sca_enum_mbus_code(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(code->index);
> +
> +	/* We don't support bayer format */
> +	if (!vpix || vpix->bayer)
> +		return -EINVAL;
> +
> +	code->code = vpix->code;
> +
> +	return 0;
> +}
> +
>  static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
>  				    struct v4l2_subdev_pad_config *cfg,
>  				    struct v4l2_subdev_frame_size_enum *fse)
>  {
> +	const struct vimc_pix_map *vpix;
> +
>  	if (fse->index)
>  		return -EINVAL;
>  
> +	/* Only accept code in the pix map table in non bayer format */
> +	vpix = vimc_pix_map_by_code(fse->code);
> +	if (!vpix || vpix->bayer)
> +		return -EINVAL;
> +
>  	fse->min_width = VIMC_FRAME_MIN_WIDTH;
>  	fse->min_height = VIMC_FRAME_MIN_HEIGHT;
>  
> @@ -125,6 +131,13 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
>  
>  static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
>  {
> +	const struct vimc_pix_map *vpix;
> +
> +	/* Only accept code in the pix map table in non bayer format */
> +	vpix = vimc_pix_map_by_code(fmt->code);
> +	if (!vpix || vpix->bayer)
> +		fmt->code = sink_fmt_default.code;
> +
>  	fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
>  			     VIMC_FRAME_MAX_WIDTH) & ~1;
>  	fmt->height = clamp_t(u32, fmt->height, VIMC_FRAME_MIN_HEIGHT,
> @@ -143,9 +156,6 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
>  	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>  	struct v4l2_mbus_framefmt *sink_fmt;
>  
> -	if (!vimc_mbus_code_supported(fmt->format.code))
> -		fmt->format.code = sink_fmt_default.code;
> -
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		/* Do not change the format while stream is on */
>  		if (vsca->src_frame)
> @@ -188,7 +198,7 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
>  
>  static const struct v4l2_subdev_pad_ops vimc_sca_pad_ops = {
>  	.init_cfg		= vimc_sca_init_cfg,
> -	.enum_mbus_code		= vimc_enum_mbus_code,
> +	.enum_mbus_code		= vimc_sca_enum_mbus_code,
>  	.enum_frame_size	= vimc_sca_enum_frame_size,
>  	.get_fmt		= vimc_sca_get_fmt,
>  	.set_fmt		= vimc_sca_set_fmt,
> @@ -199,22 +209,15 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>  
>  	if (enable) {
> -		u32 pixelformat = vsca->ved.stream->producer_pixfmt;
> -		const struct v4l2_format_info *pix_info;
> +		const struct vimc_pix_map *vpix;
>  		unsigned int frame_size;
>  
>  		if (vsca->src_frame)
>  			return 0;
>  
> -		if (!vimc_sca_is_pixfmt_supported(pixelformat)) {
> -			dev_err(vsca->dev, "pixfmt (0x%08x) is not supported\n",
> -				pixelformat);
> -			return -EINVAL;
> -		}
> -
>  		/* Save the bytes per pixel of the sink */
> -		pix_info = v4l2_format_info(pixelformat);
> -		vsca->bpp = pix_info->bpp[0];
> +		vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
> +		vsca->bpp = vpix->bpp;
>  
>  		/* Calculate the width in bytes of the src frame */
>  		vsca->src_line_size = vsca->sink_fmt.width *
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index c47454cc7f70..6c53b9fc1617 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
> @@ -55,13 +55,34 @@ static int vimc_sen_init_cfg(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int vimc_sen_enum_mbus_code(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(code->index);
> +
> +	if (!vpix)
> +		return -EINVAL;
> +
> +	code->code = vpix->code;
> +
> +	return 0;
> +}
> +
>  static int vimc_sen_enum_frame_size(struct v4l2_subdev *sd,
>  				    struct v4l2_subdev_pad_config *cfg,
>  				    struct v4l2_subdev_frame_size_enum *fse)
>  {
> +	const struct vimc_pix_map *vpix;
> +
>  	if (fse->index)
>  		return -EINVAL;
>  
> +	/* Only accept code in the pix map table */
> +	vpix = vimc_pix_map_by_code(fse->code);
> +	if (!vpix)
> +		return -EINVAL;
> +
>  	fse->min_width = VIMC_FRAME_MIN_WIDTH;
>  	fse->max_width = VIMC_FRAME_MAX_WIDTH;
>  	fse->min_height = VIMC_FRAME_MIN_HEIGHT;
> @@ -86,17 +107,14 @@ static int vimc_sen_get_fmt(struct v4l2_subdev *sd,
>  
>  static void vimc_sen_tpg_s_format(struct vimc_sen_device *vsen)
>  {
> -	u32 pixelformat = vsen->ved.stream->producer_pixfmt;
> -	const struct v4l2_format_info *pix_info;
> -
> -	pix_info = v4l2_format_info(pixelformat);
> +	const struct vimc_pix_map *vpix =
> +				vimc_pix_map_by_code(vsen->mbus_format.code);
>  
>  	tpg_reset_source(&vsen->tpg, vsen->mbus_format.width,
>  			 vsen->mbus_format.height, vsen->mbus_format.field);
> -	tpg_s_bytesperline(&vsen->tpg, 0,
> -			   vsen->mbus_format.width * pix_info->bpp[0]);
> +	tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width * vpix->bpp);
>  	tpg_s_buf_height(&vsen->tpg, vsen->mbus_format.height);
> -	tpg_s_fourcc(&vsen->tpg, pixelformat);
> +	tpg_s_fourcc(&vsen->tpg, vpix->pixelformat);
>  	/* TODO: add support for V4L2_FIELD_ALTERNATE */
>  	tpg_s_field(&vsen->tpg, vsen->mbus_format.field, false);
>  	tpg_s_colorspace(&vsen->tpg, vsen->mbus_format.colorspace);
> @@ -107,6 +125,13 @@ static void vimc_sen_tpg_s_format(struct vimc_sen_device *vsen)
>  
>  static void vimc_sen_adjust_fmt(struct v4l2_mbus_framefmt *fmt)
>  {
> +	const struct vimc_pix_map *vpix;
> +
> +	/* Only accept code in the pix map table */
> +	vpix = vimc_pix_map_by_code(fmt->code);
> +	if (!vpix)
> +		fmt->code = fmt_default.code;
> +
>  	fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
>  			     VIMC_FRAME_MAX_WIDTH) & ~1;
>  	fmt->height = clamp_t(u32, fmt->height, VIMC_FRAME_MIN_HEIGHT,
> @@ -126,9 +151,6 @@ static int vimc_sen_set_fmt(struct v4l2_subdev *sd,
>  	struct vimc_sen_device *vsen = v4l2_get_subdevdata(sd);
>  	struct v4l2_mbus_framefmt *mf;
>  
> -	if (!vimc_mbus_code_supported(fmt->format.code))
> -		fmt->format.code = fmt_default.code;
> -
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		/* Do not change the format while stream is on */
>  		if (vsen->frame)
> @@ -161,7 +183,7 @@ static int vimc_sen_set_fmt(struct v4l2_subdev *sd,
>  
>  static const struct v4l2_subdev_pad_ops vimc_sen_pad_ops = {
>  	.init_cfg		= vimc_sen_init_cfg,
> -	.enum_mbus_code		= vimc_enum_mbus_code,
> +	.enum_mbus_code		= vimc_sen_enum_mbus_code,
>  	.enum_frame_size	= vimc_sen_enum_frame_size,
>  	.get_fmt		= vimc_sen_get_fmt,
>  	.set_fmt		= vimc_sen_set_fmt,
> @@ -183,8 +205,7 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>  				container_of(sd, struct vimc_sen_device, sd);
>  
>  	if (enable) {
> -		u32 pixelformat = vsen->ved.stream->producer_pixfmt;
> -		const struct v4l2_format_info *pix_info;
> +		const struct vimc_pix_map *vpix;
>  		unsigned int frame_size;
>  
>  		if (vsen->kthread_sen)
> @@ -192,8 +213,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>  			return 0;
>  
>  		/* Calculate the frame size */
> -		pix_info = v4l2_format_info(pixelformat);
> -		frame_size = vsen->mbus_format.width * pix_info->bpp[0] *
> +		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
> +		frame_size = vsen->mbus_format.width * vpix->bpp *
>  			     vsen->mbus_format.height;
>  
>  		/*
> diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
> index 3b3f36357a0e..382797e5dd21 100644
> --- a/drivers/media/platform/vimc/vimc-streamer.c
> +++ b/drivers/media/platform/vimc/vimc-streamer.c
> @@ -52,7 +52,6 @@ static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
>  	while (stream->pipe_size) {
>  		stream->pipe_size--;
>  		ved = stream->ved_pipeline[stream->pipe_size];
> -		ved->stream = NULL;
>  		stream->ved_pipeline[stream->pipe_size] = NULL;
>  
>  		if (!is_media_entity_v4l2_subdev(ved->ent))
> @@ -88,7 +87,6 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>  			return -EINVAL;
>  		}
>  		stream->ved_pipeline[stream->pipe_size++] = ved;
> -		ved->stream = stream;
>  
>  		if (is_media_entity_v4l2_subdev(ved->ent)) {
>  			sd = media_entity_to_v4l2_subdev(ved->ent);
> diff --git a/drivers/media/platform/vimc/vimc-streamer.h b/drivers/media/platform/vimc/vimc-streamer.h
> index 2b3667408794..a7c5ac5ace4f 100644
> --- a/drivers/media/platform/vimc/vimc-streamer.h
> +++ b/drivers/media/platform/vimc/vimc-streamer.h
> @@ -25,11 +25,6 @@
>   * processed in the pipeline.
>   * @pipe_size:		size of @ved_pipeline
>   * @kthread:		thread that generates the frames of the stream.
> - * @producer_pixfmt:	the pixel format requested from the pipeline. This must
> - * be set just before calling vimc_streamer_s_stream(ent, 1). This value is
> - * propagated up to the source of the base image (usually a sensor node) and
> - * can be modified by entities during s_stream callback to request a different
> - * format from rest of the pipeline.
>   *
>   * When the user call stream_on in a video device, struct vimc_stream is
>   * used to keep track of all entities and subdevices that generates and
> @@ -40,7 +35,6 @@ struct vimc_stream {
>  	struct vimc_ent_device *ved_pipeline[VIMC_STREAMER_PIPELINE_MAX_SIZE];
>  	unsigned int pipe_size;
>  	struct task_struct *kthread;
> -	u32 producer_pixfmt;
>  };
>  
>  /**

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C09B83169B1
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 16:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhBJPDx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 10:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbhBJPD3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 10:03:29 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE2AC061756;
        Wed, 10 Feb 2021 07:02:47 -0800 (PST)
Received: from [IPv6:2003:c7:cf1c:ce00:58d3:2ef0:81e3:2560] (p200300c7cf1cce0058d32ef081e32560.dip0.t-ipconnect.de [IPv6:2003:c7:cf1c:ce00:58d3:2ef0:81e3:2560])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 213241F456B4;
        Wed, 10 Feb 2021 15:02:45 +0000 (GMT)
Subject: Re: [RFC PATCH v6 02/11] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        boris.brezillon@collabora.com, hiroh@chromium.org,
        nicolas@ndufresne.ca, Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, stanimir.varbanov@linaro.org,
        tfiga@chromium.org
References: <20210114180738.1758707-1-helen.koike@collabora.com>
 <20210114180738.1758707-3-helen.koike@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <41761a11-d6c8-3016-9262-50c35d5cd886@collabora.com>
Date:   Wed, 10 Feb 2021 16:02:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210114180738.1758707-3-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Am 14.01.21 um 19:07 schrieb Helen Koike:
> This is part of the multiplanar and singleplanar unification process.
> v4l2_ext_pix_format is supposed to work for both cases.
> 
> We also add the concept of modifiers already employed in DRM to expose
> HW-specific formats (like tiled or compressed formats) and allow
> exchanging this information with the DRM subsystem in a consistent way.
> 
> Note that only V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] are accepted in
> v4l2_ext_format, other types will be rejected if you use the
> {G,S,TRY}_EXT_PIX_FMT ioctls.
> 
> New hooks have been added to v4l2_ioctl_ops to support those new ioctls
> in drivers, but, in the meantime, the core takes care of converting
> {S,G,TRY}_EXT_PIX_FMT requests into {S,G,TRY}_FMT so that old drivers can
> still work if the userspace app/lib uses the new ioctls.
> 
> The conversion is also done the other around to allow userspace
> apps/libs using {S,G,TRY}_FMT to work with drivers implementing the
> _ext_ hooks.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> 
> Changes in v6:
>   The main change here was fixing the conversion, so planes reflects color planes,
>   and to implement this properly I made major refactors compared to the previous
>   version.
> - struct v4l2_plane_ext_pix_format removed, using struct v4l2_plane_pix_format instead (Tomasz)
> - refer to drm_fourcc.h in struct v4l2_ext_pix_format docs (Hans)
> - reorder colorimetry fields in struct v4l2_ext_pix_format (Hans)
> - do not set Ext ioctls as valid for vid_out_overlay (Tomasz)
> - refactor conversion functions, so planes are color planes (Tomasz)
> - Don't explicitly check for e->modifier != 0 in v4l2_ext_pix_format_to_format() (Tomasz)
> - Use "ef" for extended formats in the framework for consistency (Tomasz)
> - Handle xfer_func field in conversions (Tomasz)
> - Zero reserved fields in v4l_s_ext_pix_fmt() and v4l_try_ext_pix_fmt() (Tomasz)
> - Refactor format functions to use v4l_fmt_ioctl_via_ext()
> - Several fixes/refactoring/changes
> - Remove EXT API for touch devices
> 
> Changes in v5:
> - change sizes and reorder fields to avoid holes in the struct and make
>    it the same for 32 and 64 bits
> - removed __attribute__ ((packed)) from uapi structs
> - Fix doc warning from make htmldocs
> - Updated commit message with EXT_PIX prefix for the ioctls.
> 
> Changes in v4:
> - Use v4l2_ext_pix_format directly in the ioctl, drop v4l2_ext_format,
> making V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] the only valid types.
> - Add reserved fields
> - Removed num_planes from struct v4l2_ext_pix_format
> - Removed flag field from struct v4l2_ext_pix_format, since the only
>    defined value is V4L2_PIX_FMT_FLAG_PREMUL_ALPHA only used by vsp1,
>    where we can use modifiers, or add it back later through the reserved
>    bits.
> - In v4l2_ext_format_to_format(), check if modifier is != MOD_LINEAR &&
>    != MOD_INVALID
> - Fix type assignment in v4l_g_fmt_ext_pix()
> - Rebased on top of media/master (post 5.8-rc1)
> 
> Changes in v3:
> - Rebased on top of media/master (post 5.4-rc1)
> 
> Changes in v2:
> - Move the modifier in v4l2_ext_format (was formerly placed in
>    v4l2_ext_plane)
> - Fix a few bugs in the converters and add a strict parameter to
>    allow conversion of uninitialized/mis-initialized objects
> ---
>   drivers/media/v4l2-core/v4l2-dev.c   |  27 +-
>   drivers/media/v4l2-core/v4l2-ioctl.c | 538 +++++++++++++++++++++++++--
>   include/media/v4l2-ioctl.h           |  28 ++
>   include/uapi/linux/videodev2.h       |  41 ++
>   4 files changed, 602 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index f9cff033d0dc..5add58cb6d45 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -608,27 +608,42 @@ static void determine_valid_ioctls(struct video_device *vdev)
>   			       ops->vidioc_enum_fmt_vid_overlay)) ||
>   		    (is_tx && ops->vidioc_enum_fmt_vid_out))
>   			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
> +		if ((is_rx && ops->vidioc_g_fmt_vid_overlay) ||
> +		    (is_tx && ops->vidioc_g_fmt_vid_out_overlay))
> +			 set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
>   		if ((is_rx && (ops->vidioc_g_fmt_vid_cap ||
>   			       ops->vidioc_g_fmt_vid_cap_mplane ||
> -			       ops->vidioc_g_fmt_vid_overlay)) ||
> +			       ops->vidioc_g_ext_pix_fmt_vid_cap)) ||
>   		    (is_tx && (ops->vidioc_g_fmt_vid_out ||
>   			       ops->vidioc_g_fmt_vid_out_mplane ||
> -			       ops->vidioc_g_fmt_vid_out_overlay)))
> +			       ops->vidioc_g_ext_pix_fmt_vid_out))) {
>   			 set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
> +			 set_bit(_IOC_NR(VIDIOC_G_EXT_PIX_FMT), valid_ioctls);
> +		}
> +		if ((is_rx && ops->vidioc_s_fmt_vid_overlay) ||
> +		    (is_tx && ops->vidioc_s_fmt_vid_out_overlay))
> +			 set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
>   		if ((is_rx && (ops->vidioc_s_fmt_vid_cap ||
>   			       ops->vidioc_s_fmt_vid_cap_mplane ||
> -			       ops->vidioc_s_fmt_vid_overlay)) ||
> +			       ops->vidioc_s_ext_pix_fmt_vid_cap)) ||
>   		    (is_tx && (ops->vidioc_s_fmt_vid_out ||
>   			       ops->vidioc_s_fmt_vid_out_mplane ||
> -			       ops->vidioc_s_fmt_vid_out_overlay)))
> +			       ops->vidioc_s_ext_pix_fmt_vid_out))) {
>   			 set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
> +			 set_bit(_IOC_NR(VIDIOC_S_EXT_PIX_FMT), valid_ioctls);
> +		}
> +		if ((is_rx && ops->vidioc_try_fmt_vid_overlay) ||
> +		    (is_tx && ops->vidioc_try_fmt_vid_out_overlay))
> +			 set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
>   		if ((is_rx && (ops->vidioc_try_fmt_vid_cap ||
>   			       ops->vidioc_try_fmt_vid_cap_mplane ||
> -			       ops->vidioc_try_fmt_vid_overlay)) ||
> +			       ops->vidioc_try_ext_pix_fmt_vid_cap)) ||
>   		    (is_tx && (ops->vidioc_try_fmt_vid_out ||
>   			       ops->vidioc_try_fmt_vid_out_mplane ||
> -			       ops->vidioc_try_fmt_vid_out_overlay)))
> +			       ops->vidioc_try_ext_pix_fmt_vid_out))) {
>   			 set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
> +			 set_bit(_IOC_NR(VIDIOC_TRY_EXT_PIX_FMT), valid_ioctls);
> +		}
>   		SET_VALID_IOCTL(ops, VIDIOC_OVERLAY, vidioc_overlay);
>   		SET_VALID_IOCTL(ops, VIDIOC_G_FBUF, vidioc_g_fbuf);
>   		SET_VALID_IOCTL(ops, VIDIOC_S_FBUF, vidioc_s_fbuf);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 848286a284f6..a9c07c0a73ec 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -18,6 +18,8 @@
>   
>   #include <linux/videodev2.h>
>   
> +#include <drm/drm_fourcc.h>
> +
>   #include <media/v4l2-common.h>
>   #include <media/v4l2-ioctl.h>
>   #include <media/v4l2-ctrls.h>
> @@ -38,6 +40,11 @@
>   
>   #define is_valid_ioctl(vfd, cmd) test_bit(_IOC_NR(cmd), (vfd)->valid_ioctls)
>   
> +#define V4L2_IS_CAP_MULTIPLANAR(vdev)	(vdev->device_caps & \
> +					 (V4L2_CAP_VIDEO_CAPTURE_MPLANE | \
> +					 V4L2_CAP_VIDEO_OUTPUT_MPLANE | \
> +					 V4L2_CAP_VIDEO_M2M_MPLANE))
> +
>   struct std_descr {
>   	v4l2_std_id std;
>   	const char *descr;
> @@ -379,6 +386,27 @@ static void v4l_print_format(const void *arg, bool write_only)
>   	}
>   }
>   
> +static void v4l_print_ext_pix_format(const void *arg, bool write_only)
> +{
> +	const struct v4l2_ext_pix_format *ef = arg;
> +	unsigned int i;
> +
> +	pr_cont("type=%s, width=%u, height=%u, format=%c%c%c%c, modifier %llx, field=%s, colorspace=%d, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
> +		prt_names(ef->type, v4l2_type_names),
> +		ef->width, ef->height,
> +		(ef->pixelformat & 0xff),
> +		(ef->pixelformat >>  8) & 0xff,
> +		(ef->pixelformat >> 16) & 0xff,
> +		(ef->pixelformat >> 24) & 0xff,
> +		ef->modifier, prt_names(ef->field, v4l2_field_names),
> +		ef->colorspace, ef->ycbcr_enc,
> +		ef->quantization, ef->xfer_func);
> +	for (i = 0; i < VIDEO_MAX_PLANES && ef->plane_fmt[i].sizeimage; i++)
> +		pr_debug("plane %u: bytesperline=%u sizeimage=%u\n",
> +			 i, ef->plane_fmt[i].bytesperline,
> +			 ef->plane_fmt[i].sizeimage);
> +}
> +
>   static void v4l_print_framebuffer(const void *arg, bool write_only)
>   {
>   	const struct v4l2_framebuffer *p = arg;
> @@ -963,11 +991,15 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>   	switch (type) {
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>   		if ((is_vid || is_tch) && is_rx &&
> -		    (ops->vidioc_g_fmt_vid_cap || ops->vidioc_g_fmt_vid_cap_mplane))
> +		    (ops->vidioc_g_fmt_vid_cap ||
> +		     ops->vidioc_g_ext_pix_fmt_vid_cap ||
> +		     ops->vidioc_g_fmt_vid_cap_mplane))
>   			return 0;
>   		break;
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if ((is_vid || is_tch) && is_rx && ops->vidioc_g_fmt_vid_cap_mplane)
> +		if ((is_vid || is_tch) && is_rx &&
> +		    (ops->vidioc_g_fmt_vid_cap_mplane ||
> +		     ops->vidioc_g_ext_pix_fmt_vid_cap))
>   			return 0;
>   		break;
>   	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
> @@ -976,11 +1008,15 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>   		break;
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>   		if (is_vid && is_tx &&
> -		    (ops->vidioc_g_fmt_vid_out || ops->vidioc_g_fmt_vid_out_mplane))
> +		    (ops->vidioc_g_fmt_vid_out ||
> +		     ops->vidioc_g_ext_pix_fmt_vid_out ||
> +		     ops->vidioc_g_fmt_vid_out_mplane))
>   			return 0;
>   		break;
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		if (is_vid && is_tx && ops->vidioc_g_fmt_vid_out_mplane)
> +		if (is_vid && is_tx &&
> +		    (ops->vidioc_g_ext_pix_fmt_vid_out ||
> +		     ops->vidioc_g_fmt_vid_out_mplane))
>   			return 0;
>   		break;
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
> @@ -1060,6 +1096,204 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
>   	       sizeof(fmt->fmt.pix) - offset);
>   }
>   
> +static void
> +v4l2_ext_pix_format_to_pix_format(const struct v4l2_ext_pix_format *ef,
> +				  struct v4l2_pix_format *pix)
> +{
> +	unsigned int i;
> +
> +	pix->width = ef->width;
> +	pix->height = ef->height;
> +	pix->field = ef->field;
> +	pix->flags = V4L2_PIX_FMT_FLAG_SET_CSC;
> +	pix->colorspace = ef->colorspace;
> +	pix->ycbcr_enc = ef->ycbcr_enc;
> +	pix->priv = V4L2_PIX_FMT_PRIV_MAGIC;
> +	pix->quantization = ef->quantization;
> +	pix->pixelformat = ef->pixelformat;
> +	pix->bytesperline = ef->plane_fmt[0].bytesperline;
> +	pix->sizeimage = ef->plane_fmt[0].sizeimage;
> +	for (i = 1; i < VIDEO_MAX_PLANES && ef->plane_fmt[i].sizeimage; i++)
> +		pix->sizeimage += ef->plane_fmt[i].sizeimage;
> +}
> +
> +static void
> +v4l2_ext_pix_format_to_pix_mp_format(const struct v4l2_ext_pix_format *ef,
> +				     struct v4l2_pix_format_mplane *pix_mp)
> +{
> +	const struct v4l2_format_info *info =
> +					v4l2_format_info(ef->pixelformat);
> +	unsigned int i;
> +
> +	pix_mp->width = ef->width;
> +	pix_mp->height = ef->height;
> +	pix_mp->field = ef->field;
> +	pix_mp->flags = V4L2_PIX_FMT_FLAG_SET_CSC;
> +	pix_mp->colorspace = ef->colorspace;
> +	pix_mp->ycbcr_enc = ef->ycbcr_enc;
> +	pix_mp->quantization = ef->quantization;
> +	pix_mp->pixelformat = ef->pixelformat;
> +
> +	/* This is true when converting to non-M-variant */
> +	if (info && info->mem_planes == 1) {
> +		pix_mp->plane_fmt[0] = ef->plane_fmt[0];
> +		pix_mp->num_planes = 1;
> +		for (i = 1; i < VIDEO_MAX_PLANES && ef->plane_fmt[i].sizeimage; i++)
> +			pix_mp->plane_fmt[0].sizeimage += ef->plane_fmt[i].sizeimage;
> +
> +		return;
> +	}
> +
> +	for (i = 0; i < VIDEO_MAX_PLANES && ef->plane_fmt[i].sizeimage; i++)
> +		pix_mp->plane_fmt[i] = ef->plane_fmt[i];
> +	pix_mp->num_planes = i;
> +}
> +
> +/*
> + * v4l2_ext_pix_format_to_format - convert to v4l2_ext_pix_format to v4l2_format
> + *
> + * @ef: A pointer to struct struct v4l2_ext_pix_format to be converted.
> + * @f: A pointer to struct v4l2_format to be filled.
> + * @is_mplane: Bool indicating if multiplanar API should be used in @f.
> + *
> + * If pixelformat should be converted to M-variant, change ef->pixelformat
> + * to the M-variant before calling this function.
> + */
> +static void v4l2_ext_pix_format_to_format(const struct v4l2_ext_pix_format *ef,
> +					  struct v4l2_format *f, bool is_mplane)
> +{
> +	memset(f, 0, sizeof(*f));
> +
> +	if (ef->modifier != DRM_FORMAT_MOD_LINEAR &&
> +	    ef->modifier != DRM_FORMAT_MOD_INVALID)
> +		pr_warn("Modifiers are not supported in v4l2_format, ignoring %llx\n",
> +			ef->modifier);
> +
> +	if (!is_mplane) {
> +		f->type = ef->type;
> +		v4l2_ext_pix_format_to_pix_format(ef, &f->fmt.pix);
> +		return;
> +	}
> +
> +	if (ef->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	else
> +		f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +
> +	v4l2_ext_pix_format_to_pix_mp_format(ef, &f->fmt.pix_mp);
> +}
> +
> +static void
> +v4l2_pix_format_to_ext_pix_format(const struct v4l2_pix_format *pix,
> +				  struct v4l2_ext_pix_format *ef)
> +{
> +	const struct v4l2_format_info *info =
> +					v4l2_format_info(pix->pixelformat);
> +	unsigned int i;
> +
> +	ef->width = pix->width;
> +	ef->height = pix->height;
> +	ef->field = pix->field;
> +	ef->colorspace = pix->colorspace;
> +	ef->ycbcr_enc = pix->ycbcr_enc;
> +	ef->quantization = pix->quantization;
> +	ef->xfer_func = pix->xfer_func;
> +	if (pix->flags)
> +		pr_warn("Ignoring pixelformat flags 0x%x\n", pix->flags);
> +
> +	/* We assume M-variants won't be used in this function */
> +	ef->pixelformat = pix->pixelformat;
> +
> +	ef->plane_fmt[0].bytesperline = pix->bytesperline;
> +	ef->plane_fmt[0].sizeimage = pix->sizeimage;
> +
> +	if (!info)
> +		return;

What if info is null? It looks like we have a wrong conversion in that case.
Many parts of this patch rellay on 'info' information, maybe we should extend
v4l2_format_info to support all formats?


> +
> +	for (i = 1; i < info->comp_planes; i++) {
> +		ef->plane_fmt[i].bytesperline = pix->bytesperline / info->hdiv;
> +		ef->plane_fmt[i].sizeimage = ef->plane_fmt[i].bytesperline *
> +					     ef->height / info->vdiv;
> +		ef->plane_fmt[0].sizeimage -= ef->plane_fmt[i].sizeimage;
> +	}
> +}
> +
> +static void
> +v4l2_pix_mp_format_to_ext_pix_format(const struct v4l2_pix_format_mplane *pix_mp,
> +				     struct v4l2_ext_pix_format *ef)
> +{
> +	const struct v4l2_format_info *info =
> +					v4l2_format_info(pix_mp->pixelformat);
> +	unsigned int i;
> +
> +	ef->width = pix_mp->width;
> +	ef->height = pix_mp->height;
> +	ef->field = pix_mp->field;
> +	ef->colorspace = pix_mp->colorspace;
> +	ef->ycbcr_enc = pix_mp->ycbcr_enc;
> +	ef->quantization = pix_mp->quantization;
> +	ef->xfer_func = pix_mp->xfer_func;
> +	if (pix_mp->flags)
> +		pr_warn("Ignoring pixelformat flags 0x%x\n", pix_mp->flags);
> +
> +	if (!info)
> +		return;
> +
> +	ef->pixelformat = info && info->norm ?

The code above this line already return if !info so you can replace s/info && info->norm ?/info->norm/

> +			  info->norm : pix_mp->pixelformat;
> +
> +	if (info->comp_planes == info->mem_planes) {
> +		for (i = 0; i < pix_mp->num_planes && i < VIDEO_MAX_PLANES; i++)
> +			ef->plane_fmt[i] = pix_mp->plane_fmt[i];
> +
> +		return;
> +	}
> +
> +	/* case where mem_planes is 1 and comp_planes > 1 */
> +	ef->plane_fmt[0] = pix_mp->plane_fmt[0];
> +	for (i = 1; i < info->comp_planes; i++) {
> +		ef->plane_fmt[i].bytesperline =
> +			pix_mp->plane_fmt[0].bytesperline / info->hdiv;
> +		ef->plane_fmt[i].sizeimage =
> +			ef->plane_fmt[i].bytesperline * ef->height / info->vdiv;
> +		ef->plane_fmt[0].sizeimage -= ef->plane_fmt[i].sizeimage;
> +	}
> +}
> +
> +/*
> + * v4l2_format_to_ext_pix_format - convert to v4l2_format to v4l2_ext_pix_format
> + *
> + * @f: A pointer to struct v4l2_format to be converted.
> + * @ef: A pointer to struct struct v4l2_ext_pix_format to be filled.
> + *
> + * This method normalize the pixelformat to non-M variant.
> + */
> +static void v4l2_format_to_ext_pix_format(const struct v4l2_format *f,
> +					  struct v4l2_ext_pix_format *ef)
> +{
> +	memset(ef, 0, sizeof(*ef));
> +
> +	switch (f->type) {
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +		ef->type = f->type;
> +		v4l2_pix_format_to_ext_pix_format(&f->fmt.pix, ef);
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		ef->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +		v4l2_pix_mp_format_to_ext_pix_format(&f->fmt.pix_mp, ef);
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		ef->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +		v4l2_pix_mp_format_to_ext_pix_format(&f->fmt.pix_mp, ef);
> +		break;
> +	default:
> +		WARN("Converting to Ext Pix Format with wrong buffer type %s\n",
> +		     prt_names(f->type, v4l2_type_names));
> +		break;
> +	}
> +}
> +
>   static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
>   				struct file *file, void *fh, void *arg)
>   {
> @@ -1565,6 +1799,100 @@ static void v4l_pix_format_touch(struct v4l2_pix_format *p)
>   	p->xfer_func = 0;
>   }
>   
> +static int v4l_fmt_ioctl_via_ext(const struct v4l2_ioctl_ops *ops,
> +				 struct file *file, void *fh,
> +				 struct v4l2_format *f,
> +				 unsigned int ioctl)
> +{
> +	bool is_multiplanar = V4L2_TYPE_IS_MULTIPLANAR(f->type);
> +	struct video_device *vdev = video_devdata(file);
> +	struct v4l2_ext_pix_format ef = {0};
> +	u32 original_pixfmt = 0;
> +	u32 cap_mask;
> +	int ret;
> +
> +	if (ioctl != VIDIOC_G_FMT) {
> +		/*
> +		 * If CSC attributes are read only, set them to DEFAULT
> +		 * to avoid changes by the driver.> +		 */
> +		if (is_multiplanar) {
> +			if (!(f->fmt.pix_mp.flags & V4L2_PIX_FMT_FLAG_SET_CSC)) {
> +				f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
> +				f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +				f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
> +				f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +			}
> +			/* Unset the flag to avoid warning in the convertion */

which warning?

> +			f->fmt.pix_mp.flags &= ~V4L2_PIX_FMT_FLAG_SET_CSC;
> +
> +			/* Save pixelformat in case M-variant is being used */
> +			original_pixfmt = f->fmt.pix_mp.pixelformat;
> +		} else {
> +			if (!(f->fmt.pix.flags & V4L2_PIX_FMT_FLAG_SET_CSC)) {
> +				f->fmt.pix.colorspace = V4L2_COLORSPACE_DEFAULT;
> +				f->fmt.pix.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +				f->fmt.pix.quantization = V4L2_QUANTIZATION_DEFAULT;
> +				f->fmt.pix.xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +			}
> +			/* Unset the flag to avoid warning in the convertion */
> +			f->fmt.pix.flags &= ~V4L2_PIX_FMT_FLAG_SET_CSC;
> +		}

I don't think there is a need to do this CSC adjustment. If the CSC flag
is not set then drivers should ignore the colorspace,ycbcr_enc,quantizaion,xfer_func anyway.

> +		v4l2_format_to_ext_pix_format(f, &ef);
> +	}
> +
> +	switch (f->type) {
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		cap_mask = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> +			   V4L2_CAP_VIDEO_M2M_MPLANE;
> +		if (!!(vdev->device_caps & cap_mask) !=
> +		    (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE))

This function is called if a driver supports the Ext API right?
In that case shouldn't "vdev->device_caps & cap_mask" always be non-zero here?

> +			return -EINVAL;
> +
> +		ef.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +		if (ioctl == VIDIOC_G_FMT)
> +			ret = ops->vidioc_g_ext_pix_fmt_vid_cap(file, fh, &ef);
> +		else if (ioctl == VIDIOC_S_FMT)
> +			ret = ops->vidioc_s_ext_pix_fmt_vid_cap(file, fh, &ef);
> +		else
> +			ret = ops->vidioc_try_ext_pix_fmt_vid_cap(file, fh,
> +								  &ef);
> +		break;
> +
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		cap_mask = V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> +			   V4L2_CAP_VIDEO_M2M_MPLANE;
> +		if (!!(vdev->device_caps & cap_mask) !=

dito

> +		    (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
> +			return -EINVAL;
> +
> +		ef.type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +		if (ioctl == VIDIOC_G_FMT)
> +			ret = ops->vidioc_g_ext_pix_fmt_vid_out(file, fh, &ef);
> +		else if (ioctl == VIDIOC_S_FMT)
> +			ret = ops->vidioc_s_ext_pix_fmt_vid_out(file, fh, &ef);
> +		else
> +			ret = ops->vidioc_try_ext_pix_fmt_vid_out(file, fh,
> +								  &ef);
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	if (original_pixfmt != ef.pixelformat &&
> +	    v4l2_format_info(original_pixfmt))
> +		ef.pixelformat = original_pixfmt;

original_pixfmt is set only for multiplaner, so it looks like this line might set ef.pixelformat to 0.


> +
> +	v4l2_ext_pix_format_to_format(&ef, f, is_multiplanar);
> +	return 0;
> +}
> +
>   static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>   				struct file *file, void *fh, void *arg)
>   {
> @@ -1601,17 +1929,26 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>   
>   	switch (p->type) {
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> -		if (unlikely(!ops->vidioc_g_fmt_vid_cap))
> +		if (unlikely(!ops->vidioc_g_fmt_vid_cap &&
> +			     !ops->vidioc_g_ext_pix_fmt_vid_cap))
>   			break;
>   		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> -		ret = ops->vidioc_g_fmt_vid_cap(file, fh, arg);
> +		ret = ops->vidioc_g_fmt_vid_cap ?
> +		      ops->vidioc_g_fmt_vid_cap(file, fh, arg) :
> +		      v4l_fmt_ioctl_via_ext(ops, file, fh, arg,
> +					    VIDIOC_G_FMT);>   		/* just in case the driver zeroed it again */
>   		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>   		if (vfd->vfl_type == VFL_TYPE_TOUCH)
>   			v4l_pix_format_touch(&p->fmt.pix);
>   		return ret;
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		return ops->vidioc_g_fmt_vid_cap_mplane(file, fh, arg);
> +		if (ops->vidioc_g_fmt_vid_cap_mplane)
> +			return ops->vidioc_g_fmt_vid_cap_mplane(file, fh, arg);
> +		else if (ops->vidioc_g_ext_pix_fmt_vid_cap)
> +			return v4l_fmt_ioctl_via_ext(ops, file, fh, arg,
> +						     VIDIOC_G_FMT);
> +		break;
>   	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>   		return ops->vidioc_g_fmt_vid_overlay(file, fh, arg);
>   	case V4L2_BUF_TYPE_VBI_CAPTURE:
> @@ -1619,15 +1956,23 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>   	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
>   		return ops->vidioc_g_fmt_sliced_vbi_cap(file, fh, arg);
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> -		if (unlikely(!ops->vidioc_g_fmt_vid_out))
> +		if (unlikely(!ops->vidioc_g_fmt_vid_out &&
> +			     !ops->vidioc_g_ext_pix_fmt_vid_out))
>   			break;
>   		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> -		ret = ops->vidioc_g_fmt_vid_out(file, fh, arg);
> +		ret = ops->vidioc_g_fmt_vid_out ?
> +		      ops->vidioc_g_fmt_vid_out(file, fh, arg) :
> +		      v4l_fmt_ioctl_via_ext(ops, file, fh, arg, VIDIOC_G_FMT);
>   		/* just in case the driver zeroed it again */
>   		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>   		return ret;
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		return ops->vidioc_g_fmt_vid_out_mplane(file, fh, arg);
> +		if (ops->vidioc_g_fmt_vid_out_mplane)
> +			return ops->vidioc_g_fmt_vid_out_mplane(file, fh, arg);
> +		else if (ops->vidioc_g_ext_pix_fmt_vid_out)
> +			return v4l_fmt_ioctl_via_ext(ops, file, fh, arg,
> +						     VIDIOC_G_FMT);
> +		break;
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>   		return ops->vidioc_g_fmt_vid_out_overlay(file, fh, arg);
>   	case V4L2_BUF_TYPE_VBI_OUTPUT:
> @@ -1646,6 +1991,42 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>   	return -EINVAL;
>   }
>   
> +static int v4l_g_ext_pix_fmt(const struct v4l2_ioctl_ops *ops,
> +			     struct file *file, void *fh, void *arg)
> +{
> +	struct v4l2_ext_pix_format *ef = arg;
> +	struct v4l2_format f = {
> +		.type = ef->type,
> +	};
> +	int ret = check_fmt(file, ef->type);
> +
> +	if (ret)
> +		return ret;
> +
> +	memset(ef, 0, sizeof(*ef));
> +	ef->type = f.type;
> +
> +	switch (f.type) {
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +		if (ops->vidioc_g_ext_pix_fmt_vid_cap)
> +			return ops->vidioc_g_ext_pix_fmt_vid_cap(file, fh, ef);
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +		if (ops->vidioc_g_ext_pix_fmt_vid_out)
> +			return ops->vidioc_g_ext_pix_fmt_vid_out(file, fh, ef);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l_g_fmt(ops, file, fh, &f);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_format_to_ext_pix_format(&f, ef);
> +	return 0;
> +}
> +
>   static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>   				struct file *file, void *fh, void *arg)
>   {
> @@ -1664,23 +2045,29 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>   
>   	switch (p->type) {
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> -		if (unlikely(!ops->vidioc_s_fmt_vid_cap))
> +		if (unlikely(!ops->vidioc_s_fmt_vid_cap &&
> +			     !ops->vidioc_s_ext_pix_fmt_vid_cap))
>   			break;
>   		CLEAR_AFTER_FIELD(p, fmt.pix);
> -		ret = ops->vidioc_s_fmt_vid_cap(file, fh, arg);
> +		ret = ops->vidioc_s_fmt_vid_cap ?
> +		      ops->vidioc_s_fmt_vid_cap(file, fh, arg) :
> +		      v4l_fmt_ioctl_via_ext(ops, file, fh, arg, VIDIOC_S_FMT);
>   		/* just in case the driver zeroed it again */
>   		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>   		if (vfd->vfl_type == VFL_TYPE_TOUCH)
>   			v4l_pix_format_touch(&p->fmt.pix);
>   		return ret;
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if (unlikely(!ops->vidioc_s_fmt_vid_cap_mplane))
> +		if (unlikely(!ops->vidioc_s_fmt_vid_cap_mplane &&
> +			     !ops->vidioc_s_ext_pix_fmt_vid_cap))
>   			break;
>   		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
>   		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>   			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
>   					  bytesperline);
> -		return ops->vidioc_s_fmt_vid_cap_mplane(file, fh, arg);
> +		return ops->vidioc_s_fmt_vid_cap_mplane ?
> +		       ops->vidioc_s_fmt_vid_cap_mplane(file, fh, arg) :
> +		       v4l_fmt_ioctl_via_ext(ops, file, fh, arg,  VIDIOC_S_FMT);
>   	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>   		if (unlikely(!ops->vidioc_s_fmt_vid_overlay))
>   			break;
> @@ -1697,21 +2084,27 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>   		CLEAR_AFTER_FIELD(p, fmt.sliced.io_size);
>   		return ops->vidioc_s_fmt_sliced_vbi_cap(file, fh, arg);
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> -		if (unlikely(!ops->vidioc_s_fmt_vid_out))
> +		if (unlikely(!ops->vidioc_s_fmt_vid_out &&
> +			     !ops->vidioc_s_ext_pix_fmt_vid_out))
>   			break;
>   		CLEAR_AFTER_FIELD(p, fmt.pix);
> -		ret = ops->vidioc_s_fmt_vid_out(file, fh, arg);
> +		ret = ops->vidioc_s_fmt_vid_out ?
> +		      ops->vidioc_s_fmt_vid_out(file, fh, arg) :
> +		      v4l_fmt_ioctl_via_ext(ops, file, fh, arg, VIDIOC_S_FMT);
>   		/* just in case the driver zeroed it again */
>   		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>   		return ret;
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		if (unlikely(!ops->vidioc_s_fmt_vid_out_mplane))
> +		if (unlikely(!ops->vidioc_s_fmt_vid_out_mplane &&
> +			     !ops->vidioc_s_ext_pix_fmt_vid_out))
>   			break;
>   		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
>   		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>   			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
>   					  bytesperline);
> -		return ops->vidioc_s_fmt_vid_out_mplane(file, fh, arg);
> +		return ops->vidioc_s_fmt_vid_out_mplane ?
> +		       ops->vidioc_s_fmt_vid_out_mplane(file, fh, arg) :
> +		       v4l_fmt_ioctl_via_ext(ops, file, fh, arg, VIDIOC_S_FMT);
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>   		if (unlikely(!ops->vidioc_s_fmt_vid_out_overlay))
>   			break;
> @@ -1751,6 +2144,43 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>   	return -EINVAL;
>   }
>   
> +static int v4l_s_ext_pix_fmt(const struct v4l2_ioctl_ops *ops,
> +			     struct file *file, void *fh, void *arg)
> +{
> +	struct video_device *vfd = video_devdata(file);
> +	struct v4l2_ext_pix_format *ef = arg;
> +	struct v4l2_format f;
> +	int ret = check_fmt(file, ef->type);
> +
> +	if (ret)
> +		return ret;
> +
> +	memset(ef->reserved, 0, sizeof(ef->reserved));
> +
> +	switch (ef->type) {
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +		if (ops->vidioc_s_ext_pix_fmt_vid_cap)
> +			return ops->vidioc_s_ext_pix_fmt_vid_cap(file, fh, ef);
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +		if (ops->vidioc_s_ext_pix_fmt_vid_out)
> +			return ops->vidioc_s_ext_pix_fmt_vid_out(file, fh, ef);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	v4l2_ext_pix_format_to_format(ef, &f, V4L2_IS_CAP_MULTIPLANAR(vfd));
> +
> +	ret = v4l_s_fmt(ops, file, fh, &f);
> +	if (ret)
> +		/* TODO: retry with M-variant of ef->pixelformat? */

I think not, ef->pixelformat is a paramater that comes from userspace right?
Then userspace should set it according to what the driver supports.

> +		return ret;
> +
> +	v4l2_format_to_ext_pix_format(&f, ef);
> +	return 0;
> +}
> +
>   static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>   				struct file *file, void *fh, void *arg)
>   {
> @@ -1766,23 +2196,30 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>   
>   	switch (p->type) {
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> -		if (unlikely(!ops->vidioc_try_fmt_vid_cap))
> +		if (unlikely(!ops->vidioc_try_fmt_vid_cap &&
> +			     !ops->vidioc_try_ext_pix_fmt_vid_cap))
>   			break;
>   		CLEAR_AFTER_FIELD(p, fmt.pix);
> -		ret = ops->vidioc_try_fmt_vid_cap(file, fh, arg);
> +		ret = ops->vidioc_try_fmt_vid_cap ?
> +		      ops->vidioc_try_fmt_vid_cap(file, fh, arg) :
> +		      v4l_fmt_ioctl_via_ext(ops, file, fh, arg, VIDIOC_TRY_FMT);
>   		/* just in case the driver zeroed it again */
>   		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>   		if (vfd->vfl_type == VFL_TYPE_TOUCH)
>   			v4l_pix_format_touch(&p->fmt.pix);
>   		return ret;
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if (unlikely(!ops->vidioc_try_fmt_vid_cap_mplane))
> +		if (unlikely(!ops->vidioc_try_fmt_vid_cap_mplane &&
> +			     !ops->vidioc_try_ext_pix_fmt_vid_cap))
>   			break;
>   		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
>   		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>   			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
>   					  bytesperline);
> -		return ops->vidioc_try_fmt_vid_cap_mplane(file, fh, arg);
> +		return ops->vidioc_try_fmt_vid_cap_mplane ?
> +		       ops->vidioc_try_fmt_vid_cap_mplane(file, fh, arg) :
> +		       v4l_fmt_ioctl_via_ext(ops, file, fh, arg,
> +					     VIDIOC_TRY_FMT);
>   	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>   		if (unlikely(!ops->vidioc_try_fmt_vid_overlay))
>   			break;
> @@ -1799,21 +2236,28 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>   		CLEAR_AFTER_FIELD(p, fmt.sliced.io_size);
>   		return ops->vidioc_try_fmt_sliced_vbi_cap(file, fh, arg);
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> -		if (unlikely(!ops->vidioc_try_fmt_vid_out))
> +		if (unlikely(!ops->vidioc_try_fmt_vid_out &&
> +			     !ops->vidioc_try_ext_pix_fmt_vid_cap))
>   			break;
>   		CLEAR_AFTER_FIELD(p, fmt.pix);
> -		ret = ops->vidioc_try_fmt_vid_out(file, fh, arg);
> +		ret = ops->vidioc_try_fmt_vid_out ?
> +		      ops->vidioc_try_fmt_vid_out(file, fh, arg) :
> +		      v4l_fmt_ioctl_via_ext(ops, file, fh, arg, VIDIOC_TRY_FMT);
>   		/* just in case the driver zeroed it again */
>   		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>   		return ret;
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		if (unlikely(!ops->vidioc_try_fmt_vid_out_mplane))
> +		if (unlikely(!ops->vidioc_try_fmt_vid_out_mplane &&
> +			     !ops->vidioc_try_ext_pix_fmt_vid_cap))
>   			break;
>   		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
>   		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>   			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
>   					  bytesperline);
> -		return ops->vidioc_try_fmt_vid_out_mplane(file, fh, arg);
> +		return ops->vidioc_try_fmt_vid_out_mplane ?
> +		       ops->vidioc_try_fmt_vid_out_mplane(file, fh, arg) :
> +		       v4l_fmt_ioctl_via_ext(ops, file, fh, arg,
> +					     VIDIOC_TRY_FMT);
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>   		if (unlikely(!ops->vidioc_try_fmt_vid_out_overlay))
>   			break;
> @@ -1853,6 +2297,45 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>   	return -EINVAL;
>   }
>   
> +static int v4l_try_ext_pix_fmt(const struct v4l2_ioctl_ops *ops,
> +			       struct file *file, void *fh, void *arg)
> +{
> +	struct video_device *vfd = video_devdata(file);
> +	struct v4l2_ext_pix_format *ef = arg;
> +	struct v4l2_format f;
> +	int ret = check_fmt(file, ef->type);
> +
> +	if (ret)
> +		return ret;
> +
> +	memset(ef->reserved, 0, sizeof(ef->reserved));
> +
> +	switch (ef->type) {
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +		if (ops->vidioc_try_ext_pix_fmt_vid_cap)
> +			return ops->vidioc_try_ext_pix_fmt_vid_cap(file, fh,
> +								   ef);
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +		if (ops->vidioc_try_ext_pix_fmt_vid_out)
> +			return ops->vidioc_try_ext_pix_fmt_vid_out(file, fh,
> +								   ef);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	v4l2_ext_pix_format_to_format(ef, &f, V4L2_IS_CAP_MULTIPLANAR(vfd));
> +
> +	ret = v4l_try_fmt(ops, file, fh, &f);
> +	if (ret)
> +		/* TODO: retry with M-variant of ef->pixelformat? */

dito

> +		return ret;
> +
> +	v4l2_format_to_ext_pix_format(&f, ef);
> +	return 0;
> +}
> +
>   static int v4l_streamon(const struct v4l2_ioctl_ops *ops,
>   				struct file *file, void *fh, void *arg)
>   {
> @@ -2854,6 +3337,9 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>   	IOCTL_INFO(VIDIOC_ENUM_FREQ_BANDS, v4l_enum_freq_bands, v4l_print_freq_band, 0),
>   	IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info, v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match)),
>   	IOCTL_INFO(VIDIOC_QUERY_EXT_CTRL, v4l_query_ext_ctrl, v4l_print_query_ext_ctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_query_ext_ctrl, id)),
> +	IOCTL_INFO(VIDIOC_G_EXT_PIX_FMT, v4l_g_ext_pix_fmt, v4l_print_ext_pix_format, 0),
> +	IOCTL_INFO(VIDIOC_S_EXT_PIX_FMT, v4l_s_ext_pix_fmt, v4l_print_ext_pix_format, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_TRY_EXT_PIX_FMT, v4l_try_ext_pix_fmt, v4l_print_ext_pix_format, 0),
>   };
>   #define V4L2_IOCTLS ARRAY_SIZE(v4l2_ioctls)
>   
> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index edb733f21604..c44708dc9355 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -48,11 +48,17 @@ struct v4l2_fh;
>    * @vidioc_g_fmt_vid_cap: pointer to the function that implements
>    *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video capture
>    *	in single plane mode
> + * @vidioc_g_ext_pix_fmt_vid_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_G_EXT_PIX_FMT <vidioc_g_ext_pix_fmt>` ioctl logic for video
> + *	capture
>    * @vidioc_g_fmt_vid_overlay: pointer to the function that implements
>    *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video overlay
>    * @vidioc_g_fmt_vid_out: pointer to the function that implements
>    *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video out
>    *	in single plane mode
> + * @vidioc_g_ext_pix_fmt_vid_out: pointer to the function that implements
> + *	:ref:`VIDIOC_G_EXT_PIX_FMT <vidioc_g_ext_pix_fmt>` ioctl logic for video
> + *	out
>    * @vidioc_g_fmt_vid_out_overlay: pointer to the function that implements
>    *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video overlay output
>    * @vidioc_g_fmt_vbi_cap: pointer to the function that implements
> @@ -82,11 +88,16 @@ struct v4l2_fh;
>    * @vidioc_s_fmt_vid_cap: pointer to the function that implements
>    *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video capture
>    *	in single plane mode
> + * @vidioc_s_ext_pix_fmt_vid_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_S_EXT_PIX_FMT <vidioc_g_ext_pix_fmt>` ioctl logic for video
> + *	capture
>    * @vidioc_s_fmt_vid_overlay: pointer to the function that implements
>    *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video overlay
>    * @vidioc_s_fmt_vid_out: pointer to the function that implements
>    *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video out
>    *	in single plane mode
> + * @vidioc_s_ext_pix_fmt_vid_out: pointer to the function that implements
> + *	:ref:`VIDIOC_S_EXT_PIX_FMT <vidioc_g_fmt>` ioctl logic for video out

s/vidioc_g_fmt/vidioc_g_ext_pix_fmt/ ?

>    * @vidioc_s_fmt_vid_out_overlay: pointer to the function that implements
>    *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video overlay output
>    * @vidioc_s_fmt_vbi_cap: pointer to the function that implements
> @@ -116,11 +127,16 @@ struct v4l2_fh;
>    * @vidioc_try_fmt_vid_cap: pointer to the function that implements
>    *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video capture
>    *	in single plane mode
> + * @vidioc_try_ext_pix_fmt_vid_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_TRY_EXT_PIX_FMT <vidioc_g_ext_pix_fmt>` ioctl logic for
> +	video capture
>    * @vidioc_try_fmt_vid_overlay: pointer to the function that implements
>    *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video overlay
>    * @vidioc_try_fmt_vid_out: pointer to the function that implements
>    *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video out
>    *	in single plane mode
> + * @vidioc_try_ext_pix_fmt_vid_out: pointer to the function that implements
> + *	:ref:`VIDIOC_TRY_EXT_PIX_FMT <vidioc_g_fmt>` ioctl logic for video out

similar dito

Thanks,
Dafna

>    * @vidioc_try_fmt_vid_out_overlay: pointer to the function that implements
>    *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video overlay
>    *	output
> @@ -319,10 +335,14 @@ struct v4l2_ioctl_ops {
>   	/* VIDIOC_G_FMT handlers */
>   	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
>   				    struct v4l2_format *f);
> +	int (*vidioc_g_ext_pix_fmt_vid_cap)(struct file *file, void *fh,
> +					    struct v4l2_ext_pix_format *ef);
>   	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *fh,
>   					struct v4l2_format *f);
>   	int (*vidioc_g_fmt_vid_out)(struct file *file, void *fh,
>   				    struct v4l2_format *f);
> +	int (*vidioc_g_ext_pix_fmt_vid_out)(struct file *file, void *fh,
> +					    struct v4l2_ext_pix_format *ef);
>   	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *fh,
>   					    struct v4l2_format *f);
>   	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *fh,
> @@ -349,10 +369,14 @@ struct v4l2_ioctl_ops {
>   	/* VIDIOC_S_FMT handlers */
>   	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
>   				    struct v4l2_format *f);
> +	int (*vidioc_s_ext_pix_fmt_vid_cap)(struct file *file, void *fh,
> +					    struct v4l2_ext_pix_format *ef);
>   	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *fh,
>   					struct v4l2_format *f);
>   	int (*vidioc_s_fmt_vid_out)(struct file *file, void *fh,
>   				    struct v4l2_format *f);
> +	int (*vidioc_s_ext_pix_fmt_vid_out)(struct file *file, void *fh,
> +					    struct v4l2_ext_pix_format *ef);
>   	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *fh,
>   					    struct v4l2_format *f);
>   	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *fh,
> @@ -379,10 +403,14 @@ struct v4l2_ioctl_ops {
>   	/* VIDIOC_TRY_FMT handlers */
>   	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
>   				      struct v4l2_format *f);
> +	int (*vidioc_try_ext_pix_fmt_vid_cap)(struct file *file, void *fh,
> +					      struct v4l2_ext_pix_format *ef);
>   	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *fh,
>   					  struct v4l2_format *f);
>   	int (*vidioc_try_fmt_vid_out)(struct file *file, void *fh,
>   				      struct v4l2_format *f);
> +	int (*vidioc_try_ext_pix_fmt_vid_out)(struct file *file, void *fh,
> +					      struct v4l2_ext_pix_format *ef);
>   	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *fh,
>   					     struct v4l2_format *f);
>   	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *fh,
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index d9b7c9177605..a2d850513708 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2270,6 +2270,43 @@ struct v4l2_pix_format_mplane {
>   	__u8				reserved[7];
>   } __attribute__ ((packed));
>   
> +/**
> + * struct v4l2_ext_pix_format - extended single/multiplanar format definition
> + * @type:		type of the data stream; V4L2_BUF_TYPE_VIDEO_CAPTURE or
> + *			V4L2_BUF_TYPE_VIDEO_OUTPUT
> + * @width:		image width in pixels
> + * @height:		image height in pixels
> + * @field:		enum v4l2_field; field order (for interlaced video)
> + * @plane_fmt:		per-plane information
> + * @pixelformat:	little endian four character code (fourcc)
> + * @modifier:		modifier applied to the format (used for tiled formats
> + *			and other kind of HW-specific formats, like compressed
> + *			formats) as defined in drm_fourcc.h
> + * @colorspace:		enum v4l2_colorspace; supplemental to pixelformat
> + * @xfer_func:		enum v4l2_xfer_func, colorspace transfer function
> + * @ycbcr_enc:		enum v4l2_ycbcr_encoding, Y'CbCr encoding
> + * @hsv_enc:		enum v4l2_hsv_encoding, HSV encoding
> + * @quantization:	enum v4l2_quantization, colorspace quantization
> + * @reserved:		extra space reserved for future fields, must be set to 0
> + */
> +struct v4l2_ext_pix_format {
> +	__u32 type;
> +	__u32 width;
> +	__u32 height;
> +	__u32 field;
> +	struct v4l2_plane_pix_format plane_fmt[VIDEO_MAX_PLANES];
> +	__u32 pixelformat;
> +	__u64 modifier;
> +	__u32 colorspace;
> +	__u32 xfer_func;
> +	union {
> +		__u32 ycbcr_enc;
> +		__u32 hsv_enc;
> +	};
> +	__u32 quantization;
> +	__u32 reserved[9];
> +};
> +
>   /**
>    * struct v4l2_sdr_format - SDR format definition
>    * @pixelformat:	little endian four character code (fourcc)
> @@ -2583,6 +2620,10 @@ struct v4l2_create_buffers {
>   
>   #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
>   
> +#define VIDIOC_G_EXT_PIX_FMT	_IOWR('V', 104, struct v4l2_ext_pix_format)
> +#define VIDIOC_S_EXT_PIX_FMT	_IOWR('V', 105, struct v4l2_ext_pix_format)
> +#define VIDIOC_TRY_EXT_PIX_FMT	_IOWR('V', 106, struct v4l2_ext_pix_format)
> +
>   /* Reminder: when adding new ioctls please add support for them to
>      drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
>   
> 

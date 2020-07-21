Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618DA227D2F
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 12:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728478AbgGUKhz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 06:37:55 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:60323 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726084AbgGUKhy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 06:37:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xpedjgjwdNPeYxpeejtUZa; Tue, 21 Jul 2020 12:37:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595327868; bh=QYGRDenUGabz69e881Mjpek+aIab3eS6vJMVqA+v47E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=eRNlT0ZeNyvevCV/fhxiklBqao4ifNHrvp2fnOYEzttMg7bV6/XDsdBmoHKZLaXJA
         K/hVqRuthKUQuXFjItnwKaoNbQWY5U/Jng9SbpPZOd1Yw9fmotLHAXFiAS6Q34UpJO
         QdgSiP8VR9GXDcAJWPmpozuHbKgBL61wW3u6zTPlExK0zJm94Oj0iUWnCc9eq5euB9
         W7ZCLqaTzX4wkJMpSdTY+yd5+lNP72u2B8sUpZA8QOCuprEekcPrbQadFpmpflsNPW
         YPC8BZ9dOJqdYd5jmIqirkUpyuMef1TVgTHNtVCewRwPAbWsiP5244X7mso7wVFDtm
         bvBam34wF4hPw==
Subject: Re: [PATCH v4 1/6] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
To:     Helen Koike <helen.koike@collabora.com>, mchehab@kernel.org,
        hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com,
        sakari.ailus@iki.fi, linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        tfiga@chromium.org, hiroh@chromium.org, nicolas@ndufresne.ca,
        Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, mjourdan@baylibre.com,
        stanimir.varbanov@linaro.org
References: <20200717115435.2632623-1-helen.koike@collabora.com>
 <20200717115435.2632623-2-helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c08eb020-d09c-8046-be73-4b146f9a0d5b@xs4all.nl>
Date:   Tue, 21 Jul 2020 12:37:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717115435.2632623-2-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMNoh730HpEe3rz/vhZomnntayZJhphYymhsoq2I2s6L3YMMMc/oGfyaIsVvQj4pVQSe+eCyapVPur2TuQGod7o/JcvahvoYqBucmk18HXdBoE3WTAbm
 6XeVWzxoPvQdZHUwt82ag4fmdU4MrfjjP5ujZLYlOXrx9b72uZKcOvi55iIvynWtoHl4hUJkelSR1qa25mLpwz5pZLlJC+G4sAD1dfEOTgCsnBdwMaIRwc1Q
 ABa8pW3yWGOuuq9QEhgtoeaVW/yU+5EGZgdoBXP6IuERs+etFRN8+srhcTvQPHMfd2CE04t8fpkNmp8twcl/w8ljO1Pd5E5VCMMKbM9epuMT0WktL0dfuGDQ
 UVvy+RwO8KU2ueGjlO7of0Wxy+1rN6zo+GpH3MBg5HBc9N3PhnmulHnLHvR+C+UTyRMHe2DO0hbapeS4SHgaYyxjgZFIMYI22CDDKpm1qK58QAkeAnzRttoA
 CMljppdvyIK7J/lXkOIoNs8hRxYO7IwqGws6BL+Tv7IVSLNMuy/TyEC7oZTmzkTd4e7NdakiUC3xcQdjh5q4nOWh6iYGUuB4ozZLb63K98M4e9f8XQSm5Kli
 AGp3MZXzY73Q8ChfLHd3um0ormlADYqWpfZ7wmaHQz++TZ7/Otqns+MZsZkAD3G57KFIDlo3/CwK0XsSOjT4PttU3dGGsD5152l7xS+XTz004IiIx+Ame+NL
 OYy2hdqZa7C3+FFkK9UWJpsOxpuu10smLMRP26UKiXp/nigq8VruULa2hYLbhs5NdsSPECrrhJA8yCCCJpMFV7tmCTgexEHBm3fCdpXoY8eam7nlSv3sMRRv
 5laslWer5KT2V00yPBU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/07/2020 13:54, Helen Koike wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> This is part of the multiplanar and singleplanar unification process.
> v4l2_ext_pix_format is supposed to work for both cases.
> 
> We also add the concept of modifiers already employed in DRM to expose
> HW-specific formats (like tiled or compressed formats) and allow
> exchanging this information with the DRM subsystem in a consistent way.
> 
> Note that only V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] are accepted in
> v4l2_ext_format, other types will be rejected if you use the {G,S,TRY}EXT_FMT
> ioctls.
> 
> New hooks have been added to v4l2_ioctl_ops to support those new ioctls
> in drivers, but, in the meantime, the core takes care of converting
> {S,G,TRY}_EXT_FMT requests into {S,G,TRY}_FMT so that old drivers can
> still work if the userspace app/lib uses the new ioctls.
> The conversion is also done the other around to allow userspace
> apps/libs using {S,G,TRY}_FMT to work with drivers implementing the
> _ext_ hooks.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> Changes in v4:
> - Use v4l2_ext_pix_format directly in the ioctl, drop v4l2_ext_format,
> making V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] the only valid types.
> - Add reserved fields
> - Removed num_planes from struct v4l2_ext_pix_format
> - Removed flag field from struct v4l2_ext_pix_format, since the only
>   defined value is V4L2_PIX_FMT_FLAG_PREMUL_ALPHA only used by vsp1,
>   where we can use modifiers, or add it back later through the reserved
>   bits.
> - In v4l2_ext_format_to_format(), check if modifier is != MOD_LINEAR &&
>   != MOD_INVALID
> - Fix type assignment in v4l_g_fmt_ext_pix()
> - Rebased on top of media/master (post 5.8-rc1)
> 
> Changes in v3:
> - Rebased on top of media/master (post 5.4-rc1)
> 
> Changes in v2:
> - Move the modifier in v4l2_ext_format (was formerly placed in
>   v4l2_ext_plane)
> - Fix a few bugs in the converters and add a strict parameter to
>   allow conversion of uninitialized/mis-initialized objects
> ---
>  drivers/media/v4l2-core/v4l2-dev.c   |  21 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c | 585 +++++++++++++++++++++++----
>  include/media/v4l2-ioctl.h           |  34 ++
>  include/uapi/linux/videodev2.h       |  55 +++
>  4 files changed, 614 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index a593ea0598b55..e1829906bc086 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -607,25 +607,37 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
>  		if ((is_rx && (ops->vidioc_g_fmt_vid_cap ||
>  			       ops->vidioc_g_fmt_vid_cap_mplane ||
> +			       ops->vidioc_g_ext_pix_fmt_vid_cap ||
>  			       ops->vidioc_g_fmt_vid_overlay)) ||
>  		    (is_tx && (ops->vidioc_g_fmt_vid_out ||
>  			       ops->vidioc_g_fmt_vid_out_mplane ||
> -			       ops->vidioc_g_fmt_vid_out_overlay)))
> +			       ops->vidioc_g_ext_pix_fmt_vid_out ||
> +			       ops->vidioc_g_fmt_vid_out_overlay))) {
>  			 set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
> +			 set_bit(_IOC_NR(VIDIOC_G_EXT_PIX_FMT), valid_ioctls);
> +		}
>  		if ((is_rx && (ops->vidioc_s_fmt_vid_cap ||
>  			       ops->vidioc_s_fmt_vid_cap_mplane ||
> +			       ops->vidioc_s_ext_pix_fmt_vid_cap ||
>  			       ops->vidioc_s_fmt_vid_overlay)) ||
>  		    (is_tx && (ops->vidioc_s_fmt_vid_out ||
>  			       ops->vidioc_s_fmt_vid_out_mplane ||
> -			       ops->vidioc_s_fmt_vid_out_overlay)))
> +			       ops->vidioc_s_ext_pix_fmt_vid_out ||
> +			       ops->vidioc_s_fmt_vid_out_overlay))) {
>  			 set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
> +			 set_bit(_IOC_NR(VIDIOC_S_EXT_PIX_FMT), valid_ioctls);
> +		}
>  		if ((is_rx && (ops->vidioc_try_fmt_vid_cap ||
>  			       ops->vidioc_try_fmt_vid_cap_mplane ||
> +			       ops->vidioc_try_ext_pix_fmt_vid_cap ||
>  			       ops->vidioc_try_fmt_vid_overlay)) ||
>  		    (is_tx && (ops->vidioc_try_fmt_vid_out ||
>  			       ops->vidioc_try_fmt_vid_out_mplane ||
> -			       ops->vidioc_try_fmt_vid_out_overlay)))
> +			       ops->vidioc_try_ext_pix_fmt_vid_out ||
> +			       ops->vidioc_try_fmt_vid_out_overlay))) {
>  			 set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
> +			 set_bit(_IOC_NR(VIDIOC_TRY_EXT_PIX_FMT), valid_ioctls);
> +		}
>  		SET_VALID_IOCTL(ops, VIDIOC_OVERLAY, vidioc_overlay);
>  		SET_VALID_IOCTL(ops, VIDIOC_G_FBUF, vidioc_g_fbuf);
>  		SET_VALID_IOCTL(ops, VIDIOC_S_FBUF, vidioc_s_fbuf);
> @@ -682,8 +694,11 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		/* touch specific ioctls */
>  		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_vid_cap);
>  		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_vid_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_G_EXT_PIX_FMT, vidioc_g_fmt_vid_cap);
>  		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_vid_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_EXT_PIX_FMT, vidioc_s_fmt_vid_cap);
>  		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_vid_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_TRY_EXT_PIX_FMT, vidioc_try_fmt_vid_cap);
>  		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMESIZES, vidioc_enum_framesizes);
>  		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMEINTERVALS, vidioc_enum_frameintervals);
>  		SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 02bfef0da76da..3b77433f6c32b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -17,6 +17,8 @@
>  
>  #include <linux/videodev2.h>
>  
> +#include <drm/drm_fourcc.h>
> +
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-ctrls.h>
> @@ -378,6 +380,27 @@ static void v4l_print_format(const void *arg, bool write_only)
>  	}
>  }
>  
> +static void v4l_print_ext_pix_format(const void *arg, bool write_only)
> +{
> +	const struct v4l2_ext_pix_format *pix = arg;
> +	unsigned int i;
> +
> +	pr_cont("type=%s, width=%u, height=%u, format=%c%c%c%c, modifier %llx, field=%s, colorspace=%d, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
> +		prt_names(pix->type, v4l2_type_names),
> +		pix->width, pix->height,
> +		(pix->pixelformat & 0xff),
> +		(pix->pixelformat >>  8) & 0xff,
> +		(pix->pixelformat >> 16) & 0xff,
> +		(pix->pixelformat >> 24) & 0xff,
> +		pix->modifier, prt_names(pix->field, v4l2_field_names),
> +		pix->colorspace, pix->ycbcr_enc,
> +		pix->quantization, pix->xfer_func);
> +	for (i = 0; i < VIDEO_MAX_PLANES && pix->plane_fmt[i].sizeimage; i++)
> +		pr_debug("plane %u: bytesperline=%u sizeimage=%u\n",
> +			 i, pix->plane_fmt[i].bytesperline,
> +			 pix->plane_fmt[i].sizeimage);
> +}
> +
>  static void v4l_print_framebuffer(const void *arg, bool write_only)
>  {
>  	const struct v4l2_framebuffer *p = arg;
> @@ -958,11 +981,15 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>  	switch (type) {
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>  		if ((is_vid || is_tch) && is_rx &&
> -		    (ops->vidioc_g_fmt_vid_cap || ops->vidioc_g_fmt_vid_cap_mplane))
> +		    (ops->vidioc_g_fmt_vid_cap ||
> +		     ops->vidioc_g_ext_pix_fmt_vid_cap ||
> +		     ops->vidioc_g_fmt_vid_cap_mplane))
>  			return 0;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if ((is_vid || is_tch) && is_rx && ops->vidioc_g_fmt_vid_cap_mplane)
> +		if ((is_vid || is_tch) && is_rx &&
> +		    (ops->vidioc_g_fmt_vid_cap_mplane ||
> +		     ops->vidioc_g_ext_pix_fmt_vid_cap))
>  			return 0;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
> @@ -971,11 +998,15 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>  		if (is_vid && is_tx &&
> -		    (ops->vidioc_g_fmt_vid_out || ops->vidioc_g_fmt_vid_out_mplane))
> +		    (ops->vidioc_g_fmt_vid_out ||
> +		     ops->vidioc_g_ext_pix_fmt_vid_out ||
> +		     ops->vidioc_g_fmt_vid_out_mplane))
>  			return 0;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		if (is_vid && is_tx && ops->vidioc_g_fmt_vid_out_mplane)
> +		if (is_vid && is_tx &&
> +		    (ops->vidioc_g_ext_pix_fmt_vid_out ||
> +		     ops->vidioc_g_fmt_vid_out_mplane))
>  			return 0;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
> @@ -1055,6 +1086,134 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
>  	       sizeof(fmt->fmt.pix) - offset);
>  }
>  
> +int v4l2_ext_pix_format_to_format(const struct v4l2_ext_pix_format *e,
> +				  struct v4l2_format *f, bool mplane_cap,
> +				  bool strict)
> +{
> +	const struct v4l2_plane_ext_pix_format *pe;
> +	struct v4l2_plane_pix_format *p;
> +	unsigned int i;
> +
> +	memset(f, 0, sizeof(*f));
> +
> +	/*
> +	 * Make sure no modifier is required before doing the
> +	 * conversion.
> +	 */
> +	if (e->modifier && strict &&
> +	    e->modifier != DRM_FORMAT_MOD_LINEAR &&
> +	    e->modifier != DRM_FORMAT_MOD_INVALID)
> +		return -EINVAL;
> +
> +	if (!e->plane_fmt[0].sizeimage && strict)
> +		return -EINVAL;
> +
> +	if (e->plane_fmt[1].sizeimage && !mplane_cap && strict)
> +		return 0;
> +
> +	if (!mplane_cap) {
> +		f->fmt.pix.width = e->width;
> +		f->fmt.pix.height = e->height;
> +		f->fmt.pix.pixelformat = e->pixelformat;
> +		f->fmt.pix.field = e->field;
> +		f->fmt.pix.colorspace = e->colorspace;
> +		f->fmt.pix.ycbcr_enc = e->ycbcr_enc;
> +		f->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> +		f->fmt.pix.quantization = e->quantization;
> +		pe = &e->plane_fmt[0];
> +		f->fmt.pix.bytesperline = pe->bytesperline;
> +		f->fmt.pix.sizeimage = pe->sizeimage;
> +		f->type = e->type;
> +		return 0;
> +	}
> +
> +	f->fmt.pix_mp.width = e->width;
> +	f->fmt.pix_mp.height = e->height;
> +	f->fmt.pix_mp.pixelformat = e->pixelformat;
> +	f->fmt.pix_mp.field = e->field;
> +	f->fmt.pix_mp.colorspace = e->colorspace;
> +	f->fmt.pix_mp.ycbcr_enc = e->ycbcr_enc;
> +	f->fmt.pix_mp.quantization = e->quantization;
> +	if (e->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	else
> +		f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +
> +	for (i = 0; i < VIDEO_MAX_PLANES; i++) {
> +		pe = &e->plane_fmt[i];
> +		p = &f->fmt.pix_mp.plane_fmt[i];
> +		p->bytesperline = pe->bytesperline;
> +		p->sizeimage = pe->sizeimage;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_ext_pix_format_to_format);
> +
> +int v4l2_format_to_ext_pix_format(const struct v4l2_format *f,
> +				  struct v4l2_ext_pix_format *e, bool strict)
> +{
> +	const struct v4l2_plane_pix_format *p;
> +	struct v4l2_plane_ext_pix_format *pe;
> +	unsigned int i;
> +
> +	memset(e, 0, sizeof(*e));
> +
> +	switch (f->type) {
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +		e->width = f->fmt.pix.width;
> +		e->height = f->fmt.pix.height;
> +		e->pixelformat = f->fmt.pix.pixelformat;
> +		e->field = f->fmt.pix.field;
> +		e->colorspace = f->fmt.pix.colorspace;
> +		if (f->fmt.pix.flags)
> +			pr_warn("Ignoring pixelformat flags 0x%x\n",
> +				f->fmt.pix.flags);
> +		e->ycbcr_enc = f->fmt.pix.ycbcr_enc;
> +		e->quantization = f->fmt.pix.quantization;
> +		e->plane_fmt[0].bytesperline = f->fmt.pix.bytesperline;
> +		e->plane_fmt[0].sizeimage = f->fmt.pix.sizeimage;
> +		e->type = f->type;
> +		break;
> +
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		if ((f->fmt.pix_mp.num_planes > VIDEO_MAX_PLANES ||
> +		     !f->fmt.pix_mp.num_planes) && strict)
> +			return -EINVAL;
> +
> +		e->width = f->fmt.pix_mp.width;
> +		e->height = f->fmt.pix_mp.height;
> +		e->pixelformat = f->fmt.pix_mp.pixelformat;
> +		e->field = f->fmt.pix_mp.field;
> +		e->colorspace = f->fmt.pix_mp.colorspace;
> +		if (f->fmt.pix.flags)
> +			pr_warn("Ignoring pixelformat flags 0x%x\n",
> +				f->fmt.pix.flags);
> +		e->ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
> +		e->quantization = f->fmt.pix_mp.quantization;
> +		if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +			e->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +		else
> +			e->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +
> +		for (i = 0; i < VIDEO_MAX_PLANES; i++) {
> +			pe = &e->plane_fmt[i];
> +			p = &f->fmt.pix_mp.plane_fmt[i];
> +			pe->bytesperline = p->bytesperline;
> +			pe->sizeimage = p->sizeimage;
> +		}
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_format_to_ext_pix_format);
> +
>  static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> @@ -1558,6 +1717,38 @@ static void v4l_pix_format_touch(struct v4l2_pix_format *p)
>  	p->xfer_func = 0;
>  }
>  
> +static int v4l_g_fmt_ext_pix(const struct v4l2_ioctl_ops *ops,
> +			     struct file *file, void *fh,
> +			     struct v4l2_format *f)
> +{
> +	struct v4l2_ext_pix_format ef;
> +	int ret;
> +
> +	switch (f->type) {
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		ef.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +		ret = ops->vidioc_g_ext_pix_fmt_vid_cap(file, fh, &ef);
> +		break;
> +
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		ef.type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +		ret = ops->vidioc_g_ext_pix_fmt_vid_out(file, fh, &ef);
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_ext_pix_format_to_format(&ef, f,
> +					     V4L2_TYPE_IS_MULTIPLANAR(f->type),
> +					     true);
> +}
> +
>  static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> @@ -1594,17 +1785,27 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>  
>  	switch (p->type) {
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> -		if (unlikely(!ops->vidioc_g_fmt_vid_cap))
> -			break;
> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> -		ret = ops->vidioc_g_fmt_vid_cap(file, fh, arg);
> -		/* just in case the driver zeroed it again */
> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> -		if (vfd->vfl_type == VFL_TYPE_TOUCH)
> -			v4l_pix_format_touch(&p->fmt.pix);
> -		return ret;
> +		if (ops->vidioc_g_fmt_vid_cap) {
> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> +			ret = ops->vidioc_g_fmt_vid_cap(file, fh, arg);
> +			/* just in case the driver zeroed it again */
> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> +			if (vfd->vfl_type == VFL_TYPE_TOUCH)
> +				v4l_pix_format_touch(&p->fmt.pix);
> +			return ret;
> +		} else if (ops->vidioc_g_ext_pix_fmt_vid_cap) {
> +			ret = v4l_g_fmt_ext_pix(ops, file, fh, p);
> +			if (vfd->vfl_type == VFL_TYPE_TOUCH)
> +				v4l_pix_format_touch(&p->fmt.pix);
> +			return ret;
> +		}
> +		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		return ops->vidioc_g_fmt_vid_cap_mplane(file, fh, arg);
> +		if (ops->vidioc_g_fmt_vid_cap_mplane)
> +			return ops->vidioc_g_fmt_vid_cap_mplane(file, fh, arg);
> +		else if (ops->vidioc_g_ext_pix_fmt_vid_cap)
> +			return v4l_g_fmt_ext_pix(ops, file, fh, p);
> +		break;
>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>  		return ops->vidioc_g_fmt_vid_overlay(file, fh, arg);
>  	case V4L2_BUF_TYPE_VBI_CAPTURE:
> @@ -1612,15 +1813,22 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>  	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
>  		return ops->vidioc_g_fmt_sliced_vbi_cap(file, fh, arg);
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> -		if (unlikely(!ops->vidioc_g_fmt_vid_out))
> -			break;
> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> -		ret = ops->vidioc_g_fmt_vid_out(file, fh, arg);
> -		/* just in case the driver zeroed it again */
> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> -		return ret;
> +		if (ops->vidioc_g_fmt_vid_out) {
> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> +			ret = ops->vidioc_g_fmt_vid_out(file, fh, arg);
> +			/* just in case the driver zeroed it again */
> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> +			return ret;
> +		} else if (ops->vidioc_g_ext_pix_fmt_vid_out) {
> +			return v4l_g_fmt_ext_pix(ops, file, fh, p);
> +		}
> +		break;
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		return ops->vidioc_g_fmt_vid_out_mplane(file, fh, arg);
> +		if (ops->vidioc_g_fmt_vid_out_mplane)
> +			return ops->vidioc_g_fmt_vid_out_mplane(file, fh, arg);
> +		else if (ops->vidioc_g_ext_pix_fmt_vid_out)
> +			return v4l_g_fmt_ext_pix(ops, file, fh, p);
> +		break;
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>  		return ops->vidioc_g_fmt_vid_out_overlay(file, fh, arg);
>  	case V4L2_BUF_TYPE_VBI_OUTPUT:
> @@ -1639,6 +1847,76 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>  	return -EINVAL;
>  }
>  
> +static int v4l_g_ext_pix_fmt(const struct v4l2_ioctl_ops *ops,
> +			     struct file *file, void *fh, void *arg)
> +{
> +	struct v4l2_ext_pix_format *ef = arg;
> +	struct v4l2_format f = {
> +		.type = ef->type,
> +	};
> +	int ret;
> +
> +	ret = check_fmt(file, ef->type);
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
> +	return v4l2_format_to_ext_pix_format(&f, ef, true);
> +}
> +
> +static int v4l_s_fmt_ext_pix(const struct v4l2_ioctl_ops *ops,
> +			     struct file *file, void *fh,
> +			     struct v4l2_format *f)
> +{
> +	struct v4l2_ext_pix_format ef;
> +	int ret;
> +
> +	ret = v4l2_format_to_ext_pix_format(f, &ef, false);
> +	if (ret)
> +		return ret;
> +
> +	switch (f->type) {
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		ret = ops->vidioc_s_ext_pix_fmt_vid_cap(file, fh, &ef);
> +		break;
> +
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		ret = ops->vidioc_s_ext_pix_fmt_vid_out(file, fh, &ef);
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_ext_pix_format_to_format(&ef, f,
> +					     V4L2_TYPE_IS_MULTIPLANAR(f->type),
> +					     true);
> +}
> +
>  static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> @@ -1657,23 +1935,31 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>  
>  	switch (p->type) {
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> -		if (unlikely(!ops->vidioc_s_fmt_vid_cap))
> +		if (ops->vidioc_s_fmt_vid_cap) {
> +			CLEAR_AFTER_FIELD(p, fmt.pix);
> +			ret = ops->vidioc_s_fmt_vid_cap(file, fh, arg);
> +			/* just in case the driver zeroed it again */
> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> +		} else if (ops->vidioc_s_ext_pix_fmt_vid_cap) {
> +			ret = v4l_s_fmt_ext_pix(ops, file, fh, arg);
> +		} else {
>  			break;
> -		CLEAR_AFTER_FIELD(p, fmt.pix);
> -		ret = ops->vidioc_s_fmt_vid_cap(file, fh, arg);
> -		/* just in case the driver zeroed it again */
> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> +		}
> +
>  		if (vfd->vfl_type == VFL_TYPE_TOUCH)
>  			v4l_pix_format_touch(&p->fmt.pix);
>  		return ret;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if (unlikely(!ops->vidioc_s_fmt_vid_cap_mplane))
> -			break;
> -		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
> -		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
> -			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
> -					  bytesperline);
> -		return ops->vidioc_s_fmt_vid_cap_mplane(file, fh, arg);
> +		if (ops->vidioc_s_fmt_vid_cap_mplane) {
> +			CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
> +			for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
> +				CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
> +						  bytesperline);
> +			return ops->vidioc_s_fmt_vid_cap_mplane(file, fh, arg);
> +		} else if (ops->vidioc_s_ext_pix_fmt_vid_cap) {
> +			return v4l_s_fmt_ext_pix(ops, file, fh, arg);
> +		}
> +		break;
>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>  		if (unlikely(!ops->vidioc_s_fmt_vid_overlay))
>  			break;
> @@ -1690,21 +1976,27 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>  		CLEAR_AFTER_FIELD(p, fmt.sliced.io_size);
>  		return ops->vidioc_s_fmt_sliced_vbi_cap(file, fh, arg);
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> -		if (unlikely(!ops->vidioc_s_fmt_vid_out))
> -			break;
> -		CLEAR_AFTER_FIELD(p, fmt.pix);
> -		ret = ops->vidioc_s_fmt_vid_out(file, fh, arg);
> -		/* just in case the driver zeroed it again */
> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> -		return ret;
> +		if (ops->vidioc_s_fmt_vid_out) {
> +			CLEAR_AFTER_FIELD(p, fmt.pix);
> +			ret = ops->vidioc_s_fmt_vid_out(file, fh, arg);
> +			/* just in case the driver zeroed it again */
> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> +			return ret;
> +		} else if (ops->vidioc_s_ext_pix_fmt_vid_out) {
> +			return v4l_s_fmt_ext_pix(ops, file, fh, arg);
> +		}
> +		break;
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		if (unlikely(!ops->vidioc_s_fmt_vid_out_mplane))
> -			break;
> -		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
> -		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
> -			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
> -					  bytesperline);
> -		return ops->vidioc_s_fmt_vid_out_mplane(file, fh, arg);
> +		if (ops->vidioc_s_fmt_vid_out_mplane) {
> +			CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
> +			for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
> +				CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
> +						  bytesperline);
> +			return ops->vidioc_s_fmt_vid_out_mplane(file, fh, arg);
> +		} else if (ops->vidioc_s_ext_pix_fmt_vid_out) {
> +			return v4l_s_fmt_ext_pix(ops, file, fh, arg);
> +		}
> +		break;
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>  		if (unlikely(!ops->vidioc_s_fmt_vid_out_overlay))
>  			break;
> @@ -1744,6 +2036,82 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>  	return -EINVAL;
>  }
>  
> +static int v4l_s_ext_pix_fmt(const struct v4l2_ioctl_ops *ops,
> +			     struct file *file, void *fh, void *arg)
> +{
> +	struct video_device *vfd = video_devdata(file);
> +	struct v4l2_ext_pix_format *ef = arg;
> +	struct v4l2_format f;
> +	int ret;
> +
> +	ret = check_fmt(file, ef->type);
> +	if (ret)
> +		return ret;
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
> +	ret = v4l2_ext_pix_format_to_format(ef, &f,
> +					    vfd->device_caps &
> +					    (V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> +					     V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> +					     V4L2_CAP_VIDEO_M2M_MPLANE),
> +					    false);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l_s_fmt(ops, file, fh, &f);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_format_to_ext_pix_format(&f, ef, true);
> +}
> +
> +static int v4l_try_fmt_ext_pix(const struct v4l2_ioctl_ops *ops,
> +			       struct file *file, void *fh,
> +			       struct v4l2_format *f)
> +{
> +	struct v4l2_ext_pix_format ef;
> +	int ret;
> +
> +	ret = v4l2_format_to_ext_pix_format(f, &ef, false);
> +	if (ret)
> +		return ret;
> +
> +	switch (f->type) {
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		ret = ops->vidioc_try_ext_pix_fmt_vid_cap(file, fh, &ef);
> +		break;
> +
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		ret = ops->vidioc_try_ext_pix_fmt_vid_out(file, fh, &ef);
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_ext_pix_format_to_format(&ef, f,
> +					     V4L2_TYPE_IS_MULTIPLANAR(f->type),
> +					     true);
> +}
> +
> +
>  static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> @@ -1759,23 +2127,32 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>  
>  	switch (p->type) {
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> -		if (unlikely(!ops->vidioc_try_fmt_vid_cap))
> -			break;
> -		CLEAR_AFTER_FIELD(p, fmt.pix);
> -		ret = ops->vidioc_try_fmt_vid_cap(file, fh, arg);
> -		/* just in case the driver zeroed it again */
> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> -		if (vfd->vfl_type == VFL_TYPE_TOUCH)
> -			v4l_pix_format_touch(&p->fmt.pix);
> -		return ret;
> +		if (ops->vidioc_try_fmt_vid_cap) {
> +			CLEAR_AFTER_FIELD(p, fmt.pix);
> +			ret = ops->vidioc_try_fmt_vid_cap(file, fh, arg);
> +			/* just in case the driver zeroed it again */
> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> +			if (vfd->vfl_type == VFL_TYPE_TOUCH)
> +				v4l_pix_format_touch(&p->fmt.pix);
> +			return ret;
> +		} else if (ops->vidioc_try_ext_pix_fmt_vid_cap) {
> +			ret = v4l_try_fmt_ext_pix(ops, file, fh, p);
> +			if (vfd->vfl_type == VFL_TYPE_TOUCH)
> +				v4l_pix_format_touch(&p->fmt.pix);
> +			return ret;
> +		}
> +		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if (unlikely(!ops->vidioc_try_fmt_vid_cap_mplane))
> -			break;
> -		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
> -		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
> -			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
> -					  bytesperline);
> -		return ops->vidioc_try_fmt_vid_cap_mplane(file, fh, arg);
> +		if (ops->vidioc_try_fmt_vid_cap_mplane) {
> +			CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
> +			for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
> +				CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
> +						  bytesperline);
> +			return ops->vidioc_try_fmt_vid_cap_mplane(file, fh, arg);
> +		} else if (ops->vidioc_try_ext_pix_fmt_vid_cap) {
> +			return v4l_try_fmt_ext_pix(ops, file, fh, p);
> +		}
> +		break;
>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>  		if (unlikely(!ops->vidioc_try_fmt_vid_overlay))
>  			break;
> @@ -1792,21 +2169,27 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>  		CLEAR_AFTER_FIELD(p, fmt.sliced.io_size);
>  		return ops->vidioc_try_fmt_sliced_vbi_cap(file, fh, arg);
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> -		if (unlikely(!ops->vidioc_try_fmt_vid_out))
> -			break;
> -		CLEAR_AFTER_FIELD(p, fmt.pix);
> -		ret = ops->vidioc_try_fmt_vid_out(file, fh, arg);
> -		/* just in case the driver zeroed it again */
> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> -		return ret;
> +		if (ops->vidioc_try_fmt_vid_out) {
> +			CLEAR_AFTER_FIELD(p, fmt.pix);
> +			ret = ops->vidioc_try_fmt_vid_out(file, fh, arg);
> +			/* just in case the driver zeroed it again */
> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
> +			return ret;
> +		} else if (ops->vidioc_try_ext_pix_fmt_vid_cap) {
> +			return v4l_try_fmt_ext_pix(ops, file, fh, p);
> +		}
> +		break;
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		if (unlikely(!ops->vidioc_try_fmt_vid_out_mplane))
> -			break;
> -		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
> -		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
> -			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
> -					  bytesperline);
> -		return ops->vidioc_try_fmt_vid_out_mplane(file, fh, arg);
> +		if (ops->vidioc_try_fmt_vid_out_mplane) {
> +			CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
> +			for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
> +				CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
> +						  bytesperline);
> +			return ops->vidioc_try_fmt_vid_out_mplane(file, fh, arg);
> +		} else if (ops->vidioc_try_ext_pix_fmt_vid_cap) {
> +			return v4l_try_fmt_ext_pix(ops, file, fh, p);
> +		}
> +		break;
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>  		if (unlikely(!ops->vidioc_try_fmt_vid_out_overlay))
>  			break;
> @@ -1846,6 +2229,49 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>  	return -EINVAL;
>  }
>  
> +static int v4l_try_ext_pix_fmt(const struct v4l2_ioctl_ops *ops,
> +			       struct file *file, void *fh, void *arg)
> +{
> +	struct video_device *vfd = video_devdata(file);
> +	struct v4l2_ext_pix_format *ef = arg;
> +	struct v4l2_format f;
> +	int ret;
> +
> +	ret = check_fmt(file, ef->type);
> +	if (ret)
> +		return ret;
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
> +	ret = v4l2_ext_pix_format_to_format(ef, &f,
> +					    vfd->device_caps &
> +					    (V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> +					     V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> +					     V4L2_CAP_VIDEO_M2M_MPLANE),
> +					    false);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l_try_fmt(ops, file, fh, &f);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_format_to_ext_pix_format(&f, ef, true);
> +}
> +
>  static int v4l_streamon(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> @@ -2765,7 +3191,9 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>  	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
>  	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
>  	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
> +	IOCTL_INFO(VIDIOC_G_EXT_PIX_FMT, v4l_g_ext_pix_fmt, v4l_print_ext_pix_format, 0),
>  	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_EXT_PIX_FMT, v4l_s_ext_pix_fmt, v4l_print_ext_pix_format, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
>  	IOCTL_INFO(VIDIOC_QUERYBUF, v4l_querybuf, v4l_print_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_buffer, length)),
>  	IOCTL_INFO(VIDIOC_G_FBUF, v4l_stub_g_fbuf, v4l_print_framebuffer, 0),
> @@ -2812,6 +3240,7 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>  	IOCTL_INFO(VIDIOC_S_JPEGCOMP, v4l_stub_s_jpegcomp, v4l_print_jpegcompression, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_QUERYSTD, v4l_querystd, v4l_print_std, 0),
>  	IOCTL_INFO(VIDIOC_TRY_FMT, v4l_try_fmt, v4l_print_format, 0),
> +	IOCTL_INFO(VIDIOC_TRY_EXT_PIX_FMT, v4l_try_ext_pix_fmt, v4l_print_ext_pix_format, 0),
>  	IOCTL_INFO(VIDIOC_ENUMAUDIO, v4l_stub_enumaudio, v4l_print_audio, INFO_FL_CLEAR(v4l2_audio, index)),
>  	IOCTL_INFO(VIDIOC_ENUMAUDOUT, v4l_stub_enumaudout, v4l_print_audioout, INFO_FL_CLEAR(v4l2_audioout, index)),
>  	IOCTL_INFO(VIDIOC_G_PRIORITY, v4l_g_priority, v4l_print_u32, 0),
> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index 86878fba332b0..525ce86725260 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -48,11 +48,17 @@ struct v4l2_fh;
>   * @vidioc_g_fmt_vid_cap: pointer to the function that implements
>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video capture
>   *	in single plane mode
> + * @vidioc_g_ext_pix_fmt_vid_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_G_EXT_PIX_FMT <vidioc_g_ext_pix_fmt>` ioctl logic for video
> + *	capture
>   * @vidioc_g_fmt_vid_overlay: pointer to the function that implements
>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video overlay
>   * @vidioc_g_fmt_vid_out: pointer to the function that implements
>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video out
>   *	in single plane mode
> + * @vidioc_g_ext_pix_fmt_vid_out: pointer to the function that implements
> + *	:ref:`VIDIOC_G_EXT_PIX_FMT <vidioc_g_ext_pix_fmt>` ioctl logic for video
> + *	out
>   * @vidioc_g_fmt_vid_out_overlay: pointer to the function that implements
>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video overlay output
>   * @vidioc_g_fmt_vbi_cap: pointer to the function that implements
> @@ -82,11 +88,16 @@ struct v4l2_fh;
>   * @vidioc_s_fmt_vid_cap: pointer to the function that implements
>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video capture
>   *	in single plane mode
> + * @vidioc_s_ext_pix_fmt_vid_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_S_EXT_PIX_FMT <vidioc_s_ext_pix_fmt>` ioctl logic for video
> + *	capture
>   * @vidioc_s_fmt_vid_overlay: pointer to the function that implements
>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video overlay
>   * @vidioc_s_fmt_vid_out: pointer to the function that implements
>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video out
>   *	in single plane mode
> + * @vidioc_s_ext_pix_fmt_vid_out: pointer to the function that implements
> + *	:ref:`VIDIOC_S_EXT_PIX_FMT <vidioc_g_fmt>` ioctl logic for video out
>   * @vidioc_s_fmt_vid_out_overlay: pointer to the function that implements
>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video overlay output
>   * @vidioc_s_fmt_vbi_cap: pointer to the function that implements
> @@ -116,11 +127,16 @@ struct v4l2_fh;
>   * @vidioc_try_fmt_vid_cap: pointer to the function that implements
>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video capture
>   *	in single plane mode
> + * @vidioc_try_ext_pix_fmt_vid_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_TRY_EXT_PIX_FMT <vidioc_try_ext_pix_fmt>` ioctl logic for
> +	video capture
>   * @vidioc_try_fmt_vid_overlay: pointer to the function that implements
>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video overlay
>   * @vidioc_try_fmt_vid_out: pointer to the function that implements
>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video out
>   *	in single plane mode
> + * @vidioc_try_ext_pix_fmt_vid_out: pointer to the function that implements
> + *	:ref:`VIDIOC_TRY_EXT_PIX_FMT <vidioc_g_fmt>` ioctl logic for video out
>   * @vidioc_try_fmt_vid_out_overlay: pointer to the function that implements
>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video overlay
>   *	output
> @@ -319,10 +335,14 @@ struct v4l2_ioctl_ops {
>  	/* VIDIOC_G_FMT handlers */
>  	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
>  				    struct v4l2_format *f);
> +	int (*vidioc_g_ext_pix_fmt_vid_cap)(struct file *file, void *fh,
> +					    struct v4l2_ext_pix_format *f);
>  	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *fh,
>  					struct v4l2_format *f);
>  	int (*vidioc_g_fmt_vid_out)(struct file *file, void *fh,
>  				    struct v4l2_format *f);
> +	int (*vidioc_g_ext_pix_fmt_vid_out)(struct file *file, void *fh,
> +					    struct v4l2_ext_pix_format *f);
>  	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *fh,
>  					    struct v4l2_format *f);
>  	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *fh,
> @@ -349,10 +369,14 @@ struct v4l2_ioctl_ops {
>  	/* VIDIOC_S_FMT handlers */
>  	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
>  				    struct v4l2_format *f);
> +	int (*vidioc_s_ext_pix_fmt_vid_cap)(struct file *file, void *fh,
> +					    struct v4l2_ext_pix_format *f);
>  	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *fh,
>  					struct v4l2_format *f);
>  	int (*vidioc_s_fmt_vid_out)(struct file *file, void *fh,
>  				    struct v4l2_format *f);
> +	int (*vidioc_s_ext_pix_fmt_vid_out)(struct file *file, void *fh,
> +					    struct v4l2_ext_pix_format *f);
>  	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *fh,
>  					    struct v4l2_format *f);
>  	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *fh,
> @@ -379,10 +403,14 @@ struct v4l2_ioctl_ops {
>  	/* VIDIOC_TRY_FMT handlers */
>  	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
>  				      struct v4l2_format *f);
> +	int (*vidioc_try_ext_pix_fmt_vid_cap)(struct file *file, void *fh,
> +					      struct v4l2_ext_pix_format *f);
>  	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *fh,
>  					  struct v4l2_format *f);
>  	int (*vidioc_try_fmt_vid_out)(struct file *file, void *fh,
>  				      struct v4l2_format *f);
> +	int (*vidioc_try_ext_pix_fmt_vid_out)(struct file *file, void *fh,
> +					      struct v4l2_ext_pix_format *f);
>  	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *fh,
>  					     struct v4l2_format *f);
>  	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *fh,
> @@ -724,6 +752,12 @@ long int video_usercopy(struct file *file, unsigned int cmd,
>  long int video_ioctl2(struct file *file,
>  		      unsigned int cmd, unsigned long int arg);
>  
> +int v4l2_format_to_ext_pix_format(const struct v4l2_format *f,
> +				  struct v4l2_ext_pix_format *e, bool strict);
> +int v4l2_ext_pix_format_to_format(const struct v4l2_ext_pix_format *e,
> +				  struct v4l2_format *f,
> +				  bool mplane_cap, bool strict);
> +
>  /*
>   * The user space interpretation of the 'v4l2_event' differs
>   * based on the 'time_t' definition on 32-bit architectures, so
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 303805438814f..fc04c81ce7713 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2252,6 +2252,57 @@ struct v4l2_pix_format_mplane {
>  	__u8				reserved[7];
>  } __attribute__ ((packed));
>  
> +/**
> + * struct v4l2_plane_ext_pix_format - additional, per-plane format definition
> + * @sizeimage:		maximum size in bytes required for data, for which
> + *			this plane will be used
> + * @bytesperline:	distance in bytes between the leftmost pixels in two
> + *			adjacent lines
> + * @reserved:		extra space reserved for future fields, must be set to 0
> + */
> +struct v4l2_plane_ext_pix_format {
> +	__u32 sizeimage;
> +	__u32 bytesperline;
> +	__u32 reserved;
> +} __attribute__ ((packed));
> +
> +/**
> + * struct v4l2_ext_pix_format - extended single/multiplanar format definition
> + * @type:		type of the data stream; V4L2_BUF_TYPE_VIDEO_CAPTURE or
> + *			V4L2_BUF_TYPE_VIDEO_OUTPUT
> + * @width:		image width in pixels
> + * @height:		image height in pixels
> + * @field:		enum v4l2_field; field order (for interlaced video)
> + * @pixelformat:	little endian four character code (fourcc)
> + * @modifier:		modifier applied to the format (used for tiled formats
> + *			and other kind of HW-specific formats, like compressed
> + *			formats)
> + * @colorspace:		enum v4l2_colorspace; supplemental to pixelformat
> + * @plane_fmt:		per-plane information
> + * @ycbcr_enc:		enum v4l2_ycbcr_encoding, Y'CbCr encoding
> + * @hsv_enc:		enum v4l2_hsv_encoding, HSV encoding
> + * @quantization:	enum v4l2_quantization, colorspace quantization
> + * @xfer_func:		enum v4l2_xfer_func, colorspace transfer function
> + * @reserved:		extra space reserved for future fields, must be set to 0
> + */
> +struct v4l2_ext_pix_format {
> +	__u32 type;
> +	__u32 width;
> +	__u32 height;
> +	__u32 field;
> +	__u32 pixelformat;
> +	__u64 modifier;
> +	__u32 colorspace;

This struct has holes and is not the same for 32 and 64 bit architectures.

Moving modifier to before pixelformat will help a lot.

> +	struct v4l2_plane_ext_pix_format plane_fmt[VIDEO_MAX_PLANES];
> +	union {
> +		__u8 ycbcr_enc;
> +		__u8 hsv_enc;
> +	};
> +	__u8 quantization;
> +	__u8 xfer_func;

I'd change u8 to u32 for these fields for easier alignment.

Regards,

	Hans

> +	__u32 reserved[4];
> +} __attribute__ ((packed));
> +
>  /**
>   * struct v4l2_sdr_format - SDR format definition
>   * @pixelformat:	little endian four character code (fourcc)
> @@ -2569,6 +2620,10 @@ struct v4l2_create_buffers {
>  
>  #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
>  
> +#define VIDIOC_G_EXT_PIX_FMT	_IOWR('V', 104, struct v4l2_ext_pix_format)
> +#define VIDIOC_S_EXT_PIX_FMT	_IOWR('V', 105, struct v4l2_ext_pix_format)
> +#define VIDIOC_TRY_EXT_PIX_FMT	_IOWR('V', 106, struct v4l2_ext_pix_format)
> +
>  /* Reminder: when adding new ioctls please add support for them to
>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
>  
> 


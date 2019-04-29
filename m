Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E12E001
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 12:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbfD2KCl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 06:02:41 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:38859 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727581AbfD2KCl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 06:02:41 -0400
Received: from [192.168.2.10] ([46.9.232.72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id L37JhKZSjb8gSL37Nh7lfq; Mon, 29 Apr 2019 12:02:38 +0200
Subject: Re: [PATCH v5 04/14] media: Move sp2mp functions to v4l2-common
To:     =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, helen.koike@collabora.com,
        kernel@collabora.com, lucmaga@gmail.com,
        lkcamp@lists.libreplanetbr.org
References: <20190426195114.5002-1-andrealmeid@collabora.com>
 <20190426195114.5002-5-andrealmeid@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b16b47d0-09d9-5174-f495-b27f23e806db@xs4all.nl>
Date:   Mon, 29 Apr 2019 12:02:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190426195114.5002-5-andrealmeid@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfEeB/Vhe4ST+R8fhWgcMjyF8D4t38ZWzZ6qd4cpasJHZZPg+VX7ytWpkC0rgDx5MwXMPg5olcVTt5y2r74KlBjHMkxDDvCYiz3H5ctMTFLAlZ31Wmfkp
 3ob6DIgFe8+mLR5zTp0pEqcImBfMZWOrW/sSPbDZ37zlTEyCegScjjMz64zcsrkIFpHw5OJkIMkXf6utxN/alOC+lMpkxrAUGKuqbm1QUwKTDa9Djo2d3lUz
 pMg6gd/4YvNdLe5p2mP7xQeIqz3OESxGWSHRX3QLztAAnxoo9shrPah0lCamp0Tc9E1X6UqPPXnu1XHWgiMvreTciXqHmJ3hUa7xIj/fxrC7W9iXGHONF4Yp
 1ZlVO2yBCGEZ71W3eKaJhgqRbxTAlw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/26/19 9:51 PM, André Almeida wrote:
> Move sp2mp functions from vivid code to v4l2-common as it will be reused
> by vimc driver for multiplanar support.
> 
> Signed-off-by: André Almeida <andrealmeid@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
> Changes in v5: none
> Changes in v4: none
> 
> Changes in v3:
> - Change commit order
> - Reword comments
> 
> Changes in v2:
> - Fix indentation
> - Change the style of comments. Functions now have a shorter title and a
> better description bellow
> 
>  drivers/media/platform/vivid/vivid-vid-cap.c  |  6 +-
>  .../media/platform/vivid/vivid-vid-common.c   | 59 ------------------
>  .../media/platform/vivid/vivid-vid-common.h   |  9 ---
>  drivers/media/platform/vivid/vivid-vid-out.c  |  6 +-
>  drivers/media/v4l2-core/v4l2-common.c         | 62 +++++++++++++++++++
>  include/media/v4l2-common.h                   | 37 +++++++++++
>  6 files changed, 105 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
> index 530ac8decb25..208f1094b998 100644
> --- a/drivers/media/platform/vivid/vivid-vid-cap.c
> +++ b/drivers/media/platform/vivid/vivid-vid-cap.c
> @@ -815,7 +815,7 @@ int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
>  
>  	if (dev->multiplanar)
>  		return -ENOTTY;
> -	return fmt_sp2mp_func(file, priv, f, vivid_g_fmt_vid_cap);
> +	return v4l2_fmt_sp2mp_func(file, priv, f, vivid_g_fmt_vid_cap);
>  }
>  
>  int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
> @@ -825,7 +825,7 @@ int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
>  
>  	if (dev->multiplanar)
>  		return -ENOTTY;
> -	return fmt_sp2mp_func(file, priv, f, vivid_try_fmt_vid_cap);
> +	return v4l2_fmt_sp2mp_func(file, priv, f, vivid_try_fmt_vid_cap);
>  }
>  
>  int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
> @@ -835,7 +835,7 @@ int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
>  
>  	if (dev->multiplanar)
>  		return -ENOTTY;
> -	return fmt_sp2mp_func(file, priv, f, vivid_s_fmt_vid_cap);
> +	return v4l2_fmt_sp2mp_func(file, priv, f, vivid_s_fmt_vid_cap);
>  }
>  
>  int vivid_vid_cap_g_selection(struct file *file, void *priv,
> diff --git a/drivers/media/platform/vivid/vivid-vid-common.c b/drivers/media/platform/vivid/vivid-vid-common.c
> index 74b83bcc6119..3dd3a05d2e67 100644
> --- a/drivers/media/platform/vivid/vivid-vid-common.c
> +++ b/drivers/media/platform/vivid/vivid-vid-common.c
> @@ -674,65 +674,6 @@ void vivid_send_source_change(struct vivid_dev *dev, unsigned type)
>  	}
>  }
>  
> -/*
> - * Conversion function that converts a single-planar format to a
> - * single-plane multiplanar format.
> - */
> -void fmt_sp2mp(const struct v4l2_format *sp_fmt, struct v4l2_format *mp_fmt)
> -{
> -	struct v4l2_pix_format_mplane *mp = &mp_fmt->fmt.pix_mp;
> -	struct v4l2_plane_pix_format *ppix = &mp->plane_fmt[0];
> -	const struct v4l2_pix_format *pix = &sp_fmt->fmt.pix;
> -	bool is_out = sp_fmt->type == V4L2_BUF_TYPE_VIDEO_OUTPUT;
> -
> -	memset(mp->reserved, 0, sizeof(mp->reserved));
> -	mp_fmt->type = is_out ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE :
> -			   V4L2_CAP_VIDEO_CAPTURE_MPLANE;
> -	mp->width = pix->width;
> -	mp->height = pix->height;
> -	mp->pixelformat = pix->pixelformat;
> -	mp->field = pix->field;
> -	mp->colorspace = pix->colorspace;
> -	mp->xfer_func = pix->xfer_func;
> -	/* Also copies hsv_enc */
> -	mp->ycbcr_enc = pix->ycbcr_enc;
> -	mp->quantization = pix->quantization;
> -	mp->num_planes = 1;
> -	mp->flags = pix->flags;
> -	ppix->sizeimage = pix->sizeimage;
> -	ppix->bytesperline = pix->bytesperline;
> -	memset(ppix->reserved, 0, sizeof(ppix->reserved));
> -}
> -
> -int fmt_sp2mp_func(struct file *file, void *priv,
> -		struct v4l2_format *f, fmtfunc func)
> -{
> -	struct v4l2_format fmt;
> -	struct v4l2_pix_format_mplane *mp = &fmt.fmt.pix_mp;
> -	struct v4l2_plane_pix_format *ppix = &mp->plane_fmt[0];
> -	struct v4l2_pix_format *pix = &f->fmt.pix;
> -	int ret;
> -
> -	/* Converts to a mplane format */
> -	fmt_sp2mp(f, &fmt);
> -	/* Passes it to the generic mplane format function */
> -	ret = func(file, priv, &fmt);
> -	/* Copies back the mplane data to the single plane format */
> -	pix->width = mp->width;
> -	pix->height = mp->height;
> -	pix->pixelformat = mp->pixelformat;
> -	pix->field = mp->field;
> -	pix->colorspace = mp->colorspace;
> -	pix->xfer_func = mp->xfer_func;
> -	/* Also copies hsv_enc */
> -	pix->ycbcr_enc = mp->ycbcr_enc;
> -	pix->quantization = mp->quantization;
> -	pix->sizeimage = ppix->sizeimage;
> -	pix->bytesperline = ppix->bytesperline;
> -	pix->flags = mp->flags;
> -	return ret;
> -}
> -
>  int vivid_vid_adjust_sel(unsigned flags, struct v4l2_rect *r)
>  {
>  	unsigned w = r->width;
> diff --git a/drivers/media/platform/vivid/vivid-vid-common.h b/drivers/media/platform/vivid/vivid-vid-common.h
> index 29b6c0b40a1b..13adea56baa0 100644
> --- a/drivers/media/platform/vivid/vivid-vid-common.h
> +++ b/drivers/media/platform/vivid/vivid-vid-common.h
> @@ -8,15 +8,6 @@
>  #ifndef _VIVID_VID_COMMON_H_
>  #define _VIVID_VID_COMMON_H_
>  
> -typedef int (*fmtfunc)(struct file *file, void *priv, struct v4l2_format *f);
> -
> -/*
> - * Conversion function that converts a single-planar format to a
> - * single-plane multiplanar format.
> - */
> -void fmt_sp2mp(const struct v4l2_format *sp_fmt, struct v4l2_format *mp_fmt);
> -int fmt_sp2mp_func(struct file *file, void *priv,
> -		struct v4l2_format *f, fmtfunc func);
>  
>  extern const struct v4l2_dv_timings_cap vivid_dv_timings_cap;
>  
> diff --git a/drivers/media/platform/vivid/vivid-vid-out.c b/drivers/media/platform/vivid/vivid-vid-out.c
> index 9350ca65dd91..e9d68ccbcc5d 100644
> --- a/drivers/media/platform/vivid/vivid-vid-out.c
> +++ b/drivers/media/platform/vivid/vivid-vid-out.c
> @@ -612,7 +612,7 @@ int vidioc_g_fmt_vid_out(struct file *file, void *priv,
>  
>  	if (dev->multiplanar)
>  		return -ENOTTY;
> -	return fmt_sp2mp_func(file, priv, f, vivid_g_fmt_vid_out);
> +	return v4l2_fmt_sp2mp_func(file, priv, f, vivid_g_fmt_vid_out);
>  }
>  
>  int vidioc_try_fmt_vid_out(struct file *file, void *priv,
> @@ -622,7 +622,7 @@ int vidioc_try_fmt_vid_out(struct file *file, void *priv,
>  
>  	if (dev->multiplanar)
>  		return -ENOTTY;
> -	return fmt_sp2mp_func(file, priv, f, vivid_try_fmt_vid_out);
> +	return v4l2_fmt_sp2mp_func(file, priv, f, vivid_try_fmt_vid_out);
>  }
>  
>  int vidioc_s_fmt_vid_out(struct file *file, void *priv,
> @@ -632,7 +632,7 @@ int vidioc_s_fmt_vid_out(struct file *file, void *priv,
>  
>  	if (dev->multiplanar)
>  		return -ENOTTY;
> -	return fmt_sp2mp_func(file, priv, f, vivid_s_fmt_vid_out);
> +	return v4l2_fmt_sp2mp_func(file, priv, f, vivid_s_fmt_vid_out);
>  }
>  
>  int vivid_vid_out_g_selection(struct file *file, void *priv,
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index b5778b2ffa27..0aeec23e0cef 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -631,3 +631,65 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, int pixelformat, int width,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> +
> +/*
> + * Conversion functions that convert a single-planar format to a
> + * multi-planar format.
> + */
> +void v4l2_fmt_sp2mp(const struct v4l2_format *sp_fmt,
> +		    struct v4l2_format *mp_fmt)
> +{
> +	struct v4l2_pix_format_mplane *mp = &mp_fmt->fmt.pix_mp;
> +	struct v4l2_plane_pix_format *ppix = &mp->plane_fmt[0];
> +	const struct v4l2_pix_format *pix = &sp_fmt->fmt.pix;
> +	bool is_out = sp_fmt->type == V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +
> +	memset(mp->reserved, 0, sizeof(mp->reserved));
> +	mp_fmt->type = is_out ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE :
> +			   V4L2_CAP_VIDEO_CAPTURE_MPLANE;
> +	mp->width = pix->width;
> +	mp->height = pix->height;
> +	mp->pixelformat = pix->pixelformat;
> +	mp->field = pix->field;
> +	mp->colorspace = pix->colorspace;
> +	mp->xfer_func = pix->xfer_func;
> +	/* Also copies hsv_enc */
> +	mp->ycbcr_enc = pix->ycbcr_enc;
> +	mp->quantization = pix->quantization;
> +	mp->num_planes = 1;
> +	mp->flags = pix->flags;
> +	ppix->sizeimage = pix->sizeimage;
> +	ppix->bytesperline = pix->bytesperline;
> +	memset(ppix->reserved, 0, sizeof(ppix->reserved));
> +}
> +EXPORT_SYMBOL_GPL(v4l2_fmt_sp2mp);

Is this function ever used outside v4l2_fmt_sp2mp_func()? I suspect that this
doesn't have to be exported at all and can just be a static function.

Even better, it can be moved into v4l2_fmt_sp2mp_func(). I'm not sure why
this is a separate function in vivid. I have a faint memory that originally
I had fmt_sp2mp and fmt_mp2sp functions, but then I created fmt_sp2mp_func()
and for some reason kept fmt_sp2mp as a separate function.

Since we're moving this to v4l2-common.c I think this is a good time to clean
this up.

> +
> +int v4l2_fmt_sp2mp_func(struct file *file, void *priv, struct v4l2_format *f,
> +			v4l2_fmtfunc func)
> +{
> +	struct v4l2_format fmt;
> +	struct v4l2_pix_format_mplane *mp = &fmt.fmt.pix_mp;
> +	struct v4l2_plane_pix_format *ppix = &mp->plane_fmt[0];
> +	struct v4l2_pix_format *pix = &f->fmt.pix;
> +	int ret;
> +
> +	/* Converts to a mplane format */
> +	v4l2_fmt_sp2mp(f, &fmt);
> +	/* Passes it to the generic mplane format function */
> +	ret = func(file, priv, &fmt);
> +	/* Copies back the mplane data to the single plane format */
> +	pix->width = mp->width;
> +	pix->height = mp->height;
> +	pix->pixelformat = mp->pixelformat;
> +	pix->field = mp->field;
> +	pix->colorspace = mp->colorspace;
> +	pix->xfer_func = mp->xfer_func;
> +	/* Also copies hsv_enc */
> +	pix->ycbcr_enc = mp->ycbcr_enc;
> +	pix->quantization = mp->quantization;
> +	pix->sizeimage = ppix->sizeimage;
> +	pix->bytesperline = ppix->bytesperline;
> +	pix->flags = mp->flags;
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_fmt_sp2mp_func);
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 0a41bbecf3d3..e46c1f451f8c 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -425,4 +425,41 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, int pixelformat,
>  int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, int pixelformat,
>  			int width, int height);
>  
> +/**
> + * v4l2_fmtfunc - function pointer for v4l2_fmt_sp2mp()
> + *
> + * @file: device's descriptor file
> + * @priv: private data pointer
> + * @f: format that holds a mp pixel format
> + *
> + * Function type used by v4l2_fmt_sp2mp_func(). Please, see v4l2_fmt_sp2mp_func
> + * for more details.
> + */
> +typedef int (*v4l2_fmtfunc)(struct file *file, void *priv,
> +			    struct v4l2_format *f);
> +
> +/**
> + * v4l2_fmt_sp2mp - transforms a single-planar format struct into a multi-planar
> + * struct
> + *
> + * @sp_fmt: pointer to the single-planar format struct (in)
> + * @mp_fmt: pointer to the multi-planar format struct (out)
> + */
> +void v4l2_fmt_sp2mp(const struct v4l2_format *sp_fmt,
> +		    struct v4l2_format *mp_fmt);

So this prototype can be dropped here as well.

> +
> +/**
> + * v4l2_fmt_sp2mp_func - handler for single-planar format functions
> + * @file: device's descriptor file
> + * @priv: private data pointer
> + * @f: format that holds a sp pixel format
> + * @func: generic mp function
> + *
> + * Handler to call a generic multi-planar format function using single-planar
> + * format. It converts the sp to a mp (using v4l2_fmt_sp2mp), pass the mp struct

pass -> passes

> + * as argument to v4l2_fmtfunc func, and converts mp back to sp.

as argument -> as an argument

> + */
> +int v4l2_fmt_sp2mp_func(struct file *file, void *priv, struct v4l2_format *f,
> +			v4l2_fmtfunc func);
> +
>  #endif /* V4L2_COMMON_H_ */
> 

Regards,

	Hans

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D0A3DFE9B
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 12:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237320AbhHDKAj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 06:00:39 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47015 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237315AbhHDKAj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Aug 2021 06:00:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id BDhGmaPHbXTlcBDhHmnpFd; Wed, 04 Aug 2021 12:00:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628071224; bh=KSdGSBV5fr3vQJvp0oMWkQ2LZO+Qxe2IRaqgWHkh1TE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=b0wi9Y/hn8IuWcax8Wkg0+x4aRnxOKcHOJZY89L5tgi6O/pibcxiuERltWB1L6IbQ
         dJpb3QU/9yxBhsLhMVhIGF4wYiMYXNcEfEAniLKgRlJZZYiq8TDjLt8iGDIavilN7D
         M+i98Rv6Vou0s6y9StaoUCOuetmiBNvzNbv9Z94eVRCHCRbNSn3MM5MK0Al+v8GFir
         h/2aDSWpvLcylb9k7XmsriVesibSRTqeFuTgM56jpVg1Hua4F8xpRM0i5w9QadAtMW
         ms9fWMEoajlfxzIWoAHIrKDaesDRY3Z36c3+j8hGnBVHBnfWUWl4eTKwOy3bet6Izm
         lmPYN0EFBR+lA==
Subject: Re: [PATCH v2 1/4] media: Rename V4L2_PIX_FMT_SUNXI_TILED_NV12 to
 V4L2_PIX_FMT_NV12_32L32
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Deng <yong.deng@magewell.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20210727145745.25203-1-ezequiel@collabora.com>
 <20210727145745.25203-2-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <70171d2e-99f7-5534-06a6-2a077ad61e0d@xs4all.nl>
Date:   Wed, 4 Aug 2021 12:00:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727145745.25203-2-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLoQID/w5dEXeHgegiAShG3xMiySzY1PeMxH2wMpdIYAnM6fmCZijsftKVPL3R1lw2UwBLFSbm7ptA2NruOvaA01iu2reJDdl0qhH4EUg/rg1orHDt6K
 yWRUHGA5Lc5h6HUisIT9tNfDQ4+ib4rs2QhK48xoTozbPSz1njxrM6/7PY4y8bpVkLtFwn/RyzHcRrAR1s0VnbqfY4RFXyxJuEQPe01cYnHrzyBwEooaxX+M
 ejrMTiwW2cxGS4KjrP52Fu3gbVk6CllrHkb1zr9bZfsmJndPtl+iZkrxfL+SR0k9pCzzQhscEhoFatuXcoE60Z0eSRjkm5iILyhp5bQz5oV3lpWIc73aYUbS
 8mgGv5FOO+W/rkFd0XCsyAqMui7wdYiSek+3v5KjzP131jfCcmWyFbGHSglPxw+XDnDllv78KxLBL8ghDo+yCIc/wMTuuVbLTXOJA4ReybHhG89IEtfz1utF
 0XUFnYhxcb+cFkyIcpVyuvj3ZfaOKL3iXV/oaA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Some comments:

On 27/07/2021 16:57, Ezequiel Garcia wrote:
> The V4L2_PIX_FMT_SUNXI_TILED_NV12 format is actually a fairly
> common NV12 tiled format, with 32x32 linear tiles. Rename the format
> and move its documentation together with the other tiled NV12 formats.
> 
> Keep V4L2_PIX_FMT_SUNXI_TILED_NV12 for application compatibility.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-reserved.rst    | 14 --------------
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  | 13 ++++++++++---
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c        |  2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |  2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c  |  4 ++--
>  include/uapi/linux/videodev2.h                     |  9 ++++++++-
>  7 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> index 0b879c0da713..e762f911737a 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> @@ -246,20 +246,6 @@ please make a proposal on the linux-media mailing list.
>  	It is an opaque intermediate format and the MDP hardware must be
>  	used to convert ``V4L2_PIX_FMT_MT21C`` to ``V4L2_PIX_FMT_NV12M``,
>  	``V4L2_PIX_FMT_YUV420M`` or ``V4L2_PIX_FMT_YVU420``.
> -    * .. _V4L2-PIX-FMT-SUNXI-TILED-NV12:
> -
> -      - ``V4L2_PIX_FMT_SUNXI_TILED_NV12``
> -      - 'ST12'
> -      - Two-planar NV12-based format used by the video engine found on Allwinner
> -	(codenamed sunxi) platforms, with 32x32 tiles for the luminance plane
> -	and 32x64 tiles for the chrominance plane. The data in each tile is
> -	stored in linear order, within the tile bounds. Each tile follows the
> -	previous one linearly in memory (from left to right, top to bottom).
> -
> -	The associated buffer dimensions are aligned to match an integer number
> -	of tiles, resulting in 32-aligned resolutions for the luminance plane
> -	and 16-aligned resolutions for the chrominance plane (with 2x2
> -	subsampling).
>  
>  .. raw:: latex
>  
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 090c091affd2..edeaf7628b28 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -254,14 +254,16 @@ of the luma plane.
>  
>  .. _V4L2-PIX-FMT-NV12MT:
>  .. _V4L2-PIX-FMT-NV12MT-16X16:
> +.. _V4L2-PIX-FMT-NV12-32L32:
>  
> -NV12MT and MV12MT_16X16
> ------------------------
> +Tiled NV12
> +----------
>  
>  Semi-planar YUV 4:2:0 formats, using macroblock tiling. The chroma plane is
>  subsampled by 2 in each direction. Chroma lines contain half the number of
>  pixels and the same number of bytes as luma lines, and the chroma plane
> -contains half the number of lines of the luma plane.
> +contains half the number of lines of the luma plane. Each tile follows the
> +previous one linearly in memory (from left to right, top to bottom).
>  
>  ``V4L2_PIX_FMT_NV12MT_16X16`` stores pixel in 2D 16x16 macroblocks, and stores
>  macroblocks linearly in memory. The line stride and image height must be
> @@ -276,6 +278,11 @@ If the vertical resolution is an odd number of macroblocks, the last row of
>  macroblocks is stored in linear order. The layouts of the luma and chroma
>  planes are identical.
>  
> +``V4L2_PIX_FMT_NV12_32L32`` stores pixel in 32x32 tiles, and stores
> +tiles linearly in memory. The line stride and image height must be
> +aligned to a multiple of 32. The layouts of the luma and chroma planes are
> +identical.
> +
>  .. _nv12mt:
>  
>  .. kernel-figure:: nv12mt.svg
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 05d5db3d85e5..0aaeb79d7a22 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1282,6 +1282,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_NV61:		descr = "Y/CrCb 4:2:2"; break;
>  	case V4L2_PIX_FMT_NV24:		descr = "Y/CbCr 4:4:4"; break;
>  	case V4L2_PIX_FMT_NV42:		descr = "Y/CrCb 4:4:4"; break;
> +	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/CbCr 4:2:0 (32x32 linear tiles)"; break;

This string is too long, more than 31 characters.

I suggest changing this to "Y/CbCr 4:2:0 (32x32 Linear)"

>  	case V4L2_PIX_FMT_NV12M:	descr = "Y/CbCr 4:2:0 (N-C)"; break;
>  	case V4L2_PIX_FMT_NV21M:	descr = "Y/CrCb 4:2:0 (N-C)"; break;
>  	case V4L2_PIX_FMT_NV16M:	descr = "Y/CbCr 4:2:2 (N-C)"; break;
> @@ -1415,7 +1416,6 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  		case V4L2_PIX_FMT_SE401:	descr = "GSPCA SE401"; break;
>  		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
>  		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
> -		case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
>  		default:
>  			if (fmt->description[0])
>  				return;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index c0d005dafc6c..7dd952a2f280 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -282,7 +282,7 @@ static int cedrus_open(struct file *file)
>  		ret = PTR_ERR(ctx->fh.m2m_ctx);
>  		goto err_ctrls;
>  	}
> -	ctx->dst_fmt.pixelformat = V4L2_PIX_FMT_SUNXI_TILED_NV12;
> +	ctx->dst_fmt.pixelformat = V4L2_PIX_FMT_NV12_32L32;
>  	cedrus_prepare_format(&ctx->dst_fmt);
>  	ctx->src_fmt.pixelformat = V4L2_PIX_FMT_MPEG2_SLICE;
>  	/*
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> index e2f2ff609c7e..2d7663726467 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -99,7 +99,7 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
>  		cedrus_write(dev, VE_PRIMARY_FB_LINE_STRIDE, reg);
>  
>  		break;
> -	case V4L2_PIX_FMT_SUNXI_TILED_NV12:
> +	case V4L2_PIX_FMT_NV12_32L32:
>  	default:
>  		reg = VE_PRIMARY_OUT_FMT_TILED_32_NV12;
>  		cedrus_write(dev, VE_PRIMARY_OUT_FMT, reg);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index c589fe9dae70..dbc0b2ad598f 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -56,7 +56,7 @@ static struct cedrus_format cedrus_formats[] = {
>  		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
>  	},
>  	{
> -		.pixelformat	= V4L2_PIX_FMT_SUNXI_TILED_NV12,
> +		.pixelformat	= V4L2_PIX_FMT_NV12_32L32,
>  		.directions	= CEDRUS_DECODE_DST,
>  	},
>  	{
> @@ -124,7 +124,7 @@ void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
>  		sizeimage = max_t(u32, SZ_1K, sizeimage);
>  		break;
>  
> -	case V4L2_PIX_FMT_SUNXI_TILED_NV12:
> +	case V4L2_PIX_FMT_NV12_32L32:
>  		/* 32-aligned stride. */
>  		bytesperline = ALIGN(width, 32);
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9260791b8438..97cfcc861865 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -627,6 +627,9 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_YUV444M v4l2_fourcc('Y', 'M', '2', '4') /* 24  YUV444 planar */
>  #define V4L2_PIX_FMT_YVU444M v4l2_fourcc('Y', 'M', '4', '2') /* 24  YVU444 planar */
>  
> +/* Tiled YUV formats */
> +#define V4L2_PIX_FMT_NV12_32L32 v4l2_fourcc('S', 'T', '1', '2') /* 12  Y/CbCr 4:2:0 32x32 tiles */
> +
>  /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
>  #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
>  #define V4L2_PIX_FMT_SGBRG8  v4l2_fourcc('G', 'B', 'R', 'G') /*  8  GBGB.. RGRG.. */
> @@ -734,7 +737,6 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
>  #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
>  #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
> -#define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
>  #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
>  #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
>  
> @@ -2615,4 +2617,9 @@ struct v4l2_create_buffers {
>  
>  #define BASE_VIDIOC_PRIVATE	192		/* 192-255 are private */
>  
> +/* Deprecated definitions kept for backwards compatibility */
> +#ifdef __KERNEL__

Should be #ifndef

> +#define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */

Why not define this as:

#define V4L2_PIX_FMT_SUNXI_TILED_NV12 V4L2_PIX_FMT_NV12_32L32

That way it is clear that this is an alias.

Regards,

	Hans

> +#endif
> +
>  #endif /* _UAPI__LINUX_VIDEODEV2_H */
> 


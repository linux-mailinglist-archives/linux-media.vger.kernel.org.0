Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A96B3DFEE9
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 12:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236909AbhHDKFm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 06:05:42 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:51525 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235066AbhHDKFl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Aug 2021 06:05:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id BDm9maR1VXTlcBDmAmnq5z; Wed, 04 Aug 2021 12:05:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628071526; bh=u8zhgdYWi8WmYTn777FyFd8ja+Udt25opAU7Q5Mf0r8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OBdQ4vM9Ahxc/2/5zs8t6Mg3Dcat4w92Vgl7Oqz/5dPM4QZTBbvR+lEZkeb4T1S5R
         oX9KrN3U2QjPJf5j644J0jET8vkuIB0M+Bgr974X8Lp9bJwhpDConxfPp4ZqgkmQdX
         E9u8rSFPWt7GdD7J1EbNSqSI1R3zc6M3oviHzCdaC6q1WhQOHj38iPon20h3L5kv9J
         6BP20ZYDeDrSq4K6POjz4JdDNU+5ZdYOo/3RJ8/BJ+vfDw29CQJ14DzY11FlIc/YC+
         CXJKt5J+z+2frvzIjHPxsHbLI1fmRn9SY39tsc29FQRoDAYJL6LVjg/nIkU4lFPeVk
         GIuyt/agUnRsA==
Subject: Re: [PATCH v2 3/4] media: Add NV12_4L4 tiled format
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Deng <yong.deng@magewell.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20210727145745.25203-1-ezequiel@collabora.com>
 <20210727145745.25203-4-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <41fdaecb-7637-3bb1-b224-4eba7c3a8acd@xs4all.nl>
Date:   Wed, 4 Aug 2021 12:05:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727145745.25203-4-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDloeHNCtrx/+EYKYAenh1Ia3hFEbQms/GTNs0kgk2L4lHeQFyiMFB2nJhDvxHEMcPIgA9o/M0B2MOBEUyH4bqJNy/UdVZ/5xvYVQCTOtl2fbRfXySMg
 q0ZrBtlmPUJn9Jh6pRNBC73NI9DTVYRYIVHrKZkF4dWDbmGayq2ZV9ifxp2lsm9DQVFOUpKaKkGCNu46OjFobWdjO1mqOJaGDvkgSadnwY5upr7UmUDWIjZ+
 DhiSKGr4Uu4GwHgNZ8WCWO2PfKzq/IbW608b/f+ftxLJQexOyZXRGYoRVqGIu82Ng1XozD6wt5BfryIMmR9k/2VIDn5Fl4f2BhFToNE9nMLPhEIOdD3MzMXM
 EiEkoWU1ZJpQXmou7X8PMh/tHg20rfmy1nygd2z+r9dwVqeagAAf0q609gbM66voCcf1hND+Hlbyt+ocNU50ufLjSqujGWQwZ5KQm6X0oeQi/+BRz9Mz3qkA
 ISqkUyQKZuO6Ej3dnenYZcoYWDe+hSKl3kReYA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/07/2021 16:57, Ezequiel Garcia wrote:
> This format is produced by VeriSilicon Hantro G2 and VC8000D cores.
> It is a simple 4x4 tiling layout in a linear way.
> 
> The pixel format was introduced by GStreamer using FourCC VT12,
> so let's stick to it.
> 
> Link: https://gstreamer.freedesktop.org/documentation/video/video-format.html
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst | 6 ++++++
>  drivers/media/v4l2-core/v4l2-common.c                       | 3 +++
>  drivers/media/v4l2-core/v4l2-ioctl.c                        | 1 +
>  include/uapi/linux/videodev2.h                              | 1 +
>  4 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 884828f2272c..0fc74351605a 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -254,6 +254,7 @@ of the luma plane.
>  
>  .. _V4L2-PIX-FMT-NV12MT:
>  .. _V4L2-PIX-FMT-NV12MT-16X16:
> +.. _V4L2-PIX-FMT-NV12-4L4:
>  .. _V4L2-PIX-FMT-NV12-16L16:
>  .. _V4L2-PIX-FMT-NV12-32L32:
>  
> @@ -279,6 +280,11 @@ If the vertical resolution is an odd number of macroblocks, the last row of
>  macroblocks is stored in linear order. The layouts of the luma and chroma
>  planes are identical.
>  
> +``V4L2_PIX_FMT_NV12_4L4`` stores pixel in 4x4 tiles, and stores
> +tiles linearly in memory. The line stride and image height must be
> +aligned to a multiple of 4. The layouts of the luma and chroma planes are
> +identical.
> +
>  ``V4L2_PIX_FMT_NV12_16L16`` stores pixel in 16x16 tiles, and stores
>  tiles linearly in memory. The line stride and image height must be
>  aligned to a multiple of 16. The layouts of the luma and chroma planes are
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 04af03285a20..df34b2a283bc 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -275,6 +275,9 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>  		{ .format = V4L2_PIX_FMT_YUV422P, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>  
> +		/* Tiled YUV formats */
> +		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> +
>  		/* YUV planar formats, non contiguous variant */
>  		{ .format = V4L2_PIX_FMT_YUV420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
>  		{ .format = V4L2_PIX_FMT_YVU420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 9a4195dcd2aa..00c15630fc60 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1281,6 +1281,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_NV61:		descr = "Y/CrCb 4:2:2"; break;
>  	case V4L2_PIX_FMT_NV24:		descr = "Y/CbCr 4:4:4"; break;
>  	case V4L2_PIX_FMT_NV42:		descr = "Y/CrCb 4:4:4"; break;
> +	case V4L2_PIX_FMT_NV12_4L4:	descr = "Y/CbCr 4:2:0 (4x4 linear tiles)"; break;

To remain consistent I would also rename this to "Y/CbCr 4:2:0 (4x4 Linear)".

Regards,

	Hans

>  	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/CbCr 4:2:0 (16x16 linear tiles)"; break;
>  	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/CbCr 4:2:0 (32x32 linear tiles)"; break;
>  	case V4L2_PIX_FMT_NV12M:	descr = "Y/CbCr 4:2:0 (N-C)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 60abed3243f3..5cf71d3aa0a4 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -627,6 +627,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_YVU444M v4l2_fourcc('Y', 'M', '4', '2') /* 24  YVU444 planar */
>  
>  /* Tiled YUV formats */
> +#define V4L2_PIX_FMT_NV12_4L4 v4l2_fourcc('V', 'T', '1', '2')   /* 12  Y/CbCr 4:2:0  4x4 tiles */
>  #define V4L2_PIX_FMT_NV12_16L16 v4l2_fourcc('H', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
>  #define V4L2_PIX_FMT_NV12_32L32 v4l2_fourcc('S', 'T', '1', '2') /* 12  Y/CbCr 4:2:0 32x32 tiles */
>  
> 


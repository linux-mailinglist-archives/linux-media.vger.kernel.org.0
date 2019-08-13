Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 188268B035
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 08:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfHMGyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 02:54:51 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:42029 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726769AbfHMGyu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 02:54:50 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xQhchINqTqTdhxQhfh74b9; Tue, 13 Aug 2019 08:54:48 +0200
Subject: Re: [PATCH] media: v4l: Add packed YUV444 24bpp pixel format
To:     Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org
Cc:     vivek.kasireddy@intel.com, sakari.ailus@linux.intel.com,
        s.nawrocki@samsung.com, niklas.soderlund+renesas@ragnatech.se,
        ezequiel@collabora.com, paul.kocialkowski@bootlin.com,
        boris.brezillon@collabora.com, robert.chiras@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com
References: <1562166911-27454-1-git-send-email-mirela.rabulea@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a6b91ccf-8961-d9a9-c007-d113bcba7156@xs4all.nl>
Date:   Tue, 13 Aug 2019 08:54:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1562166911-27454-1-git-send-email-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKBSp+YyPXW+7DMk9aBFy0pAbkzzPAsi80OWEUAttJ0pNr0oFwCLe19GGRqICu69iHTJ6Rim9NoB38fOVA1cVQGJVdfJuEIOC49gnPVKJ+Ytfr7YWTyv
 a73fBFPAOxNprP6X+jYWQfepuaz2NB2sLWQleTcLLh/mBuZTr+aUEoDem5we32EsSfSYET4DpmU0/7nzPEF/Ynp0q6ntbD3bWDtHF/DsMji74t6I3dzqg9iK
 Xjb7anelMkuoo2ds2TMDcbwRBn5R1+ov1ruam0lWQf2bgucAd3233Rs6uCgUOan0ArU6QbDv87aWRlz5cYvEmfusClYQHo7YAj1E/iG9R/iyGFGaKUpUizq3
 8gaUpfvMVCyoKYtHayHsLcVg5YZiHetssQ3BWUGeF3mLJy3UAEtdl6y/824R+0wKftvzboNIi9eB3e0e9mUct7FkcjOXcAHFMBWITgDNElG0IbsUvZEo+Xkr
 cd9g8iIyLtG+7qgtNvvvEzcMcIdS+VB3idy+Ofxw0dS+Mnc09FvUk+zCoH+dl0oTRM9XEnDevEq1nhgkig663c5KewFpNSTRv1ViuqKv0bOx2U++5eSQnsfH
 4TsAypLItWAY3V6MCAFbMaU1a3nudAIgeHRPUNY9E79KUHVmm+vvOX4ObXZSyGSabb0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mirela,

On 7/3/19 5:15 PM, Mirela Rabulea wrote:
> The added format is V4L2_PIX_FMT_YUV24, this is a packed
> YUV 4:4:4 format, with 8 bits for each component, 24 bits
> per sample.
> 
> This format is used by the i.MX 8QuadMax and i.MX 8DualXPlus/8QuadXPlus
> JPEG encoder/decoder.

This patch looks good, but it can only be merged if we also have a driver
that uses it. This to avoid having lots of pixelformat defines that nobody
is using in the kernel.

Are there plans to upstream this JPEG en/decoder?

Regards,

	Hans

> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst | 37 +++++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
>  include/uapi/linux/videodev2.h                     |  1 +
>  3 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst b/Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst
> index 41b60fa..5750ff6 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst
> @@ -17,7 +17,8 @@ Description
>  ===========
>  
>  Similar to the packed RGB formats these formats store the Y, Cb and Cr
> -component of each pixel in one 16 or 32 bit word.
> +component of each pixel next to each other in memory. They occupy 16, 24 or 32
> +bits per pixel.
>  
>  
>  .. raw:: latex
> @@ -157,6 +158,40 @@ component of each pixel in one 16 or 32 bit word.
>  
>        -  :cspan:`15`
>  
> +    * .. _V4L2-PIX-FMT-YUV24:
> +
> +      - ``V4L2_PIX_FMT_YUV24``
> +      - 'YUV3'
> +
> +      - Y'\ :sub:`7`
> +      - Y'\ :sub:`6`
> +      - Y'\ :sub:`5`
> +      - Y'\ :sub:`4`
> +      - Y'\ :sub:`3`
> +      - Y'\ :sub:`2`
> +      - Y'\ :sub:`1`
> +      - Y'\ :sub:`0`
> +
> +      - Cb\ :sub:`7`
> +      - Cb\ :sub:`6`
> +      - Cb\ :sub:`5`
> +      - Cb\ :sub:`4`
> +      - Cb\ :sub:`3`
> +      - Cb\ :sub:`2`
> +      - Cb\ :sub:`1`
> +      - Cb\ :sub:`0`
> +
> +      - Cr\ :sub:`7`
> +      - Cr\ :sub:`6`
> +      - Cr\ :sub:`5`
> +      - Cr\ :sub:`4`
> +      - Cr\ :sub:`3`
> +      - Cr\ :sub:`2`
> +      - Cr\ :sub:`1`
> +      - Cr\ :sub:`0`
> +
> +      -  :cspan:`7`
> +
>      * .. _V4L2-PIX-FMT-YUV32:
>  
>        - ``V4L2_PIX_FMT_YUV32``
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index b1f4b99..9bb6579 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1215,6 +1215,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_YUV444:	descr = "16-bit A/XYUV 4-4-4-4"; break;
>  	case V4L2_PIX_FMT_YUV555:	descr = "16-bit A/XYUV 1-5-5-5"; break;
>  	case V4L2_PIX_FMT_YUV565:	descr = "16-bit YUV 5-6-5"; break;
> +	case V4L2_PIX_FMT_YUV24:	descr = "24-bit YUV 4:4:4 8-8-8"; break;
>  	case V4L2_PIX_FMT_YUV32:	descr = "32-bit A/XYUV 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_AYUV32:	descr = "32-bit AYUV 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9d9705c..752dd33 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -577,6 +577,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_YUV444  v4l2_fourcc('Y', '4', '4', '4') /* 16  xxxxyyyy uuuuvvvv */
>  #define V4L2_PIX_FMT_YUV555  v4l2_fourcc('Y', 'U', 'V', 'O') /* 16  YUV-5-5-5     */
>  #define V4L2_PIX_FMT_YUV565  v4l2_fourcc('Y', 'U', 'V', 'P') /* 16  YUV-5-6-5     */
> +#define V4L2_PIX_FMT_YUV24   v4l2_fourcc('Y', 'U', 'V', '3') /* 24  YUV-8-8-8     */
>  #define V4L2_PIX_FMT_YUV32   v4l2_fourcc('Y', 'U', 'V', '4') /* 32  YUV-8-8-8-8   */
>  #define V4L2_PIX_FMT_AYUV32  v4l2_fourcc('A', 'Y', 'U', 'V') /* 32  AYUV-8-8-8-8  */
>  #define V4L2_PIX_FMT_XYUV32  v4l2_fourcc('X', 'Y', 'U', 'V') /* 32  XYUV-8-8-8-8  */
> 


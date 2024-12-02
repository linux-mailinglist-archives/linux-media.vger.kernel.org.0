Return-Path: <linux-media+bounces-22479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 476169E0A46
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 18:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04F0B282BAC
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 17:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63351DB520;
	Mon,  2 Dec 2024 17:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pJDaAg6r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55ED13E40F
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733161280; cv=none; b=AXotP7a3BuXgQoMmk8jlGh5t0eYHj13yHXkRCLRmtSySdQ/6rxHOl3FYP39oSqMkDS/4yy0BnVKLlANGzPcVH9rIL+UxxE4OsMjkYoTyhHk1ouBCo4JRkn2EyA9r+HMNGq/qfdlNSG5bBki+8pUrIqggqnu8iwz3BB7p8qTQf4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733161280; c=relaxed/simple;
	bh=KztWNgHqmpK+K0IfKY2tXCt/W0+JmLJkPmchhkb++OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbtD6WqJTEmieWVU6hwK6RXYsBn1W3mkpHNVXQ3QqHGucfuhAyTFhg3q7j/F0w1DWeVm9ECS76eG1w1vgsow5miXJu0koURZ99z4wduhUe1yPHKlLZvWbAFwYD3BNd/KUAJFlOHTVCu2RXl3YqGAr1FuxVnR2U/UqpwsdzuiJ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pJDaAg6r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B06F9514;
	Mon,  2 Dec 2024 18:40:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733161246;
	bh=KztWNgHqmpK+K0IfKY2tXCt/W0+JmLJkPmchhkb++OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJDaAg6rrhxm2mdN+02n3By9EcMgvpp1JIl3QoHQl2Zn8rVQm9inVlw4PMgTWrovE
	 wfFoQFwygVWgQ0M8Hkqr0O3pub5g7yKx8K2EiEPByTt59dMVl06CEk5NtI/pzhEZgP
	 ZLkpsy9F6K2bLAChNCmd1vWP9q0tiwOIlnMZHOJI=
Date: Mon, 2 Dec 2024 19:41:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com, isaac.scott@ideasonboard.com
Subject: Re: [PATCH v3 1/5] media: v4l2: Add Renesas Camera Receiver Unit
 pixel formats
Message-ID: <20241202174102.GC609@pendragon.ideasonboard.com>
References: <20241202145831.127297-1-dan.scally@ideasonboard.com>
 <20241202145831.127297-2-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202145831.127297-2-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Mon, Dec 02, 2024 at 02:58:27PM +0000, Daniel Scally wrote:
> The Renesas Camera Receiver Unit in the RZ/V2H SoC can output RAW
> data captured from an image sensor without conversion to an RGB/YUV
> format. In that case the data are packed into 64-bit blocks, with a
> variable amount of padding in the most significant bits depending on
> the bitdepth of the data. Add new V4L2 pixel format codes for the new
> formats, along with documentation to describe them.
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v3:
> 
> 	- Switched from bayer-order specific formats to generic RAWnn
> 
> Changes in v2:
> 
> 	- Added labels to the new formats in the documentation file
> 	- Added 20-bit formats
> 
>  .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
>  .../media/v4l/pixfmt-rawnn-cru.rst            | 144 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |   4 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
>  include/uapi/linux/videodev2.h                |   6 +
>  5 files changed, 159 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> index ed3eb432967d9..20a8aa0433047 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> @@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
>      pixfmt-srggb14
>      pixfmt-srggb14p
>      pixfmt-srggb16
> +    pixfmt-rawnn-cru
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> new file mode 100644
> index 0000000000000..959ecc33654a1
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> @@ -0,0 +1,144 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _v4l2-pix-fmt-cru-raw10:
> +.. _v4l2-pix-fmt-cru-raw12:
> +.. _v4l2-pix-fmt-cru-raw14:
> +.. _v4l2-pix-fmt-cru-raw20:
> +
> +**********************************************************************************************************************************
> +V4L2_PIX_FMT_CRU_RAW10 ('CR10'), V4L2_PIX_FMT_CRU_RAW12 ('CR12'), V4L2_PIX_FMT_CRU_RAW14 ('CR14'), V4L2_PIX_FMT_CRU_RAW20 ('CR20')
> +**********************************************************************************************************************************
> +
> +===============================================================
> +Renesas RZ/V2H Camera Receiver Unit 64-bit packed pixel formats
> +===============================================================
> +
> +| V4L2_PIX_FMT_CRU_RAW10 (CR10)
> +| V4L2_PIX_FMT_CRU_RAW12 (CR12)
> +| V4L2_PIX_FMT_CRU_RAW14 (CR14)
> +| V4L2_PIX_FMT_CRU_RAW20 (CR20)
> +
> +Description
> +===========
> +
> +These pixel formats are some of the Bayer RAW outputs for the Camera Receiver

s/Bayer // as they're "just" raw formats, not specific to the Bayer CFA
pattern.

> +Unit in the Renesas RZ/V2H SoC. They are raw sRGB / Bayer formats which pack

sRGB seems even weirder to mention here.

> +pixels contiguously into 64-bit units, with the 4 or 8 most significant
> +bits padded.
> +
> +**Byte Order**
> +
> +.. flat-table:: RGB formats

s/RGB/RAW/

> +    :header-rows:  2
> +    :stub-columns: 0
> +    :widths: 36 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
> +    :fill-cells:
> +
> +    * - :rspan:`1` Pixel Format Code
> +      - :cspan:`63` Data organization
> +    * - 63
> +      - 62
> +      - 61
> +      - 60
> +      - 59
> +      - 58
> +      - 57
> +      - 56
> +      - 55
> +      - 54
> +      - 53
> +      - 52
> +      - 51
> +      - 50
> +      - 49
> +      - 48
> +      - 47
> +      - 46
> +      - 45
> +      - 44
> +      - 43
> +      - 42
> +      - 41
> +      - 40
> +      - 39
> +      - 38
> +      - 37
> +      - 36
> +      - 35
> +      - 34
> +      - 33
> +      - 32
> +      - 31
> +      - 30
> +      - 29
> +      - 28
> +      - 27
> +      - 26
> +      - 25
> +      - 24
> +      - 23
> +      - 22
> +      - 21
> +      - 20
> +      - 19
> +      - 18
> +      - 17
> +      - 16
> +      - 15
> +      - 14
> +      - 13
> +      - 12
> +      - 11
> +      - 10
> +      - 9
> +      - 8
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +    * - V4L2_PIX_FMT_CRU_RAW10
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - :cspan:`9` P5
> +      - :cspan:`9` P4
> +      - :cspan:`9` P3
> +      - :cspan:`9` P2
> +      - :cspan:`9` P1
> +      - :cspan:`9` P0
> +    * - V4L2_PIX_FMT_CRU_RAW12
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - :cspan:`11` P4
> +      - :cspan:`11` P3
> +      - :cspan:`11` P2
> +      - :cspan:`11` P1
> +      - :cspan:`11` P0
> +    * - V4L2_PIX_FMT_CRU_RAW14
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - :cspan:`13` P3
> +      - :cspan:`13` P2
> +      - :cspan:`13` P1
> +      - :cspan:`13` P0
> +    * - V4L2_PIX_FMT_CRU_RAW20
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - :cspan:`19` P2
> +      - :cspan:`19` P1
> +      - :cspan:`19` P0
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 0a2f4f0d0a073..696b33add65b8 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -329,10 +329,14 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>  		{ .format = V4L2_PIX_FMT_SGBRG10DPCM8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_SGRBG10DPCM8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_SRGGB10DPCM8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_CRU_RAW10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_SBGGR12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_CRU_RAW12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_CRU_RAW14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_CRU_RAW20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 3, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  	};
>  	unsigned int i;
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 0304daa8471d1..85bd068b14275 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1409,6 +1409,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG (DPCM)"; break;
>  	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG (DPCM)"; break;
>  	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB (DPCM)"; break;
> +	case V4L2_PIX_FMT_CRU_RAW10:	descr = "10-bit Bayer CRU Packed"; break;

s/Bayer/RAW/ (or Raw)

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	case V4L2_PIX_FMT_SBGGR12:	descr = "12-bit Bayer BGBG/GRGR"; break;
>  	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
>  	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
> @@ -1417,6 +1418,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
>  	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
>  	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
> +	case V4L2_PIX_FMT_CRU_RAW12:	descr = "12-bit Bayer CRU Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR14:	descr = "14-bit Bayer BGBG/GRGR"; break;
>  	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
>  	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
> @@ -1425,10 +1427,12 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
>  	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
>  	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB Packed"; break;
> +	case V4L2_PIX_FMT_CRU_RAW14:	descr = "14-bit Bayer CRU Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR16:	descr = "16-bit Bayer BGBG/GRGR"; break;
>  	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
>  	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
>  	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
> +	case V4L2_PIX_FMT_CRU_RAW20:	descr = "14-bit Bayer CRU Packed"; break;
>  	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
>  	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
>  	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index e7c4dce390074..b0482b9af04f5 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -830,6 +830,12 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_PISP_COMP2_BGGR	v4l2_fourcc('P', 'C', '2', 'B') /* PiSP 8-bit mode 2 compressed BGGR bayer */
>  #define V4L2_PIX_FMT_PISP_COMP2_MONO	v4l2_fourcc('P', 'C', '2', 'M') /* PiSP 8-bit mode 2 compressed monochrome */
>  
> +/* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixels */
> +#define V4L2_PIX_FMT_CRU_RAW10	v4l2_fourcc('C', 'R', '1', '0')
> +#define V4L2_PIX_FMT_CRU_RAW12	v4l2_fourcc('C', 'R', '1', '2')
> +#define V4L2_PIX_FMT_CRU_RAW14	v4l2_fourcc('C', 'R', '1', '4')
> +#define V4L2_PIX_FMT_CRU_RAW20	v4l2_fourcc('C', 'R', '2', '0')
> +
>  /* SDR formats - used only for Software Defined Radio devices */
>  #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
>  #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ u16le */

-- 
Regards,

Laurent Pinchart


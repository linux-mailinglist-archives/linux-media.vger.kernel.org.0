Return-Path: <linux-media+bounces-32779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681E4ABBE6F
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28FA617E9E5
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 12:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4949C27935A;
	Mon, 19 May 2025 12:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzmTo5Hz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD87278E6B
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747659482; cv=none; b=j9WFU+PTY7gVpY9tszuYwJQJb15H7+SkBll2ANAIqzOvVUw7CykQpEonEDSmQ+2EDFrrK6TwVgYH6bbfekczerYWEAD4flCGeT5JSvsu00azR3fdC/zD/Z43nslEdAMrnvrbTX37XgSgb2gnPA2ivBoe/KoK+WfOUPx3DbM5AQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747659482; c=relaxed/simple;
	bh=hD7ERRAJMisJOSS6wmm2Hwg+YGHAVZd6AYFoVsNeDQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tp0bm8GHgZDmrNcaHufZQQwsVdpssYPIulvo8Z/0m7JwVftGicJQdQKliRxiaeZUtOnTODNIxo5vYg0l9MEggd4thX6dO3oWwG7oCccjebU3K8bJe+3SOMhnmcemXDU3xx3LDuMjKsbI8GqEJpnPitz1nD4XRaNX+sZMTxvAxGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzmTo5Hz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747659481; x=1779195481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hD7ERRAJMisJOSS6wmm2Hwg+YGHAVZd6AYFoVsNeDQE=;
  b=JzmTo5Hz0ZQZPoK7smYmwroAQ3SOWK8cItppV+dUbSa8u8CB3Bb9sMor
   XO/dzHgYC/Z/l1oMMsZZV1IbkQ5Xq3gchIiUU2CPZQChL3wSG4zGEZ5wv
   uhqIQ7Q1cQUDzfAqVb/WWqlGT05CzeLzkqFCSFTbp3HEMUZ1cwDdP5r9h
   iwshasAUiyrpPRyadqmXAdTUpiW1oVXhTFSqDuMcEnfW/zQiFM6ghZ3Gm
   r8o6Ndj1EsQjQjLYVr35X8u445Z78mJV7GiXL1j1PNADXg7husSwfL+3J
   eX1k5jzXIzmAKmMVm02Mc/HAHYvg6P0beufAOjZwryGUhfxtgqTuvTnQg
   Q==;
X-CSE-ConnectionGUID: tc5oZ6czS06OT1Skw1anAw==
X-CSE-MsgGUID: 0hj+nOtkTayu5os4PEVqWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60210909"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60210909"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:58:00 -0700
X-CSE-ConnectionGUID: R0mLot+JTo6s+dPAi+4yuA==
X-CSE-MsgGUID: VVFS4hMkSGScfmRjLVn0oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="140382253"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.190])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:57:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 27BFD12035C;
	Mon, 19 May 2025 15:57:55 +0300 (EEST)
Date: Mon, 19 May 2025 12:57:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 1/6] media: v4l2: Add Renesas Camera Receiver Unit
 pixel formats
Message-ID: <aCsq06etRXVRd2rn@kekkonen.localdomain>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-2-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506125015.567746-2-dan.scally@ideasonboard.com>

Hi Daniel,

Thanks for the set.

On Tue, May 06, 2025 at 01:50:10PM +0100, Daniel Scally wrote:
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> 
> The Renesas Camera Receiver Unit in the RZ/V2H SoC can output RAW
> data captured from an image sensor without conversion to an RGB/YUV
> format. In that case the data are packed into 64-bit blocks, with a
> variable amount of padding in the most significant bits depending on
> the bitdepth of the data. Add new V4L2 pixel format codes for the new
> formats, along with documentation to describe them.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
> Changes in v4:
> 
> 	- Removed references to "Bayer" or "srgb"
> 
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
>  .../media/v4l/pixfmt-rawnn-cru.rst            | 143 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |   4 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
>  include/uapi/linux/videodev2.h                |   6 +
>  5 files changed, 158 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> index ed3eb432967d..20a8aa043304 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> @@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
>      pixfmt-srggb14
>      pixfmt-srggb14p
>      pixfmt-srggb16
> +    pixfmt-rawnn-cru
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> new file mode 100644
> index 000000000000..d786833d0cf3
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> @@ -0,0 +1,143 @@
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

Could these be called V4L2_PIX_FMT_GENERIC_CRU_RAW*, to align with
V4L2_PIX_FMT_GENERIC_CSI2_RAW*?

> +
> +Description
> +===========
> +
> +These pixel formats are some of the RAW outputs for the Camera Receiver Unit in
> +the Renesas RZ/V2H SoC. They are raw formats which pack pixels contiguously into
> +64-bit units, with the 4 or 8 most significant bits padded.
> +
> +**Byte Order**
> +
> +.. flat-table:: RAW formats
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
> index 4ee4aa19efe6..bfefd7d24fd8 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -332,10 +332,14 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
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

I'd add a new section for these. The generic CSI-2 formats are actually
missing there, it'd be nice to add them first. I can post a patch.

>  	};
>  	unsigned int i;
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index e97881f74c0d..606a385001d7 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1413,6 +1413,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG (DPCM)"; break;
>  	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG (DPCM)"; break;
>  	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB (DPCM)"; break;
> +	case V4L2_PIX_FMT_CRU_RAW10:	descr = "10-bit Raw CRU Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR12:	descr = "12-bit Bayer BGBG/GRGR"; break;
>  	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
>  	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
> @@ -1421,6 +1422,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
>  	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
>  	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
> +	case V4L2_PIX_FMT_CRU_RAW12:	descr = "12-bit Raw CRU Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR14:	descr = "14-bit Bayer BGBG/GRGR"; break;
>  	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
>  	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
> @@ -1429,10 +1431,12 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
>  	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
>  	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB Packed"; break;
> +	case V4L2_PIX_FMT_CRU_RAW14:	descr = "14-bit Raw CRU Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR16:	descr = "16-bit Bayer BGBG/GRGR"; break;
>  	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
>  	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
>  	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
> +	case V4L2_PIX_FMT_CRU_RAW20:	descr = "14-bit Raw CRU Packed"; break;
>  	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
>  	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
>  	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index ca7b3e8863ca..a70a0c7224cc 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -840,6 +840,12 @@ struct v4l2_pix_format {
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

Sakari Ailus


Return-Path: <linux-media+bounces-32828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E45D4ABC254
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 17:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 104EF16E70C
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B5928541A;
	Mon, 19 May 2025 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c/D6gb+Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2C726B093
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 15:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747668260; cv=none; b=NcilViynwHmzZ7hC+PkxAtpb6P10cm2nfVjJKtE0qVbY+yBGiLJKtcZ5aLNZJlgzTLO019Arbf8mA1G16oBahgMwy4aGcAnFUvVppCTFQDNR8x7DL2o3hsNM7a3XaL1yqQkNiTpn70MD6vhMKQGl5xFUCx2gVIr7TFTNJ3JGkWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747668260; c=relaxed/simple;
	bh=k9f+5G5Bg3AaFyqqqQWQ2x3IlEqLYT+ECWxxZFt2OVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNRyzWpS9qVspxYGSiS9h+zD/gRAqBsDiBKhPxxO7c43WkvbCmVAmWMvZ+zjHHarBcr1M2lTLZLOGowWuKi+XKt989pNJN9jdCFdPSBExepkPtOPSS2JANUSErAKw3HQ+/5KMTyBf9fQoTT7KsLGVuezmlJiobfCdl722k/CVqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c/D6gb+Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4FC283D;
	Mon, 19 May 2025 17:23:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747668235;
	bh=k9f+5G5Bg3AaFyqqqQWQ2x3IlEqLYT+ECWxxZFt2OVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/D6gb+YfXQkQsRaYAluYpO6BIDTQc9DruGwXJw8PES5VFqWfkyGAwd09IA/Sij9F
	 qWnmJSUAPOn1WUwuMS2RlsDcjz1NqI6+WaeK7+HFF2rmKiFhrQan2ZAlRF6wy0Kwkx
	 BTaESTYrn4gVstChW+NY7dOfa/wJDpKjASAW0ADE=
Date: Mon, 19 May 2025 17:24:12 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 1/6] media: v4l2: Add Renesas Camera Receiver Unit
 pixel formats
Message-ID: <ubyydsdcuks3io33kb35vd2w3gaxbak7qiwvfq6hxktixs6ywl@6r27hgvxwq5l>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-2-dan.scally@ideasonboard.com>
 <aCsq06etRXVRd2rn@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aCsq06etRXVRd2rn@kekkonen.localdomain>

Hi Sakari

On Mon, May 19, 2025 at 12:57:55PM +0000, Sakari Ailus wrote:
> Hi Daniel,
>
> Thanks for the set.
>
> On Tue, May 06, 2025 at 01:50:10PM +0100, Daniel Scally wrote:
> > From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> >
> > The Renesas Camera Receiver Unit in the RZ/V2H SoC can output RAW
> > data captured from an image sensor without conversion to an RGB/YUV
> > format. In that case the data are packed into 64-bit blocks, with a
> > variable amount of padding in the most significant bits depending on
> > the bitdepth of the data. Add new V4L2 pixel format codes for the new
> > formats, along with documentation to describe them.
> >
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > ---
> > Changes in v4:
> >
> > 	- Removed references to "Bayer" or "srgb"
> >
> > Changes in v3:
> >
> > 	- Switched from bayer-order specific formats to generic RAWnn
> >
> > Changes in v2:
> >
> > 	- Added labels to the new formats in the documentation file
> > 	- Added 20-bit formats
> >
> >  .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
> >  .../media/v4l/pixfmt-rawnn-cru.rst            | 143 ++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-common.c         |   4 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
> >  include/uapi/linux/videodev2.h                |   6 +
> >  5 files changed, 158 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > index ed3eb432967d..20a8aa043304 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > @@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
> >      pixfmt-srggb14
> >      pixfmt-srggb14p
> >      pixfmt-srggb16
> > +    pixfmt-rawnn-cru
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> > new file mode 100644
> > index 000000000000..d786833d0cf3
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> > @@ -0,0 +1,143 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _v4l2-pix-fmt-cru-raw10:
> > +.. _v4l2-pix-fmt-cru-raw12:
> > +.. _v4l2-pix-fmt-cru-raw14:
> > +.. _v4l2-pix-fmt-cru-raw20:
> > +
> > +**********************************************************************************************************************************
> > +V4L2_PIX_FMT_CRU_RAW10 ('CR10'), V4L2_PIX_FMT_CRU_RAW12 ('CR12'), V4L2_PIX_FMT_CRU_RAW14 ('CR14'), V4L2_PIX_FMT_CRU_RAW20 ('CR20')
> > +**********************************************************************************************************************************
> > +
> > +===============================================================
> > +Renesas RZ/V2H Camera Receiver Unit 64-bit packed pixel formats
> > +===============================================================
> > +
> > +| V4L2_PIX_FMT_CRU_RAW10 (CR10)
> > +| V4L2_PIX_FMT_CRU_RAW12 (CR12)
> > +| V4L2_PIX_FMT_CRU_RAW14 (CR14)
> > +| V4L2_PIX_FMT_CRU_RAW20 (CR20)
>
> Could these be called V4L2_PIX_FMT_GENERIC_CRU_RAW*, to align with
> V4L2_PIX_FMT_GENERIC_CSI2_RAW*?

Is this a good idea ? I understand the CSI2 ones are "generic" when it
comes to both the Bayer pattern ordering and the platform.

The CRU codes are platforms specific, and while they're Bayer order
agnostic, calling them generic feels a bit of an overstretch ?

>
> > +
> > +Description
> > +===========
> > +
> > +These pixel formats are some of the RAW outputs for the Camera Receiver Unit in
> > +the Renesas RZ/V2H SoC. They are raw formats which pack pixels contiguously into
> > +64-bit units, with the 4 or 8 most significant bits padded.
> > +
> > +**Byte Order**
> > +
> > +.. flat-table:: RAW formats
> > +    :header-rows:  2
> > +    :stub-columns: 0
> > +    :widths: 36 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
> > +    :fill-cells:
> > +
> > +    * - :rspan:`1` Pixel Format Code
> > +      - :cspan:`63` Data organization
> > +    * - 63
> > +      - 62
> > +      - 61
> > +      - 60
> > +      - 59
> > +      - 58
> > +      - 57
> > +      - 56
> > +      - 55
> > +      - 54
> > +      - 53
> > +      - 52
> > +      - 51
> > +      - 50
> > +      - 49
> > +      - 48
> > +      - 47
> > +      - 46
> > +      - 45
> > +      - 44
> > +      - 43
> > +      - 42
> > +      - 41
> > +      - 40
> > +      - 39
> > +      - 38
> > +      - 37
> > +      - 36
> > +      - 35
> > +      - 34
> > +      - 33
> > +      - 32
> > +      - 31
> > +      - 30
> > +      - 29
> > +      - 28
> > +      - 27
> > +      - 26
> > +      - 25
> > +      - 24
> > +      - 23
> > +      - 22
> > +      - 21
> > +      - 20
> > +      - 19
> > +      - 18
> > +      - 17
> > +      - 16
> > +      - 15
> > +      - 14
> > +      - 13
> > +      - 12
> > +      - 11
> > +      - 10
> > +      - 9
> > +      - 8
> > +      - 7
> > +      - 6
> > +      - 5
> > +      - 4
> > +      - 3
> > +      - 2
> > +      - 1
> > +      - 0
> > +    * - V4L2_PIX_FMT_CRU_RAW10
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - :cspan:`9` P5
> > +      - :cspan:`9` P4
> > +      - :cspan:`9` P3
> > +      - :cspan:`9` P2
> > +      - :cspan:`9` P1
> > +      - :cspan:`9` P0
> > +    * - V4L2_PIX_FMT_CRU_RAW12
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - :cspan:`11` P4
> > +      - :cspan:`11` P3
> > +      - :cspan:`11` P2
> > +      - :cspan:`11` P1
> > +      - :cspan:`11` P0
> > +    * - V4L2_PIX_FMT_CRU_RAW14
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - :cspan:`13` P3
> > +      - :cspan:`13` P2
> > +      - :cspan:`13` P1
> > +      - :cspan:`13` P0
> > +    * - V4L2_PIX_FMT_CRU_RAW20
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - :cspan:`19` P2
> > +      - :cspan:`19` P1
> > +      - :cspan:`19` P0
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 4ee4aa19efe6..bfefd7d24fd8 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -332,10 +332,14 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
> >  		{ .format = V4L2_PIX_FMT_SGBRG10DPCM8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >  		{ .format = V4L2_PIX_FMT_SGRBG10DPCM8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >  		{ .format = V4L2_PIX_FMT_SRGGB10DPCM8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_CRU_RAW10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >  		{ .format = V4L2_PIX_FMT_SBGGR12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >  		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >  		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >  		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_CRU_RAW12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_CRU_RAW14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_CRU_RAW20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 3, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>
> I'd add a new section for these. The generic CSI-2 formats are actually
> missing there, it'd be nice to add them first. I can post a patch.
>
> >  	};
> >  	unsigned int i;
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index e97881f74c0d..606a385001d7 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1413,6 +1413,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG (DPCM)"; break;
> >  	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG (DPCM)"; break;
> >  	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB (DPCM)"; break;
> > +	case V4L2_PIX_FMT_CRU_RAW10:	descr = "10-bit Raw CRU Packed"; break;
> >  	case V4L2_PIX_FMT_SBGGR12:	descr = "12-bit Bayer BGBG/GRGR"; break;
> >  	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
> >  	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
> > @@ -1421,6 +1422,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
> >  	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
> >  	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
> > +	case V4L2_PIX_FMT_CRU_RAW12:	descr = "12-bit Raw CRU Packed"; break;
> >  	case V4L2_PIX_FMT_SBGGR14:	descr = "14-bit Bayer BGBG/GRGR"; break;
> >  	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
> >  	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
> > @@ -1429,10 +1431,12 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
> >  	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
> >  	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB Packed"; break;
> > +	case V4L2_PIX_FMT_CRU_RAW14:	descr = "14-bit Raw CRU Packed"; break;
> >  	case V4L2_PIX_FMT_SBGGR16:	descr = "16-bit Bayer BGBG/GRGR"; break;
> >  	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
> >  	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
> >  	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
> > +	case V4L2_PIX_FMT_CRU_RAW20:	descr = "14-bit Raw CRU Packed"; break;
> >  	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
> >  	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
> >  	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index ca7b3e8863ca..a70a0c7224cc 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -840,6 +840,12 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_PISP_COMP2_BGGR	v4l2_fourcc('P', 'C', '2', 'B') /* PiSP 8-bit mode 2 compressed BGGR bayer */
> >  #define V4L2_PIX_FMT_PISP_COMP2_MONO	v4l2_fourcc('P', 'C', '2', 'M') /* PiSP 8-bit mode 2 compressed monochrome */
> >
> > +/* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixels */
> > +#define V4L2_PIX_FMT_CRU_RAW10	v4l2_fourcc('C', 'R', '1', '0')
> > +#define V4L2_PIX_FMT_CRU_RAW12	v4l2_fourcc('C', 'R', '1', '2')
> > +#define V4L2_PIX_FMT_CRU_RAW14	v4l2_fourcc('C', 'R', '1', '4')
> > +#define V4L2_PIX_FMT_CRU_RAW20	v4l2_fourcc('C', 'R', '2', '0')
> > +
> >  /* SDR formats - used only for Software Defined Radio devices */
> >  #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
> >  #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ u16le */
>
> --
> Regards,
>
> Sakari Ailus


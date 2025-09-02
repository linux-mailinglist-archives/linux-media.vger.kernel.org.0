Return-Path: <linux-media+bounces-41591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8DB40273
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 15:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 577FB1B24603
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 13:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660DB302745;
	Tue,  2 Sep 2025 13:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Epnqvl7V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7B9305057
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818999; cv=none; b=hKT8lZ2QtPEJvzbL4OwwxUsB32Ld/kzYDM4K9jrP6jD7+IQxVFxYVd/kwuOf7yCUWVeNhkYT8er6PMlgZoujBYvj2U1YbZ1bKdFoCc/UQDbCRszMCdh9Kfyln/iDheHOS20ozZMiZ0NRLNpJ2b4gcScQizdyB7KUcuraoS+/x3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818999; c=relaxed/simple;
	bh=ggpCWi+WWCARecszXYOUjw3lOrpSahGGbcYgq2v0JrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwVZMDbCPz+WxtvGtpcxB0X9Y0o06cDkGJonSym/iY7cFuONNa6KazMt70D6OjydaAIZJgvnig5kGgYS3pZA47+RI8QbpFcZybKY0zTLdwztQCM00NqjBzEqw2e2tQl/ocNaTt5Q7yZehVrou8JyM8jGnPVlWu0j/CdaIUqiru8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Epnqvl7V; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756818997; x=1788354997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ggpCWi+WWCARecszXYOUjw3lOrpSahGGbcYgq2v0JrA=;
  b=Epnqvl7V8bk2vu8l4DdgJ8mh/c2FWuF2BKBNHYHicIZbJYlmgHrtC/tD
   hK3lCPbRcGA9yDsia5igymYhYf9r+VQuR7q71o896qHwd/Bi6pAgs63QY
   lgc4t8Hqsl+IvP9y/6KnrxLur680S5xWQTkpOtMJLHE5hgAYiIpPcQ+6L
   DBQGecCQ/lz+IFfBSeaPobJNuslFoLPw8kWu1sTLYQZht7ww61oU9BHjn
   fkz6+2eN0kVNZGYB31THCuh+HcsAmcwrI28CBxlfDbdgVYFo+2Jd5weUT
   +v24Js1aHQ0iNMbJv6fhN+Jsjbqdk8CLxLJzMuodUD7XsUFPozqcWoPae
   Q==;
X-CSE-ConnectionGUID: PTEhBrZxSoasz87p3HZ7+A==
X-CSE-MsgGUID: DkNQauaLQQ6ipXfbiGySBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76535068"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="76535068"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:16:33 -0700
X-CSE-ConnectionGUID: 6IFvJsQ7TCCZ23C3NjYmdA==
X-CSE-MsgGUID: /7zfRpBSSliSnLaPOcgFwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175410582"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:16:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CD99611F739;
	Tue, 02 Sep 2025 16:16:21 +0300 (EEST)
Date: Tue, 2 Sep 2025 16:16:21 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 15/66] media: uapi: Add generic CSI-2 raw pixelformats
Message-ID: <aLbuJVfWAy7jG83-@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-16-sakari.ailus@linux.intel.com>
 <yt4ctbipiqd6up6ojeb6j7xl2blnjbxfacbxbypv7mj7zegxnp@gfv5dvcqbv23>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yt4ctbipiqd6up6ojeb6j7xl2blnjbxfacbxbypv7mj7zegxnp@gfv5dvcqbv23>

Hi Jacopo,

On Mon, Sep 01, 2025 at 03:25:01PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:16PM +0300, Sakari Ailus wrote:
> > Add generic raw pixelformats for bit depths 8, 10, 12 and 14. These
> > formats are CSI-2 packed, apart from the 8-bit format.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/pixfmt-raw-generic.rst          | 175 ++++++++++++++++++
> >  .../userspace-api/media/v4l/pixfmt.rst        |   1 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
> >  include/uapi/linux/videodev2.h                |   6 +
> >  4 files changed, 186 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> > new file mode 100644
> > index 000000000000..9fda7a36cd3a
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> > @@ -0,0 +1,175 @@
> > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > +
> > +************************************************************************************************************************************************************************************************************************************************************************************
> > +V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE'), V4L2_PIX_FMT_RAW_16 ('RAWG'), V4L2_PIX_FMT_RAW_CSI2_20 ('RACK'), V4L2_PIX_FMT_RAW_24 ('RAWO'), V4L2_PIX_FMT_RAW_CSI2_28 ('RACS')
> > +************************************************************************************************************************************************************************************************************************************************************************************
> 
> I see in your branch
> "media: uapi: Add generic CSI-2 raw pixelformats for 16, 20, 24 and 28 bpp"
> 
> Which adds pixel formats for the additional formats not documented in
> this patch but mentioned here above in the header.
> 
> Should you squash it with this patch ?

The reason these are being postponed is that we haven't yet seen devices
using them. The systems these are used in tend to be little endian while
the format documentation suggests big endian byte order. That'd be
inconvenient. So we'd like to see what do they actually use.

I'll move the extra ones to the other patch.

> 
> > +
> > +
> > +Generic line-based image data formats
> 
> Does "line-based" applies to image formats as well or to metadata only ?

These, too.

> 
> > +
> > +
> > +Description
> > +===========
> > +
> > +These generic raw image data formats define the memory layout of the data
> > +without defining the order of the pixels in the format or even the CFA (Colour
> 
> What about s/in the format// ?

Yes.

> 
> > +Filter Array) itself. See also :ref:`source routes <subdev-routing>`.
> 
> I might have missed why the reference to the routing documentation.

I think this bit can be removed now.

> 
> > +
> > +.. _v4l2-pix-fmt-raw-8:
> > +
> > +V4L2_PIX_FMT_RAW_8
> > +------------------
> > +
> > +The V4L2_PIX_FMT_GENERIC_8 format is a plain 8-bit raw pixel data format. This
> > +format is used on CSI-2 for 8 bits per :term:`Data Unit`.
> > +
> > +**Byte Order Of V4L2_PIX_FMT_RAW_8.**
> > +Each cell is one byte. "P" denotes a pixel.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
> > +
> > +.. flat-table:: Sample 4x2 Image Frame
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - P\ :sub:`00`
> > +      - P\ :sub:`10`
> > +      - P\ :sub:`20`
> > +      - P\ :sub:`30`
> > +    * - start + 4:
> > +      - P\ :sub:`01`
> > +      - P\ :sub:`11`
> > +      - P\ :sub:`21`
> > +      - P\ :sub:`31`
> > +
> > +.. _v4l2-pix-fmt-raw-csi2-10:
> > +
> > +V4L2_PIX_FMT_RAW_CSI2_10
> > +------------------------
> > +
> > +V4L2_PIX_FMT_RAW_CSI2_10 contains 10-bit packed image data, with four bytes
> > +containing the top 8 bits of the pixels followed by lowest 2 bits of the pixels
> > +packed into one byte. This format is typically used by CSI-2 receivers with
> > +a source that transmits MEDIA_BUS_FMT_RAW_10 and the CSI-2 receiver writes the
> > +received data to memory as-is.
> > +
> > +The packing of the data follows the MIPI CSI-2 specification.
> > +
> > +**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_10.**
> > +Each cell is one byte. "P" denotes a pixel.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
> > +
> > +.. flat-table:: Sample 4x2 Image Frame
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - P\ :sub:`00 bits 9--2`
> > +      - P\ :sub:`10 bits 9--2`
> > +      - P\ :sub:`20 bits 9--2`
> > +      - P\ :sub:`30 bits 9--2`
> > +      - P\ :sub:`00 bits 1--0` (bits 1--0)
> > +        P\ :sub:`10 bits 1--0` (bits 3--2)
> > +        P\ :sub:`20 bits 1--0` (bits 5--4)
> > +        P\ :sub:`30 bits 1--0` (bits 7--6)
> > +    * - start + 5:
> > +      - P\ :sub:`01 bits 9--2`
> > +      - P\ :sub:`11 bits 9--2`
> > +      - P\ :sub:`21 bits 9--2`
> > +      - P\ :sub:`31 bits 9--2`
> > +      - P\ :sub:`01 bits 1--0` (bits 1--0)
> > +        P\ :sub:`11 bits 1--0` (bits 3--2)
> > +        P\ :sub:`21 bits 1--0` (bits 5--4)
> > +        P\ :sub:`31 bits 1--0` (bits 7--6)
> > +
> > +.. _v4l2-pix-fmt-raw-csi2-12:
> > +
> > +V4L2_PIX_FMT_RAW_CSI2_12
> > +------------------------
> > +
> > +V4L2_PIX_FMT_RAW_CSI2_12 contains 12-bit packed image data, with two bytes
> > +containing the top 8 bits of the pixels followed by lowest 4 bits of the pixels
> > +packed into 1 byte. This format is typically used by CSI-2 receivers with
> > +a source that transmits MEDIA_BUS_FMT_RAW_12 and the CSI-2 receiver writes the
> > +received data to memory as-is.
> > +
> > +The packing of the data follows the MIPI CSI-2 specification.
> > +
> > +**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_12.**
> > +Each cell is one byte. "P" denotes a pixel.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
> > +
> > +.. flat-table:: Sample 4x2 Image Frame
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - P\ :sub:`00 bits 11--4`
> > +      - P\ :sub:`10 bits 11--4`
> > +      - P\ :sub:`00 bits 3--0` (bits 3--0)
> > +        P\ :sub:`10 bits 3--0` (bits 7--4)
> > +      - P\ :sub:`20 bits 11--4`
> > +      - P\ :sub:`30 bits 11--4`
> > +      - P\ :sub:`20 bits 3--0` (bits 3--0)
> > +        P\ :sub:`30 bits 3--0` (bits 7--4)
> > +    * - start + 6:
> > +      - P\ :sub:`01 bits 11--4`
> > +      - P\ :sub:`11 bits 11--4`
> > +      - P\ :sub:`01 bits 3--0` (bits 3--0)
> > +        P\ :sub:`11 bits 3--0` (bits 7--4)
> > +      - P\ :sub:`21 bits 11--4`
> > +      - P\ :sub:`31 bits 11--4`
> > +      - P\ :sub:`21 bits 3--0` (bits 3--0)
> > +        P\ :sub:`31 bits 3--0` (bits 7--4)
> > +
> > +.. _v4l2-pix-fmt-raw-csi2-14:
> > +
> > +V4L2_PIX_FMT_RAW_CSI2_14
> > +------------------------
> > +
> > +V4L2_PIX_FMT_RAW_CSI2_14 contains 14-bit packed image data, with four bytes
> > +containing the top 8 bits of the pixels followed by lowest 6 bits of the pixels
> > +packed into three bytes. This format is typically used by CSI-2 receivers with a
> > +source that transmits MEDIA_BUS_FMT_RAW_14 and the CSI-2 receiver writes the
> > +received data to memory as-is.
> > +
> > +The packing of the data follows the MIPI CSI-2 specification.
> > +
> > +**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_14.**
> > +Each cell is one byte. "P" denotes a pixel.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.8cm}|p{1.8cm}|
> > +
> > +.. flat-table:: Sample 4x2 Image Frame
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - P\ :sub:`00 bits 13--6`
> > +      - P\ :sub:`10 bits 13--6`
> > +      - P\ :sub:`20 bits 13--6`
> > +      - P\ :sub:`30 bits 13--6`
> > +      - P\ :sub:`10 bits 1--0` (bits 7--6)
> > +        P\ :sub:`00 bits 5--0` (bits 5--0)
> > +      - P\ :sub:`20 bits 3--0` (bits 7--4)
> > +        P\ :sub:`10 bits 5--2` (bits 3--0)
> > +      - P\ :sub:`30 bits 5--0` (bits 7--2)
> > +        P\ :sub:`20 bits 5--4` (bits 1--0)
> > +    * - start + 7:
> > +      - P\ :sub:`01 bits 13--6`
> > +      - P\ :sub:`11 bits 13--6`
> > +      - P\ :sub:`21 bits 13--6`
> > +      - P\ :sub:`31 bits 13--6`
> > +      - P\ :sub:`11 bits 1--0` (bits 7--6)
> > +        P\ :sub:`01 bits 5--0` (bits 5--0)
> > +      - P\ :sub:`21 bits 3--0` (bits 7--4)
> > +        P\ :sub:`11 bits 5--2` (bits 3--0)
> > +      - P\ :sub:`31 bits 5--0` (bits 7--2)
> > +        P\ :sub:`21 bits 5--4` (bits 1--0)
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
> > index 11dab4a90630..d917190c717d 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
> > @@ -25,6 +25,7 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
> >      pixfmt-indexed
> >      pixfmt-rgb
> >      pixfmt-bayer
> > +    pixfmt-raw-generic
> >      yuv-formats
> >      hsv-formats
> >      depth-formats
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 01cf52c3ea33..e538c1230631 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1434,6 +1434,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
> >  	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
> >  	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
> > +	case V4L2_PIX_FMT_RAW_8:	descr = "8-bit Raw"; break;
> > +	case V4L2_PIX_FMT_RAW_CSI2_10:	descr = "10-bit Raw, CSI-2 Packed"; break;
> > +	case V4L2_PIX_FMT_RAW_CSI2_12:	descr = "12-bit Raw, CSI-2 Packed"; break;
> > +	case V4L2_PIX_FMT_RAW_CSI2_14:	descr = "14-bit Raw, CSI-2 Packed"; break;
> >  	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
> >  	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
> >  	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 3dd9fa45dde1..c4c4f3eb67e1 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -745,6 +745,12 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
> >  #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
> >
> > +/* Generic CSI-2 packed raw pixel formats */
> > +#define V4L2_PIX_FMT_RAW_8 v4l2_fourcc('R', 'A', 'W', '8')
> > +#define V4L2_PIX_FMT_RAW_CSI2_10 v4l2_fourcc('R', 'A', 'C', 'A')
> > +#define V4L2_PIX_FMT_RAW_CSI2_12 v4l2_fourcc('R', 'A', 'C', 'C')
> > +#define V4L2_PIX_FMT_RAW_CSI2_14 v4l2_fourcc('R', 'A', 'C', 'E')
> > +
> With
> "media: uapi: Add generic CSI-2 raw pixelformats for 16, 20, 24 and 28 bpp"
> 
> and the above minors clarified
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thank you!

> 
> >  /* HSV formats */
> >  #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
> >  #define V4L2_PIX_FMT_HSV32 v4l2_fourcc('H', 'S', 'V', '4')
> > --
> > 2.47.2
> >
> >

-- 
Sakari Ailus


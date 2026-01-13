Return-Path: <linux-media+bounces-50511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B91D17708
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 777E03010989
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 08:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1F23806B5;
	Tue, 13 Jan 2026 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COTgcnoa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C923128AE
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294777; cv=none; b=F74GCXtJ7JSQ7dJjRAMU2rMfrE8MY4JmKHZytgsuG4hORC3CCAFASu/TWlB1sC61TFsNBplKfuEzkVFsqf8QSf+yHLZNDbWEAMhBEf1kyak+D/eTWF9gr/krYLYxc5XC04D3COqB0c8EbmRu6rM6JXHR8jVkQdmR5YTLwKU2ko4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294777; c=relaxed/simple;
	bh=Zz5nMzp+otfpPzh5M+G3nY6jL++vkNgdjOfWZIdHpiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljLdCh5691e8GNyTBF2QO2PCj87n7CI9MSobqQ8oWLJaq2VekBQ1VUoiLiyuWyr5bJiz61860E5zmEt9ymbYq1dv0Jzpu3uVn1rre3x/q6hwTKBd78B+iqgL9cRiPVOlhGvyoD2hj2sMGqIveMdXK9UQ6f+S2fdISrPnorV0bRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COTgcnoa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768294776; x=1799830776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zz5nMzp+otfpPzh5M+G3nY6jL++vkNgdjOfWZIdHpiI=;
  b=COTgcnoaHotjQrNaAObUjRSZDs5Omv3zxzVtW3mmS3Bu3sL5WlsfMfuJ
   7uB8+YnAGocpAwh2PigojZpySZRR8e+KkGX6x+FQgoF3rsBxcE5LOo7td
   +KVfyAh/pPJgDtuczX+Uf8bwArGiGaLW1UPGm+hcEJhRyH890GezwlFQU
   Gj1f6iugEnoINE6meemt848BU9FXRYwZvvX0PEj0BzVE6hDouKOG6+OvD
   iZ7aPHRzHIpOsj8mI6eOVURdo2a051Ef9IrfWsNaXfQTphJuNCfubP+rE
   MZ5S6ce8vLrVzvsR2hCTj6ArykpvxExf8o3kjwExMN0ff0noK4+GPWuXq
   w==;
X-CSE-ConnectionGUID: 2hfYwqU8TsO5ujKxH0Ngfg==
X-CSE-MsgGUID: ESzJ3g9WTsiX5L+p3ZtBZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79872144"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="79872144"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:59:35 -0800
X-CSE-ConnectionGUID: YjYxRjxPTjCegyXWeE9Rmw==
X-CSE-MsgGUID: ApI3h6eyQzC9Em0+AnVJHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204138853"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.182])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:59:28 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3829911FC37;
	Tue, 13 Jan 2026 10:59:26 +0200 (EET)
Date: Tue, 13 Jan 2026 10:59:26 +0200
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
Subject: Re: [PATCH v10 15/64] media: uapi: Add generic CSI-2 raw pixelformats
Message-ID: <aWYJbtzyefhLxqeB@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-16-sakari.ailus@linux.intel.com>
 <2e757wqhu6rfi2c2utpdhw7qfxjdyk2pu62m6pyv2a3ppm4r3a@zyaresvmgd4c>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e757wqhu6rfi2c2utpdhw7qfxjdyk2pu62m6pyv2a3ppm4r3a@zyaresvmgd4c>

Hi Jacopo,

On Fri, Jun 20, 2025 at 01:50:31PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Jun 19, 2025 at 02:57:47PM +0300, Sakari Ailus wrote:
> > Add generic raw pixelformats for bit depths 8, 10, 12, 14, 16, 20, 24 and
> > 28. These formats are CSI-2 packed, apart from the 8-, 16- and 24-bit
> > formats.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/pixfmt-raw-generic.rst          | 398 ++++++++++++++++++
> >  .../userspace-api/media/v4l/pixfmt.rst        |   1 +
> >  include/uapi/linux/videodev2.h                |  10 +
> >  3 files changed, 409 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> > new file mode 100644
> > index 000000000000..8561233f5262
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> > @@ -0,0 +1,398 @@
> > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > +
> > +************************************************************************************************************************************************************************************************************************************************************************************
> > +V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE'), V4L2_PIX_FMT_RAW_16 ('RAWG'), V4L2_PIX_FMT_RAW_CSI2_20 ('RACK'), V4L2_PIX_FMT_RAW_24 ('RAWO'), V4L2_PIX_FMT_RAW_CSI2_28 ('RACS')
> > +************************************************************************************************************************************************************************************************************************************************************************************
> > +
> 
> Shouldn't this file be referenced in
> Documentation/userspace-api/media/v4l/pixfmt.rst
> ?

Fixed since. :-)

> 
> > +
> > +Generic line-based image data formats
> > +
> > +
> > +Description
> > +===========
> > +
> > +These generic raw image data formats define the memory layout of the data
> > +without defining the order of the pixels in the format or even the CFA (Colour
> 
> I would rather use the
> 
> "without defining the order of the color components"

I'll use:

These generic raw image data formats define the memory layout of the data
without defining the order of the colour components or even the colour
components themselves.

> 
> Whatever you like the most, I would however not mention CFA, even I
> understand the internal image pad represents the sensor's pixel array.
> 
> > +Filter Array) itself. These formats may only be used with a Media Controller
> > +pipeline where the more specific format is reported by an :ref:`internal sink
> > +pad <MEDIA-PAD-FL-INTERNAL>` of the source sub-device. See also :ref:`source
> > +routes <subdev-routing>`.
> 
> I'm surprised, I thought we were going to express the bayer pattern
> ordering using a control, like we're now doing for the
> metadata-specific format. Not bothered by this, just wondering if I
> missed anything from our previous discussions and from the media
> summit conclusions:

There were a few steps back and forth but I think controls are what we'll
use indeed.

> 
> [ANN] Media Summit 2025 Report
>  <21769183-ca57-4f8f-818a-6a1ad089298d@jjverkuil.nl>
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
> > +This format is little endian.
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
> > +This format is little endian.
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
> > +This format is little endian.
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
> > +
> > +.. _v4l2-pix-fmt-raw-16:
> > +
> > +V4L2_PIX_FMT_RAW_16
> > +-------------------
> > +
> > +V4L2_PIX_FMT_RAW_16 contains 16-bit image data, with each two consecutive
> > +bytes forming a pixel value. This format is typically used by CSI-2 receivers
> > +with a source that transmits MEDIA_BUS_FMT_RAW_16 and the CSI-2 receiver writes
> > +the received data to memory as-is.
> > +
> > +The packing of the data follows the MIPI CSI-2 specification.
> > +
> > +This format is little endian.
> > +
> > +**Byte Order Of V4L2_PIX_FMT_RAW_16.**
> > +Each cell is one byte. "P" denotes a pixel.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
> > +
> > +.. flat-table:: Sample 4x2 Image Frame
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - P\ :sub:`00 bits 15--8`
> > +      - P\ :sub:`00 bits 7--0`
> > +      - P\ :sub:`10 bits 15--8`
> > +      - P\ :sub:`10 bits 7--0`
> > +      - P\ :sub:`20 bits 15--8`
> > +      - P\ :sub:`20 bits 7--0`
> > +      - P\ :sub:`30 bits 15--8`
> > +      - P\ :sub:`30 bits 7--0`
> > +    * - start + 8:
> > +      - P\ :sub:`01 bits 15--8`
> > +      - P\ :sub:`01 bits 7--0`
> > +      - P\ :sub:`11 bits 15--8`
> > +      - P\ :sub:`11 bits 7--0`
> > +      - P\ :sub:`21 bits 15--8`
> > +      - P\ :sub:`21 bits 7--0`
> > +      - P\ :sub:`31 bits 15--8`
> > +      - P\ :sub:`31 bits 7--0`
> > +
> > +.. _v4l2-pix-fmt-raw-csi2-20:
> > +
> > +V4L2_PIX_FMT_RAW_CSI2_20
> > +------------------------
> 
> I can't validate the following format match the csi2 spec as they're
> not there in the version I have access to :)
> 
> They seem however correct to me!
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thank you!

-- 
Sakari Ailus


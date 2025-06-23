Return-Path: <linux-media+bounces-35582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E9EAE37A6
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40DCD3A6E7D
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C1B1EF397;
	Mon, 23 Jun 2025 08:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7pfqdJk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C3537F8
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 08:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665638; cv=none; b=nq3b2U8x/jEvjYIHGiiBhGGNWw3ExZx/oAPHlxLRbjr3PuWH3FEATz47fLEV0f/q4C+Cn5klnio07DMyUGBF0gKkNiUBD9iNOgG0mtmy2M3rR3b1TdAfLMOASriiCAi9tTvLRf4i4hbleH9t4IcEICXDzGDxk1gGjG0Bs9ingVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665638; c=relaxed/simple;
	bh=XQDYEtzXL4UzGqsDP1bDfCZcX92RB9qF0Rlaqv9ixP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjRraCG+kt14bfDplJ1AsayW9kHg+5safE7jiHSHsGSASS5zRkiVS79ey+pOXfaf1MgjAHTOebLWNb4uE1hWfUhaQzyFHwcOWT0w8WH0FIPJFabJyEnjs1ebQXzzGLu477119ndvdsF2Krl5R0qFuLiayDOAGtjtF0p4QiLzwQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7pfqdJk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750665637; x=1782201637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XQDYEtzXL4UzGqsDP1bDfCZcX92RB9qF0Rlaqv9ixP0=;
  b=R7pfqdJkTqy3u3x6YWH5FETdZgxztLH9tHn2Z2rvzlupM8FD+lysu28P
   LYJZ2E8OuHADtuuEo6ZR7dYWlwVkW9Uty4cXnBOnm7QOhk99iJgUBowIw
   Xw64kivmqAR3razAnyiKZofu1AABbmL4ikp7UNe0pmFYTC6wh4Bv9Gw/u
   Q9yQ4MsCdJEDqkCjiJhwtm9zJr67dMJa+ze9v7n1Kf/yY8ZWT/eiZMS4b
   UD66N09roRMeB0S3w1Y3/kwF8dutX2jrX9EFz7U8Xx6LTmpUbI8CGzCsI
   sHxcG55ZdaISZMC4wX/1Vz0kSaRKu3vyM2uDrxq5T4JgjhEzqqcekYP3r
   Q==;
X-CSE-ConnectionGUID: f/Li29GoQOy7dpm+gwJddA==
X-CSE-MsgGUID: rOJjiN2dQg6u18LZAqeNJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="56532507"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="56532507"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:00:35 -0700
X-CSE-ConnectionGUID: LL1hcxRrQmeibUauEP0MPg==
X-CSE-MsgGUID: w9kphhWNRvuMdI3/67OOZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151302764"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:00:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 253B61201F7;
	Mon, 23 Jun 2025 11:00:25 +0300 (EEST)
Date: Mon, 23 Jun 2025 08:00:25 +0000
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
Subject: Re: [PATCH v10 18/64] media: uapi: Add V4L2_CID_COLOR_PATTERN for
 describing color patterns
Message-ID: <aFkJmUOctRJPWgsg@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-19-sakari.ailus@linux.intel.com>
 <pczbu7ubfshbhtc5ukmxhbd4xjrmcbwnv7saqy73q2mrgta4q7@5xmultpljt7f>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pczbu7ubfshbhtc5ukmxhbd4xjrmcbwnv7saqy73q2mrgta4q7@5xmultpljt7f>

Hi Jacopo,

Thank you for the review.

On Fri, Jun 20, 2025 at 02:10:00PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Jun 19, 2025 at 02:57:50PM +0300, Sakari Ailus wrote:
> > Add V4L2_CID_COLOR_PATTERN to tell the camera sensor's native color
> > pattern.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/ext-ctrls-image-source.rst      | 39 +++++++++++++++++++
> >  .../media/v4l/subdev-formats.rst              |  2 +
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
> >  include/uapi/linux/v4l2-controls.h            |  6 +++
> >  4 files changed, 48 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index 71f23f131f97..b19aaaffbce0 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -92,3 +92,42 @@ Image Source Control IDs
> >      representing a gain of exactly 1.0. For example, if this default value
> >      is reported as being (say) 128, then a value of 192 would represent
> >      a gain of exactly 1.5.
> > +
> > +``V4L2_CID_COLOR_PATTERN (integer)``
> > +    This control determines the color components and native pixel order in the
> > +    sensor's CFA (Color Filter Array) when used in conjunction with
> > +    :ref:`generic raw mbus codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit
> > +    depth) <v4l2-mbus-pixelcode-generic-raw>` pixelcodes. The native pixel
> > +    order is constant for a given device, it is not affected by cropping or
> > +    flipping.
> > +
> > +    This control may only be used on V4L2 sub-devices.
> > +
> > +    This is a read-only control.
> > +
> > +    Available patterns:
> > +
> > +.. flat-table:: V4L2 color patterns
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +    :widths:       1 2 1
> > +
> > +    * - Macro name
> > +      - Synopsis
> > +      - Value
> > +    * - V4L2_COLOR_PATTERN_GRBG
> > +      - Raw Bayer, with alternating lines beginning with green, red pixels and
> > +        blue, green pixels.
> > +      - 0
> > +    * - V4L2_COLOR_PATTERN_RGGB
> > +      - Raw Bayer, with alternating lines beginning with red, green pixels and
> > +        green, blue pixels.
> > +      - 1
> > +    * - V4L2_COLOR_PATTERN_BGGR
> > +      - Raw Bayer, with alternating lines beginning with blue, green pixels and
> > +        green, red pixels.
> > +      - 2
> > +    * - V4L2_COLOR_PATTERN_GBRG
> > +      - Raw Bayer, with alternating lines beginning with green, blue pixels and
> > +        red, green pixels.
> > +      - 3
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index c06d8c83e2b8..d6d0e9a0eee1 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -3434,6 +3434,8 @@ organization is given as an example for the first pixel only.
> >
> >      \endgroup
> >
> > +.. _v4l2-mbus-pixelcode-generic-raw:
> > +
> >  Generic raw formats on serial interfaces
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index dd5f06546773..8119012c2638 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1155,6 +1155,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
> >  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
> >  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
> > +	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
> >
> >  	/* Image processing controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index c3e6a49b2549..09e5d5bbe7f8 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1221,6 +1221,12 @@ enum v4l2_jpeg_chroma_subsampling {
> >  #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
> >  #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
> >
> > +#define V4L2_CID_COLOR_PATTERN			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
> > +#define V4L2_COLOR_PATTERN_GRBG			0U
> > +#define V4L2_COLOR_PATTERN_RGGB			1U
> > +#define V4L2_COLOR_PATTERN_BGGR			2U
> > +#define V4L2_COLOR_PATTERN_GBRG			3U
> > +
> 
> Additional empty line ?

Did you mean adding one more or not adding one at all?

There are currently two empty lines between control classes in the header.

> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thanks
>   j
> 
> >
> >  /* Image processing controls */
> >
> > --
> > 2.39.5
> >
> >

-- 
Regards,

Sakari Ailus


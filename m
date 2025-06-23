Return-Path: <linux-media+bounces-35583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3060AE37B2
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 610E23AF7D5
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91611F91D6;
	Mon, 23 Jun 2025 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUlc8tkx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB09B1EDA02
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 08:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665784; cv=none; b=hiUb/3sY/cADklRHVdl8Pdo7zfAxR/j/6wjJhhxM34lgD3l6AZfd58VvNFvvNKAV+cMqmPHyiGO9PB2GfgADqwmWkajpBQaflfNz28zxGuG7BHefpXBh8b3qqUkBti65CS0fJmEIz+C60DvT+5GNRcTtBi+H9G3oReGecWigEyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665784; c=relaxed/simple;
	bh=ALHLB+8snYEVf6e37Gz0wZQEHpfyY/tu6TDamoqJXxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTDyQ+ogNV+ghzyY2RvPn/iAbP0vXbc5ttOiIppleT9RjBSRT2zIQOcTtW1oYmKrRxDbHQr5htnWSNQEElw28B0wQgysksyqoops36GiS/FHFpxWDNnYCOg3lU1bL8pd3p+5WYGAY+0w+a3VebP5PV8Sp/VpB21+qOB6ezNH3SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUlc8tkx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750665783; x=1782201783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ALHLB+8snYEVf6e37Gz0wZQEHpfyY/tu6TDamoqJXxI=;
  b=AUlc8tkxdf0whiO39xVW42WkRzswtIjumVkwNGvY+xM1cIh+77HgErZq
   qXF30QyXVHIYLohhkHsWgY2a3CRNyVeJqjXnyH1TMFCkLvZOXlkss3Zz4
   ZNJXaSjQhODlcHtMBoWlFXjCOIqdq+v+pI2fO1JHkEuZlSsx2BgIbDdWK
   THn6FE4sk/AVwke4DyHGIcIoIq43+3rNoqr7FXsaJdmjC5NxpVSeHtaAD
   PUtWAmwnTYiJ/oR99ado4ddmfZECaeOLwybCJFEbP1tiJqvzwOOJtcPTi
   zvdPEYvGD1/pgzEDIIN0rmJaoS4BaFbaCcY+5K6UD7y9S7Bvi7p8H+S5Y
   w==;
X-CSE-ConnectionGUID: v21T7D6TRHat1Bp1BE7j+Q==
X-CSE-MsgGUID: Nn81YYiSQAGqKfhIb7JWJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="64293429"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="64293429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:03:02 -0700
X-CSE-ConnectionGUID: EKz0C5ArT7elqfykSWZMow==
X-CSE-MsgGUID: lFvmnRWSRRKHb7xjZT4yTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151104257"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:02:55 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5787E1201F7;
	Mon, 23 Jun 2025 11:02:53 +0300 (EEST)
Date: Mon, 23 Jun 2025 08:02:53 +0000
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
Subject: Re: [PATCH v10 21/64] media: uapi: Add V4L2_CID_METADATA_LAYOUT
 control
Message-ID: <aFkKLXUsSDFJbvX9@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-22-sakari.ailus@linux.intel.com>
 <2x6i5l2hvovqpjrmi4uvmpcgwfeicbrdugxzb3yzkugndnlf3w@7ghsqaw54ziq>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2x6i5l2hvovqpjrmi4uvmpcgwfeicbrdugxzb3yzkugndnlf3w@7ghsqaw54ziq>

Hi Jacopo,

On Fri, Jun 20, 2025 at 02:25:59PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Jun 19, 2025 at 02:57:53PM +0300, Sakari Ailus wrote:
> > The metadata layout control defines the layout of the metadata on the bus.
> > It is used on sub-devices that use generic metadata mbus codes on at least
> > on one of the pads.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst      | 6 ++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c                   | 1 +
> >  include/uapi/linux/v4l2-controls.h                          | 2 ++
> >  3 files changed, 9 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index 3cb7ee1b0aed..64c0f9ff5b1b 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -145,3 +145,9 @@ Image Source Control IDs
> >      of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
> >      ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> >      ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
> > +
> > +``V4L2_CID_METADATA_LAYOUT (integer)``
> > +    The metadata layout control defines the on-bus metadata layout for metadata
> > +    streams. The control is used in conjunction with :ref:`generic metadata
> > +    formats <media-bus-format-generic-meta>` formats to specify the layout of the
> > +    data.
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 9ec65998a8f7..a7ea380de5ee 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1157,6 +1157,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
> >  	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
> >  	case V4L2_CID_COLOR_PATTERN_FLIP:	return "Color Pattern Flip";
> > +	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
> >
> >  	/* Image processing controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 740bf8544446..bb8b0b174a43 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1233,6 +1233,8 @@ enum v4l2_jpeg_chroma_subsampling {
> >  #define V4L2_COLOR_PATTERN_FLIP_BOTH \
> >  	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
> >
> > +#define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
> > +
> 
> We now have
> 
> V4L2_CID_COLOR_PATTERN
> V4L2_CID_METADATA_LAYOUT
> 
> Should the two names be aligned ? V4L2_CID_COLOR_LAYOUT ? Or is it not
> necessary ?

"Pattern" is established when it comes to colour filter arrays (as there's
generally a pattern) whereas metadata in general case at least doesn't have
that.

> 
> Should this be a read only control as well ?

Yes, I'll add that.

> 
> 
> >  /* Image processing controls */
> >
> >  #define V4L2_CID_IMAGE_PROC_CLASS_BASE		(V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)

-- 
Regards,

Sakari Ailus


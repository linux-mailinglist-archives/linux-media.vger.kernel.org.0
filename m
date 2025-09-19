Return-Path: <linux-media+bounces-42793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F3CB891B0
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 12:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58C783B5C66
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 10:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5551E2FBE18;
	Fri, 19 Sep 2025 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrE1lsKL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F984315A
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 10:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758278183; cv=none; b=HyvWb2e6V3hzoxAYC73I+HrmOg+kqAc/sS1Xcs1KC4/YubJ9tGhZt+zgQPNf8/DWvdBkxc9iOSMt4/iEQjWyrJfljfy+MjuJaEzIO7u6fvzndDnTqKpGbqKKOJRRicCMrHLHJzF0XqeMwXrA14clX7V2CgpEc3IKDMWIR9ol+v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758278183; c=relaxed/simple;
	bh=4zqYva0rpTx5isdzKdiBw4W3865TwJgrzOOTkYa+AHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9bs1082lH6eHn0/HRAuQ9Vwab+MJmlDJlvVvjUY5Aj3AsU0P2Xc6NJpH7xLYGx4t6T+3kTe5hm5wqm43LYzgOhmMHgW54PzJClw8AFzadloHtl7GV69qpGnf6n6rq+/Z5grWL1+dynp7/YkgK9xReQkSgxGxe5kid2UE/7sjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrE1lsKL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758278182; x=1789814182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4zqYva0rpTx5isdzKdiBw4W3865TwJgrzOOTkYa+AHU=;
  b=hrE1lsKLvU3izWZ23voft1f1yz9QHFLfNumBM7H+NpqtRIsOO2T6LRvt
   ae5mRxUcatSIrd5T3IhirnbS6fQcDXy2Jz6yGJtIBNtBhwh2ZNQX+hCLi
   irYHxVFYdfiKqzdTwVx4A3WqHTH7/hKUTEbQL1sZaOQC+hMKQP7nu/Pbg
   vE6i8OU/kb32az06xVITUW/7yOYZybncIsnPv2AC6LLKxuBjJso4Wag/S
   Dky0keVh0iaLb+blXJXoiUYrtFIjIxtRuOJ66M0eJOwUj78F4LAMFKNsx
   JRxXS/vxbFPEZR97viQXWBsykVCYVEHcRAwnElq61mGWNI6JUBIkVfBys
   A==;
X-CSE-ConnectionGUID: VxrMPXzdTXaMLaXhxZ6i/g==
X-CSE-MsgGUID: AMCnXnZjQmy4UcHvTDHUSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60686132"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="60686132"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 03:36:21 -0700
X-CSE-ConnectionGUID: e8N0ZG+qRkmutZIzmwlurg==
X-CSE-MsgGUID: LYKLJJiyQGWfboGGB3XAHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="175358526"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 03:36:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D570A11F982;
	Fri, 19 Sep 2025 13:36:10 +0300 (EEST)
Date: Fri, 19 Sep 2025 13:36:10 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
Subject: Re: [PATCH v11 24/66] media: uapi: Add V4L2_CID_METADATA_LAYOUT
 control
Message-ID: <aM0yGiWgZLdaWTAe@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-25-sakari.ailus@linux.intel.com>
 <qeuueahbuofjmeird3dr7xtcosfhymk72ceuma4dibudf2nn3s@z6smlg4yn2rf>
 <aLgiwzB_IhGTHyHz@kekkonen.localdomain>
 <20250903195211.GU3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903195211.GU3648@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Sep 03, 2025 at 09:52:11PM +0200, Laurent Pinchart wrote:
> On Wed, Sep 03, 2025 at 02:13:07PM +0300, Sakari Ailus wrote:
> > On Mon, Sep 01, 2025 at 05:07:55PM +0200, Jacopo Mondi wrote:
> > > On Mon, Aug 25, 2025 at 12:50:25PM +0300, Sakari Ailus wrote:
> > > > The metadata layout control defines the layout of the metadata on the bus.
> > > > It is used on sub-devices that use generic metadata mbus codes on at least
> > > > on one of the pads.
> > > 
> > > Ideally:
> > > 1) we have per pad controls
> > > 2) s/V4L2_CID_COLOR_PATTERN/V4L2_CID_DATA_PATTERN
> > > 3) we use V4L2_CID_DATA_PATTERN for both color components ordering and
> > >    metadata layouts. A sub-device will expose the same control, but on
> > >    different pads
> > > 
> > > I know we don't want to block this series to wait for per-pad
> > > controls, but I'm a bit afraid V4L2_CID_METADATA_LAYOUT will be made
> > > redundant before it gets used for real (which maybe it's not a big
> > > deal as if no one uses it, we will be able to easily replace it).
> > 
> > I wouldn't do that, for the reason that the mbus codes in the two cases
> > will be different in any case so both will have separate namespaces.
> > 
> > Metadata is also unaffected by flipping, unlike the colour patterns.
> > 
> > I wonder what others think.
> 
> Per-pad controls could possibly be used here, but they're not there yet,
> and the CFA pattern and metadata layout are two different concepts.
> 
> This being said, if you consider a sensor that produces multiple
> metadata streams (e.g. embedded data and NPU tensors, transported over
> different DTs), a single V4L2_CID_METADATA_LAYOUT control won't scale.
> We will likely need per-pad, or even per-stream controls for that.
> 
> We could start with V4L2_CID_METADATA_LAYOUT and later extend it with
> per-pad/stream controls for additional metadata streams, I don't think
> that would cause trouble in userspace.
> 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst      | 6 ++++++
> > > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c                   | 1 +
> > > >  include/uapi/linux/v4l2-controls.h                          | 2 ++
> > > >  3 files changed, 9 insertions(+)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > index 3cb7ee1b0aed..64c0f9ff5b1b 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > @@ -145,3 +145,9 @@ Image Source Control IDs
> > > >      of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
> > > >      ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> > > >      ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
> > > > +
> > > > +``V4L2_CID_METADATA_LAYOUT (integer)``
> > > > +    The metadata layout control defines the on-bus metadata layout for metadata
> 
> This needs to be clearer. "on-bus metadata layout" left me guessing what
> values this control would take. Before the patches further in the series
> that add layout values, I wasn't sure if the control would use media bus
> codes or other types of values.

A few lines below there's a reference to generic metadata formats where
this is documented. I wouldn't try to replicate it here. As you also noted,
this is relevant for the review of this patch but not so much after adding
the actual values in later patches in the series.

> 
> > > > +    streams. The control is used in conjunction with :ref:`generic metadata
> > > > +    formats <media-bus-format-generic-meta>` formats to specify the layout of the
> > > > +    data.
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > index 9ec65998a8f7..a7ea380de5ee 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > @@ -1157,6 +1157,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > > >  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
> > > >  	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
> > > >  	case V4L2_CID_COLOR_PATTERN_FLIP:	return "Color Pattern Flip";
> > > > +	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
> 
> How about v4l2_ctrl_fill() ?

I'll add that in the next version.

> 
> > > >
> > > >  	/* Image processing controls */
> > > >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > > > index eb9ffdd74d32..74e22a930be4 100644
> > > > --- a/include/uapi/linux/v4l2-controls.h
> > > > +++ b/include/uapi/linux/v4l2-controls.h
> > > > @@ -1239,6 +1239,8 @@ enum v4l2_jpeg_chroma_subsampling {
> > > >  #define V4L2_COLOR_PATTERN_FLIP_BOTH \
> > > >  	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
> > > >
> > > > +#define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
> > > > +
> > > 
> > > Intentional empty line ?
> > 
> > I'll drop it.
> > 
> > > For the time being
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > 
> > Thank you.
> 

-- 
Regards,

Sakari Ailus


Return-Path: <linux-media+bounces-18655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FB198797B
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 20:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCD3DB223C2
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 18:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874A0176231;
	Thu, 26 Sep 2024 18:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GoV+tMtp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB0C15B98E;
	Thu, 26 Sep 2024 18:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727377057; cv=none; b=Ex79cYw9O82gMCY4HX2PQJmi99q/8iNeIIUeGt9qNixkinyUU7QYHQjtotgF3YoXipDdv3xAtv6tkPKPa1BvJEMEvn0e3OP6iC2SVZrW1hF1ZEQWEKPMthW1/EXFmhjZTQtwrFYcLEPSt5XKNBRDR/QnsQhEx47sz99X+EJ4rNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727377057; c=relaxed/simple;
	bh=0omD3fzYrOSjwEjXMO2jmFjlFDpokzhSrIuQ7Z0EIjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aB8/1/jSjWq+PQC3R7d8sb87CcKhHXbSgREp/FYB2QXMGlSSkRMoQe+BSM3i0+us7RhD6wtx6PAfaZJzjo5gH57MqbpbiISpzuOhCLDul/ajvnuBx/bSSi7X5Dc5Q6rxHVbnhGiVaUTSZr3spfn8NDVjC4Kf21nGM1k/pCHy/oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GoV+tMtp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727377056; x=1758913056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0omD3fzYrOSjwEjXMO2jmFjlFDpokzhSrIuQ7Z0EIjQ=;
  b=GoV+tMtpO/bGSaNEQmTzZ+k0bu2i7NR03QMRQeT2XRE2pQlJ84xs0R+K
   SaRBnCEW3f5t6RG4IEqwEJYCJxroCD5IvTIXkZCH5EQQ94H8P2Byft0+s
   IXPckri5306LHVRi1y3J30iILK1lW82hoXDPwU/Qx8UrG+od3IVJlOHJ5
   5nViQS/Qp6W0Nj+Oka4281HKHcuOsv1rke5qya0IHr5M1ROA1HucC2m2Z
   P598EgEdgZSsF+uF7schhPdz5RhYH6DiK69Y1O6z1LFMS3seJ7VtWfmrp
   V4J7YcRCQxJtmg1HJRGlJAduMjD089lJRHF253za6eFuAHsvjAB/eT0GJ
   w==;
X-CSE-ConnectionGUID: BhIXFjH2QB62IUezKCmNag==
X-CSE-MsgGUID: Y3shEXNLSNyxCrdtJstDMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26448688"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="26448688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 11:57:35 -0700
X-CSE-ConnectionGUID: hgu0IQX0TTOFpSYxdEpA2g==
X-CSE-MsgGUID: wd/12+7yTV6utez+McuSwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="71865853"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 11:57:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5679611F843;
	Thu, 26 Sep 2024 21:57:29 +0300 (EEST)
Date: Thu, 26 Sep 2024 18:57:29 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 11/11] media: i2c: ov5645: Report streams using frame
 descriptors
Message-ID: <ZvWumaGsMPGGwPaS@kekkonen.localdomain>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZvWBlivUaZ92KoAI@kekkonen.localdomain>
 <20240926174819.GK21788@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926174819.GK21788@pendragon.ideasonboard.com>

On Thu, Sep 26, 2024 at 08:48:19PM +0300, Laurent Pinchart wrote:
> On Thu, Sep 26, 2024 at 03:45:26PM +0000, Sakari Ailus wrote:
> > Hi Prabhakar,
> > 
> > Thanks for the set. It looks largely very nice to me, after addressing
> > Laurent's comments. A few comments here and possibly on other patches...
> > 
> > On Tue, Sep 10, 2024 at 06:06:10PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > 
> > > Implement the .get_frame_desc() subdev operation to report information
> > > about streams to the connected CSI-2 receiver. This is required to let
> > > the CSI-2 receiver driver know about virtual channels and data types for
> > > each stream.
> > > 
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  drivers/media/i2c/ov5645.c | 28 ++++++++++++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > > 
> > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > index 7f1133292ffc..c24eb6e7a7b5 100644
> > > --- a/drivers/media/i2c/ov5645.c
> > > +++ b/drivers/media/i2c/ov5645.c
> > > @@ -28,6 +28,7 @@
> > >  #include <linux/regulator/consumer.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/types.h>
> > > +#include <media/mipi-csi2.h>
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-event.h>
> > >  #include <media/v4l2-fwnode.h>
> > > @@ -829,6 +830,32 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops = {
> > >  	.s_ctrl = ov5645_s_ctrl,
> > >  };
> > >  
> > > +static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > > +				 struct v4l2_mbus_frame_desc *fd)
> > > +{
> > > +	const struct v4l2_mbus_framefmt *fmt;
> > > +	struct v4l2_subdev_state *state;
> > > +
> > > +	if (pad != OV5645_PAD_SOURCE)
> > > +		return -EINVAL;
> > 
> > As you have a single source pad, and pretty much all sensor drivers will, I
> > think it'd be nice to add a check for this (that it's not an internal pad)
> > to the caller side in v4l2-subdev.c. And of course drop this one.
> 
> What check would you add, just verifying that the pad is a source pad ?

I think you could add that, too, besides the absence of the internal flag.

-- 
Sakari Ailus


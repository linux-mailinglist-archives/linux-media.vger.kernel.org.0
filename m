Return-Path: <linux-media+bounces-12056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB558D143F
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 08:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A4422826FC
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 06:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57624D9F4;
	Tue, 28 May 2024 06:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGD7bwPS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9074E1361
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716876952; cv=none; b=h2Eyc9Yznm1RTgW5zUYMHvC8fWvhFyIXuoU+uhNefHqoGPvK+x1wbnPIRjmj9UB8GkCr0ccaC47dFsbBIIDEUTMZb35Igco1QxNmR2HXOVWPmWo4b6cS1vfRCKLyqj7xspJ9Iq9vR9yQXSdR/S5vjAMgTP4Wwq9XeGyHnoGo6vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716876952; c=relaxed/simple;
	bh=fTpRisWpLPkm2kV5xZDOA/g1vl8r+v1LVNBFxqH9iTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRhuBkZkpTk5JfMyge4AXSxXCgvCifk+F7hUp9a+ZHZSr7LurBIq4MagAMgr+iXaDh/v0jXhg+7EztgCYmoRbXemeGeaXdZ8bPLhiM/kdIXDOwYrLxlpeoaOnxIokftghDyX33Ddu9e4uowITzu9x6xKxjoFF0fociKiS3syxz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGD7bwPS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716876950; x=1748412950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fTpRisWpLPkm2kV5xZDOA/g1vl8r+v1LVNBFxqH9iTw=;
  b=iGD7bwPSRaMXIC7Qr6P+9AWfL8ZLNVqjuh0krqy0kp6Qp6J7EXvGMKU8
   LFEZwWqhzzqkiDfBrAXt/lvijI7hHOFFqE8WU09oT//wVbH22/YmJQ2fs
   R0ahRb4H95tNwnXz3/7/y+E831pGDoadHzEmBDR0x2CAq/EY/8ugUDB0m
   jgrdCIw8TJSs3fUCPNpoEHdXPSgN3fxjWKOKRsGybP0QDkZ8AiVNMi70i
   eYZmoQdUGFvpOaeOssluJMfMaQSPnhKbVVkH13NeffgqgV4XN3lfqYU2r
   kNAiLmu0hSrFhtitMLcLetLxugc9iWPhHPEgy64henMl6dpzQxsVvEeUa
   A==;
X-CSE-ConnectionGUID: 5JQBkoIUTx6Ht+sRDJl8GA==
X-CSE-MsgGUID: QLj7bM0DRBCBx24hPJJtyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13389094"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="13389094"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 23:15:50 -0700
X-CSE-ConnectionGUID: qjj5eBf7THqojREJLh8YjQ==
X-CSE-MsgGUID: TqDysZ/mQ7eSUtTrMwAoIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="35556437"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 23:15:48 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ED7CF11FA4A;
	Tue, 28 May 2024 09:15:45 +0300 (EEST)
Date: Tue, 28 May 2024 06:15:45 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v6 1/4] media: v4l: Support passing media pad argument to
 v4l2_get_link_freq()
Message-ID: <ZlV2ke4liwxFZFqJ@kekkonen.localdomain>
References: <20240516122539.30787-1-sakari.ailus@linux.intel.com>
 <20240516122539.30787-2-sakari.ailus@linux.intel.com>
 <mmejy32ddl37q2f7z26qwehi5hwzftfa2vmlxnkfrjbsie7ree@6y427suyixdo>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mmejy32ddl37q2f7z26qwehi5hwzftfa2vmlxnkfrjbsie7ree@6y427suyixdo>

Hi Jacopo,

On Fri, May 17, 2024 at 12:17:35PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, May 16, 2024 at 03:25:36PM GMT, Sakari Ailus wrote:
> > v4l2_get_link_freq() accepts a V4L2 control handler for now, but it needs
> > to take struct media_pad argument in order to obtain the link frequency
> > using get_mbus_config() pad op. Prepare for this by allowing struct
> > media_pad as well.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 21 ++++++++++++++++++---
> >  include/media/v4l2-common.h           | 19 ++++++++++++++++---
> >  2 files changed, 34 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 4165c815faef..01650aed7c30 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -464,8 +464,8 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> >
> > -s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> > -		       unsigned int div)
> > +s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > +			      unsigned int mul, unsigned int div)
> >  {
> >  	struct v4l2_ctrl *ctrl;
> >  	s64 freq;
> > @@ -500,7 +500,22 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> >
> >  	return freq > 0 ? freq : -EINVAL;
> >  }
> > -EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
> > +EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> > +
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > +			     unsigned int div)
> > +{
> > +	struct v4l2_subdev *sd;
> > +
> > +	sd = media_entity_to_v4l2_subdev(pad->entity);
> > +	if (!sd)
> > +		return -ENODEV;
> > +
> > +	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > +}
> > +EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> > +#endif /* CONFIG_MEDIA_CONTROLLER */
> >
> >  /*
> >   * Simplify a fraction using a simple continued fraction decomposition. The
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 63ad36f04f72..f29dc8bb8f09 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -525,7 +525,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> >  /**
> >   * v4l2_get_link_freq - Get link rate from transmitter
> >   *
> > - * @handler: The transmitter's control handler
> > + * @pad: The transmitter's media pad (or control handler for non-MC users or
> 
> The users of get_link_freq we have in mainline all select
> MEDIA_CONTROLLER if I checked correctly
> v4l2_get_link_freq
> 
> drivers/media/i2c/st-mipid02.c
> drivers/media/i2c/tc358746.c
> drivers/media/pci/intel/ipu3/ipu3-cio2.c
> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> drivers/media/pci/intel/ivsc/mei_csi.c
> drivers/media/platform/cadence/cdns-csi2rx.c
> drivers/media/platform/nxp/imx-mipi-csis.c
> drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> drivers/media/platform/qcom/camss/camss.c
> drivers/media/platform/ti/cal/cal-camerarx.c
> 
> is it even worth having a compatibility fallback or can they be
> switched to use the remote's pad ?

Good question. Now that we have this patch, I'd merge it and remove the
non-pad variant after all drivers have been converted. I can do the
conversion soonish.

> 
> 
> > + *	 compatibility reasons, don't use in new code)
> >   * @mul: The multiplier between pixel rate and link frequency. Bits per pixel on
> >   *	 D-PHY, samples per clock on parallel. 0 otherwise.
> >   * @div: The divisor between pixel rate and link frequency. Number of data lanes
> > @@ -541,8 +542,20 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> >   * * %-ENOENT: Link frequency or pixel rate control not found
> >   * * %-EINVAL: Invalid link frequency value
> >   */
> > -s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> > -		       unsigned int div);
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +#define v4l2_get_link_freq(pad, mul, div)				\
> > +	_Generic(pad,							\
> > +		 struct media_pad *: __v4l2_get_link_freq_pad,		\
> > +		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
> > +	(pad, mul, div)
> > +s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > +			     unsigned int div);
> > +#else /* !CONFIG_MEDIA_CONTROLLER */
> > +#define v4l2_get_link_freq(handler, mul, div)		\
> > +	__v4l2_get_link_freq_ctrl(handler, mul, div)
> > +#endif /* !CONFIG_MEDIA_CONTROLLER */
> 
> nit: no ! in !CONFIG_MEDIA_CONTROLLER

I can also remove the comments, these sections are short enough so it's not
very useful.

> nit: maybe an empty line here ?

It's very much related to what's above, I'd prefer it this way but I don't
have a strong opinion about it either. :-)

> 
> > +s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > +			      unsigned int mul, unsigned int div);
> >
> >  void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
> >  		unsigned int n_terms, unsigned int threshold);

-- 
Regards,

Sakari Ailus


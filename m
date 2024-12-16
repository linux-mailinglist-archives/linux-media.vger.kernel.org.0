Return-Path: <linux-media+bounces-23458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E919F2C2D
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 09:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80D8E1671D2
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 08:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBCC1FFC6D;
	Mon, 16 Dec 2024 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWodUXN3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187411FFC46
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 08:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734338809; cv=none; b=E5h68H/p4H7ok2J2gpO3dwLf2I+3s/wFvmmb4wyot6S2O5ea19gMxc73H8g9ISb+866edpj+as5Z771Zqmmolns+X7tEvdckM3FdIqnHNtHSH2NFMrs63G0/4+zaQV1L/ENH7+gmUpJpcYnRu2LzfwRdnCTFGCeWAMCUL74QmJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734338809; c=relaxed/simple;
	bh=igYcPKCA0p0LRJ7Kuh3sF+ErQdruAMqthmxQ8KLVePM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpFzx+a6/izKs45UGt+uWqqtf/kFOICysrky1N+RDyw+00nZ2ze3q2aeEL2PnGFSVNHSKtZ2DwFZzA/GHnqwYxWGvXk4ZvP0imDOq9KDG+6//fd4xF3ckeDpgms894dvZ30W5TdpUm86dTkYopMrsCk9XOkxgptIshR2V/NVHLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWodUXN3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734338808; x=1765874808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=igYcPKCA0p0LRJ7Kuh3sF+ErQdruAMqthmxQ8KLVePM=;
  b=AWodUXN3RM2zWzx6/yzW6+NJUQkrrQtwr0P1wMdS4HNtNrb33XsLkCr0
   JEl3/jRkZ5PTmXPmfDStf83is9JOfes4xI0+rlnNuRo+2uhgliHtqanfh
   uZDwbJn6T8+7pqTqEEUACsEDd7v9Kvz3hc1TrSE4dCXsnTGbHWpPaWU42
   U4deq5ZjJZw2jwtqpucjQbEvYSGFZ8DrhMSFONQ4ZgX89dRGp470Qy39v
   IqGzT0OKoq0ZTakVG5Fg4XTrQiOUTcsozMI9ckRaiRT7OSISZryyhQKkn
   9mCqUDhDIXD/3XAbHN1ws51zSdvgNMNTP9SH3QNfxVd/6iTB85hCXS94d
   Q==;
X-CSE-ConnectionGUID: Hr/XPPRiQVGSdaKnI5aZgQ==
X-CSE-MsgGUID: lz8GP5zpTiKEsjB2jyzzlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46122845"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="46122845"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:46:47 -0800
X-CSE-ConnectionGUID: 4gD16gEPQKiINP5UMTxLIw==
X-CSE-MsgGUID: 8HH9Gl15QQah22f4ZyIm/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="97182354"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:46:46 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B588911F9F7;
	Mon, 16 Dec 2024 10:46:43 +0200 (EET)
Date: Mon, 16 Dec 2024 08:46:43 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 2/5] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <Z1_o8yHTYygdZtex@kekkonen.localdomain>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-3-sakari.ailus@linux.intel.com>
 <20241215165935.GG9975@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215165935.GG9975@pendragon.ideasonboard.com>

Hi Laurent,

On Sun, Dec 15, 2024 at 06:59:35PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Dec 10, 2024 at 09:59:03AM +0200, Sakari Ailus wrote:
> > Add link_freq field to struct v4l2_mbus_config in order to pass the link
> > frequency to the receiving sub-device.
> 
> The documentation of v4l2_get_link_freq() should be expanded to explain
> the new mode of operation. It should document which of the supported
> methods are recommended for new drivers.
> 
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 11 ++++++++---
> >  include/media/v4l2-mediabus.h         |  2 ++
> >  2 files changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 9fe74c7e064f..88fbd5608f00 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -508,13 +508,18 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> >  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> >  			     unsigned int div)
> >  {
> > +	struct v4l2_mbus_config mbus_config = {};
> 
> Isn't mbus_config fully populated by the .get_mbus_config() operation ?
> That should be documented in the .get_mbus_config() operation
> documentation.

It's a good practice to zero the memory before drivers get to work on it. I
presume drivers will set the fields that are relevant for them and ignore
the rest.

I can add a note on get_mbus_config() the drivers should set all struct
fields to known values.

> 
> >  	struct v4l2_subdev *sd;
> > +	int ret;
> >  
> >  	sd = media_entity_to_v4l2_subdev(pad->entity);
> > -	if (!sd)
> > -		return -ENODEV;
> > +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> > +			       &mbus_config);
> > +	if (ret < 0 && ret != -ENOIOCTLCMD)
> > +		return ret;
> >  
> > -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > +	return mbus_config.link_freq ?:
> > +		__v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> 
> 	if (mbus_config.link_freq)
> 		return mbus_config.link_freq;
> 
> 	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);

Whether this would be cleaner is debatable at least. I can switch if you
insist though.

> 
> I wonder if we should also add a message in case link_freq is 0, to get
> drivers to convert to reporting the link frequency through
> .get_mbus_config() if they already implement the operation.

I'm not sure this will be useful: in most cases the LINK_FREQ control is
used and for a reason: it's user-configurable. Drivers should only populate
the field if the link frequency is determined by the driver. For the
receiver drivers it does not matter: they use v4l2_get_link_freq().

> 
> >  }
> >  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> >  #endif /* CONFIG_MEDIA_CONTROLLER */
> > diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> > index 5bce6e423e94..cc5f776dc662 100644
> > --- a/include/media/v4l2-mediabus.h
> > +++ b/include/media/v4l2-mediabus.h
> > @@ -148,6 +148,7 @@ enum v4l2_mbus_type {
> >  /**
> >   * struct v4l2_mbus_config - media bus configuration
> >   * @type: interface type
> > + * @link_freq: The link frequency. See also V4L2_CID_LINK_FREQ control.
> 
> Not a candidate for this series, but I'd like to simplify drivers by
> implementing the LINK_FREQ control automatically.
> 
> >   * @bus: bus configuration data structure
> >   * @bus.parallel: embedded &struct v4l2_mbus_config_parallel.
> >   *		  Used if the bus is parallel or BT.656.
> > @@ -162,6 +163,7 @@ enum v4l2_mbus_type {
> >   */
> >  struct v4l2_mbus_config {
> >  	enum v4l2_mbus_type type;
> > +	u64 link_freq;
> >  	union {
> >  		struct v4l2_mbus_config_parallel parallel;
> >  		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
> 

-- 
Regards,

Sakari Ailus


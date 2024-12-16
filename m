Return-Path: <linux-media+bounces-23468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 527F99F3047
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 13:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8254E160848
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 12:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4D0204592;
	Mon, 16 Dec 2024 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjnUJbRS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC95534CC4
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734351337; cv=none; b=Q+cWtAjLnP7AOsZo9H8l+4MABEe7UwOXMFGY+xzk7qE7OT/qP1jqNECmaIrTmelOCpd/N6KTBxUYDYanKFcWnq5Cz8MyKdfORh3Y3uBVMi9AuR12POX6RvJ513Tg16OqqyUQvS+pGZYYVy3pUwymYPseMBvMFJ1tNdUDMdVn3/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734351337; c=relaxed/simple;
	bh=XK2cMoAcMTa02Eoe7uGDHkDJPLCNOawqEb9otFSM0Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IopessIfczobFVYeExUJhT4yie1QYqjuMIxheLwGCcG7xjKbD3ITJKM0Ngc6EMigW4UTfs8P4I3sPt6/sq7ntiLpal081sPM6BS7K8sjAeFDHIjAnfl8tip1ei5F0ksn76yxQUg04JH4LyNIbXLokr4dELL37enRisu31XRUIQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjnUJbRS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734351336; x=1765887336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XK2cMoAcMTa02Eoe7uGDHkDJPLCNOawqEb9otFSM0Ro=;
  b=PjnUJbRSJW23gr4MefPijB9l3XUZhfRpHfJd1VkW32Eb/GaWUafVHff6
   xOqFli7fVJ17xjKXO20MoA7LhQmcbIhYft/mODtoa0HMr3kiCHx3nvTKy
   F+trrUaTp8qcAH6h2Izspk10arN5/BmOQBEzpXRCiqBjgPJq1ji0eRXXV
   9Dv+k03Ub7hL9lMmu0C4KrEQFajkZbCsKkZIYXEe9CkZ0u7sXeaMlU145
   PdfW2whtKmWeUxljFvvj6Sr45IKggbcUlFETmUytA/SrQG4LwIL6Y4scs
   6hIuVNNyUOFXgLfyPoOVpkJ8oX+Am/8wvjSfFn6xe0EKffVjxPyEDZ8T/
   A==;
X-CSE-ConnectionGUID: fev/NVwKRr29PczW5Bis6A==
X-CSE-MsgGUID: RsIL6Ts+ScCOmNBy6D9qtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34028045"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="34028045"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 04:15:35 -0800
X-CSE-ConnectionGUID: ZukHUxzYSFuUjWQz20/Mfw==
X-CSE-MsgGUID: 07z6+NmjQJqCKFcbezr9Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="97083626"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 04:15:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 94CD011F9F7;
	Mon, 16 Dec 2024 14:15:31 +0200 (EET)
Date: Mon, 16 Dec 2024 12:15:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 2/5] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <Z2AZ4xD_HTxDD8wH@kekkonen.localdomain>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-3-sakari.ailus@linux.intel.com>
 <20241215165935.GG9975@pendragon.ideasonboard.com>
 <Z1_o8yHTYygdZtex@kekkonen.localdomain>
 <20241216111645.GL32204@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216111645.GL32204@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Dec 16, 2024 at 01:16:45PM +0200, Laurent Pinchart wrote:
> On Mon, Dec 16, 2024 at 08:46:43AM +0000, Sakari Ailus wrote:
> > On Sun, Dec 15, 2024 at 06:59:35PM +0200, Laurent Pinchart wrote:
> > > On Tue, Dec 10, 2024 at 09:59:03AM +0200, Sakari Ailus wrote:
> > > > Add link_freq field to struct v4l2_mbus_config in order to pass the link
> > > > frequency to the receiving sub-device.
> > > 
> > > The documentation of v4l2_get_link_freq() should be expanded to explain
> > > the new mode of operation. It should document which of the supported
> > > methods are recommended for new drivers.
> > > 
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-common.c | 11 ++++++++---
> > > >  include/media/v4l2-mediabus.h         |  2 ++
> > > >  2 files changed, 10 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > > index 9fe74c7e064f..88fbd5608f00 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > > @@ -508,13 +508,18 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> > > >  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > > >  			     unsigned int div)
> > > >  {
> > > > +	struct v4l2_mbus_config mbus_config = {};
> > > 
> > > Isn't mbus_config fully populated by the .get_mbus_config() operation ?
> > > That should be documented in the .get_mbus_config() operation
> > > documentation.
> > 
> > It's a good practice to zero the memory before drivers get to work on it. I
> > presume drivers will set the fields that are relevant for them and ignore
> > the rest.
> > 
> > I can add a note on get_mbus_config() the drivers should set all struct
> > fields to known values.
> 
> Thanks.
> 
> > > >  	struct v4l2_subdev *sd;
> > > > +	int ret;
> > > >  
> > > >  	sd = media_entity_to_v4l2_subdev(pad->entity);
> > > > -	if (!sd)
> > > > -		return -ENODEV;
> > > > +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> > > > +			       &mbus_config);
> > > > +	if (ret < 0 && ret != -ENOIOCTLCMD)
> > > > +		return ret;
> > > >  
> > > > -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > > > +	return mbus_config.link_freq ?:
> > > > +		__v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > > 
> > > 	if (mbus_config.link_freq)
> > > 		return mbus_config.link_freq;
> > > 
> > > 	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > 
> > Whether this would be cleaner is debatable at least. I can switch if you
> > insist though.
> 
> I think it's nicer. You could even write
> 
>  	if (mbus_config.link_freq)
>  		return mbus_config.link_freq;
> 
> 	/*
> 	 * Fall back to using the link frequency control if the media bus config
> 	 * doesn't provide a link frequency.
> 	 */
>  	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);

I can use this.

> 
> > > I wonder if we should also add a message in case link_freq is 0, to get
> > > drivers to convert to reporting the link frequency through
> > > .get_mbus_config() if they already implement the operation.
> > 
> > I'm not sure this will be useful: in most cases the LINK_FREQ control is
> > used and for a reason: it's user-configurable. Drivers should only populate
> > the field if the link frequency is determined by the driver. For the
> > receiver drivers it does not matter: they use v4l2_get_link_freq().
> 
> I think this depends on whether or not driver that have a configurable
> link frequency should report the current value through
> .get_mbus_config(). I think that drivers that implement
> .get_mbus_config() should, for consistency.

We should have a helper that obtains information using get_mbus_config() as
well as the fwnode endpoint. I've proposed that a few times over the years.
I'm hoping for someone who needs dynamic configuration e.g. for lane
numbers to implement it. :-)

I wouldn't try to add more burden for drivers on this. Beyond that, it's
common that if you have multiple implementations of something, one of them
(the unused one) eventually breaks. What we really need is to obtain the
information from the sub-device API, using the method the driver uses to
report it.

-- 
Regards,

Sakari Ailus


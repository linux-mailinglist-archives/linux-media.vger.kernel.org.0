Return-Path: <linux-media+bounces-23476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E47419F31FA
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 14:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 176D2166ADE
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 13:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508B9205AA1;
	Mon, 16 Dec 2024 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rDMGQpVk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C0129CA
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734357120; cv=none; b=NPmuHwXVK34QGxt5D9K+lTlhGZoP5arB/0DTgrWbxIK1RmC29B6iOVmYRRvKJxm33AH9DfghvkjjqIVmDkxzlIPEtFaE1WgRACuZim8m4QNM9QxR7oZ/mzQgDnbrPH2HNX9fQLZ7bk2uayC92KCVhiuszccp/eMS4pw01BXlWpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734357120; c=relaxed/simple;
	bh=eRk++64wIVp1j6QIVw3GPlcsFSHnW/6LsSn0cHj4/pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnVgqPfmyqfz7E09XLMFpNttKeVW6+TVPXadEVADEX3PMEQBVDDktiFXRPwRGi+rsJe5MvC6pr13JZM/SSTiSucR2Axv/Rifqzbh+aoYB4WlbDosRvk8/TQCjdi4x6bQWnwd262YisrZExLGePdsV1q/pFSbx21FVgN5SC+vtes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rDMGQpVk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77C8082A;
	Mon, 16 Dec 2024 14:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734357080;
	bh=eRk++64wIVp1j6QIVw3GPlcsFSHnW/6LsSn0cHj4/pM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDMGQpVkV7lptmlfKRMpKdih+cW465uw2I+j/hydFvfbJOTeXW9ugWTaG3ZSciOaa
	 87bSZZHKw3z+zidbZ8ht3yuOAQnMI6GaSO8c9kCeh0eV5S8eWPBPRuvKDOUlbLF9q/
	 f0sN/YuTGUdQ+B7nj20rMTPIhnWWI+RgEzP2b8/k=
Date: Mon, 16 Dec 2024 15:51:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 2/5] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <20241216135140.GA29336@pendragon.ideasonboard.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-3-sakari.ailus@linux.intel.com>
 <20241215165935.GG9975@pendragon.ideasonboard.com>
 <Z1_o8yHTYygdZtex@kekkonen.localdomain>
 <20241216111645.GL32204@pendragon.ideasonboard.com>
 <Z2AZ4xD_HTxDD8wH@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z2AZ4xD_HTxDD8wH@kekkonen.localdomain>

On Mon, Dec 16, 2024 at 12:15:31PM +0000, Sakari Ailus wrote:
> On Mon, Dec 16, 2024 at 01:16:45PM +0200, Laurent Pinchart wrote:
> > On Mon, Dec 16, 2024 at 08:46:43AM +0000, Sakari Ailus wrote:
> > > On Sun, Dec 15, 2024 at 06:59:35PM +0200, Laurent Pinchart wrote:
> > > > On Tue, Dec 10, 2024 at 09:59:03AM +0200, Sakari Ailus wrote:
> > > > > Add link_freq field to struct v4l2_mbus_config in order to pass the link
> > > > > frequency to the receiving sub-device.
> > > > 
> > > > The documentation of v4l2_get_link_freq() should be expanded to explain
> > > > the new mode of operation. It should document which of the supported
> > > > methods are recommended for new drivers.
> > > > 
> > > > > 
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >  drivers/media/v4l2-core/v4l2-common.c | 11 ++++++++---
> > > > >  include/media/v4l2-mediabus.h         |  2 ++
> > > > >  2 files changed, 10 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > > > index 9fe74c7e064f..88fbd5608f00 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > > > @@ -508,13 +508,18 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> > > > >  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > > > >  			     unsigned int div)
> > > > >  {
> > > > > +	struct v4l2_mbus_config mbus_config = {};
> > > > 
> > > > Isn't mbus_config fully populated by the .get_mbus_config() operation ?
> > > > That should be documented in the .get_mbus_config() operation
> > > > documentation.
> > > 
> > > It's a good practice to zero the memory before drivers get to work on it. I
> > > presume drivers will set the fields that are relevant for them and ignore
> > > the rest.
> > > 
> > > I can add a note on get_mbus_config() the drivers should set all struct
> > > fields to known values.
> > 
> > Thanks.
> > 
> > > > >  	struct v4l2_subdev *sd;
> > > > > +	int ret;
> > > > >  
> > > > >  	sd = media_entity_to_v4l2_subdev(pad->entity);
> > > > > -	if (!sd)
> > > > > -		return -ENODEV;
> > > > > +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> > > > > +			       &mbus_config);
> > > > > +	if (ret < 0 && ret != -ENOIOCTLCMD)
> > > > > +		return ret;
> > > > >  
> > > > > -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > > > > +	return mbus_config.link_freq ?:
> > > > > +		__v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > > > 
> > > > 	if (mbus_config.link_freq)
> > > > 		return mbus_config.link_freq;
> > > > 
> > > > 	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > > 
> > > Whether this would be cleaner is debatable at least. I can switch if you
> > > insist though.
> > 
> > I think it's nicer. You could even write
> > 
> >  	if (mbus_config.link_freq)
> >  		return mbus_config.link_freq;
> > 
> > 	/*
> > 	 * Fall back to using the link frequency control if the media bus config
> > 	 * doesn't provide a link frequency.
> > 	 */
> >  	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> 
> I can use this.
> 
> > 
> > > > I wonder if we should also add a message in case link_freq is 0, to get
> > > > drivers to convert to reporting the link frequency through
> > > > .get_mbus_config() if they already implement the operation.
> > > 
> > > I'm not sure this will be useful: in most cases the LINK_FREQ control is
> > > used and for a reason: it's user-configurable. Drivers should only populate
> > > the field if the link frequency is determined by the driver. For the
> > > receiver drivers it does not matter: they use v4l2_get_link_freq().
> > 
> > I think this depends on whether or not driver that have a configurable
> > link frequency should report the current value through
> > .get_mbus_config(). I think that drivers that implement
> > .get_mbus_config() should, for consistency.
> 
> We should have a helper that obtains information using get_mbus_config() as
> well as the fwnode endpoint. I've proposed that a few times over the years.
> I'm hoping for someone who needs dynamic configuration e.g. for lane
> numbers to implement it. :-)

I'm not sure to follow you here, I don't really see how it's related, or
exactly what that helper would do.

> I wouldn't try to add more burden for drivers on this. Beyond that, it's
> common that if you have multiple implementations of something, one of them
> (the unused one) eventually breaks. What we really need is to obtain the
> information from the sub-device API, using the method the driver uses to
> report it.

We should have a single way to report a given piece of information, that
would be the simplest for drivers and the least error prone. I think
drivers should implement the LINK_FREQ control for userspace, and the
.get_mbus_config() operation for kernel space.

-- 
Regards,

Laurent Pinchart


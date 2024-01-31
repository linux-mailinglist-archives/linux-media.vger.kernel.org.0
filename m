Return-Path: <linux-media+bounces-4497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4838438B2
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 09:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C29328BD5C
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 08:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B355813B;
	Wed, 31 Jan 2024 08:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpKEo6Ie"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB0858206;
	Wed, 31 Jan 2024 08:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706689281; cv=none; b=N1f8gmPlGkUHAIrI8bdeKtp4wvWIJT10O7Ze44P929HvGxBA8YiGZMWHlkGelUlprM+2lT7oVJW16J/2Q69B0gxIKJezLOLl2OHe06MhKTAqpDwRmmKH8wqY2KyYox6z/TlCDBnsMmpDEk9Uy4EGJntnyPE3rsDLD7iapoPgIIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706689281; c=relaxed/simple;
	bh=6R4lmUyyXzXevw8q/tVhoPaBogF9Cx9o7WpVVmB13sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufahNnMPeY4JXEh69qwNlzFB31Z2vvkizhZuyRSizDWVkhop1kApHP4T/jhM+eeD+t1hUU9PvHjQY5rM9FK9q1A500BiycufPDgB7qn42qDPXNLgzgC7xVbuiwLa2dBWkgxs14i//RmHM3I2ezbhbNbnC24kpH2rk0OWtiLFk5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpKEo6Ie; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706689280; x=1738225280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6R4lmUyyXzXevw8q/tVhoPaBogF9Cx9o7WpVVmB13sY=;
  b=YpKEo6Iedt5E4wOaADMXkMsdGgoFaPVonMwI5zht8uPAZV5vCDrE5I5u
   S06FTQJ3QNr/FAUXah9+qgwudY7uqOEBa6v8mbRQ6lD+mgfFsggAlKTyN
   yEj98UQxNfR3cxt9n6UkMmI0/qTbsUhGu613pQrzsJ1/7IMCl5mWHBd0/
   Mpfg6d7av8uEmZAH8R7ZQkLxjQoE32F/Clp1UzqlUzKHJYxmIAz2Y/PKH
   vdDu6m+mBE8DBf0IYtqTROeZo0e6A7ARWPaINWfiRfzneWws2RfNMMf6Y
   7nXnjsJVNjdF/q9tPeRHsQTDXr9kdyrFKbOmIzbb7Q7sdYHyK+UdcEIlk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="25009680"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="25009680"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 00:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="36784992"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 00:21:17 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9AC9611F86A;
	Wed, 31 Jan 2024 10:21:13 +0200 (EET)
Date: Wed, 31 Jan 2024 08:21:13 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: v4l: async: Fix completion of chained subnotifiers
Message-ID: <ZboC-S8P6en7ifTv@kekkonen.localdomain>
References: <20240129195954.1110643-1-niklas.soderlund+renesas@ragnatech.se>
 <ZbjmDTvI0PiUWvL_@kekkonen.localdomain>
 <20240130134341.GA2544372@ragnatech.se>
 <ZbkVd79Yk5sYyql-@kekkonen.localdomain>
 <20240130154058.GC2544372@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240130154058.GC2544372@ragnatech.se>

Hejssan Niklas,

On Tue, Jan 30, 2024 at 04:40:58PM +0100, Niklas Söderlund wrote:
> Hi Sakari,
> 
> On 2024-01-30 15:27:51 +0000, Sakari Ailus wrote:
> > Hej Niklas,
> > 
> > On Tue, Jan 30, 2024 at 02:43:41PM +0100, Niklas Söderlund wrote:
> > > Hi Sakari,
> > > 
> > > Thanks for your feedback.
> > > 
> > > On 2024-01-30 12:05:33 +0000, Sakari Ailus wrote:
> > > > Hi Niklas,
> > > > 
> > > > Thanks for the patch.
> > > > 
> > > > On Mon, Jan 29, 2024 at 08:59:54PM +0100, Niklas Söderlund wrote:
> > > > > Allowing multiple connections between entities are very useful but the
> > > > > addition of this feature did not considerate nested subnotifiers.
> > > > > 
> > > > > Consider the scenario,
> > > > > 
> > > > > rcar-vin.ko     rcar-isp.ko     rcar-csi2.ko    max96712.ko
> > > > > 
> > > > > video0 ---->    v4l-subdev0 ->  v4l-subdev1 ->  v4l-subdev2
> > > > > video1 -´
> > > > > 
> > > > > Where each videoX or v4l-subdevX is controlled and register by a
> > > > > separate instance of the driver listed above it. And each driver
> > > > > instance registers a notifier (videoX) or a subnotifier (v4l-subdevX)
> > > > > trying to bind to the device pointed to.
> > > > > 
> > > > > If the devices probe in any other except where the vidoeX ones are
> > > > > probed last only one of them will have their complete callback called,
> > > > > the one who last registered its notifier. Both of them will however have
> > > > > their bind() callback called as expected.
> > > > > 
> > > > > This is due to v4l2_async_nf_try_complete() only walking the chain from
> > > > > the subnotifier to one root notifier and completing it while ignoring
> > > > > all other notifiers the subdevice might be part of. This works if there
> > > > > are only one subnotifier in the mix. For example if either v4l-subdev0
> > > > > or v4l-subdev1 was not part of the pipeline above.
> > > > > 
> > > > > This patch addresses the issue of nested subnotifiers by instead looking
> > > > > at all notifiers and try to complete all the ones that contain the
> > > > > subdevice which subnotifier was completed.
> > > > 
> > > > Why do you need this?
> > > 
> > > I need this for the use-case described as an example above. In a 
> > > separate series [1] I remove the rcar-vin workaround for the earlier 
> > > lack of multiple connections between entities in v4l-async and without a 
> > > solution this patch tries to address this breaks on some boards that 
> > > already use nested subnotifiers but for which the rcar-vin workaround 
> > > addresses.
> > > 
> > > > This is also not a bug, the documentation for the complete callback says:
> > > > 
> > > >  * @complete:	All connections have been bound successfully. The complete
> > > >  *		callback is only executed for the root notifier.
> > > 
> > > Yes, and here there are two root notifiers. One in the driver 
> > > registering video0 and the one registering video1. Both notifiers wish 
> > > to bind to v4l-subdev0. And both notifers have their bind callback 
> > > called when v4l-subdev0 is registered, but only one have its complete 
> > > callback called.
> > 
> > In this respect the current framework isn't perfect, it only allows one
> > parent...
> 
> With this fix (or something like it) it works with multiple parents ;-) 
> If it's not a bug and we drop the Fixes tag do you think this is a step 
> in the right direction? Or shall I drop trying to solve my use-case with 
> a solution in this area and focus on trying to work around this 
> limitation in the driver?

I'll review the patch properly later today.

> 
> > 
> > > 
> > > > 
> > > > Rather it would be better to get rid of this callback entirely, one reason
> > > > being the impossibility of error handling. We won't be there for quite some
> > > > time but extending its scope does go to the other direction.
> > > 
> > > I agree this is the way to go. And I could do without it in my use-cases 
> > > if I was allowed to register the video device at probe time instead of 
> > > in the complete callback. I have brought this up over the years but 
> > > always been told that the video device should be registered in the 
> > > callback handler. If this is no longer true I can rework [1] and a fix 
> > 
> > Are you sure?
> > 
> > I guess there may be differing opinions on the matter but drivers such as
> > ipu3-cio2 and omap3isp do it in probe. I don't think rcar-vin should be
> > different in this respect.
> 
> Yes, I even tried to move it to probe [2] in 2017 to solve a different 
> issue at the time. I have also discussed this in person at various 
> conferences around that time. But 2017 was a long time ago and if you 
> think it's now OK to register the video device at probe time I will do 
> so work around my issue that way. But would be nice with a confirmation 
> that this is OK before I move down that route.

Two other drivers are already doing it, I don't see why rcar-vin shouldn't.
I'm sure there are others as I checked only two. :-)

> 
> 2.  https://lore.kernel.org/linux-renesas-soc/20170524001540.13613-16-niklas.soderlund@ragnatech.se/

Why is control handler initialisation left to the complete handler?

> 
> > 
> > > like this wont be needed for my use-cases.
> > > 
> > > Looking beyond my use-case do you agree that as long as we do have the 
> > > complete callback it needs to be supported for nested subnotifiers?
> > > 
> > > 1. [PATCH 0/6] media: rcar-vin: Make use of multiple connections in v4l-async
> > > 
> > > > 
> > > > > 
> > > > > Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
> > > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > > ---
> > > > >  drivers/media/v4l2-core/v4l2-async.c | 68 ++++++++++++++++++++--------
> > > > >  1 file changed, 49 insertions(+), 19 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > > index 3ec323bd528b..8b603527923c 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > > @@ -176,15 +176,16 @@ static LIST_HEAD(notifier_list);
> > > > >  static DEFINE_MUTEX(list_lock);
> > > > >  
> > > > >  static struct v4l2_async_connection *
> > > > > -v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > > > > -		      struct v4l2_subdev *sd)
> > > > > +__v4l2_async_find_in_list(struct v4l2_async_notifier *notifier,
> > > > > +			  struct v4l2_subdev *sd,
> > > > > +			  struct list_head *list)
> > > > >  {
> > > > >  	bool (*match)(struct v4l2_async_notifier *notifier,
> > > > >  		      struct v4l2_subdev *sd,
> > > > >  		      struct v4l2_async_match_desc *match);
> > > > >  	struct v4l2_async_connection *asc;
> > > > >  
> > > > > -	list_for_each_entry(asc, &notifier->waiting_list, asc_entry) {
> > > > > +	list_for_each_entry(asc, list, asc_entry) {
> > > > >  		/* bus_type has been verified valid before */
> > > > >  		switch (asc->match.type) {
> > > > >  		case V4L2_ASYNC_MATCH_TYPE_I2C:
> > > > > @@ -207,6 +208,20 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > > > >  	return NULL;
> > > > >  }
> > > > >  
> > > > > +static struct v4l2_async_connection *
> > > > > +v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > > > > +		      struct v4l2_subdev *sd)
> > > > > +{
> > > > > +	return __v4l2_async_find_in_list(notifier, sd, &notifier->waiting_list);
> > > > > +}
> > > > > +
> > > > > +static struct v4l2_async_connection *
> > > > > +v4l2_async_find_done(struct v4l2_async_notifier *notifier,
> > > > > +		     struct v4l2_subdev *sd)
> > > > > +{
> > > > > +	return __v4l2_async_find_in_list(notifier, sd, &notifier->done_list);
> > > > > +}
> > > > > +
> > > > >  /* Compare two async match descriptors for equivalence */
> > > > >  static bool v4l2_async_match_equal(struct v4l2_async_match_desc *match1,
> > > > >  				   struct v4l2_async_match_desc *match2)
> > > > > @@ -274,13 +289,14 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
> > > > >  }
> > > > >  
> > > > >  /*
> > > > > - * Complete the master notifier if possible. This is done when all async
> > > > > + * Complete the master notifiers if possible. This is done when all async
> > > > >   * sub-devices have been bound; v4l2_device is also available then.
> > > > >   */
> > > > >  static int
> > > > >  v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> > > > >  {
> > > > > -	struct v4l2_async_notifier *__notifier = notifier;
> > > > > +	struct v4l2_async_notifier *n;
> > > > > +	int ret;
> > > > >  
> > > > >  	/* Quick check whether there are still more sub-devices here. */
> > > > >  	if (!list_empty(&notifier->waiting_list))
> > > > > @@ -290,24 +306,38 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> > > > >  		dev_dbg(notifier_dev(notifier),
> > > > >  			"v4l2-async: trying to complete\n");
> > > > >  
> > > > > -	/* Check the entire notifier tree; find the root notifier first. */
> > > > > -	while (notifier->parent)
> > > > > -		notifier = notifier->parent;
> > > > > +	/*
> > > > > +	 * Notifiers without a parent are either a subnotifier that have not
> > > > > +	 * yet been associated with it is a root notifier or a root notifier
> > > > > +	 * itself. If it is a root notifier try to complete it.
> > > > > +	 */
> > > > > +	if (!notifier->parent) {
> > > > > +		/* This is root if it has v4l2_dev. */
> > > > > +		if (!notifier->v4l2_dev) {
> > > > > +			dev_dbg(notifier_dev(notifier),
> > > > > +				"v4l2-async: V4L2 device not available\n");
> > > > > +			return 0;
> > > > > +		}
> > > > >  
> > > > > -	/* This is root if it has v4l2_dev. */
> > > > > -	if (!notifier->v4l2_dev) {
> > > > > -		dev_dbg(notifier_dev(__notifier),
> > > > > -			"v4l2-async: V4L2 device not available\n");
> > > > > -		return 0;
> > > > > -	}
> > > > > +		/* Is everything ready? */
> > > > > +		if (!v4l2_async_nf_can_complete(notifier))
> > > > > +			return 0;
> > > > > +
> > > > > +		dev_dbg(notifier_dev(notifier), "v4l2-async: complete\n");
> > > > >  
> > > > > -	/* Is everything ready? */
> > > > > -	if (!v4l2_async_nf_can_complete(notifier))
> > > > > -		return 0;
> > > > > +		return v4l2_async_nf_call_complete(notifier);
> > > > > +	}
> > > > >  
> > > > > -	dev_dbg(notifier_dev(__notifier), "v4l2-async: complete\n");
> > > > > +	/* Try to complete all notifiers containing the subdevices. */
> > > > > +	list_for_each_entry(n, &notifier_list, notifier_entry) {
> > > > > +		if (v4l2_async_find_done(n, notifier->sd)) {
> > > > > +			ret = v4l2_async_nf_try_complete(n);
> > > > > +			if (ret)
> > > > > +				return ret;
> > > > > +		}
> > > > > +	}
> > > > >  
> > > > > -	return v4l2_async_nf_call_complete(notifier);
> > > > > +	return 0;
> > > > >  }
> > > > >  
> > > > >  static int
> > > > 
> > 
> > -- 
> > Hälsningar,
> > 
> > Sakari Ailus
> 
> -- 
> Kind Regards,
> Niklas Söderlund

-- 
Hälsningar,

Sakari Ailus


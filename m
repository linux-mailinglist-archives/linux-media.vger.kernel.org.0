Return-Path: <linux-media+bounces-4430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6BA84280C
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 16:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A57FE2874BA
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 15:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A902823C9;
	Tue, 30 Jan 2024 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWpId1T3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134FB7E774;
	Tue, 30 Jan 2024 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706628477; cv=none; b=ea7wOhzhcR6ezkAYkGESJNAKoEfFqc1SAnOl5pDSIL/u8JUwDUxkxSGdtBsYJL6cZIw6zck1ElSI4ppyaZhUJMW9k24y4zdBFE7AiPH2x+Zgpei2UZseOY7+t7FunZiJqfr+WaiPGhizLNck8uqcVep3pRr2+vz23b9shGaDphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706628477; c=relaxed/simple;
	bh=D5FoXLFDCOr+uQhMTe8KpKL5iuEWL6h/YU4h9dhx4r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oF+qvGtz8Y22TL+fnJEQ0KHUvSRuCAGzBSUZkVl+kk8+2ivFcs17RrmC6PinVCZRpBKh6OCzPQdEdBctFdv3hnRkajpYCroOkks9hpfW2T3JqRDG/jUE8T1K7cQRYAF5zz8DFcmoRRMHoLqk+so/OgZbG3hTW009Zxys0NdAH3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWpId1T3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706628476; x=1738164476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=D5FoXLFDCOr+uQhMTe8KpKL5iuEWL6h/YU4h9dhx4r8=;
  b=HWpId1T3ErTX1bG6gCm6K6j1fM1rkhY0/Wx+cr+l/F2DVIldFvbtEeRl
   VnKEIdP4nUUQVltiLkdsDLBw1TJBO1Gg5jB2e/89F+PrQxtbSwuWrtPxF
   xgM0I9+gHB81lS7JA6Nm4DELEdS9iTzhFLHd/3l9wByaWWv/rv4HlXuOG
   UNsmhyPlt/PTfvRV9f1cCmoHwbi92TteW5Fc12mp6lxctBfAp+P2G6jht
   JYgvxMwm6mQ/FvO04Aw5Lp/+100jyB1aM89bFGfarVnep10RaGSkZOikC
   KYSyGMV3fUQ3D19zadnzFV0f+mPK2nf/oWjVI1zNEQRpsQge2eHtMGjfp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="9979943"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="9979943"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 07:27:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="1119302843"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="1119302843"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 07:27:53 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5D1E511F9D2;
	Tue, 30 Jan 2024 17:27:51 +0200 (EET)
Date: Tue, 30 Jan 2024 15:27:51 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: v4l: async: Fix completion of chained subnotifiers
Message-ID: <ZbkVd79Yk5sYyql-@kekkonen.localdomain>
References: <20240129195954.1110643-1-niklas.soderlund+renesas@ragnatech.se>
 <ZbjmDTvI0PiUWvL_@kekkonen.localdomain>
 <20240130134341.GA2544372@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240130134341.GA2544372@ragnatech.se>

Hej Niklas,

On Tue, Jan 30, 2024 at 02:43:41PM +0100, Niklas Söderlund wrote:
> Hi Sakari,
> 
> Thanks for your feedback.
> 
> On 2024-01-30 12:05:33 +0000, Sakari Ailus wrote:
> > Hi Niklas,
> > 
> > Thanks for the patch.
> > 
> > On Mon, Jan 29, 2024 at 08:59:54PM +0100, Niklas Söderlund wrote:
> > > Allowing multiple connections between entities are very useful but the
> > > addition of this feature did not considerate nested subnotifiers.
> > > 
> > > Consider the scenario,
> > > 
> > > rcar-vin.ko     rcar-isp.ko     rcar-csi2.ko    max96712.ko
> > > 
> > > video0 ---->    v4l-subdev0 ->  v4l-subdev1 ->  v4l-subdev2
> > > video1 -´
> > > 
> > > Where each videoX or v4l-subdevX is controlled and register by a
> > > separate instance of the driver listed above it. And each driver
> > > instance registers a notifier (videoX) or a subnotifier (v4l-subdevX)
> > > trying to bind to the device pointed to.
> > > 
> > > If the devices probe in any other except where the vidoeX ones are
> > > probed last only one of them will have their complete callback called,
> > > the one who last registered its notifier. Both of them will however have
> > > their bind() callback called as expected.
> > > 
> > > This is due to v4l2_async_nf_try_complete() only walking the chain from
> > > the subnotifier to one root notifier and completing it while ignoring
> > > all other notifiers the subdevice might be part of. This works if there
> > > are only one subnotifier in the mix. For example if either v4l-subdev0
> > > or v4l-subdev1 was not part of the pipeline above.
> > > 
> > > This patch addresses the issue of nested subnotifiers by instead looking
> > > at all notifiers and try to complete all the ones that contain the
> > > subdevice which subnotifier was completed.
> > 
> > Why do you need this?
> 
> I need this for the use-case described as an example above. In a 
> separate series [1] I remove the rcar-vin workaround for the earlier 
> lack of multiple connections between entities in v4l-async and without a 
> solution this patch tries to address this breaks on some boards that 
> already use nested subnotifiers but for which the rcar-vin workaround 
> addresses.
> 
> > This is also not a bug, the documentation for the complete callback says:
> > 
> >  * @complete:	All connections have been bound successfully. The complete
> >  *		callback is only executed for the root notifier.
> 
> Yes, and here there are two root notifiers. One in the driver 
> registering video0 and the one registering video1. Both notifiers wish 
> to bind to v4l-subdev0. And both notifers have their bind callback 
> called when v4l-subdev0 is registered, but only one have its complete 
> callback called.

In this respect the current framework isn't perfect, it only allows one
parent...

> 
> > 
> > Rather it would be better to get rid of this callback entirely, one reason
> > being the impossibility of error handling. We won't be there for quite some
> > time but extending its scope does go to the other direction.
> 
> I agree this is the way to go. And I could do without it in my use-cases 
> if I was allowed to register the video device at probe time instead of 
> in the complete callback. I have brought this up over the years but 
> always been told that the video device should be registered in the 
> callback handler. If this is no longer true I can rework [1] and a fix 

Are you sure?

I guess there may be differing opinions on the matter but drivers such as
ipu3-cio2 and omap3isp do it in probe. I don't think rcar-vin should be
different in this respect.

> like this wont be needed for my use-cases.
> 
> Looking beyond my use-case do you agree that as long as we do have the 
> complete callback it needs to be supported for nested subnotifiers?
> 
> 1. [PATCH 0/6] media: rcar-vin: Make use of multiple connections in v4l-async
> 
> > 
> > > 
> > > Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-async.c | 68 ++++++++++++++++++++--------
> > >  1 file changed, 49 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > index 3ec323bd528b..8b603527923c 100644
> > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > @@ -176,15 +176,16 @@ static LIST_HEAD(notifier_list);
> > >  static DEFINE_MUTEX(list_lock);
> > >  
> > >  static struct v4l2_async_connection *
> > > -v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > > -		      struct v4l2_subdev *sd)
> > > +__v4l2_async_find_in_list(struct v4l2_async_notifier *notifier,
> > > +			  struct v4l2_subdev *sd,
> > > +			  struct list_head *list)
> > >  {
> > >  	bool (*match)(struct v4l2_async_notifier *notifier,
> > >  		      struct v4l2_subdev *sd,
> > >  		      struct v4l2_async_match_desc *match);
> > >  	struct v4l2_async_connection *asc;
> > >  
> > > -	list_for_each_entry(asc, &notifier->waiting_list, asc_entry) {
> > > +	list_for_each_entry(asc, list, asc_entry) {
> > >  		/* bus_type has been verified valid before */
> > >  		switch (asc->match.type) {
> > >  		case V4L2_ASYNC_MATCH_TYPE_I2C:
> > > @@ -207,6 +208,20 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > >  	return NULL;
> > >  }
> > >  
> > > +static struct v4l2_async_connection *
> > > +v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > > +		      struct v4l2_subdev *sd)
> > > +{
> > > +	return __v4l2_async_find_in_list(notifier, sd, &notifier->waiting_list);
> > > +}
> > > +
> > > +static struct v4l2_async_connection *
> > > +v4l2_async_find_done(struct v4l2_async_notifier *notifier,
> > > +		     struct v4l2_subdev *sd)
> > > +{
> > > +	return __v4l2_async_find_in_list(notifier, sd, &notifier->done_list);
> > > +}
> > > +
> > >  /* Compare two async match descriptors for equivalence */
> > >  static bool v4l2_async_match_equal(struct v4l2_async_match_desc *match1,
> > >  				   struct v4l2_async_match_desc *match2)
> > > @@ -274,13 +289,14 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
> > >  }
> > >  
> > >  /*
> > > - * Complete the master notifier if possible. This is done when all async
> > > + * Complete the master notifiers if possible. This is done when all async
> > >   * sub-devices have been bound; v4l2_device is also available then.
> > >   */
> > >  static int
> > >  v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> > >  {
> > > -	struct v4l2_async_notifier *__notifier = notifier;
> > > +	struct v4l2_async_notifier *n;
> > > +	int ret;
> > >  
> > >  	/* Quick check whether there are still more sub-devices here. */
> > >  	if (!list_empty(&notifier->waiting_list))
> > > @@ -290,24 +306,38 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> > >  		dev_dbg(notifier_dev(notifier),
> > >  			"v4l2-async: trying to complete\n");
> > >  
> > > -	/* Check the entire notifier tree; find the root notifier first. */
> > > -	while (notifier->parent)
> > > -		notifier = notifier->parent;
> > > +	/*
> > > +	 * Notifiers without a parent are either a subnotifier that have not
> > > +	 * yet been associated with it is a root notifier or a root notifier
> > > +	 * itself. If it is a root notifier try to complete it.
> > > +	 */
> > > +	if (!notifier->parent) {
> > > +		/* This is root if it has v4l2_dev. */
> > > +		if (!notifier->v4l2_dev) {
> > > +			dev_dbg(notifier_dev(notifier),
> > > +				"v4l2-async: V4L2 device not available\n");
> > > +			return 0;
> > > +		}
> > >  
> > > -	/* This is root if it has v4l2_dev. */
> > > -	if (!notifier->v4l2_dev) {
> > > -		dev_dbg(notifier_dev(__notifier),
> > > -			"v4l2-async: V4L2 device not available\n");
> > > -		return 0;
> > > -	}
> > > +		/* Is everything ready? */
> > > +		if (!v4l2_async_nf_can_complete(notifier))
> > > +			return 0;
> > > +
> > > +		dev_dbg(notifier_dev(notifier), "v4l2-async: complete\n");
> > >  
> > > -	/* Is everything ready? */
> > > -	if (!v4l2_async_nf_can_complete(notifier))
> > > -		return 0;
> > > +		return v4l2_async_nf_call_complete(notifier);
> > > +	}
> > >  
> > > -	dev_dbg(notifier_dev(__notifier), "v4l2-async: complete\n");
> > > +	/* Try to complete all notifiers containing the subdevices. */
> > > +	list_for_each_entry(n, &notifier_list, notifier_entry) {
> > > +		if (v4l2_async_find_done(n, notifier->sd)) {
> > > +			ret = v4l2_async_nf_try_complete(n);
> > > +			if (ret)
> > > +				return ret;
> > > +		}
> > > +	}
> > >  
> > > -	return v4l2_async_nf_call_complete(notifier);
> > > +	return 0;
> > >  }
> > >  
> > >  static int
> > 

-- 
Hälsningar,

Sakari Ailus


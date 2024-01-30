Return-Path: <linux-media+bounces-4431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9A584283A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 16:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92666285170
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 15:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B2D1272C2;
	Tue, 30 Jan 2024 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ey/BzR22"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1AF86AEF
	for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706629264; cv=none; b=hHfnbM381tiVFsXZ/nRjQmvKqGwJ+lWFq4r4EC4CK1UUZ+RXdGGBBdrmZDA9/NzqhwJw13f+4LGbquapaZn2Bt4D4p6jlAWC86+CNbcHqD8RwUMpF8n+STmvi2XZFtI1N67N7Ly5wvbaWlxAdcoLsZn40ZpUgdrVbvyEemvc1io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706629264; c=relaxed/simple;
	bh=5krMIBl4n0a1Z/ZhMsP0o/L7iNzPD+qczUGOcXgd0k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAIOBDUE5kvfpcNdD1xYiFmxjTR62i1X5Exa/QnoSTjuGy+TLin5Wr3D/nF4lt2E7nf2KsW5xtqFuuV4jOcMeEX53N4y/jQKdgZN8i2s3OTQ6K69B3ZFQ1vo+CzBXzHh4TprVz7YFn/AFrhpc3IofgbyABLrL0QzG02nWIDW2CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ey/BzR22; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-511207d62b6so507989e87.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 07:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706629260; x=1707234060; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M2dQnFwI2LSx4IwikGOsCmHQ9lzvO3R64X34eGDX8QM=;
        b=ey/BzR220ItmuysxzCYSFawfRhOarR+abCIXOk5llEAXOpaYRNbjRxeg2xndA4ZDDG
         xb7we0/3jKF/w5sEdx8hijLKk6SFMXauL4eS3KgfbdfQvxy09zOSGrB7r+TLluSOwtbB
         0PGS9poNIPZsH/xQtP0lYgLKZRVQtGjg6MG7DbPBXBuwgnOkvyEHdqB8NNbvbb1lcW+C
         0qTKawrsE+JMDcyZa8wSx2v7pprW71ik+KczSQa2kY3uNFK7J6TN4QoiEy2ph6EFNDU/
         jkh5KWH3xW3la3qfWKPuzoUjSWCeneKiNkxHhlEXiCp+FdGwt7BysturxlDTd+K1YIVU
         WU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706629260; x=1707234060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2dQnFwI2LSx4IwikGOsCmHQ9lzvO3R64X34eGDX8QM=;
        b=U5H8/UfvsMRHb10NaKJ0pD8gwQ2KO1cDpfDNDJcU5CGbgIDSJh7TMbDnFqHto/27Xd
         p5yYaZBe0gIVcgP/mBxlikFBnAszlZPSH87mKQd/hU9JoimTuDQmlTQFEyRjHoXHD8Z3
         k8Ob2+kvCVKcGOP4tw4TDexnqjIlZYM1q44d4uziXzPy/Ew5bGqxCiEL/p1ptO7H/C2u
         SbijJ52+9gHa5tG4mw3/X0Idm7cJODhusEUlofWwPgIJiW50o7s8j4kweLJcpHr1BbrY
         O5cRAesrVbQSBU4mM9qoNZxwPer+Ba6DQHWe6TlMQMcgWJzf/oC7zGgzvU8y+zv+ist2
         npug==
X-Gm-Message-State: AOJu0YxUJHnycEc6MxjFJMCwQp8tJEzokQnYXL93BNqkdKUIQkXuyFPK
	fNESnwdSm2STUm2YpkZdv7zHJXclLF2WbScWWkQdVrl8EPMqTJjkeyNr8jDEnn8=
X-Google-Smtp-Source: AGHT+IGTOXb5rtHZMNRQqWeGDXv0A8X4pPtz+djW3VoahcKBP6qfcZN/XX9pu2ifihI1r1oVSZnN4A==
X-Received: by 2002:a19:8c4d:0:b0:50e:9e97:ce6b with SMTP id i13-20020a198c4d000000b0050e9e97ce6bmr5217294lfj.42.1706629259898;
        Tue, 30 Jan 2024 07:40:59 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id b16-20020a056512071000b0050ecae41c51sm1481757lfs.135.2024.01.30.07.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 07:40:59 -0800 (PST)
Date: Tue, 30 Jan 2024 16:40:58 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: v4l: async: Fix completion of chained subnotifiers
Message-ID: <20240130154058.GC2544372@ragnatech.se>
References: <20240129195954.1110643-1-niklas.soderlund+renesas@ragnatech.se>
 <ZbjmDTvI0PiUWvL_@kekkonen.localdomain>
 <20240130134341.GA2544372@ragnatech.se>
 <ZbkVd79Yk5sYyql-@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZbkVd79Yk5sYyql-@kekkonen.localdomain>

Hi Sakari,

On 2024-01-30 15:27:51 +0000, Sakari Ailus wrote:
> Hej Niklas,
> 
> On Tue, Jan 30, 2024 at 02:43:41PM +0100, Niklas Söderlund wrote:
> > Hi Sakari,
> > 
> > Thanks for your feedback.
> > 
> > On 2024-01-30 12:05:33 +0000, Sakari Ailus wrote:
> > > Hi Niklas,
> > > 
> > > Thanks for the patch.
> > > 
> > > On Mon, Jan 29, 2024 at 08:59:54PM +0100, Niklas Söderlund wrote:
> > > > Allowing multiple connections between entities are very useful but the
> > > > addition of this feature did not considerate nested subnotifiers.
> > > > 
> > > > Consider the scenario,
> > > > 
> > > > rcar-vin.ko     rcar-isp.ko     rcar-csi2.ko    max96712.ko
> > > > 
> > > > video0 ---->    v4l-subdev0 ->  v4l-subdev1 ->  v4l-subdev2
> > > > video1 -´
> > > > 
> > > > Where each videoX or v4l-subdevX is controlled and register by a
> > > > separate instance of the driver listed above it. And each driver
> > > > instance registers a notifier (videoX) or a subnotifier (v4l-subdevX)
> > > > trying to bind to the device pointed to.
> > > > 
> > > > If the devices probe in any other except where the vidoeX ones are
> > > > probed last only one of them will have their complete callback called,
> > > > the one who last registered its notifier. Both of them will however have
> > > > their bind() callback called as expected.
> > > > 
> > > > This is due to v4l2_async_nf_try_complete() only walking the chain from
> > > > the subnotifier to one root notifier and completing it while ignoring
> > > > all other notifiers the subdevice might be part of. This works if there
> > > > are only one subnotifier in the mix. For example if either v4l-subdev0
> > > > or v4l-subdev1 was not part of the pipeline above.
> > > > 
> > > > This patch addresses the issue of nested subnotifiers by instead looking
> > > > at all notifiers and try to complete all the ones that contain the
> > > > subdevice which subnotifier was completed.
> > > 
> > > Why do you need this?
> > 
> > I need this for the use-case described as an example above. In a 
> > separate series [1] I remove the rcar-vin workaround for the earlier 
> > lack of multiple connections between entities in v4l-async and without a 
> > solution this patch tries to address this breaks on some boards that 
> > already use nested subnotifiers but for which the rcar-vin workaround 
> > addresses.
> > 
> > > This is also not a bug, the documentation for the complete callback says:
> > > 
> > >  * @complete:	All connections have been bound successfully. The complete
> > >  *		callback is only executed for the root notifier.
> > 
> > Yes, and here there are two root notifiers. One in the driver 
> > registering video0 and the one registering video1. Both notifiers wish 
> > to bind to v4l-subdev0. And both notifers have their bind callback 
> > called when v4l-subdev0 is registered, but only one have its complete 
> > callback called.
> 
> In this respect the current framework isn't perfect, it only allows one
> parent...

With this fix (or something like it) it works with multiple parents ;-) 
If it's not a bug and we drop the Fixes tag do you think this is a step 
in the right direction? Or shall I drop trying to solve my use-case with 
a solution in this area and focus on trying to work around this 
limitation in the driver?

> 
> > 
> > > 
> > > Rather it would be better to get rid of this callback entirely, one reason
> > > being the impossibility of error handling. We won't be there for quite some
> > > time but extending its scope does go to the other direction.
> > 
> > I agree this is the way to go. And I could do without it in my use-cases 
> > if I was allowed to register the video device at probe time instead of 
> > in the complete callback. I have brought this up over the years but 
> > always been told that the video device should be registered in the 
> > callback handler. If this is no longer true I can rework [1] and a fix 
> 
> Are you sure?
> 
> I guess there may be differing opinions on the matter but drivers such as
> ipu3-cio2 and omap3isp do it in probe. I don't think rcar-vin should be
> different in this respect.

Yes, I even tried to move it to probe [2] in 2017 to solve a different 
issue at the time. I have also discussed this in person at various 
conferences around that time. But 2017 was a long time ago and if you 
think it's now OK to register the video device at probe time I will do 
so work around my issue that way. But would be nice with a confirmation 
that this is OK before I move down that route.

2.  https://lore.kernel.org/linux-renesas-soc/20170524001540.13613-16-niklas.soderlund@ragnatech.se/

> 
> > like this wont be needed for my use-cases.
> > 
> > Looking beyond my use-case do you agree that as long as we do have the 
> > complete callback it needs to be supported for nested subnotifiers?
> > 
> > 1. [PATCH 0/6] media: rcar-vin: Make use of multiple connections in v4l-async
> > 
> > > 
> > > > 
> > > > Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-async.c | 68 ++++++++++++++++++++--------
> > > >  1 file changed, 49 insertions(+), 19 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > index 3ec323bd528b..8b603527923c 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > @@ -176,15 +176,16 @@ static LIST_HEAD(notifier_list);
> > > >  static DEFINE_MUTEX(list_lock);
> > > >  
> > > >  static struct v4l2_async_connection *
> > > > -v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > > > -		      struct v4l2_subdev *sd)
> > > > +__v4l2_async_find_in_list(struct v4l2_async_notifier *notifier,
> > > > +			  struct v4l2_subdev *sd,
> > > > +			  struct list_head *list)
> > > >  {
> > > >  	bool (*match)(struct v4l2_async_notifier *notifier,
> > > >  		      struct v4l2_subdev *sd,
> > > >  		      struct v4l2_async_match_desc *match);
> > > >  	struct v4l2_async_connection *asc;
> > > >  
> > > > -	list_for_each_entry(asc, &notifier->waiting_list, asc_entry) {
> > > > +	list_for_each_entry(asc, list, asc_entry) {
> > > >  		/* bus_type has been verified valid before */
> > > >  		switch (asc->match.type) {
> > > >  		case V4L2_ASYNC_MATCH_TYPE_I2C:
> > > > @@ -207,6 +208,20 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > > >  	return NULL;
> > > >  }
> > > >  
> > > > +static struct v4l2_async_connection *
> > > > +v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > > > +		      struct v4l2_subdev *sd)
> > > > +{
> > > > +	return __v4l2_async_find_in_list(notifier, sd, &notifier->waiting_list);
> > > > +}
> > > > +
> > > > +static struct v4l2_async_connection *
> > > > +v4l2_async_find_done(struct v4l2_async_notifier *notifier,
> > > > +		     struct v4l2_subdev *sd)
> > > > +{
> > > > +	return __v4l2_async_find_in_list(notifier, sd, &notifier->done_list);
> > > > +}
> > > > +
> > > >  /* Compare two async match descriptors for equivalence */
> > > >  static bool v4l2_async_match_equal(struct v4l2_async_match_desc *match1,
> > > >  				   struct v4l2_async_match_desc *match2)
> > > > @@ -274,13 +289,14 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
> > > >  }
> > > >  
> > > >  /*
> > > > - * Complete the master notifier if possible. This is done when all async
> > > > + * Complete the master notifiers if possible. This is done when all async
> > > >   * sub-devices have been bound; v4l2_device is also available then.
> > > >   */
> > > >  static int
> > > >  v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> > > >  {
> > > > -	struct v4l2_async_notifier *__notifier = notifier;
> > > > +	struct v4l2_async_notifier *n;
> > > > +	int ret;
> > > >  
> > > >  	/* Quick check whether there are still more sub-devices here. */
> > > >  	if (!list_empty(&notifier->waiting_list))
> > > > @@ -290,24 +306,38 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> > > >  		dev_dbg(notifier_dev(notifier),
> > > >  			"v4l2-async: trying to complete\n");
> > > >  
> > > > -	/* Check the entire notifier tree; find the root notifier first. */
> > > > -	while (notifier->parent)
> > > > -		notifier = notifier->parent;
> > > > +	/*
> > > > +	 * Notifiers without a parent are either a subnotifier that have not
> > > > +	 * yet been associated with it is a root notifier or a root notifier
> > > > +	 * itself. If it is a root notifier try to complete it.
> > > > +	 */
> > > > +	if (!notifier->parent) {
> > > > +		/* This is root if it has v4l2_dev. */
> > > > +		if (!notifier->v4l2_dev) {
> > > > +			dev_dbg(notifier_dev(notifier),
> > > > +				"v4l2-async: V4L2 device not available\n");
> > > > +			return 0;
> > > > +		}
> > > >  
> > > > -	/* This is root if it has v4l2_dev. */
> > > > -	if (!notifier->v4l2_dev) {
> > > > -		dev_dbg(notifier_dev(__notifier),
> > > > -			"v4l2-async: V4L2 device not available\n");
> > > > -		return 0;
> > > > -	}
> > > > +		/* Is everything ready? */
> > > > +		if (!v4l2_async_nf_can_complete(notifier))
> > > > +			return 0;
> > > > +
> > > > +		dev_dbg(notifier_dev(notifier), "v4l2-async: complete\n");
> > > >  
> > > > -	/* Is everything ready? */
> > > > -	if (!v4l2_async_nf_can_complete(notifier))
> > > > -		return 0;
> > > > +		return v4l2_async_nf_call_complete(notifier);
> > > > +	}
> > > >  
> > > > -	dev_dbg(notifier_dev(__notifier), "v4l2-async: complete\n");
> > > > +	/* Try to complete all notifiers containing the subdevices. */
> > > > +	list_for_each_entry(n, &notifier_list, notifier_entry) {
> > > > +		if (v4l2_async_find_done(n, notifier->sd)) {
> > > > +			ret = v4l2_async_nf_try_complete(n);
> > > > +			if (ret)
> > > > +				return ret;
> > > > +		}
> > > > +	}
> > > >  
> > > > -	return v4l2_async_nf_call_complete(notifier);
> > > > +	return 0;
> > > >  }
> > > >  
> > > >  static int
> > > 
> 
> -- 
> Hälsningar,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund


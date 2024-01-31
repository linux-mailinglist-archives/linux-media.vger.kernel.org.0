Return-Path: <linux-media+bounces-4504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A58BD843CFB
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 11:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B5A11F31ED4
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 10:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BD169DE3;
	Wed, 31 Jan 2024 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="T8fVf82U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF08469E04
	for <linux-media@vger.kernel.org>; Wed, 31 Jan 2024 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706697654; cv=none; b=jEFGMQ8V9rIK9WX5h8OF1REO84uTh14g5gsrquLHjUvtmDuDWK/Tz/n4SUer02CQA1vMkToH2i3mTgOy5UsjlD4QlywjzaKuQhvGd17YrmYoD2f8XU54pium8i+PCNB/A7O+hS0LVTRjVH7xBSZhHBw+KYNIjGh7+FNNCFZQ6j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706697654; c=relaxed/simple;
	bh=qBpyKHrtbLsCa0eRVOfqoUoM25QSQkzcz8sodbv1diU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKxLUJEaEaIKvo+cS2FY7f3F9pETTRTMGVu4fjEDQtamoMv2P4Lc3nq/0Rps7wRF9C0x3jnJHbV4Njksh0dsGCEHPWxXJ+Z71dRoDMKGWR7SQvXWCuZJUa0O2/IKzCMP/0TZUV+aaXa6Ar9JvXYjOfrfC6es9zTscCHOj1HQmI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=T8fVf82U; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cf591d22dfso41485651fa.0
        for <linux-media@vger.kernel.org>; Wed, 31 Jan 2024 02:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706697647; x=1707302447; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/aQzwe6IjmlAVSxAedFCcRK1iDCxc+WGQscuoEd7LwQ=;
        b=T8fVf82UCXg6CXNwBcvULa2cMp+RdprpzXHGdlbfVb7o6i9ND17lGcWc9rvtqXTuIY
         YBFdY9odATr19hmfAlSqa7tQxbE46UUn+6cgxRJuG+rt4xUF/phiVu5p9zJzFkq2yOyN
         9taeqAKFjE/Qgo6fqd+dhTP5r9bMBIroNNavXyYecywGMnjxy/QSAogNLY6bAJaLqEXh
         gcecY4vf7CgseA4NNlJUSQ89vtI/caroc4T+0ZRP6tl55Whw1PSZCGu9LCPOqmKJuW5W
         Z+xW39t4bm9N+21aWIQPfZPa0KgabWcZXFysOSXcjUkYuiRHLLIheAE9YEgdW4E7DYnt
         eMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706697647; x=1707302447;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/aQzwe6IjmlAVSxAedFCcRK1iDCxc+WGQscuoEd7LwQ=;
        b=BlSSOtGtz2BRjKiIWyLfnjVKhDL0o2lS3Ob4/IngOveLBumD2aez29KL+iCzAAH6u9
         pt6FzuzfLA6a+O43/h4Ba8LIvpoNtbuL6zmU5clN5LcrLFvHxJLz7CU7zUW+utybYuoZ
         /WuCMmoeeCmMEDw+Xvatbiz8d7AnSDc9qr3ZBwGZEnu55FClUkIiuE8I9MttjQNMVnQn
         UvyJyiD6KPUy5j0Xkob2RDxax2bxMdAiALkqDmFsaOznkLLo6P1L0qtOAowU3AdccPnT
         3vRMyRESV7U+6F5hgvJWadBvLl0dkKVS48ILtAyuuPbQTvRUAwVWA9ACSJN4YgDM1nPS
         qquA==
X-Gm-Message-State: AOJu0Yw7If9BZVVB2EZwOHAcban7lhoU5BzDnxIrF9ojr/RKp4kGWWyu
	lXW2n3ov8QMSpNxGZLwDGAaEqtxmNbXbdzQnVB9Qy8r+FKf1FJYEnlo5wDPhb2Q=
X-Google-Smtp-Source: AGHT+IFGp+ZuQl5nCmJByhLalerKP8M2/13P2c844XTl7Tvg6O/yDGnJAqTwXdKu4uoeVDjxK5B4bA==
X-Received: by 2002:a2e:8553:0:b0:2cf:3324:cedd with SMTP id u19-20020a2e8553000000b002cf3324ceddmr962685ljj.24.1706697646788;
        Wed, 31 Jan 2024 02:40:46 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id i6-20020a2ea366000000b002cf47595e13sm1916749ljn.120.2024.01.31.02.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:40:46 -0800 (PST)
Date: Wed, 31 Jan 2024 11:40:45 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: v4l: async: Fix completion of chained subnotifiers
Message-ID: <20240131104045.GD2544372@ragnatech.se>
References: <20240129195954.1110643-1-niklas.soderlund+renesas@ragnatech.se>
 <ZbjmDTvI0PiUWvL_@kekkonen.localdomain>
 <20240130134341.GA2544372@ragnatech.se>
 <ZbkVd79Yk5sYyql-@kekkonen.localdomain>
 <20240130154058.GC2544372@ragnatech.se>
 <ZboC-S8P6en7ifTv@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZboC-S8P6en7ifTv@kekkonen.localdomain>

Hej Sakari,

On 2024-01-31 08:21:13 +0000, Sakari Ailus wrote:
> Hejssan Niklas,
> 
> On Tue, Jan 30, 2024 at 04:40:58PM +0100, Niklas Söderlund wrote:
> > Hi Sakari,
> > 
> > On 2024-01-30 15:27:51 +0000, Sakari Ailus wrote:
> > > Hej Niklas,
> > > 
> > > On Tue, Jan 30, 2024 at 02:43:41PM +0100, Niklas Söderlund wrote:
> > > > Hi Sakari,
> > > > 
> > > > Thanks for your feedback.
> > > > 
> > > > On 2024-01-30 12:05:33 +0000, Sakari Ailus wrote:
> > > > > Hi Niklas,
> > > > > 
> > > > > Thanks for the patch.
> > > > > 
> > > > > On Mon, Jan 29, 2024 at 08:59:54PM +0100, Niklas Söderlund wrote:
> > > > > > Allowing multiple connections between entities are very useful but the
> > > > > > addition of this feature did not considerate nested subnotifiers.
> > > > > > 
> > > > > > Consider the scenario,
> > > > > > 
> > > > > > rcar-vin.ko     rcar-isp.ko     rcar-csi2.ko    max96712.ko
> > > > > > 
> > > > > > video0 ---->    v4l-subdev0 ->  v4l-subdev1 ->  v4l-subdev2
> > > > > > video1 -´
> > > > > > 
> > > > > > Where each videoX or v4l-subdevX is controlled and register by a
> > > > > > separate instance of the driver listed above it. And each driver
> > > > > > instance registers a notifier (videoX) or a subnotifier (v4l-subdevX)
> > > > > > trying to bind to the device pointed to.
> > > > > > 
> > > > > > If the devices probe in any other except where the vidoeX ones are
> > > > > > probed last only one of them will have their complete callback called,
> > > > > > the one who last registered its notifier. Both of them will however have
> > > > > > their bind() callback called as expected.
> > > > > > 
> > > > > > This is due to v4l2_async_nf_try_complete() only walking the chain from
> > > > > > the subnotifier to one root notifier and completing it while ignoring
> > > > > > all other notifiers the subdevice might be part of. This works if there
> > > > > > are only one subnotifier in the mix. For example if either v4l-subdev0
> > > > > > or v4l-subdev1 was not part of the pipeline above.
> > > > > > 
> > > > > > This patch addresses the issue of nested subnotifiers by instead looking
> > > > > > at all notifiers and try to complete all the ones that contain the
> > > > > > subdevice which subnotifier was completed.
> > > > > 
> > > > > Why do you need this?
> > > > 
> > > > I need this for the use-case described as an example above. In a 
> > > > separate series [1] I remove the rcar-vin workaround for the earlier 
> > > > lack of multiple connections between entities in v4l-async and without a 
> > > > solution this patch tries to address this breaks on some boards that 
> > > > already use nested subnotifiers but for which the rcar-vin workaround 
> > > > addresses.
> > > > 
> > > > > This is also not a bug, the documentation for the complete callback says:
> > > > > 
> > > > >  * @complete:	All connections have been bound successfully. The complete
> > > > >  *		callback is only executed for the root notifier.
> > > > 
> > > > Yes, and here there are two root notifiers. One in the driver 
> > > > registering video0 and the one registering video1. Both notifiers wish 
> > > > to bind to v4l-subdev0. And both notifers have their bind callback 
> > > > called when v4l-subdev0 is registered, but only one have its complete 
> > > > callback called.
> > > 
> > > In this respect the current framework isn't perfect, it only allows one
> > > parent...
> > 
> > With this fix (or something like it) it works with multiple parents ;-) 
> > If it's not a bug and we drop the Fixes tag do you think this is a step 
> > in the right direction? Or shall I drop trying to solve my use-case with 
> > a solution in this area and focus on trying to work around this 
> > limitation in the driver?
> 
> I'll review the patch properly later today.

Thanks!

> 
> > 
> > > 
> > > > 
> > > > > 
> > > > > Rather it would be better to get rid of this callback entirely, one reason
> > > > > being the impossibility of error handling. We won't be there for quite some
> > > > > time but extending its scope does go to the other direction.
> > > > 
> > > > I agree this is the way to go. And I could do without it in my use-cases 
> > > > if I was allowed to register the video device at probe time instead of 
> > > > in the complete callback. I have brought this up over the years but 
> > > > always been told that the video device should be registered in the 
> > > > callback handler. If this is no longer true I can rework [1] and a fix 
> > > 
> > > Are you sure?
> > > 
> > > I guess there may be differing opinions on the matter but drivers such as
> > > ipu3-cio2 and omap3isp do it in probe. I don't think rcar-vin should be
> > > different in this respect.
> > 
> > Yes, I even tried to move it to probe [2] in 2017 to solve a different 
> > issue at the time. I have also discussed this in person at various 
> > conferences around that time. But 2017 was a long time ago and if you 
> > think it's now OK to register the video device at probe time I will do 
> > so work around my issue that way. But would be nice with a confirmation 
> > that this is OK before I move down that route.
> 
> Two other drivers are already doing it, I don't see why rcar-vin shouldn't.
> I'm sure there are others as I checked only two. :-)

Super! I will move in this direction then as I think it makes more sens 
to register them in probe and is step in the right direction. I will 
wait for your review feedback on this patch to see if will make the move 
before or after the change that spoored this patch.

> 
> > 
> > 2.  https://lore.kernel.org/linux-renesas-soc/20170524001540.13613-16-niklas.soderlund@ragnatech.se/
> 
> Why is control handler initialisation left to the complete handler?

Good question, not sure why 2017 version of me thought that was a good 
idea. Today's version of me knows better and will not try something like 
that.

> 
> > 
> > > 
> > > > like this wont be needed for my use-cases.
> > > > 
> > > > Looking beyond my use-case do you agree that as long as we do have the 
> > > > complete callback it needs to be supported for nested subnotifiers?
> > > > 
> > > > 1. [PATCH 0/6] media: rcar-vin: Make use of multiple connections in v4l-async
> > > > 
> > > > > 
> > > > > > 
> > > > > > Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
> > > > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > > > ---
> > > > > >  drivers/media/v4l2-core/v4l2-async.c | 68 ++++++++++++++++++++--------
> > > > > >  1 file changed, 49 insertions(+), 19 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > > > index 3ec323bd528b..8b603527923c 100644
> > > > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > > > @@ -176,15 +176,16 @@ static LIST_HEAD(notifier_list);
> > > > > >  static DEFINE_MUTEX(list_lock);
> > > > > >  
> > > > > >  static struct v4l2_async_connection *
> > > > > > -v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > > > > > -		      struct v4l2_subdev *sd)
> > > > > > +__v4l2_async_find_in_list(struct v4l2_async_notifier *notifier,
> > > > > > +			  struct v4l2_subdev *sd,
> > > > > > +			  struct list_head *list)
> > > > > >  {
> > > > > >  	bool (*match)(struct v4l2_async_notifier *notifier,
> > > > > >  		      struct v4l2_subdev *sd,
> > > > > >  		      struct v4l2_async_match_desc *match);
> > > > > >  	struct v4l2_async_connection *asc;
> > > > > >  
> > > > > > -	list_for_each_entry(asc, &notifier->waiting_list, asc_entry) {
> > > > > > +	list_for_each_entry(asc, list, asc_entry) {
> > > > > >  		/* bus_type has been verified valid before */
> > > > > >  		switch (asc->match.type) {
> > > > > >  		case V4L2_ASYNC_MATCH_TYPE_I2C:
> > > > > > @@ -207,6 +208,20 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > > > > >  	return NULL;
> > > > > >  }
> > > > > >  
> > > > > > +static struct v4l2_async_connection *
> > > > > > +v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > > > > > +		      struct v4l2_subdev *sd)
> > > > > > +{
> > > > > > +	return __v4l2_async_find_in_list(notifier, sd, &notifier->waiting_list);
> > > > > > +}
> > > > > > +
> > > > > > +static struct v4l2_async_connection *
> > > > > > +v4l2_async_find_done(struct v4l2_async_notifier *notifier,
> > > > > > +		     struct v4l2_subdev *sd)
> > > > > > +{
> > > > > > +	return __v4l2_async_find_in_list(notifier, sd, &notifier->done_list);
> > > > > > +}
> > > > > > +
> > > > > >  /* Compare two async match descriptors for equivalence */
> > > > > >  static bool v4l2_async_match_equal(struct v4l2_async_match_desc *match1,
> > > > > >  				   struct v4l2_async_match_desc *match2)
> > > > > > @@ -274,13 +289,14 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
> > > > > >  }
> > > > > >  
> > > > > >  /*
> > > > > > - * Complete the master notifier if possible. This is done when all async
> > > > > > + * Complete the master notifiers if possible. This is done when all async
> > > > > >   * sub-devices have been bound; v4l2_device is also available then.
> > > > > >   */
> > > > > >  static int
> > > > > >  v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> > > > > >  {
> > > > > > -	struct v4l2_async_notifier *__notifier = notifier;
> > > > > > +	struct v4l2_async_notifier *n;
> > > > > > +	int ret;
> > > > > >  
> > > > > >  	/* Quick check whether there are still more sub-devices here. */
> > > > > >  	if (!list_empty(&notifier->waiting_list))
> > > > > > @@ -290,24 +306,38 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> > > > > >  		dev_dbg(notifier_dev(notifier),
> > > > > >  			"v4l2-async: trying to complete\n");
> > > > > >  
> > > > > > -	/* Check the entire notifier tree; find the root notifier first. */
> > > > > > -	while (notifier->parent)
> > > > > > -		notifier = notifier->parent;
> > > > > > +	/*
> > > > > > +	 * Notifiers without a parent are either a subnotifier that have not
> > > > > > +	 * yet been associated with it is a root notifier or a root notifier
> > > > > > +	 * itself. If it is a root notifier try to complete it.
> > > > > > +	 */
> > > > > > +	if (!notifier->parent) {
> > > > > > +		/* This is root if it has v4l2_dev. */
> > > > > > +		if (!notifier->v4l2_dev) {
> > > > > > +			dev_dbg(notifier_dev(notifier),
> > > > > > +				"v4l2-async: V4L2 device not available\n");
> > > > > > +			return 0;
> > > > > > +		}
> > > > > >  
> > > > > > -	/* This is root if it has v4l2_dev. */
> > > > > > -	if (!notifier->v4l2_dev) {
> > > > > > -		dev_dbg(notifier_dev(__notifier),
> > > > > > -			"v4l2-async: V4L2 device not available\n");
> > > > > > -		return 0;
> > > > > > -	}
> > > > > > +		/* Is everything ready? */
> > > > > > +		if (!v4l2_async_nf_can_complete(notifier))
> > > > > > +			return 0;
> > > > > > +
> > > > > > +		dev_dbg(notifier_dev(notifier), "v4l2-async: complete\n");
> > > > > >  
> > > > > > -	/* Is everything ready? */
> > > > > > -	if (!v4l2_async_nf_can_complete(notifier))
> > > > > > -		return 0;
> > > > > > +		return v4l2_async_nf_call_complete(notifier);
> > > > > > +	}
> > > > > >  
> > > > > > -	dev_dbg(notifier_dev(__notifier), "v4l2-async: complete\n");
> > > > > > +	/* Try to complete all notifiers containing the subdevices. */
> > > > > > +	list_for_each_entry(n, &notifier_list, notifier_entry) {
> > > > > > +		if (v4l2_async_find_done(n, notifier->sd)) {
> > > > > > +			ret = v4l2_async_nf_try_complete(n);
> > > > > > +			if (ret)
> > > > > > +				return ret;
> > > > > > +		}
> > > > > > +	}
> > > > > >  
> > > > > > -	return v4l2_async_nf_call_complete(notifier);
> > > > > > +	return 0;
> > > > > >  }
> > > > > >  
> > > > > >  static int
> > > > > 
> > > 
> > > -- 
> > > Hälsningar,
> > > 
> > > Sakari Ailus
> > 
> > -- 
> > Kind Regards,
> > Niklas Söderlund
> 
> -- 
> Hälsningar,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund


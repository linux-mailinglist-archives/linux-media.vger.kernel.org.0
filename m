Return-Path: <linux-media+bounces-4425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FC9842659
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 14:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDA851C2404E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 13:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7667F55E54;
	Tue, 30 Jan 2024 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="IsDHX68a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213486BB3D
	for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706622228; cv=none; b=B5taiFobFiBKqyK1s8+v/nnGggAs+k75b4mCwPPYuRAez0GmibqkawMpVKHCgIf3LcKID/LoRyMpZqRzMMxXJKUeY9FoEYZnNlX1K2MHPJ8+QDM/PckW9kil9eggxnEGocd5UeBd9Uw0j00xFD+RJMbT5tEd4Fo1umyBCZBP9P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706622228; c=relaxed/simple;
	bh=MoSpG4re3ktOhQao+n5tr5WsUl7GCnccs3OdmfQIERk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FITVP97X/adq3F6Rfp5aykPUERgRnGL8oaV7s6Lf4TgvLs83DiEmayn34NwTs3obexDJcGnh+ZSCsB1SL4JREN75+rSq0XF6geMSIViaLiIT2UEGDp/70DYiCAaqmAXsiZfOVAZX8E4yzXylj7C7zcEgEMaW16+30HMg6IQZY4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=IsDHX68a; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5101cd91017so4344355e87.2
        for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 05:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706622223; x=1707227023; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=USv8I8ahQr/JXL+jbn8ZZ1+UEAaM/N340lwscH/0EGY=;
        b=IsDHX68a2uJj1Pk7mk8lT8A43pvE1qSh6j30SOlbmH4e8eLS5r0gCRyFGc9Xqieno+
         rKH5hylkgPQG5tCqlJC88eofGxGvtkylTEKsD+4d+S2iFPcLBoxzHNCGXtaiEB/Zo6eY
         fUdA3634EZeS1oXOyPw3f8f+2X9y+2DU/p2VnmMm+JB5LkP2u5Td0blmnnwMVNnzJGT+
         Rk9huT5Hnj52OUguyIMuMRlRRwYyiLwSx0sLBUfoAkzcslEXjXLBS0mmjAUiBBcnrzim
         X/tn+K1mDkxAQX2mX1hmGNxEW92Hfx7kvA/1d4CRWmNhy8dHRvKKTKGqvdcFclBak1cb
         zYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706622223; x=1707227023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=USv8I8ahQr/JXL+jbn8ZZ1+UEAaM/N340lwscH/0EGY=;
        b=sGd4r62n9+1rktzuMu7n0Ztf8QG4A0na3mZU5wqaK/bFosukNhdsF4Eo0U/kDOXtAE
         J8iN1+XRdBWFESGgXsEnko7/UMYTTL/9dLaceXB3e1s7B8Z2BrPaFALO7vyp+FJKKxni
         5XSwyjFhWyexaU5IxMK24Jt91rwnwMLix391aLeAavxd/uhhtGIH2GA57iF9MnmCeZ0y
         PwBnbi3YK6UXLpikIx32sID58Xkd+o6uwWHxMqtLUe0a6kXH5MDwvq+yEWxXUYssRyv2
         DC4SthEoYMlXG/1XE5QpTeXPW9hJR7/fKXcGBdg0GCvg2SZSAVQGamoIzSC4N2M+UuKr
         0cDg==
X-Gm-Message-State: AOJu0Yy3v6SwSBccarQ/kts5P01UgR/unLsHjr5lZjbqDZSgHO09hZhP
	6/Yob76dF+71rYsfOcVhM3DNG0ojkJOT/x2YiktX9LFwHqM68dp2bdQT1sV1lkE=
X-Google-Smtp-Source: AGHT+IHIdbKwTyJfhMZF7vcUfDChukrD+mtUvQ7q5qkVPi4tUqbzw3Vtb4qQC7DD3AcQOLizN40Yfg==
X-Received: by 2002:a05:6512:74c:b0:511:18e4:df90 with SMTP id c12-20020a056512074c00b0051118e4df90mr1442747lfs.1.1706622222733;
        Tue, 30 Jan 2024 05:43:42 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id s15-20020a19770f000000b005102473541asm1484517lfc.301.2024.01.30.05.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 05:43:41 -0800 (PST)
Date: Tue, 30 Jan 2024 14:43:41 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: v4l: async: Fix completion of chained subnotifiers
Message-ID: <20240130134341.GA2544372@ragnatech.se>
References: <20240129195954.1110643-1-niklas.soderlund+renesas@ragnatech.se>
 <ZbjmDTvI0PiUWvL_@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZbjmDTvI0PiUWvL_@kekkonen.localdomain>

Hi Sakari,

Thanks for your feedback.

On 2024-01-30 12:05:33 +0000, Sakari Ailus wrote:
> Hi Niklas,
> 
> Thanks for the patch.
> 
> On Mon, Jan 29, 2024 at 08:59:54PM +0100, Niklas Söderlund wrote:
> > Allowing multiple connections between entities are very useful but the
> > addition of this feature did not considerate nested subnotifiers.
> > 
> > Consider the scenario,
> > 
> > rcar-vin.ko     rcar-isp.ko     rcar-csi2.ko    max96712.ko
> > 
> > video0 ---->    v4l-subdev0 ->  v4l-subdev1 ->  v4l-subdev2
> > video1 -´
> > 
> > Where each videoX or v4l-subdevX is controlled and register by a
> > separate instance of the driver listed above it. And each driver
> > instance registers a notifier (videoX) or a subnotifier (v4l-subdevX)
> > trying to bind to the device pointed to.
> > 
> > If the devices probe in any other except where the vidoeX ones are
> > probed last only one of them will have their complete callback called,
> > the one who last registered its notifier. Both of them will however have
> > their bind() callback called as expected.
> > 
> > This is due to v4l2_async_nf_try_complete() only walking the chain from
> > the subnotifier to one root notifier and completing it while ignoring
> > all other notifiers the subdevice might be part of. This works if there
> > are only one subnotifier in the mix. For example if either v4l-subdev0
> > or v4l-subdev1 was not part of the pipeline above.
> > 
> > This patch addresses the issue of nested subnotifiers by instead looking
> > at all notifiers and try to complete all the ones that contain the
> > subdevice which subnotifier was completed.
> 
> Why do you need this?

I need this for the use-case described as an example above. In a 
separate series [1] I remove the rcar-vin workaround for the earlier 
lack of multiple connections between entities in v4l-async and without a 
solution this patch tries to address this breaks on some boards that 
already use nested subnotifiers but for which the rcar-vin workaround 
addresses.

> This is also not a bug, the documentation for the complete callback says:
> 
>  * @complete:	All connections have been bound successfully. The complete
>  *		callback is only executed for the root notifier.

Yes, and here there are two root notifiers. One in the driver 
registering video0 and the one registering video1. Both notifiers wish 
to bind to v4l-subdev0. And both notifers have their bind callback 
called when v4l-subdev0 is registered, but only one have its complete 
callback called.

> 
> Rather it would be better to get rid of this callback entirely, one reason
> being the impossibility of error handling. We won't be there for quite some
> time but extending its scope does go to the other direction.

I agree this is the way to go. And I could do without it in my use-cases 
if I was allowed to register the video device at probe time instead of 
in the complete callback. I have brought this up over the years but 
always been told that the video device should be registered in the 
callback handler. If this is no longer true I can rework [1] and a fix 
like this wont be needed for my use-cases.

Looking beyond my use-case do you agree that as long as we do have the 
complete callback it needs to be supported for nested subnotifiers?

1. [PATCH 0/6] media: rcar-vin: Make use of multiple connections in v4l-async

> 
> > 
> > Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 68 ++++++++++++++++++++--------
> >  1 file changed, 49 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 3ec323bd528b..8b603527923c 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -176,15 +176,16 @@ static LIST_HEAD(notifier_list);
> >  static DEFINE_MUTEX(list_lock);
> >  
> >  static struct v4l2_async_connection *
> > -v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > -		      struct v4l2_subdev *sd)
> > +__v4l2_async_find_in_list(struct v4l2_async_notifier *notifier,
> > +			  struct v4l2_subdev *sd,
> > +			  struct list_head *list)
> >  {
> >  	bool (*match)(struct v4l2_async_notifier *notifier,
> >  		      struct v4l2_subdev *sd,
> >  		      struct v4l2_async_match_desc *match);
> >  	struct v4l2_async_connection *asc;
> >  
> > -	list_for_each_entry(asc, &notifier->waiting_list, asc_entry) {
> > +	list_for_each_entry(asc, list, asc_entry) {
> >  		/* bus_type has been verified valid before */
> >  		switch (asc->match.type) {
> >  		case V4L2_ASYNC_MATCH_TYPE_I2C:
> > @@ -207,6 +208,20 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> >  	return NULL;
> >  }
> >  
> > +static struct v4l2_async_connection *
> > +v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> > +		      struct v4l2_subdev *sd)
> > +{
> > +	return __v4l2_async_find_in_list(notifier, sd, &notifier->waiting_list);
> > +}
> > +
> > +static struct v4l2_async_connection *
> > +v4l2_async_find_done(struct v4l2_async_notifier *notifier,
> > +		     struct v4l2_subdev *sd)
> > +{
> > +	return __v4l2_async_find_in_list(notifier, sd, &notifier->done_list);
> > +}
> > +
> >  /* Compare two async match descriptors for equivalence */
> >  static bool v4l2_async_match_equal(struct v4l2_async_match_desc *match1,
> >  				   struct v4l2_async_match_desc *match2)
> > @@ -274,13 +289,14 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
> >  }
> >  
> >  /*
> > - * Complete the master notifier if possible. This is done when all async
> > + * Complete the master notifiers if possible. This is done when all async
> >   * sub-devices have been bound; v4l2_device is also available then.
> >   */
> >  static int
> >  v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> >  {
> > -	struct v4l2_async_notifier *__notifier = notifier;
> > +	struct v4l2_async_notifier *n;
> > +	int ret;
> >  
> >  	/* Quick check whether there are still more sub-devices here. */
> >  	if (!list_empty(&notifier->waiting_list))
> > @@ -290,24 +306,38 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> >  		dev_dbg(notifier_dev(notifier),
> >  			"v4l2-async: trying to complete\n");
> >  
> > -	/* Check the entire notifier tree; find the root notifier first. */
> > -	while (notifier->parent)
> > -		notifier = notifier->parent;
> > +	/*
> > +	 * Notifiers without a parent are either a subnotifier that have not
> > +	 * yet been associated with it is a root notifier or a root notifier
> > +	 * itself. If it is a root notifier try to complete it.
> > +	 */
> > +	if (!notifier->parent) {
> > +		/* This is root if it has v4l2_dev. */
> > +		if (!notifier->v4l2_dev) {
> > +			dev_dbg(notifier_dev(notifier),
> > +				"v4l2-async: V4L2 device not available\n");
> > +			return 0;
> > +		}
> >  
> > -	/* This is root if it has v4l2_dev. */
> > -	if (!notifier->v4l2_dev) {
> > -		dev_dbg(notifier_dev(__notifier),
> > -			"v4l2-async: V4L2 device not available\n");
> > -		return 0;
> > -	}
> > +		/* Is everything ready? */
> > +		if (!v4l2_async_nf_can_complete(notifier))
> > +			return 0;
> > +
> > +		dev_dbg(notifier_dev(notifier), "v4l2-async: complete\n");
> >  
> > -	/* Is everything ready? */
> > -	if (!v4l2_async_nf_can_complete(notifier))
> > -		return 0;
> > +		return v4l2_async_nf_call_complete(notifier);
> > +	}
> >  
> > -	dev_dbg(notifier_dev(__notifier), "v4l2-async: complete\n");
> > +	/* Try to complete all notifiers containing the subdevices. */
> > +	list_for_each_entry(n, &notifier_list, notifier_entry) {
> > +		if (v4l2_async_find_done(n, notifier->sd)) {
> > +			ret = v4l2_async_nf_try_complete(n);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +	}
> >  
> > -	return v4l2_async_nf_call_complete(notifier);
> > +	return 0;
> >  }
> >  
> >  static int
> 
> -- 
> Regards,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund


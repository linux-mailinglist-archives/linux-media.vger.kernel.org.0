Return-Path: <linux-media+bounces-34256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB6CAD03C3
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 16:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 988E11743AF
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84CB288CBA;
	Fri,  6 Jun 2025 14:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="C4PqVvUL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="efiCPr3S"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B306171C9;
	Fri,  6 Jun 2025 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749218979; cv=none; b=U7YI450ofXou0HoHrFi0MV6EN+4CHlcuTw83j06et6Htl2JOE7VOMCHz4xczLozeOgVIr+nX6glF3QWrFaKrvY4rVGRF90scowMN6CSS62T60/LDIqjqAvj7GfVgj3eNoXh9OvrAnsy8SLgkrJy34KeGvNFkasZYomxvtgA8h4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749218979; c=relaxed/simple;
	bh=OZXr4BCbkbWRncS2h2jXyU1YvQCT+Kc5sWm/Ff+9ojc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+LIET178OComLItIUn54BSN5UNf9WAvmWLEnNx9fmI+2SN2JRzqdieop+0lDM6xeanO+YYHBDHj/G96MxXDB34isptnfWMUhWZCoqPaLAAmDNLGWX6hUiyyD0X7drv/BpcLJAarQJvvP213/M+vr7jNlCrGpDiAB31kpQ/DAXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=C4PqVvUL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=efiCPr3S; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 302121380377;
	Fri,  6 Jun 2025 10:09:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 06 Jun 2025 10:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749218975;
	 x=1749305375; bh=cLTvHi1X5KzIyHSluaoxe9aAKVKVAHkQa3z5s2lWCqk=; b=
	C4PqVvULJRz/W0LghulEIF0KojDADzuumEy3OyXVsuIxdE77yBQs3Zs+UCbqGpgZ
	vuq3y1yMtDjfdNgEUDykUirJpO9PL+eukcFAz0lwKv/O4J4fk9uF3iAWMNvh8YeC
	CawkklORVK1ejvky+lAn3maj2a3aRhOD+y+4JvjjQVziClPzVveWt/OvfQfKtFrf
	cI4q4C0MThIR5lGZAgRwtodkldJRfqoWTW0WrfqjuKKSdxDHNTa06Ns8Ga627m4s
	LlQmJhkxtavUTwjvYSoY3OedhyLq+9BSIadEVSTkOi72h7m1Icq6WjJW678DydjJ
	Iliv4RfyCjhQe1XvXDkHuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749218975; x=
	1749305375; bh=cLTvHi1X5KzIyHSluaoxe9aAKVKVAHkQa3z5s2lWCqk=; b=e
	fiCPr3SiWj6e5LEcBFma59HRqeSmavtYspaOBC3Gw1HgJIO5vcBm+1ScICNFdB2L
	lHKhSUf6EDpNFJI51b9w2mSfc/AsQYY9DgA4fejcVKAmr8CHPZ7MZOrwWMzISf13
	lgqEMABNcOPjCoFnYmdQd3xNViSezuSW5g/f1q+uSxZ+k8NuPCBKENFIM6nUFzti
	yaAinypfyIQxW4aN067adNrb/3UDZl+Fixy9zG5D+88xkf78KScPZZJKSDW7IUrL
	SFFfROf+1XIIe5RaM7KNJxAs4RgdPupbGO+NXC/8cN2IocQZaWkyYLDLmDnJo43M
	r3/E9h9SVZxr9Qih7WegQ==
X-ME-Sender: <xms:nvZCaAt9elDn7_cFPu9P-Zc0JOntVY6RHJybyz1qdu0DipS-TSYt0A>
    <xme:nvZCaNc7mWi1zEojgmsqwEipAv8fr5ZGCOVNXgjJKeZHzJb25qiXkN1t6piUIy-Rj
    j4PpsCzeuNVdvhsUkA>
X-ME-Received: <xmr:nvZCaLz8lcg1U523qX7Eo9W1UqikPIcF_AwrMY2NsgYXmguZIp2nqIV4nt_VIYf6Yq2sdRKfLYbwU_7VwPhsWOq3jxEh8PwWVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehl
    rghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtg
    hpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhr
    tghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomh
    hirdhvrghlkhgvihhnvghnodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:nvZCaDPwIHME0l3ZeybI_kJ8XJLBcGbXQCBP9KEPL71L8JrHl56rzA>
    <xmx:nvZCaA_cG4KoW9FqNz9dMLdId06UcPhS0K2bdBhTW8n1RPtquPsqIQ>
    <xmx:nvZCaLXITM73XUz7yZc2YHMh5BS-9GzrCREkjNXPo30DFQ02iAgRqw>
    <xmx:nvZCaJekfUKhZcLqfjSJo7gtQPEFhk3JTYjuAbpcGOzqsyq56ALqaA>
    <xmx:n_ZCaH5xJCjIS0l_3sl8VfisXY1OXLYNdViua26znPR2U8PbjucFP2E1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 10:09:34 -0400 (EDT)
Date: Fri, 6 Jun 2025 16:09:33 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 5/6] media: rcar-vin: Merge all notifiers
Message-ID: <20250606140933.GB2780410@ragnatech.se>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
 <20250521132037.1463746-6-niklas.soderlund+renesas@ragnatech.se>
 <20250527114513.GL12492@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527114513.GL12492@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for your feedback!

On 2025-05-27 13:45:13 +0200, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Wed, May 21, 2025 at 03:20:36PM +0200, Niklas Söderlund wrote:
> > The VIN usage of v4l-async is complex and stems from organic growth of
> > the driver of supporting both private local subdevices (Gen2, Gen3) and
> > subdevices shared between all VIN instances (Gen3 and Gen4).
> > 
> > The driver used a separate notifier for each VIN for the private local
> > ones, and a shared group notifier for the shared ones. This was complex
> > and lead to subtle bugs when unbinding and later rebinding subdevices in
> > on of the notifiers having to handle different edge cases depending on
> 
> s/on of/one of/ (I think)
> 
> > if it also had subdevices in the other notifiers etc.
> > 
> > To simplify this have the Gen2 devices allocate and form a VIN group
> > too. This way all subdevices on all models can be collect in a
> > single group notifier. Then there is only a single complete callback for
> > all where the video devices and subdevice nodes can be registered etc.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../platform/renesas/rcar-vin/rcar-core.c     | 263 ++++++++----------
> >  .../platform/renesas/rcar-vin/rcar-vin.h      |   2 -
> >  2 files changed, 114 insertions(+), 151 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > index 60ec57d73a12..b0727e98dac6 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > @@ -43,6 +43,9 @@
> >  
> >  #define v4l2_dev_to_vin(d)	container_of(d, struct rvin_dev, v4l2_dev)
> >  
> > +static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
> > +					  struct v4l2_subdev *subdev);
> 
> Any chance you could move the function instead of forward-declaring it ?

I could move it in a separate commit prior to this patch. But the last 
patch in the series removes the function all together so I thought that 
to be more churn then needed.

> 
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Gen3 Group Allocator
> >   */
> > @@ -232,7 +235,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
> >  		}
> >  	}
> >  
> > -	return vin->group->link_setup(vin->group);
> > +	if (vin->group->link_setup)
> > +		return vin->group->link_setup(vin->group);
> > +
> > +	return  0;
> >  }
> >  
> >  static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
> > @@ -240,22 +246,31 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
> >  				     struct v4l2_async_connection *asc)
> >  {
> >  	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> > -	unsigned int i;
> > +	struct rvin_group *group = vin->group;
> >  
> > -	for (i = 0; i < RCAR_VIN_NUM; i++)
> > -		if (vin->group->vin[i])
> > -			rvin_v4l2_unregister(vin->group->vin[i]);
> > +	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++)
> 
> While at it, you can use ARRAY_SIZE().

The use of RCAR_VIN_NUM is everywhere in the driver. I do however agree 
using ARRAY_SIZE() is better. I will convert the whole driver to 
ARRAY_SIZE() in a follow up patch outside this series.

I think it's important that all loops look the same and I'm worried this 
series is growing too large with all nice, but unrelated, cleanups 
unearth by it. I hope this is OK.

I will however keep the conversion to ARRAY_SIZE() for the 
RVIN_REMOTES_MAX define as this was already something this series needed 
to address in patch 1 and it's only used in one location that was not 
already touched by this series.

> 
> > +		if (group->vin[i])
> > +			rvin_v4l2_unregister(group->vin[i]);
> 
> And please use curly braces for the for statement.
> 
> >  
> >  	mutex_lock(&vin->group->lock);
> 
> Add a blank line.
> 
> > +	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
> 
> ARRAY_SIZE() here too. Same below where applicable.
> 
> > +		if (!group->vin[i] || group->vin[i]->parallel.asc != asc)
> > +			continue;
> > +
> > +		group->vin[i]->parallel.subdev = NULL;
> > +
> > +		vin_dbg(group->vin[i], "Unbind parallel subdev %s\n",
> > +			subdev->name);
> > +	}
> >  
> > -	for (i = 0; i < RVIN_REMOTES_MAX; i++) {
> > -		if (vin->group->remotes[i].asc != asc)
> > +	for (unsigned int i = 0; i < RVIN_REMOTES_MAX; i++) {
> > +		if (group->remotes[i].asc != asc)
> >  			continue;
> > -		vin->group->remotes[i].subdev = NULL;
> > +
> > +		group->remotes[i].subdev = NULL;
> > +
> >  		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
> > -		break;
> >  	}
> > -
> 
> You can keep this blank line :-)
> 
> >  	mutex_unlock(&vin->group->lock);
> >  
> >  	media_device_unregister(&vin->group->mdev);
> > @@ -266,21 +281,38 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
> >  				   struct v4l2_async_connection *asc)
> >  {
> >  	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> > -	unsigned int i;
> > +	struct rvin_group *group = vin->group;
> >  
> > -	mutex_lock(&vin->group->lock);
> > +	guard(mutex)(&group->lock);
> >  
> > -	for (i = 0; i < RVIN_REMOTES_MAX; i++) {
> > +	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
> > +		int ret;
> > +
> > +		if (!group->vin[i] || group->vin[i]->parallel.asc != asc)
> > +			continue;
> > +
> > +		ret = rvin_parallel_subdevice_attach(group->vin[i], subdev);
> > +		if (ret)
> > +			return ret;
> > +
> > +		v4l2_set_subdev_hostdata(subdev, group->vin[i]);
> > +
> > +		vin_dbg(group->vin[i], "Bound subdev %s\n", subdev->name);
> > +
> > +		return 0;
> > +	}
> > +
> > +	for (unsigned int i = 0; i < RVIN_REMOTES_MAX; i++) {
> >  		if (vin->group->remotes[i].asc != asc)
> >  			continue;
> > +
> >  		vin->group->remotes[i].subdev = subdev;
> >  		vin_dbg(vin, "Bound %s to slot %u\n", subdev->name, i);
> > -		break;
> > +
> > +		return 0;
> >  	}
> >  
> > -	mutex_unlock(&vin->group->lock);
> > -
> > -	return 0;
> > +	return -ENODEV;
> >  }
> >  
> >  static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
> > @@ -374,7 +406,7 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
> >  		goto out;
> >  	}
> >  
> > -	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
> > +	asc = v4l2_async_nf_add_fwnode(&vin->group->notifier, fwnode,
> >  				       struct v4l2_async_connection);
> >  	if (IS_ERR(asc)) {
> >  		ret = PTR_ERR(asc);
> > @@ -424,6 +456,12 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
> >  		if (!(vin_mask & BIT(i)))
> >  			continue;
> >  
> > +		/* Parse local subdevice. */
> > +		ret = rvin_parallel_parse_of(vin->group->vin[i]);
> > +		if (ret)
> > +			return ret;
> > +
> > +		/* Prase shared subdevices. */
> >  		for (id = 0; id < max_id; id++) {
> >  			if (vin->group->remotes[id].asc)
> >  				continue;
> > @@ -603,124 +641,6 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
> >  	return 0;
> >  }
> >  
> > -static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
> > -{
> > -	rvin_v4l2_unregister(vin);
> > -	vin->parallel.subdev = NULL;
> > -
> > -	if (!vin->info->use_mc)
> > -		rvin_free_controls(vin);
> > -}
> > -
> > -static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
> > -{
> > -	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> > -	struct media_entity *source;
> > -	struct media_entity *sink;
> > -	int ret;
> > -
> > -	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
> > -	if (ret < 0) {
> > -		vin_err(vin, "Failed to register subdev nodes\n");
> > -		return ret;
> > -	}
> > -
> > -	if (!video_is_registered(&vin->vdev)) {
> > -		ret = rvin_v4l2_register(vin);
> > -		if (ret < 0)
> > -			return ret;
> > -	}
> > -
> > -	if (!vin->info->use_mc)
> > -		return 0;
> > -
> > -	/* If we're running with media-controller, link the subdevs. */
> > -	source = &vin->parallel.subdev->entity;
> > -	sink = &vin->vdev.entity;
> > -
> > -	ret = media_create_pad_link(source, vin->parallel.source_pad,
> > -				    sink, vin->parallel.sink_pad, 0);
> > -	if (ret)
> > -		vin_err(vin, "Error adding link from %s to %s: %d\n",
> > -			source->name, sink->name, ret);
> > -
> > -	return ret;
> > -}
> > -
> > -static void rvin_parallel_notify_unbind(struct v4l2_async_notifier *notifier,
> > -					struct v4l2_subdev *subdev,
> > -					struct v4l2_async_connection *asc)
> > -{
> > -	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> > -
> > -	vin_dbg(vin, "unbind parallel subdev %s\n", subdev->name);
> > -
> > -	mutex_lock(&vin->lock);
> > -	rvin_parallel_subdevice_detach(vin);
> > -	mutex_unlock(&vin->lock);
> > -}
> > -
> > -static int rvin_parallel_notify_bound(struct v4l2_async_notifier *notifier,
> > -				      struct v4l2_subdev *subdev,
> > -				      struct v4l2_async_connection *asc)
> > -{
> > -	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> > -	int ret;
> > -
> > -	mutex_lock(&vin->lock);
> > -	ret = rvin_parallel_subdevice_attach(vin, subdev);
> > -	mutex_unlock(&vin->lock);
> > -	if (ret)
> > -		return ret;
> > -
> > -	v4l2_set_subdev_hostdata(subdev, vin);
> > -
> > -	vin_dbg(vin, "bound subdev %s source pad: %u sink pad: %u\n",
> > -		subdev->name, vin->parallel.source_pad,
> > -		vin->parallel.sink_pad);
> > -
> > -	return 0;
> > -}
> > -
> > -static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
> > -	.bound = rvin_parallel_notify_bound,
> > -	.unbind = rvin_parallel_notify_unbind,
> > -	.complete = rvin_parallel_notify_complete,
> > -};
> > -
> > -static void rvin_parallel_cleanup(struct rvin_dev *vin)
> > -{
> > -	v4l2_async_nf_unregister(&vin->notifier);
> > -	v4l2_async_nf_cleanup(&vin->notifier);
> > -}
> > -
> > -static int rvin_parallel_init(struct rvin_dev *vin)
> > -{
> > -	int ret;
> > -
> > -	v4l2_async_nf_init(&vin->notifier, &vin->v4l2_dev);
> > -
> > -	ret = rvin_parallel_parse_of(vin);
> > -	if (ret)
> > -		return ret;
> > -
> > -	if (!vin->parallel.asc)
> > -		return -ENODEV;
> > -
> > -	vin_dbg(vin, "Found parallel subdevice %pOF\n",
> > -		to_of_node(vin->parallel.asc->match.fwnode));
> > -
> > -	vin->notifier.ops = &rvin_parallel_notify_ops;
> > -	ret = v4l2_async_nf_register(&vin->notifier);
> > -	if (ret < 0) {
> > -		vin_err(vin, "Notifier registration failed\n");
> > -		v4l2_async_nf_cleanup(&vin->notifier);
> > -		return ret;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> >  /* -----------------------------------------------------------------------------
> >   * CSI-2
> >   */
> > @@ -895,11 +815,63 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
> >  	return 0;
> >  }
> >  
> > +static int rvin_parallel_setup_links(struct rvin_group *group)
> > +{
> > +	u32 flags = MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE;
> > +	int ret = 0;
> > +
> > +	mutex_lock(&group->lock);
> 
> Use a guard.
> 
> > +	/* If the group also have links don't enable the link. */
> 
> s/have/has/
> 
> > +	for (unsigned int i = 0; i < RVIN_REMOTES_MAX; i++) {
> > +		if (group->remotes[i].subdev) {
> > +			flags = 0;
> > +			break;
> > +		}
> > +	}
> > +
> > +	/* Create links */
> 
> s/links/links./
> 
> > +	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
> > +		struct rvin_dev *vin = group->vin[i];
> > +		struct media_entity *source;
> > +		struct media_entity *sink;
> > +
> > +		/* Noting to do if their is no VIN or parallel subdev. */
> 
> s/Noting/Nothing/
> s/their/there/
> 
> > +		if (!vin || !vin->parallel.subdev)
> > +			continue;
> > +
> > +		source = &vin->parallel.subdev->entity;
> > +		sink = &vin->vdev.entity;
> > +
> > +		ret = media_create_pad_link(source, vin->parallel.source_pad,
> > +					    sink, 0, flags);
> > +		if (ret)
> > +			break;
> 
> 			return ret;
> 
> (thanks to the guard above)
> 
> > +	}
> > +	mutex_unlock(&group->lock);
> > +
> > +	return ret;
> 
> 	return 0;
> 
> > +}
> > +
> >  static int rvin_csi2_setup_links(struct rvin_group *group)
> >  {
> >  	const struct rvin_group_route *routes, *route;
> >  	unsigned int id;
> > -	int ret = -EINVAL;
> > +	int ret;
> > +
> > +	/* Find any VIN in group to get route info. */
> > +	routes = NULL;
> > +	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
> > +		if (group->vin[i]) {
> > +			routes = group->vin[i]->info->routes;
> > +			break;
> > +		}
> > +	}
> > +	if (!routes)
> > +		return -ENODEV;
> 
> Storing the info pointer in the group as proposed in the review of a
> previous patch from the same series would help here too.

I agree. I have added a patch that introduce this change separatly and 
all new code uses the info from the group structure. I have added to my 
ever growing todo file to remove the info struct all together from the 
private VIN data structure in a follow up patch. This change would 
depend on this series as Gen2 currently do not participate in the group 
concept.

> 
> > +
> > +	ret = rvin_parallel_setup_links(group);
> > +	if (ret)
> > +		return ret;
> >  
> >  	/* Find any VIN in group to get route info. */
> >  	routes = NULL;
> > @@ -914,6 +886,7 @@ static int rvin_csi2_setup_links(struct rvin_group *group)
> >  
> >  	/* Create all media device links between VINs and CSI-2's. */
> >  	mutex_lock(&group->lock);
> > +	ret = -EINVAL;
> >  	for (route = routes; route->chsel; route++) {
> >  		/* Check that VIN' master is part of the group. */
> >  		if (!group->vin[route->master])
> > @@ -941,7 +914,6 @@ static int rvin_csi2_setup_links(struct rvin_group *group)
> >  
> >  static void rvin_csi2_cleanup(struct rvin_dev *vin)
> >  {
> > -	rvin_parallel_cleanup(vin);
> >  	rvin_group_notifier_cleanup(vin);
> >  	rvin_group_put(vin);
> >  	rvin_free_controls(vin);
> > @@ -964,18 +936,11 @@ static int rvin_csi2_init(struct rvin_dev *vin)
> >  	if (ret)
> >  		goto err_controls;
> >  
> > -	/* It's OK to not have a parallel subdevice. */
> > -	ret = rvin_parallel_init(vin);
> > -	if (ret && ret != -ENODEV)
> > -		goto err_group;
> > -
> >  	ret = rvin_group_notifier_init(vin, 1, RVIN_CSI_MAX);
> >  	if (ret)
> > -		goto err_parallel;
> > +		goto err_group;
> >  
> >  	return 0;
> > -err_parallel:
> > -	rvin_parallel_cleanup(vin);
> >  err_group:
> >  	rvin_group_put(vin);
> >  err_controls:
> > @@ -1448,7 +1413,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
> >  		    rvin_group_id_to_master(vin->id) == vin->id)
> >  			vin->scaler = vin->info->scaler;
> >  	} else {
> > -		ret = rvin_parallel_init(vin);
> > +		ret = rvin_group_get(vin, NULL, NULL);
> > +		if (!ret)
> > +			ret = rvin_group_notifier_init(vin, 0, 0);
> >  
> >  		if (vin->info->scaler)
> >  			vin->scaler = vin->info->scaler;
> > @@ -1478,8 +1445,6 @@ static void rcar_vin_remove(struct platform_device *pdev)
> >  		rvin_isp_cleanup(vin);
> >  	else if (vin->info->use_mc)
> >  		rvin_csi2_cleanup(vin);
> > -	else
> > -		rvin_parallel_cleanup(vin);
> >  
> >  	rvin_id_put(vin);
> >  
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> > index 7d4fce248976..a577f4fe4a6c 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> > @@ -149,7 +149,6 @@ struct rvin_info {
> >   * @vdev:		V4L2 video device associated with VIN
> >   * @v4l2_dev:		V4L2 device
> >   * @ctrl_handler:	V4L2 control handler
> > - * @notifier:		V4L2 asynchronous subdevs notifier
> >   *
> >   * @parallel:		parallel input subdevice descriptor
> >   *
> > @@ -189,7 +188,6 @@ struct rvin_dev {
> >  	struct video_device vdev;
> >  	struct v4l2_device v4l2_dev;
> >  	struct v4l2_ctrl_handler ctrl_handler;
> > -	struct v4l2_async_notifier notifier;
> >  
> >  	struct rvin_parallel_entity parallel;
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund


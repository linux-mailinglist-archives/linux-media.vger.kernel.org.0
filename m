Return-Path: <linux-media+bounces-14112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C05916D62
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 17:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 402E2B2402B
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 15:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B46016F906;
	Tue, 25 Jun 2024 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="G3kxDtD8"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A200C2E62F;
	Tue, 25 Jun 2024 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719330372; cv=pass; b=WHrX+nNkw3CJEuF03eSbgtcrwzJMBmSsP3V+V46Xf8fGxdcZuWg68xw2QYHDDha9aoKV+uNL+wnuquuMHL2ftDoabuDkHrYsJ30cfSy5PZG9DfLgueu0CjPd/5dNBe1pp3YDBhx+gCJ+uMrUdnYz0UtHyrzkvcLBprdhpjPpx3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719330372; c=relaxed/simple;
	bh=qEWv+KLC9o4fQJcau4qBTyPi1r/DsGRqhaKQw81Fck4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFPIo6P88y2bZDkZ6fq+cF03Lq3fSqQH/2FCTWQ9SyGSNnXr9Q1vD6UuQGjNE3aIBr/DPsl1Ow3V4X4lDLcoOaFG/SpQEd6d2NFXE31Kt9Sf8XneIhUkPqXeIixKcdC1s0XpTmBMqEy8DILoCZlmTlLXdVUiGL3vev1iQ5do39E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=G3kxDtD8; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4W7q1W59slzyNf;
	Tue, 25 Jun 2024 18:46:07 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1719330368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qsgeDXqLAG2r88xeBOLTfP/lA9UggnL7cmVxbh/Y8pM=;
	b=G3kxDtD8kkAPoida9mtQhQce0StOdxrVYMiJ+5EhX4pzp0GthQsRM+MfbfhxsZv0NRq1b4
	IrqvMMveEtp7p3i/tikmRMFH/bZCr2JeHYwAAtYi4YrtzkPmAMihX0bmD0nu4R57DosFeX
	LBy2Yc/OqZGMdIblfWNg7sHh1UrA5/M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1719330368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qsgeDXqLAG2r88xeBOLTfP/lA9UggnL7cmVxbh/Y8pM=;
	b=UvXTM34gxGKR5LmkjoWeFN5bSuVOxNHWPKnN3lvMY2fBbK9oOhbzemxswYt+gQufbJEH8C
	BY7a9uGiNrufwCMW5JIVMW99iFpOfH+GHwiWNCDc7gRZ5YnuCbvYU59ASJcrHZHcVcBxcn
	Gi5fxVde0I/nPpKNd78OGOYpdAouj6U=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1719330368; a=rsa-sha256; cv=none;
	b=h6ggPpiOLRfG48nEaW2s5SmjDOi/uNsX9kxP4H5ROZsrUi5frlTzZ11cVc9Faysd4Hpj6d
	O+00B09QxaDjrnrOyJXdXO7CKVjCtGrla2n9Va0+7lqWG8ITD3WSiMpIHM9UFDkJ2RJs0W
	xK/GMQ1vS/jA/tMmnJjj5hHAbcbNRpw=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 352DA634C94;
	Tue, 25 Jun 2024 18:46:07 +0300 (EEST)
Date: Tue, 25 Jun 2024 15:46:06 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 4/8] media: v4l2-subdev: Refactor warnings in
 v4l2_subdev_link_validate()
Message-ID: <ZnrmPpE9hod_bKHx@valkosipuli.retiisi.eu>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240619012356.22685-5-laurent.pinchart+renesas@ideasonboard.com>
 <ZncAJRoydaWoxGRj@valkosipuli.retiisi.eu>
 <20240625140247.GC30459@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625140247.GC30459@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Jun 25, 2024 at 05:02:47PM +0300, Laurent Pinchart wrote:
> On Sat, Jun 22, 2024 at 04:47:33PM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > Thanks for the patch.
> > 
> > On Wed, Jun 19, 2024 at 04:23:52AM +0300, Laurent Pinchart wrote:
> > > The v4l2_subdev_link_validate() function prints a one-time warning if it
> > > gets called on a link whose source or sink is not a subdev. As links get
> > > validated in the context of their sink, a call to the helper when the
> > > link's sink is not a subdev indicates that the driver has set its
> > > .link_validate() handler to v4l2_subdev_link_validate() on a non-subdev
> > > entity, which is a clear driver bug. On the other hand, the link's
> > > source not being a subdev indicates that the helper is used for a subdev
> > > connected to a video output device, which is a lesser issue, if only
> > > because this is currently common practice.
> > > 
> > > There are no drivers left in the kernel that use
> > > v4l2_subdev_link_validate() in a context where it may get called on a
> > > non-subdev sink. Replace the pr_warn_once() with a WARN_ON() in this
> > > case to make sure that new offenders won't be introduced.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-subdev.c | 14 +++++++++-----
> > >  1 file changed, 9 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 4f71199bf592..2d5e39c79620 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -1451,11 +1451,15 @@ int v4l2_subdev_link_validate(struct media_link *link)
> > >  	bool states_locked;
> > >  	int ret;
> > >  
> > > -	if (!is_media_entity_v4l2_subdev(link->sink->entity) ||
> > > -	    !is_media_entity_v4l2_subdev(link->source->entity)) {
> > > -		pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> > > -			     !is_media_entity_v4l2_subdev(link->sink->entity) ?
> > > -			     "sink" : "source",
> > > +	/*
> > > +	 * Links are validated in the context of the sink entity. Usage of this
> > > +	 * helper on a sink that is not a subdev is a clear driver bug.
> > > +	 */
> > > +	if (WARN_ON(!is_media_entity_v4l2_subdev(link->sink->entity)))
> > > +		return -EINVAL;
> > 
> > WARN*() is nowadays deprecated.
> 
> Why so ? I've followed a recent discussion where some people pointed out
> they disliked WARN*() due to panic-on-warn, but I didn't see any
> conclusion there that deprecated WARN*().

Fair enough, there seems to have been more discussion.

As this is still user-triggerable, this should be WARN_ON_ONCE() to prevent
the user from filling the logs, intentionally or not.

> 
> > Could you continue to use pr_warn_once()
> > for this (or dev_warn_one())?
> 
> I think a WARN_ON() is the right option here. A failure indicates a
> clear driver bug, we should be as loud as possible to make sure it gets
> noticed during development.
> 
> > > +
> > > +	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
> > > +		pr_warn_once("source of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> > >  			     link->source->entity->name, link->source->index,
> > >  			     link->sink->entity->name, link->sink->index);
> > >  		return 0;
> 

-- 
Kind regards,

Sakari Ailus


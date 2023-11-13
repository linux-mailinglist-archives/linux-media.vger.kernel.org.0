Return-Path: <linux-media+bounces-246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 204777E9DDD
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB472280DE7
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C03320B11;
	Mon, 13 Nov 2023 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="g+p8xpBO"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FF81D69C
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:53:35 +0000 (UTC)
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46ADD59
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 05:53:33 -0800 (PST)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4STW9N1Dn0zySy;
	Mon, 13 Nov 2023 15:53:25 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1699883610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tMEQx05OJbxdYdQUoUJUOZgasn/Ix/DW6qF4uXhSH2s=;
	b=g+p8xpBOiUzU1CxR1DU5iixjQmZQbyPYj8E3YsRnTY5qnpNJ5ArRCuZUvO7Ra2EI4vCJVJ
	/v8KwYMbaTLJ6OH+QT4QHO62BesU5XpehDE7+iLORxFrxwnxTwGuCjj+YA1qQu6/dnjn6m
	4MHPQvqsQ04oYcZaeh4oaTC93Hsz0V4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1699883610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tMEQx05OJbxdYdQUoUJUOZgasn/Ix/DW6qF4uXhSH2s=;
	b=fnt+11uIFpnAeqanm6eCezelLafKvGofdF4huSitJOSHJGm/Cf1klQNWytHjOWpH7Q/kkk
	7l0MYbwxDJ/Hj4qLk2KSHKrM+iRv5jY7XV8NOdL6AhIL6iO38Z4yteWbPexhwmAnh2rg1d
	pSJalTXBSDBFyzCpR8sEesKLxg4xNfk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1699883610; a=rsa-sha256; cv=none;
	b=YJyU8oUUA7M4eLXWyONO7CiY69TYf55/SkRc2fA1C95szdAYMh7naBhC8YtJ4uGsGtND9d
	I8u0gcR0vZBK8H9GWW0qhzd0HFssvnW2MvDzHA1GLA0T3bIh+2wBH+S+fpvt3Z5b14Nle2
	DMnRd/7qOk6cwwTb1E6TxnaJwd+RUTg=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1B4E7634C93;
	Mon, 13 Nov 2023 15:53:24 +0200 (EET)
Date: Mon, 13 Nov 2023 13:53:24 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	hverkuil@xs4all.nl
Subject: Re: [PATCH v1 2/2] media: v4l2-subdev: Relax warnings in link
 validation
Message-ID: <ZVIqVG8Hrl9uKb3u@valkosipuli.retiisi.eu>
References: <20231113101718.6098-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231113101718.6098-3-laurent.pinchart+renesas@ideasonboard.com>
 <ZVIDOlMYhCWiyNPh@valkosipuli.retiisi.eu>
 <20231113113754.GC24338@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113113754.GC24338@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Nov 13, 2023 at 01:37:54PM +0200, Laurent Pinchart wrote:
> On Mon, Nov 13, 2023 at 11:06:34AM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > Thanks for the patch.
> > 
> > On Mon, Nov 13, 2023 at 12:17:18PM +0200, Laurent Pinchart wrote:
> > > Before v6.3, the v4l2_subdev_link_validate() helper would ignore links
> > > whose source was a video device and sink a subdev. The helper was (and
> > > still is) used by drivers in such cases, in particular for subdevs with
> > > multiple sink pads, some connected to video devices and some to other
> > > subdevs.
> > > 
> > > Then, commit a6b995ed03ff ("media: subdev: use streams in
> > > v4l2_subdev_link_validate()") assumed the entities on the two sides of a
> > > link are both subdevs, and caused crashes in drivers that use the helper
> > > with subdev sink pads connected to video devices. Commit 55f1ecb11990
> > > ("media: v4l: subdev: Make link validation safer"), merged in v6.4,
> > > fixed the crash by adding an explicit check with a pr_warn_once(),
> > > mentioning a driver bug.
> > > 
> > > Links between a subdev and a video device need to be validated, and
> > > v4l2_subdev_link_validate() can't handle that. Drivers typically handle
> > > this validation manually at stream start time (either in the .streamon()
> > > ioctl handler, or in the .start_streaming() vb2 queue operation),
> > > instead of implementing a custom .link_validate() handler. Forbidding
> > 
> > While some do the validation as part of the streamon callback, it'd be
> > nicer to move this to the link_validate callback instead: this is what the
> > callback is for.
> 
> Is there any driver that does so already ?

Based on a quick look IPU3-CIO2 and vimc do that. I guess there indeed are
also other drivers besides the vsp driver that do not, on the other hand.
But this is what I would have expected drivers to do all along: the
link_validate callback is where you validate the formats across the link
match, independently of whether the link is between sub-devices or a
sub-device and something else.

> 
> > I'd presume not may drivers depend on
> > v4l2_subdev_link_validate() fail silently on non-subdevices as the issue
> > hasn't been reported before while the patch that seems to have broken this
> > was merged in 6.3.
> 
> At least the VSP1 driver depends on it. The i.MX8MP ISI driver does as
> well, it got merged in v6.4, so the crash in v6.3 didn't get noticed.
> I'd be surprised if the omap3isp driver also didn't depend on this
> behaviour when operating in M2M mode.
> 
> > Not failing silently in link_validate also ensures the validation gets
> > done: there have been drivers (more than one) that have simply missed the
> > link validation due to the issue (non-sub-device entity on one end) being
> > silently ignored by default.
> 
> If there's a consensus that subdev to video device link validation need
> to be done in the .link_validate() operation, then work needs to be done
> to make that happen. I'd like to see at least one proof of concept
> implemented, to make sure there are no unforeseen issues. Are you
> volunteering ? :-)

I'd hope the driver authors to provide fixes: they have the hardware to
test, too.

> 
> In the meantime, most drivers (possibly all) validate that link manually
> outside of the .link_validate() operation, so this is the de facto
> typical mode of operation. I don't think it can be considered as a

That is not entirely correct. While such drivers exist, these are still a
subset of all drivers (performing link validation between sub-device and
video nodes).

> driver bug until we make a reasonable effort to convert drivers to a new
> model. It's not fair to just add a pr_warn_once() without having done
> some of the work needed to move to a new model.

I don't think the model really got changed. The documentation implies this,
it does not explicitly document what the driver is expected to do. I can
write a documentation patch for this.

Given that there are surprisingly more than one driver that seem to depend
on this, at the moment, I'm fine with reverting back to ignoring the error.
But we should still print a warning to signal the driver should be fixed.

I can address the omap3isp driver. The IPU6 ISYS driver already uses
link_validate callback.

Also cc Hans.

> 
> > > usage of v4l2_subdev_link_validate() as the .link_validate() handler
> > > would thus force all subdev drivers that mix source links to subdev and
> > > video devices to implement a custom .link_validate() handler that
> > > returns immediately for the video device links and call
> > > v4l2_subdev_link_validate() for subdev links. This would create lots of
> > > duplicated code for no real gain. Instead, relax the check in
> > > v4l2_ctrl_modify_range() to ignore links from a video device to a subdev
> > > without printing any warning.
> > > 
> > > Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-subdev.c | 30 ++++++++++++++++++++-------
> > >  1 file changed, 23 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 67d43206ce32..b00be1d57e05 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -1356,15 +1356,31 @@ int v4l2_subdev_link_validate(struct media_link *link)
> > >  	struct v4l2_subdev *source_sd, *sink_sd;
> > >  	struct v4l2_subdev_state *source_state, *sink_state;
> > >  	bool states_locked;
> > > +	bool is_sink_subdev;
> > > +	bool is_source_subdev;
> > >  	int ret;
> > >  
> > > -	if (!is_media_entity_v4l2_subdev(link->sink->entity) ||
> > > -	    !is_media_entity_v4l2_subdev(link->source->entity)) {
> > > -		pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> > > -			     !is_media_entity_v4l2_subdev(link->sink->entity) ?
> > > -			     "sink" : "source",
> > > -			     link->source->entity->name, link->source->index,
> > > -			     link->sink->entity->name, link->sink->index);
> > > +	is_sink_subdev = is_media_entity_v4l2_subdev(link->sink->entity);
> > > +	is_source_subdev = is_media_entity_v4l2_subdev(link->source->entity);
> > > +
> > > +	if (!is_sink_subdev || !is_source_subdev) {
> > > +		/*
> > > +		 * Do not print the warning if the source is a video device and
> > > +		 * the sink a subdev. This is a valid use case, to allow usage
> > > +		 * of this helper by subdev drivers that have multiple sink
> > > +		 * pads, some connected to video devices and some connected to
> > > +		 * other subdevs. The video device to subdev link is typically
> > > +		 * validated manually by the driver at stream start time in such
> > > +		 * cases.
> > > +		 */
> > > +		if (!is_sink_subdev ||
> > > +		    !is_media_entity_v4l2_video_device(link->source->entity))
> > > +			pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> > > +				     !is_sink_subdev ? "sink" : "source",
> > > +				     link->source->entity->name,
> > > +				     link->source->index,
> > > +				     link->sink->entity->name,
> > > +				     link->sink->index);
> > >  		return 0;
> > >  	}
> > >  
> 

-- 
Regards,

Sakari Ailus


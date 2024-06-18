Return-Path: <linux-media+bounces-13573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AC790D76B
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 17:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 628821C2130F
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 15:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B423D0D5;
	Tue, 18 Jun 2024 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WCx8DUcm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E4C12E6D
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718724940; cv=none; b=D2LrxvwNRkg1l7GqNF2BUUCLv0F6jkiHmAh9h7jxbfzRUgE4MpwLhDWZUBDDEPCqZitNbYwOulA4SqUCDMB+Hlp0Iyo8V88A6xqSMIgI1EosrsMDiGVgqiwjGEtQWbwTrdLC5Tr79tem5jQVSLnbDPJ+2egCV9vyIppv0bIj0tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718724940; c=relaxed/simple;
	bh=BFDvuCDmvxcGwwyvRWrzuEpLvgNtl2bi7Ur/hahPK4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=us5GNtFE9OZ8WGjOL/EyKPD2jNh3Cx8oGHNsCqy8yLY1tLTa0s213BBlIsYz7eA5cvXMnp7d+1SF1N3fO4z2krrUasoxHqvZK2ZsAt7jm97ehcZwjiqqcmnghOmWEKoOT/kInBHLcyZd7JPSfDQb9XJETzN62khUymUiW+RQoE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WCx8DUcm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98D03908;
	Tue, 18 Jun 2024 17:35:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718724917;
	bh=BFDvuCDmvxcGwwyvRWrzuEpLvgNtl2bi7Ur/hahPK4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCx8DUcmNEi7bbx6xaTA7QbfJyvwba0UvEYg3O6VTloPJ15sRk0Gdnl3cVj/7UxVi
	 KeNkrSmTOnTF3XBbS67tmx6BYgtTzk2OjknwG1kJA/w4JV3VzF9wQ+eddOp36tPR1g
	 AWw2+mBG+Rc8czTZE8+Vda62BURFwTSD/Y63fDqQ=
Date: Tue, 18 Jun 2024 18:35:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	hverkuil@xs4all.nl
Subject: Re: [PATCH v1 2/2] media: v4l2-subdev: Relax warnings in link
 validation
Message-ID: <20240618153513.GB32669@pendragon.ideasonboard.com>
References: <20231113101718.6098-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231113101718.6098-3-laurent.pinchart+renesas@ideasonboard.com>
 <ZVIDOlMYhCWiyNPh@valkosipuli.retiisi.eu>
 <20231113113754.GC24338@pendragon.ideasonboard.com>
 <ZVIqVG8Hrl9uKb3u@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZVIqVG8Hrl9uKb3u@valkosipuli.retiisi.eu>

Hi Sakari,

On Mon, Nov 13, 2023 at 01:53:24PM +0000, Sakari Ailus wrote:
> On Mon, Nov 13, 2023 at 01:37:54PM +0200, Laurent Pinchart wrote:
> > On Mon, Nov 13, 2023 at 11:06:34AM +0000, Sakari Ailus wrote:
> > > Hi Laurent,
> > > 
> > > Thanks for the patch.
> > > 
> > > On Mon, Nov 13, 2023 at 12:17:18PM +0200, Laurent Pinchart wrote:
> > > > Before v6.3, the v4l2_subdev_link_validate() helper would ignore links
> > > > whose source was a video device and sink a subdev. The helper was (and
> > > > still is) used by drivers in such cases, in particular for subdevs with
> > > > multiple sink pads, some connected to video devices and some to other
> > > > subdevs.
> > > > 
> > > > Then, commit a6b995ed03ff ("media: subdev: use streams in
> > > > v4l2_subdev_link_validate()") assumed the entities on the two sides of a
> > > > link are both subdevs, and caused crashes in drivers that use the helper
> > > > with subdev sink pads connected to video devices. Commit 55f1ecb11990
> > > > ("media: v4l: subdev: Make link validation safer"), merged in v6.4,
> > > > fixed the crash by adding an explicit check with a pr_warn_once(),
> > > > mentioning a driver bug.
> > > > 
> > > > Links between a subdev and a video device need to be validated, and
> > > > v4l2_subdev_link_validate() can't handle that. Drivers typically handle
> > > > this validation manually at stream start time (either in the .streamon()
> > > > ioctl handler, or in the .start_streaming() vb2 queue operation),
> > > > instead of implementing a custom .link_validate() handler. Forbidding
> > > 
> > > While some do the validation as part of the streamon callback, it'd be
> > > nicer to move this to the link_validate callback instead: this is what the
> > > callback is for.
> > 
> > Is there any driver that does so already ?
> 
> Based on a quick look IPU3-CIO2 and vimc do that. I guess there indeed are
> also other drivers besides the vsp driver that do not, on the other hand.
> But this is what I would have expected drivers to do all along: the
> link_validate callback is where you validate the formats across the link
> match, independently of whether the link is between sub-devices or a
> sub-device and something else.

I suppose that could work. It would be a bit cumbersome for drivers
whose subdevs have sink pads connected to other subdevs and sink pads
connected to video devices, but that's not the majority of subdevs, and
probably not the end of the world.

> > > I'd presume not may drivers depend on
> > > v4l2_subdev_link_validate() fail silently on non-subdevices as the issue
> > > hasn't been reported before while the patch that seems to have broken this
> > > was merged in 6.3.
> > 
> > At least the VSP1 driver depends on it. The i.MX8MP ISI driver does as
> > well, it got merged in v6.4, so the crash in v6.3 didn't get noticed.
> > I'd be surprised if the omap3isp driver also didn't depend on this
> > behaviour when operating in M2M mode.
> > 
> > > Not failing silently in link_validate also ensures the validation gets
> > > done: there have been drivers (more than one) that have simply missed the
> > > link validation due to the issue (non-sub-device entity on one end) being
> > > silently ignored by default.
> > 
> > If there's a consensus that subdev to video device link validation need
> > to be done in the .link_validate() operation, then work needs to be done
> > to make that happen. I'd like to see at least one proof of concept
> > implemented, to make sure there are no unforeseen issues. Are you
> > volunteering ? :-)
> 
> I'd hope the driver authors to provide fixes: they have the hardware to
> test, too.

I'll give it a try with the VSP1 driver.

> > In the meantime, most drivers (possibly all) validate that link manually
> > outside of the .link_validate() operation, so this is the de facto
> > typical mode of operation. I don't think it can be considered as a
> 
> That is not entirely correct. While such drivers exist, these are still a
> subset of all drivers (performing link validation between sub-device and
> video nodes).

It's a subset indeed, but it seems to still be the majority.

> > driver bug until we make a reasonable effort to convert drivers to a new
> > model. It's not fair to just add a pr_warn_once() without having done
> > some of the work needed to move to a new model.
> 
> I don't think the model really got changed. The documentation implies this,
> it does not explicitly document what the driver is expected to do. I can
> write a documentation patch for this.

The model got changed in practice, a situation that was previously
allowed and considered valid by reviewers now generates a warning.

> Given that there are surprisingly more than one driver that seem to depend
> on this, at the moment, I'm fine with reverting back to ignoring the error.
> But we should still print a warning to signal the driver should be fixed.

I'd say "moved to the new recommended model" instead of "fixed".

> I can address the omap3isp driver. The IPU6 ISYS driver already uses
> link_validate callback.

Did you get a chance to address omap3isp ? :-)

> Also cc Hans.
> 
> > > > usage of v4l2_subdev_link_validate() as the .link_validate() handler
> > > > would thus force all subdev drivers that mix source links to subdev and
> > > > video devices to implement a custom .link_validate() handler that
> > > > returns immediately for the video device links and call
> > > > v4l2_subdev_link_validate() for subdev links. This would create lots of
> > > > duplicated code for no real gain. Instead, relax the check in
> > > > v4l2_ctrl_modify_range() to ignore links from a video device to a subdev
> > > > without printing any warning.
> > > > 
> > > > Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-subdev.c | 30 ++++++++++++++++++++-------
> > > >  1 file changed, 23 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index 67d43206ce32..b00be1d57e05 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > @@ -1356,15 +1356,31 @@ int v4l2_subdev_link_validate(struct media_link *link)
> > > >  	struct v4l2_subdev *source_sd, *sink_sd;
> > > >  	struct v4l2_subdev_state *source_state, *sink_state;
> > > >  	bool states_locked;
> > > > +	bool is_sink_subdev;
> > > > +	bool is_source_subdev;
> > > >  	int ret;
> > > >  
> > > > -	if (!is_media_entity_v4l2_subdev(link->sink->entity) ||
> > > > -	    !is_media_entity_v4l2_subdev(link->source->entity)) {
> > > > -		pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> > > > -			     !is_media_entity_v4l2_subdev(link->sink->entity) ?
> > > > -			     "sink" : "source",
> > > > -			     link->source->entity->name, link->source->index,
> > > > -			     link->sink->entity->name, link->sink->index);
> > > > +	is_sink_subdev = is_media_entity_v4l2_subdev(link->sink->entity);
> > > > +	is_source_subdev = is_media_entity_v4l2_subdev(link->source->entity);
> > > > +
> > > > +	if (!is_sink_subdev || !is_source_subdev) {
> > > > +		/*
> > > > +		 * Do not print the warning if the source is a video device and
> > > > +		 * the sink a subdev. This is a valid use case, to allow usage
> > > > +		 * of this helper by subdev drivers that have multiple sink
> > > > +		 * pads, some connected to video devices and some connected to
> > > > +		 * other subdevs. The video device to subdev link is typically
> > > > +		 * validated manually by the driver at stream start time in such
> > > > +		 * cases.
> > > > +		 */
> > > > +		if (!is_sink_subdev ||
> > > > +		    !is_media_entity_v4l2_video_device(link->source->entity))
> > > > +			pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> > > > +				     !is_sink_subdev ? "sink" : "source",
> > > > +				     link->source->entity->name,
> > > > +				     link->source->index,
> > > > +				     link->sink->entity->name,
> > > > +				     link->sink->index);
> > > >  		return 0;
> > > >  	}
> > > >  

-- 
Regards,

Laurent Pinchart


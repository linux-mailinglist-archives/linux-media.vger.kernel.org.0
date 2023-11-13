Return-Path: <linux-media+bounces-220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4AF7E9B41
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 12:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59652280D38
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95BAB1CF8B;
	Mon, 13 Nov 2023 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SKjjy3TR"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC261CAB0
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 11:37:50 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76902D6A
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 03:37:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8F1E10A;
	Mon, 13 Nov 2023 12:37:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699875442;
	bh=jChpAXCNDFvdF0IO4V2fI5HKTMj68Pe2BN6wrbOBenE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKjjy3TRvlF6BZmif+0H63nqZYrfH2FfNe3YJ2XnsUFFwLumRFQtk8xQUf67UYF8g
	 aw86L3/E+xkmcBNw17Szq+ZPeJ8WlgyJ0+yfbmSM37fupYIXpaBrP0v0Gw/NaYzrGh
	 SMT4Ogb4IDSRy2GN1ahfWY5J0L1qWiYYBxDoN2Uw=
Date: Mon, 13 Nov 2023 13:37:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v1 2/2] media: v4l2-subdev: Relax warnings in link
 validation
Message-ID: <20231113113754.GC24338@pendragon.ideasonboard.com>
References: <20231113101718.6098-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231113101718.6098-3-laurent.pinchart+renesas@ideasonboard.com>
 <ZVIDOlMYhCWiyNPh@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZVIDOlMYhCWiyNPh@valkosipuli.retiisi.eu>

On Mon, Nov 13, 2023 at 11:06:34AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> Thanks for the patch.
> 
> On Mon, Nov 13, 2023 at 12:17:18PM +0200, Laurent Pinchart wrote:
> > Before v6.3, the v4l2_subdev_link_validate() helper would ignore links
> > whose source was a video device and sink a subdev. The helper was (and
> > still is) used by drivers in such cases, in particular for subdevs with
> > multiple sink pads, some connected to video devices and some to other
> > subdevs.
> > 
> > Then, commit a6b995ed03ff ("media: subdev: use streams in
> > v4l2_subdev_link_validate()") assumed the entities on the two sides of a
> > link are both subdevs, and caused crashes in drivers that use the helper
> > with subdev sink pads connected to video devices. Commit 55f1ecb11990
> > ("media: v4l: subdev: Make link validation safer"), merged in v6.4,
> > fixed the crash by adding an explicit check with a pr_warn_once(),
> > mentioning a driver bug.
> > 
> > Links between a subdev and a video device need to be validated, and
> > v4l2_subdev_link_validate() can't handle that. Drivers typically handle
> > this validation manually at stream start time (either in the .streamon()
> > ioctl handler, or in the .start_streaming() vb2 queue operation),
> > instead of implementing a custom .link_validate() handler. Forbidding
> 
> While some do the validation as part of the streamon callback, it'd be
> nicer to move this to the link_validate callback instead: this is what the
> callback is for.

Is there any driver that does so already ?

> I'd presume not may drivers depend on
> v4l2_subdev_link_validate() fail silently on non-subdevices as the issue
> hasn't been reported before while the patch that seems to have broken this
> was merged in 6.3.

At least the VSP1 driver depends on it. The i.MX8MP ISI driver does as
well, it got merged in v6.4, so the crash in v6.3 didn't get noticed.
I'd be surprised if the omap3isp driver also didn't depend on this
behaviour when operating in M2M mode.

> Not failing silently in link_validate also ensures the validation gets
> done: there have been drivers (more than one) that have simply missed the
> link validation due to the issue (non-sub-device entity on one end) being
> silently ignored by default.

If there's a consensus that subdev to video device link validation need
to be done in the .link_validate() operation, then work needs to be done
to make that happen. I'd like to see at least one proof of concept
implemented, to make sure there are no unforeseen issues. Are you
volunteering ? :-)

In the meantime, most drivers (possibly all) validate that link manually
outside of the .link_validate() operation, so this is the de facto
typical mode of operation. I don't think it can be considered as a
driver bug until we make a reasonable effort to convert drivers to a new
model. It's not fair to just add a pr_warn_once() without having done
some of the work needed to move to a new model.

> > usage of v4l2_subdev_link_validate() as the .link_validate() handler
> > would thus force all subdev drivers that mix source links to subdev and
> > video devices to implement a custom .link_validate() handler that
> > returns immediately for the video device links and call
> > v4l2_subdev_link_validate() for subdev links. This would create lots of
> > duplicated code for no real gain. Instead, relax the check in
> > v4l2_ctrl_modify_range() to ignore links from a video device to a subdev
> > without printing any warning.
> > 
> > Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 30 ++++++++++++++++++++-------
> >  1 file changed, 23 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 67d43206ce32..b00be1d57e05 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1356,15 +1356,31 @@ int v4l2_subdev_link_validate(struct media_link *link)
> >  	struct v4l2_subdev *source_sd, *sink_sd;
> >  	struct v4l2_subdev_state *source_state, *sink_state;
> >  	bool states_locked;
> > +	bool is_sink_subdev;
> > +	bool is_source_subdev;
> >  	int ret;
> >  
> > -	if (!is_media_entity_v4l2_subdev(link->sink->entity) ||
> > -	    !is_media_entity_v4l2_subdev(link->source->entity)) {
> > -		pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> > -			     !is_media_entity_v4l2_subdev(link->sink->entity) ?
> > -			     "sink" : "source",
> > -			     link->source->entity->name, link->source->index,
> > -			     link->sink->entity->name, link->sink->index);
> > +	is_sink_subdev = is_media_entity_v4l2_subdev(link->sink->entity);
> > +	is_source_subdev = is_media_entity_v4l2_subdev(link->source->entity);
> > +
> > +	if (!is_sink_subdev || !is_source_subdev) {
> > +		/*
> > +		 * Do not print the warning if the source is a video device and
> > +		 * the sink a subdev. This is a valid use case, to allow usage
> > +		 * of this helper by subdev drivers that have multiple sink
> > +		 * pads, some connected to video devices and some connected to
> > +		 * other subdevs. The video device to subdev link is typically
> > +		 * validated manually by the driver at stream start time in such
> > +		 * cases.
> > +		 */
> > +		if (!is_sink_subdev ||
> > +		    !is_media_entity_v4l2_video_device(link->source->entity))
> > +			pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> > +				     !is_sink_subdev ? "sink" : "source",
> > +				     link->source->entity->name,
> > +				     link->source->index,
> > +				     link->sink->entity->name,
> > +				     link->sink->index);
> >  		return 0;
> >  	}
> >  

-- 
Regards,

Laurent Pinchart


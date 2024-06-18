Return-Path: <linux-media+bounces-13572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE61190D72B
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 17:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4634B1F23651
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 15:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB985200DE;
	Tue, 18 Jun 2024 15:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cpYUfQxe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51FB17BB5
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718724334; cv=none; b=nji84vnTI021eDBsVXR0x7x4OmucJNXPuJfw7jmoOPl61B6IRHfINZvYsSRYG0Ze1Z3el5VjElF2S96oiAL4pjAjLu/Vb/uCHBVVtvoZYeNyoov+KEqjdem4w3F1LVixuRcN/lRc+xWJakzvh7xDmMq08p7WwWm8L0yz7/cDN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718724334; c=relaxed/simple;
	bh=SwNa6208+UjoievRzjlLoKSMEnr2dsyDl9NJKwfiNV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgWnAKluxm3tJkl23WPNLJcIHPPmc3Em+1tNBsnEflZQzIwACw6Y8yANhxk7qpL4JSSqGHtwfS6NjMMhVJtVVxxasjHh2AxTS4uGA65JUv4KlclqtQC6Bt68aP/u4Uw9icwEJSck3Eg+XgGFDIc/6EGA4r7wyhJQFzpFzYqBJeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cpYUfQxe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E629908;
	Tue, 18 Jun 2024 17:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718724313;
	bh=SwNa6208+UjoievRzjlLoKSMEnr2dsyDl9NJKwfiNV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cpYUfQxe/B5CIHdaP+EWwyBciQ/pVjH+EJVIOqS7LRzXBhn6BCUoNkK2cJSJCVda3
	 VpjCfjcgcZm1qXzucNzWGEkZnN5uMpfbLQOQAMW3Ip0qwnk2IjDUUU4+ihQV47Bp6B
	 x18LjtPLA+O6PeEkVq79ZM+3goND17SLJ2L0pvbk=
Date: Tue, 18 Jun 2024 18:25:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v1 2/2] media: v4l2-subdev: Relax warnings in link
 validation
Message-ID: <20240618152508.GA32669@pendragon.ideasonboard.com>
References: <20231113101718.6098-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231113101718.6098-3-laurent.pinchart+renesas@ideasonboard.com>
 <f542bb33-57fb-4ce1-bb08-85b69a8cd40a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f542bb33-57fb-4ce1-bb08-85b69a8cd40a@ideasonboard.com>

On Mon, Nov 13, 2023 at 03:03:39PM +0200, Tomi Valkeinen wrote:
> On 13/11/2023 12:17, Laurent Pinchart wrote:
> > Before v6.3, the v4l2_subdev_link_validate() helper would ignore links
> > whose source was a video device and sink a subdev. The helper was (and
> 
> Didn't it also ignore links where the sink is a video device?

__media_pipeline_start() calls .link_validate() to validate links on the
sink side of the subdev only, so video devices connected to a source pad
don't cause any issue.

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
> > usage of v4l2_subdev_link_validate() as the .link_validate() handler
> > would thus force all subdev drivers that mix source links to subdev and
> > video devices to implement a custom .link_validate() handler that
> > returns immediately for the video device links and call
> > v4l2_subdev_link_validate() for subdev links. This would create lots of
> > duplicated code for no real gain. Instead, relax the check in
> > v4l2_ctrl_modify_range() to ignore links from a video device to a subdev
> 
> v4l2_ctrl_modify_range? copy-paste error?

Yes that's a nince one, I wonder how I managed to get it wrong :-)

> Should the check also be relaxed wrt. video device as a sink?

See above.

> > without printing any warning.
> 
> As Sakari said, it would make sense to use .link_validate() to validate 
> all links.

I think I could get convinced to do so. I'll reply to Sakari's other
e-mail in the thread.

> But if this warning is getting printed at the moment, then I think this 
> is a valid fix (maybe with the sink side handled too, if needed).

If we decide it's really a driver issue, then I suppose keeping a
pr_warn_once() could help getting things fixed. That's how I noticed the
problem.

> > Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >   drivers/media/v4l2-core/v4l2-subdev.c | 30 ++++++++++++++++++++-------
> >   1 file changed, 23 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 67d43206ce32..b00be1d57e05 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1356,15 +1356,31 @@ int v4l2_subdev_link_validate(struct media_link *link)
> >   	struct v4l2_subdev *source_sd, *sink_sd;
> >   	struct v4l2_subdev_state *source_state, *sink_state;
> >   	bool states_locked;
> > +	bool is_sink_subdev;
> > +	bool is_source_subdev;
> >   	int ret;
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
> >   		return 0;
> >   	}
> >   

-- 
Regards,

Laurent Pinchart


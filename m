Return-Path: <linux-media+bounces-16790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B3495F10F
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC26E1F214B6
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7F1194090;
	Mon, 26 Aug 2024 12:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u8v4KdOp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D2E176AC1;
	Mon, 26 Aug 2024 12:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724674306; cv=none; b=kRaANaaYEnAxeGUQ8ihjZHz8CgSCg6mwtZJ/ewZ+I4rdJEvm1YMN3Afz3HfVKETMw+cB5/F/W+wKUkZq65mPHWFbw7RItd3VdMNHyFk9O7s7dFezyjxKOxVK/rENOHsqDYQq1hQeewLl1VlFaZp/Pw44inN8JnQSCkvvn193axE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724674306; c=relaxed/simple;
	bh=VTrV4YFQtl7OBEmz17iMIFfpO2cwgyZBKktqhPq+miM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afmdHdjHB8wXZpAXma4zShjcCX4voUapLljpQgwrYW5w4tM/0MHcpe3+nbiPfVZr2oEBqucUtldb0Mt+mS/FBYL+F9nXKHb74uszzD7nr5h1C51y9mUF76ExDonIHbWAOEptge2QwC39GgJbsJwc+ICm/WR6CTNtaImJQVSIS8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u8v4KdOp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EC7D741;
	Mon, 26 Aug 2024 14:10:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724674236;
	bh=VTrV4YFQtl7OBEmz17iMIFfpO2cwgyZBKktqhPq+miM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8v4KdOpnr7JJVEeL3asgUNHV1Eg5glVD4j414kxi2/6dyWrFYJjdnBaitAsusT1f
	 5s7gvMexsAF/6IWViqrn6CpZGn1n89tof3nh8lGceOFVuCHaspC278mo+SaupElS+0
	 uuEBfStOuXdLiHQY2M8RNjvXxt8v56RuGdgvYpaA=
Date: Mon, 26 Aug 2024 15:11:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 5/7] media: v4l2-subdev: Support hybrid links in
 v4l2_subdev_link_validate()
Message-ID: <20240826121138.GC27785@pendragon.ideasonboard.com>
References: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240822154531.25912-6-laurent.pinchart+renesas@ideasonboard.com>
 <5b1c9f47-3253-48b3-9a43-bd1a4a514caa@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5b1c9f47-3253-48b3-9a43-bd1a4a514caa@ideasonboard.com>

Hi Tomi,

On Mon, Aug 26, 2024 at 02:23:06PM +0300, Tomi Valkeinen wrote:
> On 22/08/2024 18:45, Laurent Pinchart wrote:
> > The v4l2_subdev_link_validate() helper function is meant to be used as a
> > drop-in implementation of a V4L2 subdev entity .link_validate() handler.
> > It supports subdev-to-subdev links only, and complains if one end of the
> > link is not a subdev. This forces drivers that have video output devices
> > connected to subdevs to implement a custom .link_validate() handler,
> > calling v4l2_subdev_link_validate() for the subdev-to-subdev links, and
> > performing manual link validation for the video-to-subdev links.
> > 
> > Video devices embed a media entity, and therefore also have a
> > .link_validate() operation. For video capture devices, the operation
> > should be manually implemented by drivers for validate the
> > subdev-to-video links. For video output devices, on the other hand, that
> > operation is never called, as link validation is performed in the
> > context of the sink entity.
> > 
> > As a result, we end up forcing drivers to implement a custom
> > .link_validate() handler for subdevs connected to video output devices,
> > when the video devices provide an operation that could be used for that
> > purpose.
> > 
> > To improve that situation, make v4l2_subdev_link_validate() delegate
> > link validation to the source's .link_validate() operation when the link
> > source is a video device and the link sink is a subdev. This allows
> > broader usage of v4l2_subdev_link_validate(), and simplifies drivers by
> > making video device link validation easy to implement in the video
> > device .link_validate(), regardless of whether the video device is an
> > output device or a capture device.
> 
> Maybe mention this patch in the previous patch's desc to answer the 
> question I sent =)

I'll do so.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >   drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++++++++++----
> >   include/media/v4l2-subdev.h           |  6 ++++
> >   2 files changed, 41 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index d3196042d5c5..32ffebae4d17 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1450,13 +1450,43 @@ int v4l2_subdev_link_validate(struct media_link *link)
> >   	if (WARN_ON_ONCE(!is_media_entity_v4l2_subdev(link->sink->entity)))
> >   		return -EINVAL;
> >   
> > -	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
> > -		pr_warn_once("source of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> > -			     link->source->entity->name, link->source->index,
> > -			     link->sink->entity->name, link->sink->index);
> > -		return 0;
> > +	/*
> > +	 * If the source is a video device, delegate link validation to it. This
> > +	 * allows usage of this helper for subdev connected to a video output
> > +	 * device, provided that the driver implement the video output device's
> > +	 * .link_validate() operation.
> > +	 */
> > +	if (is_media_entity_v4l2_video_device(link->source->entity)) {
> > +		struct media_entity *source = link->source->entity;
> > +
> > +		if (!source->ops || !source->ops->link_validate) {
> > +			/*
> > +			 * Many existing drivers do not implement the required
> > +			 * .link_validate() operation for their video devices.
> > +			 * Print a warning to get the drivers fixed, and return
> > +			 * 0 to avoid breaking userspace. This should
> > +			 * eventually be turned into a WARN_ON() when all
> > +			 * drivers will have been fixed.
> > +			 */
> > +			pr_warn_once("video device '%s' does not implement .link_validate(), driver bug!\n",
> > +				     source->name);
> > +			return 0;
> > +		}
> > +
> > +		/* Avoid infinite loops. */
> 
> Maybe this could elaborate a bit, and say that non-subdev drivers should 
> not use v4l2_subdev_link_validate, but some do (?) or might use it by 
> mistake, and this catches the driver bug.

I'll expand the comment to

                /*
                 * Avoid infinite loops in case a video device incorrectly uses
                 * this helper function as its .link_validate() handler.
                 */

> > +		if (WARN_ON(source->ops->link_validate == v4l2_subdev_link_validate))
> > +			return -EINVAL;
> 
> This might still be risky. The driver could implement its own validate, 
> which does some checks and then calls v4l2_subdev_link_validate(). But 
> I'm sure that'll get get noticed =).

Yes, that would still lead to an infinite loop, but there's only so much
we can do against foot-shooting.

> > +
> > +		return source->ops->link_validate(link);
> >   	}
> >   
> > +	/*
> > +	 * If the source is still not a subdev, usage of this helper is a clear
> > +	 * driver bug.
> > +	 */
> > +	if (WARN_ON(!is_media_entity_v4l2_subdev(link->source->entity)))
> > +		return -EINVAL;
> > +
> >   	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
> >   	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
> >   
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index bd235d325ff9..8daa0929865c 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1250,6 +1250,12 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
> >    * calls v4l2_subdev_link_validate_default() to ensure that
> >    * width, height and the media bus pixel code are equal on both
> >    * source and sink of the link.
> > + *
> > + * The function can be used as a drop-in &media_entity_ops.link_validate
> > + * implementation for v4l2_subdev instances. It supports all links between
> > + * subdevs, as well as links between subdevs and video devices, provided that
> > + * the video devices also implement their &media_entity_ops.link_validate
> > + * operation.
> >    */
> >   int v4l2_subdev_link_validate(struct media_link *link);
> >   

-- 
Regards,

Laurent Pinchart


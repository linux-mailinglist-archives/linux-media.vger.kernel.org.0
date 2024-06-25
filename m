Return-Path: <linux-media+bounces-14108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D46759169C8
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 16:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 842621F21D96
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 14:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C708315FA74;
	Tue, 25 Jun 2024 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gdlmujqM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A421B7F7;
	Tue, 25 Jun 2024 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719324193; cv=none; b=egcXXxsHlZ2ItkW4pMsPdnhrocXmBfHlLeJfLYTE9N2w089I40IDPzV2cE9XI+U+oD/zkfew7EpldD89tmfQyC+APiDIkxdcAfj4W0ZolobK1IDGsqLlBRR5gA14iduj0b5Zj5CLAd+ImxaqNsi4QS+52vhXFHBXloIQ7zjbD+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719324193; c=relaxed/simple;
	bh=V37rgaDjZ1ezglb3IQFrAF0GhRw76BLbLiVDqcYjFbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uU169+fEjEdtN0lTlUVFN3Z8By5f0e0DpvfRQH7MwZvfWodylq9TItpEvtm5QC8Sp1Ece1SrbHRTJdpcjp0HtWx6+nXMmfMQTygJntAN19SL1q81nasb4ARa0FrtDPUEznCoZXa4fGDKUTshDA7ePS+Jhyr1IY74LBxAQ4xZ2+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gdlmujqM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58408C62;
	Tue, 25 Jun 2024 16:02:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719324166;
	bh=V37rgaDjZ1ezglb3IQFrAF0GhRw76BLbLiVDqcYjFbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gdlmujqMN/D9EoYfUwffHVy69EpMvcCo3kiWYNJgZN1xjlyH+lBKXqLQ/CMDGh4Zl
	 AAoAqG6K7DxwDD4PwxF21mVdL7Z8jGvp5fdeoT56ZeCJZOMkzuX9BNpYCtCzDgLAgE
	 LibnCYH7W3rAQJOGhiu81njEVXnDpuxgiGpRVThM=
Date: Tue, 25 Jun 2024 17:02:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
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
Message-ID: <20240625140247.GC30459@pendragon.ideasonboard.com>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240619012356.22685-5-laurent.pinchart+renesas@ideasonboard.com>
 <ZncAJRoydaWoxGRj@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZncAJRoydaWoxGRj@valkosipuli.retiisi.eu>

On Sat, Jun 22, 2024 at 04:47:33PM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> Thanks for the patch.
> 
> On Wed, Jun 19, 2024 at 04:23:52AM +0300, Laurent Pinchart wrote:
> > The v4l2_subdev_link_validate() function prints a one-time warning if it
> > gets called on a link whose source or sink is not a subdev. As links get
> > validated in the context of their sink, a call to the helper when the
> > link's sink is not a subdev indicates that the driver has set its
> > .link_validate() handler to v4l2_subdev_link_validate() on a non-subdev
> > entity, which is a clear driver bug. On the other hand, the link's
> > source not being a subdev indicates that the helper is used for a subdev
> > connected to a video output device, which is a lesser issue, if only
> > because this is currently common practice.
> > 
> > There are no drivers left in the kernel that use
> > v4l2_subdev_link_validate() in a context where it may get called on a
> > non-subdev sink. Replace the pr_warn_once() with a WARN_ON() in this
> > case to make sure that new offenders won't be introduced.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 4f71199bf592..2d5e39c79620 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1451,11 +1451,15 @@ int v4l2_subdev_link_validate(struct media_link *link)
> >  	bool states_locked;
> >  	int ret;
> >  
> > -	if (!is_media_entity_v4l2_subdev(link->sink->entity) ||
> > -	    !is_media_entity_v4l2_subdev(link->source->entity)) {
> > -		pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> > -			     !is_media_entity_v4l2_subdev(link->sink->entity) ?
> > -			     "sink" : "source",
> > +	/*
> > +	 * Links are validated in the context of the sink entity. Usage of this
> > +	 * helper on a sink that is not a subdev is a clear driver bug.
> > +	 */
> > +	if (WARN_ON(!is_media_entity_v4l2_subdev(link->sink->entity)))
> > +		return -EINVAL;
> 
> WARN*() is nowadays deprecated.

Why so ? I've followed a recent discussion where some people pointed out
they disliked WARN*() due to panic-on-warn, but I didn't see any
conclusion there that deprecated WARN*().

> Could you continue to use pr_warn_once()
> for this (or dev_warn_one())?

I think a WARN_ON() is the right option here. A failure indicates a
clear driver bug, we should be as loud as possible to make sure it gets
noticed during development.

> > +
> > +	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
> > +		pr_warn_once("source of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> >  			     link->source->entity->name, link->source->index,
> >  			     link->sink->entity->name, link->sink->index);
> >  		return 0;

-- 
Regards,

Laurent Pinchart


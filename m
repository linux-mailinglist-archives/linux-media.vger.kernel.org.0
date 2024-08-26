Return-Path: <linux-media+bounces-16789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A536E95F062
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D460282CA8
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063ED16C84B;
	Mon, 26 Aug 2024 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N4OR7tvG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E196153BF0;
	Mon, 26 Aug 2024 12:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724673911; cv=none; b=liGct77B/YRN8NeTSalk+LHtvpWsj7tp8Ygvbi5UOcIJv+UZtiNTQnsgAWT1bteT3t+myOGskVqReqXA1RNPS+VT4QfqQ3ZwlACpFPJ4rGuutwQN5Gmg4TCCMeVPjvSV77Q0Vbhr2mIUgf6+AFWpwtbm14DpwrokPFDdiQTqb94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724673911; c=relaxed/simple;
	bh=4uDn1tuvtO4HsnO6l6017qHDCKJsSPGgFJFnhcjgzzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTwNHZRWwfOSxE6IS4XfO0C+A/jYiNsYNksXJKtY3y1GNn33l0YBG5+evUKf9KXn80Zw49fJUTpvxZ1MdXSuQHeQr7vzCN11FM//1lvmwtPh+6G7XagstcNsdxH3PeohH5Tb8dTeFvhUiIHLxgWZatUZ0iSoHxbqOwmDxW7DENI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N4OR7tvG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DAE96CA;
	Mon, 26 Aug 2024 14:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724673840;
	bh=4uDn1tuvtO4HsnO6l6017qHDCKJsSPGgFJFnhcjgzzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4OR7tvGX0wsgE3ic7wpYo7wg/VGxNnfvcMH3yYPIPl5iXw5NKdoHNP2BNI9X4u4e
	 7EixXW6Ek3qzYCb8bnrmmK8A8Q59qn00Cbf3u/THculVdHqnBs1PB8N0HvI3SJ1n3A
	 gEGz3mV/fa3rGM7/+awiH0Ngezpl8p3qYw2K2Eic=
Date: Mon, 26 Aug 2024 15:05:02 +0300
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
Subject: Re: [PATCH v2 4/7] media: v4l2-subdev: Refactor warnings in
 v4l2_subdev_link_validate()
Message-ID: <20240826120502.GB27785@pendragon.ideasonboard.com>
References: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240822154531.25912-5-laurent.pinchart+renesas@ideasonboard.com>
 <cd7d4f07-6d30-492b-b9ee-998b2528fd4d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd7d4f07-6d30-492b-b9ee-998b2528fd4d@ideasonboard.com>

Hi Tomi,

On Mon, Aug 26, 2024 at 02:10:57PM +0300, Tomi Valkeinen wrote:
> On 22/08/2024 18:45, Laurent Pinchart wrote:
> > The v4l2_subdev_link_validate() function prints a one-time warning if it
> > gets called on a link whose source or sink is not a subdev. As links get
> > validated in the context of their sink, a call to the helper when the
> > link's sink is not a subdev indicates that the driver has set its
> > .link_validate() handler to v4l2_subdev_link_validate() on a non-subdev
> > entity, which is a clear driver bug. On the other hand, the link's
> > source not being a subdev indicates that the helper is used for a subdev
> > connected to a video output device, which is a lesser issue, if only
> > because this is currently common practice.
> 
> Hmm, what does this mean... So we have a sink subdev, which might be 
> linked to a source subdev (in which case everything is fine), or it 
> might be linked to a non-subdev source.
> 
> Why is it a bug to be linked to a non-subdev source? And if it is a bug, 
> why is ok (only pr_warn_once)?
>
> > There are no drivers left in the kernel that use
> > v4l2_subdev_link_validate() in a context where it may get called on a
> > non-subdev sink. Replace the pr_warn_once() with a WARN_ON_ONCE() in
> > this case to make sure that new offenders won't be introduced.

I'll add here

A subsequent change will improve the v4l2_subdev_link_validate() helper
to properly support validating video device to subdev links.

> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Switch from WARN_ON() to WARN_ON_ONCE()
> > ---
> >   drivers/media/v4l2-core/v4l2-subdev.c | 14 +++++++++-----
> >   1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 7c5812d55315..d3196042d5c5 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1443,11 +1443,15 @@ int v4l2_subdev_link_validate(struct media_link *link)
> >   	bool states_locked;
> >   	int ret;
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
> > +	if (WARN_ON_ONCE(!is_media_entity_v4l2_subdev(link->sink->entity)))
> > +		return -EINVAL;
> > +
> > +	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
> > +		pr_warn_once("source of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> >   			     link->source->entity->name, link->source->index,
> >   			     link->sink->entity->name, link->sink->index);
> >   		return 0;

-- 
Regards,

Laurent Pinchart


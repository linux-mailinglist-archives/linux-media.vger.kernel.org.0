Return-Path: <linux-media+bounces-10663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C474B8BA842
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 10:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 013E91C21CA2
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 08:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477001487FE;
	Fri,  3 May 2024 08:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DA1OW72P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190FB148319;
	Fri,  3 May 2024 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714723386; cv=none; b=MxfUg87Q6C0Iwbm0+JiM9XIZw2d0kjlk3gHnULj/LA0jxYz88rQSbBJEAWit462Zy8gwUgbdDjL1P5WcpL9o9ewzlOd4RamD9STjFmfFO9dAwEuZhSBAR4PONPE8zg2u5L6QmyDYdzKhKZcEWERoZAH/sKigiqud1xG3dOpxSIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714723386; c=relaxed/simple;
	bh=IHiNKjI1oA3BZfnOTKr/dsKLKT3GfC+ysq78SIxZgfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qA2h0VpJx+iejg8TVtoes91o+TyKzZ+l/vorRPlc1EDMrf6sFJCjtC+pGTpRrNdHN0armdJ+Ut/tyC4/ipM/BKA+/lrrvVMXMrjZcUmDZJdIjsP8Z3QwPAagdCufH35fd+ncniTjp2NsLvElcYu1jegLXWcPLA/C2viushHEbII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DA1OW72P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0461DE45;
	Fri,  3 May 2024 10:02:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714723325;
	bh=IHiNKjI1oA3BZfnOTKr/dsKLKT3GfC+ysq78SIxZgfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DA1OW72PSZAYqSYFsb4EmXoFvULVnd7hoFb/JEpuOR9YI65kWdlZAq3llL9QYfZtM
	 3S72E1rcjdu8jTUVwEzYpRU59ojfDt0GZkUOuqGgXEE49D3r17yZn/N6hkUW/5Jpmz
	 ymwQqiKhC1ENKkK9YJ7oAANTfDiQLfpai3uNaH2g=
Date: Fri, 3 May 2024 10:02:59 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 05/19] media: adv748x: Implement set_routing()
Message-ID: <tons7mmyhbv5f7obb4k2wasfxp7ou36ebkkccnlu2yjyfypgum@tv5xaokpyqiv>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-6-jacopo.mondi@ideasonboard.com>
 <20240502174959.GK15807@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240502174959.GK15807@pendragon.ideasonboard.com>

Hi Laurent

On Thu, May 02, 2024 at 08:49:59PM GMT, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Apr 30, 2024 at 12:39:41PM +0200, Jacopo Mondi wrote:
> > Implement the set_routing() pad operation to control the MIPI CSI-2
> > Virtual Channel on which the video stream is sent on according to
> > the active route source stream number.
>
> While 01/19 needs to implement .init_state(), you should only initialize
> formats there. The routing initialization of 03/19 should be moved to
> this patch.
>

ok, even if I'm not sure I understand why routing initialization and
support for writing the routing table have to come together

> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/i2c/adv748x/adv748x-csi2.c | 43 +++++++++++++++++++++++-
> >  1 file changed, 42 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > index ace4e1d904d9..7fa72340e66e 100644
> > --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > @@ -57,6 +57,38 @@ static int adv748x_csi2_register_link(struct adv748x_csi2 *tx,
> >  	return 0;
> >  }
> >
> > +static int adv748x_csi2_apply_routing(struct v4l2_subdev *sd,
> > +				      struct v4l2_subdev_state *state,
> > +				      struct v4l2_subdev_krouting *routing)
> > +{
> > +	struct v4l2_subdev_route *route;
> > +	int ret;
> > +
> > +	/* Only one route at the time can be active. */
>
> s/the time/a time/
>
> > +	if (routing->num_routes > 1)
> > +		return -EINVAL;
>
> You should adjust routes instead of returning -EINVAL.
>
> > +
> > +	/*
> > +	 * Validate the route: sink pad and sink stream shall be 0 and only
> > +	 * 4 source streams are supported (one for each supported MIPI CSI-2
> > +	 * channel).
>
> s/channel/virtual channel/
>
> > +	 */
> > +	route = &routing->routes[0];
> > +
> > +	if (route->sink_pad != ADV748X_CSI2_SINK || route->sink_stream)
> > +		return -EINVAL;
> > +	if (route->source_pad != ADV748X_CSI2_SOURCE ||
> > +	    route->source_stream > 4)
> > +		return -EINVAL;
>
> Adjust instead of returning an error. The pad checks can be dropped, as
> the core ensures sink_pad and source_pad reference a valid sink and
> source pad respectively.
>

ack

> I'm not sure the source stream check is right either. I understand
> you'll use that to select a virtual channel, but the routing API isn't
> meant to let userspace configure virtual channel numbers explicitly.
>

Ok, this surprises me, more on the next patch

> > +
> > +	ret = v4l2_subdev_routing_validate(sd, routing,
> > +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return v4l2_subdev_set_routing(sd, state, routing);
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * v4l2_subdev_internal_ops
> >   */
> > @@ -79,7 +111,7 @@ static int adv748x_csi2_init_state(struct v4l2_subdev *sd,
> >  		.routes = routes,
> >  	};
> >
> > -	return v4l2_subdev_set_routing(sd, state, &routing);
> > +	return adv748x_csi2_apply_routing(sd, state, &routing);
> >  }
> >
> >  /*
> > @@ -200,10 +232,19 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
> >  	return 0;
> >  }
> >
> > +static int adv748x_csi2_set_routing(struct v4l2_subdev *sd,
> > +				    struct v4l2_subdev_state *state,
> > +				    enum v4l2_subdev_format_whence which,
> > +				    struct v4l2_subdev_krouting *routing)
> > +{
> > +	return adv748x_csi2_apply_routing(sd, state, routing);
> > +}
> > +
> >  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
> >  	.get_fmt = v4l2_subdev_get_fmt,
> >  	.set_fmt = adv748x_csi2_set_format,
> >  	.get_mbus_config = adv748x_csi2_get_mbus_config,
> > +	.set_routing = adv748x_csi2_set_routing,
> >  };
> >
> >  /* -----------------------------------------------------------------------------
>
> --
> Regards,
>
> Laurent Pinchart


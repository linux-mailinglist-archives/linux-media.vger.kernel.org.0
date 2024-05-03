Return-Path: <linux-media+bounces-10670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C18698BA8D2
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 10:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C13A1F229C4
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 08:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E70B14C58E;
	Fri,  3 May 2024 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GHX3BIFW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3C614A0BB;
	Fri,  3 May 2024 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714725126; cv=none; b=YOGYvYRYvfrLUWpU/sc6koSjLWcxkj5hWOfbDlsUVtz2DJk/g8phL30Pu5U9hZsdklhDU3LL/WgLg/XYbjPJggTkaXjkC5NFUdxPAFUw7r27CgDIit38j6x0V6GbhDkMfbsQ+GBeSkjFJBu1D2tsWSDd54yrfIPUaqil7wf/eFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714725126; c=relaxed/simple;
	bh=iQSJ5mndX9iYn2iN+0acCnBl//hkPBe1Qf2rBowlyN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPOvao/c0RODpp24Bf6Swn/FFG+hAiidUDG5SD8D8RCHBVYL99AGo2Kkbbidx5L/r1OuO39jfjUvj6Kq/3U2R9Oh7PEQ2Dxk808C0z2aXkpiGsLiUJPQtEE0Iws7HTRaxup52sgvsSej36YRiaeDNQ8Ryab5CTRbFvHOmPkDUZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GHX3BIFW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 378DC593;
	Fri,  3 May 2024 10:31:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714725065;
	bh=iQSJ5mndX9iYn2iN+0acCnBl//hkPBe1Qf2rBowlyN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GHX3BIFWD+3TfASJvv8jhmy+w5twd0cFInsXs1wklLDGG7s1oWLWC9oueC4d0O9Ob
	 kP4RyMl/uBOMj7XoOKHVRMBNxlS8Jjk8P/wwmis6r00WZlPqBwo69b5Gy9uQL4EnF3
	 Tbk/H7KjHQy8N+dlJEZCMDSwDndNVA5gScqOXChg=
Date: Fri, 3 May 2024 11:31:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/19] media: adv748x: Use V4L2 streams
Message-ID: <20240503083156.GP4959@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-4-jacopo.mondi@ideasonboard.com>
 <20240502174051.GI15807@pendragon.ideasonboard.com>
 <zn6rpirerkwdfuoeasduiupjiv43fawecj73tqquudya5mndxm@wgdwjjwcs6kj>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <zn6rpirerkwdfuoeasduiupjiv43fawecj73tqquudya5mndxm@wgdwjjwcs6kj>

Hi Jacopo,

On Fri, May 03, 2024 at 09:59:55AM +0200, Jacopo Mondi wrote:
> On Thu, May 02, 2024 at 08:40:51PM GMT, Laurent Pinchart wrote:
> > On Tue, Apr 30, 2024 at 12:39:39PM +0200, Jacopo Mondi wrote:
> > > Initialize the CSI-2 subdevice with the V4L2_SUBDEV_FL_STREAMS flag
> > > and initialize a simple routing table by implementing the .init_state()
> > > operation.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/adv748x/adv748x-csi2.c | 28 ++++++++++++++++++++++--
> > >  1 file changed, 26 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > index 60bf1dc0f58b..d929db7e8ef2 100644
> > > --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > @@ -59,7 +59,30 @@ static int adv748x_csi2_register_link(struct adv748x_csi2 *tx,
> > >
> > >  /* -----------------------------------------------------------------------------
> > >   * v4l2_subdev_internal_ops
> > > - *
> > > + */
> > > +
> > > +static int adv748x_csi2_init_state(struct v4l2_subdev *sd,
> > > +				   struct v4l2_subdev_state *state)
> > > +{
> > > +	struct v4l2_subdev_route routes[] = {
> > > +		{
> > > +			.sink_pad = ADV748X_CSI2_SINK,
> > > +			.sink_stream = 0,
> > > +			.source_pad = ADV748X_CSI2_SOURCE,
> > > +			.source_stream = 0,
> > > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > > +		},
> > > +	};
> > > +
> > > +	struct v4l2_subdev_krouting routing = {
> > > +		.num_routes = ARRAY_SIZE(routes),
> > > +		.routes = routes,
> > > +	};
> > > +
> > > +	return v4l2_subdev_set_routing(sd, state, &routing);
> >
> > You need to initialize formats too.
> >
> 
> The adv748x driver handles formats very poorly, doesn't implement
> enum_mbus_codes and does not allow userspace to change the format
> (while at the same time it doesn't check that the format is the
> expected one in set_format()).
> 
> This is from a freshly booted renesas-drivers/main
> 
> - entity 30: adv748x 4-0070 txa (2 pads, 3 links, 0 routes)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev5
>         pad0: Sink
>                 [stream:0 fmt:unknown/0x0]
>                 <- "adv748x 4-0070 afe":8 []
>                 <- "adv748x 4-0070 hdmi":1 [ENABLED]
>         pad1: Source
>                 [stream:0 fmt:unknown/0x0]
>                 -> "rcar_csi2 feaa0000.csi2":0 [ENABLED,IMMUTABLE]
> 
> It would probably be better to handle the formats properly and the
> introduce streams or use the introduction of streams to also fix the
> format handling ?

As Niklas pointed out in the review of some patches, fixing issues
first, and moving to the active subdev state, would be better done
before adding streams in my opinion. At least if those fixes are not too
difficult without streams.

For this specific patch, the addition of the .init_state() operation
should be squashed with 01/19, without routing, and routing should be
added on top.

> > > +}
> > > +
> > > +/*
> > >   * We use the internal registered operation to be able to ensure that our
> > >   * incremental subdevices (not connected in the forward path) can be registered
> > >   * against the resulting video path and media device.
> > > @@ -109,6 +132,7 @@ static int adv748x_csi2_registered(struct v4l2_subdev *sd)
> > >  }
> > >
> > >  static const struct v4l2_subdev_internal_ops adv748x_csi2_internal_ops = {
> > > +	.init_state = adv748x_csi2_init_state,
> >
> > The .init_state() operation needs to be provided along with the call to
> > v4l2_subdev_init_finalize() in patch 01/19.
> 
> I'll squash, however even if it might be a requirement for having a
> fully working implementation, not having init_state() will not lead to
> any crash and maybe smaller incremental patches are easier to handle.
> 
> 	if (sd->internal_ops && sd->internal_ops->init_state) {
> 		/*
> 		 * There can be no race at this point, but we lock the state
> 		 * anyway to satisfy lockdep checks.
> 		 */
> 		v4l2_subdev_lock_state(state);
> 		ret = sd->internal_ops->init_state(sd, state);
> 		v4l2_subdev_unlock_state(state);

I think it's a mistake in the core to not require .init_state() for
subdevs using the active state. Tomi, what do you think ?

> > >  	.registered = adv748x_csi2_registered,
> > >  };
> > >
> > > @@ -245,7 +269,7 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
> > >  		return 0;
> > >
> > >  	adv748x_subdev_init(&tx->sd, state, &adv748x_csi2_ops,
> > > -			    MEDIA_ENT_F_VID_IF_BRIDGE, 0,
> > > +			    MEDIA_ENT_F_VID_IF_BRIDGE, V4L2_SUBDEV_FL_STREAMS,
> > >  			    is_txa(tx) ? "txa" : "txb");
> > >
> > >  	/* Register internal ops for incremental subdev registration */

-- 
Regards,

Laurent Pinchart


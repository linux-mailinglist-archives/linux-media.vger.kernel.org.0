Return-Path: <linux-media+bounces-10662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAB08BA836
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 10:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBAEDB20D00
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 08:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D905148313;
	Fri,  3 May 2024 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RFhI/RM5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06E412B89;
	Fri,  3 May 2024 08:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714723202; cv=none; b=bY4nCJb58HMi/ooR6KmMKsOXEwG1qnwt72HnmVOLVcmKdM5F/1vxqvYumI9nAY+eGTN0wvUXYMDukCoJyxwrHlQwJOUqtLxdaGiRQRYEr2uvuv1J9LBl6eZcyuoozBdvMYNePBsLCi0SZG9AyQ2HGvpwBb9qoQkUEyYEsQNjvjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714723202; c=relaxed/simple;
	bh=OGboMZYvJlj2TN8jZj6DUiZXW/uMruP842RdNiLxUjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TH8MZhS2Ln3YoEt+5TJ5WXg240dDxBavWvZnde2RYb2SlAOe5hsnW+oEVLb7H843L0qawuphVFWRmfAQEXo737BLqyYlkzuLbGC3bCSgWeVWCycTOl7BJTKnfZTlyjUzQPIHkzd89soUtzescqWmrro9W5Wbg89dlC/A4eu2HZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RFhI/RM5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82B523A3;
	Fri,  3 May 2024 09:59:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714723140;
	bh=OGboMZYvJlj2TN8jZj6DUiZXW/uMruP842RdNiLxUjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFhI/RM5Ko31Z5cU5pW56KW45jIgC8jqbqb+65AQnYuRKpQ5PyMOZiZQJd14N6kUB
	 oV2Spt7jUbWtzw+/6Te6xics8FLnE0Ab3ZYHs2SP7NIMhMG6c/vmAf+TsLGsnX2alT
	 dmMSjUcj8+m2NPAnsn7gv5/FDqw5YqiIUGuni1NE=
Date: Fri, 3 May 2024 09:59:55 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/19] media: adv748x: Use V4L2 streams
Message-ID: <zn6rpirerkwdfuoeasduiupjiv43fawecj73tqquudya5mndxm@wgdwjjwcs6kj>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-4-jacopo.mondi@ideasonboard.com>
 <20240502174051.GI15807@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240502174051.GI15807@pendragon.ideasonboard.com>

Hi Laurent

On Thu, May 02, 2024 at 08:40:51PM GMT, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Apr 30, 2024 at 12:39:39PM +0200, Jacopo Mondi wrote:
> > Initialize the CSI-2 subdevice with the V4L2_SUBDEV_FL_STREAMS flag
> > and initialize a simple routing table by implementing the .init_state()
> > operation.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/i2c/adv748x/adv748x-csi2.c | 28 ++++++++++++++++++++++--
> >  1 file changed, 26 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > index 60bf1dc0f58b..d929db7e8ef2 100644
> > --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > @@ -59,7 +59,30 @@ static int adv748x_csi2_register_link(struct adv748x_csi2 *tx,
> >
> >  /* -----------------------------------------------------------------------------
> >   * v4l2_subdev_internal_ops
> > - *
> > + */
> > +
> > +static int adv748x_csi2_init_state(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_state *state)
> > +{
> > +	struct v4l2_subdev_route routes[] = {
> > +		{
> > +			.sink_pad = ADV748X_CSI2_SINK,
> > +			.sink_stream = 0,
> > +			.source_pad = ADV748X_CSI2_SOURCE,
> > +			.source_stream = 0,
> > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > +		},
> > +	};
> > +
> > +	struct v4l2_subdev_krouting routing = {
> > +		.num_routes = ARRAY_SIZE(routes),
> > +		.routes = routes,
> > +	};
> > +
> > +	return v4l2_subdev_set_routing(sd, state, &routing);
>
> You need to initialize formats too.
>

The adv748x driver handles formats very poorly, doesn't implement
enum_mbus_codes and does not allow userspace to change the format
(while at the same time it doesn't check that the format is the
expected one in set_format()).

This is from a freshly booted renesas-drivers/main

- entity 30: adv748x 4-0070 txa (2 pads, 3 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev5
        pad0: Sink
                [stream:0 fmt:unknown/0x0]
                <- "adv748x 4-0070 afe":8 []
                <- "adv748x 4-0070 hdmi":1 [ENABLED]
        pad1: Source
                [stream:0 fmt:unknown/0x0]
                -> "rcar_csi2 feaa0000.csi2":0 [ENABLED,IMMUTABLE]

It would probably be better to handle the formats properly and the
introduce streams or use the introduction of streams to also fix the
format handling ?

> > +}
> > +
> > +/*
> >   * We use the internal registered operation to be able to ensure that our
> >   * incremental subdevices (not connected in the forward path) can be registered
> >   * against the resulting video path and media device.
> > @@ -109,6 +132,7 @@ static int adv748x_csi2_registered(struct v4l2_subdev *sd)
> >  }
> >
> >  static const struct v4l2_subdev_internal_ops adv748x_csi2_internal_ops = {
> > +	.init_state = adv748x_csi2_init_state,
>
> The .init_state() operation needs to be provided along with the call to
> v4l2_subdev_init_finalize() in patch 01/19.
>

I'll squash, however even if it might be a requirement for having a
fully working implementation, not having init_state() will not lead to
any crash and maybe smaller incremental patches are easier to handle.

	if (sd->internal_ops && sd->internal_ops->init_state) {
		/*
		 * There can be no race at this point, but we lock the state
		 * anyway to satisfy lockdep checks.
		 */
		v4l2_subdev_lock_state(state);
		ret = sd->internal_ops->init_state(sd, state);
		v4l2_subdev_unlock_state(state);


> >  	.registered = adv748x_csi2_registered,
> >  };
> >
> > @@ -245,7 +269,7 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
> >  		return 0;
> >
> >  	adv748x_subdev_init(&tx->sd, state, &adv748x_csi2_ops,
> > -			    MEDIA_ENT_F_VID_IF_BRIDGE, 0,
> > +			    MEDIA_ENT_F_VID_IF_BRIDGE, V4L2_SUBDEV_FL_STREAMS,
> >  			    is_txa(tx) ? "txa" : "txb");
> >
> >  	/* Register internal ops for incremental subdev registration */
> > --
> > 2.44.0
> >
>
> --
> Regards,
>
> Laurent Pinchart


Return-Path: <linux-media+bounces-8638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E80889852A
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 12:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7586B24634
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 10:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7197F7E2;
	Thu,  4 Apr 2024 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PwMiPh5F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC907602F
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 10:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712226905; cv=none; b=d/yezEl9p8c8MuNx5kEVS3dXUsrKhxKDfrAF7YGWJTmOSIEYyFg00uZGNRPIKb+DRqu1mBeFsMWYBDKzQfcahjOPphC6BF4TALH2wTkXZ7Zuo1EQNfajFyJkfJhjo/pSC/8LxRqqBhmhQe+Mo8wNKbD/xe4SDoALwZsmyr4PdZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712226905; c=relaxed/simple;
	bh=hYEFaaK4ObjBQAnAuyyBa1FE60rJK1+mjXqanvg4c/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9NGYhKO82XkJtvRMIH4u3PiHVulCKmLgt7/YVwGIlTVolMnX08r/rjNKi4gSsnYffJURhSdv8ZAkmhrx6SeBCK2mR5VoUA30M3pXVUIgX9xXkwY66Q7EajeeH6aHO7o1mNtJfSTwZ7VqKbM8tWZY+vIIxGenWCxgzX+E0niBrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PwMiPh5F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0253D1A2;
	Thu,  4 Apr 2024 12:34:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712226863;
	bh=hYEFaaK4ObjBQAnAuyyBa1FE60rJK1+mjXqanvg4c/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PwMiPh5FpJR0tPpjMHzPf4YpNn1oBdMzH7yQ0TPr0U9u6x1xD4UQ2w+bZH8I3kg70
	 foH35VVSJQ/cF6hbeb2Z96JVcOSJ8p3vPZrcy5x+M/JWb/9FimAh/7O+Ctgy6xhInI
	 cxWL9T6VE+HXbsAWSo9IzW5yFOKecC/NbWpdVT/4=
Date: Thu, 4 Apr 2024 13:34:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>, kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v7 03/15] media: i2c: imx219: Report internal routes to
 userspace
Message-ID: <20240404103449.GO23803@pendragon.ideasonboard.com>
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
 <20240324220854.15010-4-laurent.pinchart@ideasonboard.com>
 <b0a698f5-9c5c-456c-8e3d-1a3cd1628dc3@ideasonboard.com>
 <Zg5k8Ont0rf5D7xy@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zg5k8Ont0rf5D7xy@kekkonen.localdomain>

Moikka,

On Thu, Apr 04, 2024 at 08:29:36AM +0000, Sakari Ailus wrote:
> On Thu, Apr 04, 2024 at 11:19:22AM +0300, Tomi Valkeinen wrote:
> > On 25/03/2024 00:08, Laurent Pinchart wrote:
> > > Usage of internal pads creates a route internal to the subdev, and the
> > > V4L2 camera sensor API requires such routes to be reported to userspace.
> > > Create the route in the .init_state() operation.
> > > 
> > > Internal routing support requires stream support, so set the
> > > V4L2_SUBDEV_FL_HAS_STREAMS flag and switch formats and selection
> > 
> > It's V4L2_SUBDEV_FL_STREAMS (not sure why, as the other flags have _HAS_).
> 
> Didn't you write the patch to add the flag? :-)
> 
> In any case, I think the flat is used for a very similar purpose than the
> rest, I'd add "HAS_" here, too. I can write a patch.

I'll review it :-)

> > > rectangles access from pads to streams. As the route is immutable,
> > > there's no need to implement the .set_routing() operation, and we can
> > > hardcode the sink and source stream IDs to 0.
> > 
> > This doesn't implement .enable/disable_streams(), but continues using
> > .s_stream(). My understanding was that streams support requires
> > .enable/disable_streams(), but obviously the framework doesn't require this
> > at the moment.
> > 
> > I encountered this while working on improving the
> > v4l2_subdev_enable/disable_streams(), and my code assumed that only
> > implementing .s_stream() means no streams support.
> > 
> > So, how is it?
> > 
> > I would say that .s_stream() is legacy, and streams enabled subdevices
> > should not implement (only) it. Streams enabled subdevices can use
> > v4l2_subdev_s_stream_helper for .s_stream, in addition to implementing
> > .enable/disable_streams().
> 
> I agree, if the driver supports streams, then it needs to implement the
> appropriate callbacks (i.e. not s_stream).

Works for me.

> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > > Changes since v6:
> > > 
> > > - Drop change to get format API in imx219_set_ctrl()
> > > - Fix function name in commit message
> > > - Set V4L2_SUBDEV_ROUTE_FL_IMMUTABLE flag on route
> > > ---
> > >   drivers/media/i2c/imx219.c | 24 +++++++++++++++++++++++-
> > >   1 file changed, 23 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index 817bf192e4d9..6602250834be 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -993,15 +993,36 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> > >   static int imx219_init_state(struct v4l2_subdev *sd,
> > >   			     struct v4l2_subdev_state *state)
> > >   {
> > > +	struct v4l2_subdev_route routes[1] = {
> > > +		{
> > > +			.sink_pad = IMX219_PAD_IMAGE,
> > > +			.sink_stream = 0,
> > > +			.source_pad = IMX219_PAD_SOURCE,
> > > +			.source_stream = 0,
> > > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> > > +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
> > > +		},
> > > +	};
> > > +	struct v4l2_subdev_krouting routing = {
> > > +		.len_routes = ARRAY_SIZE(routes),
> > > +		.num_routes = ARRAY_SIZE(routes),
> > > +		.routes = routes,
> > > +	};
> > >   	struct v4l2_subdev_format fmt = {
> > >   		.which = V4L2_SUBDEV_FORMAT_TRY,
> > >   		.pad = IMX219_PAD_SOURCE,
> > > +		.stream = 0,
> > >   		.format = {
> > >   			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> > >   			.width = supported_modes[0].width,
> > >   			.height = supported_modes[0].height,
> > >   		},
> > >   	};
> > > +	int ret;
> > > +
> > > +	ret = v4l2_subdev_set_routing(sd, state, &routing);
> > > +	if (ret)
> > > +		return ret;
> > >   	imx219_set_pad_format(sd, state, &fmt);
> > > @@ -1260,7 +1281,8 @@ static int imx219_probe(struct i2c_client *client)
> > >   	/* Initialize subdev */
> > >   	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > -			    V4L2_SUBDEV_FL_HAS_EVENTS;
> > > +			    V4L2_SUBDEV_FL_HAS_EVENTS |
> > > +			    V4L2_SUBDEV_FL_STREAMS;
> > >   	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > >   	/*

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-6350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF79870128
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 13:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB1C91C21AD8
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 12:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC213BB51;
	Mon,  4 Mar 2024 12:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T+QaoIf4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4365E3BB3E
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709554966; cv=none; b=e0g6TIu4ToSPC6tnU3actpohhJfNlS0RcBl03bsGs4/4pt3QGD9ePR2+mRyttSsH15W+zZwQ3ULlQcO3T0HVE7a8BkHlgxUmLmo9qYxxo1ftMNQYmzbVmDlRGWIdIsMyDrnbu4PFaE3MBHq2EtjUekvcs6dNkE5oZOnB3CZLUl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709554966; c=relaxed/simple;
	bh=aN+wG4QpinMjmBL3g0GTDE8gh31Lbqki9iymUsiGPTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npUMOXhUcSesjecRkS6sMUdnWORBTCWgpGh+pJBhpXRCB9T3aY3xUufsHuAapFakmGw6ZzCNfaL9U3SCC8uT4p8nwxR9jBf+XwGtMkFPdS2khyd+QJiYouh/YG1pE/8k0N0PAiO99kyNOuWzL+eXBL3GPE0kC9P1TAILbnUE8wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T+QaoIf4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D58333871;
	Mon,  4 Mar 2024 13:22:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709554946;
	bh=aN+wG4QpinMjmBL3g0GTDE8gh31Lbqki9iymUsiGPTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+QaoIf4IRjWNIxYStsYg01UsiRlwqmpa5rGuvG20u70DYGx9MiUjA67ubAhWvTJq
	 uRU0516vFt+/yhz2LYIS/xH1mi/BNkgsLPESCezavH3GDDbc+BoRL9kwsb9Vs76mIE
	 YoKhItra8nT8mZw77lZT9kUr+jzfkE4y57cxIIao=
Date: Mon, 4 Mar 2024 14:22:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v6 03/15] media: i2c: imx219: Report internal routes to
 userspace
Message-ID: <20240304122243.GA21608@pendragon.ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-4-laurent.pinchart@ideasonboard.com>
 <4xorn6jhgjgdyzqnzt5kwtb6goej2a25yfyazd7gnxwzneiu7i@h4zyrdy7gvaw>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4xorn6jhgjgdyzqnzt5kwtb6goej2a25yfyazd7gnxwzneiu7i@h4zyrdy7gvaw>

Hi Jacopo,

On Mon, Mar 04, 2024 at 10:30:34AM +0100, Jacopo Mondi wrote:
> On Fri, Mar 01, 2024 at 11:32:18PM +0200, Laurent Pinchart wrote:
> > Usage of internal pads creates a route internal to the subdev, and the
> > V4L2 camera sensor API requires such routes to be reported to userspace.
> > Create the route in the .init_cfg() operation.
> 
> It's now "init_state()"

Oops. Will fix.

> > Internal routing support requires stream support, so set the
> > V4L2_SUBDEV_FL_HAS_STREAMS flag and switch formats and selection
> > rectangles access from pads to streams. As the route is immutable,
> > there's no need to implement the .set_routing() operation, and we can
> > hardcode the sink and source stream IDs to 0.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 28 ++++++++++++++++++++++++++--
> >  1 file changed, 26 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 817bf192e4d9..52afb821f667 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -381,7 +381,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	int ret = 0;
> >
> >  	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> > -	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> > +
> > +	format = v4l2_subdev_state_get_opposite_stream_format(state,
> > +							      IMX219_PAD_IMAGE,
> > +							      0);
> 
> Is this change necessary ?

Now that we have routes, we need to get the format on the right stream.
There's only one at the moment, so there's no need to change it here.
I'll drop this change and update patch 05/15 accordingly.

> Apart from this
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> >
> >  	if (ctrl->id == V4L2_CID_VBLANK) {
> >  		int exposure_max, exposure_def;
> > @@ -993,15 +996,35 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> >  static int imx219_init_state(struct v4l2_subdev *sd,
> >  			     struct v4l2_subdev_state *state)
> >  {
> > +	struct v4l2_subdev_route routes[1] = {
> > +		{
> > +			.sink_pad = IMX219_PAD_IMAGE,
> > +			.sink_stream = 0,
> > +			.source_pad = IMX219_PAD_SOURCE,
> > +			.source_stream = 0,
> > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > +		},
> > +	};
> > +	struct v4l2_subdev_krouting routing = {
> > +		.len_routes = ARRAY_SIZE(routes),
> > +		.num_routes = ARRAY_SIZE(routes),
> > +		.routes = routes,
> > +	};
> >  	struct v4l2_subdev_format fmt = {
> >  		.which = V4L2_SUBDEV_FORMAT_TRY,
> >  		.pad = IMX219_PAD_SOURCE,
> > +		.stream = 0,
> >  		.format = {
> >  			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> >  			.width = supported_modes[0].width,
> >  			.height = supported_modes[0].height,
> >  		},
> >  	};
> > +	int ret;
> > +
> > +	ret = v4l2_subdev_set_routing(sd, state, &routing);
> > +	if (ret)
> > +		return ret;
> >
> >  	imx219_set_pad_format(sd, state, &fmt);
> >
> > @@ -1260,7 +1283,8 @@ static int imx219_probe(struct i2c_client *client)
> >
> >  	/* Initialize subdev */
> >  	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > -			    V4L2_SUBDEV_FL_HAS_EVENTS;
> > +			    V4L2_SUBDEV_FL_HAS_EVENTS |
> > +			    V4L2_SUBDEV_FL_STREAMS;
> >  	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> >
> >  	/*

-- 
Regards,

Laurent Pinchart


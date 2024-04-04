Return-Path: <linux-media+bounces-8623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 512B1898328
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 10:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7178C1C26CD7
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 08:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B15E6CDAB;
	Thu,  4 Apr 2024 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NO20wOOd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D648B101E6
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712219391; cv=none; b=cklhcgD8THKMSIlZV+6Uhqa5jC4D0N4ykzk+U1vRwu0Af3gMRUXORoh0BbCfs1qWInnqSlRhr6/IKqWwIPfwBHQZoO5eU6t22CKTRxRVeVWo2TgNvLZ0GM1AT/Ohew/2BQXSJ82nY/uIKjYaM1EGI8kxP7kXTgTtZDJ0lHnBNxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712219391; c=relaxed/simple;
	bh=Dn+bKZQXA81M3w+MTvTKOgV0Gs8mbiUu+YBEWpMmcuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snWD/6y6zQQemdnhUhBYDOjthlHrG7xkdjGqnJUewT1St19G1RjT1/l014/Tws34RAmUO0Xr8Muz+MhMA8PLJ8E0nc20s/2SLC1MO5SROI2qvQVjNeyeo/dbdYXa/+rAQQxDYLolwsjtusxPP5pk65wS/nkHk/1cmfyz4FX+ml4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NO20wOOd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712219384; x=1743755384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dn+bKZQXA81M3w+MTvTKOgV0Gs8mbiUu+YBEWpMmcuo=;
  b=NO20wOOdB1+DLoRQFms3vN0IQ7dePiaheRivPnaRGI4Z2uK8dUKZ2Z5D
   pTeBVaVjQRtWb8flNyYI7hCSwnZyMUZqC5PlFt1Q31EZc4lrAjOycgRyB
   pWRRVJvkcA5AzbOZ4US4xSwRyxXISi3yoDCQWEWmwXj3xIGi5PwBhi3uC
   UGgrHvJrjfk+RHthZnm/EI5YynFbcycdRzvkotMQIELpZbEbpoC4eJ8RL
   Xp0Y4zfkouu5SqOtslswdb+xY1nISGwgy5aDkvR0ivD9y2bYdvTUFRMYa
   Q7t2VEMCqrjNBY6+f1w32ld8Qd28/lzRQSP8mJZlm0xwSII8WzwpLC4bO
   A==;
X-CSE-ConnectionGUID: PMevSyrCQw6Eu7DZK6PIcg==
X-CSE-MsgGUID: oNIUH0U4R0qbB5BcpkarwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18841999"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="18841999"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:29:43 -0700
X-CSE-ConnectionGUID: c0x9x/+9RmCwKf7csRbg1Q==
X-CSE-MsgGUID: w4QfMWWfRBe1PhUIvC+LQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23397885"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:29:40 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CABDA11F82F;
	Thu,  4 Apr 2024 11:29:36 +0300 (EEST)
Date: Thu, 4 Apr 2024 08:29:36 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <Zg5k8Ont0rf5D7xy@kekkonen.localdomain>
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
 <20240324220854.15010-4-laurent.pinchart@ideasonboard.com>
 <b0a698f5-9c5c-456c-8e3d-1a3cd1628dc3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0a698f5-9c5c-456c-8e3d-1a3cd1628dc3@ideasonboard.com>

Moi,

On Thu, Apr 04, 2024 at 11:19:22AM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 25/03/2024 00:08, Laurent Pinchart wrote:
> > Usage of internal pads creates a route internal to the subdev, and the
> > V4L2 camera sensor API requires such routes to be reported to userspace.
> > Create the route in the .init_state() operation.
> > 
> > Internal routing support requires stream support, so set the
> > V4L2_SUBDEV_FL_HAS_STREAMS flag and switch formats and selection
> 
> It's V4L2_SUBDEV_FL_STREAMS (not sure why, as the other flags have _HAS_).

Didn't you write the patch to add the flag? :-)

In any case, I think the flat is used for a very similar purpose than the
rest, I'd add "HAS_" here, too. I can write a patch.

> 
> > rectangles access from pads to streams. As the route is immutable,
> > there's no need to implement the .set_routing() operation, and we can
> > hardcode the sink and source stream IDs to 0.
> 
> This doesn't implement .enable/disable_streams(), but continues using
> .s_stream(). My understanding was that streams support requires
> .enable/disable_streams(), but obviously the framework doesn't require this
> at the moment.
> 
> I encountered this while working on improving the
> v4l2_subdev_enable/disable_streams(), and my code assumed that only
> implementing .s_stream() means no streams support.
> 
> So, how is it?
> 
> I would say that .s_stream() is legacy, and streams enabled subdevices
> should not implement (only) it. Streams enabled subdevices can use
> v4l2_subdev_s_stream_helper for .s_stream, in addition to implementing
> .enable/disable_streams().

I agree, if the driver supports streams, then it needs to implement the
appropriate callbacks (i.e. not s_stream).

> 
>  Tomi
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> > Changes since v6:
> > 
> > - Drop change to get format API in imx219_set_ctrl()
> > - Fix function name in commit message
> > - Set V4L2_SUBDEV_ROUTE_FL_IMMUTABLE flag on route
> > ---
> >   drivers/media/i2c/imx219.c | 24 +++++++++++++++++++++++-
> >   1 file changed, 23 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 817bf192e4d9..6602250834be 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -993,15 +993,36 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> >   static int imx219_init_state(struct v4l2_subdev *sd,
> >   			     struct v4l2_subdev_state *state)
> >   {
> > +	struct v4l2_subdev_route routes[1] = {
> > +		{
> > +			.sink_pad = IMX219_PAD_IMAGE,
> > +			.sink_stream = 0,
> > +			.source_pad = IMX219_PAD_SOURCE,
> > +			.source_stream = 0,
> > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> > +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
> > +		},
> > +	};
> > +	struct v4l2_subdev_krouting routing = {
> > +		.len_routes = ARRAY_SIZE(routes),
> > +		.num_routes = ARRAY_SIZE(routes),
> > +		.routes = routes,
> > +	};
> >   	struct v4l2_subdev_format fmt = {
> >   		.which = V4L2_SUBDEV_FORMAT_TRY,
> >   		.pad = IMX219_PAD_SOURCE,
> > +		.stream = 0,
> >   		.format = {
> >   			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> >   			.width = supported_modes[0].width,
> >   			.height = supported_modes[0].height,
> >   		},
> >   	};
> > +	int ret;
> > +
> > +	ret = v4l2_subdev_set_routing(sd, state, &routing);
> > +	if (ret)
> > +		return ret;
> >   	imx219_set_pad_format(sd, state, &fmt);
> > @@ -1260,7 +1281,8 @@ static int imx219_probe(struct i2c_client *client)
> >   	/* Initialize subdev */
> >   	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > -			    V4L2_SUBDEV_FL_HAS_EVENTS;
> > +			    V4L2_SUBDEV_FL_HAS_EVENTS |
> > +			    V4L2_SUBDEV_FL_STREAMS;
> >   	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> >   	/*
> 

-- 
Terveisin,

Sakari Ailus


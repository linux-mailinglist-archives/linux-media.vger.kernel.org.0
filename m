Return-Path: <linux-media+bounces-11334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ECA8C27C0
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 990F91C20481
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1F0172BC6;
	Fri, 10 May 2024 15:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oaKJw+K5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E89C173348;
	Fri, 10 May 2024 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715354865; cv=none; b=stNQWdTpQgIa9JzOtvh74ZRPzwyR2s4uEdtjjJmppXVPxpkDxnWmDHs/YrJjWYGil+p+55sdLIzSHjt+kAPzCY6VoQ26uiBKIkGV2ppH1uoxIGf7hbdF37KGE4M3GlxWuw+42KA+xhxAdPRZugkluOYtIvrx48qHNfRvMy8z3Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715354865; c=relaxed/simple;
	bh=HtbqmLUZz/ngyjRLWPxq0lgnSYUAb9OCTTlLybCIDZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKQ1QA/T9IuQfJYPcDXYvuqAkX34Ogz0Dl+aIBp6u3wBKxpzORPiiDabbhY1ACotVegVpILonvcVZ4mZCRzQbmgWidnboeffQ1QSGxX2GJbXglYZSsOOrwHCDLbd+qy7MiNGoMKHW0wU62uVEdd1LSfB8thzosHEme4sEcOJHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oaKJw+K5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B6639EC;
	Fri, 10 May 2024 17:27:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715354848;
	bh=HtbqmLUZz/ngyjRLWPxq0lgnSYUAb9OCTTlLybCIDZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oaKJw+K5hNcs4YE5Iw8FSMvpMH0SqskSvg2n2jxT3Dtp+Ur+5iFo7nAMWqdX7jKYe
	 e82NhLLKL0OTrLm9Fyul4UDf7hLAOE1Pa943/neZJJc3KF7PxBGRcBcMlWntMisEAt
	 REnlXZGsZYb4Jn0jnQCWf8S3M7HdrEPM7fncdxuU=
Date: Fri, 10 May 2024 18:27:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Store format in subdev active
 state
Message-ID: <20240510152724.GB17158@pendragon.ideasonboard.com>
References: <20240510100347.102392-1-niklas.soderlund+renesas@ragnatech.se>
 <20240510101340.GG6407@pendragon.ideasonboard.com>
 <20240510103656.GB2165064@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510103656.GB2165064@ragnatech.se>

Hi Niklas,

On Fri, May 10, 2024 at 12:36:56PM +0200, Niklas Söderlund wrote:
> On 2024-05-10 13:13:40 +0300, Laurent Pinchart wrote:
> > On Fri, May 10, 2024 at 12:03:47PM +0200, Niklas Söderlund wrote:
> > > Create and store the subdevice format in the subdevices active state.
> > > This change do not have a huge effect on the driver as it do not yet
> > > support changing the format.
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > > Hello,
> > > 
> > > This change is mostly to align all driver used in the R-Car VIN pipeline
> > > to use the same set of API and to make it easier to extend them in
> > > tandem going forward.
> > > 
> > > This should be seen as a compliment to Jacopo's larger work in "[PATCH
> > > v3 00/11] media: renesas: rcar-csi2: Use the subdev active state" which
> > > updates other drivers in the VIN pipeline to use the active state.
> > > ---
> > >  drivers/staging/media/max96712/max96712.c | 36 +++++++++++++++++------
> > >  1 file changed, 27 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> > > index c44145284aa1..2da65ccd2c57 100644
> > > --- a/drivers/staging/media/max96712/max96712.c
> > > +++ b/drivers/staging/media/max96712/max96712.c
> > > @@ -242,21 +242,34 @@ static const struct v4l2_subdev_video_ops max96712_video_ops = {
> > >  	.s_stream = max96712_s_stream,
> > >  };
> > >  
> > > -static int max96712_get_pad_format(struct v4l2_subdev *sd,
> > > -				   struct v4l2_subdev_state *sd_state,
> > > -				   struct v4l2_subdev_format *format)
> > > +static int max96712_init_state(struct v4l2_subdev *sd,
> > > +			       struct v4l2_subdev_state *state)
> > >  {
> > > -	format->format.width = 1920;
> > > -	format->format.height = 1080;
> > > -	format->format.code = MEDIA_BUS_FMT_RGB888_1X24;
> > > -	format->format.field = V4L2_FIELD_NONE;
> > > +	static const struct v4l2_mbus_framefmt default_fmt = {
> > > +		.width          = 1920,
> > > +		.height         = 1080,
> > > +		.code           = MEDIA_BUS_FMT_RGB888_1X24,
> > > +		.colorspace     = V4L2_COLORSPACE_SRGB,
> > > +		.field          = V4L2_FIELD_NONE,
> > > +		.ycbcr_enc      = V4L2_YCBCR_ENC_DEFAULT,
> > > +		.quantization   = V4L2_QUANTIZATION_DEFAULT,
> > > +		.xfer_func      = V4L2_XFER_FUNC_DEFAULT,
> > > +	};
> > > +	struct v4l2_mbus_framefmt *fmt;
> > > +
> > > +	fmt = v4l2_subdev_state_get_format(state, 0);
> > > +	*fmt = default_fmt;
> > >  
> > >  	return 0;
> > >  }
> > >  
> > > +static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
> > > +	.init_state = max96712_init_state,
> > > +};
> > > +
> > >  static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
> > > -	.get_fmt = max96712_get_pad_format,
> > > -	.set_fmt = max96712_get_pad_format,
> > > +	.get_fmt = v4l2_subdev_get_fmt,
> > > +	.set_fmt = v4l2_subdev_get_fmt,
> > >  };
> > >  
> > >  static const struct v4l2_subdev_ops max96712_subdev_ops = {
> > > @@ -293,6 +306,7 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
> > >  	long pixel_rate;
> > >  	int ret;
> > >  
> > > +	priv->sd.internal_ops = &max96712_internal_ops;
> > >  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96712_subdev_ops);
> > >  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > >  	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> > > @@ -324,6 +338,10 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
> > >  
> > >  	v4l2_set_subdevdata(&priv->sd, priv);
> > >  
> > 
> > I think it would be nice to already use the control handler lock as the
> > active state lock. Apart from that, the patch looks good to me.
> 
> I also worked on this to learn a bit more about the active state API. I 
> assume what you are asking for here is ?
> 
>     priv->sd.state_lock = priv->ctrl_handler.lock;

That's right.

> What is the rational for using the control handler lock over the default 
> state lock?

When there are interactions between controls and formats, using separate
locks can lead to AB/BA deadlocks if you need to access controls from a
context where the state is locked (e.g. calling
v4l2_ctrl_handler_setup() at stream enable time), and access the active
state from a context where the control handler is locked (e.g. accessing
the state in .s_ctrl()). Using the same lock helps there, you can then
call __v4l2_ctrl_handler_setup() at stream enable time, and get the
state without locking it in .s_ctrl().

At some point in the not too distant future I would like to move storage
of controls to the state. I don't know how painful that will be though,
the control framework has grown to be a very complex beast, with lots of
features that are not useful for MC-based drivers (such as control
handler inheritance). I'm worried that we'll need a full rewrite...
We'll see :-)

> I checked Jacopo's series when working on this and there he 
> uses no lock for the R-Car CSI-2 driver and a private driver global 
> state lock for ADV748x.

For the CSI-2 RX driver, that's because it doesn't have a control
handler. For the ADV748x driver, that's because the control handler is
configured to use the device-wide mutex.

> > > +	ret = v4l2_subdev_init_finalize(&priv->sd);
> > > +	if (ret)
> > > +		goto error;
> > > +
> > >  	ret = v4l2_async_register_subdev(&priv->sd);
> > >  	if (ret < 0) {
> > >  		dev_err(&priv->client->dev, "Unable to register subdevice\n");

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-11310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2228C2246
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 12:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DCFB1C21994
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4C4161328;
	Fri, 10 May 2024 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="hGRornFA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KNIx4kEe"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3C1364;
	Fri, 10 May 2024 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715337424; cv=none; b=f9wcC0fjBZlnBOdlpRq7LcIR/COWMzJwTZwf7y3jI53LbvEvA8aFn3q30v1cfE2lALCvgVIuxCfuk8aAarysls9GoSHZw1j5roVAPwUg0LqedxlSBKZ0cjW+V/FiPhNcrmStpiV0wqV0uAsQqLoUM5RW6jDUrG6Yu2lrWWs1faE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715337424; c=relaxed/simple;
	bh=r4vlle9Q4FBfYXrlUcWN+QXO6xywT5pj1pyhtpsJ9E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2j9084tmlg+8sR7369ZSSEwE9kGB4DrQJjA/vvMYfZFIlw7Zjzu55gH9CSZnroOubrNwZK9RskISNQ7uy63jHo53vtIbwrHzVfpUa9KpVkJeX5EO0lA4dQmjGdVL09yRnAvz6ZO0IdQxd4at2LoF5Vxu1PKJgg82ObKby0Vaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hGRornFA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KNIx4kEe; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id 7E19B180008D;
	Fri, 10 May 2024 06:36:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 10 May 2024 06:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715337419;
	 x=1715423819; bh=a6SzMKs+Z1WRrGQJpaTEfFEyTutJDtN23fi5/2iHtRg=; b=
	hGRornFAdAw+shjFh/OJjggz+InUN4Og/GwS61RPD8rpCzqMmCbcR9/xoOUGl3dF
	42f5Aa5vYS7eVHijjo8IzRGq5Vkuj2vcnZhEQ8rDNhXxvwkKyxLGjk96bLAIgQWu
	v/LgoHCcfoF4cieGP8OGMiy3gkBUjswE2h4n+TVlP3LN7SHSLpq/ZAn5qok4P53w
	w/J7J9B+FZ3avg7eYP5iujhdhS/rtea9u8Q6cGcsgzL1PENhnrbNCkyiJ+O1Eu3l
	u5N6unkqnD2ooLYoR/Y0sz5jrOR0JuFpQ/qKQ51o/oI2ak76xNie3gIp167/1aFF
	gG6Lq8YdBTkeTtPzub5TTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715337419; x=
	1715423819; bh=a6SzMKs+Z1WRrGQJpaTEfFEyTutJDtN23fi5/2iHtRg=; b=K
	NIx4kEeLXbChZE4+Y+AigXr9HUyb8VOJzHXQdAHkfjoZv7vRXVJUUj2EZpnBw5Ei
	1ytapo61Qg3Goxt8O44mAlon41t+OuJdOv4aZI2lWFrFLA/fDNDwsAjz+I5d9J61
	suzlTAhEtpFgTuUK2HXkt4YfKjT1t9UlA9gMYoXwzP+pJ0FLpBv9HTpKteB+h47m
	gxGrJn+MvMmBGypGLEtSnh6DCVwTERhgMSPMryrjgOCVpcNzOD4wOtO5mRaPq7LA
	dRBdIYKtRvjf4iP4uy4HbZuXdZM7GAr2cR+HtHrCTR54yeoYpG0AiDbC67eHuF+L
	YSmZPdZRU5X2TroHtojQg==
X-ME-Sender: <xms:yvg9ZuNzpg71JVukbMpvkhD9rMLj-AH_RbU7J8l8YhG_04onvAu-5Q>
    <xme:yvg9Zs9lN8AGS1o5ObIzorgDaYcQqRTP4tgteguL6yeULiABycSVbDu_H_BCtQtBW
    74eDPh7uKfJb2R3qz0>
X-ME-Received: <xmr:yvg9ZlSrQvEe7sb5N841Z54LxVFdlTei4AItd8ZxohwjAWfYsK8eoIm4JubAy73mupt9zcnRgy7EwhR8XoEWLjSOXLACVxE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefkedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:yvg9ZuvWo63nEFrbTpzfXtSjsr_emTD_tUDtVm6iWox6o3KI3XDv7A>
    <xmx:yvg9ZmdowUjAqRqVfEpgtnn1CSYaUmHF4pxkIZ8Amr8XO0yaDrPE6A>
    <xmx:yvg9Zi2aANAlsu8adl0SMI3Tgc3hkOW2NovpKmZMfjksZtCXULZz0A>
    <xmx:yvg9Zq-k37Q8m570KjXvnrYKGDmim2gC2uR8ZAvxlVHnPMedscKVbw>
    <xmx:y_g9ZnXi_npQ0FSYxolD9ztujz-UzQf9wlNglXvhfFEP19BYIAaV1pTv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 May 2024 06:36:58 -0400 (EDT)
Date: Fri, 10 May 2024 12:36:56 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20240510103656.GB2165064@ragnatech.se>
References: <20240510100347.102392-1-niklas.soderlund+renesas@ragnatech.se>
 <20240510101340.GG6407@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510101340.GG6407@pendragon.ideasonboard.com>

Hello Laurent,

Thanks for your feedback.

On 2024-05-10 13:13:40 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Fri, May 10, 2024 at 12:03:47PM +0200, Niklas Söderlund wrote:
> > Create and store the subdevice format in the subdevices active state.
> > This change do not have a huge effect on the driver as it do not yet
> > support changing the format.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > Hello,
> > 
> > This change is mostly to align all driver used in the R-Car VIN pipeline
> > to use the same set of API and to make it easier to extend them in
> > tandem going forward.
> > 
> > This should be seen as a compliment to Jacopo's larger work in "[PATCH
> > v3 00/11] media: renesas: rcar-csi2: Use the subdev active state" which
> > updates other drivers in the VIN pipeline to use the active state.
> > ---
> >  drivers/staging/media/max96712/max96712.c | 36 +++++++++++++++++------
> >  1 file changed, 27 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> > index c44145284aa1..2da65ccd2c57 100644
> > --- a/drivers/staging/media/max96712/max96712.c
> > +++ b/drivers/staging/media/max96712/max96712.c
> > @@ -242,21 +242,34 @@ static const struct v4l2_subdev_video_ops max96712_video_ops = {
> >  	.s_stream = max96712_s_stream,
> >  };
> >  
> > -static int max96712_get_pad_format(struct v4l2_subdev *sd,
> > -				   struct v4l2_subdev_state *sd_state,
> > -				   struct v4l2_subdev_format *format)
> > +static int max96712_init_state(struct v4l2_subdev *sd,
> > +			       struct v4l2_subdev_state *state)
> >  {
> > -	format->format.width = 1920;
> > -	format->format.height = 1080;
> > -	format->format.code = MEDIA_BUS_FMT_RGB888_1X24;
> > -	format->format.field = V4L2_FIELD_NONE;
> > +	static const struct v4l2_mbus_framefmt default_fmt = {
> > +		.width          = 1920,
> > +		.height         = 1080,
> > +		.code           = MEDIA_BUS_FMT_RGB888_1X24,
> > +		.colorspace     = V4L2_COLORSPACE_SRGB,
> > +		.field          = V4L2_FIELD_NONE,
> > +		.ycbcr_enc      = V4L2_YCBCR_ENC_DEFAULT,
> > +		.quantization   = V4L2_QUANTIZATION_DEFAULT,
> > +		.xfer_func      = V4L2_XFER_FUNC_DEFAULT,
> > +	};
> > +	struct v4l2_mbus_framefmt *fmt;
> > +
> > +	fmt = v4l2_subdev_state_get_format(state, 0);
> > +	*fmt = default_fmt;
> >  
> >  	return 0;
> >  }
> >  
> > +static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
> > +	.init_state = max96712_init_state,
> > +};
> > +
> >  static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
> > -	.get_fmt = max96712_get_pad_format,
> > -	.set_fmt = max96712_get_pad_format,
> > +	.get_fmt = v4l2_subdev_get_fmt,
> > +	.set_fmt = v4l2_subdev_get_fmt,
> >  };
> >  
> >  static const struct v4l2_subdev_ops max96712_subdev_ops = {
> > @@ -293,6 +306,7 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
> >  	long pixel_rate;
> >  	int ret;
> >  
> > +	priv->sd.internal_ops = &max96712_internal_ops;
> >  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96712_subdev_ops);
> >  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >  	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> > @@ -324,6 +338,10 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
> >  
> >  	v4l2_set_subdevdata(&priv->sd, priv);
> >  
> 
> I think it would be nice to already use the control handler lock as the
> active state lock. Apart from that, the patch looks good to me.

I also worked on this to learn a bit more about the active state API. I 
assume what you are asking for here is ?

    priv->sd.state_lock = priv->ctrl_handler.lock;

What is the rational for using the control handler lock over the default 
state lock? I checked Jacopo's series when working on this and there he 
uses no lock for the R-Car CSI-2 driver and a private driver global 
state lock for ADV748x.

> 
> > +	ret = v4l2_subdev_init_finalize(&priv->sd);
> > +	if (ret)
> > +		goto error;
> > +
> >  	ret = v4l2_async_register_subdev(&priv->sd);
> >  	if (ret < 0) {
> >  		dev_err(&priv->client->dev, "Unable to register subdevice\n");
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund


Return-Path: <linux-media+bounces-11340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F308C2842
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E3131F21A37
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A637171E5D;
	Fri, 10 May 2024 15:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="klJqptJ8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G2daYimB"
X-Original-To: linux-media@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C955E17109C;
	Fri, 10 May 2024 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715356513; cv=none; b=tYXx6TjvgaGNnEAumOG6geEiIs4xBZkbGSXmcZNThrESvLnxY/BzJy8KIH3G83kaGOjcctihWOao5FPRqTfSCmTBm4NYHl42g89Y6kPFyFctebZr2N8gdPjgtWQqjXlFj2H0IkKRyd36s9WiIBgRa4Gd7O3vuSAStq6HXeE6hkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715356513; c=relaxed/simple;
	bh=0U8BFad+SU3L0DANQG4h0sup34wdPH64FrtPuA7x5xA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/nmILzLLiwfBfqeDkNJzxuKKWgiv/zYemUOuo/bqpRqGeAODC9fitReCRi1MmXSe+7+8EX5em7llzisYUPdJ3fNYB3nl6HkCPdKvLC9ArNyMq0G6XCRxlyeDSsHIqHAFgsOkqKgZPB/wypdVSGVjLD6vJQlhqjdPLoHzbn2DYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=klJqptJ8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G2daYimB; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id C398E138039D;
	Fri, 10 May 2024 11:55:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 10 May 2024 11:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715356508;
	 x=1715442908; bh=gYyxl1/+rF6D1Dt6y2CZ9qJ3mHQrfBqhcWowQfKSPTc=; b=
	klJqptJ8or/HXOFwsdrw9aHNsMTnRZBSUBgoA/eB601j01nrbYOUtRCQEuSNSXZa
	ASbLuOtucCTNFTrOwIute1hFfjP1QSDMOQjJB2v7xKlVWN9lN7KjFceN0Q9/ifDV
	IJCMvNYTV+S2zkfRUESmaPpd9R2zxs3cNfNybb2LXN/OV8a7llT44gojdZgIoX8u
	1IPeu6+0IJexJ9hgnJGjH4OXV9Y9h10O4qLgwWLqN8Zs41Cp7MyI7bXGEGk8rfcj
	gTpUkiCP608uzzrwXck3X2CuoDvu3ppQNxjcWVapxQLORtQyL0nqv6QveM8g4x4l
	dOgLWjrTKp+DQ/EPLYn17A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715356508; x=
	1715442908; bh=gYyxl1/+rF6D1Dt6y2CZ9qJ3mHQrfBqhcWowQfKSPTc=; b=G
	2daYimB/j7ubqZPuHk2jM/ZPLTtsw1izRsagIqmwwdUA4UpBF96+x1xhF7j1Slaz
	+K3wyxDE87mAv4aHftr5WwjXJFhzGiEKQrq2CsON7eHDA8KFnrrBHYA+XSh5efM+
	f7WjyWcI+XWnFO/AT65yLKIsACg9KjwTCFyjs+aVf6t1Z3dnzn9hVi2SYXfEmNJ2
	4rJtt/tdCVqUKqCruWOeYP97oCi4OJDltgflmb+tFQvU1VsPRQtrDvWQhGGYnVg3
	l+9xUu1zOrPs9XZztUYhBe7ocul6cVBOILn4paXBgR4sXWdA6Hnv3kvBK5gh7jgw
	9YXhON95VXWO0NVX8UWpg==
X-ME-Sender: <xms:XEM-Zv3uc1DGRpsb8Z8QeDKqISFQH-PqeHLQwrpSZGv5xr-J2U__3g>
    <xme:XEM-ZuErRmlME8l5Bxag4q51eosXMqYBa7UTuuzPDh3J6ttw4oJyAm4m-mM46_1L5
    1RSOnHDMJqTrrFdjnI>
X-ME-Received: <xmr:XEM-Zv4sGWcIlFvwyuyDVgkp0jVUVdth1GXftICIXLao6utZwCjfWwIi1sNZ1ey9MMYMdlIYirWrsqFXt-nmw-9-x0MBB4o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefkedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:XEM-Zk3IL4dnTSftdpvYxhetJrlC_1NlI0R6WFJ6g4ZdRWeCO-qoIQ>
    <xmx:XEM-ZiE7jSYxR61u0XUd-n7g39OwBC1fLdxCThs-y39lwcBf98hN6g>
    <xmx:XEM-Zl9vlO6pFSdjQx4HCls_qnBV1JVXEA5YoLdqOBcuQmD2nC4FDg>
    <xmx:XEM-ZvlWdHEzskhP1rBa572X2xPhLJl0tNSh_asaob6AYLlr-Ph8XA>
    <xmx:XEM-Zq_XrJ-ysbDnrz5W8hSGL16PKW4gqOM8FarrRk5TZGRmQOiVWXXG>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 May 2024 11:55:07 -0400 (EDT)
Date: Fri, 10 May 2024 17:55:04 +0200
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
Message-ID: <20240510155504.GC2165064@ragnatech.se>
References: <20240510100347.102392-1-niklas.soderlund+renesas@ragnatech.se>
 <20240510101340.GG6407@pendragon.ideasonboard.com>
 <20240510103656.GB2165064@ragnatech.se>
 <20240510152724.GB17158@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510152724.GB17158@pendragon.ideasonboard.com>

Hi Laurent,

On 2024-05-10 18:27:24 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Fri, May 10, 2024 at 12:36:56PM +0200, Niklas Söderlund wrote:
> > On 2024-05-10 13:13:40 +0300, Laurent Pinchart wrote:
> > > On Fri, May 10, 2024 at 12:03:47PM +0200, Niklas Söderlund wrote:
> > > > Create and store the subdevice format in the subdevices active state.
> > > > This change do not have a huge effect on the driver as it do not yet
> > > > support changing the format.
> > > > 
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > > > Hello,
> > > > 
> > > > This change is mostly to align all driver used in the R-Car VIN pipeline
> > > > to use the same set of API and to make it easier to extend them in
> > > > tandem going forward.
> > > > 
> > > > This should be seen as a compliment to Jacopo's larger work in "[PATCH
> > > > v3 00/11] media: renesas: rcar-csi2: Use the subdev active state" which
> > > > updates other drivers in the VIN pipeline to use the active state.
> > > > ---
> > > >  drivers/staging/media/max96712/max96712.c | 36 +++++++++++++++++------
> > > >  1 file changed, 27 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> > > > index c44145284aa1..2da65ccd2c57 100644
> > > > --- a/drivers/staging/media/max96712/max96712.c
> > > > +++ b/drivers/staging/media/max96712/max96712.c
> > > > @@ -242,21 +242,34 @@ static const struct v4l2_subdev_video_ops max96712_video_ops = {
> > > >  	.s_stream = max96712_s_stream,
> > > >  };
> > > >  
> > > > -static int max96712_get_pad_format(struct v4l2_subdev *sd,
> > > > -				   struct v4l2_subdev_state *sd_state,
> > > > -				   struct v4l2_subdev_format *format)
> > > > +static int max96712_init_state(struct v4l2_subdev *sd,
> > > > +			       struct v4l2_subdev_state *state)
> > > >  {
> > > > -	format->format.width = 1920;
> > > > -	format->format.height = 1080;
> > > > -	format->format.code = MEDIA_BUS_FMT_RGB888_1X24;
> > > > -	format->format.field = V4L2_FIELD_NONE;
> > > > +	static const struct v4l2_mbus_framefmt default_fmt = {
> > > > +		.width          = 1920,
> > > > +		.height         = 1080,
> > > > +		.code           = MEDIA_BUS_FMT_RGB888_1X24,
> > > > +		.colorspace     = V4L2_COLORSPACE_SRGB,
> > > > +		.field          = V4L2_FIELD_NONE,
> > > > +		.ycbcr_enc      = V4L2_YCBCR_ENC_DEFAULT,
> > > > +		.quantization   = V4L2_QUANTIZATION_DEFAULT,
> > > > +		.xfer_func      = V4L2_XFER_FUNC_DEFAULT,
> > > > +	};
> > > > +	struct v4l2_mbus_framefmt *fmt;
> > > > +
> > > > +	fmt = v4l2_subdev_state_get_format(state, 0);
> > > > +	*fmt = default_fmt;
> > > >  
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
> > > > +	.init_state = max96712_init_state,
> > > > +};
> > > > +
> > > >  static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
> > > > -	.get_fmt = max96712_get_pad_format,
> > > > -	.set_fmt = max96712_get_pad_format,
> > > > +	.get_fmt = v4l2_subdev_get_fmt,
> > > > +	.set_fmt = v4l2_subdev_get_fmt,
> > > >  };
> > > >  
> > > >  static const struct v4l2_subdev_ops max96712_subdev_ops = {
> > > > @@ -293,6 +306,7 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
> > > >  	long pixel_rate;
> > > >  	int ret;
> > > >  
> > > > +	priv->sd.internal_ops = &max96712_internal_ops;
> > > >  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96712_subdev_ops);
> > > >  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > >  	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> > > > @@ -324,6 +338,10 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
> > > >  
> > > >  	v4l2_set_subdevdata(&priv->sd, priv);
> > > >  
> > > 
> > > I think it would be nice to already use the control handler lock as the
> > > active state lock. Apart from that, the patch looks good to me.
> > 
> > I also worked on this to learn a bit more about the active state API. I 
> > assume what you are asking for here is ?
> > 
> >     priv->sd.state_lock = priv->ctrl_handler.lock;
> 
> That's right.

I will send a v2 of this patch using the controller lock.

> 
> > What is the rational for using the control handler lock over the default 
> > state lock?
> 
> When there are interactions between controls and formats, using separate
> locks can lead to AB/BA deadlocks if you need to access controls from a
> context where the state is locked (e.g. calling
> v4l2_ctrl_handler_setup() at stream enable time), and access the active
> state from a context where the control handler is locked (e.g. accessing
> the state in .s_ctrl()). Using the same lock helps there, you can then
> call __v4l2_ctrl_handler_setup() at stream enable time, and get the
> state without locking it in .s_ctrl().
> 
> At some point in the not too distant future I would like to move storage
> of controls to the state. I don't know how painful that will be though,
> the control framework has grown to be a very complex beast, with lots of
> features that are not useful for MC-based drivers (such as control
> handler inheritance). I'm worried that we'll need a full rewrite...
> We'll see :-)
> 
> > I checked Jacopo's series when working on this and there he 
> > uses no lock for the R-Car CSI-2 driver and a private driver global 
> > state lock for ADV748x.
> 
> For the CSI-2 RX driver, that's because it doesn't have a control
> handler. For the ADV748x driver, that's because the control handler is
> configured to use the device-wide mutex.

Thanks for this through description of why using the control handler 
lock for the stat is a good idea. I really like your idea of trying to 
make the control framework less complex for MC-based drivers in the 
future.

> 
> > > > +	ret = v4l2_subdev_init_finalize(&priv->sd);
> > > > +	if (ret)
> > > > +		goto error;
> > > > +
> > > >  	ret = v4l2_async_register_subdev(&priv->sd);
> > > >  	if (ret < 0) {
> > > >  		dev_err(&priv->client->dev, "Unable to register subdevice\n");
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund


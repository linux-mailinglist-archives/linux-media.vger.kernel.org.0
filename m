Return-Path: <linux-media+bounces-10858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 286538BCCD7
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 13:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10FAAB21B2D
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 11:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66ED142E9D;
	Mon,  6 May 2024 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="sOWFApH7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EurNzXMp"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8144EB2B;
	Mon,  6 May 2024 11:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714995065; cv=none; b=c2ozohoJwnBecHf9G85Zo5KavyQsE+ETObwFM+aDvoQv9Dt5pa141YN8pZEopKLNXZeLHXj3QOq9TG7+VeahO86Yj8auK+cbBu1Ghgj39rkRYSmQjJQbBjqFzGz9ENQKaFif5/GkyMQmKi/AzZNAa7erPdhlhy/DqdxtoLNqDHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714995065; c=relaxed/simple;
	bh=1h4U9Fr3FmBOhFncEJ5f0j27eYuuEraor8EUGLmvwvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8kiRU20jhO7LUYUo8Tn+1oT/HGFVrsr0B2WbkHxWiWsFp3XBS/wb5UFqONjVmolF99pOtdUaCjMWLkJksss8CZFETCLNYd6UL3hVvr78BHmSABVlLqM8HIy9XAAKO6QveDHS/5gAeNJ4HW+4SeAsPf/jw3OAMENwBCuh0RWiFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=sOWFApH7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EurNzXMp; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id 5ABAD1C00169;
	Mon,  6 May 2024 07:31:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 06 May 2024 07:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1714995061;
	 x=1715081461; bh=bVvlxgr9CwfpmyiypYbBkb51JgXCivtgm3grJcSSWVk=; b=
	sOWFApH763HCc7p3UXSAaYFC8R4YiJ4Q1qqrKAK682ISHP8l3wFnDZo2kuKVDWyi
	YLTmOdxdaXHlCmTVXcCOP+IPWbLKmYibzHiqOG8lA4x+xGUJqZ5ewMvvmbj/Ul8k
	I5MvE+41Z7KVYjRlnSmbLJ+87knrBs8jCqHqW+2TtiG+i1OhAdOeu7e9aVlZhrVZ
	9fMBI0XhIwLJUk8CJM5SAv3GdsyekplqbSAc5eK8/ZFFpFCJdGpFPSwaDCQvrrrm
	C6fTCm2sbIJBzVkc2U0wndgY+UZRePLQBh9uK0GdjamH6VIErypfZPfD8yFW6HTb
	C2aU1Iw5FVwwY/Pk71AFxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714995061; x=
	1715081461; bh=bVvlxgr9CwfpmyiypYbBkb51JgXCivtgm3grJcSSWVk=; b=E
	urNzXMpdNDIT3Cu/zbWFYAS5WxXw7gFe3gpmTNe/ZzmV0bq3HaYdaByDYvDSx6v1
	A6PZDwLwf8vI/jU6TrowTWuZMDrSGzW958FHzPcEKClwq6N/MAXfUhMrhyflDzcV
	ZTJVRWTBkefs6ojv/hweRyG7bYMRdqMqiSBTwnkwro0caa7KwEPsAzt12LRLWGPj
	DcJiY6LQO0PW3M+1BfYDGzJ85A1Gn2yxTiobad/lH/RglnY6nkMxUDLp33n5bIKk
	fw/CluslT1ubaESiDDaSJ9BfY7kaLN9HaDS6hmGUoZu+L8BmdMIHJLf/viuuVszV
	OHiL/VXquZwRhK6NguUXw==
X-ME-Sender: <xms:dL84ZvXuhvE6zDLI7151eZoE3A6j6Q5EsfjJmm2eebRzH2SRDGSTFw>
    <xme:dL84Znn49Rh0fB39y-mDOiGOJ9RDm9wcB3ofTSTXrXk4Kw_FQqA1ajM8Nz_Ngxh3p
    hbUPux3KbKbIslF5Eo>
X-ME-Received: <xmr:dL84ZrbZ45IklXESBBOZIYo0SPzBuED6XsWv47dd-lYp5BoVV4s27bjf2am0U6TBcp1SHAc9jZcyX_shQdLFD8iI988Qn2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddviedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:dL84ZqWiSA3TRkW21mEA8kIMquynbwnKF5QlCbgdNlHCLpc1YdjCGg>
    <xmx:dL84ZplCbSzp281yXrpYa2aM-UR4EoY_KHuTdmhZMK_pwbL1SJvQcQ>
    <xmx:dL84ZndtTagXVqc6E_Ozpor5VOVELM3i-KgPHzJU8NcuQZ5P_JgO4g>
    <xmx:dL84ZjEXose7_7HZCFHPvED9fCj93OQj8TGCbQU3f47wj-WafWt2jg>
    <xmx:dL84ZvWSoiuUeWIBXelzQkDbcysgoPwd3AJ72noau2omZfyBM-b0Ygqz>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 May 2024 07:31:00 -0400 (EDT)
Date: Mon, 6 May 2024 13:30:59 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/11] media: adv748x-csi2: Implement enum_mbus_codes
Message-ID: <20240506113059.GC720810@ragnatech.se>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-7-jacopo.mondi@ideasonboard.com>
 <20240505210740.GD23227@pendragon.ideasonboard.com>
 <lj7mhgt62wzkdoqdforp7dyztwyn5xiz4jwjrxsqjkfq5aeqo5@t2g7o5dd6ual>
 <20240506083841.GB10260@pendragon.ideasonboard.com>
 <hhds4sdcxwzvftuh6fyv676jhargpsmn7rddcny7itdx4b5xgd@bzb46csgi32j>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hhds4sdcxwzvftuh6fyv676jhargpsmn7rddcny7itdx4b5xgd@bzb46csgi32j>

On 2024-05-06 10:42:32 +0200, Jacopo Mondi wrote:
> Hi Laurent
> 
> On Mon, May 06, 2024 at 11:38:41AM GMT, Laurent Pinchart wrote:
> > On Mon, May 06, 2024 at 10:10:00AM +0200, Jacopo Mondi wrote:
> > > On Mon, May 06, 2024 at 12:07:40AM GMT, Laurent Pinchart wrote:
> > > > On Fri, May 03, 2024 at 05:51:21PM +0200, Jacopo Mondi wrote:
> > > > > Define a list of supported mbus codes for the TXA and TXB CSI-2
> > > > > transmitters and implement the enum_mbus_code operation.
> > > >
> > > > The commit message should explain why, not just what. Explaining why the
> > >
> > > Should I explain why the driver has to implement enum_mbus_codes ?
> >
> > You can just note it's mandatory to implement ?
> >
> > > > formats for TXA and TXB differ would also be useful.
> > >
> > > ok
> > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > ---
> > > > >  drivers/media/i2c/adv748x/adv748x-csi2.c | 35 ++++++++++++++++++++++++
> > > > >  1 file changed, 35 insertions(+)
> > > > >
> > > > > diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > > > index 9da7f6742a2b..219417b319a6 100644
> > > > > --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > > > +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > > > @@ -21,6 +21,18 @@ static const struct v4l2_mbus_framefmt adv748x_csi2_default_fmt = {
> > > > >  	.field = V4L2_FIELD_NONE,
> > > > >  };
> > > > >
> > > > > +static const unsigned int adv748x_csi2_txa_fmts[] = {
> > > > > +	MEDIA_BUS_FMT_YUYV8_1X16,
> > > > > +	MEDIA_BUS_FMT_YUYV10_1X20,
> > > >
> > > > CSI-2 uses UYVY, not YUYV.
> > >
> > > As this a recurring comment in the series (rightfully, I'm not
> > > questioning that) how does it work with existing test scripts assuming
> > > YUYV ? The same question could be asked about the issue Niklas had: is
> > > changing what pad an operation is allowed to be called on legit ?
> > >
> > > My answer would be yes, otherwise we'll be forever stuck, but I would
> > > like to check, especially with Niklas which maintains vin-tests.
> >
> > As usual, changes of behaviour are only regressions if someone complains
> > about them. We can keep backward-compatibility, but it would then be
> > nice to also support the right media bus codes, and to add a comment
> > that clearly indicates which ones are for backward-compatibility.
> >
> > That being said, given that userspace should use UYVY, and given that
> > the driver currently accepts UYVY, it should at least be enumerated. I
> > would skip enumeration of the media bus codes that we keep for
> > backward-compatibility, even if we accept them at runtime.

I'm OK just dropping them and update the use-cases, better get this 
right for the future. If we find use-cases we can't update, keeping 
accepting the formats but not enumerating them seems like a good option.

> >
> 
> What about the change to the pad on which s_fmt is allowed on R-Car
> CSI-2 ?
> 
> > > > > +	MEDIA_BUS_FMT_RGB565_1X16,
> > > > > +	MEDIA_BUS_FMT_RGB666_1X18,
> > > > > +	MEDIA_BUS_FMT_RGB888_1X24,
> > > > > +};
> > > > > +
> > > > > +static const unsigned int adv748x_csi2_txb_fmts[] = {
> > > > > +	MEDIA_BUS_FMT_YUYV8_1X16,
> > > > > +};
> > > > > +
> > > > >  int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
> > > > >  {
> > > > >  	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
> > > > > @@ -146,6 +158,28 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
> > > > >   * But we must support setting the pad formats for format propagation.
> > > > >   */
> > > > >
> > > > > +static int adv748x_csi2_enum_mbus_code(struct v4l2_subdev *sd,
> > > > > +				       struct v4l2_subdev_state *sd_state,
> > > > > +				       struct v4l2_subdev_mbus_code_enum *code)
> > > > > +{
> > > > > +	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> > > > > +	const unsigned int *codes = is_txa(tx) ?
> > > > > +				    adv748x_csi2_txa_fmts :
> > > > > +				    adv748x_csi2_txb_fmts;
> > > > > +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> > > > > +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> > > > > +
> > > > > +	if (code->pad != ADV748X_CSI2_SOURCE)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	if (code->index >= num_fmts)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	code->code = codes[code->index];
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > >  static struct v4l2_mbus_framefmt *
> > > > >  adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
> > > > >  			    struct v4l2_subdev_state *sd_state,
> > > > > @@ -235,6 +269,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
> > > > >  }
> > > > >
> > > > >  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
> > > > > +	.enum_mbus_code = adv748x_csi2_enum_mbus_code,
> > > > >  	.get_fmt = adv748x_csi2_get_format,
> > > > >  	.set_fmt = adv748x_csi2_set_format,
> > > > >  	.get_mbus_config = adv748x_csi2_get_mbus_config,
> >
> > --
> > Regards,
> >
> > Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund


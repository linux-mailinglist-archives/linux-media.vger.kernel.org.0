Return-Path: <linux-media+bounces-24325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6CBA03B89
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 10:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A986816559A
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 09:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E663F1E2616;
	Tue,  7 Jan 2025 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ECF1jpol";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QY039lNH"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C267273F9;
	Tue,  7 Jan 2025 09:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736243548; cv=none; b=c7B82T6OTKqlUMBtZtv8kEbrLfXtbymYHGDoHjeNJ3+SAjV3AvM92g5xDYkdSMbYgYQuD4Umz2NDOWvUGyRYv/wOQ5I7eflIQvVmgncXORYFPr6ApsFQx8lFPAIHjCxNtXv4ZThYmicDsfZIUQYi6LNmDqPlhjIW9xZJoHeifjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736243548; c=relaxed/simple;
	bh=fuDPU7ID39d3OgCIgYP/72Fz8hMlz4HWOqwNQqmNXkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9Das9ADwGegpmNFT3hDmKXOXrekQIvqaj/eu7Cklp4FcLplXmoGQPyzSA7c4iN1GFBHRN7GRG/urcl6abC66AiWRSpUqX8bNZdLKJCcAsrEb4VWArluDHAnxsTn4oJI01+hHuoGvza9X5h3CY4WY5dj7zxjcTHW1aHF6Xd+DkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ECF1jpol; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QY039lNH; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id E02AD11400CA;
	Tue,  7 Jan 2025 04:52:23 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 07 Jan 2025 04:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736243543;
	 x=1736329943; bh=0z72CnRqggWWe0wOs+y3P/x1y3sXAMdN5Rihg895Yqg=; b=
	ECF1jpolmFjbcrCLB/J7nwH2rZxvuq4bV1h34YVcVJGelDOt2Bg5YaQ9bZS8z7Kp
	JBFANrzNtlOdw9lCLKn2Gt4zV7ImDCCEEF0Smyajsw1XU+R6JrXZLiNSXKjpMGJk
	UjMka0tMqQVPPV0J52QapmROZbzxLvleJXbrpoVHT9HkznyPu31b8/5UgSuMZIHW
	jPt3UOpNm4CVW2BX9eNDtZOh1vBBCb6lvsnqEK7rUvic4WLoQjSGCmnwoueK4M72
	DqpfecqDikGKmTVblegSTtbY2TVajRj/e5zqntYDK0nicE5OiM92tdTD+GoIAsIf
	IEJkEKKgb54e9oDWXdNtEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736243543; x=
	1736329943; bh=0z72CnRqggWWe0wOs+y3P/x1y3sXAMdN5Rihg895Yqg=; b=Q
	Y039lNHIo8ACyj4Detv/cIBx/+6sXRW5kWBmsWl2PWd4ptT26NL3lxqtcAsYWcUx
	B5+dTAAhv+9lR9p56SZ6ILRFjBL/9G/RvIIFgkPy761X+9LGLND94pdMs19tzlbg
	mzKV+lOW7Djfa8b0FC0+uiyOv36OeL3ZTUDYVsTzXwj8CP9TmXra04WV2+OveQOs
	cCWhH73LgPT9HBzUUSHiDq/thktpxhIXwDymE5pgL8y/nUwYnQLgWhf9znSPOzE7
	Av7X3steaEQ5voP822VaCviTeAhBOgzf74UdWFzInmsghOC7j7Der9tBgRlzE8vf
	EZLhQXswBckHLLzY8zlUA==
X-ME-Sender: <xms:V_l8ZxEhX9wONkWsMbZ_jfCxPy7wQh9gZdfTrbX6okJgpAIbsyn1eQ>
    <xme:V_l8Z2V22M1Flde0HSOqXiCNv9C0w1K6qrbA-fojFPaGcUniyPWsV-Ln3wsguPILi
    8MF5b2OcKkiUflEf-A>
X-ME-Received: <xmr:V_l8ZzJ_BdLCF5xFS5v_KG9nUVnCVoz2EIAY2YjEFgTfA9wtELlrD2zX_dlpJ3TlcVJyXnvyVaMYeOiBud42ULlEHNidyPQcMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegvddgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehs
    rghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhope
    hgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehmtghhvghhrggs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshho
    tgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:V_l8Z3GAmT_urV5W48hvksbY-PGGWOLLbMPw11hP_cmwn3o6koY5Ew>
    <xmx:V_l8Z3X6MKDMYs1AoJI7SIyrXH1QTZhI2gnrfYtTWxZ6HSjIFQk6qQ>
    <xmx:V_l8ZyNeohB8qD6KAZMzeJfnawxH6Rt0W6_PBR3lyZ84QdUwq4jBhg>
    <xmx:V_l8Z20Yl4rqGvqMiGoGDrOR91fkeGaaihtCyZPsWjy-PcPXgqy4fQ>
    <xmx:V_l8Z9fWDK8WMLzyoXMNAglqgr0B_m0DcDfymSoWouLuFzmJbCWdud4d>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jan 2025 04:52:22 -0500 (EST)
Date: Tue, 7 Jan 2025 10:52:19 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] media: v4l: fwnode: Parse CSI-2 C-PHY line-orders
 like bus-type
Message-ID: <20250107095219.GF2766897@ragnatech.se>
References: <20250104195548.1915578-1-niklas.soderlund+renesas@ragnatech.se>
 <20250104195548.1915578-3-niklas.soderlund+renesas@ragnatech.se>
 <Z3znj0MOWvIhbOxj@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3znj0MOWvIhbOxj@kekkonen.localdomain>

Hi Sakari,

Tack för din feedback.

On 2025-01-07 08:36:31 +0000, Sakari Ailus wrote:
> Hejssan Niklas,
> 
> Tack för dessa lappar!
> 
> On Sat, Jan 04, 2025 at 08:55:48PM +0100, Niklas Söderlund wrote:
> > Provided a safe-guard from the raw values used in device tree sources
> > and the in-kernel defines used to describe the different line orders.
> > This mimics what have been done for the bus-type property to provide the
> > same safe-guard.
> > 
> > The macros used in device tree sources are defined in video-interfaces.h
> > (MEDIA_BUS_CSI2_CPHY_LINE_ORDER_*) and are only visible to DTS source
> > files. These raw values map directly to the in-kernel names by fwnode
> > defines in v4l2-fwnode.h (V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_*). These
> > fwnode defines are finally translated to defines which are exposed to
> > drivers to act on (V4L2_MBUS_CSI2_CPHY_LINE_ORDER_*).
> > 
> > Previously the translation to values provided to drivers have exploited
> > the fact that the numerical value for each setting are the same for the
> > defines used in device tree sources. While this is unlikely to change
> > this harmonises the bus-type and line-orders parsing to work using the
> > same mechanics, while at the same time make the large CSI-2 parsing
> > function a little more readable.
> 
> Do we in fact need the V4L2_MBUS_ definitions of the line orders at all?

I'm not sure :-)

Geert pointed out in [1] that in comparison to the V4L2_MBUS_ bus-type 
definitions the line-order definitions did not have this intermediary 
step as a safe guard between values used in DTS files and values used in 
V4L2 drivers.

Looking at the original functionality,

    bus->line_orders[i] = array[i];

Seems a bit "hack" compared to what this patch do,


    bus->line_orders[i] = v4l2_fwnode_line_order_to_mbus(array[i]);

But if it's worth the extra churn, and if it in reality provides us with 
a safe-guard between DTS-files and V4L2-drivers I'm not sure. I'm on the 
fence on this one, the one good thing is that it aligns how V4L2_MBUS_ 
macros are parsed.

But if you don't like it and I'm on the fence I'm happy to drop this 
series. This series don't add any extra functionality.

1. CAMuHMdXwqb7vhUeoMKDDJO5dp-V3LmnURZLSC1_ko=YL=cNyUA@mail.gmail.com

> 
> The same could extend to the V4L2_MBUS_ bus type defitions, but that's out
> of scope of this patch.

Out of scope indeed. If we drop this series do we want to try and remove 
them for V4L2_MBUS_ bus-type in future?

> 
> > 
> > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 80 ++++++++++++++++++++++-----
> >  1 file changed, 66 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index cb153ce42c45..69f6d1df8c39 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -121,6 +121,70 @@ v4l2_fwnode_mbus_type_to_string(enum v4l2_mbus_type type)
> >  	return conv ? conv->name : "not found";
> >  }
> >  
> > +static const struct v4l2_fwnode_csi2_cphy_line_orders_conv {
> > +	enum v4l2_fwnode_csi2_cphy_line_orders_type fwnode_order;
> > +	enum v4l2_mbus_csi2_cphy_line_orders_type mbus_order;
> > +	const char *name;
> > +} csi2_cphy_line_orders[] = {
> > +	{
> > +		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_ABC,
> > +		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC,
> > +		"ABC",
> > +	}, {
> > +		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_ACB,
> > +		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB,
> > +		"ACB",
> > +	}, {
> > +		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_BAC,
> > +		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC,
> > +		"BAC",
> > +	}, {
> > +		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_BCA,
> > +		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA,
> > +		"BCA",
> > +	}, {
> > +		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_CAB,
> > +		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB,
> > +		"CAB",
> > +	}, {
> > +		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_CBA,
> > +		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA,
> > +		"CBA",
> > +	}
> > +};
> > +
> > +static const struct v4l2_fwnode_csi2_cphy_line_orders_conv *
> > +get_v4l2_fwnode_line_order_conv_by_fwnode_order(enum v4l2_fwnode_csi2_cphy_line_orders_type order)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(csi2_cphy_line_orders); i++)
> > +		if (csi2_cphy_line_orders[i].fwnode_order == order)
> > +			return &csi2_cphy_line_orders[i];
> > +
> > +	/* The default line order is ABC */
> > +	pr_warn("invalid line-order assuming ABC (got %u)\n", order);
> > +	return &csi2_cphy_line_orders[0];
> > +}
> > +
> > +static enum v4l2_mbus_csi2_cphy_line_orders_type
> > +v4l2_fwnode_line_order_to_mbus(enum v4l2_fwnode_csi2_cphy_line_orders_type order)
> > +{
> > +	const struct v4l2_fwnode_csi2_cphy_line_orders_conv *conv =
> > +		get_v4l2_fwnode_line_order_conv_by_fwnode_order(order);
> > +
> > +	return conv->mbus_order;
> > +}
> > +
> > +static const char *
> > +v4l2_fwnode_line_order_to_string(enum v4l2_fwnode_csi2_cphy_line_orders_type order)
> > +{
> > +	const struct v4l2_fwnode_csi2_cphy_line_orders_conv *conv =
> > +		get_v4l2_fwnode_line_order_conv_by_fwnode_order(order);
> > +
> > +	return conv->name;
> > +}
> > +
> >  static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
> >  					       struct v4l2_fwnode_endpoint *vep,
> >  					       enum v4l2_mbus_type bus_type)
> > @@ -268,21 +332,9 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
> >  						       num_data_lanes);
> >  
> >  			for (i = 0; i < num_data_lanes; i++) {
> > -				static const char * const orders[] = {
> > -					"ABC", "ACB", "BAC", "BCA", "CAB", "CBA"
> > -				};
> > -
> > -				if (array[i] >= ARRAY_SIZE(orders)) {
> > -					pr_warn("lane %u invalid line-order assuming ABC (got %u)\n",
> > -						i, array[i]);
> > -					bus->line_orders[i] =
> > -						V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
> > -					continue;
> > -				}
> > -
> > -				bus->line_orders[i] = array[i];
> > +				bus->line_orders[i] = v4l2_fwnode_line_order_to_mbus(array[i]);
> >  				pr_debug("lane %u line order %s", i,
> > -					 orders[array[i]]);
> > +					 v4l2_fwnode_line_order_to_string(array[i]));
> >  			}
> >  		} else {
> >  			for (i = 0; i < num_data_lanes; i++)
> > -- 
> > 2.47.1
> > 
> 
> -- 
> Med vänliga hälsningar,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund


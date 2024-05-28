Return-Path: <linux-media+bounces-12072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA598D1754
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 11:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BD8BB22381
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 09:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E1016A380;
	Tue, 28 May 2024 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kAbLze11";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KAnCSMYF"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933C6169384;
	Tue, 28 May 2024 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716889078; cv=none; b=MatybBU3Fj5jtx/L5zjUa5GCrsirO18g3v17ulNHGoWhwv+6C5uXKkNBDsUWe1jAzbPKwMYt9Ovt059cHeUJSEfY5802xL6ssv+H3we0isGYzmx3nLSh2PIWD6kveCk7a7C4P/h1E1c9oW4ZyqHa8ck+wMzCNho7wOmnINw5nS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716889078; c=relaxed/simple;
	bh=ZD+wmPW4i9SJvVmoMtfTdqGfcqdWWTmP4fGszXsNohQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3tHMp4KjeWj0oEDCUSz2deNGplND3pbnwQ5c3+VLyv3WuTEeAPuxgcIOy7zXyyO+3oKL5eJBfxNC7G1j3ISNTyFyDr75lU8qab0K8Z+OdLJz9C8tT4lZTJ5u14pqzRO9nqHwNJhBVl5es/hV64caaoQP/5ztVaRLLMawNixL/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kAbLze11; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KAnCSMYF; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id 445AE1800155;
	Tue, 28 May 2024 05:37:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 28 May 2024 05:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716889072;
	 x=1716975472; bh=NKcPlU+kufqQBUNiIWx56EqdhkqWC7k+l0OGbJpHmd0=; b=
	kAbLze11YIxmiMOHS9BGiVkpX2izHwewMYqGQbCeJ7vGvFT1oBlYswixvSh6P/Uo
	IiU0Gzk6pnTM1X/jnFXMujSMv5ywtvvohYorJxGusKzbbUGOOaeG29dkZUIsck3A
	A0sXCmR+/uuwm+/oODouSQwYcNsfloh5u2arV/JAIaf8abfRs/K2enhYI3N6SP9C
	O3zX0WKzbNlRMgDTmNT7iorTz5zMY4SIKpbQ7MZ0Wh0O3ONaiG2wGTNZsztkcRbN
	jjT4a0624sTY9VdxleJvfH6kSrE2/LM8Y8K8IVIOCCzl5542admFjtredv61Nc8t
	mum+8e9Lci0PxAVxH/4gaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716889072; x=
	1716975472; bh=NKcPlU+kufqQBUNiIWx56EqdhkqWC7k+l0OGbJpHmd0=; b=K
	AnCSMYFgybFb33nNADbgERW2OJdWhuxP6VnJSTqTgZ7qA8fJWVtDPWaQCrcOl9pD
	43WPXgd1Em63DMPoqLb/G+XQTjDKUA1EpqsUUsZrU6XLcyMkNEhz6xB8DbBZUmbj
	ESVyMMAVdulucsVQRKO6w5iGmMTM/KFt4HZa4uPjOlwPji7X4MCrGDSYQckLNZzF
	p/kUEUpzskWUUdAXjGJBxSlBDsBExIPMXaMBU4C9F+Zs2K8FYNGFFM2+a44i8S1B
	NlvFc34KXXq2UPuwmxVYp+bqgGnErUuwmn1mBElrJW+Ah0OZpWuqjZ4hFF0b+YaD
	Z8fh0aKIlteiFgXP0sgVg==
X-ME-Sender: <xms:8KVVZo4_GUG-7vaMXa5CDxCs7S5Cr26RYtHV9KOQ10Cs8M_p9wdaDg>
    <xme:8KVVZp6_t2kvjl3kkUT4Pie6_muBzQaNjoWRNTSdkRAyD0FhgliohbzQXa2tZGjUb
    wXmAytJBjFwj13Bgg8>
X-ME-Received: <xmr:8KVVZnfibLoo2SGAq7o6ubTNvTRZV0T-GV7ko5oScWtOAFQH634C0Ih3LMZf3I2yp7cbXC_sX8fkAZ_ERq4E8hc9hp3kJdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejiedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:8KVVZtLCanAFCFQb3RDb9P7JZJcjLjmEvyt7ZKlBbPpAlNIBUFxbOQ>
    <xmx:8KVVZsJjWbrlc9R4Q_V5rAFbKp2A_cXHVWj7X3QsXt_nU318liXWLg>
    <xmx:8KVVZuxhblv0Q4TM4i8WgJSetdR_G__NcnzPNPXmH_Yz8tY_bW4fTA>
    <xmx:8KVVZgJLJ3rW_Sdbo2JLX4ivbmEkGKvjrJ01uRukBP2ki2C2uufvPw>
    <xmx:8KVVZk-krXFMXeB_wU4hVTDNcsbLWa6BOwJVmwkqiyx7IG8bTjk2dCmb>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 May 2024 05:37:52 -0400 (EDT)
Date: Tue, 28 May 2024 11:37:50 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Add support for MAX96724
Message-ID: <20240528093750.GA420934@ragnatech.se>
References: <20240527133410.1690169-1-niklas.soderlund+renesas@ragnatech.se>
 <4f3ea360-f17f-4a91-bbdc-08caebb977a7@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f3ea360-f17f-4a91-bbdc-08caebb977a7@collabora.com>

Hi Julien,

On 2024-05-28 10:04:37 +0200, Julien Massot wrote:
> Hi Niklas,
> 
> On 5/27/24 3:34 PM, Niklas Söderlund wrote:
> > The MAX96724 is almost identical to the MAX96712 and can be supported by
> > the same driver, add support for it.
> > 
> > For the staging driver which only supports patter generation the big
> > difference is that the datasheet (rev 4) for MAX96724 do not describe
> > the DEBUG_EXTRA register, which is at offset 0x0009 on MAX96712. It's
> > not clear if this register is removed or moved to a different offset.
> > What is known is writing to register 0x0009 have no effect on MAX96724.
> > 
> > This makes it impossible to increase the test pattern clock frequency
> > from 25 MHz to 75Mhz on MAX96724. To be able to get a stable test
> > pattern the DPLL frequency have to be increase instead to compensate for
> > this. The frequency selected is found by experimentation as the MAX96724
> > datasheet is much sparser then what's available for MAX96712.
> 
> There is a specific User Guide for this chip[1] (under NDA) which describes
> the test pattern
> clock frequency.
> 
> | Debug Extra 0x9 [1:0] | PATGEN_CLK_SRC (0x1dc [7]) | PCLK Frequency |
> |                       |       Pipe 0               |                |
> |-----------------------|----------------------------|----------------|
> | 00                    | x                          | 25  MHz        |
> | 01                    | x                          | 75  MHz        |
> | 1x                    | 0                          | 150 MHz        |
> | 1x                    | 1 (default)                | 375 MHz        |

The same table exists in the MAX96712 users guide, which I do have.

The issue is that the datasheet for MAX96724 I found online do not list 
the Debug Extra (0x9) register that is present on MAX96712. If you have 
access to the full MAX96724 documentation could you check if it contains 
the Debug Extra register and at which offset it is?

I if treat MAX96724 as it is documented for MAX96712 I get an 
unstable/distorted test pattern on MAX96724.

> 
> 
> PATGEN_CLK_SRC
> Pipe 0 0x1dc
> Pipe 1 0x1fc
> Pipe 2 0x21c
> Pipe 3 0x23c
> 
> 
> The document also mention that "This internal Pclk is NOT related to the
> MIPI CSI
> port clock rate" so increasing the dpll should not increase the pattern
> generation
> clock.
> 
> Perhaps increasing the DPLL allows to transmit more data on the CSI port
> because the pattern
> generator is running at a higher clock rate than what we expect.

That is possible. I only have the limited register information found 
online for MAX96724, so I can't compare the setup with MAX96712. But my 
suspicion is that the test pattern clock is running slower on MAX96724 
without the DEBUG_EXTRA write.

For MAX96712 the reset default value for DEBUG_EXTRA is 0x00, which if 
this is also true for MAX96724 means the test pattern clock is running 
at 25Mhz. 

This fits with my observations. As without an increased DPLL I do get 
frames, most only contain zero or a few line. But some contains 80+% of 
the image. There is little distortion in color on each line, but there 
are lines missing.

For example on the check pattern generation. The square "corners" lines 
up perfectly, and the squares are the correct width, but not the correct 
height, most of them are too short. I'm just happy I found a way to 
generate a stable pattern on both devices from the documentation I have.

This driver is in staging as it only supports pattern generation and not 
the GMSL side. My use-case is to have a video source to test the video 
capture pipeline on Renesas SoCs where both MAX96712 and MAX96724 are in 
use.

> 
> Best regards,
> Julien
> 
> [1]: GMSL2_Customers_MAX96724 User Guide (rev2)
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >   drivers/staging/media/max96712/max96712.c | 26 ++++++++++++++++++-----
> >   1 file changed, 21 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> > index ea67bcf69c9d..69a0a6a16cf9 100644
> > --- a/drivers/staging/media/max96712/max96712.c
> > +++ b/drivers/staging/media/max96712/max96712.c
> > @@ -17,8 +17,10 @@
> >   #include <media/v4l2-subdev.h>
> >   #define MAX96712_ID 0x20
> > +#define MAX96724_ID 0xA7
> >   #define MAX96712_DPLL_FREQ 1000
> > +#define MAX96724_DPLL_FREQ 1200
> >   enum max96712_pattern {
> >   	MAX96712_PATTERN_CHECKERBOARD = 0,
> > @@ -31,6 +33,7 @@ struct max96712_priv {
> >   	struct gpio_desc *gpiod_pwdn;
> >   	bool cphy;
> > +	bool max96724;
> >   	struct v4l2_mbus_config_mipi_csi2 mipi;
> >   	struct v4l2_subdev sd;
> > @@ -120,6 +123,7 @@ static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
> >   static void max96712_mipi_configure(struct max96712_priv *priv)
> >   {
> > +	unsigned int dpll_freq;
> >   	unsigned int i;
> >   	u8 phy5 = 0;
> > @@ -152,10 +156,11 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
> >   	max96712_write(priv, 0x8a5, phy5);
> >   	/* Set link frequency for PHY0 and PHY1. */
> > +	dpll_freq = priv->max96724 ? MAX96724_DPLL_FREQ : MAX96712_DPLL_FREQ;
> >   	max96712_update_bits(priv, 0x415, 0x3f,
> > -			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
> > +			     ((dpll_freq / 100) & 0x1f) | BIT(5));
> >   	max96712_update_bits(priv, 0x418, 0x3f,
> > -			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
> > +			     ((dpll_freq / 100) & 0x1f) | BIT(5));
> >   	/* Enable PHY0 and PHY1 */
> >   	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
> > @@ -181,7 +186,8 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
> >   	}
> >   	/* PCLK 75MHz. */
> > -	max96712_write(priv, 0x0009, 0x01);
> > +	if (!priv->max96724)
> > +		max96712_write(priv, 0x0009, 0x01);
> >   	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
> >   	max96712_write_bulk_value(priv, 0x1052, 0, 3);
> > @@ -290,6 +296,7 @@ static const struct v4l2_ctrl_ops max96712_ctrl_ops = {
> >   static int max96712_v4l2_register(struct max96712_priv *priv)
> >   {
> > +	unsigned int dpll_freq;
> >   	long pixel_rate;
> >   	int ret;
> > @@ -303,7 +310,8 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
> >   	 * TODO: Once V4L2_CID_LINK_FREQ is changed from a menu control to an
> >   	 * INT64 control it should be used here instead of V4L2_CID_PIXEL_RATE.
> >   	 */
> > -	pixel_rate = MAX96712_DPLL_FREQ / priv->mipi.num_data_lanes * 1000000;
> > +	dpll_freq = priv->max96724 ? MAX96724_DPLL_FREQ : MAX96712_DPLL_FREQ;
> > +	pixel_rate = dpll_freq / priv->mipi.num_data_lanes * 1000000;
> >   	v4l2_ctrl_new_std(&priv->ctrl_handler, NULL, V4L2_CID_PIXEL_RATE,
> >   			  pixel_rate, pixel_rate, 1, pixel_rate);
> > @@ -419,8 +427,15 @@ static int max96712_probe(struct i2c_client *client)
> >   	if (priv->gpiod_pwdn)
> >   		usleep_range(4000, 5000);
> > -	if (max96712_read(priv, 0x4a) != MAX96712_ID)
> > +	switch (max96712_read(priv, 0x4a)) {
> > +	case MAX96712_ID:
> > +		break;
> > +	case MAX96724_ID:
> > +		priv->max96724 = true;
> > +		break;
> > +	default:
> >   		return -ENODEV;
> > +	}
> >   	max96712_reset(priv);
> > @@ -444,6 +459,7 @@ static void max96712_remove(struct i2c_client *client)
> >   static const struct of_device_id max96712_of_table[] = {
> >   	{ .compatible = "maxim,max96712" },
> > +	{ .compatible = "maxim,max96724" },
> >   	{ /* sentinel */ },
> >   };
> >   MODULE_DEVICE_TABLE(of, max96712_of_table);
> 
> -- 
> Julien Massot
> Senior Software Engineer
> Collabora Ltd.
> Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
> Registered in England & Wales, no. 5513718

-- 
Kind Regards,
Niklas Söderlund


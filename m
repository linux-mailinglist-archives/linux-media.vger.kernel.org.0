Return-Path: <linux-media+bounces-16942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF25196161E
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 19:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D37FD1C23640
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 17:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F28C1D2787;
	Tue, 27 Aug 2024 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qMBazXUk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cHCYZFTn"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CAA1D175E;
	Tue, 27 Aug 2024 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781463; cv=none; b=YrQ0hOkfHTCvUtjCoefIImIQBdAl3ylP+vF7goDrsVo0+Bb25nijaeFVe7L9JuGmrXhvD87i1C0UF+6Ink8bJeD+edjLMk5MW6Vd3bSlwrBTfqbbesFAdKQxvKzA9cOGTrK/29ojkjT47ffCef9X4M65RFspgcFz1C8GS/aDgHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781463; c=relaxed/simple;
	bh=K58de2dlXE9yYaLqqwxVDvi+/jp8jxEixn6x5nx0a/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rj43nfCzJjq3rJyAy3Lfy3Tt4b42B33Fv9YMg5Kc5c1txH16R9BWwxamkTQT4l6LPBYC7txgrcDeZpFfyyRFgp4wMERDG7Vuine3R3Zk8WgF7/aNPu+6Dz5aqU8xstI63TNhPj/bs4+/9eBaJOytXCKl2S3Y1x/H7Z2Y0un/aHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qMBazXUk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cHCYZFTn; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C20DB1151AFE;
	Tue, 27 Aug 2024 13:57:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 27 Aug 2024 13:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724781458;
	 x=1724867858; bh=8Gj0A7820TOsyxUBr4fhFPqFN6vdl1FYpMIiADPsq7A=; b=
	qMBazXUk42cnR14iqpWOGdidzB+2eJ5pcUfQKNzW845WEFsGHKVLgiATLAwK9jjc
	GD8lsJXbBbA+vBFaWss6mgLpbtBIrcyu9pch/4DcrHvgp7uF1fX4UCOaRSBM++2Y
	4fY0z/81jOwe7ZxigGlKZm+5FEqLJ8M0LjKvGONEfghBqJ5Cnjk5PO3WjO4834c7
	MIUdyaIZgW74ZzM2/hd9tIxeV3nxgDiqk54yXi0mneLtPj4mb1BS3QyYq5EQbfjk
	5G75DCMwDohI3LMUSLoCJ75NhR5M9TiRxpOFQNUPouS17OttBwkscVLHfyfX0peB
	1Iup2QEUYMIOGlxjh2ZtgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724781458; x=
	1724867858; bh=8Gj0A7820TOsyxUBr4fhFPqFN6vdl1FYpMIiADPsq7A=; b=c
	HCYZFTnNfIpbyjvCAOkyFlU5A4qwA56QokUea6AIbjxyGFjcXAi53w9o8Frdw3rx
	efvHTQKPafFi61W0Hni/em26EElzLG6BeIgiPqFDLXwyJ37b+LKWEXRF/JliXhnr
	bQVCHWXayazKi8EBM9ZucUe+gHYGLHIwd0JtloRdw/R/yFAHaxPtuPzgO/aFCb8e
	wWy8gvSmGm2Ce1RpQIpgzAERaDg2rimCMkuJXSO/yHPZlmc2TVJphf9sa5Qy7Bry
	6J1SF7Z+Aq4846bDFXIyNxH6RZpquRIUt/HeEwEp2TXvpMG76fJ65GNu0HoBs36F
	OnUVAl8Cg5In1gaUxu3OA==
X-ME-Sender: <xms:khPOZrHSH6PN74QM8ryw3cI6ceoPYrgFeOlI8iwDvv3MZshX8SMLxQ>
    <xme:khPOZoXX-Qyox8CJcDh3bsj2fKBwpEtgrMSCmxEio3Kzf-jODVXvS26yc68TxF5NL
    Bqhj2DSpyzgVYKBQHg>
X-ME-Received: <xmr:khPOZtKZ_vmZZUXf3o32DH128BB6IxVyNeCxe0f0FNtBpMbBbQ-z6vFCoWbG_PoaZK0QvJBrKWRusb7gCsh7Qi9Og8FFmS78iA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeftddguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftd
    dvleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrd
    hsvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehsrghkrghrihdrrghilhhushesihhkihdrfhhipdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhn
    uhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthgrghhinh
    hgsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:khPOZpGWFV5RBCRCwpgBGHp2C6rBswI_fGb1LNDffLMygFzX0urU7A>
    <xmx:khPOZhUmZzwpr1R9imC09niNOfcMVSp_PSyKX4K1juY4zMTFEdJvjA>
    <xmx:khPOZkOxZDbPoCuubiKq9MitJlvGAqCxW-xVA6fLR1fmMTXCxyl1JQ>
    <xmx:khPOZg09g5ZhGT4oooSD0QqA53VvX5Ij98vHctN8zcMyUmKrX4DFaA>
    <xmx:khPOZqNnZ9b_-BXW9nPnOeVi2zWUCTHWkdv6XbYNRitIofz_5mvwUqug>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Aug 2024 13:57:37 -0400 (EDT)
Date: Tue, 27 Aug 2024 19:57:35 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
Message-ID: <20240827175735.GH2636928@fsdn.se>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
 <Zs3Vey0NEdGJAyTE@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zs3Vey0NEdGJAyTE@valkosipuli.retiisi.eu>

Hej Sakari,

Tack för feedback.

On 2024-08-27 13:32:43 +0000, Sakari Ailus wrote:
> Hejssan,
> 
> Tack för lappan!
> 
> On Tue, Aug 27, 2024 at 03:18:41PM +0200, Niklas Söderlund wrote:
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
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v1
> > - Group in series together with binding.
> > ---
> >  drivers/staging/media/max96712/max96712.c | 26 ++++++++++++++++++-----
> >  1 file changed, 21 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> > index 6bdbccbee05a..6bd02276c413 100644
> > --- a/drivers/staging/media/max96712/max96712.c
> > +++ b/drivers/staging/media/max96712/max96712.c
> > @@ -17,8 +17,10 @@
> >  #include <media/v4l2-subdev.h>
> >  
> >  #define MAX96712_ID 0x20
> > +#define MAX96724_ID 0xA7
> >  
> >  #define MAX96712_DPLL_FREQ 1000
> > +#define MAX96724_DPLL_FREQ 1200
> >  
> >  enum max96712_pattern {
> >  	MAX96712_PATTERN_CHECKERBOARD = 0,
> > @@ -31,6 +33,7 @@ struct max96712_priv {
> >  	struct gpio_desc *gpiod_pwdn;
> >  
> >  	bool cphy;
> > +	bool max96724;
> >  	struct v4l2_mbus_config_mipi_csi2 mipi;
> >  
> >  	struct v4l2_subdev sd;
> > @@ -120,6 +123,7 @@ static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
> >  
> >  static void max96712_mipi_configure(struct max96712_priv *priv)
> >  {
> > +	unsigned int dpll_freq;
> >  	unsigned int i;
> >  	u8 phy5 = 0;
> >  
> > @@ -152,10 +156,11 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
> >  	max96712_write(priv, 0x8a5, phy5);
> >  
> >  	/* Set link frequency for PHY0 and PHY1. */
> > +	dpll_freq = priv->max96724 ? MAX96724_DPLL_FREQ : MAX96712_DPLL_FREQ;
> >  	max96712_update_bits(priv, 0x415, 0x3f,
> > -			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
> > +			     ((dpll_freq / 100) & 0x1f) | BIT(5));
> >  	max96712_update_bits(priv, 0x418, 0x3f,
> > -			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
> > +			     ((dpll_freq / 100) & 0x1f) | BIT(5));
> >  
> >  	/* Enable PHY0 and PHY1 */
> >  	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
> > @@ -181,7 +186,8 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
> >  	}
> >  
> >  	/* PCLK 75MHz. */
> > -	max96712_write(priv, 0x0009, 0x01);
> > +	if (!priv->max96724)
> > +		max96712_write(priv, 0x0009, 0x01);
> 
> It'd be nice to have a macro for this, espeically now that the driver
> supports more than one chip.

What do you mean by macro? To test for priv->max96724, a define for the 
register name or something else?

> 
> >  
> >  	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
> >  	max96712_write_bulk_value(priv, 0x1052, 0, 3);
> > @@ -303,6 +309,7 @@ static const struct v4l2_ctrl_ops max96712_ctrl_ops = {
> >  
> >  static int max96712_v4l2_register(struct max96712_priv *priv)
> >  {
> > +	unsigned int dpll_freq;
> >  	long pixel_rate;
> >  	int ret;
> >  
> > @@ -317,7 +324,8 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
> >  	 * TODO: Once V4L2_CID_LINK_FREQ is changed from a menu control to an
> >  	 * INT64 control it should be used here instead of V4L2_CID_PIXEL_RATE.
> >  	 */
> > -	pixel_rate = MAX96712_DPLL_FREQ / priv->mipi.num_data_lanes * 1000000;
> > +	dpll_freq = priv->max96724 ? MAX96724_DPLL_FREQ : MAX96712_DPLL_FREQ;
> > +	pixel_rate = dpll_freq / priv->mipi.num_data_lanes * 1000000;
> >  	v4l2_ctrl_new_std(&priv->ctrl_handler, NULL, V4L2_CID_PIXEL_RATE,
> >  			  pixel_rate, pixel_rate, 1, pixel_rate);
> >  
> > @@ -438,8 +446,15 @@ static int max96712_probe(struct i2c_client *client)
> >  	if (priv->gpiod_pwdn)
> >  		usleep_range(4000, 5000);
> >  
> > -	if (max96712_read(priv, 0x4a) != MAX96712_ID)
> > +	switch (max96712_read(priv, 0x4a)) {
> > +	case MAX96712_ID:
> > +		break;
> > +	case MAX96724_ID:
> > +		priv->max96724 = true;
> > +		break;
> > +	default:
> >  		return -ENODEV;
> > +	}
> >  
> >  	max96712_reset(priv);
> >  
> > @@ -463,6 +478,7 @@ static void max96712_remove(struct i2c_client *client)
> >  
> >  static const struct of_device_id max96712_of_table[] = {
> >  	{ .compatible = "maxim,max96712" },
> > +	{ .compatible = "maxim,max96724" },
> 
> How about adding compatible specific data to convey the model, instead of a
> switch? See e.g. drivers/media/i2c/ccs/ccs-core.c for an example.
> 
> You could store the DPLL frequency there, too.

Good idea, will do so in next version.

> 
> >  	{ /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, max96712_of_table);
> > 
> 
> -- 
> Trevliga hälsningar,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund


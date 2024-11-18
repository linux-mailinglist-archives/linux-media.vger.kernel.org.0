Return-Path: <linux-media+bounces-21486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1CD9D07BB
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 03:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3377B1F21694
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 02:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09D72D627;
	Mon, 18 Nov 2024 02:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e5uygLIM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188ECC8CE;
	Mon, 18 Nov 2024 02:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731895680; cv=none; b=IyNUD+HrZehH5yrfZNbbLg652CnYPDjqXZvsrcNHR5LIpvq+nUM57/kzJwXMhOTMFMPbgIwFhbBVUeFwWJdfDNnDJ428vYnE/VPX7pZ5RsUwuEGewAUqmC9NDTaWYzZD7pCszdCayvP0hZJP9ic8Lzt7+mQP4PsYCvQCEs8i9ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731895680; c=relaxed/simple;
	bh=9x7X+M06z6cwyNpbaG8A6rhUsdRKKZYT+MTu06m7R9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teYUlTDBJrXw3NyIDt5lHSRKPvbtBVq6TjdTVfN0ahKJvdS1+Fw4GeVxHCEcpeEQr3/s6esCpUd/JGFGcFIxJ6G3De9FlzOisvywZv6Ug4MRpI6kATsPtACFtji9dDITTAO0HGylRgXmXIpUf2YMkfp9o5VrKVULpCt/y9fL+0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e5uygLIM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A46588FA;
	Mon, 18 Nov 2024 03:07:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731895658;
	bh=9x7X+M06z6cwyNpbaG8A6rhUsdRKKZYT+MTu06m7R9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5uygLIMopKLfS4kXdTaymi4OpPsHmge5iA0zitm0omCF+7+7It7IqwZuOexVcoX4
	 goTMDq0OFejzfP9CKTeo94cI5EN3r1uOehhqC8y6CzbcqBwi+d2pFht3KBeWyO6vZ0
	 wYny+dCQGMUcQ6aDG1II2Q/OifCl0ffgbwqShBAs=
Date: Mon, 18 Nov 2024 04:07:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] media: i2c: imx290: Add configuration for IMX462
Message-ID: <20241118020745.GI31681@pendragon.ideasonboard.com>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-3-c538a2e24786@raspberrypi.com>
 <20241115000637.GK26171@pendragon.ideasonboard.com>
 <CAPY8ntBJu+mA3BcYkkVpr1L0jf2hp6e3kbpyGkB7mwbiDQDGzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntBJu+mA3BcYkkVpr1L0jf2hp6e3kbpyGkB7mwbiDQDGzQ@mail.gmail.com>

Hi Dave,

On Fri, Nov 15, 2024 at 08:51:55AM +0000, Dave Stevenson wrote:
> On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart wrote:
> > On Thu, Nov 14, 2024 at 04:01:15PM +0000, Dave Stevenson wrote:
> > > IMX462 is the successor to IMX290, and wants very minor
> > > changes to the register setup.
> > >
> > > Add the relevant configuration to support it.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/media/i2c/imx290.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 66 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index da654deb444a..f1780cc5d7cc 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -170,6 +170,8 @@ enum imx290_model {
> > >       IMX290_MODEL_IMX290LQR,
> > >       IMX290_MODEL_IMX290LLR,
> > >       IMX290_MODEL_IMX327LQR,
> > > +     IMX290_MODEL_IMX462LQR,
> > > +     IMX290_MODEL_IMX462LLR,
> > >  };
> > >
> > >  struct imx290_model_info {
> > > @@ -316,6 +318,50 @@ static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
> > >       { CCI_REG8(0x33b3), 0x04 },
> > >  };
> > >
> > > +static const struct cci_reg_sequence imx290_global_init_settings_462[] = {
> > > +     { CCI_REG8(0x300f), 0x00 },
> > > +     { CCI_REG8(0x3010), 0x21 },
> > > +     { CCI_REG8(0x3011), 0x02 },
> >
> > As far as I can tell, the only difference in the init sequence between
> > imx290_global_init_settings_290 and imx290_global_init_settings_462 is
> > 0x3011 register which is not present in imx290_global_init_settings_290.
> > It is however included in imx290_global_init_settings, and set to 0x02.
> > Could we therefore use imx290_global_init_settings_290 for the imx462 ?
> 
> I'd done a comparison of the datasheets, and register 0x3011 was the
> only one that changed. I'd missed that it was in
> imx290_global_init_settings.
> 
> My datasheets:
> IMX327LQR-C rev E17Z06B93 2019/03/25. 3011h "Set to 02h" (value
> changed in doc rev 0.3 from 0Ah)
> IMX290LQR-C rev E15510G82 2018/02/09. 3011h "Fixed to 00h" (always
> been that value).
> IMX462LQR-C rev E19Y13C13 2021/03/19. 3011h "Set to 02h" (value
> changed in doc rev 0.2 from 00h)
> The default value stated in all of them is 00h. In true Sony fashion,
> there's no description for that register functionality.
> 
> So actually it looks like it was the addition of IMX327 in [1] should
> have changed that setting, unless someone else has a more recent
> datasheet for IMX290 that updates that.

I agree with this analysis. It may be that setting the register to 0x02
would be fine, but it's hard to tell. Maybe it could be worth asking
Sony ?

> cc Alexander as the author of that patch. I'll find any discussion on it later.
> 
>   Dave
> 
> [1] https://github.com/torvalds/linux/commit/2d41947ec2c0140c65783982692c2e3d89853c47
> 
> > > +     { CCI_REG8(0x3016), 0x09 },
> > > +     { CCI_REG8(0x3070), 0x02 },
> > > +     { CCI_REG8(0x3071), 0x11 },
> > > +     { CCI_REG8(0x309b), 0x10 },
> > > +     { CCI_REG8(0x309c), 0x22 },
> > > +     { CCI_REG8(0x30a2), 0x02 },
> > > +     { CCI_REG8(0x30a6), 0x20 },
> > > +     { CCI_REG8(0x30a8), 0x20 },
> > > +     { CCI_REG8(0x30aa), 0x20 },
> > > +     { CCI_REG8(0x30ac), 0x20 },
> > > +     { CCI_REG8(0x30b0), 0x43 },
> > > +     { CCI_REG8(0x3119), 0x9e },
> > > +     { CCI_REG8(0x311c), 0x1e },
> > > +     { CCI_REG8(0x311e), 0x08 },
> > > +     { CCI_REG8(0x3128), 0x05 },
> > > +     { CCI_REG8(0x313d), 0x83 },
> > > +     { CCI_REG8(0x3150), 0x03 },
> > > +     { CCI_REG8(0x317e), 0x00 },
> > > +     { CCI_REG8(0x32b8), 0x50 },
> > > +     { CCI_REG8(0x32b9), 0x10 },
> > > +     { CCI_REG8(0x32ba), 0x00 },
> > > +     { CCI_REG8(0x32bb), 0x04 },
> > > +     { CCI_REG8(0x32c8), 0x50 },
> > > +     { CCI_REG8(0x32c9), 0x10 },
> > > +     { CCI_REG8(0x32ca), 0x00 },
> > > +     { CCI_REG8(0x32cb), 0x04 },
> > > +     { CCI_REG8(0x332c), 0xd3 },
> > > +     { CCI_REG8(0x332d), 0x10 },
> > > +     { CCI_REG8(0x332e), 0x0d },
> > > +     { CCI_REG8(0x3358), 0x06 },
> > > +     { CCI_REG8(0x3359), 0xe1 },
> > > +     { CCI_REG8(0x335a), 0x11 },
> > > +     { CCI_REG8(0x3360), 0x1e },
> > > +     { CCI_REG8(0x3361), 0x61 },
> > > +     { CCI_REG8(0x3362), 0x10 },
> > > +     { CCI_REG8(0x33b0), 0x50 },
> > > +     { CCI_REG8(0x33b2), 0x1a },
> > > +     { CCI_REG8(0x33b3), 0x04 },
> > > +};
> > > +
> > >  #define IMX290_NUM_CLK_REGS  2
> > >  static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
> > >       [IMX290_CLK_37_125] = {
> > > @@ -1455,6 +1501,20 @@ static const struct imx290_model_info imx290_models[] = {
> > >               .max_analog_gain = 98,
> > >               .name = "imx327",
> > >       },
> > > +     [IMX290_MODEL_IMX462LQR] = {
> > > +             .colour_variant = IMX290_VARIANT_COLOUR,
> > > +             .init_regs = imx290_global_init_settings_462,
> > > +             .init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> > > +             .max_analog_gain = 98,
> > > +             .name = "imx462",
> > > +     },
> > > +     [IMX290_MODEL_IMX462LLR] = {
> > > +             .colour_variant = IMX290_VARIANT_MONO,
> > > +             .init_regs = imx290_global_init_settings_462,
> > > +             .init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> > > +             .max_analog_gain = 98,
> > > +             .name = "imx462",
> > > +     },
> > >  };
> > >
> > >  static int imx290_parse_dt(struct imx290 *imx290)
> > > @@ -1653,6 +1713,12 @@ static const struct of_device_id imx290_of_match[] = {
> > >       }, {
> > >               .compatible = "sony,imx327lqr",
> > >               .data = &imx290_models[IMX290_MODEL_IMX327LQR],
> > > +     }, {
> > > +             .compatible = "sony,imx462lqr",
> > > +             .data = &imx290_models[IMX290_MODEL_IMX462LQR],
> > > +     }, {
> > > +             .compatible = "sony,imx462llr",
> > > +             .data = &imx290_models[IMX290_MODEL_IMX462LLR],
> > >       },
> > >       { /* sentinel */ },
> > >  };

-- 
Regards,

Laurent Pinchart


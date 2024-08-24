Return-Path: <linux-media+bounces-16702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFEF95DECC
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 17:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCCDE1F21B42
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 15:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C9D16BE1E;
	Sat, 24 Aug 2024 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fVAkjxs/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C048A947;
	Sat, 24 Aug 2024 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724514925; cv=none; b=rFq0jjAxsq1ATGfH9HB9KBWQ1+m/i/Bf5H7qllViB5bGXd2BieQKwj8ETS5a+T0Nb6ZxTSjo0EQ1EBz2lwLT6oO9o8gBAueeV6CpJRcbFwn8GcYZvNLOdZwS7i7d6y5bc+ihD7Wq2nMUMbGaaPnXOzKyh8DzZWUyi77Y0wJsQfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724514925; c=relaxed/simple;
	bh=nO0gEJn6mUvBgGzZrTDSwnGD4x53OE2qqwdKg6fL/WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXFoELvP9ljYU/MfrIeApn1nhzJP89dpj5U3kZr3MFc5Fupj/oAqaStKCrZ1PAmr098mEfj6SFsBEGex7mEmhD7Bq069K3rXJ9SnqT70/pacSGCxkpkZrw31NOKjzUwISFklrYVxiwF76/lDe9wr+hMFXO0xbffl0QpkK/cewI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fVAkjxs/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F95C6DE;
	Sat, 24 Aug 2024 17:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724514856;
	bh=nO0gEJn6mUvBgGzZrTDSwnGD4x53OE2qqwdKg6fL/WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVAkjxs/xdPiYQNSu/CHvJYsA0DYET2ko0kE2EYMsO5qpstgK0WZm2CGMI7e3wvGx
	 HZr36gg2NqwprDNW7lSyJ07y5UJHbxpJ0l1/rl7rg4zQXARPEtjC9PHB41GRDXem5D
	 mo07pgis3g80nWf40MTvUky2UusHnehAffo79ROI=
Date: Sat, 24 Aug 2024 18:55:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Biju Das <biju.das.au@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/2] media: mt9p031: Extend match support for OF tables
Message-ID: <20240824155518.GA3006@pendragon.ideasonboard.com>
References: <20230910160126.70122-1-biju.das.jz@bp.renesas.com>
 <20230910160126.70122-2-biju.das.jz@bp.renesas.com>
 <tlaikk73c5gc6y3bk6evuwtlizletaws7tuc5nk36hz2adkydp@duv2tjpqnios>
 <OS0PR01MB59226056EAA42B93D123CFB586F2A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <spi52a754wa4ghwvfa6hkoqiz5rws27jlrdfnintx7dfm5ccqv@cngal3bh6eje>
 <20240823155503.GR26098@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240823155503.GR26098@pendragon.ideasonboard.com>

On Fri, Aug 23, 2024 at 06:55:04PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> On Mon, Sep 11, 2023 at 11:25:03AM +0200, Jacopo Mondi wrote:
> > On Mon, Sep 11, 2023 at 09:14:35AM +0000, Biju Das wrote:
> > > > Subject: Re: [PATCH 1/2] media: mt9p031: Extend match support for OF tables
> > > >
> > > > Hi Biju
> > > >
> > > > On Sun, Sep 10, 2023 at 05:01:25PM +0100, Biju Das wrote:
> > > > > The driver has an OF match table, still, it uses an ID lookup table
> > > > > for retrieving match data. Currently, the driver is working on the
> > > > > assumption that an I2C device registered via OF will always match a
> > > > > legacy I2C device ID. The correct approach is to have an OF device ID
> > > > > table using i2c_get_match_data() if the devices are registered via OF/ID.
> > > > >
> > > > > Unify the OF/ID table by using MEDIA_BUS_FMT as match data for both
> > > > > these tables and replace the ID lookup table for the match data by
> > > > > i2c_get_match_data() and simplifly probe() and mt9p031_init_cfg()
> > > > >
> > > > > Drop mt9p031_init_cfg as there is no user.
> > > > >
> > > > > While at it, remove the trailing comma in the terminator entry for the
> > > > > OF table making code robust against (theoretical) misrebases or other
> > > > > similar things where the new entry goes _after_ the termination
> > > > > without the compiler noticing.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > >  drivers/media/i2c/mt9p031.c | 33 +++++++++++----------------------
> > > > >  1 file changed, 11 insertions(+), 22 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> > > > > index 348f1e1098fb..540cb519915c 100644
> > > > > --- a/drivers/media/i2c/mt9p031.c
> > > > > +++ b/drivers/media/i2c/mt9p031.c
> > > > > @@ -112,11 +112,6 @@
> > > > >  #define MT9P031_TEST_PATTERN_RED			0xa2
> > > > >  #define MT9P031_TEST_PATTERN_BLUE			0xa3
> > > > >
> > > > > -enum mt9p031_model {
> > > > > -	MT9P031_MODEL_COLOR,
> > > > > -	MT9P031_MODEL_MONOCHROME,
> > > > > -};
> > > > > -
> > > > >  struct mt9p031 {
> > > > >  	struct v4l2_subdev subdev;
> > > > >  	struct media_pad pad;
> > > > > @@ -129,7 +124,7 @@ struct mt9p031 {
> > > > >  	struct clk *clk;
> > > > >  	struct regulator_bulk_data regulators[3];
> > > > >
> > > > > -	enum mt9p031_model model;
> > > > > +	u32 code;
> > > > >  	struct aptina_pll pll;
> > > > >  	unsigned int clk_div;
> > > > >  	bool use_pll;
> > > > > @@ -714,12 +709,7 @@ static int mt9p031_init_cfg(struct v4l2_subdev *subdev,
> > > > >  	crop->height = MT9P031_WINDOW_HEIGHT_DEF;
> > > > >
> > > > >  	format = __mt9p031_get_pad_format(mt9p031, sd_state, 0, which);
> > > > > -
> > > > > -	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
> > > > > -		format->code = MEDIA_BUS_FMT_Y12_1X12;
> > > > > -	else
> > > > > -		format->code = MEDIA_BUS_FMT_SGRBG12_1X12;
> > > > > -
> > > > > +	format->code = mt9p031->code;
> > > > >  	format->width = MT9P031_WINDOW_WIDTH_DEF;
> > > > >  	format->height = MT9P031_WINDOW_HEIGHT_DEF;
> > > > >  	format->field = V4L2_FIELD_NONE;
> > > > > @@ -1104,7 +1094,6 @@ mt9p031_get_pdata(struct i2c_client *client)
> > > > >
> > > > >  static int mt9p031_probe(struct i2c_client *client)  {
> > > > > -	const struct i2c_device_id *did = i2c_client_get_device_id(client);
> > > > >  	struct mt9p031_platform_data *pdata = mt9p031_get_pdata(client);
> > > > >  	struct i2c_adapter *adapter = client->adapter;
> > > > >  	struct mt9p031 *mt9p031;
> > > > > @@ -1129,7 +1118,7 @@ static int mt9p031_probe(struct i2c_client *client)
> > > > >  	mt9p031->pdata = pdata;
> > > > >  	mt9p031->output_control	= MT9P031_OUTPUT_CONTROL_DEF;
> > > > >  	mt9p031->mode2 = MT9P031_READ_MODE_2_ROW_BLC;
> > > > > -	mt9p031->model = did->driver_data;
> > > > > +	mt9p031->code = (uintptr_t)i2c_get_match_data(client);
> > > > >
> > > > >  	mt9p031->regulators[0].supply = "vdd";
> > > > >  	mt9p031->regulators[1].supply = "vdd_io";
> > > > > @@ -1226,19 +1215,19 @@ static void mt9p031_remove(struct i2c_client *client)
> > > > >  }
> > > > >
> > > > >  static const struct i2c_device_id mt9p031_id[] = {
> > > > > -	{ "mt9p006", MT9P031_MODEL_COLOR },
> > > > > -	{ "mt9p031", MT9P031_MODEL_COLOR },
> > > > > -	{ "mt9p031m", MT9P031_MODEL_MONOCHROME },
> > > > > -	{ }
> > > > > +	{ "mt9p006", MEDIA_BUS_FMT_SGRBG12_1X12 },
> > > > > +	{ "mt9p031", MEDIA_BUS_FMT_SGRBG12_1X12 },
> > > > > +	{ "mt9p031m", MEDIA_BUS_FMT_Y12_1X12 },
> > > > > +	{ /* sentinel */ }
> > > > >  };
> > > > >  MODULE_DEVICE_TABLE(i2c, mt9p031_id);
> > > > >
> > > > >  #if IS_ENABLED(CONFIG_OF)
> > > > >  static const struct of_device_id mt9p031_of_match[] = {
> > > > > -	{ .compatible = "aptina,mt9p006", },
> > > > > -	{ .compatible = "aptina,mt9p031", },
> > > > > -	{ .compatible = "aptina,mt9p031m", },
> > > > > -	{ /* sentinel */ },
> > > > > +	{ .compatible = "aptina,mt9p006", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> > > > > +	{ .compatible = "aptina,mt9p031", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> > > > > +	{ .compatible = "aptina,mt9p031m", .data = (void *)MEDIA_BUS_FMT_Y12_1X12 },
> > > > > +	{ /* sentinel */ }
> > > >
> > > > I know it might sound not necessary, but isn't it better to wrap the
> > > > format in some sort of per-model structure. It would avoid a few type
> > > > casts too. Up to you though
> > >
> > > The problem with structure is, it will have one
> > > variable entry. I got some feedback related to similar
> > > patches not to add a single variable to structure
> > > and use the value directly instead.
> > 
> > Ok then, a matter of preferences I think. Up to you, really.
> 
> My preference actually goes for a structure too.
> 
> Given how long it took me to review this, I'll send a v2 of the series
> myself.

Actually it will be simpler to apply this series first and add changes
on top.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > > > >  };
> > > > >  MODULE_DEVICE_TABLE(of, mt9p031_of_match);
> > > > >  #endif

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-16673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C5695D21F
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 17:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA2BB1C213C4
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 15:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E36F18A6A9;
	Fri, 23 Aug 2024 15:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="otrlm9mn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE6E1898F2;
	Fri, 23 Aug 2024 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724428510; cv=none; b=TC0GdfUaoYVE1TjTokXUo0PlZZ0y0XIJ/WxjyOl/G/WtwtiARZAsZyeiKGL/SFt4l87dLNqKvpy1pkcknnxtwF5Wp4nnDJ82LT+SZOB/zT/KzQ2A/2ureTkAi+CjKYUQZTh7A0irsOfTR8uQjr8lMOP7+aCasKXBro9+7csWQf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724428510; c=relaxed/simple;
	bh=u0ik47u7Dtim42h8yF0qKIeCNCyWiDTs+zC8/Lh67SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDZ4U1GsdHGfUnsEeaD2jn++C5RLDFmcMSMiJ3QNcdSJ6TS4Xe+hA2ddOs/S9niZnorG9VxyvchdoCtu6pKwdjBln/MR5auwSns79g/VdPmFEacocoYH7xQES/bzADH+SNbgGWt6VWZEzyE0hR9sM7jh1ZTpTwMBH0TpBKUAAWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=otrlm9mn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FD86497;
	Fri, 23 Aug 2024 17:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724428442;
	bh=u0ik47u7Dtim42h8yF0qKIeCNCyWiDTs+zC8/Lh67SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otrlm9mnPJVverVAGVrlmaZ2J7DOVNYJZi0N9EZkVk6XtDUZRxxs3oKtBFovVHg0C
	 YR/jLYVtc/pZGlvgfmaSisLti3A5JnNljOHTzu45olNsVs8hxBJsXkgMfn53UOJCTH
	 +M0Wd22C3HakMAe+GoVpQmH+iHWSe7t5yGwV2jxg=
Date: Fri, 23 Aug 2024 18:55:03 +0300
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
Message-ID: <20240823155503.GR26098@pendragon.ideasonboard.com>
References: <20230910160126.70122-1-biju.das.jz@bp.renesas.com>
 <20230910160126.70122-2-biju.das.jz@bp.renesas.com>
 <tlaikk73c5gc6y3bk6evuwtlizletaws7tuc5nk36hz2adkydp@duv2tjpqnios>
 <OS0PR01MB59226056EAA42B93D123CFB586F2A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <spi52a754wa4ghwvfa6hkoqiz5rws27jlrdfnintx7dfm5ccqv@cngal3bh6eje>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <spi52a754wa4ghwvfa6hkoqiz5rws27jlrdfnintx7dfm5ccqv@cngal3bh6eje>

Hello,

On Mon, Sep 11, 2023 at 11:25:03AM +0200, Jacopo Mondi wrote:
> On Mon, Sep 11, 2023 at 09:14:35AM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH 1/2] media: mt9p031: Extend match support for OF tables
> > >
> > > Hi Biju
> > >
> > > On Sun, Sep 10, 2023 at 05:01:25PM +0100, Biju Das wrote:
> > > > The driver has an OF match table, still, it uses an ID lookup table
> > > > for retrieving match data. Currently, the driver is working on the
> > > > assumption that an I2C device registered via OF will always match a
> > > > legacy I2C device ID. The correct approach is to have an OF device ID
> > > > table using i2c_get_match_data() if the devices are registered via OF/ID.
> > > >
> > > > Unify the OF/ID table by using MEDIA_BUS_FMT as match data for both
> > > > these tables and replace the ID lookup table for the match data by
> > > > i2c_get_match_data() and simplifly probe() and mt9p031_init_cfg()
> > > >
> > > > Drop mt9p031_init_cfg as there is no user.
> > > >
> > > > While at it, remove the trailing comma in the terminator entry for the
> > > > OF table making code robust against (theoretical) misrebases or other
> > > > similar things where the new entry goes _after_ the termination
> > > > without the compiler noticing.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > >  drivers/media/i2c/mt9p031.c | 33 +++++++++++----------------------
> > > >  1 file changed, 11 insertions(+), 22 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> > > > index 348f1e1098fb..540cb519915c 100644
> > > > --- a/drivers/media/i2c/mt9p031.c
> > > > +++ b/drivers/media/i2c/mt9p031.c
> > > > @@ -112,11 +112,6 @@
> > > >  #define MT9P031_TEST_PATTERN_RED			0xa2
> > > >  #define MT9P031_TEST_PATTERN_BLUE			0xa3
> > > >
> > > > -enum mt9p031_model {
> > > > -	MT9P031_MODEL_COLOR,
> > > > -	MT9P031_MODEL_MONOCHROME,
> > > > -};
> > > > -
> > > >  struct mt9p031 {
> > > >  	struct v4l2_subdev subdev;
> > > >  	struct media_pad pad;
> > > > @@ -129,7 +124,7 @@ struct mt9p031 {
> > > >  	struct clk *clk;
> > > >  	struct regulator_bulk_data regulators[3];
> > > >
> > > > -	enum mt9p031_model model;
> > > > +	u32 code;
> > > >  	struct aptina_pll pll;
> > > >  	unsigned int clk_div;
> > > >  	bool use_pll;
> > > > @@ -714,12 +709,7 @@ static int mt9p031_init_cfg(struct v4l2_subdev *subdev,
> > > >  	crop->height = MT9P031_WINDOW_HEIGHT_DEF;
> > > >
> > > >  	format = __mt9p031_get_pad_format(mt9p031, sd_state, 0, which);
> > > > -
> > > > -	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
> > > > -		format->code = MEDIA_BUS_FMT_Y12_1X12;
> > > > -	else
> > > > -		format->code = MEDIA_BUS_FMT_SGRBG12_1X12;
> > > > -
> > > > +	format->code = mt9p031->code;
> > > >  	format->width = MT9P031_WINDOW_WIDTH_DEF;
> > > >  	format->height = MT9P031_WINDOW_HEIGHT_DEF;
> > > >  	format->field = V4L2_FIELD_NONE;
> > > > @@ -1104,7 +1094,6 @@ mt9p031_get_pdata(struct i2c_client *client)
> > > >
> > > >  static int mt9p031_probe(struct i2c_client *client)  {
> > > > -	const struct i2c_device_id *did = i2c_client_get_device_id(client);
> > > >  	struct mt9p031_platform_data *pdata = mt9p031_get_pdata(client);
> > > >  	struct i2c_adapter *adapter = client->adapter;
> > > >  	struct mt9p031 *mt9p031;
> > > > @@ -1129,7 +1118,7 @@ static int mt9p031_probe(struct i2c_client *client)
> > > >  	mt9p031->pdata = pdata;
> > > >  	mt9p031->output_control	= MT9P031_OUTPUT_CONTROL_DEF;
> > > >  	mt9p031->mode2 = MT9P031_READ_MODE_2_ROW_BLC;
> > > > -	mt9p031->model = did->driver_data;
> > > > +	mt9p031->code = (uintptr_t)i2c_get_match_data(client);
> > > >
> > > >  	mt9p031->regulators[0].supply = "vdd";
> > > >  	mt9p031->regulators[1].supply = "vdd_io";
> > > > @@ -1226,19 +1215,19 @@ static void mt9p031_remove(struct i2c_client *client)
> > > >  }
> > > >
> > > >  static const struct i2c_device_id mt9p031_id[] = {
> > > > -	{ "mt9p006", MT9P031_MODEL_COLOR },
> > > > -	{ "mt9p031", MT9P031_MODEL_COLOR },
> > > > -	{ "mt9p031m", MT9P031_MODEL_MONOCHROME },
> > > > -	{ }
> > > > +	{ "mt9p006", MEDIA_BUS_FMT_SGRBG12_1X12 },
> > > > +	{ "mt9p031", MEDIA_BUS_FMT_SGRBG12_1X12 },
> > > > +	{ "mt9p031m", MEDIA_BUS_FMT_Y12_1X12 },
> > > > +	{ /* sentinel */ }
> > > >  };
> > > >  MODULE_DEVICE_TABLE(i2c, mt9p031_id);
> > > >
> > > >  #if IS_ENABLED(CONFIG_OF)
> > > >  static const struct of_device_id mt9p031_of_match[] = {
> > > > -	{ .compatible = "aptina,mt9p006", },
> > > > -	{ .compatible = "aptina,mt9p031", },
> > > > -	{ .compatible = "aptina,mt9p031m", },
> > > > -	{ /* sentinel */ },
> > > > +	{ .compatible = "aptina,mt9p006", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> > > > +	{ .compatible = "aptina,mt9p031", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> > > > +	{ .compatible = "aptina,mt9p031m", .data = (void *)MEDIA_BUS_FMT_Y12_1X12 },
> > > > +	{ /* sentinel */ }
> > >
> > > I know it might sound not necessary, but isn't it better to wrap the
> > > format in some sort of per-model structure. It would avoid a few type
> > > casts too. Up to you though
> >
> > The problem with structure is, it will have one
> > variable entry. I got some feedback related to similar
> > patches not to add a single variable to structure
> > and use the value directly instead.
> 
> Ok then, a matter of preferences I think. Up to you, really.

My preference actually goes for a structure too.

Given how long it took me to review this, I'll send a v2 of the series
myself.

> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, mt9p031_of_match);
> > > >  #endif

-- 
Regards,

Laurent Pinchart


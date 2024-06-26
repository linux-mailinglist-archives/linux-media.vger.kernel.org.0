Return-Path: <linux-media+bounces-14156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CB6917B16
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 10:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99BE01F251C4
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 08:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9151C161935;
	Wed, 26 Jun 2024 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6QnkGuR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34EB15D5DE;
	Wed, 26 Jun 2024 08:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719391050; cv=none; b=A2/vTaAYTPRCvrFVpgXRcbIzZt2z1sfPfaMsMnrA/MSPZtZu4XBU4fJpj3F0nFaU8lpRUkq/TzfolVN2+uJL3UpVbC4OxuEs4nEbZOhMGk46YmS4GuLMdaKaLGxKgFFQaOaARMd6fycY/krcYJfcuuUkKB6G0ab9I7QfhAWqdvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719391050; c=relaxed/simple;
	bh=hgYHw13QgjDHwciSiCE3frsMhuTQRXEXLvu7UjXd2a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOEjCUGcIlnkxFnJBt/jae/sTD/tdkYbRsRMqZZwjQkOodmXvIZdsTauvVEilAl3HdN6QgV1GDBwLN1kTrkaC9BoGi01T1wjbbm10awVDc2sg2j0UZFD5J7kifDf3JSmuD+RfulpjvlnA3IEYvVoSiZQLjzQz/mOhxbK+oMNdI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6QnkGuR; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57d457357easo4610027a12.3;
        Wed, 26 Jun 2024 01:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719391046; x=1719995846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qhhr6F3ttkMzb2DjE7lumsrR6ivXDAnNeKcCjl83GfM=;
        b=e6QnkGuRyfUnF1gQA3LypF+HoSfSCxv9TwI/8VSsHorcXQr4/tnYuSOLmT44i7FV3X
         Nb+CNn3YFJCi4H62h9XeBY0MP60P06FapNAgk/WdndAbIcNjpRE3RKhvoPqxipkZ0qnh
         cDw1tqXPWf3Kj3YwH/z1uLsY9h7fCEC+lyFgTVN0ZnWa+pi01Rbvsjc4Ga4KgtwvSdwG
         1ex8PlGGZic0QAbxn/lTLuxTvVyKEIaJyWJyOgaRSbFHtJ7sXmzrs8uH9QAi3D1meaRb
         oUubLfjZVfmw/+PsdaXOOwovjl0srm/vx956kEIYpTJOP8JRgHOxOfhk6ZDuvIAqIg0l
         zfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719391046; x=1719995846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhhr6F3ttkMzb2DjE7lumsrR6ivXDAnNeKcCjl83GfM=;
        b=dcPwuZRlIwQD4QgsVfRd+7JR58Snq6Cgzjq5z7HWB3UGhSxYwr8M4Zy2sfyKdWpw7r
         InuNEFVnyh/LHYlHiy4LGCKKPopV35kRWyCD2Nj2Mk9zwzaXNl1fgYvRWI9vshz24J+6
         PMdHKHXuhPzn8RhZ18BT4dv9zMBSIjwdPwtzrSqO+Y9ynMKyaeQzK+qbKbUIMzGp71m9
         BpSamMtJgFdH+0dzpRATw3+umzeCpUSNO0T5rjjOM+Y1VMs0Pc0laMzyUgiWwy1vTNOQ
         epmxLL5FwKw00VXs4EtFSJro+kQiy94akqHLxo5fN07No72/Kl8M/RAGj8Fxf8/Oqy5F
         1tcA==
X-Forwarded-Encrypted: i=1; AJvYcCXA8MBKuJKv2MDnSATsahImPaT11GQJ/AnTvSnADa1aqV/O9Q2kLSaSOg5E8fL5DZI8/+t485pvbpEet82iuWJTlt+/c0EvUZS8esXMS8FrbqCPRDaAZBIOdtfT7vbdBTLllJ7ByqpiZyE=
X-Gm-Message-State: AOJu0Yysk8eH/am4eQ8ImOFdjOGUg6E+QJxumNwwaVeu0VK8ucHNRMYl
	xv38BloL2xnYz0MGUQGcdh+PPtxUXc5NZ5Q0J6pQ8zylJbNbYgnT
X-Google-Smtp-Source: AGHT+IGUf55wxQN0wPcDE6iUDwbAunmFaqnm7bMwpafjpMJxkx56NQTDmK9j2qCmRrCmDHFOOyE6Sw==
X-Received: by 2002:a17:906:5849:b0:a6f:c0e0:5512 with SMTP id a640c23a62f3a-a7245b8f72fmr638336366b.23.1719391045686;
        Wed, 26 Jun 2024 01:37:25 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-57-134.cust.vodafonedsl.it. [188.217.57.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7261795c58sm209239066b.118.2024.06.26.01.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 01:37:25 -0700 (PDT)
Date: Wed, 26 Jun 2024 10:37:23 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linuxfancy@googlegroups.com, sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] media: i2c: max96717: add test pattern ctrl
Message-ID: <ZnvTQ2BwTHVJvh6o@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240617145958.1819069-1-tomm.merciai@gmail.com>
 <20240617145958.1819069-2-tomm.merciai@gmail.com>
 <94d58f00-ef6a-4454-b028-bc3b7dcd927d@collabora.com>
 <Znr+2WZv8rUKNiZ+@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Znr+2WZv8rUKNiZ+@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>

On Tue, Jun 25, 2024 at 07:31:05PM +0200, Tommaso Merciai wrote:
> On Tue, Jun 25, 2024 at 09:54:18AM +0200, Julien Massot wrote:
> 
> Hi Julien,
> 
> > Hi Tommaso,
> > 
> > Thanks for your patch.
> > 
> > I tested it on my setup and can capture frames. Here's a link to an example:
> > https://pasteboard.co/j8yHuE4YdYDV.jpg.
> 
> Nice! Thanks for sharing and testing.
> 
> > 
> > I had some trouble with link validation because my sensor doesn't support
> > the RGB format. Once we have internal pad support, we won't need to worry
> > about the serializer creating an incompatible video stream for the sensor.
> > 
> > In the future, it would be great if we could support the serializer without
> > needing a connected sensor. This way, we can use it as a pattern generator
> > with this patch. However, not all GMSL2 serializers work this way. For
> > example, the MAX9295A can't generate an internal PCLK and relies on the
> > sensor to provide the video stream.
> 
> Fully agree.
> 
> > 
> > Overall, this patch is very useful as it lets us receive a pattern from the
> > serializer, which helps validate the GMSL2 connection.
> > 
> > It also handles issues related to generator timing, bits per pixel (bpp),
> > and tunnel mode that users might encounter.
> 
> Fully agree, in my case enabling this test pattern help me a lot on
> validating the gmsl2 pipe. 
> 
> > 
> > On 6/17/24 4:59 PM, Tommaso Merciai wrote:
> > > Add v4l2 test pattern control.
> > > 
> > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > ---
> > >   drivers/media/i2c/max96717.c | 210 ++++++++++++++++++++++++++++++++---
> > >   1 file changed, 194 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
> > > index 949306485873..c263bbca7318 100644
> > > --- a/drivers/media/i2c/max96717.c
> > > +++ b/drivers/media/i2c/max96717.c
> > > @@ -16,6 +16,7 @@
> > >   #include <linux/regmap.h>
> > >   #include <media/v4l2-cci.h>
> > > +#include <media/v4l2-ctrls.h>
> > >   #include <media/v4l2-fwnode.h>
> > >   #include <media/v4l2-subdev.h>
> > > @@ -36,11 +37,37 @@
> > >   #define MAX96717_DEV_ID  CCI_REG8(0xd)
> > >   #define MAX96717_DEV_REV CCI_REG8(0xe)
> > >   #define MAX96717_DEV_REV_MASK GENMASK(3, 0)
> > > +#define MAX96717_IO_CHK0 CCI_REG8(0x24f)
> > In MAX96717 datasheet this register is named VTX1.
> > Can you also move these definitions to the VTX section?
> > > +#define MAX96717_PATTERN_CLK_FREQ GENMASK(3, 1)
> > >   /* VID_TX Z */
> > > +#define MAX96717_VIDEO_TX0 CCI_REG8(0x110)
> > > +#define MAX96717_VIDEO_AUTO_BPP BIT(3)
> > >   #define MAX96717_VIDEO_TX2 CCI_REG8(0x112)
> > >   #define MAX96717_VIDEO_PCLKDET BIT(7)
> > > +/* VRX_PATGEN_0 */
> > For serializer these registers are named VTX_Z instead of VRX.
> > 
> > > +#define MAX96717_PATGEN_0              CCI_REG8(0x24e)
> > #define MAX96717_VTX_0              CCI_REG8(0x24e)
> > > +#define MAX96717_PATGEN_1              CCI_REG8(0x26b)
> > Can you keep this define ordered by address?
> > > +#define MAX96717_PATGEN_MODE           GENMASK(1, 0)
> > > +#define MAX96717_PATGEN_VS_DLY         CCI_REG24(0x250)
> > #define MAX96717_VTX_VS_DLY
> > > +#define MAX96717_PATGEN_VS_HIGH        CCI_REG24(0x253)
> > > +#define MAX96717_PATGEN_VS_LOW         CCI_REG24(0x256)
> > > +#define MAX96717_PATGEN_V2H            CCI_REG24(0x259)
> > > +#define MAX96717_PATGEN_HS_HIGH        CCI_REG16(0x25c)
> > > +#define MAX96717_PATGEN_HS_LOW         CCI_REG16(0x25e)
> > > +#define MAX96717_PATGEN_HS_CNT         CCI_REG16(0x260)
> > > +#define MAX96717_PATGEN_V2D            CCI_REG24(0x262)
> > > +#define MAX96717_PATGEN_DE_HIGH        CCI_REG16(0x265)
> > > +#define MAX96717_PATGEN_DE_LOW         CCI_REG16(0x267)
> > > +#define MAX96717_PATGEN_DE_CNT         CCI_REG16(0x269)
> > > +#define MAX96717_PATGEN_GRAD_INC       CCI_REG8(0x26c)
> > > +#define MAX96717_PATGEN_CHKB_COLOR_A   CCI_REG24(0x26d)
> > > +#define MAX96717_PATGEN_CHKB_COLOR_B   CCI_REG24(0x270)
> > > +#define MAX96717_PATGEN_CHKB_RPT_CNT_A CCI_REG8(0x273)
> > > +#define MAX96717_PATGEN_CHKB_RPT_CNT_B CCI_REG8(0x274)
> > > +#define MAX96717_PATGEN_CHKB_ALT       CCI_REG8(0x275)
> > > +
> 
> So your plan is to move all this stuff here:
> 
> 
> /* VTX_Z */
> #define MAX96717_VTX0                  CCI_REG8(0x24e)
> #define MAX96717_VTX1                  CCI_REG8(0x24f)
> #define MAX96717_PATTERN_CLK_FREQ      GENMASK(3, 1)
> #define MAX96717_VTX_VS_DLY            CCI_REG24(0x250)
> #define MAX96717_VTX_VS_HIGH           CCI_REG24(0x253)
> #define MAX96717_VTX_VS_LOW            CCI_REG24(0x256)
> #define MAX96717_VTX_V2H               CCI_REG24(0x259)
> #define MAX96717_VTX_HS_HIGH           CCI_REG16(0x25c)
> #define MAX96717_VTX_HS_LOW            CCI_REG16(0x25e)
> #define MAX96717_VTX_HS_CNT            CCI_REG16(0x260)
> #define MAX96717_VTX_V2D               CCI_REG24(0x262)
> #define MAX96717_VTX_DE_HIGH           CCI_REG16(0x265)
> #define MAX96717_VTX_DE_LOW            CCI_REG16(0x267)
> #define MAX96717_VTX_DE_CNT            CCI_REG16(0x269)
> #define MAX96717_VTX29                 CCI_REG8(0x26b)
> #define MAX96717_VTX_MODE              GENMASK(1, 0)
> #define MAX96717_VTX_GRAD_INC          CCI_REG8(0x26c)
> #define MAX96717_VTX_CHKB_COLOR_A      CCI_REG24(0x26d)
> #define MAX96717_VTX_CHKB_COLOR_B      CCI_REG24(0x270)
> #define MAX96717_VTX_CHKB_RPT_CNT_A    CCI_REG8(0x273)
> #define MAX96717_VTX_CHKB_RPT_CNT_B    CCI_REG8(0x274)
> #define MAX96717_VTX_CHKB_ALT          CCI_REG8(0x275)
> 
> In a fixed order right? :-)
> 
> 
> 
> > >   /* GPIO */
> > >   #define MAX96717_NUM_GPIO         11
> > >   #define MAX96717_GPIO_REG_A(gpio) CCI_REG8(0x2be + (gpio) * 3)
> > > @@ -82,6 +109,12 @@
> > >   /* MISC */
> > >   #define PIO_SLEW_1 CCI_REG8(0x570)
> > > +enum max96717_vpg_mode {
> > > +	MAX96717_VPG_DISABLED = 0,
> > > +	MAX96717_VPG_CHECKERBOARD = 1,
> > > +	MAX96717_VPG_GRADIENT = 2,
> > > +};
> > > +
> > >   struct max96717_priv {
> > >   	struct i2c_client		  *client;
> > >   	struct regmap			  *regmap;
> > > @@ -89,6 +122,7 @@ struct max96717_priv {
> > >   	struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
> > >   	struct v4l2_subdev                sd;
> > >   	struct media_pad                  pads[MAX96717_PORTS];
> > > +	struct v4l2_ctrl_handler          ctrl_handler;
> > >   	struct v4l2_async_notifier        notifier;
> > >   	struct v4l2_subdev                *source_sd;
> > >   	u16                               source_sd_pad;
> > > @@ -96,6 +130,7 @@ struct max96717_priv {
> > >   	u8                                pll_predef_index;
> > >   	struct clk_hw                     clk_hw;
> > >   	struct gpio_chip                  gpio_chip;
> > > +	enum max96717_vpg_mode            pattern;
> > >   };
> > >   static inline struct max96717_priv *sd_to_max96717(struct v4l2_subdev *sd)
> > > @@ -131,6 +166,115 @@ static inline int max96717_start_csi(struct max96717_priv *priv, bool start)
> > >   			       start ? MAX96717_START_PORT_B : 0, NULL);
> > >   }
> > > +static int max96717_apply_patgen_timing(struct max96717_priv *priv,
> > > +					struct v4l2_subdev_state *state)
> > > +{
> > > +	struct v4l2_mbus_framefmt *fmt =
> > > +		v4l2_subdev_state_get_format(state, MAX96717_PAD_SOURCE);
> > > +	const u32 h_active = fmt->width;
> > > +	const u32 h_fp = 88;
> > > +	const u32 h_sw = 44;
> > > +	const u32 h_bp = 148;
> > > +	u32 h_tot;
> > > +	const u32 v_active = fmt->height;
> > > +	const u32 v_fp = 4;
> > > +	const u32 v_sw = 5;
> > > +	const u32 v_bp = 36;
> > > +	u32 v_tot;
> > > +	int ret = 0;
> > > +
> > > +	h_tot = h_active + h_fp + h_sw + h_bp;
> > > +	v_tot = v_active + v_fp + v_sw + v_bp;
> > > +
> > > +	/* 75 Mhz pixel clock */
> > > +	cci_update_bits(priv->regmap, MAX96717_IO_CHK0,
> > > +			MAX96717_PATTERN_CLK_FREQ, 0xa, &ret);
> > > +
> > > +	dev_info(&priv->client->dev, "height: %d width: %d\n", fmt->height,
> > > +		 fmt->width);
> > > +
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_VS_DLY, 0, &ret);
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_VS_HIGH, v_sw * h_tot, &ret);
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_VS_LOW,
> > > +		  (v_active + v_fp + v_bp) * h_tot, &ret);
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_HS_HIGH, h_sw, &ret);
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_HS_LOW, h_active + h_fp + h_bp,
> > > +		  &ret);
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_V2D,
> > > +		  h_tot * (v_sw + v_bp) + (h_sw + h_bp), &ret);
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_HS_CNT, v_tot, &ret);
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_DE_HIGH, h_active, &ret);
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_DE_LOW, h_fp + h_sw + h_bp,
> > > +		  &ret);
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_DE_CNT, v_active, &ret);
> > > +	/* B G R */
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_COLOR_A, 0xfecc00, &ret);
> > > +	/* B G R */
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_COLOR_B, 0x006aa7, &ret);
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_RPT_CNT_A, 0x3c, &ret);
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_RPT_CNT_B, 0x3c, &ret);
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_ALT, 0x3c, &ret);
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_GRAD_INC, 0x10, &ret);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int max96717_apply_patgen(struct max96717_priv *priv,
> > > +				 struct v4l2_subdev_state *state)
> > > +{
> > > +	unsigned int val;
> > > +	int ret = 0;
> > > +
> > > +	if (priv->pattern)
> > > +		ret = max96717_apply_patgen_timing(priv, state);
> > > +
> > > +	cci_write(priv->regmap, MAX96717_PATGEN_0, priv->pattern ? 0xfb : 0,
> > > +		  &ret);
> > > +
> > > +	val = FIELD_PREP(MAX96717_PATGEN_MODE, priv->pattern);
> > > +	cci_update_bits(priv->regmap, MAX96717_PATGEN_1, MAX96717_PATGEN_MODE,
> > > +			val, &ret);
> > > +	return ret;
> > > +}
> > > +
> > > +static int max96717_s_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +	struct max96717_priv *priv =
> > > +		container_of(ctrl->handler, struct max96717_priv, ctrl_handler);
> > > +	int ret;
> > > +
> > > +	switch (ctrl->id) {
> > > +	case V4L2_CID_TEST_PATTERN:
> > > +		if (priv->enabled_source_streams)
> > > +			return -EBUSY;
> > > +		priv->pattern = ctrl->val;
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* Use bpp from bpp register */
> > > +	ret = cci_update_bits(priv->regmap, MAX96717_VIDEO_TX0,
> > > +			      MAX96717_VIDEO_AUTO_BPP,
> > > +			      priv->pattern ? 0 : MAX96717_VIDEO_AUTO_BPP,
> > > +			      NULL);
> > > +
> > > +	/* Pattern generator doesn't work with tunnel mode */
> > Can you add a comment saying that the deserializer should manage the link in
> > pixel mode as well.
> 
> Something like:
> 	/* Pattern generator doesn't work with tunnel mode.
> 	   Is mandatory to put also the deserializer into pixel mode.   
>         */

Actually I plan to add to add the following comment:

	/*
	 * Pattern generator doesn't work with tunnel mode.
	 * Needs RGB color format and deserializer tunnel mode must be disabled.
	 */
	return cci_update_bits(priv->regmap, MAX96717_MIPI_RX_EXT11,
			       MAX96717_TUN_MODE,
			       priv->pattern ? 0 : MAX96717_TUN_MODE, &ret);

Let me know if this can be ok for you.

Thanks & Regards,
Tommaso

> 
> What do you think?
> 
> Thanks & Regards,
> Tommaso
> 
> > > +	return cci_update_bits(priv->regmap, MAX96717_MIPI_RX_EXT11,
> > > +			       MAX96717_TUN_MODE,
> > > +			       priv->pattern ? 0 : MAX96717_TUN_MODE, &ret);
> > > +}
> > > +
> > > +static const char * const max96717_test_pattern[] = {
> > > +	"Disabled",
> > > +	"Checkerboard",
> > > +	"Gradient"
> > > +};
> > > +
> > > +static const struct v4l2_ctrl_ops max96717_ctrl_ops = {
> > > +	.s_ctrl = max96717_s_ctrl,
> > > +};
> > > +
> > >   static int max96717_gpiochip_get(struct gpio_chip *gpiochip,
> > >   				 unsigned int offset)
> > >   {
> > > @@ -352,20 +496,28 @@ static int max96717_enable_streams(struct v4l2_subdev *sd,
> > >   	u64 sink_streams;
> > >   	int ret;
> > > -	sink_streams = v4l2_subdev_state_xlate_streams(state,
> > > -						       MAX96717_PAD_SOURCE,
> > > -						       MAX96717_PAD_SINK,
> > > -						       &streams_mask);
> > > -
> > >   	if (!priv->enabled_source_streams)
> > >   		max96717_start_csi(priv, true);
> > > -	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
> > > -					 sink_streams);
> > > -	if (ret) {
> > > -		dev_err(dev, "Fail to start streams:%llu on remote subdev\n",
> > > -			sink_streams);
> > > +	ret = max96717_apply_patgen(priv, state);
> > > +	if (ret)
> > >   		goto stop_csi;
> > > +
> > > +	if (!priv->pattern) {
> > > +		sink_streams =
> > > +			v4l2_subdev_state_xlate_streams(state,
> > > +							MAX96717_PAD_SOURCE,
> > > +							MAX96717_PAD_SINK,
> > > +							&streams_mask);
> > > +
> > > +		ret = v4l2_subdev_enable_streams(priv->source_sd,
> > > +						 priv->source_sd_pad,
> > > +						 sink_streams);
> > > +		if (ret) {
> > > +			dev_err(dev, "Fail to start streams:%llu on remote subdev\n",
> > > +				sink_streams);
> > > +			goto stop_csi;
> > > +		}
> > >   	}
> > >   	priv->enabled_source_streams |= streams_mask;
> > > @@ -394,13 +546,23 @@ static int max96717_disable_streams(struct v4l2_subdev *sd,
> > >   	if (!priv->enabled_source_streams)
> > >   		max96717_start_csi(priv, false);
> > > -	sink_streams = v4l2_subdev_state_xlate_streams(state,
> > > -						       MAX96717_PAD_SOURCE,
> > > -						       MAX96717_PAD_SINK,
> > > -						       &streams_mask);
> > > +	if (!priv->pattern) {
> > > +		int ret;
> > > +
> > > +		sink_streams =
> > > +			v4l2_subdev_state_xlate_streams(state,
> > > +							MAX96717_PAD_SOURCE,
> > > +							MAX96717_PAD_SINK,
> > > +							&streams_mask);
> > > -	return v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
> > > -					   sink_streams);
> > > +		ret = v4l2_subdev_disable_streams(priv->source_sd,
> > > +						  priv->source_sd_pad,
> > > +						  sink_streams);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	return 0;
> > >   }
> > >   static const struct v4l2_subdev_pad_ops max96717_pad_ops = {
> > > @@ -513,6 +675,19 @@ static int max96717_subdev_init(struct max96717_priv *priv)
> > >   	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96717_subdev_ops);
> > >   	priv->sd.internal_ops = &max96717_internal_ops;
> > > +	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
> > > +	priv->sd.ctrl_handler = &priv->ctrl_handler;
> > > +
> > > +	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler,
> > > +				     &max96717_ctrl_ops,
> > > +				     V4L2_CID_TEST_PATTERN,
> > > +				     ARRAY_SIZE(max96717_test_pattern) - 1,
> > > +				     0, 0, max96717_test_pattern);
> > > +	if (priv->ctrl_handler.error) {
> > > +		ret = priv->ctrl_handler.error;
> > > +		goto err_free_ctrl;
> > > +	}
> > > +
> > >   	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> > >   	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> > >   	priv->sd.entity.ops = &max96717_entity_ops;
> > > @@ -552,6 +727,8 @@ static int max96717_subdev_init(struct max96717_priv *priv)
> > >   	v4l2_subdev_cleanup(&priv->sd);
> > >   err_entity_cleanup:
> > >   	media_entity_cleanup(&priv->sd.entity);
> > > +err_free_ctrl:
> > > +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> > >   	return ret;
> > >   }
> > > @@ -563,6 +740,7 @@ static void max96717_subdev_uninit(struct max96717_priv *priv)
> > >   	v4l2_async_nf_cleanup(&priv->notifier);
> > >   	v4l2_subdev_cleanup(&priv->sd);
> > >   	media_entity_cleanup(&priv->sd.entity);
> > > +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> > >   }
> > >   struct max96717_pll_predef_freq {
> > 
> > Regards,
> > Julien


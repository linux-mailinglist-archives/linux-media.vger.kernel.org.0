Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46DB527C103
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 11:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgI2JYq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 05:24:46 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35833 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727700AbgI2JYq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 05:24:46 -0400
Received: by mail-ed1-f65.google.com with SMTP id i1so5588219edv.2;
        Tue, 29 Sep 2020 02:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G7eKygSeHsJSU7Elok8vNPdgOrN4BcXLT668jf/UCZU=;
        b=JaQMgQ3oObw2P/GgUStr1at0Ym3h9iDRFMgUyt0gtzBCW3gbrVB3Kk3gi9h8oA234/
         XIU6YlRNKd05pSKjvqtgAlbeW8XFsSrnYS1tHn07XbnDLBFNRbZiYwTQb8NkgUE8vWh2
         vruMqzl9qmXQ8pmmmZA5C98oem+pTPe7JlPdWwoVU2r5VmYIz3Xkk72uy07QptZGv4bM
         Tt+Cx+bZ9Za2arqh3+WQMq/fiGL/53bmK/3bEShTUong4Gb2ov/M+cyoFpPH15Or9nAY
         UKJyav++2oAFvpUMLv1h0gAs8sKgnhG2DohP86McaK/a6fee3t3UTQfpv79HLu1YcPoe
         hbfA==
X-Gm-Message-State: AOAM531v+SVE/oIAvUzc6EL4Fp+Zqdrwj07EMKiutevbMBeAp2YjfqMK
        I+vFEN4khxOHtEj8U9RNxbU=
X-Google-Smtp-Source: ABdhPJwy6PsDLNLt1asd/+TESiGE1ob3XYxQF6V+VCOkN/LAHdLPvY+CsJw4WUuQaVDgBnRSbxgBSg==
X-Received: by 2002:a50:fc91:: with SMTP id f17mr2277096edq.319.1601371483585;
        Tue, 29 Sep 2020 02:24:43 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
        by smtp.googlemail.com with ESMTPSA id z17sm5566137edi.90.2020.09.29.02.24.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 02:24:42 -0700 (PDT)
Date:   Tue, 29 Sep 2020 11:24:35 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] media: i2c: imx258: get clock from device
 properties and enable it via runtime PM
Message-ID: <20200929092435.GA10284@kozik-lap>
References: <20200923152129.21736-1-krzk@kernel.org>
 <20200923152129.21736-4-krzk@kernel.org>
 <20200929091704.GG26842@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200929091704.GG26842@paasikivi.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 29, 2020 at 12:17:04PM +0300, Sakari Ailus wrote:
> Hi Krzysztof,
> 
> On Wed, Sep 23, 2020 at 05:21:29PM +0200, Krzysztof Kozlowski wrote:
> > The IMX258 sensor driver checked in device properties for a
> > clock-frequency property which actually does not mean that the clock is
> > really running such frequency or is it even enabled.
> > 
> > Get the provided clock and check it frequency.  If none is provided,
> > fall back to old property.
> > 
> > Enable the clock when accessing the IMX258 registers and when streaming
> > starts with runtime PM.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 
> > Changes since v3:
> > 1. None
> > 
> > Changes since v2:
> > 1. Do not try to set drvdata, wrap lines.
> > 2. Use dev_dbg.
> > 
> > Changes since v1:
> > 1. Use runtime PM for clock toggling
> > ---
> >  drivers/media/i2c/imx258.c | 71 +++++++++++++++++++++++++++++++++-----
> >  1 file changed, 62 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > index ae183b0dbba9..7bedbfe5c4d6 100644
> > --- a/drivers/media/i2c/imx258.c
> > +++ b/drivers/media/i2c/imx258.c
> > @@ -2,6 +2,7 @@
> >  // Copyright (C) 2018 Intel Corporation
> >  
> >  #include <linux/acpi.h>
> > +#include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> > @@ -68,6 +69,9 @@
> >  #define REG_CONFIG_MIRROR_FLIP		0x03
> >  #define REG_CONFIG_FLIP_TEST_PATTERN	0x02
> >  
> > +/* Input clock frequency in Hz */
> > +#define IMX258_INPUT_CLOCK_FREQ		19200000
> > +
> >  struct imx258_reg {
> >  	u16 address;
> >  	u8 val;
> > @@ -610,6 +614,8 @@ struct imx258 {
> >  
> >  	/* Streaming on/off */
> >  	bool streaming;
> > +
> > +	struct clk *clk;
> >  };
> >  
> >  static inline struct imx258 *to_imx258(struct v4l2_subdev *_sd)
> > @@ -972,6 +978,29 @@ static int imx258_stop_streaming(struct imx258 *imx258)
> >  	return 0;
> >  }
> >  
> > +static int imx258_power_on(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +	struct imx258 *imx258 = to_imx258(sd);
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(imx258->clk);
> > +	if (ret)
> > +		dev_err(dev, "failed to enable clock\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static int imx258_power_off(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +	struct imx258 *imx258 = to_imx258(sd);
> > +
> > +	clk_disable_unprepare(imx258->clk);
> > +
> > +	return 0;
> > +}
> > +
> >  static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >  	struct imx258 *imx258 = to_imx258(sd);
> > @@ -1199,9 +1228,28 @@ static int imx258_probe(struct i2c_client *client)
> >  	int ret;
> >  	u32 val = 0;
> >  
> > -	device_property_read_u32(&client->dev, "clock-frequency", &val);
> > -	if (val != 19200000)
> > -		return -EINVAL;
> > +	imx258 = devm_kzalloc(&client->dev, sizeof(*imx258), GFP_KERNEL);
> > +	if (!imx258)
> > +		return -ENOMEM;
> > +
> > +	imx258->clk = devm_clk_get_optional(&client->dev, NULL);
> > +	if (!imx258->clk) {
> > +		dev_dbg(&client->dev,
> > +			"no clock provided, using clock-frequency property\n");
> > +
> > +		device_property_read_u32(&client->dev, "clock-frequency", &val);
> > +		if (val != IMX258_INPUT_CLOCK_FREQ)
> > +			return -EINVAL;
> > +	} else if (IS_ERR(imx258->clk)) {
> > +		return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
> > +				     "error getting clock\n");
> > +	} else {
> > +		if (clk_get_rate(imx258->clk) != IMX258_INPUT_CLOCK_FREQ) {
> > +			dev_err(&client->dev,
> > +				"input clock frequency not supported\n");
> > +			return -EINVAL;
> > +		}
> > +	}
> >  
> >  	/*
> >  	 * Check that the device is mounted upside down. The driver only
> > @@ -1211,24 +1259,25 @@ static int imx258_probe(struct i2c_client *client)
> >  	if (ret || val != 180)
> >  		return -EINVAL;
> >  
> > -	imx258 = devm_kzalloc(&client->dev, sizeof(*imx258), GFP_KERNEL);
> > -	if (!imx258)
> > -		return -ENOMEM;
> > -
> >  	/* Initialize subdev */
> >  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
> >  
> > +	/* Will be powered off via pm_runtime_idle */
> > +	ret = imx258_power_on(&client->dev);
> > +	if (ret)
> > +		return ret;
> > +
> >  	/* Check module identity */
> >  	ret = imx258_identify_module(imx258);
> >  	if (ret)
> > -		return ret;
> > +		goto error_identify;
> >  
> >  	/* Set default mode to max resolution */
> >  	imx258->cur_mode = &supported_modes[0];
> >  
> >  	ret = imx258_init_controls(imx258);
> >  	if (ret)
> > -		return ret;
> > +		goto error_identify;
> >  
> >  	/* Initialize subdev */
> >  	imx258->sd.internal_ops = &imx258_internal_ops;
> > @@ -1258,6 +1307,9 @@ static int imx258_probe(struct i2c_client *client)
> >  error_handler_free:
> >  	imx258_free_controls(imx258);
> >  
> > +error_identify:
> > +	imx258_power_off(&client->dev);
> 
> You'll need this in remove callback, too.

True, there is no runtime idle call so this is missing.

Thanks.

Best regards,
Krzysztof


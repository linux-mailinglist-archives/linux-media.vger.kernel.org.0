Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C5E2B8585
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 21:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgKRU1S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 15:27:18 -0500
Received: from mail-ej1-f67.google.com ([209.85.218.67]:42390 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgKRU1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 15:27:17 -0500
Received: by mail-ej1-f67.google.com with SMTP id i19so4603426ejx.9;
        Wed, 18 Nov 2020 12:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W2fBMhQfDyimj8ftEYNVk5h+ZPnnXBgf5DRDPVqq7wU=;
        b=MSRhoFgxgOvO72UWnPKm/C8LSoIO/QoWywo8etxKXZmSu9F95lUiimYHJpKDE+6Dli
         sUvtDMhocPHUdcWolMiY7FtfyJ21VEhctCPHg24vHWziWpA+iK3pvzGE5ETOnNkyBU2q
         PDz5E9/IVRNTMdofOvWVVE1jOx04RlbunmltF5grkbFMLkuojq/PU/wUKshzSI4sAZHe
         lbsUVzo8nqJzMkvx45pVMlDyLSwChnRX1/PtaNzolL7v4ovRbeoGjAmOwh67GSoB4nZU
         kWZpGGeIYfyTk2YH0zJmsY5hkOHsanjfaY5E96gRhtuPZEYcpl6A/wiuJ5cQ5fWKaT0Y
         q6TQ==
X-Gm-Message-State: AOAM532qJQoUwdVR3xkaaKCq2jibp6MMCWRx4TjgGHNyn7+4Iw7m5fYA
        24r2o33pkNRA99nz/jBmgaw=
X-Google-Smtp-Source: ABdhPJzpdxqwLy+WieIOcI43Sds1kbXtCbcj+afnu+P01W3Z00Hb/3EtW5r+ocmenk8kIQECEE5XAg==
X-Received: by 2002:a17:906:2a0a:: with SMTP id j10mr4873975eje.307.1605731233667;
        Wed, 18 Nov 2020 12:27:13 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id ew18sm4156200ejb.86.2020.11.18.12.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 12:27:12 -0800 (PST)
Date:   Wed, 18 Nov 2020 21:27:10 +0100
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
Subject: Re: [PATCH v5 4/4] media: i2c: imx258: get clock from device
 properties and enable it via runtime PM
Message-ID: <20201118202036.GA5631@kozik-lap>
References: <20201019170247.92002-1-krzk@kernel.org>
 <20201019172617.92815-1-krzk@kernel.org>
 <20201019172617.92815-3-krzk@kernel.org>
 <20201102150847.GZ26150@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201102150847.GZ26150@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 02, 2020 at 05:08:47PM +0200, Sakari Ailus wrote:
> Hi Krysztof,
> 
> On Mon, Oct 19, 2020 at 07:26:17PM +0200, Krzysztof Kozlowski wrote:
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
> > Changes since v4:
> > 1. Add missing imx258_power_off.
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
> >  drivers/media/i2c/imx258.c | 73 +++++++++++++++++++++++++++++++++-----
> >  1 file changed, 64 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > index ae183b0dbba9..038115471f17 100644
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
> 
> Please move the check outside the conditional block. May be a separate
> patch if you like.

OK

Best regards,
Krzysztof

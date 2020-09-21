Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B369272348
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 14:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgIUMCk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 08:02:40 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41654 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgIUMCk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 08:02:40 -0400
Received: by mail-ed1-f68.google.com with SMTP id ay8so12465614edb.8;
        Mon, 21 Sep 2020 05:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ooMeOqFsTMGGMTe6eBLr2JMOUkuXwIh/FFAOaUcM2v0=;
        b=k5jlfVQLt8OsxXqlfL9ltdQ4o7rAz+QrGvHWYb9Fqbocc3POYufWgVdz4rrVFMln1q
         y+2j/jqSN8IbiMi96sHjdYhtJNu9GS+HU5FV5p8hHnThAyi9KXaINFCICnLdy4Rnv8KP
         09b29gt21bURtg+P6N0tHwvqmquEhpA1IJblnAB4QjpaUpV4g/ImQ1kML2wFHW2wfwYZ
         1elHm5AVxZXw9rt5ITKj292XGfLlo4yfFL3AmisPp6asCMG0eOJmOSx1fW2zcvhfwpNg
         lbiby1jiuxb6tIxZuBV5pOJN3/YQj/HnGd03Bpef0xnxZQeByR89mDtHEL9IoiUcbBK7
         SXXg==
X-Gm-Message-State: AOAM530+JN1veaIdurvkWWLWjDZTq/3ccvi0rDN8G+ZYCmR1/f2tOkig
        +1zTJxuGwFD4V3HVJqedYFY=
X-Google-Smtp-Source: ABdhPJxt7v8AvSUBkvJ6qkwYaOh3b7yjN1eWTtOk3ANPGVwOskaBIoo2jvk2Zg9Tvz2Dpnkz6P6KoA==
X-Received: by 2002:aa7:d4d2:: with SMTP id t18mr50829445edr.55.1600689757765;
        Mon, 21 Sep 2020 05:02:37 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
        by smtp.googlemail.com with ESMTPSA id c8sm8771235ejp.30.2020.09.21.05.02.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 05:02:36 -0700 (PDT)
Date:   Mon, 21 Sep 2020 14:02:34 +0200
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
Subject: Re: [PATCH v2 3/3] media: imx258: Get clock from device properties
 and enable it via runtime PM
Message-ID: <20200921120234.GB1233@kozik-lap>
References: <1599031090-21608-1-git-send-email-krzk@kernel.org>
 <1599031090-21608-3-git-send-email-krzk@kernel.org>
 <20200902073935.GD32646@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200902073935.GD32646@paasikivi.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 02, 2020 at 10:39:35AM +0300, Sakari Ailus wrote:
> Hi Krzysztof,
> 
> Thanks for the update.
> 
> On Wed, Sep 02, 2020 at 09:18:10AM +0200, Krzysztof Kozlowski wrote:
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
> > Changes since v1:
> > 1. Use runtime PM for clock toggling
> > ---
> >  drivers/media/i2c/imx258.c | 68 ++++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 59 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > index c20bac9b00ec..ee38dafb8450 100644
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
> > @@ -972,6 +978,27 @@ static int imx258_stop_streaming(struct imx258 *imx258)
> >  	return 0;
> >  }
> >  
> > +static int imx258_power_on(struct device *dev)
> > +{
> > +	struct imx258 *imx258 = dev_get_drvdata(dev);
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
> > +	struct imx258 *imx258 = dev_get_drvdata(dev);
> > +
> > +	clk_disable_unprepare(imx258->clk);
> > +
> > +	return 0;
> > +}
> > +
> >  static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >  	struct imx258 *imx258 = to_imx258(sd);
> > @@ -1201,9 +1228,27 @@ static int imx258_probe(struct i2c_client *client)
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
> > +	dev_set_drvdata(&client->dev, imx258);
> 
> This you cannot do --- it'll be overwritten by v4l2_i2c_subdev_init().

Right, thanks.

> 
> > +
> > +	imx258->clk = devm_clk_get_optional(&client->dev, NULL);
> > +	if (!imx258->clk) {
> 
> You can move declaration of val here (I think).

No, the val is used later in further device_property_read* calls.

> 
> > +		dev_info(&client->dev, "no clock provided, using clock-frequency property\n");
> 
> As this is showing up on all ACPI based systems, I guess dev_dbg() would be
> more appropriate.

Sure, I'll make it debug.

> 
> Please also wrap lines over 80 if they reasonably can be.

OK

Thanks for the review.

Best regards,
Krzysztof

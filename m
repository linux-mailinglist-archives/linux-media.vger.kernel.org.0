Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1544B1EF8AE
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 15:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgFENKT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 09:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbgFENKS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 09:10:18 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71FFAC08C5C2
        for <linux-media@vger.kernel.org>; Fri,  5 Jun 2020 06:10:17 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id x6so9654296wrm.13
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2020 06:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ONcVi0Nh167uW5jvnDAvvL/9nwO9qJvjZBb+j6gK/m0=;
        b=F4Lgik0u6LwAU6Xf/6ApIw5It56BB+9tgE/OPpOJgLbUAtNYveMx4QPaScdOxL1Thc
         RpJYQRZYjDuW2mc+1HKFtdJ9+uQlGvj0JhsyXDCKzS0WP9TCv/B+IOzx0DhE1GbQZlJj
         FNwuohFAfHvUMOI8uAtrUY7s4RV6bFNs2MGic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ONcVi0Nh167uW5jvnDAvvL/9nwO9qJvjZBb+j6gK/m0=;
        b=sLtXY5dIgNsMcB1QYnPbMOXZDSfjof+iFwaT5cJCo3m0iy4WYOn2izOQPUVzNke0mI
         cxbCnyOYHuKyO361bk2AAZdBp3kVZ6FWs2DRveGKi+5hnT2eWUvUaWBalQTs1yTDvIsb
         gsYPea2PE3xcBbXoxW2/bka/jcEsxMNz/s2XKubp0a6UaC+GWce+quQDkouF/h9Uixk4
         laYGSi/BUWgXw8ZPH9fm8R56/enmHxIdjH3rK3WQK5157hac539whyIakYVQZxWAXnUs
         K9C24ggzd2XglcxLnCMP4r8mhQjU43sq//Z5HXaYFt0aZUNvRouVd/VpozAkZRlCT1Kx
         5D5w==
X-Gm-Message-State: AOAM530xixpxC29JhIDWrPllOFu9EDoEkIWwPqWz7O5qOlWTE9o0uSCS
        N7EdpqrCmw1Ja0oj0OETdg3uzQ==
X-Google-Smtp-Source: ABdhPJxJLqnn0pRDZBM6sQWKB2YTytCBH8ALuyDGR/E1riv2Tvgz1fQv5KSxHLfxrKw0SsgRZUUGkQ==
X-Received: by 2002:adf:ec0a:: with SMTP id x10mr9431590wrn.130.1591362614372;
        Fri, 05 Jun 2020 06:10:14 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id b14sm11311111wmj.47.2020.06.05.06.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 06:10:13 -0700 (PDT)
Date:   Fri, 5 Jun 2020 13:10:12 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, sakari.ailus@linux.intel.com,
        drinkcat@chromium.org, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200605131012.GB6303@chromium.org>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
 <20200605124643.GG2428291@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605124643.GG2428291@smile.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Fri, Jun 05, 2020 at 03:46:43PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > control to set the desired focus via IIC serial interface.
> 
> ...
> 
> > +config VIDEO_DW9768
> > +	tristate "DW9768 lens voice coil support"
> > +	depends on I2C && VIDEO_V4L2
> 
> No compile test?
> 
> > +	depends on PM
> 
> This is very strange dependency for ordinary driver.
> 
> > +	select MEDIA_CONTROLLER
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	select V4L2_FWNODE
> 
> ...
> 
> > +/*
> > + * DW9768 requires waiting time (delay time) of t_OPR after power-up,
> > + * or in the case of PD reset taking place.
> > + */
> > +#define DW9768_T_OPR_US				1000
> > +#define DW9768_Tvib_MS_BASE10			(64 - 1)
> > +#define DW9768_AAC_MODE_DEFAULT			2
> 
> > +#define DW9768_AAC_TIME_DEFAULT			0x20
> 
> Hex? Why not decimal?
> 
> > +#define DW9768_CLOCK_PRE_SCALE_DEFAULT		1
> 
> ...
> 
> > +static int dw9768_mod_reg(struct dw9768 *dw9768, u8 reg, u8 mask, u8 val)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > +	int ret;
> > +
> > +	ret = i2c_smbus_read_byte_data(client, reg);
> > +	if (ret < 0)
> > +		return ret;
> > +
> 
> > +	val = ((unsigned char)ret & ~mask) | (val & mask);
> 
> This cast is weird.
> 
> > +
> > +	return i2c_smbus_write_byte_data(client, reg, val);
> > +}
> 
> ...
> 
> > +			dev_err(&client->dev, "%s I2C failure: %d",
> > +				__func__, ret);
> 
> One line?
> 
> ...
> 
> > +static int dw9768_release(struct dw9768 *dw9768)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > +	u32 move_delay_us = dw9768_cal_move_delay(dw9768->aac_mode,
> > +						  dw9768->clock_presc,
> > +						  dw9768->aac_timing) / 100;
> > +	int ret, val;
> > +
> > +	val = round_down(dw9768->focus->val, DW9768_MOVE_STEPS);
> > +	for ( ; val >= 0; val -= DW9768_MOVE_STEPS) {
> > +		ret = dw9768_set_dac(dw9768, val);
> > +		if (ret) {
> > +			dev_err(&client->dev, "I2C write fail: %d", ret);
> > +			return ret;
> > +		}
> > +		usleep_range(move_delay_us, move_delay_us + 1000);
> > +	}
> 
> 
> It will look more naturally in the multiplier kind of value.
> 
> 	unsigned int steps = DIV_ROUND_UP(...);
> 
> 	while (steps--) {
> 		...(..., steps * ..._MOVE_STEPS);
> 		...
> 	}
> 
> but double check arithmetics.
> 

First of all, thank for the review!

As for this particular change suggestion, I suspect this could be a
subjective thing, because for me the current code looks more naturally
and it's what the other VCM drivers do.

> > +	return 0;
> > +}
> 
> 
> Also it seems we need to have writex_poll_timeout() implementation (see
> iopoll.h).

What would it be supposed to do? readx_poll_timeout() repeats reading
the same registers and sleeping until a condition becomes true, which is
basically "polling". In this case we're not polling anything and we're
not writing the same value, but it's an explicit algorithm of this
driver to power down the VCM corectly.

However, given that it's quite common among VCMs to require this kind of
phased power down - we could indeed provide some V4L2 VCM helpers for open
and release.

Best regards,
Tomasz

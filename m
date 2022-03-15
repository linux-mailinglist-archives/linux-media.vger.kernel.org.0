Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 859CB4D96DE
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 09:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346275AbiCOI6N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 04:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346271AbiCOI6L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 04:58:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9E34D9C0
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 01:57:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4D16929;
        Tue, 15 Mar 2022 09:56:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647334618;
        bh=tlYXiTFGUbHDBWQXjg4+wdX537Ssk8ffBW6LBiAgp14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HKzsOenI/MwY0arvMz5JtUuvO1aUxE29RaXLws+0+mB8rJwTM5JYBtqHD990zRbzu
         qiLsaZ4+m4alObzKEiO2G1PZMR33acmcX9R/5YOvV2fs66CAl9xU6aZT+txtEBIFtR
         oKhjc7xlBLAgqei+FEbei3Evy0ZWb7BxT8ozy2FY=
Date:   Tue, 15 Mar 2022 10:56:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, sakari.ailus@iki.fi,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 3/8] media: i2c: ov5670: Probe clocks with OF
Message-ID: <YjBUybAyqnBRdI+v@pendragon.ideasonboard.com>
References: <20220314162714.153970-1-jacopo@jmondi.org>
 <20220314162714.153970-4-jacopo@jmondi.org>
 <YjBKQrdiOo1/EWck@pendragon.ideasonboard.com>
 <20220315084618.ol6ekvgvn5ldgif7@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220315084618.ol6ekvgvn5ldgif7@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Mar 15, 2022 at 09:46:18AM +0100, Jacopo Mondi wrote:
> On Tue, Mar 15, 2022 at 10:11:46AM +0200, Laurent Pinchart wrote:
> > On Mon, Mar 14, 2022 at 05:27:09PM +0100, Jacopo Mondi wrote:
> > > Add support for probing the main system clock using the common clock
> > > framework and its OF bindings.
> > >
> > > Maintain ACPI compatibility by falling back to parse 'clock-frequency'
> > > if the no clock device reference is available.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/i2c/ov5670.c | 21 +++++++++++++++++----
> > >  1 file changed, 17 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> > > index 721441024598..25d792794fc7 100644
> > > --- a/drivers/media/i2c/ov5670.c
> > > +++ b/drivers/media/i2c/ov5670.c
> > > @@ -2,6 +2,7 @@
> > >  // Copyright (c) 2017 Intel Corporation.
> > >
> > >  #include <linux/acpi.h>
> > > +#include <linux/clk.h>
> > >  #include <linux/i2c.h>
> > >  #include <linux/mod_devicetable.h>
> > >  #include <linux/module.h>
> > > @@ -1819,6 +1820,8 @@ struct ov5670 {
> > >  	struct v4l2_subdev sd;
> > >  	struct media_pad pad;
> > >
> > > +	struct clk *clk;
> > > +
> > >  	struct v4l2_ctrl_handler ctrl_handler;
> > >  	/* V4L2 Controls */
> > >  	struct v4l2_ctrl *link_freq;
> > > @@ -2478,10 +2481,6 @@ static int ov5670_probe(struct i2c_client *client)
> > >  	bool full_power;
> > >  	int ret;
> > >
> > > -	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
> > > -	if (input_clk != 19200000)
> > > -		return -EINVAL;
> > > -
> > >  	ov5670 = devm_kzalloc(&client->dev, sizeof(*ov5670), GFP_KERNEL);
> > >  	if (!ov5670) {
> > >  		ret = -ENOMEM;
> > > @@ -2489,6 +2488,20 @@ static int ov5670_probe(struct i2c_client *client)
> > >  		goto error_print;
> > >  	}
> > >
> > > +	/* OF uses the common clock framework, ACPI uses "clock-frequency". */
> > > +	ov5670->clk = devm_clk_get_optional(&client->dev, NULL);
> > > +	if (IS_ERR(ov5670->clk))
> > > +		return dev_err_probe(&client->dev, PTR_ERR(ov5670->clk),
> > > +				     "error getting clock\n");
> > > +
> > > +	if (ov5670->clk)
> > > +		input_clk = clk_get_rate(ov5670->clk);
> > > +	else
> > > +		device_property_read_u32(&client->dev, "clock-frequency",
> > > +					 &input_clk);
> >
> > This will try to use the clock-frequency property on OF-based systems if
> > no clock is specified. Could we instead have
> 
> 'clocks' is listed as a required property in the OF bindings and my
> understanding is that driver assume DTS are correct.
> 
> > 	if (probed through OF) {
> 
> Otherwise yes, I can check for dev->of_node
> But again, I don't think drivers should have to work-around broken DTS

Not working around, but if we fail when DT is broken, it can help
avoiding broken DT spreading in the wild, which we would then need to
support forever.

> > 		use clock
> > 	} else {
> > 		use clock-frequency
> > 	}
> >
> > ?
> >
> > > +	if (input_clk != 19200000)
> > > +		return -EINVAL;
> > > +
> > >  	/* Initialize subdev */
> > >  	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
> > >

-- 
Regards,

Laurent Pinchart

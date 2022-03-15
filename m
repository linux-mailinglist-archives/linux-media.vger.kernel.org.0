Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 181F44D96A7
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 09:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbiCOIri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 04:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346196AbiCOIrg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 04:47:36 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27324D60F
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 01:46:23 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 707EB1C000D;
        Tue, 15 Mar 2022 08:46:20 +0000 (UTC)
Date:   Tue, 15 Mar 2022 09:46:18 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, sakari.ailus@iki.fi,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 3/8] media: i2c: ov5670: Probe clocks with OF
Message-ID: <20220315084618.ol6ekvgvn5ldgif7@uno.localdomain>
References: <20220314162714.153970-1-jacopo@jmondi.org>
 <20220314162714.153970-4-jacopo@jmondi.org>
 <YjBKQrdiOo1/EWck@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YjBKQrdiOo1/EWck@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Mar 15, 2022 at 10:11:46AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Mar 14, 2022 at 05:27:09PM +0100, Jacopo Mondi wrote:
> > Add support for probing the main system clock using the common clock
> > framework and its OF bindings.
> >
> > Maintain ACPI compatibility by falling back to parse 'clock-frequency'
> > if the no clock device reference is available.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ov5670.c | 21 +++++++++++++++++----
> >  1 file changed, 17 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> > index 721441024598..25d792794fc7 100644
> > --- a/drivers/media/i2c/ov5670.c
> > +++ b/drivers/media/i2c/ov5670.c
> > @@ -2,6 +2,7 @@
> >  // Copyright (c) 2017 Intel Corporation.
> >
> >  #include <linux/acpi.h>
> > +#include <linux/clk.h>
> >  #include <linux/i2c.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/module.h>
> > @@ -1819,6 +1820,8 @@ struct ov5670 {
> >  	struct v4l2_subdev sd;
> >  	struct media_pad pad;
> >
> > +	struct clk *clk;
> > +
> >  	struct v4l2_ctrl_handler ctrl_handler;
> >  	/* V4L2 Controls */
> >  	struct v4l2_ctrl *link_freq;
> > @@ -2478,10 +2481,6 @@ static int ov5670_probe(struct i2c_client *client)
> >  	bool full_power;
> >  	int ret;
> >
> > -	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
> > -	if (input_clk != 19200000)
> > -		return -EINVAL;
> > -
> >  	ov5670 = devm_kzalloc(&client->dev, sizeof(*ov5670), GFP_KERNEL);
> >  	if (!ov5670) {
> >  		ret = -ENOMEM;
> > @@ -2489,6 +2488,20 @@ static int ov5670_probe(struct i2c_client *client)
> >  		goto error_print;
> >  	}
> >
> > +	/* OF uses the common clock framework, ACPI uses "clock-frequency". */
> > +	ov5670->clk = devm_clk_get_optional(&client->dev, NULL);
> > +	if (IS_ERR(ov5670->clk))
> > +		return dev_err_probe(&client->dev, PTR_ERR(ov5670->clk),
> > +				     "error getting clock\n");
> > +
> > +	if (ov5670->clk)
> > +		input_clk = clk_get_rate(ov5670->clk);
> > +	else
> > +		device_property_read_u32(&client->dev, "clock-frequency",
> > +					 &input_clk);
>
> This will try to use the clock-frequency property on OF-based systems if
> no clock is specified. Could we instead have
>

'clocks' is listed as a required property in the OF bindings and my
understanding is that driver assume DTS are correct.

> 	if (probed through OF) {

Otherwise yes, I can check for dev->of_node
But again, I don't think drivers should have to work-around broken DTS

> 		use clock
> 	} else {
> 		use clock-frequency
> 	}
>
> ?
>
> > +	if (input_clk != 19200000)
> > +		return -EINVAL;
> > +
> >  	/* Initialize subdev */
> >  	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
> >
>
> --
> Regards,
>
> Laurent Pinchart

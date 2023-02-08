Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A8368F0D3
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 15:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbjBHOaW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 09:30:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjBHOaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 09:30:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6DB95
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 06:30:19 -0800 (PST)
Received: from ideasonboard.com (host-79-35-57-126.retail.telecomitalia.it [79.35.57.126])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98CA9E79;
        Wed,  8 Feb 2023 15:30:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675866617;
        bh=GnoVaP6mdAc9l+GLBZgMceMvKNl+p7kgijquZscYv/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nNdJXdGOGxsOpNbzWrPOP6Qjo82atSoNlBFFy37ciDer67ZfUS+xjEXoERUU30Cqc
         pA1CgExvod7nuZjDmH5w73bpR5DAh8oDjFUgdxcRZXQ7KZa4TKaxH/EC04bBd0qtIE
         FX8CDHf9CFRibxDCpzjQ/ZouGYDF2g1d6y2JWvy0=
Date:   Wed, 8 Feb 2023 15:30:15 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Dan Carpenter <error27@gmail.com>, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [bug report] media: i2c: ov5670: Use common clock framework
Message-ID: <20230208143015.jbj64x245za3sbxg@uno.localdomain>
References: <Y+Oln/uxPVwKVwFX@kili>
 <20230208142340.pmg337xngo2qv7jk@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230208142340.pmg337xngo2qv7jk@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari in cc for real this time

On Wed, Feb 08, 2023 at 03:23:40PM +0100, Jacopo Mondi wrote:
> Hi Dan,
>
> On Wed, Feb 08, 2023 at 04:37:35PM +0300, Dan Carpenter wrote:
> > Hello Jacopo Mondi,
> >
> > The patch 8004c91e2095: "media: i2c: ov5670: Use common clock
> > framework" from Jan 26, 2023, leads to the following Smatch static
> > checker warning:
> >
> > 	drivers/media/i2c/ov5670.c:2670 ov5670_probe()
> > 	warn: passing zero to 'PTR_ERR'
> >
> > drivers/media/i2c/ov5670.c
> >     2648 static int ov5670_probe(struct i2c_client *client)
> >     2649 {
> >     2650         struct ov5670 *ov5670;
> >     2651         const char *err_msg;
> >     2652         u32 input_clk = 0;
> >     2653         bool full_power;
> >     2654         int ret;
> >     2655
> >     2656         ov5670 = devm_kzalloc(&client->dev, sizeof(*ov5670), GFP_KERNEL);
> >     2657         if (!ov5670) {
> >     2658                 ret = -ENOMEM;
> >     2659                 err_msg = "devm_kzalloc() error";
> >     2660                 goto error_print;
> >     2661         }
> >     2662
> >     2663         ov5670->xvclk = devm_clk_get(&client->dev, NULL);
> >     2664         if (!IS_ERR_OR_NULL(ov5670->xvclk))
> >                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Imagine CONFIG_HAVE_CLK is not enabled so now devm_clk_get() returns
> > NULL.
> >
> >     2665                 input_clk = clk_get_rate(ov5670->xvclk);
> >     2666         else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
> >     2667                 device_property_read_u32(&client->dev, "clock-frequency",
> >     2668                                          &input_clk);
> >     2669         else
> > --> 2670                 return dev_err_probe(&client->dev, PTR_ERR(ov5670->xvclk),
> >     2671                                      "error getting clock\n");
> >
> > A NULL is zero and zero is success.
> >
>
> Ouch! Quite a subtle bug!
>
> > That means this code returns success without doing anything.  Perhaps
> > the right thing is to use use Kconfig to ensure that this cannot be
> > build without CONFIG_HAVE_CLK.  The other solution is to write the
> > driver with a bunch of NULL checks so that it still runs without a clk.
> >
> > The IS_ERR_OR_NULL() check should be changed to if (IS_ERR()).
>
> From a very quick lookup at how that symbol is used it seems it is
> selected both by COMMON_CLOCK and HAVE_LEGACY_CLOCK, however I'm not
> sure I know enough to consider safe depending on that symbol.
>
> When it comes to sensor-driver specific issues, I see CCS (the
> reference i2c camera sensor driver) depending on it, so I guess it's
> fine (Sakari in cc), but no other sensor driver does that (actually no
> driver in drivers/linux/media/ does that, not just i2c sensors!)
>
> When it comes to adding NULL checks, the common clock frameworks
> already protects against that, turning the usual
> clock_prepare_enable() and clock_disable_unprepare() calls into nop,
> so if we can't depend on CONFIG_HAVE_CLK I guess we can get away
> with some ugly:
>
> #if defined(CONFIG_HAVE_CLK)
>         ov5670->xvclk = devm_clk_get(&client->dev, NULL);
> #else
>         ov5670->xvclk = ERR_PTR(-ENOENT);
> #endif
>          if (!IS_ERR_OR_NULL(ov5670->xvclk))
>                  input_clk = clk_get_rate(ov5670->xvclk);
>          else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
>                  device_property_read_u32(&client->dev, "clock-frequency",
>                                           &input_clk);
>          else
>                  return dev_err_probe(&client->dev, PTR_ERR(ov5670->xvclk),
>                                       "error getting clock\n");
>
> Not super nice though :/
>
> Thanks
>    j
> >
> >     2672
> >     2673         if (input_clk != OV5670_XVCLK_FREQ) {
> >     2674                 dev_err(&client->dev,
> >     2675                         "Unsupported clock frequency %u\n", input_clk);
> >     2676                 return -EINVAL;
> >     2677         }
> >     2678
> >     2679         /* Initialize subdev */
> >     2680         v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
> >     2681
> >     2682         ret = ov5670_regulators_probe(ov5670);
> >     2683         if (ret) {
> >     2684                 err_msg = "Regulators probe failed";
> >
> > regards,
> > dan carpenter

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8B7668F253
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 16:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbjBHPrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 10:47:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjBHPra (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 10:47:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0231EBED
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 07:47:29 -0800 (PST)
Received: from ideasonboard.com (host-79-35-57-126.retail.telecomitalia.it [79.35.57.126])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F407EE79;
        Wed,  8 Feb 2023 16:47:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675871248;
        bh=GtanM+p9OhmXEqLKbuKpSWsTnzUPsQjGD32S3bPMgOw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gseP2Sp24CUGzPxOzrFICLG25uSgMN24xUBTXospq45WPLr3FDzPMKNSGWA1s2Csj
         hRTbAiqZ6uHbXEfbf3PTv8mhVF0AhEmztZMHssOgOxHZdFj6hDlC96/lpDZ8LcrORS
         B1+3Qf6TwKbjbZVl4hTEH9OBmwKfsHnI5YnMEo20=
Date:   Wed, 8 Feb 2023 16:47:25 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [bug report] media: i2c: ov5670: Use common clock framework
Message-ID: <20230208154725.vjqm2vvp5tq6cfjx@uno.localdomain>
References: <Y+Oln/uxPVwKVwFX@kili>
 <20230208142340.pmg337xngo2qv7jk@uno.localdomain>
 <Y+O5dKQAXD+GqpbZ@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+O5dKQAXD+GqpbZ@kadam>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan

On Wed, Feb 08, 2023 at 06:02:12PM +0300, Dan Carpenter wrote:
> On Wed, Feb 08, 2023 at 03:23:40PM +0100, Jacopo Mondi wrote:
> > >     2663         ov5670->xvclk = devm_clk_get(&client->dev, NULL);
> > >     2664         if (!IS_ERR_OR_NULL(ov5670->xvclk))
> > >                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > Imagine CONFIG_HAVE_CLK is not enabled so now devm_clk_get() returns
> > > NULL.
> > >
> > >     2665                 input_clk = clk_get_rate(ov5670->xvclk);
> > >     2666         else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
> > >     2667                 device_property_read_u32(&client->dev, "clock-frequency",
> > >     2668                                          &input_clk);
> > >     2669         else
> > > --> 2670                 return dev_err_probe(&client->dev, PTR_ERR(ov5670->xvclk),
> > >     2671                                      "error getting clock\n");
> > >
> > > A NULL is zero and zero is success.
> > >
> >
> > Ouch! Quite a subtle bug!
> >
> > > That means this code returns success without doing anything.  Perhaps
> > > the right thing is to use use Kconfig to ensure that this cannot be
> > > build without CONFIG_HAVE_CLK.  The other solution is to write the
> > > driver with a bunch of NULL checks so that it still runs without a clk.
> > >
> > > The IS_ERR_OR_NULL() check should be changed to if (IS_ERR()).
> >
> > >From a very quick lookup at how that symbol is used it seems it is
> > selected both by COMMON_CLOCK and HAVE_LEGACY_CLOCK, however I'm not
> > sure I know enough to consider safe depending on that symbol.
> >
> > When it comes to sensor-driver specific issues, I see CCS (the
> > reference i2c camera sensor driver) depending on it, so I guess it's
> > fine (Sakari in cc), but no other sensor driver does that (actually no
> > driver in drivers/linux/media/ does that, not just i2c sensors!)
> >
> > When it comes to adding NULL checks, the common clock frameworks
> > already protects against that, turning the usual
> > clock_prepare_enable() and clock_disable_unprepare() calls into nop,
> > so if we can't depend on CONFIG_HAVE_CLK I guess we can get away
> > with some ugly:
> >
> > #if defined(CONFIG_HAVE_CLK)
> >         ov5670->xvclk = devm_clk_get(&client->dev, NULL);
> > #else
> >         ov5670->xvclk = ERR_PTR(-ENOENT);
> > #endif
> >          if (!IS_ERR_OR_NULL(ov5670->xvclk))
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> The static checker would still complain that we're passing NULL to
> PTR_ERR() because of the IS_ERR_OR_NULL() check.  It should just be
> IS_ERR().
>
> I wouldn't be surprised if the Kconfig ensures that a NULL return is
> impossible in the original code.  However in the proposed code, then
> it's definitely impossible.
>

So let's please the machine overlords and silence the static analyzer
false positives :)


> >                  input_clk = clk_get_rate(ov5670->xvclk);
> >          else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
> >                  device_property_read_u32(&client->dev, "clock-frequency",
> >                                           &input_clk);
> >          else
> >                  return dev_err_probe(&client->dev, PTR_ERR(ov5670->xvclk),
> >                                       "error getting clock\n");
> >
> > Not super nice though :/
>
> Why not just add the NULL path to the check for -ENOENT?
>
> 	ov5670->xvclk = devm_clk_get(&client->dev, NULL);
> 	if (!IS_ERR_OR_NULL(ov5670->xvclk))
> 		input_clk = clk_get_rate(ov5670->xvclk);
> 	else if (!ov5670->xvclk ||  PTR_ERR(ov5670->xvclk) == -ENOENT)
> 		device_property_read_u32(&client->dev, "clock-frequency",
> 					 &input_clk);
> 	else
> 		return dev_err_probe(&client->dev, PTR_ERR(ov5670->xvclk),
> 				     "error getting clock\n");
>

That's defintely better.

I can send a patch right away

Thanks!

> regards,
> dan carpenter
>

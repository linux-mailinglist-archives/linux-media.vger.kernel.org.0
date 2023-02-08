Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 882EB68F188
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 16:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbjBHPC0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 10:02:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbjBHPCZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 10:02:25 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D822BF00
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 07:02:23 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id e3so287057wrs.10
        for <linux-media@vger.kernel.org>; Wed, 08 Feb 2023 07:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IwI0SrtBWIBmFb7E4SZsGl7KMRUEHiS4u5DafTwsdkg=;
        b=P2RAmOEhuo5JXUW6cnf8a6R80E+qqNEBGAokC9zvw8UBcP/UppRbGsrdqNSBcURCcQ
         YgX1Asom/OHdfPE7N/db1PG773r3UudqLSJXve9/Ta1H4GE/j3j9cBDjyBo+RTAaUVWj
         /B3W65DsJYIGcxI+vQW6mSKrJzC7Zoc943V8E3+/lgfs6RzqIuw+kt8ohN/xEX+LP8Bb
         R1cObtQyuZp8Eev12k0TdSzaJgfXtLVfg0PTYN2qEn7FjYtRN02n8iRvTtg/VGA4Hqvl
         HTBjgHnNclH1MAhNI/g/WKY4/u2x9NKP+2Z0SfBjLgqwMyjsZt7CeveaEYdsA/vJ/QLE
         vARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwI0SrtBWIBmFb7E4SZsGl7KMRUEHiS4u5DafTwsdkg=;
        b=Halhvmd7bs4OndmLau9zUDJ5CfeLC7tbq4wL/dy8TDnIvSx0eAaDvNZgIdyhRjctdu
         wt+2YWlqt4HWoBADGlgTiD+G+uhBCCHDo5MBqXeJOnGAI2XsXeGOW12KhubAFilIEleb
         Rf8UdowwFn94tApCEYWfO06YHqyXmE4GuNcV+l3zPgSwyp9TznL3sm8u8mnNXtRJ19wo
         S2/dJ5LzNTo6W6smdJ12n7l76lVqG2oVjxv61Ur5ug0V+fAH+ZkyQLYYlHLwtbtCjc1Q
         bbZ8wKXR3LHUI3AZoJEHpcN+G5ywzfQagLIZpaQMTerXcvCpOx3TfWHlGbFxcHxfFyCS
         HYkg==
X-Gm-Message-State: AO0yUKU35f/BGOVNr9QjGPNSY5sMNyP+mtvetFAEmPx5SXj0298y3qhS
        1aibP4Om7Lbw400to6v7JWA=
X-Google-Smtp-Source: AK7set8DN58r3g78dMsnXy/9mZqwG15mH96lP9NDwgxx5sQUTJqyrHiiDV3L/Mg3FWqmGIiCTFRLgg==
X-Received: by 2002:adf:f4d0:0:b0:2bf:df72:fdfd with SMTP id h16-20020adff4d0000000b002bfdf72fdfdmr8844967wrp.5.1675868542267;
        Wed, 08 Feb 2023 07:02:22 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4bc6000000b002c3f9dc5a5fsm2241205wrt.114.2023.02.08.07.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 07:02:21 -0800 (PST)
Date:   Wed, 8 Feb 2023 18:02:12 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [bug report] media: i2c: ov5670: Use common clock framework
Message-ID: <Y+O5dKQAXD+GqpbZ@kadam>
References: <Y+Oln/uxPVwKVwFX@kili>
 <20230208142340.pmg337xngo2qv7jk@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208142340.pmg337xngo2qv7jk@uno.localdomain>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 08, 2023 at 03:23:40PM +0100, Jacopo Mondi wrote:
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
> >From a very quick lookup at how that symbol is used it seems it is
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
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The static checker would still complain that we're passing NULL to
PTR_ERR() because of the IS_ERR_OR_NULL() check.  It should just be
IS_ERR().

I wouldn't be surprised if the Kconfig ensures that a NULL return is
impossible in the original code.  However in the proposed code, then
it's definitely impossible.

>                  input_clk = clk_get_rate(ov5670->xvclk);
>          else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
>                  device_property_read_u32(&client->dev, "clock-frequency",
>                                           &input_clk);
>          else
>                  return dev_err_probe(&client->dev, PTR_ERR(ov5670->xvclk),
>                                       "error getting clock\n");
> 
> Not super nice though :/

Why not just add the NULL path to the check for -ENOENT?

	ov5670->xvclk = devm_clk_get(&client->dev, NULL);
	if (!IS_ERR_OR_NULL(ov5670->xvclk))
		input_clk = clk_get_rate(ov5670->xvclk);
	else if (!ov5670->xvclk ||  PTR_ERR(ov5670->xvclk) == -ENOENT)
		device_property_read_u32(&client->dev, "clock-frequency",
					 &input_clk);
	else
		return dev_err_probe(&client->dev, PTR_ERR(ov5670->xvclk),
				     "error getting clock\n");

regards,
dan carpenter


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 650B4686CDB
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 18:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbjBAR2w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 12:28:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjBAR2v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 12:28:51 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38B26E404;
        Wed,  1 Feb 2023 09:28:49 -0800 (PST)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 244A7CD0C5;
        Wed,  1 Feb 2023 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1675272528; bh=ShnukInl/T2zAyoGUTvSOdRcvHdOIiJCrWNwIwsvJdg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=tX6CQoEps9L2w7uKKHMhbqU0l8RIU9T1J0qLM8vadp2tN+EwU5zK27TlCp9MOsWr1
         AfV2714aHlXMjxDBuJLooXm3ZCBx1/sAqJ2Okttzlo3WsEf1STy6o/D2QGqesap/vq
         hG+EhQauV8335lZWDmjiRmPAFtecr3cYsUxALbHc=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: i2c: ov2685: Make reset gpio optional
Date:   Wed, 01 Feb 2023 18:28:47 +0100
Message-ID: <4481296.cEBGB3zze1@z3ntu.xyz>
In-Reply-To: <CAPY8ntDvviyCox5_WpmOcgMgHuok9LcF1NSgRkfcHFcSgGVuSw@mail.gmail.com>
References: <20230129-ov2685-improvements-v2-0-210400f2b63e@z3ntu.xyz>
 <20230129-ov2685-improvements-v2-1-210400f2b63e@z3ntu.xyz>
 <CAPY8ntDvviyCox5_WpmOcgMgHuok9LcF1NSgRkfcHFcSgGVuSw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mittwoch, 1. Februar 2023 18:24:10 CET Dave Stevenson wrote:
> Hi Luca
> 
> On Wed, 1 Feb 2023 at 17:07, Luca Weiss <luca@z3ntu.xyz> wrote:
> > In some setups XSHUTDOWN is connected to DOVDD when it's unused,
> > therefore treat the reset gpio as optional.
> 
> The binding doc [1] says that reset-gpios is a required property.
> Making it optional should therefore have a patch for the binding
> first, and then a patch updating the driver.
> Unfortunately my understanding is that means converting it to YAML as
> well due to the txt docs being frozen.

I already have the docs converted somewhere, I will send that separately. Hope 
that's okay.

Regards
Luca

> 
> I know the pain - I was doing exactly the same thing for ov7251 earlier
> today. I haven't run the dt schema checks or had them reviewed yet, but
> "media: dt-bindings: Convert ov7251.txt to YAML" and "media:
> dt-bindings: ov7251: Make enable-gpio optional" on [2] may be of help
> to you.
> 
>   Dave
> 
> [1]
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bind
> ings/media/i2c/ov2685.txt#L10 [2]
> https://github.com/6by9/linux/commits/rpi-6.2.y-ov7251
> 
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > 
> >  drivers/media/i2c/ov2685.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
> > index a3b524f15d89..a422f4c8a2eb 100644
> > --- a/drivers/media/i2c/ov2685.c
> > +++ b/drivers/media/i2c/ov2685.c
> > @@ -734,7 +734,7 @@ static int ov2685_probe(struct i2c_client *client,
> > 
> >         if (clk_get_rate(ov2685->xvclk) != OV2685_XVCLK_FREQ)
> >         
> >                 dev_warn(dev, "xvclk mismatched, modes are based on
> >                 24MHz\n");
> > 
> > -       ov2685->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > +       ov2685->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > GPIOD_OUT_LOW);> 
> >         if (IS_ERR(ov2685->reset_gpio)) {
> >         
> >                 dev_err(dev, "Failed to get reset-gpios\n");
> >                 return -EINVAL;
> > 
> > --
> > 2.39.1





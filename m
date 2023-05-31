Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40FF2718646
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 17:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233424AbjEaP1B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 11:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbjEaP1A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 11:27:00 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F25D180
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 08:26:33 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-78676ca8435so736020241.1
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 08:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685546783; x=1688138783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8tUhsiIr5U5Nn7nMA+jt+Gd+8HP34KpxhkfN9Q+VpiY=;
        b=amzgFXJzRCDpxBIIrNWq4nzKxK1Z8yYlm3Hkgo44Uj15rb7qdEkCjXksBKHOn+puDP
         Gu+fLYNfwZL/z/eHC/0f43RFSnptmyoqhPubQskFsuNWGAQqQY/LxR/W8clASjX4abiH
         WothXOn+EK79r+P2ZeaT7+SLcKYve8Vth2Z4zZ71R1jphaSBD1becpP90DarOd5dI3qC
         F91fKgOwvJ1Vl22AwllbhgYuA0d6PtIsfCYzpeCT3S4mbFbOVOCEieafjKX76NZ8sTSH
         9sRvRhBakOeW0ian7rVe2LmK1SXCZKpOaXa5mD/R351hCx+JlQnbVuNzEp6VE4/+zgCc
         7tjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685546783; x=1688138783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tUhsiIr5U5Nn7nMA+jt+Gd+8HP34KpxhkfN9Q+VpiY=;
        b=I7v/jMXQRg7+DmKQme6i866Pl+75sTQYzQxKesEmibyKw9rOsP/cGAlzIilzkpJppM
         RK8n3vnHGgHIdmhTaBeRyTJTDZk1W5JMo+WL8NoOmr+A7ilnRbrulwHy7dDOdOVGT1I4
         2SedEUTgHXgTGvf2iPK4j/rZ4U9UJ/Pnh5ZkdKOcmwkLCgwgbXGyIOotc7g0G+DkliN6
         Ul+aZ5a3gJoqtBIEPOGG57nCtVMMPgFZzOOwv7rAkA2S6PzwwirGnkQen5pU8BjFEzHm
         V6kc3+nZ/YE8s83wu4RPRNHDxMGNX9xaJpXQjgLTix68vi9lOCXz3JX49S/tkGi4j3JY
         a4zQ==
X-Gm-Message-State: AC+VfDzBTttKUB3RHGKHMx7N4PlKPzSpMiHD0QFAbnKBwtxvgYbpSoSY
        oWmMe9c1yVol3+3f1kb3NXeWOmQUaV/Xbpu24ba2cGB9vQtguSFr
X-Google-Smtp-Source: ACHHUZ6boHhvRYcJoZLRz5VhW1/wimDgCSGh5pi1RH8QbShUO0IBthyV8JFmrsmLbZA+LbpqYIPwrAIBT09uEbxnLwU=
X-Received: by 2002:a1f:18c1:0:b0:456:f5b7:837c with SMTP id
 184-20020a1f18c1000000b00456f5b7837cmr5393943vky.1.1685546783399; Wed, 31 May
 2023 08:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-6-dave.stevenson@raspberrypi.com> <6s6fafip54y5er63qy6ac3wp5gnvryczxz5sxtvyy3ctxla5bk@okfxvbuenvla>
In-Reply-To: <6s6fafip54y5er63qy6ac3wp5gnvryczxz5sxtvyy3ctxla5bk@okfxvbuenvla>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 31 May 2023 16:26:06 +0100
Message-ID: <CAPY8ntBQtPjQ-Qg0gqXNCdB5EtG=rUiHnvFjquSd4X0WWJB9EA@mail.gmail.com>
Subject: Re: [PATCH 05/21] media: i2c: imx258: Add regulator control
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Wed, 31 May 2023 at 16:11, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Dave
>
> On Tue, May 30, 2023 at 06:29:44PM +0100, Dave Stevenson wrote:
> > The device tree bindings define the relevant regulators for the
> > sensor, so update the driver to request the regulators and control
> > them at the appropriate times.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx258.c | 42 +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 41 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > index b695fd987b71..30bae7388c3a 100644
> > --- a/drivers/media/i2c/imx258.c
> > +++ b/drivers/media/i2c/imx258.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-fwnode.h>
> > @@ -507,6 +508,16 @@ static const char * const imx258_test_pattern_menu[] = {
> >       "Pseudorandom Sequence (PN9)",
> >  };
> >
> > +/* regulator supplies */
> > +static const char * const imx258_supply_name[] = {
> > +     /* Supplies can be enabled in any order */
> > +     "vana",  /* Analog (2.8V) supply */
> > +     "vdig",  /* Digital Core (1.2V) supply */
> > +     "vif",  /* IF (1.8V) supply */
> > +};
> > +
> > +#define IMX258_NUM_SUPPLIES ARRAY_SIZE(imx258_supply_name)
> > +
> >  /* Configurations for supported link frequencies */
> >  #define IMX258_LINK_FREQ_634MHZ      633600000ULL
> >  #define IMX258_LINK_FREQ_320MHZ      320000000ULL
> > @@ -614,6 +625,7 @@ struct imx258 {
> >       bool streaming;
> >
> >       struct clk *clk;
> > +     struct regulator_bulk_data supplies[IMX258_NUM_SUPPLIES];
> >  };
> >
> >  static inline struct imx258 *to_imx258(struct v4l2_subdev *_sd)
> > @@ -999,9 +1011,19 @@ static int imx258_power_on(struct device *dev)
> >       struct imx258 *imx258 = to_imx258(sd);
> >       int ret;
> >
> > +     ret = regulator_bulk_enable(IMX258_NUM_SUPPLIES,
> > +                                 imx258->supplies);
> > +     if (ret) {
> > +             dev_err(dev, "%s: failed to enable regulators\n",
> > +                     __func__);
> > +             return ret;
> > +     }
> > +
> >       ret = clk_prepare_enable(imx258->clk);
> > -     if (ret)
> > +     if (ret) {
> >               dev_err(dev, "failed to enable clock\n");
> > +             regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
> > +     }
> >
> >       return ret;
> >  }
> > @@ -1012,6 +1034,7 @@ static int imx258_power_off(struct device *dev)
> >       struct imx258 *imx258 = to_imx258(sd);
> >
> >       clk_disable_unprepare(imx258->clk);
> > +     regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
> >
> >       return 0;
> >  }
> > @@ -1260,6 +1283,19 @@ static void imx258_free_controls(struct imx258 *imx258)
> >       mutex_destroy(&imx258->mutex);
> >  }
> >
> > +static int imx258_get_regulators(struct imx258 *imx258,
> > +                              struct i2c_client *client)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i = 0; i < IMX258_NUM_SUPPLIES; i++)
> > +             imx258->supplies[i].supply = imx258_supply_name[i];
> > +
> > +     return devm_regulator_bulk_get(&client->dev,
> > +                                    IMX258_NUM_SUPPLIES,
> > +                                    imx258->supplies);
>
> nit: fits on 2 lines

Done

> > +}
> > +
> >  static int imx258_probe(struct i2c_client *client)
> >  {
> >       struct imx258 *imx258;
> > @@ -1270,6 +1306,10 @@ static int imx258_probe(struct i2c_client *client)
> >       if (!imx258)
> >               return -ENOMEM;
> >
> > +     ret = imx258_get_regulators(imx258, client);
> > +     if (ret)
> > +             return ret;
>
> Is dev_err_probe() useful here ?

Sure, can do.

  Dave

> > +
> >       imx258->clk = devm_clk_get_optional(&client->dev, NULL);
> >       if (IS_ERR(imx258->clk))
> >               return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
> > --
> > 2.25.1
> >

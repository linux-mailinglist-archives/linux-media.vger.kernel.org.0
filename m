Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2EA437166F
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 16:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234137AbhECONS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 10:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhECONR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 May 2021 10:13:17 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7086C06174A;
        Mon,  3 May 2021 07:12:23 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id p17so3160763pjz.3;
        Mon, 03 May 2021 07:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Is7Jnp3BHxwMJZ3xqBnGr8z8FKTgA32vVnaoI/FxVRw=;
        b=qP2nfbxnF0v/sj2jLAmEFSVPxwLhwlMF20PXnyLaA9PYe+C/txCz4VB4sw0vfwOQE0
         rDBs99GmYLB1gp65xco9ZDUAgbD4sBqcqlrVWe40GS8+8IJPNl9c4oCMsV50AEXrEpOr
         vjREqcKuBI//GhYbxhXnYH7TVaIqwW0sOXRe79+9xYSKJchowUEEO+MtXUy6kzvVJASh
         fJP2n0rR6hld6Sz5gMN/DanLOO3w9stPMfCagZRE2pVoeOQd01WhiAZI0J4gtCaSRbRb
         zbMb/kYUzkrNQcyfuWtwB1dOQFBZ17fc45AXmlpALVvovOKFc/Vph9lo7/Y0CfrY0aMW
         Ruvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Is7Jnp3BHxwMJZ3xqBnGr8z8FKTgA32vVnaoI/FxVRw=;
        b=jkfuc2XT055vADIxy03/topTVqt6ZX+roqunN7j76mgzKyIDLTx3zclrFuL64g0xeJ
         2stGd72aGsj0RJpKTvtWKbMgSbxhfIIlNPGAEdnoNsRwP6ZMrxCUiAqQplUVgSQ2irNT
         qvjHRG4F26vIYGadt3Z4rDuaNlZDcvOzzLLAdI0KKuxDzn01T3ime7QRFZzniLrbLp/P
         pUfMJWjZadkVHgYLPvsArj85BsKrbUoEc2gRokij1ga1FBU96RhZnIhtRmOrf3RMPZpM
         hxA8Ev2Z/xH7gsH+DrzTHYSQHPPj90hx+NVzXa9wqA9Pa6vpo2gv4bIHOUnZcn6XODo0
         8YJw==
X-Gm-Message-State: AOAM531BsRycVdnFHEXEzaX1W4cC5YHEx8PDGVh+TtYEnjJiD0p8dCv9
        5PjkDnAs6xJDHfMtMEpTZeuVpDCtiAsRwAbki+o=
X-Google-Smtp-Source: ABdhPJymHtG2UL8qr+SXl+0VKwKjjvxhxPOxDqG7ZGrefDQ+W0Bg/BeS140OYJWVnY4w2zxwZNKvFgq+a2cRhKu/H/A=
X-Received: by 2002:a17:90a:dc81:: with SMTP id j1mr21840725pjv.115.1620051143214;
 Mon, 03 May 2021 07:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <1618976938-20834-1-git-send-email-dillon.minfei@gmail.com>
 <1618976938-20834-5-git-send-email-dillon.minfei@gmail.com> <CA+V-a8sBAW2k8zKk3ZLgAh02SxyEmLSt=a1Z5b1perBOgpmysQ@mail.gmail.com>
In-Reply-To: <CA+V-a8sBAW2k8zKk3ZLgAh02SxyEmLSt=a1Z5b1perBOgpmysQ@mail.gmail.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Mon, 3 May 2021 22:11:47 +0800
Message-ID: <CAL9mu0LJ1txew9iL89YchmXyx78oecAUhcJ-U14NsWgehF2SQw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}()
 to set xvclk on/off
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        leoyang.li@nxp.com, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thanks for the reminder.

On Mon, May 3, 2021 at 8:24 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Dillon,
>
> Thank you for the patch.
>
> On Wed, Apr 21, 2021 at 4:49 AM <dillon.minfei@gmail.com> wrote:
> >
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > On some platform(imx6q), xvclk might not switch on in advance,
> > also for power save purpose, xvclk should not be always on.
> > so, add clk_prepare_enable(), clk_disable_unprepare() in driver
> > side to set xvclk on/off at proper stage.
> >
> > Add following changes:
> > - add 'struct clk *clk;' in 'struct ov2659 {}'
> > - enable xvclk in ov2659_power_on()
> > - disable xvclk in ov2659_power_off()
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> s / dillon min /Dillon Min (unless you prefer in lower case) ?

Thanks, I haven't noticed it yet, and will change to a higher case in
the next submission.

Best regards.
Dillon
>
> > ---
> > v4: no changes
> >
> >  drivers/media/i2c/ov2659.c | 24 ++++++++++++++++++------
> >  1 file changed, 18 insertions(+), 6 deletions(-)
> >
> Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>
>
> Cheers,
> Prabhakar
>
> > diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> > index 42f64175a6df..fb78a1cedc03 100644
> > --- a/drivers/media/i2c/ov2659.c
> > +++ b/drivers/media/i2c/ov2659.c
> > @@ -204,6 +204,7 @@ struct ov2659 {
> >         struct i2c_client *client;
> >         struct v4l2_ctrl_handler ctrls;
> >         struct v4l2_ctrl *link_frequency;
> > +       struct clk *clk;
> >         const struct ov2659_framesize *frame_size;
> >         struct sensor_register *format_ctrl_regs;
> >         struct ov2659_pll_ctrl pll;
> > @@ -1270,6 +1271,8 @@ static int ov2659_power_off(struct device *dev)
> >
> >         gpiod_set_value(ov2659->pwdn_gpio, 1);
> >
> > +       clk_disable_unprepare(ov2659->clk);
> > +
> >         return 0;
> >  }
> >
> > @@ -1278,9 +1281,17 @@ static int ov2659_power_on(struct device *dev)
> >         struct i2c_client *client = to_i2c_client(dev);
> >         struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >         struct ov2659 *ov2659 = to_ov2659(sd);
> > +       int ret;
> >
> >         dev_dbg(&client->dev, "%s:\n", __func__);
> >
> > +       ret = clk_prepare_enable(ov2659->clk);
> > +       if (ret) {
> > +               dev_err(&client->dev, "%s: failed to enable clock\n",
> > +                       __func__);
> > +               return ret;
> > +       }
> > +
> >         gpiod_set_value(ov2659->pwdn_gpio, 0);
> >
> >         if (ov2659->resetb_gpio) {
> > @@ -1425,7 +1436,6 @@ static int ov2659_probe(struct i2c_client *client)
> >         const struct ov2659_platform_data *pdata = ov2659_get_pdata(client);
> >         struct v4l2_subdev *sd;
> >         struct ov2659 *ov2659;
> > -       struct clk *clk;
> >         int ret;
> >
> >         if (!pdata) {
> > @@ -1440,11 +1450,11 @@ static int ov2659_probe(struct i2c_client *client)
> >         ov2659->pdata = pdata;
> >         ov2659->client = client;
> >
> > -       clk = devm_clk_get(&client->dev, "xvclk");
> > -       if (IS_ERR(clk))
> > -               return PTR_ERR(clk);
> > +       ov2659->clk = devm_clk_get(&client->dev, "xvclk");
> > +       if (IS_ERR(ov2659->clk))
> > +               return PTR_ERR(ov2659->clk);
> >
> > -       ov2659->xvclk_frequency = clk_get_rate(clk);
> > +       ov2659->xvclk_frequency = clk_get_rate(ov2659->clk);
> >         if (ov2659->xvclk_frequency < 6000000 ||
> >             ov2659->xvclk_frequency > 27000000)
> >                 return -EINVAL;
> > @@ -1506,7 +1516,9 @@ static int ov2659_probe(struct i2c_client *client)
> >         ov2659->frame_size = &ov2659_framesizes[2];
> >         ov2659->format_ctrl_regs = ov2659_formats[0].format_ctrl_regs;
> >
> > -       ov2659_power_on(&client->dev);
> > +       ret = ov2659_power_on(&client->dev);
> > +       if (ret < 0)
> > +               goto error;
> >
> >         ret = ov2659_detect(sd);
> >         if (ret < 0)
> > --
> > 2.7.4
> >

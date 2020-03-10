Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04D4B180247
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 16:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgCJPrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 11:47:09 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34116 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgCJPrI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 11:47:08 -0400
Received: by mail-ot1-f68.google.com with SMTP id j16so13614430otl.1
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2020 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4HrHpJuYloPdd64QgDvsMEZuP7xh7v2AxwQIiGYP/MQ=;
        b=nyX2OVgPZVTO0zNEHpYlZ63oRyFSngj5xEudidOqj0uclLGX1S3zY0a0pfVYbatnkh
         2D8dMoBtwD6CVOzC+glCPpuvt8B96EHbtS82/rUczghAC0dNb4kQCpDrfGDyM9WZnqhE
         cD6V6C6atqbJIAFiPVYvmYb94/db0bZxLbC57HdisRWP2TiqR6vE7vFtKOUuGN2Qqnoy
         UMexxU5mlNO2XThhD5qTcBXOc17qUOjEsd6a01vAIa4/bhVs6QdAKwNo165h4SqsC52p
         ITAZxkyx2Yityikj+lkO5XXyvLWVkLC9LbqQ8yZeKIwAnTwqHFumm0Ja4JSGxjFCyNUe
         iFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4HrHpJuYloPdd64QgDvsMEZuP7xh7v2AxwQIiGYP/MQ=;
        b=rTM8mvtRxiAOLb8qTocZG/3TL6eumQcuCXJMshrP2IkzcUSORQH+qTrr5XO7Amf052
         817wlQWikLS3v+NvzZs3QeJfMm0EKtqIoW89anyV/u8jIPrMEjhFrbbm4jQ1VGlsury5
         TJKL8v5D8Zl6qRkK4UkiFs+Tr1r6dDbfJJ1GHSvdpx0R8RZt4+cLL8Ge76BkultjTFeL
         HGXou0n3SU6na6Mhj9TyJ5GPqJ1SAjC/G99OyxJoFwRJKF11zpBFwP5qDjWLSx6tYKjC
         PZZriFO4rbdgGFGHpr2oRcHnKL/pnR5NPQ2FhqUmw82wQcvhQ8fouooP17Nts2d5AgvS
         CFyA==
X-Gm-Message-State: ANhLgQ085qenPFb/ED/vvcREIcgMct5sFdTuCbMqfu5WQXsrKykE9cax
        GmmrFDcfC7mKeB89Knqu0PSnrVThwg0l52CZ1NPw3w==
X-Google-Smtp-Source: ADFU+vvtWUnpgSR4cBsrFTI3Mtf9+RyaT5KjmUoKRwAbx1+YCbYzwZsgMVbDCYPSxtaSHxlcT6lv+BwV3Srw2n+HtWY=
X-Received: by 2002:a9d:19e9:: with SMTP id k96mr17642241otk.68.1583855227689;
 Tue, 10 Mar 2020 08:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-3-robert.foss@linaro.org> <CAOMZO5D7N6FfPMiycGun-eui-G-tbp15stwRWBWs4L98JHFfGA@mail.gmail.com>
In-Reply-To: <CAOMZO5D7N6FfPMiycGun-eui-G-tbp15stwRWBWs4L98JHFfGA@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 10 Mar 2020 16:46:56 +0100
Message-ID: <CAG3jFyuwHEXHD1JbWMwNX_LDtawJ1+-zEptzq2yrn8Uk+S3fdQ@mail.gmail.com>
Subject: Re: [v1 2/3] media: ov8856: Add devicetree support
To:     Fabio Estevam <festevam@gmail.com>
Cc:     ben.kao@intel.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan.Cameron@huawei.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 10 Mar 2020 at 15:03, Fabio Estevam <festevam@gmail.com> wrote:
>
> On Tue, Mar 10, 2020 at 10:47 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> > +static int __ov8856_power_on(struct ov8856 *ov8856)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> > +       int ret;
> > +
> > +       ret = clk_prepare_enable(ov8856->xvclk);
> > +       if (ret < 0) {
> > +               dev_err(&client->dev, "failed to enable xvclk\n");
> > +               return ret;
> > +       }
> > +
> > +       gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
> > +
> > +       ret = regulator_bulk_enable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> > +       if (ret < 0) {
> > +               dev_err(&client->dev, "failed to enable regulators\n");
> > +               goto disable_clk;
> > +       }
> > +
> > +       gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_HIGH);
>
> To power it up you probably only need:
>
> gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, 0);
>
> And use reset-gpios as active low in your device tree. Assuming the
> reset-gpios is active low like other OmniVision sensors.

Ack.

>
> > +
> > +       usleep_range(1500, 1800);
> > +
> > +       return 0;
> > +
> > +disable_clk:
> > +       clk_disable_unprepare(ov8856->xvclk);
> > +
> > +       return ret;
> > +}
> > +
> > +static void __ov8856_power_off(struct ov8856 *ov8856)
> > +{
> > +       gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
> > +       regulator_bulk_disable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> > +       clk_disable_unprepare(ov8856->xvclk);
> > +}
> > +
> > +
>
> Unneede extra blank line.

Ack.

>
> >         v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
> > +       ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");
> > +       if (IS_ERR(ov8856->xvclk)) {
> > +               dev_err(&client->dev, "failed to get xvclk\n");
> > +               return -EINVAL;
>
> You should better return the real error insteald
> PTR_ERR(ov8856->xvclk). This way defer probe could work.
>

Ack.

> > +       }
> > +
> > +       ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_24);
> > +       if (ret < 0) {
> > +               dev_err(&client->dev, "failed to set xvclk rate (24MHz)\n");
> > +               return ret;
> > +       }
> > +
> > +       ov8856->n_shutdn_gpio = devm_gpiod_get(&client->dev, "reset",
> > +                                              GPIOD_OUT_LOW);
> > +       if (IS_ERR(ov8856->n_shutdn_gpio)) {
> > +               dev_err(&client->dev, "failed to get reset-gpios\n");
> > +               return -EINVAL;
>
> Please return the real error.

Ack.

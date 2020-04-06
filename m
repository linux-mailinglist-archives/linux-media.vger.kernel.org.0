Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4D1B19F717
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 15:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbgDFNhg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 09:37:36 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33558 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728528AbgDFNhg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 09:37:36 -0400
Received: by mail-oi1-f195.google.com with SMTP id m14so13096059oic.0
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6L3aORYHMbwwCq3SCrpWJ+tXaNPgCZaZOcLf7iItFoM=;
        b=GckHuiQLusEfuz7m7kL2bfmJegj7H8mS9QM9fAP1xyMvKgqdKEty3fg6OwV6T9jPxN
         bnSCYkeHIMVM01Rvpbr1MuFU1p0UJtWWSVscCydH/L5qbZhASReOaOo7gET1/zbaj+QI
         c8FrHwThgqlaZMx5YZ70coYm1NXAZsfG0LiFzFrp7pg/iBBWNnhQ4Gdr8484Bz972VYC
         4eWwQ3NZXWZI47TzKQShY+n5EuG4xi/gjs5tMzzocKEuJ0zxJTCbKSIXsQjdz5uITfqO
         QkeBGOgQyANa82d9UCdl+C2qQHvztpu0qmTYLDWqH4o5vQik3FHeO8BdvkSDaaNpSlTG
         DZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6L3aORYHMbwwCq3SCrpWJ+tXaNPgCZaZOcLf7iItFoM=;
        b=tV0w7zOpUFYPn9ugQKxBvBwJrkK5Uq2+wQWaAcdqMPJln7hMU9nXdHAFXr5X7WSpit
         goSU1Fg7oID+5ZdFRm2pbX4tw/Q/GyV5HHbDP4yRxGzvjpc1gYjHYL9/HITDjlloaCHy
         Gc5Z+k9IZcKRTQxDDA6tqerwUdPGTj4GST4K2cjoqgbmKJj048txlaDBQmCeLu3Y0ZTC
         RE2TgcEsMV9LeT16HMaT6q/KqiHgquDB8WqIP2FMKxuwhJ+Vp3lx34XgunQ0s/+R7NJi
         EGQFGRlM/PiowF+OasiWxV/KylemybgJzIKNvXtsiJR/Wi1vSyVelCBu5Jsa3rliy+Fz
         rckw==
X-Gm-Message-State: AGi0PuZ7tNTmj1F3x0J2y4Aw89Yn/Noo5MoXl0oNT13dj7PWYdD8qwya
        MOvJ6mvFrxt3onMrRV0vcgPr+5Qa+ZSJISv6WUSyNg==
X-Google-Smtp-Source: APiQypKD7wVcZWhoSfKhnnMOWHbZfY+YnnpAAJPlZzKefOLNi4hmZpG97WRWAolZBV2nqJ5aYs8hHESeS5eTQm5YhZ4=
X-Received: by 2002:aca:fcd8:: with SMTP id a207mr13378081oii.56.1586180255395;
 Mon, 06 Apr 2020 06:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200331133346.372517-1-robert.foss@linaro.org>
 <20200331133346.372517-3-robert.foss@linaro.org> <CAHp75VfFKY6nzb8aEWmop73v2haZ0P5+aTsKDEU8M=uUPn0u3g@mail.gmail.com>
In-Reply-To: <CAHp75VfFKY6nzb8aEWmop73v2haZ0P5+aTsKDEU8M=uUPn0u3g@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 6 Apr 2020 15:37:24 +0200
Message-ID: <CAG3jFyuH5Kad16R7Oit-c_7RasiEfPycOpA68JYLVopbyQ749w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: ov8856: Add devicetree support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Andy,

Thanks for the review, it is much appreciated!

On Tue, 31 Mar 2020 at 16:01, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Tue, Mar 31, 2020 at 4:36 PM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > Add devicetree match table, and enable ov8856_probe()
> > to initialize power, clocks and reset pins.
>
> ...
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
>
> > +       if (is_acpi_node(ov8856->dev->fwnode))
>
> Use dev_fwnode().

Ack.

>
> > +               return 0;
> > +
> > +       if (ov8856->reset_gpio) {
>
> > +               gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);
>
> This is wrong. You have to fix it to use either 0 or 1.

I've changed all gpiod_set_value_cansleep() calls to use 0/1.

>
> > +               usleep_range(1000, 2000);
> > +       }
> > +
> > +       ret = regulator_bulk_enable(ARRAY_SIZE(ov8856_supply_names),
> > +                                   ov8856->supplies);
>
> > +       if (ret < 0) {
>
> Do you need all ' < 0' parts all over the series?

Some checks are needed due to ACPI and DT support co-existing.
Maybe it would be better to just split the probing into an ACPI path
and a DT path.

I'll have a look through the series for redundant retval checks.

>
> > +               dev_err(&client->dev, "failed to enable regulators\n");
> > +               goto disable_clk;
> > +       }
>
> ...
>
> > +       gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_LOW);
>
> Ditto.

Ack.

>
> ...
>
> > +       gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);
>
> Ditto.

Ack.

>
> ...
>
> > +       gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);
>
> Ditto.

Ack.

>
> ...
>
> > -       ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
> > -       if (ret)
> > -               return ret;
>
> Where is it gone? Why?

It was replaced by a clk_get_rate call, which as Sakari pointed out,
isn't correct.
I'll rework the clock handling for v4.

>
> > +       ov8856->xvclk = devm_clk_get_optional(dev, "xvclk");
> > +       if (IS_ERR(ov8856->xvclk)) {
>
> > +               dev_err(dev, "could not get xvclk clock (%ld)\n",
> > +                       PTR_ERR(ov8856->xvclk));
>
> Also you may use %pe here and in similar cases.

Weirdly checkpatch complains about this.
But it builds and runs cleanly, so I'll add it in v4.

>
> > +               return PTR_ERR(ov8856->xvclk);
> > +       }
>
> > +       ov8856->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > +               GPIOD_OUT_HIGH);
>
> Here parameter is correct. The question is, what the value should be
> HIGH or LOW?
> Basically HIGH means to assert the signal.

Ack, I'll invert the logic.

>
> > +       if (IS_ERR(ov8856->reset_gpio)) {
>
> > +               dev_dbg(dev, "failed to get reset-gpio\n");
>
> Noise.
> Enable GPIO debug to see this kind of messages.

Ack.

>
> > +               return PTR_ERR(ov8856->reset_gpio);
> > +       }
>
> ...
>
> > +       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov8856_supply_names),
> > +                                     ov8856->supplies);
> > +       if (ret) {
>
> > +               dev_warn(dev, "failed to get regulators\n");
>
> If it's a warning, why we return from here?
> Same question to all other places with same issue.

The issue I was seeing was the driver having to return a EDEFER here,
so this warning sheds some light on which exact component is returning
an EDEFER.

[   15.962623] ov8856 16-0010: Dropping the link to regulator.29
[   15.968464] ov8856 16-0010: failed to get regulators
[   15.973493] ov8856 16-0010: failed to get HW configuration: -517
[   15.979591] ov8856 16-0010: removing from PM domain titan_top_gdsc
[   15.985855] ov8856 16-0010: genpd_remove_device()
[   15.990672] i2c 16-0010: Driver ov8856 requests probe deferral

Personally I found it helpful to speed up debugging, but I'll happily
remove it if you prefer no warning.

>
> > +               return ret;
> >         }
>
> --
> With Best Regards,
> Andy Shevchenko

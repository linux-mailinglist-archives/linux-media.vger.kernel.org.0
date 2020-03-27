Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 260DF195558
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 11:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgC0Kcq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 06:32:46 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45869 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgC0Kcn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 06:32:43 -0400
Received: by mail-ot1-f67.google.com with SMTP id c9so9145066otl.12
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2020 03:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YYF9IlkYIan1+UFMEoSWkc8FBz64pPNX5SeJSHAu8kg=;
        b=xXRePv+8SgkF6sJVJLkuv6mQ3y/WTJtU4pKOk2h/g4ZRRHoUdhWf7be/9xVvXKJdOJ
         39uHfWxJUgkVtpS11k+sbvlmqrHPQZp4BnoMDUn9WmW3l093QS/IYdfe9Ov6MsLD0orX
         w3om+wu4CpiMG2891c46ivxP+5hF4oDBg/2XwZVmw0wycDU+vm++0LepD4VMusQXW9M8
         3DH+9eMSAFaeaUdQAvQIXWhp1gr1VgSA3s58G7EWE8Lwv+23SbpOZn67vq4HXZzLA10c
         9m/EzI/Ld/dq/n+X1pjXT4ciAgnrosOzyR+x1GIxsSkrvCUkSM+eiZJ1mgeNdRZhOWaY
         lCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YYF9IlkYIan1+UFMEoSWkc8FBz64pPNX5SeJSHAu8kg=;
        b=UbxHl3QcFi/Rl6s1yYwHBpKIzLZgghaF/2yzd6Xu04+J/7zT0bw2ttPqqEfaWrWW04
         xF/qXqAUCWvLO+iCih3p7CHpLhNSQKiFV/35FLMzu4M0vd1TIT3QEdOkUYkM0uJESjUl
         rehnWp86HuHe0B3qIPbzYTBYAaZzFaByjWNVGgqOo8hTbq8AFsA4Lckdvix+suja7/hU
         rmzDsx17nBV2YWH3FdtwpK1iWTFEOnuXtU7aL1JAgt6bVZifjcpoQeafflQgPLzMOJmp
         SMpiCyav49ZBdfWCdPTObWK75hngAg8mWdDtpftAGv6+e/IRzMw3PZpq+vTOlD+iFF+U
         FpiA==
X-Gm-Message-State: ANhLgQ0Cw7k52i28H/zStkuD/ztz8QQL22+PVgzMms7Ghe5VyRx/8+ri
        ctmvMX18sH/MqPX6Rtqtv0tYKM/QE+uSMkE6urpG64noTxw=
X-Google-Smtp-Source: ADFU+vseCXoMGXatVYtvuIKCvvYcHpzp5L/GUxqGEUSN7+BRDLJCxO7pyQfJM0X4rU4ScjZZJpwRtscCky9sePUUX9s=
X-Received: by 2002:a9d:27a7:: with SMTP id c36mr9836243otb.68.1585305162293;
 Fri, 27 Mar 2020 03:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200313110350.10864-1-robert.foss@linaro.org>
 <20200313110350.10864-3-robert.foss@linaro.org> <20200313121746.GC5730@valkosipuli.retiisi.org.uk>
 <CAG3jFytpx8_+DKhUVZnUFeMYK82Z1hFWcEnbyD0=4a8p3ojteg@mail.gmail.com> <20200326144725.GA2394@valkosipuli.retiisi.org.uk>
In-Reply-To: <20200326144725.GA2394@valkosipuli.retiisi.org.uk>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 27 Mar 2020 11:32:29 +0100
Message-ID: <CAG3jFyu=HOsWNeRFC2t4HjzYrFrLjsbXzAm4+zD50Xq48mqzcw@mail.gmail.com>
Subject: Re: [v2 2/3] media: ov8856: Add devicetree support
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 26 Mar 2020 at 15:47, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Robert,
>
> On Thu, Mar 26, 2020 at 12:56:37PM +0100, Robert Foss wrote:
> ...
> > > > +static int __ov8856_power_on(struct ov8856 *ov8856)
> > > > +{
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> > > > +     int ret;
> > > > +
> > > > +     ret = clk_prepare_enable(ov8856->xvclk);
> > > > +     if (ret < 0) {
> > > > +             dev_err(&client->dev, "failed to enable xvclk\n");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);
> > > > +
> > > > +     ret = regulator_bulk_enable(ARRAY_SIZE(ov8856_supply_names),
> > > > +                                 ov8856->supplies);
> > > > +     if (ret < 0) {
> > > > +             dev_err(&client->dev, "failed to enable regulators\n");
> > > > +             goto disable_clk;
> > > > +     }
> > > > +
> > > > +     gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_LOW);
> > > > +
> > > > +     usleep_range(1500, 1800);
> > >
> > > I think you could omit the delay on ACPI based systems. Or just bail out
> > > early in that case.
> >
> > I'll add a check for reset_gpio being NULL, and skip the sleep for that case.
>
> There could also be a regulator but no GPIO.
>
> I think if you don't have either, then certainly there's no need for a
> delay.

Removing the delay if no action is taken makes sense, but I'm not sure
how best to do it.
If there are no regulators dummy ones are created automatically, which
makes distinguishing between a little bit cumbersome. The regulator
structs could of course all be inspected, and if all are dummy ones,
the delay could be skipped. But is there a neater way of doing this?
Manually inspecting the regs strikes me as a bit inelegant.

>
> ...
>
> > > > +             ov8856->xvclk = NULL;
> > > > +     } else if (IS_ERR(ov8856->xvclk)) {
> > > > +             dev_err(&client->dev, "could not get xvclk clock (%ld)\n",
> > > > +                     PTR_ERR(ov8856->xvclk));
> > > > +             return PTR_ERR(ov8856->xvclk);
> > > > +     }
> > > > +
> > > > +     ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_24);
> > >
> > > This should either come from platform data, or perhaps it'd be even better
> > > to get the clock rate and use assigned-clock-rates. I guess that's
> > > preferred nowadays.
> >
> > I'm a bit unsure about what this would look like.
> >
> > Are you thinking something like the way ext_clk is used in smiapp_core.c?
> > I went ahead and implemented support for retrieving and storing
> > 'clock-rates' during the ov8856_check_hwcfg() call, and then setting
> > the rate to the configured rate during probing.
>
> With assigned-clock-rates, you can simply use clk_get_rate().

Ah, I see.

I'll switch to that approach then.

>
> As you get the actual rate, it could be somewhat off of the intended one.
>
> --
> Kind regards,
>
> Sakari Ailus

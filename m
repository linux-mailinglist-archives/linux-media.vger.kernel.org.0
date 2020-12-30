Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A27E2E7C46
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 21:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgL3Udk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 15:33:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgL3Udj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 15:33:39 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D3BC061573;
        Wed, 30 Dec 2020 12:32:59 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id 11so10233453pfu.4;
        Wed, 30 Dec 2020 12:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vs5OyvtxkG7l6kSvBrQwhbGRRBG5LG7qbYim70DoEkI=;
        b=C0edT1WOHkDwN5w4tU8YoGLvBGL3JmmTueuYKszX7J5tKFOT4aG9gBIELOhtzKVwnO
         2xRrfbbdyiPd+LnvLnCMy4enIU+efx5ZoU5Ds6TevjoCqlaiXvqgYQW3EcnH705NBgBU
         IOrqc4Asjn1XSMTOFQhsQOCumddd0x37VbfGWkmvTCtvm+64nfoZA7OJKtUl7YjsFolz
         mjlxRI5/mUGBz35CGSbJ2jsl8/hBgNtbAh9cfD7rFH2qf3zJJGMkHxUmT/DFwUE9C4XR
         cYGyhIlMsAhIkCt1R0MID/nJV1sDWdqFlSeb+7mT4V3+DYFFSXke/kUDru4LENKDLhJZ
         sCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vs5OyvtxkG7l6kSvBrQwhbGRRBG5LG7qbYim70DoEkI=;
        b=iCq898K3Wur/OgBdpIrGgt8oMqandJ9mBKGea1dE/VL2QF0KBjP7isXvjsr4UYfOMv
         YWGL+jU+r2t7FiMoUjChecjHLX4gtb1DSj4JoTIjm3pVq3chvtAaDvtbpdBoAMzvhJzA
         jYl4RIrItj2/zx9WNlWB8xw2GmEXT5c0E2J4XxsdsEPkyuhzpjTRrK/cbyuYeVMudxnj
         TCbqVzUUBooC8PAYTjlmAksc6jC1TMzDlOKGT1Iztz+1vCzSdC1A3zCgc7F8mZLc0ydw
         b2dJ+m8ojanUKwO/iSsO7rAvq9yEbb3yENmeaY2J+ka93TRyl0AK9acBFoJ1s7uck3PP
         thUA==
X-Gm-Message-State: AOAM533np++Zs3RQvIENkUunMjDt6OjhCZjNdDOukoV5KSLnI66fGfOJ
        GVNlUy+ErfiHG0jNRZH+1Usa64KkDPZymZ8wuoI=
X-Google-Smtp-Source: ABdhPJzyGRRS4zfDVS3UjMNck2eSXjz6dchN3qU67wceNliOba+DbPk3Re+KpNdBx2rRY5F/ccUyfaIeneN+nbvyG00=
X-Received: by 2002:a63:b1e:: with SMTP id 30mr53695484pgl.203.1609360378746;
 Wed, 30 Dec 2020 12:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20201201101350.1401956-1-linus.walleij@linaro.org> <20201201101350.1401956-2-linus.walleij@linaro.org>
In-Reply-To: <20201201101350.1401956-2-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Dec 2020 22:32:42 +0200
Message-ID: <CAHp75Ve7PWsecWdD000CHmuH8moo6xaH9kqO9xDmQvkphEX4Rg@mail.gmail.com>
Subject: Re: [PATCH 2/2 v7] leds: rt8515: Add Richtek RT8515 LED driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 2, 2020 at 12:33 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds a driver for the Richtek RT8515 dual channel
> torch/flash white LED driver.
>
> This LED driver is found in some mobile phones from
> Samsung such as the GT-S7710 and GT-I8190.
>
> A V4L interface is added.
>
> We do not have a proper datasheet for the RT8515 but
> it turns out that RT9387A has a public datasheet and
> is essentially the same chip. We designed the driver
> in accordance with this datasheet. The day someone
> needs to drive a RT9387A this driver can probably
> easily be augmented to handle that chip too.

...


> +#include <linux/of.h>

As far as I can see you are using fwnode API, so above better to be
replaced with

#include <linux/property.h>

For the ID table you probably need mod_devicetable.h.

...

> +#define RT8515_MIN_IOUT_MA     15
> +#define RT8515_MAX_IOUT_MA     700

MA -> mA ?

...

> +#define RT8515_TIMEOUT_DEFAULT         250000U /* 250ms */
> +#define RT8515_MAX_TIMEOUT_DEFAULT     300000U /* 300ms */

MAX and DEFAULT in the same sentence sound confusing.
Also, instead of comments can you use units in the name, like _US?

(I guess _DEFAULT can be replaced by _US)

...

> +struct rt8515 {
> +       struct device *dev;

> +       struct led_classdev_flash fled;

If you make this first member you will effectively eliminate overhead
of container_of().

> +       struct v4l2_flash *v4l2_flash;

> +};

...


> +       if (brightness == LED_OFF) {
> +               /* Off */
> +               gpiod_set_value(rt->enable_flash, 0);
> +               gpiod_set_value(rt->enable_torch, 0);

These two together are repeated at least three times in the driver, perhaps

static void rt8515_gpio_led_off(... *rt)
{
      gpiod_set_value(rt->enable_flash, 0);
      gpiod_set_value(rt->enable_torch, 0);
}

> +       } else if (brightness < RT8515_TORCH_MAX) {
> +               /* Step it up to movie mode brightness using the flash pin */
> +               rt8515_gpio_brightness_commit(rt->enable_torch, brightness);
> +       } else {
> +               /* Max torch brightness requested */
> +               gpiod_set_value(rt->enable_torch, 1);
> +       }

...

> +       ret1 = fwnode_property_read_u32(rt->dev->fwnode, resistance, &res);
> +       ret2 = fwnode_property_read_u32(led, max_ua_prop, &ua);
> +
> +       /* No info in DT, OK go with hardware maxima */
> +       if (ret1 && ret2) {
> +               max_ma = RT8515_MAX_IOUT_MA;
> +               max_intensity = hw_max;
> +               goto out_assign_max;
> +       }
> +
> +       if (ret1 || ret2) {
> +               dev_err(rt->dev,
> +                       "either %s or %s missing from DT, using HW max\n",
> +                       resistance, max_ua_prop);
> +               max_ma = RT8515_MAX_IOUT_MA;
> +               max_intensity = hw_max;
> +               goto out_assign_max;
> +       }

Dup. Can be rewritten as (taking into account that resistance can't be 0):

       u32 res = 0; /* Can't be 0, used as undefined value */
       ...
       fwnode_property_read_u32(rt->dev->fwnode, resistance, &res);
       ret = fwnode_property_read_u32(led, max_ua_prop, &ua);
       if (ret || res == 0) {
               /* No info in DT, OK go with hardware maxima */
               if (!(ret && res == 0)) {
                  dev_err(rt->dev,
                       "either %s or %s missing from DT, using HW max\n",
// or resistance is 0, the case your original code is missing
                       resistance, max_ua_prop);
               }
               max_ma = RT8515_MAX_IOUT_MA;
               max_intensity = hw_max;
               goto out_assign_max;
      }

But please double check.

> +       /*
> +        * Formula from datasheet, this is the maximum current

the datasheet

> +        * defined by the hardware.
> +        */
> +       max_ma = (5500 * 1000) / res;
> +       /*
> +        * Calculate max intensity (linear scaling)
> +        * Formula is ((ua / 1000) / max_ma) * 100, then simplified
> +        */
> +       max_intensity = (ua / 10) / max_ma;
> +
> +       dev_info(rt->dev,
> +                "current restricted from %u to %u mA, max intensity %d/100\n",
> +                max_ma, (ua / 1000), max_intensity);
> +
> +out_assign_max:
> +       dev_info(rt->dev, "max intensity %d/%d = %d mA\n",
> +                max_intensity, hw_max, max_ma);
> +       *max_intensity_setting = max_intensity;
> +}

...

> +       /* ENF - Enable Flash line */
> +       rt->enable_flash = devm_gpiod_get(dev, "enf", GPIOD_OUT_LOW);
> +       if (IS_ERR(rt->enable_flash)) {

> +               dev_err(dev, "cannot get ENF (enable flash) GPIO\n");
> +               return PTR_ERR(rt->enable_flash);

Shouldn't it be dev_err_probe() to avoid spam in certain cases?

> +       }
> +
> +       /* ENT - Enable Torch line */
> +       rt->enable_torch = devm_gpiod_get(dev, "ent", GPIOD_OUT_LOW);
> +       if (IS_ERR(rt->enable_torch)) {

> +               dev_err(dev, "cannot get ENT (enable torch) GPIO\n");
> +               return PTR_ERR(rt->enable_torch);

Shouldn't it be dev_err_probe() to avoid spam in certain cases?

> +       }

...

> +       rt->v4l2_flash = v4l2_flash_init(dev, child, fled, NULL, &v4l2_sd_cfg);
> +       if (IS_ERR(rt->v4l2_flash)) {
> +               ret = PTR_ERR(rt->v4l2_flash);
> +               dev_err(dev, "failed to register V4L2 flash device (%d)\n",
> +                       ret);
> +               /*
> +                * Continue without the V4L2 flash
> +                * (we still have the classdev)
> +                */
> +       }

> +       return 0;

In conjunction with above can be

return PTR_ERR_OR_ZERO(rt->v4l2_flash);

...

> +static const struct of_device_id rt8515_match[] = {
> +       { .compatible = "richtek,rt8515", },
> +       { /* sentinel */ },

Comma is not needed.

> +};

-- 
With Best Regards,
Andy Shevchenko

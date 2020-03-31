Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8206E199807
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 16:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731021AbgCaOBJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 10:01:09 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54855 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730818AbgCaOBI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 10:01:08 -0400
Received: by mail-pj1-f68.google.com with SMTP id np9so1106821pjb.4;
        Tue, 31 Mar 2020 07:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TFLaiXmun4w8o5+Tq1iKXqKBbdoEIS4c8H+edqwRUVI=;
        b=Qv/G/OwiwgPPLwotGiBBkiOI5nrvXLm5PXvdLqxL45fQ2wsXl/nZl5d0RQzXRkciG8
         Iybk/fcn79BMAOI1HV9iPYg9E75fQJEQ4EmZ1t3qzFK0ZhRlsc+Ms+saEdX1mEOVxKQF
         IP0TKfdebBhFtnrppzhiO0ybbd3OK5iLy8TqWdtzzbEKN3+QkbQeaDVZKPvIpRwP4VRL
         wAkJabbz0sdRkDTQt0rzlqRWUFZrWHJfKDuA2g3zYFUWtV+20sbMDKX+qCelB4t7l8iJ
         KU006nHCkkPz1/pyiCTLU4qx2Fpb/J1fhpD92loq0fVQ/kpLnoS2768kfxmgJqcY397I
         5zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TFLaiXmun4w8o5+Tq1iKXqKBbdoEIS4c8H+edqwRUVI=;
        b=UWIB5GiadsyrTzyaPdGrYqEKo6IGiJ7/Vmul4S2H4WoFLWh8stgEsFIbl0ZjznbYzW
         9xdyGZvkYl0XIFLVB6bH160LrxkNghItlDdsBeM2iOCZ0dNsNj6ZP/KE1HzYSdEdXbZO
         lt3+YHwV7kMFmR5c6jgL5CajviXOeAIimnALAB/M162v0l8nrwnvSLk74LQmqPHry+NE
         fwaJTlFYARkjDkVG9qSiQ77i7yP5oF8Rz6q2eePfil3PgJDDhRVGQav8ObOMNOvsWNb1
         xaC92/j/mtny6VLSsfqI58GSh5ypGcyudX7v5kZxlrO3NuZM4PIez04vQOhFiITkXdO1
         7Xsw==
X-Gm-Message-State: AGi0Puaew+tn4n0wVku0m0Gv2cwKQrxGKk93tKnpFH9bQ7PVEugK1nAQ
        vCyrzFCiB6X2A0Ii/fM3izwOQEZFJ45Tz2n7IEU=
X-Google-Smtp-Source: APiQypJB7Jvm09PZHaUiKtbyo6HAV3AG4FiOz7wPm0aCTC1KqAMGu+JBwxYo2PSJ/sRZe+L/LPsMDnKck5AK6WZNPDg=
X-Received: by 2002:a17:90a:3602:: with SMTP id s2mr4130400pjb.143.1585663267338;
 Tue, 31 Mar 2020 07:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200331133346.372517-1-robert.foss@linaro.org> <20200331133346.372517-3-robert.foss@linaro.org>
In-Reply-To: <20200331133346.372517-3-robert.foss@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 31 Mar 2020 17:01:00 +0300
Message-ID: <CAHp75VfFKY6nzb8aEWmop73v2haZ0P5+aTsKDEU8M=uUPn0u3g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: ov8856: Add devicetree support
To:     Robert Foss <robert.foss@linaro.org>
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

On Tue, Mar 31, 2020 at 4:36 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> Add devicetree match table, and enable ov8856_probe()
> to initialize power, clocks and reset pins.

...

> +static int __ov8856_power_on(struct ov8856 *ov8856)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> +       int ret;
> +
> +       ret = clk_prepare_enable(ov8856->xvclk);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to enable xvclk\n");
> +               return ret;
> +       }
> +

> +       if (is_acpi_node(ov8856->dev->fwnode))

Use dev_fwnode().

> +               return 0;
> +
> +       if (ov8856->reset_gpio) {

> +               gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);

This is wrong. You have to fix it to use either 0 or 1.

> +               usleep_range(1000, 2000);
> +       }
> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(ov8856_supply_names),
> +                                   ov8856->supplies);

> +       if (ret < 0) {

Do you need all ' < 0' parts all over the series?

> +               dev_err(&client->dev, "failed to enable regulators\n");
> +               goto disable_clk;
> +       }

...

> +       gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_LOW);

Ditto.

...

> +       gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);

Ditto.

...

> +       gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);

Ditto.

...

> -       ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
> -       if (ret)
> -               return ret;

Where is it gone? Why?

> +       ov8856->xvclk = devm_clk_get_optional(dev, "xvclk");
> +       if (IS_ERR(ov8856->xvclk)) {

> +               dev_err(dev, "could not get xvclk clock (%ld)\n",
> +                       PTR_ERR(ov8856->xvclk));

Also you may use %pe here and in similar cases.

> +               return PTR_ERR(ov8856->xvclk);
> +       }

> +       ov8856->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +               GPIOD_OUT_HIGH);

Here parameter is correct. The question is, what the value should be
HIGH or LOW?
Basically HIGH means to assert the signal.

> +       if (IS_ERR(ov8856->reset_gpio)) {

> +               dev_dbg(dev, "failed to get reset-gpio\n");

Noise.
Enable GPIO debug to see this kind of messages.

> +               return PTR_ERR(ov8856->reset_gpio);
> +       }

...

> +       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov8856_supply_names),
> +                                     ov8856->supplies);
> +       if (ret) {

> +               dev_warn(dev, "failed to get regulators\n");

If it's a warning, why we return from here?
Same question to all other places with same issue.

> +               return ret;
>         }

-- 
With Best Regards,
Andy Shevchenko

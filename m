Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA07BB2B00
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2019 12:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbfINKeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Sep 2019 06:34:10 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36899 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbfINKeK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Sep 2019 06:34:10 -0400
Received: by mail-ot1-f66.google.com with SMTP id s28so31700871otd.4;
        Sat, 14 Sep 2019 03:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mbl+TqU1RDnoByFgw6YTBN5hIBAakcwGG9n4xIXKC+c=;
        b=tA7nWU3lXGqX+JpHOfUpDNhRLNRrl/cI6sGJCiUggydaE/S6ZkSqxtdt5kCmPqZMES
         NWDPdSvDHfUXDYew5WaGZAB7Xgmkvnjd29YNbEyR9axnVffmmchZ/BHsojl/H3Z12TG0
         XQvksO1xLsz334htc8qviaKaTmeepDRWOkuGIiE8lhwG1q6MjoN7H+GFt3auQark5aoz
         Gxpd1aPzqrGpBi+7VoQM0claaW8LeONmt+9gOZPgpQVmF+gXQGodcLz1yp6XUaomdFOb
         U2o12BGdODfqkuSAdRt+IiKwrWjhCc65AhAeHwkHalTA4/yEUKN3tn3mm2tUaqmL2+Pz
         IwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mbl+TqU1RDnoByFgw6YTBN5hIBAakcwGG9n4xIXKC+c=;
        b=M5e+//XNlm8GKV+74TZtb7+2uPv5TgUVwnR0vbZR8WqtKGr3fQfdOb+264ukHCDoLc
         aqBTHyy3Nq84L5xSp8Zmn4wljPasctCxpI85Zj8J7X2jUP4RmiMB6JHDdVJkhRPkUzOX
         rAhLYGSzCRvpNRKBkW74EYW3gUOfZkPy+VkLRCGeg5dRvVU7AxYKbQLgIG4/rnLipiRA
         cW4OjVsI90yHI8NCq6bH8oIAhzJnRzXIS4LDrPJ+xT09lsDJNf/He+PVKDkAz87+3s89
         3pXW29eBWwRPFK92GkbgzkjGb7kCFdR6oe86nxTK4LYI5ihExfcwWQLIBHFrl+C2FGsB
         RkBA==
X-Gm-Message-State: APjAAAVRzUy9aJ/2xnQg9Gd/ouCAk/cXlEVxRPHTsct9/hElUk88G6Zq
        KmVMmdsOHpT9J8ykZpmNq9bA8C0491HA49p6pLI=
X-Google-Smtp-Source: APXvYqz11IoWGhoGXKjzb8F+hvckBLKA4ujj2NSQtgA3h1sXWfq74cy0DnzK69Jz9K7i6UWYYo405yTRzItDeF6LSFo=
X-Received: by 2002:a9d:744c:: with SMTP id p12mr38958898otk.198.1568457249060;
 Sat, 14 Sep 2019 03:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190912130007.4469-1-bparrot@ti.com> <20190912130007.4469-5-bparrot@ti.com>
In-Reply-To: <20190912130007.4469-5-bparrot@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 14 Sep 2019 11:33:42 +0100
Message-ID: <CA+V-a8stmX2WmJEQRvvdOfHiFNgmEbtPTWtn+Fuq2h8SW4N3Hw@mail.gmail.com>
Subject: Re: [Patch 4/6] media: i2c: ov2659: Add optional powerdown gpio handling
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

On Thu, Sep 12, 2019 at 1:58 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> On some board it is possible that the sensor 'powerdown'
> pin might be controlled with a gpio instead of being
> tied to always powered.
>
> This patch add support to specify an optional gpio
> which will be set at probe time and remained on.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/i2c/Kconfig  |  2 +-
>  drivers/media/i2c/ov2659.c | 13 +++++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 7eee1812bba3..315c1d8bdb7b 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -634,7 +634,7 @@ config VIDEO_OV2640
>  config VIDEO_OV2659
>         tristate "OmniVision OV2659 sensor support"
>         depends on VIDEO_V4L2 && I2C
> -       depends on MEDIA_CAMERA_SUPPORT
> +       depends on MEDIA_CAMERA_SUPPORT && GPIOLIB
>         select V4L2_FWNODE
>         help
>           This is a Video4Linux2 sensor driver for the OmniVision
> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index efbe6dc720e2..c64f73bef336 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -32,6 +32,8 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include <linux/videodev2.h>
> @@ -232,6 +234,8 @@ struct ov2659 {
>         struct sensor_register *format_ctrl_regs;
>         struct ov2659_pll_ctrl pll;
>         int streaming;
> +       /* used to control the sensor powerdownN pin */
> +       struct gpio_desc *pwrdn_gpio;
>  };
>
>  static const struct sensor_register ov2659_init_regs[] = {
> @@ -1391,6 +1395,7 @@ static int ov2659_probe(struct i2c_client *client)
>         struct v4l2_subdev *sd;
>         struct ov2659 *ov2659;
>         struct clk *clk;
> +       struct gpio_desc *gpio;

you don't need the local var here you can just assign it directly to pwrdn_gpio.

>         int ret;
>
>         if (!pdata) {
> @@ -1414,6 +1419,14 @@ static int ov2659_probe(struct i2c_client *client)
>             ov2659->xvclk_frequency > 27000000)
>                 return -EINVAL;
>
> +       /* Optional gpio don't fail if not present */
> +       gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
> +                                      GPIOD_OUT_HIGH);
> +       if (IS_ERR(gpio))
> +               return PTR_ERR(gpio);
> +
> +       ov2659->pwrdn_gpio = gpio;
> +
apart from assigning it you don't actually use it.

you will also have to read the reset gpio pin and implement
ov2659_set_power() and
call it in appropriate places/ s_power ?

Cheers,
--Prabhakar Lad

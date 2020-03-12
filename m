Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52162183B83
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 22:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgCLVls (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 17:41:48 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37608 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgCLVls (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 17:41:48 -0400
Received: by mail-oi1-f195.google.com with SMTP id w13so7176239oih.4;
        Thu, 12 Mar 2020 14:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2UGW4bHfX08GEbePww+EddI/NsbhfU55Uie8iNExZVk=;
        b=lE843qE4tcSbZpfHiIMYB+9KGDMc3l13E6OOvmGboWSkUJkxntGI2QLLLfCPn+W0th
         lPT4TmIlYUrWXNde62hc7r1ePbmuvMPb83ExEDqRKAWID3Vt/609ONpIE3wUzCJgsdhx
         n55csuXAq5mS7jiZEUPw4MLKaz56vTbQSbI42vGJb7IkTkEnuzGkpk55216YSaz/ZZxa
         JJwFYkZ0xuH87jMn3lSO6gjYNWemBVXOz3ikBiF9Z/bPZE2MWNVQ/eXC/7GFANGWzWLy
         LS4veansW+ISmA5hp7HLZxU+3VXidzOAk0AVUprmt2M+GRc9xaZ54Xoqr4vNjKIUntnb
         Sd9w==
X-Gm-Message-State: ANhLgQ3ZhCkwAv+LmTQuGpbjA47fB5AiqFXWh1hRU+XvouxS/lxSz5H6
        56W2dCKLWy04HjvpQ2WyXe7jSPOieKF/NJFey20=
X-Google-Smtp-Source: ADFU+vuDUW/4+kTvvOXt43MMd+pd/8k57mMKsg695zk0cUiXBtsY6UfW2Bd3hR2zkhh7QvO+6ko15uTV55E52TqiQyA=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr4238410oig.153.1584049307407;
 Thu, 12 Mar 2020 14:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <1584047552-20166-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584047552-20166-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1584047552-20166-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Mar 2020 22:41:36 +0100
Message-ID: <CAMuHMdUgMHjU_ZANzJbxQji6K7Pdc-jD4C7JatQc-OtN=jJt_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] media: i2c: ov5645: Switch to assigned-clock-rates
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Thu, Mar 12, 2020 at 10:13 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This patch switches to assigned-clock-rates for specifying the clock rate.
> The clk-conf.c internally handles setting the clock rate when
> assigned-clock-rates is passed.
>
> The driver now sets the clock frequency only if the deprecated property
> clock-frequency is defined instead assigned-clock-rates, this is to avoid
> breakage with existing DT binaries.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1055,6 +1055,7 @@ static int ov5645_probe(struct i2c_client *client)
>         struct device_node *endpoint;
>         struct ov5645 *ov5645;
>         u8 chip_id_high, chip_id_low;
> +       bool set_clk = false;
>         unsigned int i;
>         u32 xclk_freq;
>         int ret;
> @@ -1094,10 +1095,17 @@ static int ov5645_probe(struct i2c_client *client)
>                 return PTR_ERR(ov5645->xclk);
>         }
>
> -       ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
> +       ret = of_property_read_u32(dev->of_node, "assigned-clock-rates",
> +                                  &xclk_freq);
>         if (ret) {

I think you can just leave out the above check...

> -               dev_err(dev, "could not get xclk frequency\n");
> -               return ret;
> +               /* check if deprecated property clock-frequency is defined */
> +               ret = of_property_read_u32(dev->of_node, "clock-frequency",
> +                                          &xclk_freq);
> +               if (ret) {

... and ignore the absence of the deprecated property.

> +                       dev_err(dev, "could not get xclk frequency\n");
> +                       return ret;
> +               }
> +               set_clk = true;

I.e. just

        /* check if deprecated property clock-frequency is defined */
        xclk_freq = 0;
        of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
        if (xclk_freq) {
                ret = clk_set_rate(ov5645->xclk, xclk_freq);
                if (ret) {
                        dev_err(dev, "could not set xclk frequency\n");
                        return ret;
                }
        } else {
                xclk_freq = clk_get_rate(ov5645->xclk, xclk_freq);
        }

>         }
>
>         /* external clock must be 24MHz, allow 1% tolerance */
> @@ -1107,10 +1115,12 @@ static int ov5645_probe(struct i2c_client *client)
>                 return -EINVAL;
>         }
>
> -       ret = clk_set_rate(ov5645->xclk, xclk_freq);
> -       if (ret) {
> -               dev_err(dev, "could not set xclk frequency\n");
> -               return ret;
> +       if (set_clk) {
> +               ret = clk_set_rate(ov5645->xclk, xclk_freq);
> +               if (ret) {
> +                       dev_err(dev, "could not set xclk frequency\n");
> +                       return ret;
> +               }

>         }
>
>         for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
> --
> 2.7.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

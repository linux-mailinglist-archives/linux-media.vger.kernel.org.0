Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B872CFDFF
	for <lists+linux-media@lfdr.de>; Sat,  5 Dec 2020 20:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgLESza (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Dec 2020 13:55:30 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40224 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgLESz3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Dec 2020 13:55:29 -0500
Received: by mail-ot1-f66.google.com with SMTP id j12so8624781ota.7;
        Sat, 05 Dec 2020 10:55:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5313XC3NfbvTufqGnoEAJCgFERCH+JaQxzJ9SkuUnEI=;
        b=GPgQcewdYOUcJbmjrgAPum8YziaQz1zD1qSAcoE8BqjHmRt9zEL2hFjNXWQPKoTJiP
         rq0p+S/5mEqQp1t7GQqBCM4ZN5NgTwlQaRy+f1Bp3NQUQ7ux1SwmCJHISCJ7fzo64zbx
         GIP6xR5rApk9d+k1StsoA8jw9MtAwetIYEPXlaB0SMJWGHcVy6SeqSxN1H8sTd9mGFFn
         0Xh0h9IqTC9Yk3SZWcVDmJfKHCn4EDK6Ze/nolgDuC2U4z/WM237AtsMxFDrFlW70VwB
         Ya9bvXLE2W6Ucah8es3oknVM3htGONItVNKNjeoKR90esUxulymjgkWKCMo1FjohzLip
         SQQQ==
X-Gm-Message-State: AOAM531bqJeHHvrzt8OEte7cyXPMTmpZYY2YBSRBWkrOv94HE8Izv3Nf
        HDi744kO8bGvn8xI0ngKjNV6IKv2He2mtSM9lwE=
X-Google-Smtp-Source: ABdhPJyHhcwE29b9kUY2JgtRiLm4Fpspo3qTwPzC7XurwuY7tdRsTokCyB+6/3Eipnvz05ZHTOnotkt0sxEnVBUvuP0=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr7913179ota.107.1607194483442;
 Sat, 05 Dec 2020 10:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20201205183355.6488-1-michael.srba@seznam.cz>
In-Reply-To: <20201205183355.6488-1-michael.srba@seznam.cz>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 5 Dec 2020 19:54:32 +0100
Message-ID: <CAMuHMdXLQeTWGmAk9a3uE0VgPmTUsjbNn36q9-228eZufuYZ6w@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: i2c: imx219: add support for specifying clock-frequencies
To:     michael.srba@seznam.cz
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Sat, Dec 5, 2020 at 7:36 PM <michael.srba@seznam.cz> wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
>
> This patch adds 1% tolerance on input clock, similar to other camera sensor
> drivers. It also allows for specifying the actual clock in the device tree,
> instead of relying on it being already set to the right frequency (which is
> often not the case).
>
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>

Thanks for your patch!

> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1443,13 +1443,26 @@ static int imx219_probe(struct i2c_client *client)
>                 return PTR_ERR(imx219->xclk);
>         }
>
> -       imx219->xclk_freq = clk_get_rate(imx219->xclk);
> -       if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> +       ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &imx219->xclk_freq);
> +       if (ret) {
> +               dev_err(dev, "could not get xclk frequency\n");
> +               return ret;

This breaks compatibility with existing DTBs, which do not have the
clock-frequency property.
For backwards compatibility, you should assume the default 24 MHz
instead of returning an error.

> +       }
> +
> +       /* this driver currently expects 24MHz; allow 1% tolerance */
> +       if (imx219->xclk_freq < 23760000 || imx219->xclk_freq > 24240000) {
>                 dev_err(dev, "xclk frequency not supported: %d Hz\n",
>                         imx219->xclk_freq);
>                 return -EINVAL;
>         }
>
> +       ret = clk_set_rate(imx219->xclk, imx219->xclk_freq);
> +       if (ret) {
> +               dev_err(dev, "could not set xclk frequency\n");
> +               return ret;
> +       }
> +
> +
>         ret = imx219_get_regulators(imx219);
>         if (ret) {
>                 dev_err(dev, "failed to get regulators\n");

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

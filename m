Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8701A03C0
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 02:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgDGA10 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 20:27:26 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:43601 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgDGA10 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 20:27:26 -0400
Received: by mail-vk1-f193.google.com with SMTP id v129so388274vkf.10
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 17:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wfyAVcQGx6/oOgJN3uPs5RcIwAAfUml0vK4JD330630=;
        b=nQ4pVJYE1GsuBCtVK6/ZF1XhbEkn8r0ewwwWWRF5mL7wdqtOeTJ8JqRLLOT7E22Vz2
         Co6GUxbKDk3235MmxbFnI7GzWss1XQZDSAHG9wmPrW4dLey7F+Bc+RE9oQh4V/5o5Cwr
         NzRHvMrCUIIU/mgx5yOHkYxE/pbHXVcnCH6WemKXXUgyuApb7p0Jicug44oyTohV0y47
         Kg9kTqM84RdpbwsQEBdw+7T41l+otpE0q5PtpJP/IrirCpKwI2xYUaSTpqYne7GhqKtM
         i+ZDTsxzdQCS/j4DiGDLBnHJCB61EKTtEPOggXYRKS51HbHKZxzL2TZtXXnGiurkd1lX
         dfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wfyAVcQGx6/oOgJN3uPs5RcIwAAfUml0vK4JD330630=;
        b=CZ7qd6zvBCl3xnpLHTDtk11dc9lsEeDvoyZi2K+VAzfOXQjKn5N1yAAIAAXJGsHWNK
         5mAsosmP1Y4d357rufu6PA6JtSuO7l+AOJooX27OazEL9DTCXw8Aaifw2NyjccL2gAJV
         JXpyBKe8iOK6iJRFVldigPWGJCQxcFY61yUGaSGasq06G0niTuq36mEZeM1coyb+kXGp
         cpEwSM+LlpqXblU6PPCiIOyoPv0J5U9VdY6+zgHvYZrKljl2BZfbo5gyiwjl26ERSJqp
         ImHZ8jArJGmzOQHKl4wTXOM0z8v8tEcTkEmHkr8d1Y00+74QJjKeyRFxRbVcLz1Kv61F
         ngpQ==
X-Gm-Message-State: AGi0PuZaToKAxub8e0EKZOWwKCjV9M9Db62Yh4cV2CZdSRiMJnJHutWB
        Gbl7axFvt/ybWVRnkZJWCjrSeLTH+1ibQmaT/R5mkQ==
X-Google-Smtp-Source: APiQypL//CsHvWf8NTp8TZhDUrnqs9wqnpRPj5xGijsBJay1aiejPAwytAQ1hbDpt5JZ7eSdDZr7XaviEkn/n87velc=
X-Received: by 2002:a1f:7f1d:: with SMTP id o29mr1554804vki.101.1586219244218;
 Mon, 06 Apr 2020 17:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <karthik.poduval@gmail.com> <20200406073017.19462-1-karthik.poduval@gmail.com>
 <20200406073017.19462-2-karthik.poduval@gmail.com>
In-Reply-To: <20200406073017.19462-2-karthik.poduval@gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Mon, 6 Apr 2020 21:27:13 -0300
Message-ID: <CAAEAJfD5qFxZfqdfo9xHAq7Rzj8iyDi7PWH9yrtmQYVxVd8kyA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: staging: phy-rockchip-dphy-rx0: add rk3288
 support to DPHY driver
To:     Karthik Poduval <karthik.poduval@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey there Karthik,

Thanks for your contribution. I'm happy to see this driver
is used and tested more.

The patch looks good, just some minor comments,
in addition to Helen's comments.

Hopefully you'll be able to nail this on the v3 :-)

It would be really better for us if you could add a cover letter
(i.e. PATCH 0/3) in this series. You would be able to put
important information there such as testing information,
series changelog, so on.

See for instance: https://patchwork.linuxtv.org/cover/62830/

Also, please scripts/get_maintainers.pl next time as indication
of who to Cc your patches. For instance, I am the author
of this driver, but I'm not Cced, so I could have missed your patch.

Finally, please put a note at the top of the driver,
explaining where the RK3288 support comes from.

Something like this would work:
"'"
RK3288 support based on <file> in <git repo>, branch <b>"
"""

See below a few more comments.

On Mon, 6 Apr 2020 at 04:30, Karthik Poduval <karthik.poduval@gmail.com> wrote:
>
> add rk3288 support to Rockchip DPHY driver
>
> tested on tinkerbaord with ov5647 using command
> cam -c 1 -C -F cap
>

Nitpick: s/tinkerbaord/tinkerboard

I'd like to have proper sentences in the commit log.
This means, sentences start with capital letters and end
with a stop.

The testing information is normally left for the cover letter.
Also, keep in mind you will need to add proper context
here: for instance, where does the "cam -c 1 -C -F cap"
command come from? I guess it's libcamera, you should
mention this.

> Reported-by: Karthik Poduval <karthik.poduval@gmail.com>

As Helen already pointed out, if you are Reported-by is
incorrectly used here. Please read Documentation/process/submitting-patches.rst.

Helen mentioned this on the v1. Please make sure you
go thru all the feedback you get on each version,
before posting a new one. There's no rush :-)

> Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
> ---
>  .../bindings/phy/rockchip-mipi-dphy-rx0.yaml  |  1 +
>  .../phy-rockchip-dphy-rx0.c                   | 69 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>
> diff --git a/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml b/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
> index 5dacece35702..8927c36de532 100644
> --- a/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
> +++ b/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
> @@ -17,6 +17,7 @@ description: |
>  properties:
>    compatible:
>      const: rockchip,rk3399-mipi-dphy-rx0
> +    const: rockchip,rk3288-mipi-dphy-rx0
>
>    reg:
>      maxItems: 1
> diff --git a/drivers/staging/media/phy-rockchip-dphy-rx0/phy-rockchip-dphy-rx0.c b/drivers/staging/media/phy-rockchip-dphy-rx0/phy-rockchip-dphy-rx0.c
> index 7c4df6d48c43..36fc1b1ee7ae 100644
> --- a/drivers/staging/media/phy-rockchip-dphy-rx0/phy-rockchip-dphy-rx0.c
> +++ b/drivers/staging/media/phy-rockchip-dphy-rx0/phy-rockchip-dphy-rx0.c
> @@ -26,6 +26,15 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>
> +#define RK3288_GRF_SOC_CON6     0x025c
> +#define RK3288_GRF_SOC_CON8     0x0264
> +#define RK3288_GRF_SOC_CON9     0x0268
> +#define RK3288_GRF_SOC_CON10    0x026c
> +#define RK3288_GRF_SOC_CON14    0x027c
> +#define RK3288_GRF_SOC_STATUS21 0x02d4
> +#define RK3288_GRF_IO_VSEL      0x0380
> +#define RK3288_GRF_SOC_CON15    0x03a4
> +
>  #define RK3399_GRF_SOC_CON9            0x6224
>  #define RK3399_GRF_SOC_CON21           0x6254
>  #define RK3399_GRF_SOC_CON22           0x6258
> @@ -47,6 +56,19 @@ struct hsfreq_range {
>         u8 cfg_bit;
>  };
>
> +static const struct hsfreq_range rk3288_mipidphy_hsfreq_ranges[] = {
> +       {  89, 0x00}, {  99, 0x10}, { 109, 0x20}, { 129, 0x01},
> +       { 139, 0x11}, { 149, 0x21}, { 169, 0x02}, { 179, 0x12},
> +       { 199, 0x22}, { 219, 0x03}, { 239, 0x13}, { 249, 0x23},
> +       { 269, 0x04}, { 299, 0x14}, { 329, 0x05}, { 359, 0x15},
> +       { 399, 0x25}, { 449, 0x06}, { 499, 0x16}, { 549, 0x07},
> +       { 599, 0x17}, { 649, 0x08}, { 699, 0x18}, { 749, 0x09},
> +       { 799, 0x19}, { 849, 0x29}, { 899, 0x39}, { 949, 0x0a},
> +       { 999, 0x1a}, {1049, 0x2a}, {1099, 0x3a}, {1149, 0x0b},
> +       {1199, 0x1b}, {1249, 0x2b}, {1299, 0x3b}, {1349, 0x0c},
> +       {1399, 0x1c}, {1449, 0x2c}, {1500, 0x3c}
> +};
> +
>  static const struct hsfreq_range rk3399_mipidphy_hsfreq_ranges[] = {
>         {   89, 0x00 }, {   99, 0x10 }, {  109, 0x20 }, {  129, 0x01 },
>         {  139, 0x11 }, {  149, 0x21 }, {  169, 0x02 }, {  179, 0x12 },
> @@ -60,6 +82,11 @@ static const struct hsfreq_range rk3399_mipidphy_hsfreq_ranges[] = {
>         { 1399, 0x1c }, { 1449, 0x2c }, { 1500, 0x3c }
>  };
>
> +static const char * const rk3288_mipidphy_clks[] = {
> +       "dphy-ref",
> +       "pclk",
> +};
> +

... are you sure that you need this pclk? The driver
doesn't seem to be accessing any peripheral interface.

Can you test without requesting the pclk ?

Stay safe!
Ezequiel

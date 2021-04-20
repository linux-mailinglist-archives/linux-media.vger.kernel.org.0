Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA7AE365282
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 08:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhDTGqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 02:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhDTGqz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 02:46:55 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B885C06174A;
        Mon, 19 Apr 2021 23:46:24 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id a11so35310470ioo.0;
        Mon, 19 Apr 2021 23:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3qxPUUEpSWeJekWw581+kjJxj0KS+o4El6IFU4SLTKE=;
        b=JeHXqEWCEGg+IH8zFO2SXV/COmpHUy0QJcJViTHz3Gh/k66JB9Cf6c0kwuxBDln2Tv
         /42Jdk/8sOG8CFsElnzKah3yQl+c3u8V0nY7Z1fQp40SpI5s9aFNcHjCCEdt7lVQu+aD
         uZGA9Z5Bw04GmklvjqB+V4h/8eaM0lCIHmEd/M2rKRVd5UR7gs0cy4XJg1wGr+qRk3Ux
         nqrZtSnsH0sK1m9RtxkzR9PQwCiehn8JJolBz6g/SQsHzMbKUBxuh/sRIcMKqa32eTqP
         2qXcnsA/sD98BhK75kqmPEJGNr2zLw/hRpGRhQru+L9rYS+q3689hizltQRzNsM3dUKB
         yjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3qxPUUEpSWeJekWw581+kjJxj0KS+o4El6IFU4SLTKE=;
        b=AUE4XJwHhUlTMe/nFuaM0vls5oz0eU/RBxLj0nlp1DnqL2Jozcp4eSSqS3KY6yrsA3
         94+q2cctugp0HHvQBsu54Ttiyl4jBehuIzcfB2nWpvdrsSs2mdG59MTxjyF8vrUW/GBH
         gvRNDoIC3LRwDhocfbiiHJr/ccxLsqjAMMUUNQ7PsRHcrI9khJvZvfH07pdKVQ85WbIJ
         HRA76juLGGfISYGDVz3ktKkiiHnpXhcu/zBMbd5bcS1ero9U+18w2mnM5dzlw88hW92j
         2+0+yHynP4JqWPngxgMZq5/tIYWe3cy9czSkwpMbHlvF4o+EmUD/gopF4UPAYHNAmJeX
         CQWA==
X-Gm-Message-State: AOAM530UfE4nFaByZb2ef0yIsT9z0HAn8I33OkhJq22f4dYQ91zpaJgI
        3Od1Tfpb3tyanyZDa2bP3Heg67DstlaB2GKMQw4QwrzLLsOtng==
X-Google-Smtp-Source: ABdhPJyQ9VXI1tJ6DJ2aulhkUNPu5VVkt1bQl4xJXK40+sbwYal6rW5mo7Onio8OEsP3n1RU3tyBF0R2UVhzkMSmxGI=
X-Received: by 2002:a02:4e45:: with SMTP id r66mr19454263jaa.137.1618901183758;
 Mon, 19 Apr 2021 23:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com> <1618459535-8141-5-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1618459535-8141-5-git-send-email-dillon.minfei@gmail.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Tue, 20 Apr 2021 14:45:47 +0800
Message-ID: <CAL9mu0LmZO38CvmRfBMvgJm6310eMY64tgTRw8kWKCPuGJReoA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}()
 to set xvclk on/off
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, krzk@kernel.org,
        linux@rempel-privat.de, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        festevam@gmail.com, prabhakar.csengg@gmail.com, mchehab@kernel.org
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-imx@nxp.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Just a gentle ping, hope some expert could take a look, thanks.

Best regards.
Dillon

On Thu, Apr 15, 2021 at 12:06 PM <dillon.minfei@gmail.com> wrote:
>
> From: dillon min <dillon.minfei@gmail.com>
>
> On some platform(imx6q), xvclk might not switch on in advance,
> also for power save purpose, xvclk should not be always on.
> so, add clk_prepare_enable(), clk_disable_unprepare() in driver
> side to set xvclk on/off at proper stage.
>
> Add following changes:
> - add 'struct clk *clk;' in 'struct ov2659 {}'
> - enable xvclk in ov2659_power_on()
> - disable xvclk in ov2659_power_off()
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
> v3: optimize commit message
>
>  drivers/media/i2c/ov2659.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 42f64175a6df..fb78a1cedc03 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -204,6 +204,7 @@ struct ov2659 {
>         struct i2c_client *client;
>         struct v4l2_ctrl_handler ctrls;
>         struct v4l2_ctrl *link_frequency;
> +       struct clk *clk;
>         const struct ov2659_framesize *frame_size;
>         struct sensor_register *format_ctrl_regs;
>         struct ov2659_pll_ctrl pll;
> @@ -1270,6 +1271,8 @@ static int ov2659_power_off(struct device *dev)
>
>         gpiod_set_value(ov2659->pwdn_gpio, 1);
>
> +       clk_disable_unprepare(ov2659->clk);
> +
>         return 0;
>  }
>
> @@ -1278,9 +1281,17 @@ static int ov2659_power_on(struct device *dev)
>         struct i2c_client *client = to_i2c_client(dev);
>         struct v4l2_subdev *sd = i2c_get_clientdata(client);
>         struct ov2659 *ov2659 = to_ov2659(sd);
> +       int ret;
>
>         dev_dbg(&client->dev, "%s:\n", __func__);
>
> +       ret = clk_prepare_enable(ov2659->clk);
> +       if (ret) {
> +               dev_err(&client->dev, "%s: failed to enable clock\n",
> +                       __func__);
> +               return ret;
> +       }
> +
>         gpiod_set_value(ov2659->pwdn_gpio, 0);
>
>         if (ov2659->resetb_gpio) {
> @@ -1425,7 +1436,6 @@ static int ov2659_probe(struct i2c_client *client)
>         const struct ov2659_platform_data *pdata = ov2659_get_pdata(client);
>         struct v4l2_subdev *sd;
>         struct ov2659 *ov2659;
> -       struct clk *clk;
>         int ret;
>
>         if (!pdata) {
> @@ -1440,11 +1450,11 @@ static int ov2659_probe(struct i2c_client *client)
>         ov2659->pdata = pdata;
>         ov2659->client = client;
>
> -       clk = devm_clk_get(&client->dev, "xvclk");
> -       if (IS_ERR(clk))
> -               return PTR_ERR(clk);
> +       ov2659->clk = devm_clk_get(&client->dev, "xvclk");
> +       if (IS_ERR(ov2659->clk))
> +               return PTR_ERR(ov2659->clk);
>
> -       ov2659->xvclk_frequency = clk_get_rate(clk);
> +       ov2659->xvclk_frequency = clk_get_rate(ov2659->clk);
>         if (ov2659->xvclk_frequency < 6000000 ||
>             ov2659->xvclk_frequency > 27000000)
>                 return -EINVAL;
> @@ -1506,7 +1516,9 @@ static int ov2659_probe(struct i2c_client *client)
>         ov2659->frame_size = &ov2659_framesizes[2];
>         ov2659->format_ctrl_regs = ov2659_formats[0].format_ctrl_regs;
>
> -       ov2659_power_on(&client->dev);
> +       ret = ov2659_power_on(&client->dev);
> +       if (ret < 0)
> +               goto error;
>
>         ret = ov2659_detect(sd);
>         if (ret < 0)
> --
> 2.7.4
>

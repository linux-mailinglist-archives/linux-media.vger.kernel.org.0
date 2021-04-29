Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F7836E830
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 11:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbhD2JuF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 05:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231722AbhD2JuE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 05:50:04 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE873C06138B;
        Thu, 29 Apr 2021 02:48:47 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id y32so46739945pga.11;
        Thu, 29 Apr 2021 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KXl/c74AMpKZXf8ydn6vhU4c7o1h7zu3c9c3XPNN9ek=;
        b=MTtt/Nicd8OEciv2xT9CmfzHqdDuyn2e7nw6RCCov0FN+FuL6ZrpUU1iNfUnfkzACI
         yV5s+FdSe1EQHnbHvrtfQgsOkZNTyP6ByTU9E4c3oHTh7DZQobLVNJQ+N8mt9HjwEIfb
         ihygcHtmq7qJHu+Hb6AfBkw8jqR7O9vDtT9hpu8CpUkUBTUQcMMU12ShyVh54+qUUbI3
         U6p3r707ZfnMkXhWxrV/90dFSn8Q7x2M28gQE2qMtDs5b9sBXOFPEluCYf6u3mXWP5RM
         op/bjC3M4hxqnPL1q7JHz7CJxHxS473+sYWDVaJaqhQ4zDMbsI0VZCcg1TyDi0HPCUU5
         qrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KXl/c74AMpKZXf8ydn6vhU4c7o1h7zu3c9c3XPNN9ek=;
        b=A8S203iX16i6errVZ0dUvZPDmn0kO/fIkAQrBqtmF8T7W+dFel3Fs1vnhQ3dQNJOzZ
         MnIl8fUyGIXYs4yYZmWEnBm8+nZF39Ygr7dcqqGFP0k0Hc+/PJIr+W95LziIh1Rwvv96
         916jXCq7RixQY0keh4+uRc9yX5hbDDjriHFoZEh9ITREsnsW9QoCLHLo2o+U3VvFCMMT
         fn5a2k0QEAAxE9xb8COFfYjPivtYFX1ANZLO275VTm67wQzC5oXqCmJBqkl79UiwkCFw
         3MKc3VA9G9MKORYSrUoBZkEsNCPRzQTHFR6RRj1ZAyPISLXdzVMZC1HmQQozzhPdGfyG
         S8SA==
X-Gm-Message-State: AOAM531LrlHFdyEoRBPR25bC+kMHhz03t3873jJrVH5YuzlcWhBQXder
        h7ifGEtRaIqXZbRVtvQhebnvWdvGGSm0IoXuXSU8lCvhhT0BpDK0
X-Google-Smtp-Source: ABdhPJyGi2Wa7Ag0E7GFaCLYcJrAxeJPaiDV0C27TjkJJDFI5x1CFRltip91H/u+tuBzOeROXtER6XqR6J5gYiqhnkY=
X-Received: by 2002:a62:a515:0:b029:263:214f:27ff with SMTP id
 v21-20020a62a5150000b0290263214f27ffmr32639435pfm.4.1619689727386; Thu, 29
 Apr 2021 02:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <1618976938-20834-1-git-send-email-dillon.minfei@gmail.com> <1618976938-20834-5-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1618976938-20834-5-git-send-email-dillon.minfei@gmail.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Thu, 29 Apr 2021 17:48:11 +0800
Message-ID: <CAL9mu0KKJGxVijqQHmBVWZds9YZmmS4pouP_QO0xNN4DPdrgoA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}()
 to set xvclk on/off
To:     Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        leoyang.li@nxp.com, arnd@arndb.de, olof@lixom.net,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        prabhakar.csengg@gmail.com, mchehab@kernel.org,
        mchehab+huawei@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-imx@nxp.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Just a gentle ping.

and loop mchehab+huawei@kernel.org

Thanks

Best Regards
Dillon

On Wed, Apr 21, 2021 at 11:49 AM <dillon.minfei@gmail.com> wrote:
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
> v4: no changes
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

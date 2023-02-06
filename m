Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D060668C054
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 15:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjBFOlP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 09:41:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjBFOlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 09:41:14 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3121219F2B
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 06:41:13 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id j7so12837396vsl.11
        for <linux-media@vger.kernel.org>; Mon, 06 Feb 2023 06:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+w2S6uyVtXl+N2TMG+jPE/D1AfMS4lPC+s07COsfjC4=;
        b=Gkw2CYUqNkvGNddpf5mzEy8CKX9fECexBRUqQpc9iA3SS+k9ZQaZAwE1T13fFIT8Ry
         CwE3eyxjq9VbVoMkpIL4F+5fFxlxEy6LfWSvLvnSH754Qv6EsGn9CR6ATs0ZhUavuGGQ
         6ofIaRlCKQs6T8OiNixvxTludfoIiUUqUp2j4L4ds4e7f8dATd6XRhrPFWLqWJ84hrpD
         aeY0BRq/wRgl8vCK4BG1e/t9zWN54fn829aR4DQW7EDlLIiTcscvLs4+kOo0XpzP7XyI
         BGHttIn1ewROQCtqjc95kHd8aCMNdkxLFeg8fNG2fy7gTx42gy8N1NKDMFhpqUGmWAMG
         6Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+w2S6uyVtXl+N2TMG+jPE/D1AfMS4lPC+s07COsfjC4=;
        b=iC9IZZu1YGKHyI+WE6OKbBF7SHZrnA2m6oSsoJ4b85X1BlrRFus5I5a0LsMapuNeU8
         Ua2OJmvQTtJhzNpqS1fEfqOpeBs+cv55OPth1cYDtri2kwczTeKARyIBX3/J4tx5RSUY
         N74TVn8F+qpz4rCJVh1+pbQF53SnXJ5OJSOsyUcedHR0wHLFrWI3Ka+Zaq1DwzVIx0Om
         BllxNwWkp8fcTsQN8QD8G95CeZUc4lzhJpjan1P/nOcCshiGlq4G42FKz8NoyDPO4G+R
         Gezdcdr5naHW3WLO211fny8gl8dnHSJkIJf7OGJQ/ak+feQHcn6nzPE5nQ7Pe4NF7AL/
         k2Ig==
X-Gm-Message-State: AO0yUKXFjlmJ2YgAYqC9JmS0GNHXwx0XxuTvUPpFUYpI8Ty1kTMEsRfn
        CIWL+TGIPIQrgyPXBgLtOAQ3dnbFQJqe7T6ylH0a1VvCDZfw/7WS
X-Google-Smtp-Source: AK7set+QQR5FP1Nt8AoVS79J0ipjnkwFjl2MdrJADwEI0BpeLY7y/rNqbWpyj/vrV/6Cp9QMpHBBLpWFQBRVsqk5Gjo=
X-Received: by 2002:a67:ef41:0:b0:3f2:edef:718f with SMTP id
 k1-20020a67ef41000000b003f2edef718fmr3206633vsr.28.1675694472222; Mon, 06 Feb
 2023 06:41:12 -0800 (PST)
MIME-Version: 1.0
References: <20230206131731.548795-1-alexander.stein@ew.tq-group.com> <20230206131731.548795-3-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230206131731.548795-3-alexander.stein@ew.tq-group.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 6 Feb 2023 14:40:56 +0000
Message-ID: <CAPY8ntBzi8kccb6qVkHxs02Ae1fC0emLdo5CQd4uQ9PkJySGeQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: imx290: Add support for imx327 variant
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander

Thanks for the patch.

On Mon, 6 Feb 2023 at 13:17, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Both sensors are quite similar. Their specs only differ regarding LVDS
> and parallel output but are identical regarding MIPI-CSI-2 interface.
> But they use a different init setting of hard-coded values, taken from
> the datasheet.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Note: The call to v4l2_i2c_subdev_set_name will change the device name
> shown to userspace. So now 'imx290lqr' will be shown instead of 'imx290'.

This is going to cause grief as we already have a Pi libcamera
pipeline handler and tuning that relies on the entity name being
"imx290", so changing that is going to cause issues.

From userspace, the difference between lqr and llr is already reported
via the different colour formats supported (RGGB10 & RGGB12 vs Y10 &
Y12), so there is no need to provide the full part number. If there is
a need to distinguish imx327 vs imx290 in userspace, then I'd propose
just using the base model identifier.

>  drivers/media/i2c/imx290.c | 58 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 55 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 1cfdd700bca5..0bfbce8853e6 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -173,10 +173,13 @@ enum imx290_colour_variant {
>  enum imx290_model {
>         IMX290_MODEL_IMX290LQR,
>         IMX290_MODEL_IMX290LLR,
> +       IMX290_MODEL_IMX327LQR,
>  };
>
>  struct imx290_model_info {
>         enum imx290_colour_variant colour_variant;
> +       enum imx290_model model;
> +       const char *name;
>  };
>
>  enum imx290_clk_freq {
> @@ -272,10 +275,14 @@ static const struct imx290_regval imx290_global_init_settings[] = {
>         { IMX290_WINWV, 1097 },
>         { IMX290_XSOUTSEL, IMX290_XSOUTSEL_XVSOUTSEL_VSYNC |
>                            IMX290_XSOUTSEL_XHSOUTSEL_HSYNC },
> -       { IMX290_REG_8BIT(0x300f), 0x00 },
> -       { IMX290_REG_8BIT(0x3010), 0x21 },
> +       { IMX290_REG_8BIT(0x3011), 0x02 },
>         { IMX290_REG_8BIT(0x3012), 0x64 },
>         { IMX290_REG_8BIT(0x3013), 0x00 },
> +};
> +
> +static const struct imx290_regval imx290_global_init_settings_290[] = {
> +       { IMX290_REG_8BIT(0x300f), 0x00 },
> +       { IMX290_REG_8BIT(0x3010), 0x21 },
>         { IMX290_REG_8BIT(0x3016), 0x09 },
>         { IMX290_REG_8BIT(0x3070), 0x02 },
>         { IMX290_REG_8BIT(0x3071), 0x11 },
> @@ -328,6 +335,12 @@ static const struct imx290_regval xclk_regs[][IMX290_NUM_CLK_REGS] = {
>         },
>  };
>
> +static const struct imx290_regval imx290_global_init_settings_327[] = {
> +       { IMX290_REG_8BIT(0x309e), 0x4A },
> +       { IMX290_REG_8BIT(0x309f), 0x4A },
> +       { IMX290_REG_8BIT(0x313b), 0x61 },
> +};
> +
>  static const struct imx290_regval imx290_1080p_settings[] = {
>         /* mode settings */
>         { IMX290_WINWV_OB, 12 },
> @@ -999,9 +1012,11 @@ static int imx290_start_streaming(struct imx290 *imx290,
>                                   struct v4l2_subdev_state *state)
>  {
>         const struct v4l2_mbus_framefmt *format;
> +       const struct imx290_regval *regs;
> +       unsigned int reg_num;
>         int ret;
>
> -       /* Set init register settings */
> +       /* Set common init register settings */
>         ret = imx290_set_register_array(imx290, imx290_global_init_settings,
>                                         ARRAY_SIZE(imx290_global_init_settings));
>         if (ret < 0) {
> @@ -1009,6 +1024,28 @@ static int imx290_start_streaming(struct imx290 *imx290,
>                 return ret;
>         }
>
> +       switch (imx290->model->model) {
> +       case IMX290_MODEL_IMX290LQR:
> +       case IMX290_MODEL_IMX290LLR:
> +               regs = imx290_global_init_settings_290;
> +               reg_num = ARRAY_SIZE(imx290_global_init_settings_290);
> +               break;
> +       case IMX290_MODEL_IMX327LQR:
> +               regs = imx290_global_init_settings_327;
> +               reg_num = ARRAY_SIZE(imx290_global_init_settings_327);
> +               break;
> +       default:
> +               dev_err(imx290->dev, "Invalid model: %u\n", imx290->model->model);
> +               return -EINVAL;
> +       }

switch/case here, or add a pointer to struct imx290_model_info?
Keeping all the configuration for the different models in struct
imx290_model_info has an appeal to me.

  Dave

> +
> +       /* Set init register settings */
> +       ret = imx290_set_register_array(imx290, regs, reg_num);
> +       if (ret < 0) {
> +               dev_err(imx290->dev, "Could not set init registers\n");
> +               return ret;
> +       }
> +
>         /* Set clock parameters based on mode and xclk */
>         ret = imx290_set_clock(imx290);
>         if (ret < 0) {
> @@ -1479,9 +1516,18 @@ static s64 imx290_check_link_freqs(const struct imx290 *imx290,
>  static const struct imx290_model_info imx290_models[] = {
>         [IMX290_MODEL_IMX290LQR] = {
>                 .colour_variant = IMX290_VARIANT_COLOUR,
> +               .model = IMX290_MODEL_IMX290LQR,
> +               .name = "imx290lqr",
>         },
>         [IMX290_MODEL_IMX290LLR] = {
>                 .colour_variant = IMX290_VARIANT_MONO,
> +               .model = IMX290_MODEL_IMX290LLR,
> +               .name = "imx290llr",
> +       },
> +       [IMX290_MODEL_IMX327LQR] = {
> +               .colour_variant = IMX290_VARIANT_COLOUR,
> +               .model = IMX290_MODEL_IMX327LQR,
> +               .name = "imx327lqr",
>         },
>  };
>
> @@ -1496,6 +1542,9 @@ static const struct of_device_id imx290_of_match[] = {
>         }, {
>                 .compatible = "sony,imx290llr",
>                 .data = &imx290_models[IMX290_MODEL_IMX290LLR],
> +       }, {
> +               .compatible = "sony,imx327lqr",
> +               .data = &imx290_models[IMX290_MODEL_IMX327LQR],
>         },
>         { /* sentinel */ },
>  };
> @@ -1630,6 +1679,9 @@ static int imx290_probe(struct i2c_client *client)
>         if (ret)
>                 goto err_pm;
>
> +       v4l2_i2c_subdev_set_name(&imx290->sd, client,
> +                                imx290->model->name, NULL);
> +
>         /*
>          * Finally, register the V4L2 subdev. This must be done after
>          * initializing everything as the subdev can be used immediately after
> --
> 2.34.1
>

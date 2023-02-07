Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD5368D6F9
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 13:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbjBGMk5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Feb 2023 07:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjBGMk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Feb 2023 07:40:56 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1AC305CC
        for <linux-media@vger.kernel.org>; Tue,  7 Feb 2023 04:40:33 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id a24so16125071vsl.2
        for <linux-media@vger.kernel.org>; Tue, 07 Feb 2023 04:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o1FwFGoxoLfRQNsvQHgEE6LsYOD+tnW2mRTgchdm1R0=;
        b=Xruk2Cgqvy2x8b1m6VeHo4Dj+HuDGK4Pe6MPYLCYqbhMZT7SoIH1CKjyVGOVUgIgfk
         /mzSgOk9SxhXyK1nZewiN8fKUt3icQaUyLATbbfzOxUjuFU6t2LJfoELlXKBlUt95pi6
         4CsARGVnqTMpMStHGThNhDDfMtzSno9AsnvtEXFm/w7FxXHxI/rIMAj2+7NU1eiKTdr6
         uON1T3AuIzP6C0oGOLS2ONDt9W1lnVkbjNKXPCAbsvf1T8hUqieT97NB6TXiE5B6p8x/
         ne2rV4acCM9ZJsyxhPfUYMB7HVGAmI4jgTt/D9ka4l/M5s9wzgtWIv2sKqG1t8s7d5jq
         3djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1FwFGoxoLfRQNsvQHgEE6LsYOD+tnW2mRTgchdm1R0=;
        b=w//BI5JeUxiKdd1fJepTOHtss7PhRMxD/Cnc7qxtlI347LK4urlDkRmEQkQs6bVc5l
         3zJ+jtA8NbZbWmWu7cMagRyPAJKMXw6Wr/j4cEd+goP0sSI42YbT4FZCgOv6DZT71Oih
         /cXdi5ME0P+fu7JYzQgfJyT+yXNgsDxj7CZIfrF6NlHngxNv3L0BofW+FTMCGkg8RUCN
         DSqPH7B2J0Dv8lVuwiaW/nd3Qg2vvDueQo39Uk512D0Kn/MXYEMOZnVAfSm80Phe2et0
         xTxJqkxuZl9rvtQKFzWygW9wFC5hCO3j9gTgXx5ucgtDybviBJCLvAxiWSW2ITAP1hev
         BHzA==
X-Gm-Message-State: AO0yUKXZlaBbAyU3LtCOQeARtH7+Sf9sjqmpCWDqcQEjD7h/epjIjVoU
        TK3b73bbIUAa/hBXsfWSbrymlY8QYpJ9R2sF/6NpXA==
X-Google-Smtp-Source: AK7set9ii9U4r8/qykpzNVa7u1sUzQ/QcOQ6TN6+RsMwr92pJiqi6NG80GNDpB1z4GyRcLz2vqQ6oc435wRTYxZu74E=
X-Received: by 2002:a67:f10a:0:b0:3f2:edef:718f with SMTP id
 n10-20020a67f10a000000b003f2edef718fmr668142vsk.28.1675773632971; Tue, 07 Feb
 2023 04:40:32 -0800 (PST)
MIME-Version: 1.0
References: <20230206131731.548795-1-alexander.stein@ew.tq-group.com>
 <20230206131731.548795-3-alexander.stein@ew.tq-group.com> <CAPY8ntBzi8kccb6qVkHxs02Ae1fC0emLdo5CQd4uQ9PkJySGeQ@mail.gmail.com>
 <Y+GqOF2lFPH+PliK@pendragon.ideasonboard.com>
In-Reply-To: <Y+GqOF2lFPH+PliK@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 7 Feb 2023 12:40:16 +0000
Message-ID: <CAPY8ntB_25yge6MB87N642-bMG-hd9qCVkom4A-c-pBzk3a4mQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: imx290: Add support for imx327 variant
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
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

Hi Laurent

On Tue, 7 Feb 2023 at 01:32, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Mon, Feb 06, 2023 at 02:40:56PM +0000, Dave Stevenson wrote:
> > On Mon, 6 Feb 2023 at 13:17, Alexander Stein wrote:
> > >
> > > Both sensors are quite similar. Their specs only differ regarding LVDS
> > > and parallel output but are identical regarding MIPI-CSI-2 interface.
> > > But they use a different init setting of hard-coded values, taken from
> > > the datasheet.
> > >
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > Note: The call to v4l2_i2c_subdev_set_name will change the device name
> > > shown to userspace. So now 'imx290lqr' will be shown instead of 'imx290'.
> >
> > This is going to cause grief as we already have a Pi libcamera
> > pipeline handler and tuning that relies on the entity name being
> > "imx290", so changing that is going to cause issues.
> >
> > From userspace, the difference between lqr and llr is already reported
> > via the different colour formats supported (RGGB10 & RGGB12 vs Y10 &
> > Y12), so there is no need to provide the full part number. If there is
> > a need to distinguish imx327 vs imx290 in userspace, then I'd propose
> > just using the base model identifier.
>
> Agreed.
>
> > >  drivers/media/i2c/imx290.c | 58 ++++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 55 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 1cfdd700bca5..0bfbce8853e6 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -173,10 +173,13 @@ enum imx290_colour_variant {
> > >  enum imx290_model {
> > >         IMX290_MODEL_IMX290LQR,
> > >         IMX290_MODEL_IMX290LLR,
> > > +       IMX290_MODEL_IMX327LQR,
> > >  };
> > >
> > >  struct imx290_model_info {
> > >         enum imx290_colour_variant colour_variant;
> > > +       enum imx290_model model;
> > > +       const char *name;
> > >  };
> > >
> > >  enum imx290_clk_freq {
> > > @@ -272,10 +275,14 @@ static const struct imx290_regval imx290_global_init_settings[] = {
> > >         { IMX290_WINWV, 1097 },
> > >         { IMX290_XSOUTSEL, IMX290_XSOUTSEL_XVSOUTSEL_VSYNC |
> > >                            IMX290_XSOUTSEL_XHSOUTSEL_HSYNC },
> > > -       { IMX290_REG_8BIT(0x300f), 0x00 },
> > > -       { IMX290_REG_8BIT(0x3010), 0x21 },
> > > +       { IMX290_REG_8BIT(0x3011), 0x02 },
>
> This change should be mentioned in the commit message.

imx290 datasheet says 3011h should be "Fixed to 00h", which is also the default.
imx327 datasheet says "Set to 02h", which differs from the default.
(Updated in v3 from 0Ah to 02h)

So this should be in imx290_global_init_settings_327, not global_init_settings.

> > >         { IMX290_REG_8BIT(0x3012), 0x64 },
> > >         { IMX290_REG_8BIT(0x3013), 0x00 },
> > > +};
> > > +
> > > +static const struct imx290_regval imx290_global_init_settings_290[] = {
> > > +       { IMX290_REG_8BIT(0x300f), 0x00 },
> > > +       { IMX290_REG_8BIT(0x3010), 0x21 },
> > >         { IMX290_REG_8BIT(0x3016), 0x09 },
> > >         { IMX290_REG_8BIT(0x3070), 0x02 },
> > >         { IMX290_REG_8BIT(0x3071), 0x11 },
> > > @@ -328,6 +335,12 @@ static const struct imx290_regval xclk_regs[][IMX290_NUM_CLK_REGS] = {
> > >         },
> > >  };
> > >
> > > +static const struct imx290_regval imx290_global_init_settings_327[] = {
> > > +       { IMX290_REG_8BIT(0x309e), 0x4A },
> > > +       { IMX290_REG_8BIT(0x309f), 0x4A },
> > > +       { IMX290_REG_8BIT(0x313b), 0x61 },
>
> Lowercase hex constants pleasea.
>
> > > +};
> > > +
> > >  static const struct imx290_regval imx290_1080p_settings[] = {
> > >         /* mode settings */
> > >         { IMX290_WINWV_OB, 12 },
> > > @@ -999,9 +1012,11 @@ static int imx290_start_streaming(struct imx290 *imx290,
> > >                                   struct v4l2_subdev_state *state)
> > >  {
> > >         const struct v4l2_mbus_framefmt *format;
> > > +       const struct imx290_regval *regs;
> > > +       unsigned int reg_num;
> > >         int ret;
> > >
> > > -       /* Set init register settings */
> > > +       /* Set common init register settings */
> > >         ret = imx290_set_register_array(imx290, imx290_global_init_settings,
> > >                                         ARRAY_SIZE(imx290_global_init_settings));
> > >         if (ret < 0) {
> > > @@ -1009,6 +1024,28 @@ static int imx290_start_streaming(struct imx290 *imx290,
> > >                 return ret;
> > >         }
> > >
> > > +       switch (imx290->model->model) {
> > > +       case IMX290_MODEL_IMX290LQR:
> > > +       case IMX290_MODEL_IMX290LLR:
> > > +               regs = imx290_global_init_settings_290;
> > > +               reg_num = ARRAY_SIZE(imx290_global_init_settings_290);
> > > +               break;
> > > +       case IMX290_MODEL_IMX327LQR:
> > > +               regs = imx290_global_init_settings_327;
> > > +               reg_num = ARRAY_SIZE(imx290_global_init_settings_327);
> > > +               break;
> > > +       default:
> > > +               dev_err(imx290->dev, "Invalid model: %u\n", imx290->model->model);
>
> This should never happen, so you can drop the message.
>
> > > +               return -EINVAL;
> > > +       }
> >
> > switch/case here, or add a pointer to struct imx290_model_info?
>
> Do you mean a pointer to the model-specific init regs array? I like the
> idea. The size would need to be added too (unless we switch to
> terminating those arrays with a sentinel).

Yes, I meant along the lines of:

struct imx290_model_info {
  enum imx290_colour_variant colour_variant;
  enum imx290_model model;
  const char *name;
  const struct imx290_regval *init_regs;
  unsigned int num_init_regs;
};

static const struct imx290_model_info imx290_models[] = {
  [IMX290_MODEL_IMX290LQR] = {
     .colour_variant = IMX290_VARIANT_COLOUR,
     .model = IMX290_MODEL_IMX290LQR,
     .name = "imx290lqr",
     .init_regs = imx290_global_init_settings_290,
     .num_init_regs = ARRAY_SIZE(imx290_global_init_settings_290),
   },
...

if (imx290->model->init_regs) {
  ret = imx290_set_register_array(imx290, imx290->model->init_regs,
                  imx290->model->num_init_regs);
  if (ret < 0) {
    dev_err(imx290->dev, "Could not set init registers\n");
    return ret;
  }
}

(sorry for the mess with indentation)
As both need model specific init regs we might be able to skip the "if
(imx290->model->init_regs)" check - I tend to think better safe than
sorry.

Noticed in passing, we have a comment [1] around creating the control
for V4L2_CID_ANALOGUE_GAIN that the IMX327 and IMX462 have a max
analogue gain of 29.4dB (value 98) vs IMX290 30dB (value 100), and
ignoring that until support for the other sensors is added. Seeing as
you're adding that support, it would be nice to fix that up as part of
this series.

  Dave

[1] https://git.linuxtv.org/sailus/media_tree.git/tree/drivers/media/i2c/imx290.c#n673

> > Keeping all the configuration for the different models in struct
> > imx290_model_info has an appeal to me.
> >
> > > +
> > > +       /* Set init register settings */
>
>         /* Set device-specific init register settings */
>
> > > +       ret = imx290_set_register_array(imx290, regs, reg_num);
> > > +       if (ret < 0) {
> > > +               dev_err(imx290->dev, "Could not set init registers\n");

I've just noticed this is exactly the same error message as for the
common registers. It'd be nice to keep them unique.

> > > +               return ret;
> > > +       }
> > > +
> > >         /* Set clock parameters based on mode and xclk */
> > >         ret = imx290_set_clock(imx290);
> > >         if (ret < 0) {
> > > @@ -1479,9 +1516,18 @@ static s64 imx290_check_link_freqs(const struct imx290 *imx290,
> > >  static const struct imx290_model_info imx290_models[] = {
> > >         [IMX290_MODEL_IMX290LQR] = {
> > >                 .colour_variant = IMX290_VARIANT_COLOUR,
> > > +               .model = IMX290_MODEL_IMX290LQR,
> > > +               .name = "imx290lqr",
> > >         },
> > >         [IMX290_MODEL_IMX290LLR] = {
> > >                 .colour_variant = IMX290_VARIANT_MONO,
> > > +               .model = IMX290_MODEL_IMX290LLR,
> > > +               .name = "imx290llr",
> > > +       },
> > > +       [IMX290_MODEL_IMX327LQR] = {
> > > +               .colour_variant = IMX290_VARIANT_COLOUR,
> > > +               .model = IMX290_MODEL_IMX327LQR,
> > > +               .name = "imx327lqr",
> > >         },
> > >  };
> > >
> > > @@ -1496,6 +1542,9 @@ static const struct of_device_id imx290_of_match[] = {
> > >         }, {
> > >                 .compatible = "sony,imx290llr",
> > >                 .data = &imx290_models[IMX290_MODEL_IMX290LLR],
> > > +       }, {
> > > +               .compatible = "sony,imx327lqr",
> > > +               .data = &imx290_models[IMX290_MODEL_IMX327LQR],
> > >         },
> > >         { /* sentinel */ },
> > >  };
> > > @@ -1630,6 +1679,9 @@ static int imx290_probe(struct i2c_client *client)
> > >         if (ret)
> > >                 goto err_pm;
> > >
> > > +       v4l2_i2c_subdev_set_name(&imx290->sd, client,
> > > +                                imx290->model->name, NULL);
> > > +
> > >         /*
> > >          * Finally, register the V4L2 subdev. This must be done after
> > >          * initializing everything as the subdev can be used immediately after
>
> --
> Regards,
>
> Laurent Pinchart

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28B0868CBF4
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 02:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjBGBcq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 20:32:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjBGBcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 20:32:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A781D2F7AC;
        Mon,  6 Feb 2023 17:32:43 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F227E4AF;
        Tue,  7 Feb 2023 02:32:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675733562;
        bh=Czb85eWNt6+QOWy4N+0JsEXtCH661GK4gXrU4i69uGk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ty33c4sWbC0BnkLe5mDB47pXArOxI/VyJHNHcLuo3nN9PrZHs2FNsm1PCDbNobuzW
         FVEWKFQMCQ5i+NVTYJzoEQLNUXIbn0qeCLmR0+Io+Q8Y909bGZ02edRPnKkIp/Zu82
         g+Z7ub+3TyCseuWpGy03GRC24e+PwVjiok46b7fg=
Date:   Tue, 7 Feb 2023 03:32:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Subject: Re: [PATCH v2 2/2] media: i2c: imx290: Add support for imx327 variant
Message-ID: <Y+GqOF2lFPH+PliK@pendragon.ideasonboard.com>
References: <20230206131731.548795-1-alexander.stein@ew.tq-group.com>
 <20230206131731.548795-3-alexander.stein@ew.tq-group.com>
 <CAPY8ntBzi8kccb6qVkHxs02Ae1fC0emLdo5CQd4uQ9PkJySGeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntBzi8kccb6qVkHxs02Ae1fC0emLdo5CQd4uQ9PkJySGeQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Mon, Feb 06, 2023 at 02:40:56PM +0000, Dave Stevenson wrote:
> On Mon, 6 Feb 2023 at 13:17, Alexander Stein wrote:
> >
> > Both sensors are quite similar. Their specs only differ regarding LVDS
> > and parallel output but are identical regarding MIPI-CSI-2 interface.
> > But they use a different init setting of hard-coded values, taken from
> > the datasheet.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Note: The call to v4l2_i2c_subdev_set_name will change the device name
> > shown to userspace. So now 'imx290lqr' will be shown instead of 'imx290'.
> 
> This is going to cause grief as we already have a Pi libcamera
> pipeline handler and tuning that relies on the entity name being
> "imx290", so changing that is going to cause issues.
> 
> From userspace, the difference between lqr and llr is already reported
> via the different colour formats supported (RGGB10 & RGGB12 vs Y10 &
> Y12), so there is no need to provide the full part number. If there is
> a need to distinguish imx327 vs imx290 in userspace, then I'd propose
> just using the base model identifier.

Agreed.

> >  drivers/media/i2c/imx290.c | 58 ++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 55 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 1cfdd700bca5..0bfbce8853e6 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -173,10 +173,13 @@ enum imx290_colour_variant {
> >  enum imx290_model {
> >         IMX290_MODEL_IMX290LQR,
> >         IMX290_MODEL_IMX290LLR,
> > +       IMX290_MODEL_IMX327LQR,
> >  };
> >
> >  struct imx290_model_info {
> >         enum imx290_colour_variant colour_variant;
> > +       enum imx290_model model;
> > +       const char *name;
> >  };
> >
> >  enum imx290_clk_freq {
> > @@ -272,10 +275,14 @@ static const struct imx290_regval imx290_global_init_settings[] = {
> >         { IMX290_WINWV, 1097 },
> >         { IMX290_XSOUTSEL, IMX290_XSOUTSEL_XVSOUTSEL_VSYNC |
> >                            IMX290_XSOUTSEL_XHSOUTSEL_HSYNC },
> > -       { IMX290_REG_8BIT(0x300f), 0x00 },
> > -       { IMX290_REG_8BIT(0x3010), 0x21 },
> > +       { IMX290_REG_8BIT(0x3011), 0x02 },

This change should be mentioned in the commit message.

> >         { IMX290_REG_8BIT(0x3012), 0x64 },
> >         { IMX290_REG_8BIT(0x3013), 0x00 },
> > +};
> > +
> > +static const struct imx290_regval imx290_global_init_settings_290[] = {
> > +       { IMX290_REG_8BIT(0x300f), 0x00 },
> > +       { IMX290_REG_8BIT(0x3010), 0x21 },
> >         { IMX290_REG_8BIT(0x3016), 0x09 },
> >         { IMX290_REG_8BIT(0x3070), 0x02 },
> >         { IMX290_REG_8BIT(0x3071), 0x11 },
> > @@ -328,6 +335,12 @@ static const struct imx290_regval xclk_regs[][IMX290_NUM_CLK_REGS] = {
> >         },
> >  };
> >
> > +static const struct imx290_regval imx290_global_init_settings_327[] = {
> > +       { IMX290_REG_8BIT(0x309e), 0x4A },
> > +       { IMX290_REG_8BIT(0x309f), 0x4A },
> > +       { IMX290_REG_8BIT(0x313b), 0x61 },

Lowercase hex constants pleasea.

> > +};
> > +
> >  static const struct imx290_regval imx290_1080p_settings[] = {
> >         /* mode settings */
> >         { IMX290_WINWV_OB, 12 },
> > @@ -999,9 +1012,11 @@ static int imx290_start_streaming(struct imx290 *imx290,
> >                                   struct v4l2_subdev_state *state)
> >  {
> >         const struct v4l2_mbus_framefmt *format;
> > +       const struct imx290_regval *regs;
> > +       unsigned int reg_num;
> >         int ret;
> >
> > -       /* Set init register settings */
> > +       /* Set common init register settings */
> >         ret = imx290_set_register_array(imx290, imx290_global_init_settings,
> >                                         ARRAY_SIZE(imx290_global_init_settings));
> >         if (ret < 0) {
> > @@ -1009,6 +1024,28 @@ static int imx290_start_streaming(struct imx290 *imx290,
> >                 return ret;
> >         }
> >
> > +       switch (imx290->model->model) {
> > +       case IMX290_MODEL_IMX290LQR:
> > +       case IMX290_MODEL_IMX290LLR:
> > +               regs = imx290_global_init_settings_290;
> > +               reg_num = ARRAY_SIZE(imx290_global_init_settings_290);
> > +               break;
> > +       case IMX290_MODEL_IMX327LQR:
> > +               regs = imx290_global_init_settings_327;
> > +               reg_num = ARRAY_SIZE(imx290_global_init_settings_327);
> > +               break;
> > +       default:
> > +               dev_err(imx290->dev, "Invalid model: %u\n", imx290->model->model);

This should never happen, so you can drop the message.

> > +               return -EINVAL;
> > +       }
> 
> switch/case here, or add a pointer to struct imx290_model_info?

Do you mean a pointer to the model-specific init regs array? I like the
idea. The size would need to be added too (unless we switch to
terminating those arrays with a sentinel).

> Keeping all the configuration for the different models in struct
> imx290_model_info has an appeal to me.
> 
> > +
> > +       /* Set init register settings */

	/* Set device-specific init register settings */

> > +       ret = imx290_set_register_array(imx290, regs, reg_num);
> > +       if (ret < 0) {
> > +               dev_err(imx290->dev, "Could not set init registers\n");
> > +               return ret;
> > +       }
> > +
> >         /* Set clock parameters based on mode and xclk */
> >         ret = imx290_set_clock(imx290);
> >         if (ret < 0) {
> > @@ -1479,9 +1516,18 @@ static s64 imx290_check_link_freqs(const struct imx290 *imx290,
> >  static const struct imx290_model_info imx290_models[] = {
> >         [IMX290_MODEL_IMX290LQR] = {
> >                 .colour_variant = IMX290_VARIANT_COLOUR,
> > +               .model = IMX290_MODEL_IMX290LQR,
> > +               .name = "imx290lqr",
> >         },
> >         [IMX290_MODEL_IMX290LLR] = {
> >                 .colour_variant = IMX290_VARIANT_MONO,
> > +               .model = IMX290_MODEL_IMX290LLR,
> > +               .name = "imx290llr",
> > +       },
> > +       [IMX290_MODEL_IMX327LQR] = {
> > +               .colour_variant = IMX290_VARIANT_COLOUR,
> > +               .model = IMX290_MODEL_IMX327LQR,
> > +               .name = "imx327lqr",
> >         },
> >  };
> >
> > @@ -1496,6 +1542,9 @@ static const struct of_device_id imx290_of_match[] = {
> >         }, {
> >                 .compatible = "sony,imx290llr",
> >                 .data = &imx290_models[IMX290_MODEL_IMX290LLR],
> > +       }, {
> > +               .compatible = "sony,imx327lqr",
> > +               .data = &imx290_models[IMX290_MODEL_IMX327LQR],
> >         },
> >         { /* sentinel */ },
> >  };
> > @@ -1630,6 +1679,9 @@ static int imx290_probe(struct i2c_client *client)
> >         if (ret)
> >                 goto err_pm;
> >
> > +       v4l2_i2c_subdev_set_name(&imx290->sd, client,
> > +                                imx290->model->name, NULL);
> > +
> >         /*
> >          * Finally, register the V4L2 subdev. This must be done after
> >          * initializing everything as the subdev can be used immediately after

-- 
Regards,

Laurent Pinchart

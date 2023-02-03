Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30A9B6893C5
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 10:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbjBCJam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 04:30:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231894AbjBCJab (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 04:30:31 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2F71B4
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 01:30:29 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id m1so2879535vst.7
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 01:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e5p8IeihY42hWpiKY+VQ4BrIRcaeTIfvKPYO/n9gOCc=;
        b=D3h9EDXwhzZ3IuQB+GJ5B4Oh7eSl4pAiwP81mVJbgWijeen6w1jayQaIfDVSf4tHad
         b6yRM5ejaCzki7B54J6k2JY7db60fxxcWO7jGAtUh9+9waChJ0rL35griaR3rjS6Vab8
         HEHOrVKCgwhEaPml+uRXQx9Wqz82lA3Fb/i1dE/wudPzNSmz0vSlXKJT2ji21ujTeONP
         f/gXrEDeZL8jvCiFjirIV+M+Ydm4YY+T7Z1M0lgmRHXFYufqeMFS5Q5iXClPUG29AVYK
         oJ8o7Kd2ykkaradhuzebpeYjx2vjpGo/iLgsxNmqWNtzwM/3riYLuzhhgpO/JPgJA/US
         lWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5p8IeihY42hWpiKY+VQ4BrIRcaeTIfvKPYO/n9gOCc=;
        b=lwDmZ/z5jO0RNZ9UWbRWBSRn+GN9VZHpumxLzHksGfI4KgKkh0bREZHT2Vl9hlEQ2m
         GIPRfSqvBeydga+OoGYUqHJkANPozF2PWBzYZ1v5BSS2+YMd2Q12VPezsn4KZSse54yO
         Rkdw/XdwbvD4Beg3CznxQoiXLIAa6iPeTF1hb6IOTgcxRegwOiX/XCXxYOo92/P/uaOc
         wLXgFTcxHJBqQgjiBY08liE3VqgTsMFs0Z+FChHmhjGv/N30d+cKxv3FdH+AxCei7KaR
         5S6Dv+FTXfg4z2s90uPU14q2OQOk4l+wwx9OwlK+hKpKuc4bG+iHlfFZryBtgWdfmpMo
         9YSw==
X-Gm-Message-State: AO0yUKWdvVbJZBba1MyLNuWDfQxs06xyQHTLHLMGQFZ4YR0Rzf0b+b40
        Zcsaz5zb0I+v6CPxxxxE7ArNpmiaurzzAQLKWZet2A==
X-Google-Smtp-Source: AK7set9ejHj3DXTTHWsNgjPBYISbCT9BTqFBrrpmS8Ia1uIL/y9Ig5pgdu3mn2CMArovGs3m+dAM4WckkUcM85rJNY4=
X-Received: by 2002:a67:e091:0:b0:3d4:aa7:e2d5 with SMTP id
 f17-20020a67e091000000b003d40aa7e2d5mr1986593vsl.32.1675416628470; Fri, 03
 Feb 2023 01:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-11-dave.stevenson@raspberrypi.com>
 <1890472.taCxCBeP46@steina-w> <Y9zM+HCAUs0XT9Aq@pendragon.ideasonboard.com>
In-Reply-To: <Y9zM+HCAUs0XT9Aq@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 3 Feb 2023 09:30:11 +0000
Message-ID: <CAPY8ntBHOh_8pao9223=YUw-8voJAkBsMByw6Xfc1RPhQ9qC7A@mail.gmail.com>
Subject: Re: [PATCH 10/11] media: i2c: imx290: Add support for 74.25MHz
 external clock
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
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

On Fri, 3 Feb 2023 at 08:59, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Feb 03, 2023 at 08:44:08AM +0100, Alexander Stein wrote:
> > Hi Dave,
> >
> > thanks for the patch.
> >
> > Am Dienstag, 31. Januar 2023, 20:20:15 CET schrieb Dave Stevenson:
> > > The sensor supports either a 37.125 or 74.25MHz external, but
> > > the driver only supported 37.125MHz.
> > >
> > > Add the relevant register configuration for either clock
> > > frequency option.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/media/i2c/imx290.c | 120 +++++++++++++++++++++++++++++++------
> > >  1 file changed, 103 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 5202ef3cc3e6..7f6746f74040 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -102,6 +102,7 @@
> > >  #define IMX290_TCLKPREPARE                         IMX290_REG_16BIT(0x3452)
> > >  #define IMX290_TLPX                                IMX290_REG_16BIT(0x3454)
> > >  #define IMX290_X_OUT_SIZE                          IMX290_REG_16BIT(0x3472)
> > > +#define IMX290_INCKSEL7                            IMX290_REG_8BIT(0x3480)
> >
> > Please add also defines for the clock setting, e.g.
> > #define IMX290_INCKSEL7_INCK_37_125   0x49
> > #define IMX290_INCKSEL7_INCK_74_25    0x92
> >
> > >  #define IMX290_PGCTRL_REGEN                                BIT(0)
> > >  #define IMX290_PGCTRL_THRU                         BIT(1)
> > > @@ -159,11 +160,27 @@
> > >
> > >  #define IMX290_NUM_SUPPLIES                                3
> > >
> > > +#define CLK_37_125 0
> > > +#define CLK_74_25  1
> > > +#define NUM_CLK            2
> > > +
> >
> > How about using an enum?
> >
> > enum imx290_clk_freq {
> >       CLK_37_125 = 0,
> >       CLK_74_25 = 1,
> >       NUM_CLK
> > };
> >
> > >  struct imx290_regval {
> > >     u32 reg;
> > >     u32 val;
> > >  };
> > >
> > > +/*
> > > + * Clock configuration for registers INCKSEL1 to INCKSEL6.
> > > + */
> > > +struct imx290_clk_cfg {
> > > +   u8 incksel1;
> > > +   u8 incksel2;
> > > +   u8 incksel3;
> > > +   u8 incksel4;
> > > +   u8 incksel5;
> > > +   u8 incksel6;
> > > +};
> > > +
> > >  struct imx290_mode {
> > >     u32 width;
> > >     u32 height;
> > > @@ -173,6 +190,8 @@ struct imx290_mode {
> > >
> > >     const struct imx290_regval *data;
> > >     u32 data_size;
> > > +
> > > +   const struct imx290_clk_cfg *clk_cfg;
> > >  };
> > >
> > >  struct imx290_csi_cfg {
> > > @@ -191,6 +210,7 @@ struct imx290 {
> > >     struct device *dev;
> > >     struct clk *xclk;
> > >     struct regmap *regmap;
> > > +   u32 xclk_freq;
> > >     u8 nlanes;
> > >     u8 mono;
> > >
> > > @@ -219,7 +239,6 @@ static inline struct imx290 *to_imx290(struct
> > > v4l2_subdev *_sd) */
> > >
> > >  static const struct imx290_regval imx290_global_init_settings[] = {
> > > -   { IMX290_EXTCK_FREQ, 0x2520 },
> > >     { IMX290_WINWV_OB, 12 },
> > >     { IMX290_WINPH, 0 },
> > >     { IMX290_WINPV, 0 },
> > > @@ -269,7 +288,16 @@ static const struct imx290_regval
> > > imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x33b0), 0x50 },
> > >     { IMX290_REG_8BIT(0x33b2), 0x1a },
> > >     { IMX290_REG_8BIT(0x33b3), 0x04 },
> > > -   { IMX290_REG_8BIT(0x3480), 0x49 },
> > > +};
> > > +
> > > +static const struct imx290_regval imx290_37_125mhz_clock[] = {
> > > +   { IMX290_EXTCK_FREQ, 0x2520 },
> >
> > Please also add defines for these magic numbers.
>
> While I really like macros that name register and bits, as they improve
> readability, for values that are listed in the documentation without any
> explanation I think it doesn't make the code more readable.

Technically they're not totally magic - it's just the frequency in MHz
as 8q8 fixed point.
(0x2520 = 9504 decimal) * 1/256 = 37.125.
(0x4a40 = 19008 decimal) * 1/256 = 74.25

As there are only 2 acceptable clock rates computing it feels like
overkill, but whatever.
I'll put it in as ((37125 * 256) / 1000). Still some magic, but makes
it a little more obvious what it is and should give the right number
(I need to check for overflows. Rounding seems OK).

  Dave

> > > +   { IMX290_INCKSEL7, 0x49 },
> > > +};
> > > +
> > > +static const struct imx290_regval imx290_74_25mhz_clock[] = {
> > > +   { IMX290_EXTCK_FREQ, 0x4a40 },
> > > +   { IMX290_INCKSEL7, 0x92 },
> > >  };
> > >
> > >  static const struct imx290_regval imx290_1080p_settings[] = {
> > > @@ -279,12 +307,6 @@ static const struct imx290_regval
> > > imx290_1080p_settings[] = { { IMX290_OPB_SIZE_V, 10 },
> > >     { IMX290_X_OUT_SIZE, 1920 },
> > >     { IMX290_Y_OUT_SIZE, 1080 },
> > > -   { IMX290_INCKSEL1, 0x18 },
> > > -   { IMX290_INCKSEL2, 0x03 },
> > > -   { IMX290_INCKSEL3, 0x20 },
> > > -   { IMX290_INCKSEL4, 0x01 },
> > > -   { IMX290_INCKSEL5, 0x1a },
> > > -   { IMX290_INCKSEL6, 0x1a },
> > >  };
> > >
> > >  static const struct imx290_regval imx290_720p_settings[] = {
> > > @@ -294,12 +316,6 @@ static const struct imx290_regval
> > > imx290_720p_settings[] = { { IMX290_OPB_SIZE_V, 4 },
> > >     { IMX290_X_OUT_SIZE, 1280 },
> > >     { IMX290_Y_OUT_SIZE, 720 },
> > > -   { IMX290_INCKSEL1, 0x20 },
> > > -   { IMX290_INCKSEL2, 0x00 },
> > > -   { IMX290_INCKSEL3, 0x20 },
> > > -   { IMX290_INCKSEL4, 0x01 },
> > > -   { IMX290_INCKSEL5, 0x1a },
> > > -   { IMX290_INCKSEL6, 0x1a },
> > >  };
> > >
> > >  static const struct imx290_regval imx290_10bit_settings[] = {
> > > @@ -405,6 +421,48 @@ static inline int imx290_link_freqs_num(const struct
> > > imx290 *imx290) return ARRAY_SIZE(imx290_link_freq_4lanes);
> > >  }
> > >
> > > +static const struct imx290_clk_cfg imx290_1080p_clock_config[NUM_CLK] = {
> > > +   [CLK_37_125] = {
> > > +           /* 37.125MHz clock config */
> > > +           .incksel1 = 0x18,
> > > +           .incksel2 = 0x03,
> > > +           .incksel3 = 0x20,
> > > +           .incksel4 = 0x01,
> > > +           .incksel5 = 0x1a,
> > > +           .incksel6 = 0x1a,
> > > +   },
> > > +   [CLK_74_25] = {
> > > +           /* 74.25MHz clock config */
> > > +           .incksel1 = 0x0c,
> > > +           .incksel2 = 0x03,
> > > +           .incksel3 = 0x10,
> > > +           .incksel4 = 0x01,
> > > +           .incksel5 = 0x1b,
> > > +           .incksel6 = 0x1b,
> > > +   },
> > > +};
> > > +
> > > +static const struct imx290_clk_cfg imx290_720p_clock_config[NUM_CLK] = {
> > > +   [CLK_37_125] = {
> > > +           /* 37.125MHz clock config */
> > > +           .incksel1 = 0x20,
> > > +           .incksel2 = 0x00,
> > > +           .incksel3 = 0x20,
> > > +           .incksel4 = 0x01,
> > > +           .incksel5 = 0x1a,
> > > +           .incksel6 = 0x1a,
> > > +   },
> > > +   [CLK_74_25] = {
> > > +           /* 74.25MHz clock config */
> > > +           .incksel1 = 0x10,
> > > +           .incksel2 = 0x00,
> > > +           .incksel3 = 0x10,
> > > +           .incksel4 = 0x01,
> > > +           .incksel5 = 0x1b,
> > > +           .incksel6 = 0x1b,
> > > +   },
> > > +};
> > > +
> > >  /* Mode configs */
> > >  static const struct imx290_mode imx290_modes_2lanes[] = {
> > >     {
> > > @@ -415,6 +473,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> > > { .link_freq_index = FREQ_INDEX_1080P,
> > >             .data = imx290_1080p_settings,
> > >             .data_size = ARRAY_SIZE(imx290_1080p_settings),
> > > +           .clk_cfg = imx290_1080p_clock_config,
> > >     },
> > >     {
> > >             .width = 1280,
> > > @@ -424,6 +483,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> > > { .link_freq_index = FREQ_INDEX_720P,
> > >             .data = imx290_720p_settings,
> > >             .data_size = ARRAY_SIZE(imx290_720p_settings),
> > > +           .clk_cfg = imx290_720p_clock_config,
> > >     },
> > >  };
> > >
> > > @@ -436,6 +496,7 @@ static const struct imx290_mode imx290_modes_4lanes[] =
> > > { .link_freq_index = FREQ_INDEX_1080P,
> > >             .data = imx290_1080p_settings,
> > >             .data_size = ARRAY_SIZE(imx290_1080p_settings),
> > > +           .clk_cfg = imx290_1080p_clock_config,
> > >     },
> > >     {
> > >             .width = 1280,
> > > @@ -445,6 +506,7 @@ static const struct imx290_mode imx290_modes_4lanes[] =
> > > { .link_freq_index = FREQ_INDEX_720P,
> > >             .data = imx290_720p_settings,
> > >             .data_size = ARRAY_SIZE(imx290_720p_settings),
> > > +           .clk_cfg = imx290_720p_clock_config,
> > >     },
> > >  };
> > >
> > > @@ -563,6 +625,23 @@ static int imx290_set_register_array(struct imx290
> > > *imx290, return 0;
> > >  }
> > >
> > > +static int imx290_set_clock(struct imx290 *imx290)
> > > +{
> > > +   int clk_idx = (imx290->xclk_freq == 37125000) ? 0 : 1;
> > > +   const struct imx290_mode *mode = imx290->current_mode;
> > > +   const struct imx290_clk_cfg *clk_cfg = &mode->clk_cfg[clk_idx];
> > > +   int ret = 0;
> > > +
> > > +   imx290_write(imx290, IMX290_INCKSEL1, clk_cfg->incksel1, &ret);
> > > +   imx290_write(imx290, IMX290_INCKSEL2, clk_cfg->incksel2, &ret);
> > > +   imx290_write(imx290, IMX290_INCKSEL3, clk_cfg->incksel3, &ret);
> > > +   imx290_write(imx290, IMX290_INCKSEL4, clk_cfg->incksel4, &ret);
> > > +   imx290_write(imx290, IMX290_INCKSEL5, clk_cfg->incksel5, &ret);
> > > +   imx290_write(imx290, IMX290_INCKSEL6, clk_cfg->incksel6, &ret);
> > > +
> > > +   return ret;
> > > +}
> > > +
> > >  static int imx290_set_data_lanes(struct imx290 *imx290)
> > >  {
> > >     int ret = 0;
> > > @@ -863,6 +942,13 @@ static int imx290_start_streaming(struct imx290
> > > *imx290, return ret;
> > >     }
> > >
> > > +   /* Set clock parameters based on mode and xclk */
> > > +   ret = imx290_set_clock(imx290);
> > > +   if (ret < 0) {
> > > +           dev_err(imx290->dev, "Could not set clocks\n");
> > > +           return ret;
> > > +   }
> > > +
> > >     /* Set data lane count */
> > >     ret = imx290_set_data_lanes(imx290);
> > >     if (ret < 0) {
> > > @@ -1259,14 +1345,14 @@ static int imx290_init_clk(struct imx290 *imx290)
> > >     int ret;
> > >
> > >     ret = fwnode_property_read_u32(dev_fwnode(imx290->dev),
> > > -                                  "clock-frequency", &xclk_freq);
> > > +                                  "clock-frequency", &imx290->xclk_freq);
> > >     if (ret) {
> > >             dev_err(imx290->dev, "Could not get xclk frequency\n");
> > >             return ret;
> > >     }
> > >
> > > -   /* external clock must be 37.125 MHz */
> > > -   if (xclk_freq != 37125000) {
> > > +   /* external clock must be 37.125 MHz or 74.25MHz */
> > > +   if (imx290->xclk_freq != 37125000 && imx290->xclk_freq != 74250000)
> > {
> > >             dev_err(imx290->dev, "External clock frequency %u is not supported\n",
> > >                     xclk_freq);
> > >             return -EINVAL;
>
> --
> Regards,
>
> Laurent Pinchart

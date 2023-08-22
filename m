Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 179A9784700
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 18:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237700AbjHVQUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 12:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237755AbjHVQUp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 12:20:45 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98197CF2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:20:26 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-79ddb700ad4so1457060241.3
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692721225; x=1693326025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eWManty1pE3ezlnEYMKaNwTc0qxTgrVLOJ1OaJXuuvw=;
        b=YzPGT/YfQr6JWTpSqHbzjGZDosoR5PD+e5az6Myxos1kXCjVpCCPtxu+XpC7bRUAvF
         jmiiaaYyM8OMWPUgX5iHKly4AtG+G2VI/uqBefAw4fHWp4GzheV9drPkLT39DZI1Oho8
         kl2BCgX/p5tAwVM8J9+5BJRgRKhs1uH/FNkAdwN2zF4Ztv9PoVZyn7dBjFQImtS4N3SC
         6pmX5vaqNoJBIurikvFKm4ulSurezxlo/mPbsWjoUGQJxLWNxwwjtTsI9YBC4R45Ko7i
         X7BH3MwNxMpix2RvjUMwCpBndx8+IdEskPg2t1MhtYrHDAxuRw5AmdRaZd8bXSIswWrA
         XCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692721225; x=1693326025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWManty1pE3ezlnEYMKaNwTc0qxTgrVLOJ1OaJXuuvw=;
        b=gB/daYdb36kDEHCxTmnqMT8awzjnXoH94enp86yh8x88FESIDy6r/ueWrbtlRgb8dp
         hvqW0CnkheKZ2xpAbZcW9X6zPU9urq6kYVE6ev031tfU8HOzlTLTcJ1v7fbl8ZF7F0jA
         QQdxA557Dp8FjtSdS9P7SS+wtexl9PZIV4Q3gbZ7H0vPs7BT8Gr3MSJQ5OhzoguESw7b
         nGDY+DlVn7XSgoyhz6uSbHlGKE6PwRPhALhVDcwifOOSwFBTIyROH4i5SyHCpDs2arGI
         bBWg0bbtGT786+5Wln6UJ4FDd9pymXJKbD5mCFg0PBm3HR1JFACq5TkzUgNQ6cKN79fB
         6bWg==
X-Gm-Message-State: AOJu0YyH+SajIZ5kNYPFhc+sjknl7vbrQYWwYYIE2VE0nBG5Z5g21Sjw
        gF+IjsaRa9DL/JJuqJy4Ky0/ZEud72mh1F9Oa9VkkkltuxbyWtNe+SQ=
X-Google-Smtp-Source: AGHT+IF+i/hIYhlUx8S34j6YPeu3kAIjwGQi2qZkCtz1dOmvq7Q5XppG+CJs4hbivUAQTbcs/4U31UtZ7hmG0770PXI=
X-Received: by 2002:a67:fb0a:0:b0:443:4e7d:c8db with SMTP id
 d10-20020a67fb0a000000b004434e7dc8dbmr8361356vsr.2.1692721225701; Tue, 22 Aug
 2023 09:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-6-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-6-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Aug 2023 17:20:09 +0100
Message-ID: <CAPY8ntDifQn2zQLYZRMUrGAupm3L8qgAmT3sbcGOyAudjOO-AQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] media: i2c: imx219: Set mode registers programmatically
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Replace the per-mode register arrays with code that sets the same
> register values using the mode definitions. This avoids duplicating
> information in two different places.
>
> The error check for invalid formats in imx219_set_framefmt() is dropped
> as the format is guaranteed to be valid.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 134 ++++++++++---------------------------
>  1 file changed, 36 insertions(+), 98 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 08011192daa6..9490dcba42ab 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -149,11 +149,6 @@
>  #define IMX219_PIXEL_ARRAY_WIDTH       3280U
>  #define IMX219_PIXEL_ARRAY_HEIGHT      2464U
>
> -struct imx219_reg_list {
> -       unsigned int num_of_regs;
> -       const struct cci_reg_sequence *regs;
> -};
> -
>  /* Mode : resolution and related config&values */
>  struct imx219_mode {
>         /* Frame width */
> @@ -167,9 +162,6 @@ struct imx219_mode {
>         /* V-timing */
>         unsigned int vts_def;
>
> -       /* Default register values */
> -       struct imx219_reg_list reg_list;
> -
>         /* 2x2 binning is used */
>         bool binning;
>  };
> @@ -219,65 +211,6 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
>         { IMX219_REG_EXCK_FREQ, IMX219_EXCK_FREQ(24) },
>  };
>
> -/*
> - * Register sets lifted off the i2C interface from the Raspberry Pi firmware
> - * driver.
> - * 3280x2464 = mode 2, 1920x1080 = mode 1, 1640x1232 = mode 4, 640x480 = mode 7.
> - */
> -static const struct cci_reg_sequence mode_3280x2464_regs[] = {
> -       { IMX219_REG_X_ADD_STA_A, 0 },
> -       { IMX219_REG_X_ADD_END_A, 3279 },
> -       { IMX219_REG_Y_ADD_STA_A, 0 },
> -       { IMX219_REG_Y_ADD_END_A, 2463 },
> -       { IMX219_REG_X_OUTPUT_SIZE, 3280 },
> -       { IMX219_REG_Y_OUTPUT_SIZE, 2464 },
> -       { IMX219_REG_TP_WINDOW_WIDTH, 3280 },
> -       { IMX219_REG_TP_WINDOW_HEIGHT, 2464 },
> -};
> -
> -static const struct cci_reg_sequence mode_1920_1080_regs[] = {
> -       { IMX219_REG_X_ADD_STA_A, 680 },
> -       { IMX219_REG_X_ADD_END_A, 2599 },
> -       { IMX219_REG_Y_ADD_STA_A, 692 },
> -       { IMX219_REG_Y_ADD_END_A, 1771 },
> -       { IMX219_REG_X_OUTPUT_SIZE, 1920 },
> -       { IMX219_REG_Y_OUTPUT_SIZE, 1080 },
> -       { IMX219_REG_TP_WINDOW_WIDTH, 1920 },
> -       { IMX219_REG_TP_WINDOW_HEIGHT, 1080 },
> -};
> -
> -static const struct cci_reg_sequence mode_1640_1232_regs[] = {
> -       { IMX219_REG_X_ADD_STA_A, 0 },
> -       { IMX219_REG_X_ADD_END_A, 3279 },
> -       { IMX219_REG_Y_ADD_STA_A, 0 },
> -       { IMX219_REG_Y_ADD_END_A, 2463 },
> -       { IMX219_REG_X_OUTPUT_SIZE, 1640 },
> -       { IMX219_REG_Y_OUTPUT_SIZE, 1232 },
> -       { IMX219_REG_TP_WINDOW_WIDTH, 1640 },
> -       { IMX219_REG_TP_WINDOW_HEIGHT, 1232 },
> -};
> -
> -static const struct cci_reg_sequence mode_640_480_regs[] = {
> -       { IMX219_REG_X_ADD_STA_A, 1000 },
> -       { IMX219_REG_X_ADD_END_A, 2279 },
> -       { IMX219_REG_Y_ADD_STA_A, 752 },
> -       { IMX219_REG_Y_ADD_END_A, 1711 },
> -       { IMX219_REG_X_OUTPUT_SIZE, 640 },
> -       { IMX219_REG_Y_OUTPUT_SIZE, 480 },
> -       { IMX219_REG_TP_WINDOW_WIDTH, 640 },
> -       { IMX219_REG_TP_WINDOW_HEIGHT, 480 },
> -};
> -
> -static const struct cci_reg_sequence raw8_framefmt_regs[] = {
> -       { IMX219_REG_CSI_DATA_FORMAT_A, 0x0808 },
> -       { IMX219_REG_OPPXCK_DIV, 8 },
> -};
> -
> -static const struct cci_reg_sequence raw10_framefmt_regs[] = {
> -       { IMX219_REG_CSI_DATA_FORMAT_A, 0x0a0a },
> -       { IMX219_REG_OPPXCK_DIV, 10 },
> -};
> -
>  static const s64 imx219_link_freq_menu[] = {
>         IMX219_DEFAULT_LINK_FREQ,
>  };
> @@ -373,10 +306,6 @@ static const struct imx219_mode supported_modes[] = {
>                         .height = 2464
>                 },
>                 .vts_def = IMX219_VTS_15FPS,
> -               .reg_list = {
> -                       .num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> -                       .regs = mode_3280x2464_regs,
> -               },
>                 .binning = false,
>         },
>         {
> @@ -390,10 +319,6 @@ static const struct imx219_mode supported_modes[] = {
>                         .height = 1080
>                 },
>                 .vts_def = IMX219_VTS_30FPS_1080P,
> -               .reg_list = {
> -                       .num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
> -                       .regs = mode_1920_1080_regs,
> -               },
>                 .binning = false,
>         },
>         {
> @@ -407,10 +332,6 @@ static const struct imx219_mode supported_modes[] = {
>                         .height = 2464
>                 },
>                 .vts_def = IMX219_VTS_30FPS_BINNED,
> -               .reg_list = {
> -                       .num_of_regs = ARRAY_SIZE(mode_1640_1232_regs),
> -                       .regs = mode_1640_1232_regs,
> -               },
>                 .binning = true,
>         },
>         {
> @@ -424,10 +345,6 @@ static const struct imx219_mode supported_modes[] = {
>                         .height = 960
>                 },
>                 .vts_def = IMX219_VTS_30FPS_640x480,
> -               .reg_list = {
> -                       .num_of_regs = ARRAY_SIZE(mode_640_480_regs),
> -                       .regs = mode_640_480_regs,
> -               },
>                 .binning = true,
>         },
>  };
> @@ -699,23 +616,53 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  static int imx219_set_framefmt(struct imx219 *imx219,
>                                const struct v4l2_mbus_framefmt *format)
>  {
> +       const struct imx219_mode *mode = imx219->mode;
> +       unsigned int bpp;
> +       int ret = 0;
> +
>         switch (format->code) {
>         case MEDIA_BUS_FMT_SRGGB8_1X8:
>         case MEDIA_BUS_FMT_SGRBG8_1X8:
>         case MEDIA_BUS_FMT_SGBRG8_1X8:
>         case MEDIA_BUS_FMT_SBGGR8_1X8:
> -               return cci_multi_reg_write(imx219->regmap, raw8_framefmt_regs,
> -                                          ARRAY_SIZE(raw8_framefmt_regs), NULL);
> +               bpp = 8;
> +               break;
>
>         case MEDIA_BUS_FMT_SRGGB10_1X10:
>         case MEDIA_BUS_FMT_SGRBG10_1X10:
>         case MEDIA_BUS_FMT_SGBRG10_1X10:
>         case MEDIA_BUS_FMT_SBGGR10_1X10:
> -               return cci_multi_reg_write(imx219->regmap, raw10_framefmt_regs,
> -                                          ARRAY_SIZE(raw10_framefmt_regs), NULL);
> +       default:
> +               bpp = 10;
> +               break;
>         }
>
> -       return -EINVAL;
> +       cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
> +                 mode->crop.left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> +       cci_write(imx219->regmap, IMX219_REG_X_ADD_END_A,
> +                 mode->crop.left - IMX219_PIXEL_ARRAY_LEFT + mode->crop.width - 1,
> +                 &ret);
> +       cci_write(imx219->regmap, IMX219_REG_Y_ADD_STA_A,
> +                 mode->crop.top - IMX219_PIXEL_ARRAY_TOP, &ret);
> +       cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
> +                 mode->crop.top - IMX219_PIXEL_ARRAY_TOP + mode->crop.height - 1,
> +                 &ret);
> +
> +       cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
> +                 format->width, &ret);
> +       cci_write(imx219->regmap, IMX219_REG_Y_OUTPUT_SIZE,
> +                 format->height, &ret);
> +
> +       cci_write(imx219->regmap, IMX219_REG_TP_WINDOW_WIDTH,
> +                 format->width, &ret);
> +       cci_write(imx219->regmap, IMX219_REG_TP_WINDOW_HEIGHT,
> +                 format->height, &ret);
> +
> +       cci_write(imx219->regmap, IMX219_REG_CSI_DATA_FORMAT_A,
> +                 (bpp << 8) | bpp, &ret);
> +       cci_write(imx219->regmap, IMX219_REG_OPPXCK_DIV, bpp, &ret);
> +
> +       return ret;
>  }
>
>  static int imx219_set_binning(struct imx219 *imx219,
> @@ -787,7 +734,6 @@ static int imx219_start_streaming(struct imx219 *imx219,
>  {
>         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>         const struct v4l2_mbus_framefmt *format;
> -       const struct imx219_reg_list *reg_list;
>         int ret;
>
>         ret = pm_runtime_resume_and_get(&client->dev);
> @@ -809,15 +755,7 @@ static int imx219_start_streaming(struct imx219 *imx219,
>                 goto err_rpm_put;
>         }
>
> -       /* Apply default values of current mode */
> -       reg_list = &imx219->mode->reg_list;
> -       ret = cci_multi_reg_write(imx219->regmap, reg_list->regs,
> -                                 reg_list->num_of_regs, NULL);
> -       if (ret) {
> -               dev_err(&client->dev, "%s failed to set mode\n", __func__);
> -               goto err_rpm_put;
> -       }
> -
> +       /* Apply format and crop settings. */
>         format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
>         ret = imx219_set_framefmt(imx219, format);
>         if (ret) {
> --
> Regards,
>
> Laurent Pinchart
>

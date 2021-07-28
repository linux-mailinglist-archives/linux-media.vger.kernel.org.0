Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2E43D8CA3
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 13:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234744AbhG1LWa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 07:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234639AbhG1LW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 07:22:26 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FC9C061760
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 04:22:24 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so3799640pjd.0
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 04:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1D2l4hNhHsS2iormCyA3EgfKp4hZF3DC2mQohMFaQrw=;
        b=mRWCtO3QfbgUfq1l3wAePMNB/g+xsC+QJ6CrIDSnWa5k4kHNMhcrRg0jZ0PTZUAv73
         vtBwXxUYgNwibNP1kEQWPuzl4W5+KatrRxBBUIkKcUlnB6EPJfdtRdHLiafEUQe8cDiy
         YnUoVclJMbGMFiNag+YigMOJuz4Zl8PB/PHbq4MDg54brZYAdWKAM7Xz4uSrhlPnCwR5
         WkCsMXPB00MzBAGSYZ+1m7bVEgJMfxsi7h8kPwyaPNVlBbbHQJ63eguYlqv8yyLEqXcc
         yWsAp95MfBrUsq5yTf4L605iUolelboXl8aj2s5LuOHAEkra+9svFwKa6kbfR34gxiIX
         cZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1D2l4hNhHsS2iormCyA3EgfKp4hZF3DC2mQohMFaQrw=;
        b=H+TE079JcMGmr3qYiOilsy9NBibBda0bDHF1ydYea7F+dio/13/7SFxhHc15CvURKs
         +ghNgSXLVrdRtunBwowTg4PWmScMGMSxixq5tjoVIx93bVxjOC7cfgx41nGP8MmbbbpP
         Bu7R1OwBrMNy6CSAkSvif/Sbji0lxmMHXk2MpMmGVcFUe+76spbLXngc5BcKVNyKkyGi
         COLs532UrqYgAbf/SA6L3Rps3wKhnEV1BWELbhvEQy60mAfw2Ara4VahKBYU5TiPtqOP
         +DtI5LdkSOFvCb0gsB3DqvWFfTPX33JWfaObl1YWTNILfID9488Ka49yyKN4DWc+3ViL
         Cf6Q==
X-Gm-Message-State: AOAM5336mfVbohpkautbQISh+G06jR4LY3AjIepIRSpScOHoE/nEl0mv
        qM3/JlngMlO5iwfFNi2ZEBc638Cd+spvKihf/tlOsg==
X-Google-Smtp-Source: ABdhPJxRTQH8bd2Jy7w5i3uoVa+5yBl6+Cvkkf47mQcZ7rm/SCosKY77pYTlkrX7FoD/GLCQR0gUe7K0QuCrb6lhMRA=
X-Received: by 2002:a17:90a:604b:: with SMTP id h11mr23151924pjm.220.1627471343428;
 Wed, 28 Jul 2021 04:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210705081724.168523-1-hsinyi@chromium.org>
In-Reply-To: <20210705081724.168523-1-hsinyi@chromium.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 28 Jul 2021 13:22:12 +0200
Message-ID: <CAG3jFyuT09KOG9Xn-wbrr2DSOB=jSRvBVj96Vx4ja0PQWPKh6g@mail.gmail.com>
Subject: Re: [PATCH] media: ov8856: Set default mbus format but allow caller
 to alter
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Hsin-Yi,

Thanks for looking into this.

On Mon, 5 Jul 2021 at 10:17, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Setting the value of V_WIN_OFF (0x3818) from 0x02 to 0x01 to use GRBG
> format still results in wrong color output if data is tuned in BGGR mode
> before.
>
> Set default mbus format for the supported modes, but allow the caller of
> set(get)_fmt to change the bayer format between BGGR and GRBG.
>
> Set the default mbus format for 3264x2448 (and 1632x1224) to BGGR as the
> data sheet states the value of this reg should be 0x02 by default.
>
> If new modes are added in the future, they can add the
> mipi_data_mbus_{format} settings into bayer_offset_configs to adjust their
> offset regs.
>
> Fixes: 2984b0ddd557 ("media: ov8856: Configure sensor for GRBG Bayer for all modes")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/media/i2c/ov8856.c | 83 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 72 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index 88e19f30d3762..5aac76cca6801 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -107,6 +107,11 @@ static const char * const ov8856_supply_names[] = {
>         "dvdd",         /* Digital core power */
>  };
>
> +enum {
> +       OV8856_MEDIA_BUS_FMT_SBGGR10_1X10,
> +       OV8856_MEDIA_BUS_FMT_SGRBG10_1X10,
> +};
> +
>  struct ov8856_reg {
>         u16 address;
>         u8 val;
> @@ -145,6 +150,9 @@ struct ov8856_mode {
>
>         /* Number of data lanes */
>         u8 data_lanes;
> +
> +       /* Default MEDIA_BUS_FMT for this mode */
> +       u32 default_mbus_index;
>  };
>
>  struct ov8856_mipi_data_rates {
> @@ -1055,7 +1063,7 @@ static const struct ov8856_reg lane_4_mode_3264x2448[] = {
>                 {0x3810, 0x00},
>                 {0x3811, 0x04},
>                 {0x3812, 0x00},
> -               {0x3813, 0x01},
> +               {0x3813, 0x02},
>                 {0x3814, 0x01},
>                 {0x3815, 0x01},
>                 {0x3816, 0x00},
> @@ -1259,7 +1267,7 @@ static const struct ov8856_reg lane_4_mode_1632x1224[] = {
>                 {0x3810, 0x00},
>                 {0x3811, 0x02},
>                 {0x3812, 0x00},
> -               {0x3813, 0x01},
> +               {0x3813, 0x02},
>                 {0x3814, 0x03},
>                 {0x3815, 0x01},
>                 {0x3816, 0x00},
> @@ -1372,6 +1380,19 @@ static const struct ov8856_reg lane_4_mode_1632x1224[] = {
>                 {0x5e10, 0xfc}
>  };
>
> +static const struct ov8856_reg mipi_data_mbus_sbggr10_1x10[] = {
> +       {0x3813, 0x02},
> +};
> +
> +static const struct ov8856_reg mipi_data_mbus_sgrbg10_1x10[] = {
> +       {0x3813, 0x01},
> +};
> +
> +static const u32 ov8856_mbus_codes[] = {
> +       MEDIA_BUS_FMT_SBGGR10_1X10,
> +       MEDIA_BUS_FMT_SGRBG10_1X10
> +};
> +
>  static const char * const ov8856_test_pattern_menu[] = {
>         "Disabled",
>         "Standard Color Bar",
> @@ -1380,6 +1401,17 @@ static const char * const ov8856_test_pattern_menu[] = {
>         "Bottom-Top Darker Color Bar"
>  };
>
> +static const struct ov8856_reg_list bayer_offset_configs[] = {
> +       [OV8856_MEDIA_BUS_FMT_SBGGR10_1X10] = {
> +               .num_of_regs = ARRAY_SIZE(mipi_data_mbus_sbggr10_1x10),
> +               .regs = mipi_data_mbus_sbggr10_1x10,
> +       },
> +       [OV8856_MEDIA_BUS_FMT_SGRBG10_1X10] = {
> +               .num_of_regs = ARRAY_SIZE(mipi_data_mbus_sgrbg10_1x10),
> +               .regs = mipi_data_mbus_sgrbg10_1x10,
> +       }
> +};
> +
>  struct ov8856 {
>         struct v4l2_subdev sd;
>         struct media_pad pad;
> @@ -1399,6 +1431,9 @@ struct ov8856 {
>         /* Current mode */
>         const struct ov8856_mode *cur_mode;
>
> +       /* Application specified mbus format */
> +       u32 cur_mbus_index;
> +
>         /* To serialize asynchronus callbacks */
>         struct mutex mutex;
>
> @@ -1450,6 +1485,7 @@ static const struct ov8856_lane_cfg lane_cfg_2 = {
>                 },
>                 .link_freq_index = 0,
>                 .data_lanes = 2,
> +               .default_mbus_index = OV8856_MEDIA_BUS_FMT_SGRBG10_1X10,
>         },
>         {
>                 .width = 1640,
> @@ -1464,6 +1500,7 @@ static const struct ov8856_lane_cfg lane_cfg_2 = {
>                 },
>                 .link_freq_index = 1,
>                 .data_lanes = 2,
> +               .default_mbus_index = OV8856_MEDIA_BUS_FMT_SGRBG10_1X10,
>         }}
>  };
>
> @@ -1499,6 +1536,7 @@ static const struct ov8856_lane_cfg lane_cfg_4 = {
>                         },
>                         .link_freq_index = 0,
>                         .data_lanes = 4,
> +                       .default_mbus_index = OV8856_MEDIA_BUS_FMT_SGRBG10_1X10,
>                 },
>                 {
>                         .width = 1640,
> @@ -1513,6 +1551,7 @@ static const struct ov8856_lane_cfg lane_cfg_4 = {
>                         },
>                         .link_freq_index = 1,
>                         .data_lanes = 4,
> +                       .default_mbus_index = OV8856_MEDIA_BUS_FMT_SGRBG10_1X10,
>                 },
>                 {
>                         .width = 3264,
> @@ -1527,6 +1566,7 @@ static const struct ov8856_lane_cfg lane_cfg_4 = {
>                         },
>                         .link_freq_index = 0,
>                         .data_lanes = 4,
> +                       .default_mbus_index = OV8856_MEDIA_BUS_FMT_SBGGR10_1X10,
>                 },
>                 {
>                         .width = 1632,
> @@ -1541,6 +1581,7 @@ static const struct ov8856_lane_cfg lane_cfg_4 = {
>                         },
>                         .link_freq_index = 1,
>                         .data_lanes = 4,
> +                       .default_mbus_index = OV8856_MEDIA_BUS_FMT_SBGGR10_1X10,
>                 }}
>  };
>
> @@ -1904,12 +1945,21 @@ static int ov8856_init_controls(struct ov8856 *ov8856)
>         return 0;
>  }
>
> -static void ov8856_update_pad_format(const struct ov8856_mode *mode,
> +static void ov8856_update_pad_format(struct ov8856 *ov8856,
> +                                    const struct ov8856_mode *mode,
>                                      struct v4l2_mbus_framefmt *fmt)
>  {
> +       int index;
> +
>         fmt->width = mode->width;
>         fmt->height = mode->height;
> -       fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +       for (index = 0; index < ARRAY_SIZE(ov8856_mbus_codes); ++index)
> +               if (ov8856_mbus_codes[index] == fmt->code)
> +                       break;
> +       if (index == ARRAY_SIZE(ov8856_mbus_codes))
> +               index = mode->default_mbus_index;
> +       fmt->code = ov8856_mbus_codes[index];
> +       ov8856->cur_mbus_index = index;
>         fmt->field = V4L2_FIELD_NONE;
>  }
>
> @@ -1935,6 +1985,13 @@ static int ov8856_start_streaming(struct ov8856 *ov8856)
>                 return ret;
>         }
>
> +       reg_list = &bayer_offset_configs[ov8856->cur_mbus_index];
> +       ret = ov8856_write_reg_list(ov8856, reg_list);
> +       if (ret) {
> +               dev_err(&client->dev, "failed to set mbus format");
> +               return ret;
> +       }
> +
>         ret = __v4l2_ctrl_handler_setup(ov8856->sd.ctrl_handler);
>         if (ret)
>                 return ret;
> @@ -2096,7 +2153,7 @@ static int ov8856_set_format(struct v4l2_subdev *sd,
>                                       fmt->format.height);
>
>         mutex_lock(&ov8856->mutex);
> -       ov8856_update_pad_format(mode, &fmt->format);
> +       ov8856_update_pad_format(ov8856, mode, &fmt->format);
>         if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>                 *v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
>         } else {
> @@ -2140,7 +2197,7 @@ static int ov8856_get_format(struct v4l2_subdev *sd,
>                                                           sd_state,
>                                                           fmt->pad);
>         else
> -               ov8856_update_pad_format(ov8856->cur_mode, &fmt->format);
> +               ov8856_update_pad_format(ov8856, ov8856->cur_mode, &fmt->format);
>
>         mutex_unlock(&ov8856->mutex);
>
> @@ -2151,11 +2208,10 @@ static int ov8856_enum_mbus_code(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_mbus_code_enum *code)
>  {
> -       /* Only one bayer order GRBG is supported */
> -       if (code->index > 0)
> +       if (code->index >= ARRAY_SIZE(ov8856_mbus_codes))
>                 return -EINVAL;
>
> -       code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +       code->code = ov8856_mbus_codes[code->index];
>
>         return 0;
>  }
> @@ -2165,11 +2221,15 @@ static int ov8856_enum_frame_size(struct v4l2_subdev *sd,
>                                   struct v4l2_subdev_frame_size_enum *fse)
>  {
>         struct ov8856 *ov8856 = to_ov8856(sd);
> +       int index;
>
>         if (fse->index >= ov8856->modes_size)
>                 return -EINVAL;
>
> -       if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
> +       for (index = 0; index < ARRAY_SIZE(ov8856_mbus_codes); ++index)
> +               if (fse->code == ov8856_mbus_codes[index])
> +                       break;
> +       if (index == ARRAY_SIZE(ov8856_mbus_codes))
>                 return -EINVAL;
>
>         fse->min_width = ov8856->priv_lane->supported_modes[fse->index].width;
> @@ -2185,7 +2245,7 @@ static int ov8856_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>         struct ov8856 *ov8856 = to_ov8856(sd);
>
>         mutex_lock(&ov8856->mutex);
> -       ov8856_update_pad_format(&ov8856->priv_lane->supported_modes[0],
> +       ov8856_update_pad_format(ov8856, &ov8856->priv_lane->supported_modes[0],
>                                  v4l2_subdev_get_try_format(sd, fh->state, 0));
>         mutex_unlock(&ov8856->mutex);
>
> @@ -2425,6 +2485,7 @@ static int ov8856_probe(struct i2c_client *client)
>
>         mutex_init(&ov8856->mutex);
>         ov8856->cur_mode = &ov8856->priv_lane->supported_modes[0];
> +       ov8856->cur_mbus_index = ov8856->cur_mode->default_mbus_index;
>         ret = ov8856_init_controls(ov8856);
>         if (ret) {
>                 dev_err(&client->dev, "failed to init controls: %d", ret);
> --
> 2.32.0.93.g670b81a890-goog
>

Looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

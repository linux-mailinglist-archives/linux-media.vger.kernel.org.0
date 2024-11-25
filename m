Return-Path: <linux-media+bounces-22037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2A9D8C59
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 19:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBC5DB265A9
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 18:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE2E1B87F9;
	Mon, 25 Nov 2024 18:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XTDj87Zb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805801B652B
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 18:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732560069; cv=none; b=Inr4rrDNkrdc0iusjXDkjazMeFLkGP9WcLDZMGNFSct0mwfPvXpr7hQLW1FLVaIwTO9p2bQqbmgGAUlDWdzUsmtTkwF8TdX3itkYV+Q2x7ApaBW3LEbB4xTmNZJGIHBwuwbiL1WxYjUvxaBra17uT4tWCSe6RhKHl6ZzyK4bW60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732560069; c=relaxed/simple;
	bh=SUDiQKRFDN1BjNqtEC61fk5Z8/kVvLrWLJg29n0FvZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bbwh9+R9v5J3qTfLzPQ8lEoLXPhofDZl2+qNlh5MR1MWXS0cDuS0CwjMmHFBQEXnfYceHJ65URAXJPpirleT3pkQ5UC4HzhfGdjy3Qa4c+y0ffHKMYCyNkGaMrb4UHi5Cu0EMkyrnSAdAT4McShLpwft2MfPjtCnbP1LbT6R1WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=XTDj87Zb; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e38939a89bfso4372026276.3
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 10:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732560066; x=1733164866; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iRe4VVt+TQ2eWCb5MB66+BQG4dKdvmnnhxZiiVFk5rY=;
        b=XTDj87ZbbkBKZMF3tcwrtKQFxQEf1XMN/KoocYTqMSkaeklzYG/9wfuKpPctSvPJJF
         8CjwQ3cz49Y3oFKeiLeBzP6chf3N4VBNjIkuX1ZCKbJSkaYP1h9Og2ZmKbJTk/C2OLpS
         4esRdRRVlujtjTW8Bz5bQv5S1wbg9en25VRphv8SkK6n0kpRimUAtJDbOcLv4qji+osg
         bKPL3y13+TnLnNSh5rvunWkIYG6WV/x5qojDyV4rNgQtzGUOhfdYuqg2fL99Ba6Fdq9u
         i0Jo0ukKbqg9Ya2NU+covZv/0BhILAzZY/nTsqUuMZ6+/ywxTQPhr2rvyl+sc2mGQUEK
         9tDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732560066; x=1733164866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRe4VVt+TQ2eWCb5MB66+BQG4dKdvmnnhxZiiVFk5rY=;
        b=R3AvJb7DTtrQsaflLiHzxCiZZiopRN3pYhvSX2yc2ZpCRiaqaa6xok6zjZtm75WgTC
         nep+jS6vIzk07IYeln27D47Efdc3BObHCCov8TlUrkhX9NnLcFZ3MifCXVG7isaxVNtB
         J1Oh+xzzJcC6O7d/syXlxj9Z6P9B5812L65PrRosS5i4ahe2obFTWSvrsL+/UKDsjSgx
         kn8Q+XmoGjTxuQNX3qTB9XqKu0Rg3X4VrCadzJseYB3R2Gj6Hs1iS5JBai6otGRNVDWu
         GprNaK/cWSW0J87BE+qC4lYywoV0OaZZRrFl4fmqWQaH3N5jPPiOkSaJurHaPf1ILgSn
         vxbg==
X-Forwarded-Encrypted: i=1; AJvYcCX71bL66QSLD+tSt5OQmAKJcv8kzftRDMXfqEqaRmda56SYGK2Z7ffHT0Q2j4JnlKM+1vVREEhBwKpt+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzthld41kEUNtnN6FckYHH0YmGqJEizisk5+s6w+MKufYHLSQU3
	4ei10ucya39IYwbt5YuDAxJPVl3NCIoVTCWl+3ZSWi93TSK6W0DTwL4lZ1ocQsLG5R6NyX5yfwq
	Cv1xFdqOKdsinPIPRLvjhicYv5G19vrIypN1TgA==
X-Gm-Gg: ASbGncsABDn2vF4BzMH2ULzY7PHYLoysSOCVrZBOkTeAlcToAhaWydE+CI5usaF/mqs
	1S8rDtVPKy4yjm0oIxn0wMiz8JeYhd1o=
X-Google-Smtp-Source: AGHT+IGur/o1/sls3dNR1LW+jxOHQ/ZpbYSnYTUyAAmeqYYLV6d4Z0oQt742IIr+7HG0aXAWncHA7hSimXuTRlXQEXQ=
X-Received: by 2002:a05:6902:1885:b0:e38:930a:a4af with SMTP id
 3f1490d57ef6-e38f8bea594mr12423717276.45.1732560066352; Mon, 25 Nov 2024
 10:41:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com> <20241125-imx219_fixes-v3-3-434fc0b541c8@ideasonboard.com>
In-Reply-To: <20241125-imx219_fixes-v3-3-434fc0b541c8@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 25 Nov 2024 18:40:50 +0000
Message-ID: <CAPY8ntDeHCHtM6O5iDvnXJSx9AcKw2C8HA6B4Fn2mObaH7URGg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: i2c: imx219: Scale the pixel rate for
 analog binning
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Vinay Varma <varmavinaym@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jai

On Mon, 25 Nov 2024 at 15:07, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> When the analog binning mode is used for high framerate operation,
> the pixel rate is effectively doubled. Account for this when setting up
> the pixel clock rate, and applying the vblank and exposure controls.
>
> The previous logic only used analog binning for 8-bit modes, but normal
> binning limits the framerate on 10-bit 480p [1]. So with this patch we
> switch to using special binning (with 2x pixel rate) for all formats of
> 480p mode and 8-bit 1232p.
>
> [1]: https://github.com/raspberrypi/linux/issues/5493
>
> Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
> Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 120 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 76 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 970e6362d0ae3a9078daf337155e83d637bc1ca1..39b85cdee58318b080c867afd68ca33d14d3eda7 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -149,6 +149,12 @@
>  #define IMX219_PIXEL_ARRAY_WIDTH       3280U
>  #define IMX219_PIXEL_ARRAY_HEIGHT      2464U
>
> +enum binning_mode {
> +       BINNING_NONE = IMX219_BINNING_NONE,
> +       BINNING_X2 = IMX219_BINNING_X2,
> +       BINNING_ANALOG_X2 = IMX219_BINNING_X2_ANALOG,
> +};
> +
>  /* Mode : resolution and related config&values */
>  struct imx219_mode {
>         /* Frame width */
> @@ -337,6 +343,10 @@ struct imx219 {
>
>         /* Two or Four lanes */
>         u8 lanes;
> +
> +       /* Binning mode */
> +       enum binning_mode bin_h;
> +       enum binning_mode bin_v;
>  };
>
>  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> @@ -362,6 +372,36 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
>         return imx219_mbus_formats[i];
>  }
>
> +static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
> +{
> +       switch (format->code) {
> +       case MEDIA_BUS_FMT_SRGGB8_1X8:
> +       case MEDIA_BUS_FMT_SGRBG8_1X8:
> +       case MEDIA_BUS_FMT_SGBRG8_1X8:
> +       case MEDIA_BUS_FMT_SBGGR8_1X8:
> +               return 8;
> +
> +       case MEDIA_BUS_FMT_SRGGB10_1X10:
> +       case MEDIA_BUS_FMT_SGRBG10_1X10:
> +       case MEDIA_BUS_FMT_SGBRG10_1X10:
> +       case MEDIA_BUS_FMT_SBGGR10_1X10:
> +       default:
> +               return 10;
> +       }
> +}
> +
> +static int imx219_get_rate_factor(struct imx219 *imx219)
> +{
> +       switch (imx219->bin_v) {
> +       case BINNING_NONE:
> +       case BINNING_X2:
> +               return 1;
> +       case BINNING_ANALOG_X2:
> +               return 2;
> +       }
> +       return -EINVAL;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Controls
>   */
> @@ -373,10 +413,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>         const struct v4l2_mbus_framefmt *format;
>         struct v4l2_subdev_state *state;
> +       int rate_factor;
>         int ret = 0;
>
>         state = v4l2_subdev_get_locked_active_state(&imx219->sd);
>         format = v4l2_subdev_state_get_format(state, 0);
> +       rate_factor = imx219_get_rate_factor(imx219);
>
>         if (ctrl->id == V4L2_CID_VBLANK) {
>                 int exposure_max, exposure_def;
> @@ -405,7 +447,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_EXPOSURE:
>                 cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> -                         ctrl->val, &ret);
> +                         ctrl->val / rate_factor, &ret);
>                 break;
>         case V4L2_CID_DIGITAL_GAIN:
>                 cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> @@ -422,7 +464,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_VBLANK:
>                 cci_write(imx219->regmap, IMX219_REG_VTS,
> -                         format->height + ctrl->val, &ret);
> +                         (format->height + ctrl->val) / rate_factor, &ret);
>                 break;
>         case V4L2_CID_HBLANK:
>                 cci_write(imx219->regmap, IMX219_REG_HTS,
> @@ -463,7 +505,8 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
>
>  static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
>  {
> -       return (imx219->lanes == 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RATE_4LANE;
> +       return ((imx219->lanes == 2) ? IMX219_PIXEL_RATE :
> +               IMX219_PIXEL_RATE_4LANE) * imx219_get_rate_factor(imx219);

This feels wrong.
imx219_get_rate_factor will return the factor based on vertical
binning. I would have expected the pixel rate to change based on
horizontal binning.
You'd need a mode which uses different binning modes in each direction
to verify that though.

(Updating exposure and vblank values based on vertical binning makes
sense, as they are both in terms of lines).

  Dave

>  }
>
>  /* Initialize control handlers */
> @@ -592,29 +635,12 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  {
>         const struct v4l2_mbus_framefmt *format;
>         const struct v4l2_rect *crop;
> -       unsigned int bpp;
> -       u64 bin_h, bin_v;
> +       u32 bpp;
>         int ret = 0;
>
>         format = v4l2_subdev_state_get_format(state, 0);
>         crop = v4l2_subdev_state_get_crop(state, 0);
> -
> -       switch (format->code) {
> -       case MEDIA_BUS_FMT_SRGGB8_1X8:
> -       case MEDIA_BUS_FMT_SGRBG8_1X8:
> -       case MEDIA_BUS_FMT_SGBRG8_1X8:
> -       case MEDIA_BUS_FMT_SBGGR8_1X8:
> -               bpp = 8;
> -               break;
> -
> -       case MEDIA_BUS_FMT_SRGGB10_1X10:
> -       case MEDIA_BUS_FMT_SGRBG10_1X10:
> -       case MEDIA_BUS_FMT_SGBRG10_1X10:
> -       case MEDIA_BUS_FMT_SBGGR10_1X10:
> -       default:
> -               bpp = 10;
> -               break;
> -       }
> +       bpp = imx219_get_format_bpp(format);
>
>         cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
>                   crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> @@ -625,28 +651,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>         cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
>                   crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
>
> -       switch (crop->width / format->width) {
> -       case 1:
> -       default:
> -               bin_h = IMX219_BINNING_NONE;
> -               break;
> -       case 2:
> -               bin_h = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> -               break;
> -       }
> -
> -       switch (crop->height / format->height) {
> -       case 1:
> -       default:
> -               bin_v = IMX219_BINNING_NONE;
> -               break;
> -       case 2:
> -               bin_v = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> -               break;
> -       }
> -
> -       cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> -       cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
> +       cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, imx219->bin_h, &ret);
> +       cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, imx219->bin_v, &ret);
>
>         cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
>                   format->width, &ret);
> @@ -851,6 +857,27 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                 int exposure_max;
>                 int exposure_def;
>                 int hblank;
> +               int pixel_rate;
> +               u32 bpp = imx219_get_format_bpp(format);
> +               enum binning_mode binning = BINNING_NONE;
> +
> +               /*
> +                * For 8-bit formats, analog horizontal binning is required,
> +                * else the output image is garbage.
> +                * For 10-bit formats, analog horizontal binning is optional,
> +                * but still useful as it doubles the effective framerate.
> +                * We can only use it with width <= 1624, as for higher values
> +                * there are blocky artefacts.
> +                *
> +                * Vertical binning should match the horizontal binning mode.
> +                */
> +               if (bin_h == 2 && (format->width <= 1624 || bpp == 8))
> +                       binning = BINNING_ANALOG_X2;
> +               else
> +                       binning = BINNING_X2;
> +
> +               imx219->bin_h = (bin_h == 2) ? binning : BINNING_NONE;
> +               imx219->bin_v = (bin_v == 2) ? binning : BINNING_NONE;
>
>                 /* Update limits and set FPS to default */
>                 __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> @@ -879,6 +906,11 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                                          IMX219_PPL_MAX - mode->width,
>                                          1, IMX219_PPL_MIN - mode->width);
>                 __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> +
> +               /* Scale the pixel rate based on the mode specific factor */
> +               pixel_rate = imx219_get_pixel_rate(imx219);
> +               __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> +                                        pixel_rate, 1, pixel_rate);
>         }
>
>         return 0;
>
> --
> 2.47.0
>


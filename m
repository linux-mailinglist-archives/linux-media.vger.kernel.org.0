Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09F1B17BFD7
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 15:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgCFOEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 09:04:31 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39514 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCFOEb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 09:04:31 -0500
Received: by mail-wm1-f68.google.com with SMTP id j1so2491849wmi.4
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2020 06:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ih7cQdubDyGE+0awjUjrmOinBf+F0nnCStzr7cMdISY=;
        b=aqstO8Ysm9Rwz7huL+3cs/qqJ7nhvbbh65snNmWiviMG+CSzWzcQTjUwDKvKaTN6yh
         XaQnGly7k5OHmTZVxO6YIsFA90bosUDj7A6Bm0NKolqmapXU3vyaXlMEDMt9FiaGenhh
         OxiS9sTbL64nNfmlXWM3hkt0i+A1O8sGOM+Of4wTjjV3HIsEX6XuryHrmy6RbjCAIm8a
         7tgzn6X6nrtIg/lnDXVCW5ugBWsdwQdqDEbNELcO3++0iVvfr3NB20iaBidFvpo6LPu5
         xI+xtPmNNsiaux3XMsh9M9q9k3p0c7jTF+UTsz1BtkB7RzPCdngGqC0ACGx5R4c1gGcJ
         J/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ih7cQdubDyGE+0awjUjrmOinBf+F0nnCStzr7cMdISY=;
        b=UrPK2dyL9lkzcaWFDMQqo2K+kadU9mOEefSLNW28DNa1MztbwOk4HJR3K9VoFnTn/7
         WAXBNSCGwgzJf3YvLBzMhS+icRiKPIROELfweHVURXfRYzbynN3K38kdKEbozxEwIo21
         1+6BMApmhYXdJFcSh2K1UXyBOL1hkwK4OLoFGPo9apalX1QTnTY3r1DGGpv/i5CzWj44
         2vSqn79q2prm7zxGjtdzRlKVNkCiTDvpVU4oYAjJJr0MNc5Z8Gsf37OVkdWOLvy2XFF6
         RDf4l2SO47rJ+3ZCCGAE8A18M9ybXLMWXIUZc3Io7TPX0I9uiPh70JZ6WKYqplZKxmy/
         r1Gw==
X-Gm-Message-State: ANhLgQ0nggil/ATPvwEKJk09Q69KCNA2dWobk4XlMFnVGL2mVJMlPRxM
        s1lOiBFeRbmAzgLnefBc480xAEo8cxM5ZQ3vciI27Cwu
X-Google-Smtp-Source: ADFU+vvoc0mOHd+3Bp5USGZOXQEWla6VWV5cp7fYWWqls3I5KI2axZKm4BGnTZ9VBLnh64m2zCewilhZDx7p32QBXQ4=
X-Received: by 2002:a7b:c632:: with SMTP id p18mr4172259wmk.116.1583503466537;
 Fri, 06 Mar 2020 06:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20200306103246.22213-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200306103246.22213-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200306103246.22213-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 6 Mar 2020 14:04:09 +0000
Message-ID: <CAPY8ntD_KcpK7R90uBj_Okbr=BD6eOfRiy9E8feB=i1Rk6zrSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] media: i2c: imx219: Add support for RAW8 bit bayer format
To:     Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar

On Fri, 6 Mar 2020 at 10:33, Lad Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> IMX219 sensor is capable for RAW8/RAW10 modes. This commit adds support
> for RAW8 bayer format.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I assume this is merging in the bits from my hacked together patch,
hence copying the Signed-off-by.

I've run through a set of basic tests streaming in each of the
resolutions, both 8 & 10 bit modes, and with combinations of H&V
flips. They all seem to work as expected, so I'm happy.

The frame rate is preserved between the modes so there is the one
question of link frequency in 8 bit modes presumably being lower than
specified in DT.
On the last review thread you had said you'd check the frequencies -
did you manage that (I know it's not trivial), and did that confirm
that it had/had not changed?
It's not a big deal to me, but others may care more.

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 161 +++++++++++++++++++++++++++++--------
>  1 file changed, 127 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 16010ca1781a..f96f3ce9fd85 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -90,6 +90,11 @@
>
>  #define IMX219_REG_ORIENTATION         0x0172
>
> +#define IMX219_CSI_DATA_FORMAT_A_0_7   0x018c
> +#define IMX219_CSI_DATA_FORMAT_A_8_15  0x018d
> +
> +#define IMX219_OPPXCK_DIV              0x0309
> +
>  /* Test Pattern Control */
>  #define IMX219_REG_TEST_PATTERN                0x0600
>  #define IMX219_TEST_PATTERN_DISABLE    0
> @@ -168,15 +173,12 @@ static const struct imx219_reg mode_3280x2464_regs[] = {
>         {0x0171, 0x01},
>         {0x0174, 0x00},
>         {0x0175, 0x00},
> -       {0x018c, 0x0a},
> -       {0x018d, 0x0a},
>         {0x0301, 0x05},
>         {0x0303, 0x01},
>         {0x0304, 0x03},
>         {0x0305, 0x03},
>         {0x0306, 0x00},
>         {0x0307, 0x39},
> -       {0x0309, 0x0a},
>         {0x030b, 0x01},
>         {0x030c, 0x00},
>         {0x030d, 0x72},
> @@ -230,15 +232,12 @@ static const struct imx219_reg mode_1920_1080_regs[] = {
>         {0x0171, 0x01},
>         {0x0174, 0x00},
>         {0x0175, 0x00},
> -       {0x018c, 0x0a},
> -       {0x018d, 0x0a},
>         {0x0301, 0x05},
>         {0x0303, 0x01},
>         {0x0304, 0x03},
>         {0x0305, 0x03},
>         {0x0306, 0x00},
>         {0x0307, 0x39},
> -       {0x0309, 0x0a},
>         {0x030b, 0x01},
>         {0x030c, 0x00},
>         {0x030d, 0x72},
> @@ -290,15 +289,12 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
>         {0x0171, 0x01},
>         {0x0174, 0x01},
>         {0x0175, 0x01},
> -       {0x018c, 0x0a},
> -       {0x018d, 0x0a},
>         {0x0301, 0x05},
>         {0x0303, 0x01},
>         {0x0304, 0x03},
>         {0x0305, 0x03},
>         {0x0306, 0x00},
>         {0x0307, 0x39},
> -       {0x0309, 0x0a},
>         {0x030b, 0x01},
>         {0x030c, 0x00},
>         {0x030d, 0x72},
> @@ -348,6 +344,27 @@ static const char * const imx219_supply_name[] = {
>
>  #define IMX219_NUM_SUPPLIES ARRAY_SIZE(imx219_supply_name)
>
> +/*
> + * The supported formats.
> + * This table MUST contain 4 entries per format, to cover the various flip
> + * combinations in the order
> + * - no flip
> + * - h flip
> + * - v flip
> + * - h&v flips
> + */
> +static const u32 codes[] = {
> +       MEDIA_BUS_FMT_SRGGB10_1X10,
> +       MEDIA_BUS_FMT_SGRBG10_1X10,
> +       MEDIA_BUS_FMT_SGBRG10_1X10,
> +       MEDIA_BUS_FMT_SBGGR10_1X10,
> +
> +       MEDIA_BUS_FMT_SRGGB8_1X8,
> +       MEDIA_BUS_FMT_SGRBG8_1X8,
> +       MEDIA_BUS_FMT_SGBRG8_1X8,
> +       MEDIA_BUS_FMT_SBGGR8_1X8,
> +};
> +
>  /*
>   * Initialisation delay between XCLR low->high and the moment when the sensor
>   * can start capture (i.e. can leave software stanby) must be not less than:
> @@ -413,6 +430,8 @@ struct imx219 {
>         struct v4l2_subdev sd;
>         struct media_pad pad;
>
> +       struct v4l2_mbus_framefmt fmt;
> +
>         struct clk *xclk; /* system clock to IMX219 */
>         u32 xclk_freq;
>
> @@ -519,34 +538,57 @@ static int imx219_write_regs(struct imx219 *imx219,
>  }
>
>  /* Get bayer order based on flip setting. */
> -static u32 imx219_get_format_code(struct imx219 *imx219)
> +static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
>  {
> -       /*
> -        * Only one bayer order is supported.
> -        * It depends on the flip settings.
> -        */
> -       static const u32 codes[2][2] = {
> -               { MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SGRBG10_1X10, },
> -               { MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SBGGR10_1X10, },
> -       };
> +       int i;
>
>         lockdep_assert_held(&imx219->mutex);
> -       return codes[imx219->vflip->val][imx219->hflip->val];
> +
> +       for (i = 0; i < ARRAY_SIZE(codes); i++)
> +               if (codes[i] == code)
> +                       break;
> +
> +       if (i >= ARRAY_SIZE(codes))
> +               i = 0;
> +
> +       i = (i & ~3) | (imx219->vflip->val ? 2 : 0) |
> +           (imx219->hflip->val ? 1 : 0);
> +
> +       return codes[i];
> +}
> +
> +static void imx219_set_default_format(struct imx219 *imx219)
> +{
> +       struct v4l2_mbus_framefmt *fmt;
> +
> +       mutex_lock(&imx219->mutex);
> +
> +       fmt = &imx219->fmt;
> +       fmt->code = MEDIA_BUS_FMT_SRGGB10_1X10;
> +       fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +       fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> +       fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> +                                                         fmt->colorspace,
> +                                                         fmt->ycbcr_enc);
> +       fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> +       fmt->width = supported_modes[0].width;
> +       fmt->height = supported_modes[0].height;
> +       fmt->field = V4L2_FIELD_NONE;
> +
> +       mutex_unlock(&imx219->mutex);
>  }
>
>  static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  {
>         struct imx219 *imx219 = to_imx219(sd);
> +       struct v4l2_mbus_framefmt *cur_fmt = &imx219->fmt;
>         struct v4l2_mbus_framefmt *try_fmt =
>                 v4l2_subdev_get_try_format(sd, fh->pad, 0);
>
>         mutex_lock(&imx219->mutex);
>
>         /* Initialize try_fmt */
> -       try_fmt->width = supported_modes[0].width;
> -       try_fmt->height = supported_modes[0].height;
> -       try_fmt->code = imx219_get_format_code(imx219);
> -       try_fmt->field = V4L2_FIELD_NONE;
> +       try_fmt = cur_fmt;
>
>         mutex_unlock(&imx219->mutex);
>
> @@ -648,14 +690,12 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>  {
>         struct imx219 *imx219 = to_imx219(sd);
>
> -       /*
> -        * Only one bayer order is supported (though it depends on the flip
> -        * settings)
> -        */
> -       if (code->index > 0)
> +       if (code->pad != 0)
> +               return -EINVAL;
> +       if (code->index >= (ARRAY_SIZE(codes) / 4))
>                 return -EINVAL;
>
> -       code->code = imx219_get_format_code(imx219);
> +       code->code = imx219_get_format_code(imx219, codes[code->index * 4]);
>
>         return 0;
>  }
> @@ -669,7 +709,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>         if (fse->index >= ARRAY_SIZE(supported_modes))
>                 return -EINVAL;
>
> -       if (fse->code != imx219_get_format_code(imx219))
> +       if (fse->code != imx219_get_format_code(imx219, imx219->fmt.code))
>                 return -EINVAL;
>
>         fse->min_width = supported_modes[fse->index].width;
> @@ -696,7 +736,6 @@ static void imx219_update_pad_format(struct imx219 *imx219,
>  {
>         fmt->format.width = mode->width;
>         fmt->format.height = mode->height;
> -       fmt->format.code = imx219_get_format_code(imx219);
>         fmt->format.field = V4L2_FIELD_NONE;
>
>         imx219_reset_colorspace(&fmt->format);
> @@ -710,10 +749,12 @@ static int __imx219_get_pad_format(struct imx219 *imx219,
>                 struct v4l2_mbus_framefmt *try_fmt =
>                         v4l2_subdev_get_try_format(&imx219->sd, cfg, fmt->pad);
>                 /* update the code which could change due to vflip or hflip: */
> -               try_fmt->code = imx219_get_format_code(imx219);
> +               try_fmt->code = imx219_get_format_code(imx219, try_fmt->code);
>                 fmt->format = *try_fmt;
>         } else {
>                 imx219_update_pad_format(imx219, imx219->mode, fmt);
> +               fmt->format.code = imx219_get_format_code(imx219,
> +                                                         imx219->fmt.code);
>         }
>
>         return 0;
> @@ -741,11 +782,18 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         const struct imx219_mode *mode;
>         struct v4l2_mbus_framefmt *framefmt;
>         int exposure_max, exposure_def, hblank;
> +       int i;
>
>         mutex_lock(&imx219->mutex);
>
> +       for (i = 0; i < ARRAY_SIZE(codes); i++)
> +               if (codes[i] == fmt->format.code)
> +                       break;
> +       if (i >= ARRAY_SIZE(codes))
> +               i = 0;
> +
>         /* Bayer order varies with flips */
> -       fmt->format.code = imx219_get_format_code(imx219);
> +       fmt->format.code = imx219_get_format_code(imx219, codes[i]);
>
>         mode = v4l2_find_nearest_size(supported_modes,
>                                       ARRAY_SIZE(supported_modes),
> @@ -755,7 +803,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>                 framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
>                 *framefmt = fmt->format;
> -       } else if (imx219->mode != mode) {
> +       } else if (imx219->mode != mode ||
> +                  imx219->fmt.code != fmt->format.code) {
> +               imx219->fmt = fmt->format;
>                 imx219->mode = mode;
>                 /* Update limits and set FPS to default */
>                 __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> @@ -786,6 +836,40 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         return 0;
>  }
>
> +static int imx219_set_framefmt(struct imx219 *imx219)
> +{
> +       int ret;
> +
> +       switch (imx219->fmt.code) {
> +       case MEDIA_BUS_FMT_SRGGB8_1X8:
> +       case MEDIA_BUS_FMT_SGRBG8_1X8:
> +       case MEDIA_BUS_FMT_SGBRG8_1X8:
> +       case MEDIA_BUS_FMT_SBGGR8_1X8:
> +               ret = imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_0_7,
> +                                      IMX219_REG_VALUE_08BIT, 0x08);
> +               ret |= imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_8_15,
> +                                      IMX219_REG_VALUE_08BIT, 0x08);
> +               ret |= imx219_write_reg(imx219, IMX219_OPPXCK_DIV,
> +                                       IMX219_REG_VALUE_08BIT, 0x08);
> +               break;
> +       case MEDIA_BUS_FMT_SRGGB10_1X10:
> +       case MEDIA_BUS_FMT_SGRBG10_1X10:
> +       case MEDIA_BUS_FMT_SGBRG10_1X10:
> +       case MEDIA_BUS_FMT_SBGGR10_1X10:
> +               ret = imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_0_7,
> +                                      IMX219_REG_VALUE_08BIT, 0x0a);
> +               ret |= imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_8_15,
> +                                      IMX219_REG_VALUE_08BIT, 0x0a);
> +               ret |= imx219_write_reg(imx219, IMX219_OPPXCK_DIV,
> +                                       IMX219_REG_VALUE_08BIT, 0x0a);
> +               break;
> +       default:
> +               ret = -EINVAL;
> +       }
> +
> +       return ret;
> +}
> +
>  static int imx219_start_streaming(struct imx219 *imx219)
>  {
>         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> @@ -800,6 +884,12 @@ static int imx219_start_streaming(struct imx219 *imx219)
>                 return ret;
>         }
>
> +       ret = imx219_set_framefmt(imx219);
> +       if (ret) {
> +               dev_err(&client->dev, "%s failed to set format\n", __func__);
> +               return ret;
> +       }
> +
>         /* Apply customized values from user */
>         ret =  __v4l2_ctrl_handler_setup(imx219->sd.ctrl_handler);
>         if (ret)
> @@ -1253,6 +1343,9 @@ static int imx219_probe(struct i2c_client *client)
>         /* Initialize source pad */
>         imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
>
> +       /* Initialize default format */
> +       imx219_set_default_format(imx219);
> +
>         ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
>         if (ret) {
>                 dev_err(dev, "failed to init entity pads: %d\n", ret);
> --
> 2.20.1
>

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E55D17C11B
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 16:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgCFPBw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 10:01:52 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39486 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgCFPBw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 10:01:52 -0500
Received: by mail-ot1-f65.google.com with SMTP id x97so2679226ota.6;
        Fri, 06 Mar 2020 07:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f8dNd0Qv1qbmZmrP3Klx4PWK931rUaD9slS2tWVzZ2o=;
        b=J4AkF6NErJ+DA9n128ilbBce4qpXiv7DIOaqM4bevfpBUDgIxy4LWByBA2o/3Em2PQ
         pZzNYEKM/VTaagwqNvanCEfP53lL7x7E3PYN/tIiZmlWhXlfAR0iMuB9QZ0MyIYb5azQ
         oJWNMoTOaClqKFmnCR/2vS9Q0W7lU7kkhqeLjwE3sD/YXHLfKnNXKmaf9wynZf+udTQQ
         9bL53BHmb7Z/ZxlxsXMDHtNcDFhTeHYs84tMYdyrR6MnMjd4M5KQtW/Seyr6lDfUtt0H
         r49fZDpJkvx8ETenYH9dCZb0Xx8ss5KeEK38rkQ9U5vfnLeriP8xLwJm+VNYzJuSueb2
         mlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f8dNd0Qv1qbmZmrP3Klx4PWK931rUaD9slS2tWVzZ2o=;
        b=k/eA7BOIXpPq8L2QOkm9sYzQLRAye0C6mBtmYStVCuRBOiHK2+a4dpcbnyKvk/wSMQ
         cTbWGF8yhIeJeLkDX7erw0pb5dpr99GYFO/k0yEe9tu3kAJItA7OUVdUXCXbeegyy5hL
         3iUp9pPy+Z+wsV/Xgf/PysshKOCtBMTJe2gX6IHfrHaNSCTs7YvKHKkqhXyDje8+KJHw
         91Bd83w/BbV9Ku6+IBzEOBopTvXzPn4cDlFsqUhLjwExRqxS4k27bP4Lm3exNMLTZrxC
         2+8rRVYwbidwnL51n7D0aqwg4Ahs+aKs4diI8eGSj8/rcsoX8Hz2LSS36gXQEGACE6AT
         THWg==
X-Gm-Message-State: ANhLgQ0I24z8Q5LoPPOBPZQAdwYDkwq2d3y2HMf+Q//Z7w3JowgWDfUQ
        e+j1JQZd4AFJGbG1Gnyk2W5aI2WcYa9590q35TwaYeWY
X-Google-Smtp-Source: ADFU+vsuhuSt/MHDXwqktYWbspeVyw2UkGSRW3pGGCxhN7bpcrACCA8M5YmVPRUrWzlJZ/i/hr2298HQ2rfjd0GmF3k=
X-Received: by 2002:a05:6830:1481:: with SMTP id s1mr2897270otq.44.1583506910712;
 Fri, 06 Mar 2020 07:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20200306103246.22213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200306103246.22213-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAPY8ntD_KcpK7R90uBj_Okbr=BD6eOfRiy9E8feB=i1Rk6zrSQ@mail.gmail.com>
In-Reply-To: <CAPY8ntD_KcpK7R90uBj_Okbr=BD6eOfRiy9E8feB=i1Rk6zrSQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 6 Mar 2020 15:01:23 +0000
Message-ID: <CA+V-a8tOtOcFgDHF=jjWrSUKsEBs7fX-GJQF-C7TxHwfPqEEVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] media: i2c: imx219: Add support for RAW8 bit bayer format
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thank you for the review.

On Fri, Mar 6, 2020 at 2:04 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Prabhakar
>
> On Fri, 6 Mar 2020 at 10:33, Lad Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >
> > IMX219 sensor is capable for RAW8/RAW10 modes. This commit adds support
> > for RAW8 bayer format.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> I assume this is merging in the bits from my hacked together patch,
> hence copying the Signed-off-by.
>
Yes.

> I've run through a set of basic tests streaming in each of the
> resolutions, both 8 & 10 bit modes, and with combinations of H&V
> flips. They all seem to work as expected, so I'm happy.
>
> The frame rate is preserved between the modes so there is the one
> question of link frequency in 8 bit modes presumably being lower than
> specified in DT.
> On the last review thread you had said you'd check the frequencies -
> did you manage that (I know it's not trivial), and did that confirm
> that it had/had not changed?
> It's not a big deal to me, but others may care more.
>
No I didnt have tools to test the link frequencies :(

> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
Thank you for the ack.

Cheers,
--Prabhakar

> > ---
> >  drivers/media/i2c/imx219.c | 161 +++++++++++++++++++++++++++++--------
> >  1 file changed, 127 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 16010ca1781a..f96f3ce9fd85 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -90,6 +90,11 @@
> >
> >  #define IMX219_REG_ORIENTATION         0x0172
> >
> > +#define IMX219_CSI_DATA_FORMAT_A_0_7   0x018c
> > +#define IMX219_CSI_DATA_FORMAT_A_8_15  0x018d
> > +
> > +#define IMX219_OPPXCK_DIV              0x0309
> > +
> >  /* Test Pattern Control */
> >  #define IMX219_REG_TEST_PATTERN                0x0600
> >  #define IMX219_TEST_PATTERN_DISABLE    0
> > @@ -168,15 +173,12 @@ static const struct imx219_reg mode_3280x2464_regs[] = {
> >         {0x0171, 0x01},
> >         {0x0174, 0x00},
> >         {0x0175, 0x00},
> > -       {0x018c, 0x0a},
> > -       {0x018d, 0x0a},
> >         {0x0301, 0x05},
> >         {0x0303, 0x01},
> >         {0x0304, 0x03},
> >         {0x0305, 0x03},
> >         {0x0306, 0x00},
> >         {0x0307, 0x39},
> > -       {0x0309, 0x0a},
> >         {0x030b, 0x01},
> >         {0x030c, 0x00},
> >         {0x030d, 0x72},
> > @@ -230,15 +232,12 @@ static const struct imx219_reg mode_1920_1080_regs[] = {
> >         {0x0171, 0x01},
> >         {0x0174, 0x00},
> >         {0x0175, 0x00},
> > -       {0x018c, 0x0a},
> > -       {0x018d, 0x0a},
> >         {0x0301, 0x05},
> >         {0x0303, 0x01},
> >         {0x0304, 0x03},
> >         {0x0305, 0x03},
> >         {0x0306, 0x00},
> >         {0x0307, 0x39},
> > -       {0x0309, 0x0a},
> >         {0x030b, 0x01},
> >         {0x030c, 0x00},
> >         {0x030d, 0x72},
> > @@ -290,15 +289,12 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
> >         {0x0171, 0x01},
> >         {0x0174, 0x01},
> >         {0x0175, 0x01},
> > -       {0x018c, 0x0a},
> > -       {0x018d, 0x0a},
> >         {0x0301, 0x05},
> >         {0x0303, 0x01},
> >         {0x0304, 0x03},
> >         {0x0305, 0x03},
> >         {0x0306, 0x00},
> >         {0x0307, 0x39},
> > -       {0x0309, 0x0a},
> >         {0x030b, 0x01},
> >         {0x030c, 0x00},
> >         {0x030d, 0x72},
> > @@ -348,6 +344,27 @@ static const char * const imx219_supply_name[] = {
> >
> >  #define IMX219_NUM_SUPPLIES ARRAY_SIZE(imx219_supply_name)
> >
> > +/*
> > + * The supported formats.
> > + * This table MUST contain 4 entries per format, to cover the various flip
> > + * combinations in the order
> > + * - no flip
> > + * - h flip
> > + * - v flip
> > + * - h&v flips
> > + */
> > +static const u32 codes[] = {
> > +       MEDIA_BUS_FMT_SRGGB10_1X10,
> > +       MEDIA_BUS_FMT_SGRBG10_1X10,
> > +       MEDIA_BUS_FMT_SGBRG10_1X10,
> > +       MEDIA_BUS_FMT_SBGGR10_1X10,
> > +
> > +       MEDIA_BUS_FMT_SRGGB8_1X8,
> > +       MEDIA_BUS_FMT_SGRBG8_1X8,
> > +       MEDIA_BUS_FMT_SGBRG8_1X8,
> > +       MEDIA_BUS_FMT_SBGGR8_1X8,
> > +};
> > +
> >  /*
> >   * Initialisation delay between XCLR low->high and the moment when the sensor
> >   * can start capture (i.e. can leave software stanby) must be not less than:
> > @@ -413,6 +430,8 @@ struct imx219 {
> >         struct v4l2_subdev sd;
> >         struct media_pad pad;
> >
> > +       struct v4l2_mbus_framefmt fmt;
> > +
> >         struct clk *xclk; /* system clock to IMX219 */
> >         u32 xclk_freq;
> >
> > @@ -519,34 +538,57 @@ static int imx219_write_regs(struct imx219 *imx219,
> >  }
> >
> >  /* Get bayer order based on flip setting. */
> > -static u32 imx219_get_format_code(struct imx219 *imx219)
> > +static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
> >  {
> > -       /*
> > -        * Only one bayer order is supported.
> > -        * It depends on the flip settings.
> > -        */
> > -       static const u32 codes[2][2] = {
> > -               { MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SGRBG10_1X10, },
> > -               { MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SBGGR10_1X10, },
> > -       };
> > +       int i;
> >
> >         lockdep_assert_held(&imx219->mutex);
> > -       return codes[imx219->vflip->val][imx219->hflip->val];
> > +
> > +       for (i = 0; i < ARRAY_SIZE(codes); i++)
> > +               if (codes[i] == code)
> > +                       break;
> > +
> > +       if (i >= ARRAY_SIZE(codes))
> > +               i = 0;
> > +
> > +       i = (i & ~3) | (imx219->vflip->val ? 2 : 0) |
> > +           (imx219->hflip->val ? 1 : 0);
> > +
> > +       return codes[i];
> > +}
> > +
> > +static void imx219_set_default_format(struct imx219 *imx219)
> > +{
> > +       struct v4l2_mbus_framefmt *fmt;
> > +
> > +       mutex_lock(&imx219->mutex);
> > +
> > +       fmt = &imx219->fmt;
> > +       fmt->code = MEDIA_BUS_FMT_SRGGB10_1X10;
> > +       fmt->colorspace = V4L2_COLORSPACE_SRGB;
> > +       fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> > +       fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> > +                                                         fmt->colorspace,
> > +                                                         fmt->ycbcr_enc);
> > +       fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> > +       fmt->width = supported_modes[0].width;
> > +       fmt->height = supported_modes[0].height;
> > +       fmt->field = V4L2_FIELD_NONE;
> > +
> > +       mutex_unlock(&imx219->mutex);
> >  }
> >
> >  static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >  {
> >         struct imx219 *imx219 = to_imx219(sd);
> > +       struct v4l2_mbus_framefmt *cur_fmt = &imx219->fmt;
> >         struct v4l2_mbus_framefmt *try_fmt =
> >                 v4l2_subdev_get_try_format(sd, fh->pad, 0);
> >
> >         mutex_lock(&imx219->mutex);
> >
> >         /* Initialize try_fmt */
> > -       try_fmt->width = supported_modes[0].width;
> > -       try_fmt->height = supported_modes[0].height;
> > -       try_fmt->code = imx219_get_format_code(imx219);
> > -       try_fmt->field = V4L2_FIELD_NONE;
> > +       try_fmt = cur_fmt;
> >
> >         mutex_unlock(&imx219->mutex);
> >
> > @@ -648,14 +690,12 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
> >  {
> >         struct imx219 *imx219 = to_imx219(sd);
> >
> > -       /*
> > -        * Only one bayer order is supported (though it depends on the flip
> > -        * settings)
> > -        */
> > -       if (code->index > 0)
> > +       if (code->pad != 0)
> > +               return -EINVAL;
> > +       if (code->index >= (ARRAY_SIZE(codes) / 4))
> >                 return -EINVAL;
> >
> > -       code->code = imx219_get_format_code(imx219);
> > +       code->code = imx219_get_format_code(imx219, codes[code->index * 4]);
> >
> >         return 0;
> >  }
> > @@ -669,7 +709,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
> >         if (fse->index >= ARRAY_SIZE(supported_modes))
> >                 return -EINVAL;
> >
> > -       if (fse->code != imx219_get_format_code(imx219))
> > +       if (fse->code != imx219_get_format_code(imx219, imx219->fmt.code))
> >                 return -EINVAL;
> >
> >         fse->min_width = supported_modes[fse->index].width;
> > @@ -696,7 +736,6 @@ static void imx219_update_pad_format(struct imx219 *imx219,
> >  {
> >         fmt->format.width = mode->width;
> >         fmt->format.height = mode->height;
> > -       fmt->format.code = imx219_get_format_code(imx219);
> >         fmt->format.field = V4L2_FIELD_NONE;
> >
> >         imx219_reset_colorspace(&fmt->format);
> > @@ -710,10 +749,12 @@ static int __imx219_get_pad_format(struct imx219 *imx219,
> >                 struct v4l2_mbus_framefmt *try_fmt =
> >                         v4l2_subdev_get_try_format(&imx219->sd, cfg, fmt->pad);
> >                 /* update the code which could change due to vflip or hflip: */
> > -               try_fmt->code = imx219_get_format_code(imx219);
> > +               try_fmt->code = imx219_get_format_code(imx219, try_fmt->code);
> >                 fmt->format = *try_fmt;
> >         } else {
> >                 imx219_update_pad_format(imx219, imx219->mode, fmt);
> > +               fmt->format.code = imx219_get_format_code(imx219,
> > +                                                         imx219->fmt.code);
> >         }
> >
> >         return 0;
> > @@ -741,11 +782,18 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >         const struct imx219_mode *mode;
> >         struct v4l2_mbus_framefmt *framefmt;
> >         int exposure_max, exposure_def, hblank;
> > +       int i;
> >
> >         mutex_lock(&imx219->mutex);
> >
> > +       for (i = 0; i < ARRAY_SIZE(codes); i++)
> > +               if (codes[i] == fmt->format.code)
> > +                       break;
> > +       if (i >= ARRAY_SIZE(codes))
> > +               i = 0;
> > +
> >         /* Bayer order varies with flips */
> > -       fmt->format.code = imx219_get_format_code(imx219);
> > +       fmt->format.code = imx219_get_format_code(imx219, codes[i]);
> >
> >         mode = v4l2_find_nearest_size(supported_modes,
> >                                       ARRAY_SIZE(supported_modes),
> > @@ -755,7 +803,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >         if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> >                 framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> >                 *framefmt = fmt->format;
> > -       } else if (imx219->mode != mode) {
> > +       } else if (imx219->mode != mode ||
> > +                  imx219->fmt.code != fmt->format.code) {
> > +               imx219->fmt = fmt->format;
> >                 imx219->mode = mode;
> >                 /* Update limits and set FPS to default */
> >                 __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > @@ -786,6 +836,40 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >         return 0;
> >  }
> >
> > +static int imx219_set_framefmt(struct imx219 *imx219)
> > +{
> > +       int ret;
> > +
> > +       switch (imx219->fmt.code) {
> > +       case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +       case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +       case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +       case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +               ret = imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_0_7,
> > +                                      IMX219_REG_VALUE_08BIT, 0x08);
> > +               ret |= imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_8_15,
> > +                                      IMX219_REG_VALUE_08BIT, 0x08);
> > +               ret |= imx219_write_reg(imx219, IMX219_OPPXCK_DIV,
> > +                                       IMX219_REG_VALUE_08BIT, 0x08);
> > +               break;
> > +       case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +       case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +       case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +       case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +               ret = imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_0_7,
> > +                                      IMX219_REG_VALUE_08BIT, 0x0a);
> > +               ret |= imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_8_15,
> > +                                      IMX219_REG_VALUE_08BIT, 0x0a);
> > +               ret |= imx219_write_reg(imx219, IMX219_OPPXCK_DIV,
> > +                                       IMX219_REG_VALUE_08BIT, 0x0a);
> > +               break;
> > +       default:
> > +               ret = -EINVAL;
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> >  static int imx219_start_streaming(struct imx219 *imx219)
> >  {
> >         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > @@ -800,6 +884,12 @@ static int imx219_start_streaming(struct imx219 *imx219)
> >                 return ret;
> >         }
> >
> > +       ret = imx219_set_framefmt(imx219);
> > +       if (ret) {
> > +               dev_err(&client->dev, "%s failed to set format\n", __func__);
> > +               return ret;
> > +       }
> > +
> >         /* Apply customized values from user */
> >         ret =  __v4l2_ctrl_handler_setup(imx219->sd.ctrl_handler);
> >         if (ret)
> > @@ -1253,6 +1343,9 @@ static int imx219_probe(struct i2c_client *client)
> >         /* Initialize source pad */
> >         imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
> >
> > +       /* Initialize default format */
> > +       imx219_set_default_format(imx219);
> > +
> >         ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
> >         if (ret) {
> >                 dev_err(dev, "failed to init entity pads: %d\n", ret);
> > --
> > 2.20.1
> >

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65D21176166
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 18:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgCBRoy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 12:44:54 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40588 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727101AbgCBRoy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 12:44:54 -0500
Received: by mail-wm1-f67.google.com with SMTP id e26so176526wme.5
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2020 09:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+WIZXjcEmL/1ZM1E0SNbzKULb63t94MC8iXd9JqzHAg=;
        b=rAyZK8m7W9/aPyHshzZ++GXxiW1+PI/8+SBM/wY9MwRSE9329VpdSVlKkR71sCDluX
         3TAN8zDcIRkzJlMbc2+F81AtVuoBp27VILIgkKBwnerGX7x0vUm3e7Cp3cjSFqaQdpwr
         RuEoDC2wcuRC2T9KzaTmSnoEGqMfK3+PX6ESFl9O0cnFZlKamHKq8d5olyfg1nau4VcP
         5LX40lOK4EAiM32yku8/viFFQ+KWKQx87xLmGHz6SaGtXIFQeyA7AGbPuT13KnmALXCQ
         3pTpst4gI6qlRWfd8Jq3cBdAeyFBwQ48YDT9RQ2e+7ORJ+KA0e069WgD1rC2G2dxVWuq
         pNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+WIZXjcEmL/1ZM1E0SNbzKULb63t94MC8iXd9JqzHAg=;
        b=ub4klioE8feF/nNZfJ1q6zEf9kgY6GxGNUTHLv3PZ/wgcHnfhofC7tdgZnJ8MaaQJG
         LMS0lYtN+s95A+nARn9Dy4Mce0rQ6HfFhqIbVKtMTRJw+RF67MEpL8MuHlArGF1JU9Fy
         FjMo6indsd76v9X/P+mAc4VP+p7Oh3nU4I7200Sp6IjnQGNiUpxJnesoxCP3j13pLEyY
         mQc0TbBiXMZiRqI2kEAzJXXLl1DKIgEQhSGjltPl6fRLOsypvmyVodLH4moFjgqNcMdK
         2jEvJyHHEKPnMzoIcvLovcwItHdHyurMx12HUwdResaveZoh1wyAKKzofcqNRsFDDlME
         Wc1A==
X-Gm-Message-State: ANhLgQ3g189mKEU/aWWp8Io47QUN5PruR1HOEaVrTM7js+RazfUI6ZHs
        6EadY4mhSkVBBGaFFjjujX6YZCrt4X/G4vVlR4pubg==
X-Google-Smtp-Source: ADFU+vur4x97DBYJXCxYwRHTtsdOTjGqii/yDVER1jmIhjam9DitZS2hh78Q4+LPdrdSPjcHGXFzbsxzoo23hcIBpLo=
X-Received: by 2002:a1c:a9c3:: with SMTP id s186mr221265wme.82.1583171089186;
 Mon, 02 Mar 2020 09:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20200228165503.18054-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200228165503.18054-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAPY8ntCJEHe=fXeFcvwrSNbaFrzWSr7odO-8ntkjhSV7HYds9g@mail.gmail.com>
In-Reply-To: <CAPY8ntCJEHe=fXeFcvwrSNbaFrzWSr7odO-8ntkjhSV7HYds9g@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 2 Mar 2020 17:44:33 +0000
Message-ID: <CAPY8ntBW52YpLGKOc-VX5sP17LKwbAkjXoR8zp5Ha-EFkY47CA@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: i2c: imx219: Add support for SRGGB8_1X8 format
To:     Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2 Mar 2020 at 15:12, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Lad.
>
> Thanks for the patch. A few things look wrong with it though.
>
> On Fri, 28 Feb 2020 at 16:55, Lad Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >
> > imx219 sensor is capable for RAW8/RAW10 modes, this commit adds support
> > for SRGGB8_1X8 format.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/i2c/imx219.c | 122 +++++++++++++++++++++++++++++--------
> >  1 file changed, 96 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 8b48e148f2d0..1388c9bc00bb 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -90,6 +90,9 @@
> >
> >  #define IMX219_REG_ORIENTATION         0x0172
> >
> > +#define IMX219_CSI_DATA_FORMAT_A_0_7   0x018c
> > +#define IMX219_CSI_DATA_FORMAT_A_8_15  0x018d
> > +
> >  /* Test Pattern Control */
> >  #define IMX219_REG_TEST_PATTERN                0x0600
> >  #define IMX219_TEST_PATTERN_DISABLE    0
> > @@ -135,6 +138,16 @@ struct imx219_mode {
> >         struct imx219_reg_list reg_list;
> >  };
> >
> > +struct imx219_pixfmt {
> > +       u32 code;
> > +       u32 colorspace;
> > +};
> > +
> > +static const struct imx219_pixfmt imx219_formats[] = {
> > +       { MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_COLORSPACE_SRGB, },
> > +       { MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_COLORSPACE_SRGB },
>
> Why do we need the colorspace here when they are both the same? I
> don't see any additional formats ever being added  as the sensor
> doesn't support them, so this seems redundant.
>
> > +};
> > +
> >  /*
> >   * Register sets lifted off the i2C interface from the Raspberry Pi firmware
> >   * driver.
> > @@ -168,8 +181,6 @@ static const struct imx219_reg mode_3280x2464_regs[] = {
> >         {0x0171, 0x01},
> >         {0x0174, 0x00},
> >         {0x0175, 0x00},
> > -       {0x018c, 0x0a},
> > -       {0x018d, 0x0a},
> >         {0x0301, 0x05},
> >         {0x0303, 0x01},
> >         {0x0304, 0x03},
> > @@ -230,8 +241,6 @@ static const struct imx219_reg mode_1920_1080_regs[] = {
> >         {0x0171, 0x01},
> >         {0x0174, 0x00},
> >         {0x0175, 0x00},
> > -       {0x018c, 0x0a},
> > -       {0x018d, 0x0a},
> >         {0x0301, 0x05},
> >         {0x0303, 0x01},
> >         {0x0304, 0x03},
> > @@ -290,8 +299,6 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
> >         {0x0171, 0x01},
> >         {0x0174, 0x01},
> >         {0x0175, 0x01},
> > -       {0x018c, 0x0a},
> > -       {0x018d, 0x0a},
> >         {0x0301, 0x05},
> >         {0x0303, 0x01},
> >         {0x0304, 0x03},
> >
> > @@ -413,6 +420,8 @@ struct imx219 {
> >         struct v4l2_subdev sd;
> >         struct media_pad pad;
> >
> > +       struct v4l2_mbus_framefmt fmt;
> > +
> >         struct clk *xclk; /* system clock to IMX219 */
> >         u32 xclk_freq;
> >
> > @@ -519,19 +528,26 @@ static int imx219_write_regs(struct imx219 *imx219,
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
> > +       static const u32 codes10[2][2] = {
> >                 { MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SGRBG10_1X10, },
> >                 { MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SBGGR10_1X10, },
> >         };
> > +       static const u32 codes8[2][2] = {
> > +               { MEDIA_BUS_FMT_SRGGB8_1X8, MEDIA_BUS_FMT_SGRBG8_1X8, },
> > +               { MEDIA_BUS_FMT_SGBRG8_1X8, MEDIA_BUS_FMT_SBGGR8_1X8, },
> > +       };
> >
> >         lockdep_assert_held(&imx219->mutex);
> > -       return codes[imx219->vflip->val][imx219->hflip->val];
> > +
> > +       if (code == MEDIA_BUS_FMT_SRGGB10_1X10 ||
> > +           code == MEDIA_BUS_FMT_SGRBG10_1X10 ||
> > +           code == MEDIA_BUS_FMT_SGBRG10_1X10 ||
> > +           code == MEDIA_BUS_FMT_SBGGR10_1X10)
> > +               return codes10[imx219->vflip->val][imx219->hflip->val];
> > +
> > +       return codes8[imx219->vflip->val][imx219->hflip->val];
>
> Why defaulting to 8 bit? It's changing the behaviour for existing users.
>
> >  }
> >
> >  static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > @@ -539,13 +555,26 @@ static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >         struct imx219 *imx219 = to_imx219(sd);
> >         struct v4l2_mbus_framefmt *try_fmt =
> >                 v4l2_subdev_get_try_format(sd, fh->pad, 0);
> > +       struct v4l2_mbus_framefmt *fmt;
> >
> >         mutex_lock(&imx219->mutex);
> >
> > +       fmt = &imx219->fmt;
> > +       fmt->code = MEDIA_BUS_FMT_SRGGB8_1X8;
>
> Again, why defaulting to 8 bit? It's changing the behaviour for existing users.
>
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
> >         /* Initialize try_fmt */
> >         try_fmt->width = supported_modes[0].width;
> >         try_fmt->height = supported_modes[0].height;
> > -       try_fmt->code = imx219_get_format_code(imx219);
> > +       try_fmt->code = imx219_get_format_code(imx219, fmt->code);
> >         try_fmt->field = V4L2_FIELD_NONE;
> >
> >         mutex_unlock(&imx219->mutex);
> > @@ -646,16 +675,12 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
> >                                  struct v4l2_subdev_pad_config *cfg,
> >                                  struct v4l2_subdev_mbus_code_enum *code)
> >  {
> > -       struct imx219 *imx219 = to_imx219(sd);
> > -
> > -       /*
> > -        * Only one bayer order is supported (though it depends on the flip
> > -        * settings)
> > -        */
> > -       if (code->index > 0)
> > +       if (code->pad != 0)
> > +               return -EINVAL;
> > +       if (code->index >= ARRAY_SIZE(imx219_formats))
> >                 return -EINVAL;
> >
> > -       code->code = imx219_get_format_code(imx219);
> > +       code->code = imx219_formats[code->index].code;
>
> This can't be right as it will only ever advertise
> MEDIA_BUS_FMT_SRGGB8_1X8 or MEDIA_BUS_FMT_SRGGB10_1X10, when the
> actual formats supported will change based on the H&V flips.
> MEDIA_BUS_FMT_SRGGB8_1X8. A caller therefore can't know the correct
> format should H or V flip be active, therefore can't set the right
> thing.
>
> code->code = imx219_get_format_code(imx219, imx219_formats[code->index].code);
> would look more plausible.
>
> >         return 0;
> >  }
> > @@ -669,7 +694,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
> >         if (fse->index >= ARRAY_SIZE(supported_modes))
> >                 return -EINVAL;
> >
> > -       if (fse->code != imx219_get_format_code(imx219))
> > +       if (fse->code != imx219_get_format_code(imx219, imx219->fmt.code))
> >                 return -EINVAL;
> >
> >         fse->min_width = supported_modes[fse->index].width;
> > @@ -696,7 +721,7 @@ static void imx219_update_pad_format(struct imx219 *imx219,
> >  {
> >         fmt->format.width = mode->width;
> >         fmt->format.height = mode->height;
> > -       fmt->format.code = imx219_get_format_code(imx219);
> > +       fmt->format.code = imx219_get_format_code(imx219, imx219->fmt.code);
> >         fmt->format.field = V4L2_FIELD_NONE;
> >
> >         imx219_reset_colorspace(&fmt->format);
> > @@ -710,7 +735,7 @@ static int __imx219_get_pad_format(struct imx219 *imx219,
> >                 struct v4l2_mbus_framefmt *try_fmt =
> >                         v4l2_subdev_get_try_format(&imx219->sd, cfg, fmt->pad);
> >                 /* update the code which could change due to vflip or hflip: */
> > -               try_fmt->code = imx219_get_format_code(imx219);
> > +               try_fmt->code = imx219_get_format_code(imx219, try_fmt->code);
> >                 fmt->format = *try_fmt;
> >         } else {
> >                 imx219_update_pad_format(imx219, imx219->mode, fmt);
> > @@ -741,11 +766,19 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >         const struct imx219_mode *mode;
> >         struct v4l2_mbus_framefmt *framefmt;
> >         int exposure_max, exposure_def, hblank;
> > +       int i;
> >
> >         mutex_lock(&imx219->mutex);
> >
> > +       for (i = 0; i < ARRAY_SIZE(imx219_formats); i++)
> > +               if (imx219_formats[i].code == fmt->format.code)
> > +                       break;
> > +       if (i >= ARRAY_SIZE(imx219_formats))
> > +               i = 0;
> > +
>
> Again, this doesn't take into account the H&V flips altering the Bayer
> format. If either are engaged then you can't change between 8 & 10 bit
> formats.
>
> It feels like having imx219_formats is the wrong approach.
> We already have all the formats available in a combination of codes8
> and codes10 (admittedly static to imx219_get_format_code). Is it
> better to make it into a single array where there is a strict
> requirement for the formats to be in the correct order of (eg) no
> flip, h flip, v flip, h&v flip. A lookup can then be a straight scan
> of the list. A correction for flip order is then index = (index & ~3)
> | (v_flip ? 2 : 0) | (h_flip ? 1 : 0);
>
> >         /* Bayer order varies with flips */
> > -       fmt->format.code = imx219_get_format_code(imx219);
> > +       fmt->format.code = imx219_get_format_code(imx219,
> > +                                                 imx219_formats[i].code);
> >
> >         mode = v4l2_find_nearest_size(supported_modes,
> >                                       ARRAY_SIZE(supported_modes),
> > @@ -756,6 +789,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >                 framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> >                 *framefmt = fmt->format;
> >         } else if (imx219->mode != mode) {
> > +               imx219->fmt = fmt->format;
> >                 imx219->mode = mode;
> >                 /* Update limits and set FPS to default */
> >                 __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > @@ -786,6 +820,36 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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
> > +               break;
> > +       case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +       case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +       case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +       case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +               ret = imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_0_7,
> > +                                      IMX219_REG_VALUE_08BIT, 0x0a);
> > +               ret |= imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_8_15,
> > +                                      IMX219_REG_VALUE_08BIT, 0x0a);
> > +               break;
>
> As just queried on your patch adding the 640x480 mode, do we not need
> to modify 0x0309 / OPPXCK_DIV to match the pixel format?

To answer my own question, yes we appear to need to modify 0x0309 as
well in order to get correct images out.

> How do you propose handling matching pixel rate vs link frequency
> between the two modes?

I don't have useful tools here to determine the correct link frequency.
The pixel rate clock tree hasn't been modified, therefore must still
be the same. Indeed I'm getting the same frame rate out whether in 8
or 10 bit mode.

The division by 8 instead of 10 in OPPXCK would presumably drop the
link frequency, but the mipi_CLK feeding the MIPI block hasn't been
modified, therefore has the link frequency actually changed?

> I'm seeing corrupted images, which probably implies the FIFO between
> "pipeline" and "MIPI" shown in Figure 43 of the datasheet is under or
> over flowing.
>
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
> > @@ -800,6 +864,12 @@ static int imx219_start_streaming(struct imx219 *imx219)
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
> > --
> > 2.20.1
> >

I've had a quick play, and I think there's a further issue with
switching between 8 and 10 bit modes when choosing the same
resolution.
imx219_set_pad_format checks that the mode is actually changing before
jumping through the hoops of updating the internal state, therefore
the change of format is ignored. An extra clause checking the format
is the minimum needed there.

I've pushed my hacks on top of your patches to
https://github.com/6by9/linux/tree/imx219
Whilst it's based on a 5.4 tree, the top few commits are applying the
mainlined driver, adding your patches, and then my fixup.
I've mainly tested that it streams sensible images in a few
resolutions and 8/10 bit modes, not that everything is perfect.

  Dave

Return-Path: <linux-media+bounces-22030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 822939D8A0E
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 17:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16B0D165B8A
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B681B4155;
	Mon, 25 Nov 2024 16:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Zx0uBIxP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97171B3920
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 16:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732551284; cv=none; b=fqqWWmzxRfBPOXW1B0abP/aVKI5C7j1pA8yhJGGmTkJo6QIiqgqUNax1Sb6youbVScQrUz1ESnx8GgK+uc76nwjx38pSPHanGxNbJ5M90pyIbUItQiIqWLw1ymkvnessa81MWMDJOlwhkxG4MqEXtpsIV0mQDmlHlJj28mLmPSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732551284; c=relaxed/simple;
	bh=GDPiEs1SKxDW7MioAFczBEroBgiMzrHHlTJ0mpLwsPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CyxKcCrWsFTP1D/0Rn41KNw/EtAOMTSK4qEQLXG0om0b5XFIUnVAkNjvor+66IBurkaUtY+duisxNzWtMKogGY2TJle4+klk5mcpGb24N4RVBjPolG+XvZ+wU8OBnnhxQl9BGSNBoGwPcDKpYg/RmE63byFUjJ31YxZxhgwfXO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Zx0uBIxP; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71d40fdde2fso687735a34.3
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 08:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732551281; x=1733156081; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fEo/ZYgZSTzpz+WstLskL67h0HbZb4vX04dadlNkTFk=;
        b=Zx0uBIxP8nRxWbbWJpJF8dWkefs0AGwjxRmfRjpDKEK1+8xV5qWBOJwnlRwkyty1hS
         CX5q7MzxbDAS2HSEH183jQ9Q4t2Eey+2XLtTJhpQiX3hOoSoaVIoYalqis/KjX4YWokt
         s+pT5uMHqsPD9+rzyqa8jR8tW+GTr/pOUysYKd1NI7Lngd+JJojlyDO1rTb6f67+hDL3
         TCygulGFV0Zid8y3JBX/6WU61in7TYXNJ9g3J1M9zituL8ypJAoObygraRCZnIH8V8a/
         TRZTFbwf1CG55ps7B81Z6/4/Qi7x0FyxLtgJsCxM4ObGwKfO3Af76vU+Rfm8ZLd6+Ktl
         3sWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732551281; x=1733156081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEo/ZYgZSTzpz+WstLskL67h0HbZb4vX04dadlNkTFk=;
        b=F3LwIZ/YJsSt2FbTfGhXedbLCyokgZdC4ue2K4Un+0AO7euYSd5T0EMfp/R9snIXi8
         uXvbZLBfYPfRFWD9EuBXw9Hv96ahw/Vs3wjRUwkM1CJPtYozCHroe39etw7QfzC/O3v+
         VxegP9AyDP1IQ6kDGe1Pn+ag+Rm3JnQ85XcQtKidUyAsCkjytT3MuE6v5Q59JSFyjCd8
         xq9WtRT9cQgp0flD0hVW0dbtEvyScUYF64XeDDkHvUlROpb1CDcMKcp7wEAj1tK6FmDx
         eqNaXFoHCeEyXtOfPo4ZBX7GUmpZyFbZwjAmVdocXZxhjwc3pi0L19KpzbXycIYfT4c6
         mmxA==
X-Forwarded-Encrypted: i=1; AJvYcCVU0ci66JAq4zNApS9dx7fn8qdve2d9PVYVBisuZSTfQJVj+iZuekGNNUpvmNPKeC0nsGAgymLUsgXoBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2F+0vYMAOYOJSnfodk43i9dWlaeqtsQR/V3GmydSBnp/gmmcy
	1tOajUTMV5J64CieOlZhinRD/Mz8ooGr2QnSWCtBAHiNSZ+tBO/Yb+gXYJgyH/ix23gn9mjYzRB
	UIevy6szytfsbit7NcL2e5eiIfBZ/kIVICjL70w==
X-Gm-Gg: ASbGncsLtWljVjHSPEWSUvm+glL0FJ8gvqnA2z7Auc2Yowddi8MM5QVjD2ir8REfHr+
	snn+hXUDo8TMnD847PVQhyXZ+IVex9gs=
X-Google-Smtp-Source: AGHT+IGT4b9WSGMyN5iCtP56gp4dzXbzI0SOowhrOGFH4LSJMolDfQ7YDq8MT6HtFJzA3tES9i8BHRGo4BMih+dUDfA=
X-Received: by 2002:a05:6830:6281:b0:718:9d91:6a0f with SMTP id
 46e09a7af769-71c04b9d626mr11657486a34.15.1732551280703; Mon, 25 Nov 2024
 08:14:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121-imx219_fixes-v2-0-7b068a60ea40@ideasonboard.com>
 <20241121-imx219_fixes-v2-3-7b068a60ea40@ideasonboard.com>
 <npwwmrap6l3pfs6uuh5jxssrox5dp6h3bcvw4ihqqxrlhcmdks@vbyqxsakhlwg>
 <20241124033432.GF19573@pendragon.ideasonboard.com> <h5hozek5zljqa62nnfqsse232xmdihfyqipsryw3tctu2lu7td@tsnd2s6lsv22>
In-Reply-To: <h5hozek5zljqa62nnfqsse232xmdihfyqipsryw3tctu2lu7td@tsnd2s6lsv22>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 25 Nov 2024 16:14:26 +0000
Message-ID: <CAPY8ntBfvjdEZE1EKdQMJ2PuE1ZFOsogtaQ3S5FYO_FFDe6LUA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: i2c: imx219: Scale the pixel rate for
 analog binning
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>, 
	Vinay Varma <varmavinaym@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jai and Laurent

On Mon, 25 Nov 2024 at 12:34, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Dave,
>
> & Laurent, Jacopo,
>
> On Nov 24, 2024 at 05:34:32 +0200, Laurent Pinchart wrote:
> > On Fri, Nov 22, 2024 at 11:31:58AM +0100, Jacopo Mondi wrote:
> > > On Thu, Nov 21, 2024 at 05:38:04PM +0530, Jai Luthra wrote:
> > > > When the analog binning mode is used for high framerate operation,
> > > > the pixel rate is effectively doubled. Account for this when setting up
> > > > the pixel clock rate, and applying the vblank and exposure controls.
> > > >
> > > > The previous logic only used analog binning for 8-bit modes, but normal
> > > > binning limits the framerate on 10-bit 480p [1]. So with this patch we
> > > > switch to using special binning (with 2x pixel rate) for all formats of
> > > > 480p mode and 8-bit 1232p.
> > > >
> > > > To do this cleanly, re-introduce the book-keeping for which binning mode
> > > > is used with which resolution/format.
> > >
> > > I think the patch is correct, however this goes a bit in the opposite
> > > direction of making the driver freely configurable. IOW the more we
> > > store in modes, the harder it will become to freely configure the
> > > sensor. I know there are different opinions on how much this is
> > > actually an issue, with valid arguments on both sides, but as I recall
> > > freely configurable was a goal of Laurent's series, let me cc him
> > > explicitly.
> >
> > Correct. I would like the binning configuration to be computed by the
> > driver, not hardcoded. Let's do better than this.

So the question over storing in modes versus free-form
cropping/binning was raised at Dublin in 2022, and seems to largely
have gone nowhere since.

In this series Sakari queried IQ issues with adjusting HBLANK on this
sensor. The same query is valid for cropping/binning changes, and
probably more so.

How can you square the circle of IQ issues due to settings that
haven't been validated by the sensor manufacturer vs applying
arbitrary cropping / binning setups?

> From commit ef86447e775fb1f2ced00d4c7fff2c0a1c63f165 we know the special
> "analog" 2x binning mode causes artefacts for RAW10 1640x1232 capture.
> But it works (and is preferred due to higher pixelrate) for RAW10
> 640x480.
>
> I did some experimentation with different resolutions, keeping format
> set to RAW10, and analog binning always enabled.
>
> Any width > 1624 causes same artefacts. And any width <= 1624 gives a
> normal image. Height doesn't seem to matter.
>
> Dave do you know somebody in Sony who can clarify why that is the case?

I can ping my contact at Sony.
Whether they still have the information is a different question.
Previous times it has seemed they need to find an individual who was
on the original product team to answer, so seeing as IMX219 came out
around 2013 that could be tricky.

  Dave

> I am planning to send a v3 for this patch using width <= 1624 to decide
> which binning mode to pick.
>
> > > > [1]: https://github.com/raspberrypi/linux/issues/5493
> > > >
> > > > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
> > > > Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
> > > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > > ---
> > > >  drivers/media/i2c/imx219.c | 138 ++++++++++++++++++++++++++++++---------------
> > > >  1 file changed, 94 insertions(+), 44 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > index 970e6362d0ae3a9078daf337155e83d637bc1ca1..ec795569361987ae30bff234e97fa34600bf5975 100644
> > > > --- a/drivers/media/i2c/imx219.c
> > > > +++ b/drivers/media/i2c/imx219.c
> > > > @@ -149,6 +149,18 @@
> > > >  #define IMX219_PIXEL_ARRAY_WIDTH 3280U
> > > >  #define IMX219_PIXEL_ARRAY_HEIGHT        2464U
> > > >
> > > > +enum binning_mode {
> > > > + BINNING_NONE = IMX219_BINNING_NONE,
> > > > + BINNING_X2 = IMX219_BINNING_X2,
> > > > + BINNING_ANALOG_X2 = IMX219_BINNING_X2_ANALOG,
> > > > +};
> > > > +
> > > > +enum binning_bit_depths {
> > > > + BINNING_IDX_8_BIT,
> > > > + BINNING_IDX_10_BIT,
> > > > + BINNING_IDX_MAX
> > > > +};
> > > > +
> > > >  /* Mode : resolution and related config&values */
> > > >  struct imx219_mode {
> > > >   /* Frame width */
> > > > @@ -158,6 +170,9 @@ struct imx219_mode {
> > > >
> > > >   /* V-timing */
> > > >   unsigned int vts_def;
> > > > +
> > > > + /* binning mode based on format code */
> > > > + enum binning_mode binning[BINNING_IDX_MAX];
> > > >  };
> > > >
> > > >  static const struct cci_reg_sequence imx219_common_regs[] = {
> > > > @@ -293,24 +308,40 @@ static const struct imx219_mode supported_modes[] = {
> > > >           .width = 3280,
> > > >           .height = 2464,
> > > >           .vts_def = 3526,
> > > > +         .binning = {
> > > > +                 [BINNING_IDX_8_BIT] = BINNING_NONE,
> > > > +                 [BINNING_IDX_10_BIT] = BINNING_NONE,
> > > > +         },
> > > >   },
> > > >   {
> > > >           /* 1080P 30fps cropped */
> > > >           .width = 1920,
> > > >           .height = 1080,
> > > >           .vts_def = 1763,
> > > > +         .binning = {
> > > > +                 [BINNING_IDX_8_BIT] = BINNING_NONE,
> > > > +                 [BINNING_IDX_10_BIT] = BINNING_NONE,
> > > > +         },
> > > >   },
> > > >   {
> > > >           /* 2x2 binned 30fps mode */
> > > >           .width = 1640,
> > > >           .height = 1232,
> > > >           .vts_def = 1763,
> > > > +         .binning = {
> > > > +                 [BINNING_IDX_8_BIT] = BINNING_ANALOG_X2,
> > > > +                 [BINNING_IDX_10_BIT] = BINNING_X2,
> > > > +         },
> > > >   },
> > > >   {
> > > >           /* 640x480 30fps mode */
> > > >           .width = 640,
> > > >           .height = 480,
> > > >           .vts_def = 1763,
> > > > +         .binning = {
> > > > +                 [BINNING_IDX_8_BIT] = BINNING_ANALOG_X2,
> > > > +                 [BINNING_IDX_10_BIT] = BINNING_ANALOG_X2,
> > > > +         },
> > > >   },
> > > >  };
> > > >
> > > > @@ -337,6 +368,9 @@ struct imx219 {
> > > >
> > > >   /* Two or Four lanes */
> > > >   u8 lanes;
> > > > +
> > > > + /* Binning mode */
> > > > + enum binning_mode binning;
> > > >  };
> > > >
> > > >  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> > > > @@ -362,6 +396,36 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
> > > >   return imx219_mbus_formats[i];
> > > >  }
> > > >
> > > > +static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
> > > > +{
> > > > + switch (format->code) {
> > > > + case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > > + case MEDIA_BUS_FMT_SGRBG8_1X8:
> > > > + case MEDIA_BUS_FMT_SGBRG8_1X8:
> > > > + case MEDIA_BUS_FMT_SBGGR8_1X8:
> > > > +         return 8;
> > > > +
> > > > + case MEDIA_BUS_FMT_SRGGB10_1X10:
> > > > + case MEDIA_BUS_FMT_SGRBG10_1X10:
> > > > + case MEDIA_BUS_FMT_SGBRG10_1X10:
> > > > + case MEDIA_BUS_FMT_SBGGR10_1X10:
> > > > + default:
> > > > +         return 10;
> > > > + }
> > > > +}
> > > > +
> > > > +static int imx219_get_rate_factor(struct imx219 *imx219)
> > > > +{
> > > > + switch (imx219->binning) {
> > > > + case BINNING_NONE:
> > > > + case BINNING_X2:
> > > > +         return 1;
> > > > + case BINNING_ANALOG_X2:
> > > > +         return 2;
> > > > + }
> > > > + return -EINVAL;
> > > > +}
> > > > +
> > > >  /* -----------------------------------------------------------------------------
> > > >   * Controls
> > > >   */
> > > > @@ -373,10 +437,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > > >   struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > > >   const struct v4l2_mbus_framefmt *format;
> > > >   struct v4l2_subdev_state *state;
> > > > + int rate_factor;
> > > >   int ret = 0;
> > > >
> > > >   state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> > > >   format = v4l2_subdev_state_get_format(state, 0);
> > > > + rate_factor = imx219_get_rate_factor(imx219);
> > > >
> > > >   if (ctrl->id == V4L2_CID_VBLANK) {
> > > >           int exposure_max, exposure_def;
> > > > @@ -405,7 +471,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > > >           break;
> > > >   case V4L2_CID_EXPOSURE:
> > > >           cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > > > -                   ctrl->val, &ret);
> > > > +                   ctrl->val / rate_factor, &ret);
> > > >           break;
> > > >   case V4L2_CID_DIGITAL_GAIN:
> > > >           cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > > > @@ -422,7 +488,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > > >           break;
> > > >   case V4L2_CID_VBLANK:
> > > >           cci_write(imx219->regmap, IMX219_REG_VTS,
> > > > -                   format->height + ctrl->val, &ret);
> > > > +                   (format->height + ctrl->val) / rate_factor, &ret);
> > > >           break;
> > > >   case V4L2_CID_HBLANK:
> > > >           cci_write(imx219->regmap, IMX219_REG_HTS,
> > > > @@ -463,7 +529,8 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
> > > >
> > > >  static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
> > > >  {
> > > > - return (imx219->lanes == 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RATE_4LANE;
> > > > + return ((imx219->lanes == 2) ? IMX219_PIXEL_RATE :
> > > > +         IMX219_PIXEL_RATE_4LANE) * imx219_get_rate_factor(imx219);
> > > >  }
> > > >
> > > >  /* Initialize control handlers */
> > > > @@ -592,29 +659,12 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> > > >  {
> > > >   const struct v4l2_mbus_framefmt *format;
> > > >   const struct v4l2_rect *crop;
> > > > - unsigned int bpp;
> > > > - u64 bin_h, bin_v;
> > > > + u32 bpp;
> > > >   int ret = 0;
> > > >
> > > >   format = v4l2_subdev_state_get_format(state, 0);
> > > >   crop = v4l2_subdev_state_get_crop(state, 0);
> > > > -
> > > > - switch (format->code) {
> > > > - case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > > - case MEDIA_BUS_FMT_SGRBG8_1X8:
> > > > - case MEDIA_BUS_FMT_SGBRG8_1X8:
> > > > - case MEDIA_BUS_FMT_SBGGR8_1X8:
> > > > -         bpp = 8;
> > > > -         break;
> > > > -
> > > > - case MEDIA_BUS_FMT_SRGGB10_1X10:
> > > > - case MEDIA_BUS_FMT_SGRBG10_1X10:
> > > > - case MEDIA_BUS_FMT_SGBRG10_1X10:
> > > > - case MEDIA_BUS_FMT_SBGGR10_1X10:
> > > > - default:
> > > > -         bpp = 10;
> > > > -         break;
> > > > - }
> > > > + bpp = imx219_get_format_bpp(format);
> > > >
> > > >   cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
> > > >             crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> > > > @@ -625,28 +675,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> > > >   cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
> > > >             crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
> > > >
> > > > - switch (crop->width / format->width) {
> > > > - case 1:
> > > > - default:
> > > > -         bin_h = IMX219_BINNING_NONE;
> > > > -         break;
> > > > - case 2:
> > > > -         bin_h = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> > > > -         break;
> > > > - }
> > > > -
> > > > - switch (crop->height / format->height) {
> > > > - case 1:
> > > > - default:
> > > > -         bin_v = IMX219_BINNING_NONE;
> > > > -         break;
> > > > - case 2:
> > > > -         bin_v = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> > >
> > > So if I got this right, another way of handling this would be to
> > >
> > >             bin_v = (bpp == 8 || (format->width == 640 && format->height = 480)
> > >                       ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> > >
> > >
> > > I'm not sure how much better this is, as then freely configure the
> > > sensor at (random numbers) 720x480@10bpp would not use analog binning
> > > while it might be beneficial. Actually knowing what analog mode is how
> > > it shuold be used would help, but if I recall correctly it wasn't
> > > clear from documentation or not fully clarified by Sony ?
> > >
> > > When it comes to scaling PIXEL_RATE, the above switch could be moved
> > > to set_pad_format and store imx219->binning to be
> > > 1) used here
> > > 2) used in s_ctrl
>
> Agreed, will move it to set_pad_format.
>
> > >
> > > like this patch does already.
> > >
> > > Opinions ?
> > >
> > > > -         break;
> > > > - }
> > > > -
> > > > - cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> > > > - cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
> > > > + cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, imx219->binning, &ret);
> > > > + cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, imx219->binning, &ret);
> > > >
> > > >   cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
> > > >             format->width, &ret);
> > > > @@ -851,6 +881,21 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > > >           int exposure_max;
> > > >           int exposure_def;
> > > >           int hblank;
> > > > +         int pixel_rate;
> > > > +
> > > > +         /* Update binning mode based on format */
> > > > +         switch (imx219_get_format_bpp(format)) {
> > > > +         case 8:
> > > > +                 imx219->binning = mode->binning[BINNING_IDX_8_BIT];
> > > > +                 break;
> > > > +
> > > > +         case 10:
> > > > +                 imx219->binning = mode->binning[BINNING_IDX_10_BIT];
> > > > +                 break;
> > > > +
> > > > +         default:
> > > > +                 imx219->binning = BINNING_NONE;
> > > > +         }
> > > >
> > > >           /* Update limits and set FPS to default */
> > > >           __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > > > @@ -879,6 +924,11 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > > >                                    IMX219_PPL_MAX - mode->width,
> > > >                                    1, IMX219_PPL_MIN - mode->width);
> > > >           __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> > > > +
> > > > +         /* Scale the pixel rate based on the mode specific factor */
> > > > +         pixel_rate = imx219_get_pixel_rate(imx219);
> > > > +         __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> > > > +                                  pixel_rate, 1, pixel_rate);
> > > >   }
> > > >
> > > >   return 0;
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
> --
> Thanks,
> Jai
>
> GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145


Return-Path: <linux-media+bounces-21697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DED9D4377
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 22:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32108B22C47
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 21:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4DB1BF7E5;
	Wed, 20 Nov 2024 21:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSB73bPp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4491474B7;
	Wed, 20 Nov 2024 21:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732137792; cv=none; b=fmq379TchvGUeT+uZGpKsiVccHbeixYyo9Na4rdds0zYV14NTAjQfD+DN9FBQu3xMaDKrUiaiDb97t/rhjzlFvUCRwdyQwKzDNTrPjdyKLxbXeiHa4Vefvd0bOT96fc7WW72bl06b2agyNkwvsdeRFrivHQAd2xPKmUotdF5Ykg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732137792; c=relaxed/simple;
	bh=sbFLVTgrX0lRcgGH6NfQV47ieMtIKzNKI8d2WtpizN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJlc77TIyXsptIO4AhCMFXvlQVtjoX6HvcBj6wni1cZaj84UOFC8OjzEh+souy0HJy5FyxG/D86dTUGBpU0Hbgk91rOCfXoR9rrLyu0fmAEd7Uu9NWEkQHUmq/WmO6zd/KkgK9Z2HFcPTik+VurImFtH5leWgMsCtREu5/EgNSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSB73bPp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17337C4CED8;
	Wed, 20 Nov 2024 21:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732137792;
	bh=sbFLVTgrX0lRcgGH6NfQV47ieMtIKzNKI8d2WtpizN8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SSB73bPpgfhBsQOUBXy/YqFyLcP2yTZQExMHvgH7CG+vzZK76zFpUtKTerFPTZuEV
	 +9oF55VM2Uztv73U7KqYIkwbKcNzO3qiWN2EP3rvcFjVsCtZum0mpJN82sYtPyR/l9
	 6biyS0WXt6MuPVBJjP8uPHbX6XAC+0OJT3bMXAUWrBAdiaCs3pWcZ3uqElLlp5fo02
	 XsKPeNa5Q5KVBuTz+7Qxg1Udm5q/Yu8AvDVAKLqkku7LScTpfa10sjKu8qBgHPT1YZ
	 ZPo+1+xaDlHvmvF2DsXv80DjQbOS4OtAj20UPk5X94YhLoFs9v97gRHnhXJwIKLKSG
	 ALWLc8PAz/X2g==
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-856f2b3e1b7so64041241.0;
        Wed, 20 Nov 2024 13:23:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUA7BrKbpVYs9oYUGXyzOgrRkKJgGWqRIg++xuFdyn0kfB9amGSwP3FH8Ps54zL8Bgg+I82eiTHIaT73vU=@vger.kernel.org, AJvYcCVLnSOnEeo+HouuatwelXKOxE2kfIMb+UW0hS645fv5cFxewCIhY0ah8EQCuh+dzGfsWnBve+52Ki7fizE=@vger.kernel.org, AJvYcCVSclr8EHGspS5L8SuAniEFgDmHsBQqCisQt6bnfd9Qt4KOb7Ib5CX926EZeH6sZQ09jxwtwB9IAxUBvyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHSVMlvzBYampx55WXsFBRKKJcWZTesF81dFEdVQO4YRXIJe1u
	/soXhAbcUFoF+5S7n3Xw00JstNNkCez+5ybaetGtrhOzgliYvePhr4Iwa3AWQPnSCJK3rVV3hEJ
	+ZzgEPE1DZX21Ck/2U/wg4r6M2jM=
X-Google-Smtp-Source: AGHT+IEu2QMMzTVlLo4cbU6GVKYwYglQRvIKvCieV7Y80btyw62Xl+Q1DZ6EREBn/hKhvnV/UnGJjahyxT9iAJX2aUY=
X-Received: by 2002:a05:6102:4b0c:b0:4a7:4829:8cb0 with SMTP id
 ada2fe7eead31-4adaf425a7dmr5639965137.3.1732137791059; Wed, 20 Nov 2024
 13:23:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
 <20241021-imx214-v2-9-fbd23e99541e@apitzsch.eu> <CAPybu_09-1E4+Xe1Tnaue01i4JPtOHz15OUei=4q=Roqcuoz2Q@mail.gmail.com>
 <f927d1aa8718568cd7cecc90255f73ddbd673a41.camel@apitzsch.eu>
In-Reply-To: <f927d1aa8718568cd7cecc90255f73ddbd673a41.camel@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Wed, 20 Nov 2024 22:22:54 +0100
X-Gmail-Original-Message-ID: <CAPybu_2xPkrL=jTT0O_10KuCgyfe3BU033Y+q2+jq9ErPU9ACA@mail.gmail.com>
Message-ID: <CAPybu_2xPkrL=jTT0O_10KuCgyfe3BU033Y+q2+jq9ErPU9ACA@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] media: i2c: imx214: Extract format and crop settings
To: =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, sakari.ailus@iki.fi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Wed, Nov 20, 2024 at 9:07=E2=80=AFPM Andr=C3=A9 Apitzsch <git@apitzsch.e=
u> wrote:
>
> Hi Ricardo,
>
> Am Mittwoch, dem 30.10.2024 um 13:10 +0100 schrieb Ricardo Ribalda
> Delgado:
> > Hi
> >
> > Aren't you changing the binning mode for 1920x1080  with this patch?
> > I think that could be considered an ABI change.
>
> Is the problem that the ABI changes or that it is not mentioned in the
> commit message?

I think it is a combination of both. There will be products out there
that after applying this change will get different frames using the
same configuration.

@Sakari Ailus  What do we usually do in these cases?

> >
> > Also, if we are not letting the user change the value, I do not see
> > much value in setting the cropping programmatically, I'd rather not
> > take this change.
>
> I assume the first "value" refers to "binning value", that cannot be
> changed by the user. Is it right, that .set_selection needs to be
> implemented to change that?

I believe set_selection is the correct way, yes. Sakari again to keep
me honest :)

>
> The different values are set programmatically to reduce the number of
> entries in the cci reg sequences to make it easier to add more modes
> later.

If it is not a huge rework: Can we start by having  the crop area
moved to imx214_mode and add all the binning logic to a different
patch?
It will be easier to discuss things that way.

>
> Regards,
> Andr=C3=A9
>
> >
> > On Mon, Oct 21, 2024 at 12:14=E2=80=AFAM Andr=C3=A9 Apitzsch via B4 Rel=
ay
> > <devnull+git.apitzsch.eu@kernel.org> wrote:
> > >
> > > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > >
> > > Remove format and crop settings from register sequences and set
> > > them
> > > programmatically.
> > >
> > > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > ---
> > >  drivers/media/i2c/imx214.c | 129
> > > ++++++++++++++++++++++++++++++++++-----------
> > >  1 file changed, 97 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx214.c
> > > b/drivers/media/i2c/imx214.c
> > > index
> > > cb443d8bee6fe72dc9378b2c2d3caae09f8642c5..87a03e292e19ccd71f1b2dcee
> > > 3409826b2f5cb6f 100644
> > > --- a/drivers/media/i2c/imx214.c
> > > +++ b/drivers/media/i2c/imx214.c
> > > @@ -96,6 +96,9 @@
> > >  #define IMX214_REG_PREPLLCK_VT_DIV     CCI_REG8(0x0305)
> > >  #define IMX214_REG_PLL_VT_MPY          CCI_REG16(0x0306)
> > >  #define IMX214_REG_OPPXCK_DIV          CCI_REG8(0x0309)
> > > +#define IMX214_OPPXCK_DIV_COMP6                6
> > > +#define IMX214_OPPXCK_DIV_COMP8                8
> > > +#define IMX214_OPPXCK_DIV_RAW10                10
> > >  #define IMX214_REG_OPSYCK_DIV          CCI_REG8(0x030b)
> > >  #define IMX214_REG_PLL_MULT_DRIV       CCI_REG8(0x0310)
> > >  #define IMX214_PLL_SINGLE              0
> > > @@ -132,6 +135,9 @@
> > >  #define IMX214_BINNING_NONE            0
> > >  #define IMX214_BINNING_ENABLE          1
> > >  #define IMX214_REG_BINNING_TYPE                CCI_REG8(0x0901)
> > > +#define IMX214_BINNING_1X1             0
> > > +#define IMX214_BINNING_2X2             0x22
> > > +#define IMX214_BINNING_4X4             0x44
> > >  #define IMX214_REG_BINNING_WEIGHTING   CCI_REG8(0x0902)
> > >  #define IMX214_BINNING_AVERAGE         0x00
> > >  #define IMX214_BINNING_SUMMED          0x01
> > > @@ -211,36 +217,22 @@ static const struct cci_reg_sequence
> > > mode_4096x2304[] =3D {
> > >         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> > >         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH
> > > },
> > >         { IMX214_REG_EXPOSURE_RATIO, 1 },
> > > -       { IMX214_REG_X_ADD_STA, 56 },
> > > -       { IMX214_REG_Y_ADD_STA, 408 },
> > > -       { IMX214_REG_X_ADD_END, 4151 },
> > > -       { IMX214_REG_Y_ADD_END, 2711 },
> > >         { IMX214_REG_X_EVEN_INC, 1 },
> > >         { IMX214_REG_X_ODD_INC, 1 },
> > >         { IMX214_REG_Y_EVEN_INC, 1 },
> > >         { IMX214_REG_Y_ODD_INC, 1 },
> > > -       { IMX214_REG_BINNING_MODE, IMX214_BINNING_NONE },
> > > -       { IMX214_REG_BINNING_TYPE, 0 },
> > >         { IMX214_REG_BINNING_WEIGHTING, IMX214_BINNING_AVERAGE },
> > >         { CCI_REG8(0x3000), 0x35 },
> > >         { CCI_REG8(0x3054), 0x01 },
> > >         { CCI_REG8(0x305C), 0x11 },
> > >
> > > -       { IMX214_REG_CSI_DATA_FORMAT, IMX214_CSI_DATA_FORMAT_RAW10
> > > },
> > > -       { IMX214_REG_X_OUTPUT_SIZE, 4096 },
> > > -       { IMX214_REG_Y_OUTPUT_SIZE, 2304 },
> > >         { IMX214_REG_SCALE_MODE, IMX214_SCALE_NONE },
> > >         { IMX214_REG_SCALE_M, 2 },
> > > -       { IMX214_REG_DIG_CROP_X_OFFSET, 0 },
> > > -       { IMX214_REG_DIG_CROP_Y_OFFSET, 0 },
> > > -       { IMX214_REG_DIG_CROP_WIDTH, 4096 },
> > > -       { IMX214_REG_DIG_CROP_HEIGHT, 2304 },
> > >
> > >         { IMX214_REG_VTPXCK_DIV, 5 },
> > >         { IMX214_REG_VTSYCK_DIV, 2 },
> > >         { IMX214_REG_PREPLLCK_VT_DIV, 3 },
> > >         { IMX214_REG_PLL_VT_MPY, 150 },
> > > -       { IMX214_REG_OPPXCK_DIV, 10 },
> > >         { IMX214_REG_OPSYCK_DIV, 1 },
> > >         { IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
> > >
> > > @@ -281,36 +273,22 @@ static const struct cci_reg_sequence
> > > mode_1920x1080[] =3D {
> > >         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> > >         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH
> > > },
> > >         { IMX214_REG_EXPOSURE_RATIO, 1 },
> > > -       { IMX214_REG_X_ADD_STA, 1144 },
> > > -       { IMX214_REG_Y_ADD_STA, 1020 },
> > > -       { IMX214_REG_X_ADD_END, 3063 },
> > > -       { IMX214_REG_Y_ADD_END, 2099 },
> > >         { IMX214_REG_X_EVEN_INC, 1 },
> > >         { IMX214_REG_X_ODD_INC, 1 },
> > >         { IMX214_REG_Y_EVEN_INC, 1 },
> > >         { IMX214_REG_Y_ODD_INC, 1 },
> > > -       { IMX214_REG_BINNING_MODE, IMX214_BINNING_NONE },
> > > -       { IMX214_REG_BINNING_TYPE, 0 },
> > >         { IMX214_REG_BINNING_WEIGHTING, IMX214_BINNING_AVERAGE },
> > >         { CCI_REG8(0x3000), 0x35 },
> > >         { CCI_REG8(0x3054), 0x01 },
> > >         { CCI_REG8(0x305C), 0x11 },
> > >
> > > -       { IMX214_REG_CSI_DATA_FORMAT, IMX214_CSI_DATA_FORMAT_RAW10
> > > },
> > > -       { IMX214_REG_X_OUTPUT_SIZE, 1920 },
> > > -       { IMX214_REG_Y_OUTPUT_SIZE, 1080 },
> > >         { IMX214_REG_SCALE_MODE, IMX214_SCALE_NONE },
> > >         { IMX214_REG_SCALE_M, 2 },
> > > -       { IMX214_REG_DIG_CROP_X_OFFSET, 0 },
> > > -       { IMX214_REG_DIG_CROP_Y_OFFSET, 0 },
> > > -       { IMX214_REG_DIG_CROP_WIDTH, 1920 },
> > > -       { IMX214_REG_DIG_CROP_HEIGHT, 1080 },
> > >
> > >         { IMX214_REG_VTPXCK_DIV, 5 },
> > >         { IMX214_REG_VTSYCK_DIV, 2 },
> > >         { IMX214_REG_PREPLLCK_VT_DIV, 3 },
> > >         { IMX214_REG_PLL_VT_MPY, 150 },
> > > -       { IMX214_REG_OPPXCK_DIV, 10 },
> > >         { IMX214_REG_OPSYCK_DIV, 1 },
> > >         { IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
> > >
> > > @@ -623,6 +601,7 @@ static int imx214_set_format(struct v4l2_subdev
> > > *sd,
> > >         struct v4l2_mbus_framefmt *__format;
> > >         struct v4l2_rect *__crop;
> > >         const struct imx214_mode *mode;
> > > +       unsigned int bin_h, bin_v, bin;
> > >
> > >         mode =3D v4l2_find_nearest_size(imx214_modes,
> > >                                       ARRAY_SIZE(imx214_modes),
> > > width, height,
> > > @@ -637,9 +616,32 @@ static int imx214_set_format(struct
> > > v4l2_subdev *sd,
> > >
> > >         *__format =3D format->format;
> > >
> > > +       /*
> > > +        * Use binning to maximize the crop rectangle size, and
> > > centre it in the
> > > +        * sensor.
> > > +        */
> > > +       bin_h =3D IMX214_PIXEL_ARRAY_WIDTH / __format->width;
> > > +       bin_v =3D IMX214_PIXEL_ARRAY_HEIGHT / __format->height;
> > > +
> > > +       switch (min(bin_h, bin_v)) {
> > > +       case 1:
> > > +               bin =3D 1;
> > > +               break;
> > > +       case 2:
> > > +       case 3:
> > > +               bin =3D 2;
> > > +               break;
> > > +       case 4:
> > > +       default:
> > > +               bin =3D 4;
> > > +               break;
> > > +       }
> > > +
> > >         __crop =3D v4l2_subdev_state_get_crop(sd_state, 0);
> > > -       __crop->width =3D mode->width;
> > > -       __crop->height =3D mode->height;
> > > +       __crop->width =3D __format->width * bin;
> > > +       __crop->height =3D __format->height * bin;
> > > +       __crop->left =3D (IMX214_NATIVE_WIDTH - __crop->width) / 2;
> > > +       __crop->top =3D (IMX214_NATIVE_HEIGHT - __crop->height) / 2;
> > >
> > >         if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > >                 int exposure_max;
> > > @@ -847,7 +849,62 @@ static int imx214_ctrls_init(struct imx214
> > > *imx214)
> > >         return 0;
> > >  };
> > >
> > > -static int imx214_start_streaming(struct imx214 *imx214)
> > > +static int imx214_set_framefmt(struct imx214 *imx214,
> > > +                              struct v4l2_subdev_state *state)
> > > +{
> > > +       const struct v4l2_mbus_framefmt *format;
> > > +       const struct v4l2_rect *crop;
> > > +       u64 bin_mode;
> > > +       u64 bin_type;
> > > +       int ret =3D 0;
> > > +
> > > +       format =3D v4l2_subdev_state_get_format(state, 0);
> > > +       crop =3D v4l2_subdev_state_get_crop(state, 0);
> > > +
> > > +       cci_write(imx214->regmap, IMX214_REG_X_ADD_STA,
> > > +                 crop->left - IMX214_PIXEL_ARRAY_LEFT, &ret);
> > > +       cci_write(imx214->regmap, IMX214_REG_X_ADD_END,
> > > +                 crop->left - IMX214_PIXEL_ARRAY_LEFT + crop-
> > > >width - 1, &ret);
> > > +       cci_write(imx214->regmap, IMX214_REG_Y_ADD_STA,
> > > +                 crop->top - IMX214_PIXEL_ARRAY_TOP, &ret);
> > > +       cci_write(imx214->regmap, IMX214_REG_Y_ADD_END,
> > > +                 crop->top - IMX214_PIXEL_ARRAY_TOP + crop->height
> > > - 1, &ret);
> > > +
> > > +       /* Proper setting is required even if cropping is not used
> > > */
> > > +       cci_write(imx214->regmap, IMX214_REG_DIG_CROP_WIDTH, crop-
> > > >width, &ret);
> > > +       cci_write(imx214->regmap, IMX214_REG_DIG_CROP_HEIGHT, crop-
> > > >height, &ret);
> > > +
> > > +       switch (crop->width / format->width) {
> > > +       case 1:
> > > +       default:
> > nit: It feels weird that default is not the last case.  Can you move
> > it to the bottom?
> > > +               bin_mode =3D IMX214_BINNING_NONE;
> > > +               bin_type =3D IMX214_BINNING_1X1;
> > > +               break;
> > > +       case 2:
> > > +               bin_mode =3D IMX214_BINNING_ENABLE;
> > > +               bin_type =3D IMX214_BINNING_2X2;
> > > +               break;
> > > +       case 4:
> > > +               bin_mode =3D IMX214_BINNING_ENABLE;
> > > +               bin_type =3D IMX214_BINNING_4X4;
> > > +               break;
> > > +       }
> > > +
> > > +       cci_write(imx214->regmap, IMX214_REG_BINNING_MODE,
> > > bin_mode, &ret);
> > > +       cci_write(imx214->regmap, IMX214_REG_BINNING_TYPE,
> > > bin_type, &ret);
> > > +
> > > +       cci_write(imx214->regmap, IMX214_REG_X_OUTPUT_SIZE, format-
> > > >width, &ret);
> > > +       cci_write(imx214->regmap, IMX214_REG_Y_OUTPUT_SIZE, format-
> > > >height, &ret);
> > > +
> > > +       cci_write(imx214->regmap, IMX214_REG_CSI_DATA_FORMAT,
> > > +                 IMX214_CSI_DATA_FORMAT_RAW10, &ret);
> > > +       cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV,
> > > IMX214_OPPXCK_DIV_RAW10, &ret);
> > > +
> > > +       return ret;
> > > +};
> > > +
> > > +static int imx214_start_streaming(struct imx214 *imx214,
> > > +                                 struct v4l2_subdev_state *state)
> > >  {
> > >         int ret;
> > >
> > > @@ -865,6 +922,14 @@ static int imx214_start_streaming(struct
> > > imx214 *imx214)
> > >                 return ret;
> > >         }
> > >
> > > +       /* Apply format and crop settings */
> > > +       ret =3D imx214_set_framefmt(imx214, state);
> > > +       if (ret) {
> > > +               dev_err(imx214->dev, "%s failed to set frame
> > > format: %d\n",
> > > +                       __func__, ret);
> > > +               return ret;
> > > +       }
> > > +
> > >         ret =3D cci_multi_reg_write(imx214->regmap, imx214->cur_mode-
> > > >reg_table,
> > >                                   imx214->cur_mode->num_of_regs,
> > > NULL);
> > >         if (ret < 0) {
> > > @@ -913,7 +978,7 @@ static int imx214_s_stream(struct v4l2_subdev
> > > *subdev, int enable)
> > >                         return ret;
> > >
> > >                 state =3D
> > > v4l2_subdev_lock_and_get_active_state(subdev);
> > > -               ret =3D imx214_start_streaming(imx214);
> > > +               ret =3D imx214_start_streaming(imx214, state);
> > >                 v4l2_subdev_unlock_state(state);
> > >                 if (ret < 0)
> > >                         goto err_rpm_put;
> > >
> > > --
> > > 2.47.0
> > >
> > >
>


Return-Path: <linux-media+bounces-20590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F939B62B1
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 13:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B1B2B23652
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 12:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EB91E882F;
	Wed, 30 Oct 2024 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdH3+t84"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415751E907F;
	Wed, 30 Oct 2024 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290263; cv=none; b=qeKzlX72Svi44WDHUdr/XgU1xNzqbo5aQpl1NYIcyyAW66bugLGRzKrFImM9c+wEp+l9i6yC4sjGOC/iQjvGi1vI6DvfBLPB4FwaAtJLOUiEEdK4qxRjunE6k4hDNm70u5lWy9QTgisOzIkHixyKNKP96mOrdlun+fh87Fypc0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290263; c=relaxed/simple;
	bh=93GGVlY8WfKpg82tIXUwEI0/LPN/7l4klpf1Kt3f7vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S1fTtRwJObCJtes8DsL0Zl0V5fQK5ZMfL4mtkWBG76asNJKy8qYEV/LX/fDYPwpjwv4/O9dDVtHsVJrtvI1NuEjE1fbXL0F0muYCZmg+py6DmebXBvmbtVGBWNrKJTnOCJOqFDY7G07ZVjjJaDEBtqAbZ40lEe/1ISKbmuLDB4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdH3+t84; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89A3C4AF09;
	Wed, 30 Oct 2024 12:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730290262;
	bh=93GGVlY8WfKpg82tIXUwEI0/LPN/7l4klpf1Kt3f7vs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DdH3+t84Hi+oPE0s+b+KORYSq5AIA7SStrz7Fy7rcqDgguA0BTbRYqwc2l+2rl+CR
	 8STsvRVWKviUMG/vAiv0uXo/PC/PN12+wozjqRsiAweY5/+BpM41Wf8Tc+2GQArCaT
	 nWKkxy5uXhYQainf5/s8j7NkSGvs2d1gw+bvkdgsA16YC6N3hUvDxOe/fUfLbZOrZg
	 rZ4JvZG99Pltez8fD29Hfm//FvR3AYVpZsM724y5wMeeZ+ok+jT1dhP/qV/17Sd9aH
	 IiO+svEQzGnPurTl/hIo0+spHuGDF36XaEa2rvCDHTgWgjXNznzbfJJTD+86RYcYqq
	 Rhg4HPomtgwug==
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7180dc76075so3380401a34.3;
        Wed, 30 Oct 2024 05:11:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBchQioMjbrVDJRvxIkXdxqvhgn2J7W8O4b7+MDnoFq24/0XoQarz5rrPcpiEiJwN/BFd4dKFGRjIZsSQ=@vger.kernel.org, AJvYcCXLHwCHkWAvLdWH+OFTKXkqUpByKRG/ba7kH8AK6I6xDdCy9qrlt7AI+WI6sV8SVLsgWx9c/0xx4cyx8CQ=@vger.kernel.org, AJvYcCXiApgV4VE2/exTI6n1f0dEgqHlTuOa6gBlD3a4goMjSE/Tw2ZEBFsjkitRp5EpQ4KjygSFeafaJFIBRN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrU/yTRK99YvbUZfpElj+B8OYEJCLACnfZ5gq3SVqrtTjluKM+
	wXmX71RIRsUVVYnI4v89yMTIvPvjWXnvRcMBI4R6an48EsnqCtRka7anAi8kFso1E2eclzCPWJy
	yY06SA3ojUi8jT7r2oEHBCsLvwSQ=
X-Google-Smtp-Source: AGHT+IHaOiX+PXwz9TTKBY+bGbL3qHvt2lka+8QTsZA8OISTaPAvHyD6co4oolmWCX53UCwn6Ix/w+szw8dVPFSI88Y=
X-Received: by 2002:a05:6830:6e06:b0:710:e61c:7a4c with SMTP id
 46e09a7af769-718682a1369mr14946436a34.29.1730290262062; Wed, 30 Oct 2024
 05:11:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu> <20241021-imx214-v2-9-fbd23e99541e@apitzsch.eu>
In-Reply-To: <20241021-imx214-v2-9-fbd23e99541e@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Wed, 30 Oct 2024 13:10:44 +0100
X-Gmail-Original-Message-ID: <CAPybu_09-1E4+Xe1Tnaue01i4JPtOHz15OUei=4q=Roqcuoz2Q@mail.gmail.com>
Message-ID: <CAPybu_09-1E4+Xe1Tnaue01i4JPtOHz15OUei=4q=Roqcuoz2Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] media: i2c: imx214: Extract format and crop settings
To: git@apitzsch.eu
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Aren't you changing the binning mode for 1920x1080  with this patch? I
think that could be considered an ABI change.

Also, if we are not letting the user change the value, I do not see
much value in setting the cropping programmatically, I'd rather not
take this change.

On Mon, Oct 21, 2024 at 12:14=E2=80=AFAM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> Remove format and crop settings from register sequences and set them
> programmatically.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 129 ++++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 97 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index cb443d8bee6fe72dc9378b2c2d3caae09f8642c5..87a03e292e19ccd71f1b2dcee=
3409826b2f5cb6f 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -96,6 +96,9 @@
>  #define IMX214_REG_PREPLLCK_VT_DIV     CCI_REG8(0x0305)
>  #define IMX214_REG_PLL_VT_MPY          CCI_REG16(0x0306)
>  #define IMX214_REG_OPPXCK_DIV          CCI_REG8(0x0309)
> +#define IMX214_OPPXCK_DIV_COMP6                6
> +#define IMX214_OPPXCK_DIV_COMP8                8
> +#define IMX214_OPPXCK_DIV_RAW10                10
>  #define IMX214_REG_OPSYCK_DIV          CCI_REG8(0x030b)
>  #define IMX214_REG_PLL_MULT_DRIV       CCI_REG8(0x0310)
>  #define IMX214_PLL_SINGLE              0
> @@ -132,6 +135,9 @@
>  #define IMX214_BINNING_NONE            0
>  #define IMX214_BINNING_ENABLE          1
>  #define IMX214_REG_BINNING_TYPE                CCI_REG8(0x0901)
> +#define IMX214_BINNING_1X1             0
> +#define IMX214_BINNING_2X2             0x22
> +#define IMX214_BINNING_4X4             0x44
>  #define IMX214_REG_BINNING_WEIGHTING   CCI_REG8(0x0902)
>  #define IMX214_BINNING_AVERAGE         0x00
>  #define IMX214_BINNING_SUMMED          0x01
> @@ -211,36 +217,22 @@ static const struct cci_reg_sequence mode_4096x2304=
[] =3D {
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> -       { IMX214_REG_X_ADD_STA, 56 },
> -       { IMX214_REG_Y_ADD_STA, 408 },
> -       { IMX214_REG_X_ADD_END, 4151 },
> -       { IMX214_REG_Y_ADD_END, 2711 },
>         { IMX214_REG_X_EVEN_INC, 1 },
>         { IMX214_REG_X_ODD_INC, 1 },
>         { IMX214_REG_Y_EVEN_INC, 1 },
>         { IMX214_REG_Y_ODD_INC, 1 },
> -       { IMX214_REG_BINNING_MODE, IMX214_BINNING_NONE },
> -       { IMX214_REG_BINNING_TYPE, 0 },
>         { IMX214_REG_BINNING_WEIGHTING, IMX214_BINNING_AVERAGE },
>         { CCI_REG8(0x3000), 0x35 },
>         { CCI_REG8(0x3054), 0x01 },
>         { CCI_REG8(0x305C), 0x11 },
>
> -       { IMX214_REG_CSI_DATA_FORMAT, IMX214_CSI_DATA_FORMAT_RAW10 },
> -       { IMX214_REG_X_OUTPUT_SIZE, 4096 },
> -       { IMX214_REG_Y_OUTPUT_SIZE, 2304 },
>         { IMX214_REG_SCALE_MODE, IMX214_SCALE_NONE },
>         { IMX214_REG_SCALE_M, 2 },
> -       { IMX214_REG_DIG_CROP_X_OFFSET, 0 },
> -       { IMX214_REG_DIG_CROP_Y_OFFSET, 0 },
> -       { IMX214_REG_DIG_CROP_WIDTH, 4096 },
> -       { IMX214_REG_DIG_CROP_HEIGHT, 2304 },
>
>         { IMX214_REG_VTPXCK_DIV, 5 },
>         { IMX214_REG_VTSYCK_DIV, 2 },
>         { IMX214_REG_PREPLLCK_VT_DIV, 3 },
>         { IMX214_REG_PLL_VT_MPY, 150 },
> -       { IMX214_REG_OPPXCK_DIV, 10 },
>         { IMX214_REG_OPSYCK_DIV, 1 },
>         { IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
>
> @@ -281,36 +273,22 @@ static const struct cci_reg_sequence mode_1920x1080=
[] =3D {
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> -       { IMX214_REG_X_ADD_STA, 1144 },
> -       { IMX214_REG_Y_ADD_STA, 1020 },
> -       { IMX214_REG_X_ADD_END, 3063 },
> -       { IMX214_REG_Y_ADD_END, 2099 },
>         { IMX214_REG_X_EVEN_INC, 1 },
>         { IMX214_REG_X_ODD_INC, 1 },
>         { IMX214_REG_Y_EVEN_INC, 1 },
>         { IMX214_REG_Y_ODD_INC, 1 },
> -       { IMX214_REG_BINNING_MODE, IMX214_BINNING_NONE },
> -       { IMX214_REG_BINNING_TYPE, 0 },
>         { IMX214_REG_BINNING_WEIGHTING, IMX214_BINNING_AVERAGE },
>         { CCI_REG8(0x3000), 0x35 },
>         { CCI_REG8(0x3054), 0x01 },
>         { CCI_REG8(0x305C), 0x11 },
>
> -       { IMX214_REG_CSI_DATA_FORMAT, IMX214_CSI_DATA_FORMAT_RAW10 },
> -       { IMX214_REG_X_OUTPUT_SIZE, 1920 },
> -       { IMX214_REG_Y_OUTPUT_SIZE, 1080 },
>         { IMX214_REG_SCALE_MODE, IMX214_SCALE_NONE },
>         { IMX214_REG_SCALE_M, 2 },
> -       { IMX214_REG_DIG_CROP_X_OFFSET, 0 },
> -       { IMX214_REG_DIG_CROP_Y_OFFSET, 0 },
> -       { IMX214_REG_DIG_CROP_WIDTH, 1920 },
> -       { IMX214_REG_DIG_CROP_HEIGHT, 1080 },
>
>         { IMX214_REG_VTPXCK_DIV, 5 },
>         { IMX214_REG_VTSYCK_DIV, 2 },
>         { IMX214_REG_PREPLLCK_VT_DIV, 3 },
>         { IMX214_REG_PLL_VT_MPY, 150 },
> -       { IMX214_REG_OPPXCK_DIV, 10 },
>         { IMX214_REG_OPSYCK_DIV, 1 },
>         { IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
>
> @@ -623,6 +601,7 @@ static int imx214_set_format(struct v4l2_subdev *sd,
>         struct v4l2_mbus_framefmt *__format;
>         struct v4l2_rect *__crop;
>         const struct imx214_mode *mode;
> +       unsigned int bin_h, bin_v, bin;
>
>         mode =3D v4l2_find_nearest_size(imx214_modes,
>                                       ARRAY_SIZE(imx214_modes), width, he=
ight,
> @@ -637,9 +616,32 @@ static int imx214_set_format(struct v4l2_subdev *sd,
>
>         *__format =3D format->format;
>
> +       /*
> +        * Use binning to maximize the crop rectangle size, and centre it=
 in the
> +        * sensor.
> +        */
> +       bin_h =3D IMX214_PIXEL_ARRAY_WIDTH / __format->width;
> +       bin_v =3D IMX214_PIXEL_ARRAY_HEIGHT / __format->height;
> +
> +       switch (min(bin_h, bin_v)) {
> +       case 1:
> +               bin =3D 1;
> +               break;
> +       case 2:
> +       case 3:
> +               bin =3D 2;
> +               break;
> +       case 4:
> +       default:
> +               bin =3D 4;
> +               break;
> +       }
> +
>         __crop =3D v4l2_subdev_state_get_crop(sd_state, 0);
> -       __crop->width =3D mode->width;
> -       __crop->height =3D mode->height;
> +       __crop->width =3D __format->width * bin;
> +       __crop->height =3D __format->height * bin;
> +       __crop->left =3D (IMX214_NATIVE_WIDTH - __crop->width) / 2;
> +       __crop->top =3D (IMX214_NATIVE_HEIGHT - __crop->height) / 2;
>
>         if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
>                 int exposure_max;
> @@ -847,7 +849,62 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>         return 0;
>  };
>
> -static int imx214_start_streaming(struct imx214 *imx214)
> +static int imx214_set_framefmt(struct imx214 *imx214,
> +                              struct v4l2_subdev_state *state)
> +{
> +       const struct v4l2_mbus_framefmt *format;
> +       const struct v4l2_rect *crop;
> +       u64 bin_mode;
> +       u64 bin_type;
> +       int ret =3D 0;
> +
> +       format =3D v4l2_subdev_state_get_format(state, 0);
> +       crop =3D v4l2_subdev_state_get_crop(state, 0);
> +
> +       cci_write(imx214->regmap, IMX214_REG_X_ADD_STA,
> +                 crop->left - IMX214_PIXEL_ARRAY_LEFT, &ret);
> +       cci_write(imx214->regmap, IMX214_REG_X_ADD_END,
> +                 crop->left - IMX214_PIXEL_ARRAY_LEFT + crop->width - 1,=
 &ret);
> +       cci_write(imx214->regmap, IMX214_REG_Y_ADD_STA,
> +                 crop->top - IMX214_PIXEL_ARRAY_TOP, &ret);
> +       cci_write(imx214->regmap, IMX214_REG_Y_ADD_END,
> +                 crop->top - IMX214_PIXEL_ARRAY_TOP + crop->height - 1, =
&ret);
> +
> +       /* Proper setting is required even if cropping is not used */
> +       cci_write(imx214->regmap, IMX214_REG_DIG_CROP_WIDTH, crop->width,=
 &ret);
> +       cci_write(imx214->regmap, IMX214_REG_DIG_CROP_HEIGHT, crop->heigh=
t, &ret);
> +
> +       switch (crop->width / format->width) {
> +       case 1:
> +       default:
nit: It feels weird that default is not the last case.  Can you move
it to the bottom?
> +               bin_mode =3D IMX214_BINNING_NONE;
> +               bin_type =3D IMX214_BINNING_1X1;
> +               break;
> +       case 2:
> +               bin_mode =3D IMX214_BINNING_ENABLE;
> +               bin_type =3D IMX214_BINNING_2X2;
> +               break;
> +       case 4:
> +               bin_mode =3D IMX214_BINNING_ENABLE;
> +               bin_type =3D IMX214_BINNING_4X4;
> +               break;
> +       }
> +
> +       cci_write(imx214->regmap, IMX214_REG_BINNING_MODE, bin_mode, &ret=
);
> +       cci_write(imx214->regmap, IMX214_REG_BINNING_TYPE, bin_type, &ret=
);
> +
> +       cci_write(imx214->regmap, IMX214_REG_X_OUTPUT_SIZE, format->width=
, &ret);
> +       cci_write(imx214->regmap, IMX214_REG_Y_OUTPUT_SIZE, format->heigh=
t, &ret);
> +
> +       cci_write(imx214->regmap, IMX214_REG_CSI_DATA_FORMAT,
> +                 IMX214_CSI_DATA_FORMAT_RAW10, &ret);
> +       cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV, IMX214_OPPXCK_DI=
V_RAW10, &ret);
> +
> +       return ret;
> +};
> +
> +static int imx214_start_streaming(struct imx214 *imx214,
> +                                 struct v4l2_subdev_state *state)
>  {
>         int ret;
>
> @@ -865,6 +922,14 @@ static int imx214_start_streaming(struct imx214 *imx=
214)
>                 return ret;
>         }
>
> +       /* Apply format and crop settings */
> +       ret =3D imx214_set_framefmt(imx214, state);
> +       if (ret) {
> +               dev_err(imx214->dev, "%s failed to set frame format: %d\n=
",
> +                       __func__, ret);
> +               return ret;
> +       }
> +
>         ret =3D cci_multi_reg_write(imx214->regmap, imx214->cur_mode->reg=
_table,
>                                   imx214->cur_mode->num_of_regs, NULL);
>         if (ret < 0) {
> @@ -913,7 +978,7 @@ static int imx214_s_stream(struct v4l2_subdev *subdev=
, int enable)
>                         return ret;
>
>                 state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> -               ret =3D imx214_start_streaming(imx214);
> +               ret =3D imx214_start_streaming(imx214, state);
>                 v4l2_subdev_unlock_state(state);
>                 if (ret < 0)
>                         goto err_rpm_put;
>
> --
> 2.47.0
>
>


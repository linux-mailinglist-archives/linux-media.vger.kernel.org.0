Return-Path: <linux-media+bounces-18206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D006B976AF0
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D1FF1F26ABC
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8AC1B985C;
	Thu, 12 Sep 2024 13:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9xBTjPm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE9A1AD27C;
	Thu, 12 Sep 2024 13:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148428; cv=none; b=enW0poGisleiIWZEooxjGmDXZ+mFZfU5m2LGG4U5EfgyGoLluhuL3ly1UHhJLm8kZBvffIBPEF6Sbg0n8CxCYOkP98DZn36kQo2OL0JlYEs6wScPUo8D57CoMQ19u+mSpMmIDwYBDC3t+8NUfqBQQHfHu9Zb8zyeTdox/V5oke8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148428; c=relaxed/simple;
	bh=UYcCNDvfGDEwah5pYU6DOvL/cNy6dgV53NV63bb5nHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijoHm9HrFal7un2hrJq/IV0VItAGZp7YCl+Cmv7Ae3DO0GvBLgIdgllPpQYhSrkp5oqozk3aAq7vfrKwqz/9+9EC5bSnqLCYT8aaH2Vot3AnV7QSRaq3ztvi1hg60qtmH3+iFqPxJzMU/TPHkJ0VeLSAYYFIyIb+DpsAU0kRopQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9xBTjPm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADB6C4AF09;
	Thu, 12 Sep 2024 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726148427;
	bh=UYcCNDvfGDEwah5pYU6DOvL/cNy6dgV53NV63bb5nHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j9xBTjPmBipb65qRddZaghI8AaRLSV31siEX+OHL4F8QLyfkkr57MOPgAsIAOG2F3
	 KOKUGHA+aAK1wdqPM4BX+dJAAxFK8GbSqtkUxYhT2OXsahjBfSdFzu9TSRyQnXiqb9
	 sjpGZDC7VByAmCXG0G1Oj5gUCr5QjxKHxTikFunSv2EBCAKQauvXWMrlEHDs5+UAgU
	 cSpd76eNQqKEpOUnoTfk6+8+SFEAQPcMnL80pSPgBjx/g36UmXlilt2PoyuRh5H6Q7
	 Fq18Q01ywGV9YabS3AaD8Y3IbiX2QzWtjgNdUJXEvOMMAA2XnkCR6RsDb5ZktbacOs
	 9RQKl2JRqvYpQ==
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5dcd8403656so470338eaf.1;
        Thu, 12 Sep 2024 06:40:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpq+fri+z9QYfSDuML4IFEXFsXTW8EJTpeXpMmW2GTnTUENBwWAA2eY9MjKL5McCBObb04Z7kNy6KK8p8=@vger.kernel.org, AJvYcCWqFmVYcRLehmwYBoMbHObYj+x7D4T9SluRU2czJuXT1G1rrKHs4G16dqHkcWsi4fHba0kZEl/QdJGyPK8=@vger.kernel.org, AJvYcCXcepx4wmUODg/Zb6vINcAIwUDxx5TSGLEt6p6BrBg5q/5VLakAO8rZv2vuFf22DXVlfzUauEpJjSE4s+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIZczWvgfcAP+yE9yz+qVV1poDKVHRIVDQo35gF8FbOKA4LEE4
	kL+ozgRNu3QjicFZmCwlepi2qzbzAJoVqgIl/WQyBoUd1T01o39ZxHhloYOkt3QoAESxJxHhtjm
	6c41TsUe+EomIEdz2GdlSV1nd6KM=
X-Google-Smtp-Source: AGHT+IEw5A8RLuENZ3oEZFqEeUEDo5gdx1BZ6cOL7x5/n+AyMGtkPvvS4TByFYTiq+oEOR5ZNH63aQtNyV+lJodtmiY=
X-Received: by 2002:a05:6358:6184:b0:1b5:f81c:875f with SMTP id
 e5c5f4694b2df-1bb14dc25damr132246255d.5.1726148426807; Thu, 12 Sep 2024
 06:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu> <20240902-imx214-v1-9-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-9-c96cba989315@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 12 Sep 2024 15:40:09 +0200
X-Gmail-Original-Message-ID: <CAPybu_0CMNsmtT=CtbMUjwTR1oNkihbCNRg-_JkkyOJgHQz_1Q@mail.gmail.com>
Message-ID: <CAPybu_0CMNsmtT=CtbMUjwTR1oNkihbCNRg-_JkkyOJgHQz_1Q@mail.gmail.com>
Subject: Re: [PATCH 09/13] media: i2c: imx214: Extract format and crop settings
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 11:54=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> Remove format and crop settings from register sequences and set them
> programmatically.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 137 ++++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 105 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 9f5a57aebb86..733f55257585 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -132,6 +132,9 @@
>  #define IMX214_BINNING_NONE            0
>  #define IMX214_BINNING_ENABLE          1
>  #define IMX214_REG_BINNING_TYPE                CCI_REG8(0x0901)
> +#define IMX214_BINNING_1X1             0
> +#define IMX214_BINNING_2X2             0x22
> +#define IMX214_BINNING_4X4             0x44
>  #define IMX214_REG_BINNING_WEIGHTING   CCI_REG8(0x0902)
>  #define IMX214_BINNING_AVERAGE         0x00
>  #define IMX214_BINNING_SUMMED          0x01
> @@ -214,36 +217,22 @@ static const struct cci_reg_sequence mode_4096x2304=
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
> @@ -284,36 +273,22 @@ static const struct cci_reg_sequence mode_1920x1080=
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
> @@ -626,6 +601,7 @@ static int imx214_set_format(struct v4l2_subdev *sd,
>         struct v4l2_mbus_framefmt *__format;
>         struct v4l2_rect *__crop;
>         const struct imx214_mode *mode;
> +       unsigned int bin_h, bin_v, bin;
>
>         mode =3D v4l2_find_nearest_size(imx214_modes,
>                                       ARRAY_SIZE(imx214_modes), width, he=
ight,
> @@ -637,9 +613,32 @@ static int imx214_set_format(struct v4l2_subdev *sd,
>         __format =3D v4l2_subdev_state_get_format(sd_state, 0);
>         *__format =3D format->format;
>
> +       /*
> +        * Use binning to maximize the crop rectangle size, and centre it=
 in the
> +        * sensor.
> +        */

We only support two modes. Wouldn't it be easier to add a new
"binning" field to imx124_mode?

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
> @@ -845,6 +844,71 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>         return 0;
>  };
>
> +static int imx214_set_framefmt(struct imx214 *imx214,
> +                              struct v4l2_subdev_state *state)
> +{
> +       const struct v4l2_mbus_framefmt *format;
> +       const struct v4l2_rect *crop;
> +       unsigned int bpp;
> +       u64 bin_mode;
> +       u64 bin_type;
> +       int ret =3D 0;
> +
> +       format =3D v4l2_subdev_state_get_format(state, 0);
> +       crop =3D v4l2_subdev_state_get_crop(state, 0);
> +

This code does not do anything, bpp is always 10.
We can remove the switch and setting IMX214_REG_CSI_DATA_FORMAT
 IMX214_REG_OPPXCK_DIV programmatically


> +       switch (format->code) {
> +       case MEDIA_BUS_FMT_SRGGB10_1X10:
> +       case MEDIA_BUS_FMT_SGRBG10_1X10:
> +       case MEDIA_BUS_FMT_SGBRG10_1X10:
> +       case MEDIA_BUS_FMT_SBGGR10_1X10:
> +       default:
> +               bpp =3D 10;
> +               break;
> +       }



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
> +                 (bpp << 8) | bpp, &ret);
> +       cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV, bpp, &ret);
> +
> +       return ret;
> +};
> +
>  static int imx214_configure_lanes(struct imx214 *imx214)
>  {
>         return cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
> @@ -852,7 +916,8 @@ static int imx214_configure_lanes(struct imx214 *imx2=
14)
>                          IMX214_CSI_4_LANE_MODE, NULL);
>  };
>
> -static int imx214_start_streaming(struct imx214 *imx214)
> +static int imx214_start_streaming(struct imx214 *imx214,
> +                                 struct v4l2_subdev_state *state)
>  {
>         const struct imx214_mode *mode;
>         int ret;
> @@ -871,6 +936,14 @@ static int imx214_start_streaming(struct imx214 *imx=
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
>         mode =3D v4l2_find_nearest_size(imx214_modes,
>                                 ARRAY_SIZE(imx214_modes), width, height,
>                                 imx214->fmt.width, imx214->fmt.height);
> @@ -922,7 +995,7 @@ static int imx214_s_stream(struct v4l2_subdev *subdev=
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
> 2.46.0
>
>
>


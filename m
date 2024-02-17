Return-Path: <linux-media+bounces-5353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D348590AC
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 16:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FDA11C212FC
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 15:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D857C6E7;
	Sat, 17 Feb 2024 15:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bT4PF88P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93FE7A726
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 15:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708184952; cv=none; b=TFgJOOFUYfOpTP6GaUo75+LpWWnRHSnefhOuzSuTwgLzdbA4jCBbq/CkwfA72nHxsV67WjcVkTJUs07mn9vvKjAhZZ9tNh2dPG0Z9uJQIE85EgrCFk4VEROl8RU2UDFnyfU5uOeJAWdbXh7um0+NMO4Vy4Q4exrNXUdoCW0+FJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708184952; c=relaxed/simple;
	bh=Nr8PFoRJsdW7NnwLobtAjv9FmD1cR4TDBWOyfSDscLo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=V26S8+5aZvfl8+VfuHbIFgxGg49Jvl5mdvle+g0qDYEUsUS8C9uGRj8ETMPt/+OqAE2PP3198znHj67VBdyhSaBVr5eeqY80zK1fmZBSobOmwaT4MClUl2Tu68Fx2npfocK6qBedJF3jJLCMnzNJWTxX/IbbxhLk2I0Y+V0NcMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bT4PF88P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 246F76B3;
	Sat, 17 Feb 2024 16:49:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708184944;
	bh=Nr8PFoRJsdW7NnwLobtAjv9FmD1cR4TDBWOyfSDscLo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bT4PF88PN6xSk4ueHKFk2eJGqeg40O2GD/hZjO1x5DCJUlr5vjMCZFb4knaNzPocA
	 lYhY+3LsacgQoMYU6fePQ/A9TzxbC0/FWlF3roeKY0diu4smklTjz9Lbf9hsysw1sf
	 UTAOHNFAtVqJ5PfbMBTnnohm62/zezNnQNPxJQsM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240216223237.326523-4-hdegoede@redhat.com>
References: <20240216223237.326523-1-hdegoede@redhat.com> <20240216223237.326523-4-hdegoede@redhat.com>
Subject: Re: [PATCH 3/5] media: ov2680: Add vblank control
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 Feb 2024 15:49:06 +0000
Message-ID: <170818494641.1206667.1027318453758690422@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-02-16 22:32:35)
> Add vblank control to allow changing the framerate /
> higher exposure values.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2680.c | 47 ++++++++++++++++++++++++++++++++------
>  1 file changed, 40 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index b4d5936dcd02..4c9db83d876e 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -75,6 +75,8 @@
>  #define OV2680_ACTIVE_START_TOP                        8
>  #define OV2680_MIN_CROP_WIDTH                  2
>  #define OV2680_MIN_CROP_HEIGHT                 2
> +#define OV2680_MIN_VBLANK                      4
> +#define OV2680_MAX_VBLANK                      0xffff
> =20
>  /* Fixed pre-div of 1/2 */
>  #define OV2680_PLL_PREDIV0                     2
> @@ -84,7 +86,7 @@
> =20
>  /* 66MHz pixel clock: 66MHz / 1704 * 1294 =3D 30fps */
>  #define OV2680_PIXELS_PER_LINE                 1704
> -#define OV2680_LINES_PER_FRAME                 1294
> +#define OV2680_LINES_PER_FRAME_30FPS           1294

I can definitely foresee some core sensor helpers to handle all the
calculations for things like this as parameters rather than static data
to support when changes and features are extended in drivers like
supporting different link frequencies - but for now ACK here.

>  /* Max exposure time is VTS - 8 */
>  #define OV2680_INTEGRATION_TIME_MARGIN         8
> @@ -127,6 +129,7 @@ struct ov2680_ctrls {
>         struct v4l2_ctrl *test_pattern;
>         struct v4l2_ctrl *link_freq;
>         struct v4l2_ctrl *pixel_rate;
> +       struct v4l2_ctrl *vblank;
>  };
> =20
>  struct ov2680_mode {
> @@ -394,8 +397,7 @@ static int ov2680_set_mode(struct ov2680_dev *sensor)
>                   sensor->mode.v_output_size, &ret);
>         cci_write(sensor->regmap, OV2680_REG_TIMING_HTS,
>                   OV2680_PIXELS_PER_LINE, &ret);
> -       cci_write(sensor->regmap, OV2680_REG_TIMING_VTS,
> -                 OV2680_LINES_PER_FRAME, &ret);
> +       /* VTS gets set by the vblank ctrl */
>         cci_write(sensor->regmap, OV2680_REG_ISP_X_WIN, 0, &ret);
>         cci_write(sensor->regmap, OV2680_REG_ISP_Y_WIN, 0, &ret);
>         cci_write(sensor->regmap, OV2680_REG_X_INC, inc, &ret);
> @@ -469,6 +471,15 @@ static int ov2680_exposure_set(struct ov2680_dev *se=
nsor, u32 exp)
>                          NULL);
>  }
> =20
> +static void ov2680_exposure_update_range(struct ov2680_dev *sensor)
> +{

Reading here for the first time, I almost would have needed the comment=20

  /* Max exposure time is VTS - 8 */

to be here. Fortunately, it was in the context of this patch above so I
could see it.


> +       int exp_max =3D sensor->mode.fmt.height + sensor->ctrls.vblank->v=
al -
> +                     OV2680_INTEGRATION_TIME_MARGIN;
> +
> +       __v4l2_ctrl_modify_range(sensor->ctrls.exposure, 0, exp_max,
> +                                1, exp_max);
> +}
> +
>  static int ov2680_stream_enable(struct ov2680_dev *sensor)
>  {
>         int ret;
> @@ -635,7 +646,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>         struct v4l2_mbus_framefmt *try_fmt;
>         const struct v4l2_rect *crop;
>         unsigned int width, height;
> -       int ret =3D 0;
> +       int def, max, ret =3D 0;
> =20
>         crop =3D __ov2680_get_pad_crop(sensor, sd_state, format->pad,
>                                      format->which);
> @@ -664,6 +675,15 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>         sensor->mode.fmt =3D format->format;
>         ov2680_calc_mode(sensor);
> =20
> +       /* vblank range is height dependent adjust and reset to default */
> +       max =3D OV2680_MAX_VBLANK - height;
> +       def =3D OV2680_LINES_PER_FRAME_30FPS - height;
> +       __v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV2680_MIN_VBLANK,=
 max,
> +                                1, def);
> +       __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, def);
> +       /* exposure range depends on vts which may have changed */
> +       ov2680_exposure_update_range(sensor);
> +
>  unlock:
>         mutex_unlock(&sensor->lock);
> =20
> @@ -833,6 +853,10 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>         struct ov2680_dev *sensor =3D to_ov2680_dev(sd);
>         int ret;
> =20
> +       /* Update exposure range on vblank changes */
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK)
> +               ov2680_exposure_update_range(sensor);
> +
>         /* Only apply changes to the controls if the device is powered up=
 */
>         if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
>                 ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
> @@ -855,6 +879,10 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>         case V4L2_CID_TEST_PATTERN:
>                 ret =3D ov2680_test_pattern_set(sensor, ctrl->val);
>                 break;
> +       case V4L2_CID_VBLANK:
> +               ret =3D cci_write(sensor->regmap, OV2680_REG_TIMING_VTS,
> +                               sensor->mode.fmt.height + ctrl->val, NULL=
);
> +               break;
>         default:
>                 ret =3D -EINVAL;
>                 break;
> @@ -913,8 +941,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *se=
nsor)
>         const struct v4l2_ctrl_ops *ops =3D &ov2680_ctrl_ops;
>         struct ov2680_ctrls *ctrls =3D &sensor->ctrls;
>         struct v4l2_ctrl_handler *hdl =3D &ctrls->handler;
> -       int exp_max =3D OV2680_LINES_PER_FRAME - OV2680_INTEGRATION_TIME_=
MARGIN;
> -       int ret =3D 0;
> +       int def, max, ret =3D 0;
> =20
>         v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
>         sensor->sd.internal_ops =3D &ov2680_internal_ops;
> @@ -939,8 +966,9 @@ static int ov2680_v4l2_register(struct ov2680_dev *se=
nsor)
>                                         ARRAY_SIZE(test_pattern_menu) - 1,
>                                         0, 0, test_pattern_menu);
> =20
> +       max =3D OV2680_LINES_PER_FRAME_30FPS - OV2680_INTEGRATION_TIME_MA=
RGIN;
>         ctrls->exposure =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
> -                                           0, exp_max, 1, exp_max);
> +                                           0, max, 1, max);
> =20
>         ctrls->gain =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAI=
N,
>                                         0, 1023, 1, 250);
> @@ -951,6 +979,11 @@ static int ov2680_v4l2_register(struct ov2680_dev *s=
ensor)
>                                               0, sensor->pixel_rate,
>                                               1, sensor->pixel_rate);
> =20
> +       max =3D OV2680_MAX_VBLANK - OV2680_DEFAULT_HEIGHT;
> +       def =3D OV2680_LINES_PER_FRAME_30FPS - OV2680_DEFAULT_HEIGHT;
> +       ctrls->vblank =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> +                                         OV2680_MIN_VBLANK, max, 1, def);
> +


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>         if (hdl->error) {
>                 ret =3D hdl->error;
>                 goto cleanup_entity;
> --=20
> 2.43.0
>


Return-Path: <linux-media+bounces-39797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14DCB24721
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24B9D7A51FA
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 10:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117EB2F1FE5;
	Wed, 13 Aug 2025 10:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rTEHB2bx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574622EFDA9;
	Wed, 13 Aug 2025 10:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755080702; cv=none; b=dwU22F8U/2ddKOMUy+8ZAPgY3EdirpHApmaHAGxw/K0HhW7LTl+J8MdfvNKWLnkkz90pQP8wepha9wnT9cMy7UrcPjGmj99LSfHF/oeUGKUrGbbAFlxlC1u/yOYLM+c4POqnuXYF449bQi2uGKNejJZPoYTBI620dUk3jgV1TqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755080702; c=relaxed/simple;
	bh=NglNeKEOMGBns1QSbPUrMyvAtThkXr3SsRwBGgKXmKU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=E7fjMVAHtDkX4OsdU+QvBrzXqeI/CotD6m/GRhx1t7RxrdLKyajnNGY4cyNtnGk8Be6agXy2I7Uuz+VVyPWqKJ8X/bJXFdXU5Ms3Y9XUS5/BO4X2XPP28zRvFNEI2nSjen3mHOXNK46ojmmGLR8dPdv6rPsrY86RYw2sKg5RVoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rTEHB2bx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70AA22EC;
	Wed, 13 Aug 2025 12:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755080645;
	bh=NglNeKEOMGBns1QSbPUrMyvAtThkXr3SsRwBGgKXmKU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rTEHB2bxIXaTKRezMkI9b25gOvBsd0Qg0fBewxXIlUKotOK/r8duf7+RkziD1mfSX
	 uODBIk8/h4x/GUFSIHWEGQAO0anXVlbXjTXtCqsCmAk+Tmqv9x2f9i/jdSxhQ7o+O1
	 0+fUg1asZhATfdC53Z6qDIoicH2bnM52y0YXyfLc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250813-imx335_binning-v1-5-a42b687d8541@ideasonboard.com>
References: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com> <20250813-imx335_binning-v1-5-a42b687d8541@ideasonboard.com>
Subject: Re: [PATCH 5/6] media: imx355: Use subdev active state
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 13 Aug 2025 11:24:56 +0100
Message-ID: <175508069643.560048.635717738150928802@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Jai Luthra (2025-08-13 08:20:36)
> Port the driver to use the subdev active state. This simplifies locking,
> and makes it easier to support different crop sizes for binned modes, by
> storing the crop rectangle inside the subdev state.
>=20

Has this patch inadverntently squashed subdev active state and some
runtime power / start/stop stream changes together?

It looks like there's some interesting additional development in there
but I don't think that's related to subdev active state ?

--
Kieran

> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 125 +++++++++++++++------------------------=
------
>  1 file changed, 41 insertions(+), 84 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index c61a6952f828fd8b945746ae2f53f5517e98c410..df1535927f481de3a0d043ac9=
be24b9336ea8f7f 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -196,7 +196,6 @@ struct imx335_mode {
>   * @vblank: Vertical blanking in lines
>   * @lane_mode: Mode for number of connected data lanes
>   * @cur_mode: Pointer to current selected sensor mode
> - * @mutex: Mutex for serializing sensor controls
>   * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
>   * @cur_mbus_code: Currently selected media bus format code
>   */
> @@ -223,7 +222,6 @@ struct imx335 {
>         u32 vblank;
>         u32 lane_mode;
>         const struct imx335_mode *cur_mode;
> -       struct mutex mutex;
>         unsigned long link_freq_bitmap;
>         u32 cur_mbus_code;
>  };
> @@ -758,36 +756,6 @@ static void imx335_fill_pad_format(struct imx335 *im=
x335,
>         fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;
>  }
> =20
> -/**
> - * imx335_get_pad_format() - Get subdevice pad format
> - * @sd: pointer to imx335 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
> -static int imx335_get_pad_format(struct v4l2_subdev *sd,
> -                                struct v4l2_subdev_state *sd_state,
> -                                struct v4l2_subdev_format *fmt)
> -{
> -       struct imx335 *imx335 =3D to_imx335(sd);
> -
> -       mutex_lock(&imx335->mutex);
> -
> -       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> -               struct v4l2_mbus_framefmt *framefmt;
> -
> -               framefmt =3D v4l2_subdev_state_get_format(sd_state, fmt->=
pad);
> -               fmt->format =3D *framefmt;
> -       } else {
> -               imx335_fill_pad_format(imx335, imx335->cur_mode, fmt);
> -       }
> -
> -       mutex_unlock(&imx335->mutex);
> -
> -       return 0;
> -}
> -
>  /**
>   * imx335_set_pad_format() - Set subdevice pad format
>   * @sd: pointer to imx335 V4L2 sub-device structure
> @@ -801,12 +769,12 @@ static int imx335_set_pad_format(struct v4l2_subdev=
 *sd,
>                                  struct v4l2_subdev_format *fmt)
>  {
>         struct imx335 *imx335 =3D to_imx335(sd);
> +       struct v4l2_mbus_framefmt *format;
>         const struct imx335_mode *mode;
>         int i, ret =3D 0;
> =20
> -       mutex_lock(&imx335->mutex);
> -
>         mode =3D &supported_mode;
> +
>         for (i =3D 0; i < ARRAY_SIZE(imx335_mbus_codes); i++) {
>                 if (imx335_mbus_codes[i] =3D=3D fmt->format.code)
>                         imx335->cur_mbus_code =3D imx335_mbus_codes[i];
> @@ -814,19 +782,15 @@ static int imx335_set_pad_format(struct v4l2_subdev=
 *sd,
> =20
>         imx335_fill_pad_format(imx335, mode, fmt);
> =20
> -       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> -               struct v4l2_mbus_framefmt *framefmt;
> +       format =3D v4l2_subdev_state_get_format(sd_state, fmt->pad);
> +       *format =3D fmt->format;
> =20
> -               framefmt =3D v4l2_subdev_state_get_format(sd_state, fmt->=
pad);
> -               *framefmt =3D fmt->format;
> -       } else {
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
>                 ret =3D imx335_update_controls(imx335, mode);
>                 if (!ret)
>                         imx335->cur_mode =3D mode;
>         }
> =20
> -       mutex_unlock(&imx335->mutex);
> -
>         return ret;
>  }
> =20
> @@ -846,12 +810,10 @@ static int imx335_init_state(struct v4l2_subdev *sd,
>         fmt.which =3D sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FOR=
MAT_ACTIVE;
>         imx335_fill_pad_format(imx335, &supported_mode, &fmt);
> =20
> -       mutex_lock(&imx335->mutex);
>         __v4l2_ctrl_modify_range(imx335->link_freq_ctrl, 0,
>                                  __fls(imx335->link_freq_bitmap),
>                                  ~(imx335->link_freq_bitmap),
>                                  __ffs(imx335->link_freq_bitmap));
> -       mutex_unlock(&imx335->mutex);
> =20
>         return imx335_set_pad_format(sd, sd_state, &fmt);
>  }
> @@ -919,13 +881,17 @@ static int imx335_start_streaming(struct imx335 *im=
x335)
>         const struct imx335_reg_list *reg_list;
>         int ret;
> =20
> +       ret =3D pm_runtime_resume_and_get(imx335->dev);
> +       if (ret < 0)
> +               return ret;
> +
>         /* Setup PLL */
>         reg_list =3D &link_freq_reglist[__ffs(imx335->link_freq_bitmap)];
>         ret =3D cci_multi_reg_write(imx335->cci, reg_list->regs,
>                                   reg_list->num_of_regs, NULL);
>         if (ret) {
>                 dev_err(imx335->dev, "%s failed to set plls\n", __func__);
> -               return ret;
> +               goto err_rpm_put;
>         }
> =20
>         /* Write sensor mode registers */
> @@ -934,27 +900,27 @@ static int imx335_start_streaming(struct imx335 *im=
x335)
>                                   reg_list->num_of_regs, NULL);
>         if (ret) {
>                 dev_err(imx335->dev, "fail to write initial registers\n");
> -               return ret;
> +               goto err_rpm_put;
>         }
> =20
>         ret =3D imx335_set_framefmt(imx335);
>         if (ret) {
>                 dev_err(imx335->dev, "%s failed to set frame format: %d\n=
",
>                         __func__, ret);
> -               return ret;
> +               goto err_rpm_put;
>         }
> =20
>         /* Configure lanes */
>         ret =3D cci_write(imx335->cci, IMX335_REG_LANEMODE,
>                         imx335->lane_mode, NULL);
>         if (ret)
> -               return ret;
> +               goto err_rpm_put;
> =20
>         /* Setup handler will write actual exposure and gain */
>         ret =3D  __v4l2_ctrl_handler_setup(imx335->sd.ctrl_handler);
>         if (ret) {
>                 dev_err(imx335->dev, "fail to setup handler\n");
> -               return ret;
> +               goto err_rpm_put;
>         }
> =20
>         /* Start streaming */
> @@ -962,25 +928,29 @@ static int imx335_start_streaming(struct imx335 *im=
x335)
>                         IMX335_MODE_STREAMING, NULL);
>         if (ret) {
>                 dev_err(imx335->dev, "fail to start streaming\n");
> -               return ret;
> +               goto err_rpm_put;
>         }
> =20
>         /* Initial regulator stabilization period */
>         usleep_range(18000, 20000);
> =20
>         return 0;
> +
> +err_rpm_put:
> +       pm_runtime_put(imx335->dev);
> +
> +       return ret;
>  }
> =20
>  /**
>   * imx335_stop_streaming() - Stop sensor stream
>   * @imx335: pointer to imx335 device
> - *
> - * Return: 0 if successful, error code otherwise.
>   */
> -static int imx335_stop_streaming(struct imx335 *imx335)
> +static void imx335_stop_streaming(struct imx335 *imx335)
>  {
> -       return cci_write(imx335->cci, IMX335_REG_MODE_SELECT,
> -                        IMX335_MODE_STANDBY, NULL);
> +       cci_write(imx335->cci, IMX335_REG_MODE_SELECT,
> +                 IMX335_MODE_STANDBY, NULL);
> +       pm_runtime_put(imx335->dev);
>  }
> =20
>  /**
> @@ -993,31 +963,18 @@ static int imx335_stop_streaming(struct imx335 *imx=
335)
>  static int imx335_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>         struct imx335 *imx335 =3D to_imx335(sd);
> -       int ret;
> +       struct v4l2_subdev_state *state;
> +       int ret =3D 0;
> =20
> -       mutex_lock(&imx335->mutex);
> +       state =3D v4l2_subdev_lock_and_get_active_state(sd);
> =20
>         if (enable) {
> -               ret =3D pm_runtime_resume_and_get(imx335->dev);
> -               if (ret)
> -                       goto error_unlock;
> -
>                 ret =3D imx335_start_streaming(imx335);
> -               if (ret)
> -                       goto error_power_off;
>         } else {
>                 imx335_stop_streaming(imx335);
> -               pm_runtime_put(imx335->dev);
>         }
> =20
> -       mutex_unlock(&imx335->mutex);
> -
> -       return 0;
> -
> -error_power_off:
> -       pm_runtime_put(imx335->dev);
> -error_unlock:
> -       mutex_unlock(&imx335->mutex);
> +       v4l2_subdev_unlock_state(state);
> =20
>         return ret;
>  }
> @@ -1146,7 +1103,7 @@ static const struct v4l2_subdev_pad_ops imx335_pad_=
ops =3D {
>         .enum_frame_size =3D imx335_enum_frame_size,
>         .get_selection =3D imx335_get_selection,
>         .set_selection =3D imx335_get_selection,
> -       .get_fmt =3D imx335_get_pad_format,
> +       .get_fmt =3D v4l2_subdev_get_fmt,
>         .set_fmt =3D imx335_set_pad_format,
>  };
> =20
> @@ -1241,9 +1198,6 @@ static int imx335_init_controls(struct imx335 *imx3=
35)
>         if (ret)
>                 return ret;
> =20
> -       /* Serialize controls with sensor device */
> -       ctrl_hdlr->lock =3D &imx335->mutex;
> -
>         /* Initialize exposure and gain */
>         lpfr =3D mode->vblank + mode->height;
>         imx335->exp_ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr,
> @@ -1363,12 +1317,10 @@ static int imx335_probe(struct i2c_client *client)
>                 return ret;
>         }
> =20
> -       mutex_init(&imx335->mutex);
> -
>         ret =3D imx335_power_on(imx335->dev);
>         if (ret) {
>                 dev_err(imx335->dev, "failed to power-on the sensor\n");
> -               goto error_mutex_destroy;
> +               return ret;
>         }
> =20
>         /* Check module identity */
> @@ -1401,11 +1353,18 @@ static int imx335_probe(struct i2c_client *client)
>                 goto error_handler_free;
>         }
> =20
> +       imx335->sd.state_lock =3D imx335->ctrl_handler.lock;
> +       ret =3D v4l2_subdev_init_finalize(&imx335->sd);
> +       if (ret < 0) {
> +               dev_err(imx335->dev, "subdev init error\n");
> +               goto error_media_entity;
> +       }
> +
>         ret =3D v4l2_async_register_subdev_sensor(&imx335->sd);
>         if (ret < 0) {
>                 dev_err(imx335->dev,
>                         "failed to register async subdev: %d\n", ret);
> -               goto error_media_entity;
> +               goto error_subdev_cleanup;
>         }
> =20
>         pm_runtime_set_active(imx335->dev);
> @@ -1414,14 +1373,14 @@ static int imx335_probe(struct i2c_client *client)
> =20
>         return 0;
> =20
> +error_subdev_cleanup:
> +       v4l2_subdev_cleanup(&imx335->sd);
>  error_media_entity:
>         media_entity_cleanup(&imx335->sd.entity);
>  error_handler_free:
>         v4l2_ctrl_handler_free(imx335->sd.ctrl_handler);
>  error_power_off:
>         imx335_power_off(imx335->dev);
> -error_mutex_destroy:
> -       mutex_destroy(&imx335->mutex);
> =20
>         return ret;
>  }
> @@ -1435,9 +1394,9 @@ static int imx335_probe(struct i2c_client *client)
>  static void imx335_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> -       struct imx335 *imx335 =3D to_imx335(sd);
> =20
>         v4l2_async_unregister_subdev(sd);
> +       v4l2_subdev_cleanup(sd);
>         media_entity_cleanup(&sd->entity);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
> =20
> @@ -1445,8 +1404,6 @@ static void imx335_remove(struct i2c_client *client)
>         if (!pm_runtime_status_suspended(&client->dev))
>                 imx335_power_off(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       mutex_destroy(&imx335->mutex);
>  }
> =20
>  static const struct dev_pm_ops imx335_pm_ops =3D {
>=20
> --=20
> 2.50.1
>


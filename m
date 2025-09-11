Return-Path: <linux-media+bounces-42350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF93B53557
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 16:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DC025A100A
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 14:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3D733EAED;
	Thu, 11 Sep 2025 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d8E578KP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F28DF72;
	Thu, 11 Sep 2025 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601050; cv=none; b=S+0neyHkhAch/qgOqiQcNS16P0waXxcENO3AHsY0Xd6SdvwZmXY3Evvy+9+C45lc7dfKoAvxnh4tzXD7qwi9ewc8fqBcoHmWJYbKe9e3KWIErYVvLw5RcIEfRtzdcpsvyoT1F+piTTUVnOerPnBqS4d4EzZgeLOD3Tarh/AUXZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601050; c=relaxed/simple;
	bh=+huU836wZDjjaqzLBWYiHUYyOun/h+KtkKUh4oB0sao=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZWZoGJMtFN6Y6xgWF5t5RAW8hnakHYLLoPWN4S6goX1Oxei7cO0ev9h94iK6Y1SmPiglQg6y8qJNQWh9n5zvP9DLNdGfXpUJFfO5aV4nwHN+1cPub+FEpCsgLBqiTg4GGcQnMAQ7iEBVkSaQUrfmQfvur1wLCvvV/Z13MNQlY7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d8E578KP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC5194A4;
	Thu, 11 Sep 2025 16:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757600971;
	bh=+huU836wZDjjaqzLBWYiHUYyOun/h+KtkKUh4oB0sao=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=d8E578KPzdT9qfI1vBkYrpkeRGXrj6cSwWuK5Iza02S1L1S2zz8gkf/HY7JaJVQfS
	 wCdqqBsf6tzNosFMWdX9k8CLsFOnZO5R7eSfghRTHj0AMi+fbrIcWhUrDJ2a/aazBH
	 OaHcfXuZzVUF8eOdtzNBBG8fVx+LtsdSCJu9i96s=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250911-imx335_binning-v2-6-30a28df74df6@ideasonboard.com>
References: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com> <20250911-imx335_binning-v2-6-30a28df74df6@ideasonboard.com>
Subject: Re: [PATCH v2 6/8] media: imx355: Use subdev active state
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Tommaso Merciai <tomm.merciai@gmail.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 11 Sep 2025 15:30:43 +0100
Message-ID: <175760104354.935713.5466359754087343394@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Jai Luthra (2025-09-11 09:14:22)
> Port the driver to use the subdev active state. This simplifies locking,
> and makes it easier to support different crop sizes for binned modes, by
> storing the crop rectangle inside the subdev state.
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 79 ++++++++++++----------------------------=
------
>  1 file changed, 21 insertions(+), 58 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index 7631f41e6f1e65695fb76a66d9ac5a3588c69658..9b9bbe6473d545bc5618c0fe8=
191df0b18037cd8 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -204,7 +204,6 @@ struct imx335_mode {
>   * @vblank: Vertical blanking in lines
>   * @lane_mode: Mode for number of connected data lanes
>   * @cur_mode: Pointer to current selected sensor mode
> - * @mutex: Mutex for serializing sensor controls
>   * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
>   * @cur_mbus_code: Currently selected media bus format code
>   */
> @@ -231,7 +230,6 @@ struct imx335 {
>         u32 vblank;
>         u32 lane_mode;
>         const struct imx335_mode *cur_mode;
> -       struct mutex mutex;
>         unsigned long link_freq_bitmap;
>         u32 cur_mbus_code;
>  };
> @@ -766,36 +764,6 @@ static void imx335_fill_pad_format(struct imx335 *im=
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
> @@ -809,12 +777,12 @@ static int imx335_set_pad_format(struct v4l2_subdev=
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
> @@ -822,19 +790,15 @@ static int imx335_set_pad_format(struct v4l2_subdev=
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

It's nice to drop that - and clean up the locking.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

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
> @@ -854,12 +818,10 @@ static int imx335_init_state(struct v4l2_subdev *sd,
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
> @@ -1001,16 +963,17 @@ static void imx335_stop_streaming(struct imx335 *i=
mx335)
>  static int imx335_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>         struct imx335 *imx335 =3D to_imx335(sd);
> +       struct v4l2_subdev_state *state;
>         int ret =3D 0;
> =20
> -       mutex_lock(&imx335->mutex);
> +       state =3D v4l2_subdev_lock_and_get_active_state(sd);
> =20
>         if (enable)
>                 ret =3D imx335_start_streaming(imx335);
>         else
>                 imx335_stop_streaming(imx335);
> =20
> -       mutex_unlock(&imx335->mutex);
> +       v4l2_subdev_unlock_state(state);
> =20
>         return ret;
>  }
> @@ -1138,7 +1101,7 @@ static const struct v4l2_subdev_pad_ops imx335_pad_=
ops =3D {
>         .enum_frame_size =3D imx335_enum_frame_size,
>         .get_selection =3D imx335_get_selection,
>         .set_selection =3D imx335_get_selection,
> -       .get_fmt =3D imx335_get_pad_format,
> +       .get_fmt =3D v4l2_subdev_get_fmt,
>         .set_fmt =3D imx335_set_pad_format,
>  };
> =20
> @@ -1233,9 +1196,6 @@ static int imx335_init_controls(struct imx335 *imx3=
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
> @@ -1355,12 +1315,10 @@ static int imx335_probe(struct i2c_client *client)
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
> @@ -1393,11 +1351,18 @@ static int imx335_probe(struct i2c_client *client)
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
> @@ -1406,14 +1371,14 @@ static int imx335_probe(struct i2c_client *client)
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
> @@ -1427,9 +1392,9 @@ static int imx335_probe(struct i2c_client *client)
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
> @@ -1437,8 +1402,6 @@ static void imx335_remove(struct i2c_client *client)
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
> 2.51.0
>


Return-Path: <linux-media+bounces-32693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F64ABAC80
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 22:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 836C717FE5B
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 20:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6DE21516D;
	Sat, 17 May 2025 20:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tm26UJFD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5083C215078
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 20:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747514547; cv=none; b=neqUIYxOS06yriVsdHoBFzmK8BmSnTIcRjVLGEARodBnH3RYlHIS5PyXlz4WUqhQ2IMmYkrp5eSuhMqNCZUsdlTMO65LpWaV1psK8jdjGqnbsVLmuBk+Gq1nppSu4AYEjgzRqmzKbokQJ8xHGnVMUZ4ir14wX5d0NrG6b+Ug3A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747514547; c=relaxed/simple;
	bh=J699vNGLMAOr16VFyHbKKVvc7lBJGoYEe70ja73qhVs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=jiCp3ycSqMnvb1S60R7HEU9TOMwWFmDCJMlGJzuRwScmwraA+0eP4pZ8vCldWn41IdtJ7faJDSzK0O2WW2pZCK4aEBGc1Mp4aZB/xazpJnNZBixOQSy4UkU40Ka8XLHZIeLDEDyrPQ4Mluu7CSZLp/HPNgtbK9q+3eFv06CBcXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Tm26UJFD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2AE24AD;
	Sat, 17 May 2025 22:42:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747514525;
	bh=J699vNGLMAOr16VFyHbKKVvc7lBJGoYEe70ja73qhVs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Tm26UJFDunVEY1tiLJm400mc0y4oBRyQX2r7VpNMIG1im4QA/BIjzOcHsj7iDE5HB
	 ylJdltfYxmjHaazH5Oc9V2RiNQCP3gKGtgiQWD2AHV8kqnEgLIukzTvz2J9ruW1wB8
	 eNn0Yl00kjPedHgIsmRUPo+1LGTRoooG7E2+QHlo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250517114106.43494-2-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com> <20250517114106.43494-2-hdegoede@redhat.com>
Subject: Re: [PATCH 01/23] media: atomisp: gc0310: Rename "dev" function variable to "sensor"
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 May 2025 21:42:20 +0100
Message-ID: <174751454047.281096.11832217532518140261@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2025-05-17 12:40:44)
> Many functions on the gc0310 driver use a function local variable called
> "dev" but these variable's type is not "struct device *" type as one would
> expect based on the name. Instead they point to the gc0310 driver data
> struct.
>=20
> Rename these variables to sensor to make their purpose more clear.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  .../media/atomisp/i2c/atomisp-gc0310.c        | 112 +++++++++---------
>  1 file changed, 56 insertions(+), 56 deletions(-)
>=20
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers=
/staging/media/atomisp/i2c/atomisp-gc0310.c
> index d35394f1ddbb..cc74e90a1457 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -282,16 +282,16 @@ static int gc0310_write_reg_array(struct i2c_client=
 *client,
>         return 0;
>  }
> =20
> -static int gc0310_exposure_set(struct gc0310_device *dev, u32 exp)
> +static int gc0310_exposure_set(struct gc0310_device *sensor, u32 exp)
>  {
> -       struct i2c_client *client =3D v4l2_get_subdevdata(&dev->sd);
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->sd);
> =20
>         return i2c_smbus_write_word_swapped(client, GC0310_AEC_PK_EXPO_H,=
 exp);
>  }
> =20
> -static int gc0310_gain_set(struct gc0310_device *dev, u32 gain)
> +static int gc0310_gain_set(struct gc0310_device *sensor, u32 gain)
>  {
> -       struct i2c_client *client =3D v4l2_get_subdevdata(&dev->sd);
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->sd);
>         u8 again, dgain;
>         int ret;
> =20
> @@ -317,27 +317,27 @@ static int gc0310_gain_set(struct gc0310_device *de=
v, u32 gain)
> =20
>  static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
> -       struct gc0310_device *dev =3D
> +       struct gc0310_device *sensor =3D
>                 container_of(ctrl->handler, struct gc0310_device, ctrls.h=
andler);
>         int ret;
> =20
>         /* Only apply changes to the controls if the device is powered up=
 */
> -       if (!pm_runtime_get_if_in_use(dev->sd.dev))
> +       if (!pm_runtime_get_if_in_use(sensor->sd.dev))
>                 return 0;
> =20
>         switch (ctrl->id) {
>         case V4L2_CID_EXPOSURE:
> -               ret =3D gc0310_exposure_set(dev, ctrl->val);
> +               ret =3D gc0310_exposure_set(sensor, ctrl->val);
>                 break;
>         case V4L2_CID_GAIN:
> -               ret =3D gc0310_gain_set(dev, ctrl->val);
> +               ret =3D gc0310_gain_set(sensor, ctrl->val);
>                 break;
>         default:
>                 ret =3D -EINVAL;
>                 break;
>         }
> =20
> -       pm_runtime_put(dev->sd.dev);
> +       pm_runtime_put(sensor->sd.dev);
>         return ret;
>  }
> =20
> @@ -346,14 +346,14 @@ static const struct v4l2_ctrl_ops ctrl_ops =3D {
>  };
> =20
>  static struct v4l2_mbus_framefmt *
> -gc0310_get_pad_format(struct gc0310_device *dev,
> +gc0310_get_pad_format(struct gc0310_device *sensor,
>                       struct v4l2_subdev_state *state,
>                       unsigned int pad, enum v4l2_subdev_format_whence wh=
ich)
>  {
>         if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
>                 return v4l2_subdev_state_get_format(state, pad);
> =20
> -       return &dev->mode.fmt;
> +       return &sensor->mode.fmt;
>  }
> =20
>  /* The GC0310 currently only supports 1 fixed fmt */
> @@ -370,10 +370,10 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
>                           struct v4l2_subdev_state *sd_state,
>                           struct v4l2_subdev_format *format)
>  {
> -       struct gc0310_device *dev =3D to_gc0310_sensor(sd);
> +       struct gc0310_device *sensor =3D to_gc0310_sensor(sd);
>         struct v4l2_mbus_framefmt *fmt;
> =20
> -       fmt =3D gc0310_get_pad_format(dev, sd_state, format->pad, format-=
>which);
> +       fmt =3D gc0310_get_pad_format(sensor, sd_state, format->pad, form=
at->which);
>         gc0310_fill_format(fmt);
> =20
>         format->format =3D *fmt;
> @@ -384,10 +384,10 @@ static int gc0310_get_fmt(struct v4l2_subdev *sd,
>                           struct v4l2_subdev_state *sd_state,
>                           struct v4l2_subdev_format *format)
>  {
> -       struct gc0310_device *dev =3D to_gc0310_sensor(sd);
> +       struct gc0310_device *sensor =3D to_gc0310_sensor(sd);
>         struct v4l2_mbus_framefmt *fmt;
> =20
> -       fmt =3D gc0310_get_pad_format(dev, sd_state, format->pad, format-=
>which);
> +       fmt =3D gc0310_get_pad_format(sensor, sd_state, format->pad, form=
at->which);
>         format->format =3D *fmt;
>         return 0;
>  }
> @@ -424,12 +424,12 @@ static int gc0310_detect(struct i2c_client *client)
> =20
>  static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
>  {
> -       struct gc0310_device *dev =3D to_gc0310_sensor(sd);
> +       struct gc0310_device *sensor =3D to_gc0310_sensor(sd);
>         struct i2c_client *client =3D v4l2_get_subdevdata(sd);
>         int ret =3D 0;
> =20
>         dev_dbg(&client->dev, "%s S enable=3D%d\n", __func__, enable);
> -       mutex_lock(&dev->input_lock);
> +       mutex_lock(&sensor->input_lock);
> =20
>         if (enable) {
>                 ret =3D pm_runtime_get_sync(&client->dev);
> @@ -449,7 +449,7 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, in=
t enable)
>                         goto error_power_down;
> =20
>                 /* restore value of all ctrls */
> -               ret =3D __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
> +               ret =3D __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
>                 if (ret)
>                         goto error_power_down;
> =20
> @@ -475,14 +475,14 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, =
int enable)
>         if (!enable)
>                 pm_runtime_put(&client->dev);
> =20
> -       dev->is_streaming =3D enable;
> -       mutex_unlock(&dev->input_lock);
> +       sensor->is_streaming =3D enable;
> +       mutex_unlock(&sensor->input_lock);
>         return 0;
> =20
>  error_power_down:
>         pm_runtime_put(&client->dev);
> -       dev->is_streaming =3D false;
> -       mutex_unlock(&dev->input_lock);
> +       sensor->is_streaming =3D false;
> +       mutex_unlock(&sensor->input_lock);
>         return ret;
>  }
> =20
> @@ -559,21 +559,21 @@ static const struct v4l2_subdev_ops gc0310_ops =3D {
>         .sensor =3D &gc0310_sensor_ops,
>  };
> =20
> -static int gc0310_init_controls(struct gc0310_device *dev)
> +static int gc0310_init_controls(struct gc0310_device *sensor)
>  {
> -       struct v4l2_ctrl_handler *hdl =3D &dev->ctrls.handler;
> +       struct v4l2_ctrl_handler *hdl =3D &sensor->ctrls.handler;
> =20
>         v4l2_ctrl_handler_init(hdl, 2);
> =20
>         /* Use the same lock for controls as for everything else */
> -       hdl->lock =3D &dev->input_lock;
> -       dev->sd.ctrl_handler =3D hdl;
> +       hdl->lock =3D &sensor->input_lock;
> +       sensor->sd.ctrl_handler =3D hdl;
> =20
> -       dev->ctrls.exposure =3D
> +       sensor->ctrls.exposure =3D
>                 v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_EXPOSURE, 0, 4=
095, 1, 1023);
> =20
>         /* 32 steps at base gain 1 + 64 half steps at base gain 2 */
> -       dev->ctrls.gain =3D
> +       sensor->ctrls.gain =3D
>                 v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_GAIN, 0, 95, 1=
, 31);
> =20
>         return hdl->error;
> @@ -582,21 +582,21 @@ static int gc0310_init_controls(struct gc0310_devic=
e *dev)
>  static void gc0310_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> -       struct gc0310_device *dev =3D to_gc0310_sensor(sd);
> +       struct gc0310_device *sensor =3D to_gc0310_sensor(sd);
> =20
>         dev_dbg(&client->dev, "gc0310_remove...\n");
> =20
>         v4l2_async_unregister_subdev(sd);
> -       media_entity_cleanup(&dev->sd.entity);
> -       v4l2_ctrl_handler_free(&dev->ctrls.handler);
> -       mutex_destroy(&dev->input_lock);
> +       media_entity_cleanup(&sensor->sd.entity);
> +       v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> +       mutex_destroy(&sensor->input_lock);
>         pm_runtime_disable(&client->dev);
>  }
> =20
>  static int gc0310_probe(struct i2c_client *client)
>  {
>         struct fwnode_handle *ep_fwnode;
> -       struct gc0310_device *dev;
> +       struct gc0310_device *sensor;
>         int ret;
> =20
>         /*
> @@ -609,25 +609,25 @@ static int gc0310_probe(struct i2c_client *client)
> =20
>         fwnode_handle_put(ep_fwnode);
> =20
> -       dev =3D devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
> -       if (!dev)
> +       sensor =3D devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL=
);
> +       if (!sensor)
>                 return -ENOMEM;
> =20
> -       dev->reset =3D devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HI=
GH);
> -       if (IS_ERR(dev->reset)) {
> -               return dev_err_probe(&client->dev, PTR_ERR(dev->reset),
> +       sensor->reset =3D devm_gpiod_get(&client->dev, "reset", GPIOD_OUT=
_HIGH);
> +       if (IS_ERR(sensor->reset)) {
> +               return dev_err_probe(&client->dev, PTR_ERR(sensor->reset),
>                                      "getting reset GPIO\n");
>         }
> =20
> -       dev->powerdown =3D devm_gpiod_get(&client->dev, "powerdown", GPIO=
D_OUT_HIGH);
> -       if (IS_ERR(dev->powerdown)) {
> -               return dev_err_probe(&client->dev, PTR_ERR(dev->powerdown=
),
> +       sensor->powerdown =3D devm_gpiod_get(&client->dev, "powerdown", G=
PIOD_OUT_HIGH);
> +       if (IS_ERR(sensor->powerdown)) {
> +               return dev_err_probe(&client->dev, PTR_ERR(sensor->powerd=
own),
>                                      "getting powerdown GPIO\n");
>         }
> =20
> -       mutex_init(&dev->input_lock);
> -       v4l2_i2c_subdev_init(&dev->sd, client, &gc0310_ops);
> -       gc0310_fill_format(&dev->mode.fmt);
> +       mutex_init(&sensor->input_lock);
> +       v4l2_i2c_subdev_init(&sensor->sd, client, &gc0310_ops);
> +       gc0310_fill_format(&sensor->mode.fmt);
> =20
>         pm_runtime_set_suspended(&client->dev);
>         pm_runtime_enable(&client->dev);
> @@ -640,23 +640,23 @@ static int gc0310_probe(struct i2c_client *client)
>                 return ret;
>         }
> =20
> -       dev->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> -       dev->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> -       dev->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +       sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> +       sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +       sensor->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> =20
> -       ret =3D gc0310_init_controls(dev);
> +       ret =3D gc0310_init_controls(sensor);
>         if (ret) {
>                 gc0310_remove(client);
>                 return ret;
>         }
> =20
> -       ret =3D media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> +       ret =3D media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pa=
d);
>         if (ret) {
>                 gc0310_remove(client);
>                 return ret;
>         }
> =20
> -       ret =3D v4l2_async_register_subdev_sensor(&dev->sd);
> +       ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
>         if (ret) {
>                 gc0310_remove(client);
>                 return ret;
> @@ -668,22 +668,22 @@ static int gc0310_probe(struct i2c_client *client)
>  static int gc0310_suspend(struct device *dev)
>  {
>         struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> -       struct gc0310_device *gc0310_dev =3D to_gc0310_sensor(sd);
> +       struct gc0310_device *sensor =3D to_gc0310_sensor(sd);
> =20
> -       gpiod_set_value_cansleep(gc0310_dev->powerdown, 1);
> -       gpiod_set_value_cansleep(gc0310_dev->reset, 1);
> +       gpiod_set_value_cansleep(sensor->powerdown, 1);
> +       gpiod_set_value_cansleep(sensor->reset, 1);
>         return 0;
>  }
> =20
>  static int gc0310_resume(struct device *dev)
>  {
>         struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> -       struct gc0310_device *gc0310_dev =3D to_gc0310_sensor(sd);
> +       struct gc0310_device *sensor =3D to_gc0310_sensor(sd);
> =20
>         usleep_range(10000, 15000);
> -       gpiod_set_value_cansleep(gc0310_dev->reset, 0);
> +       gpiod_set_value_cansleep(sensor->reset, 0);
>         usleep_range(10000, 15000);
> -       gpiod_set_value_cansleep(gc0310_dev->powerdown, 0);
> +       gpiod_set_value_cansleep(sensor->powerdown, 0);
> =20
>         return 0;
>  }
> --=20
> 2.49.0
>


Return-Path: <linux-media+bounces-23510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 554269F3CBE
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE5D1188C34D
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 21:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248CF1D47AE;
	Mon, 16 Dec 2024 21:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdqWKanm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7585E1CEADD;
	Mon, 16 Dec 2024 21:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734384050; cv=none; b=PmfpdCwR0wezE47uZE1ArHJZAGf1FOmHCTYP/8rJS3xZyBdAsATu3W8fdChERYupvH4K8N4A1+tsp8soSzp+X+9VDkS3ko7PjsuNvEveM95zWwqoW8hh2pwBh7FMtgoFYrzv0Kad6ju2KyGxPnXoVV3sqdenj9nKRcVI0zbTCeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734384050; c=relaxed/simple;
	bh=5+CNBxxgo0oo8NO3W/LOixDf5wXNlXY8/a7rlhL4oj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IjC8BPY+ZdKd9lz7WKNZVlAZlb6M8O02oYkYb3Xe03UIHRzSBYR+q0v2BOwkapwcHhbXpFShrYMQnDEVo8RwBD4zhinKQsj3NPL/AaIBDBTV8ilwkCAfofapDfxnOKns/hyPE/EcKX8FRQ3HpPKKhWQSB7EyJAidSwYLY7ffFOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdqWKanm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4291FC4CEE1;
	Mon, 16 Dec 2024 21:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734384050;
	bh=5+CNBxxgo0oo8NO3W/LOixDf5wXNlXY8/a7rlhL4oj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OdqWKanmFK0CuYweClsPnOpVzqUMwNKuGTblLSoDBCaVX6k0PiIe95nV7KaIb0fEA
	 vzujbnwSYvmwiK9/1SWdJkatZ+v6XWybL/vH7IKF7iOH63YKxdBv7vq15ve9Ijp6Rc
	 MqPn+OVy4MJimhEM+Au+ociesMbDC3ftGowP/TcRXphPBLUPeIRkYdiCZO6dBJ26E8
	 Sw7pD75vt8xdv3sabRS+ZKZVKjY3VQ/rWdGC2Sl359c96Scx2glgrNawEZ4GC/QYgq
	 l2w5SuGjUvnIuJ1NUXP4N0MbEOWJDDECIHnJu6QzIINqzd49Ge+8MSAaqB1v3aBePg
	 hGSj1VS8daNcg==
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afde39e360so1174212137.0;
        Mon, 16 Dec 2024 13:20:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYZ6+Ki4tF85cJWnMzYO9ItJ9xHZmzc6sCPu97uBKX85MCfHyOQip4ustM0/E264TSqjX1XJA2xCujwmM=@vger.kernel.org, AJvYcCVP5fGxAvQIA5I92SIe3/ddgiXSt89z2LfbPjjTyOLRWr1uS2jrFvv17gbmqlQ4eKE518sUVZg/a0kzxJw=@vger.kernel.org, AJvYcCXABuDlliLkARkxOzkiGKgq7+ijvlgA1LeJF6sDaDapWKzj2UpZ/PE//J9VDTiFbd8vkn2G7dseKgD27Po=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Y09+e4Da8B1dQDqCQY8Ca55iTk6dziflAxiyIUlzsRTL8iei
	OnDUR2BeY4iGe0QsCvhOwOmjhY8fOx6HrCOAfXefs7VXGD37aU5CA+Fs9WtAUS2pqEFrfxXh0kr
	flzfqwbwraNa24dYk4OF7Cds5t20=
X-Google-Smtp-Source: AGHT+IEiUnZpTScnnZbXK3KuWLHARGena5Ctn/awG3wmRyfyRGSnVTv21Zp0jcm+G28EAIGkqOB1PahjyVoEpIlEmWQ=
X-Received: by 2002:a05:6102:3707:b0:4b2:5d3e:7554 with SMTP id
 ada2fe7eead31-4b25db40cd2mr14955267137.23.1734384049250; Mon, 16 Dec 2024
 13:20:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216-imx214-v4-0-8cbda160fbce@apitzsch.eu> <20241216-imx214-v4-1-8cbda160fbce@apitzsch.eu>
In-Reply-To: <20241216-imx214-v4-1-8cbda160fbce@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Mon, 16 Dec 2024 22:20:33 +0100
X-Gmail-Original-Message-ID: <CAPybu_0j+-FEzXqgYh48MKsqWdzaGYLORN7nJAffct+5ohRfUA@mail.gmail.com>
Message-ID: <CAPybu_0j+-FEzXqgYh48MKsqWdzaGYLORN7nJAffct+5ohRfUA@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] media: i2c: imx214: Use subdev active state
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre

On Mon, Dec 16, 2024 at 10:01=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> Port the imx214 sensor driver to use the subdev active state.
>
> Move all the format configuration to the subdevice state and simplify
> the format handling, locking and initialization.
>
> While at it, simplify imx214_start_streaming() by removing unneeded goto
> statements and the corresponding error label.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>

Looks good to me, but I delegate to Sakari for a proper review. I have
not completed a port to subdev active state myself :)

Thanks

> ---
>  drivers/media/i2c/imx214.c | 157 +++++++++++++++------------------------=
------
>  1 file changed, 51 insertions(+), 106 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 4962cfe7c83d62425aeccb46a400fa93146f14ea..2e4322b90938c880896b216d3=
c46ccaa29485562 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -59,8 +59,6 @@ struct imx214 {
>
>         struct v4l2_subdev sd;
>         struct media_pad pad;
> -       struct v4l2_mbus_framefmt fmt;
> -       struct v4l2_rect crop;
>
>         struct v4l2_ctrl_handler ctrls;
>         struct v4l2_ctrl *pixel_rate;
> @@ -68,15 +66,11 @@ struct imx214 {
>         struct v4l2_ctrl *exposure;
>         struct v4l2_ctrl *unit_size;
>
> +       const struct imx214_mode *cur_mode;
> +
>         struct regulator_bulk_data      supplies[IMX214_NUM_SUPPLIES];
>
>         struct gpio_desc *enable_gpio;
> -
> -       /*
> -        * Serialize control access, get/set format, get selection
> -        * and start streaming.
> -        */
> -       struct mutex mutex;
>  };
>
>  struct reg_8 {
> @@ -490,6 +484,22 @@ static int __maybe_unused imx214_power_off(struct de=
vice *dev)
>         return 0;
>  }
>
> +static void imx214_update_pad_format(struct imx214 *imx214,
> +                                    const struct imx214_mode *mode,
> +                                    struct v4l2_mbus_framefmt *fmt, u32 =
code)
> +{
> +       fmt->code =3D IMX214_MBUS_CODE;
> +       fmt->width =3D mode->width;
> +       fmt->height =3D mode->height;
> +       fmt->field =3D V4L2_FIELD_NONE;
> +       fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> +       fmt->ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> +       fmt->quantization =3D V4L2_MAP_QUANTIZATION_DEFAULT(true,
> +                                                         fmt->colorspace=
,
> +                                                         fmt->ycbcr_enc)=
;
> +       fmt->xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> +}
> +
>  static int imx214_enum_mbus_code(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_mbus_code_enum *code)
> @@ -549,52 +559,6 @@ static const struct v4l2_subdev_core_ops imx214_core=
_ops =3D {
>  #endif
>  };
>
> -static struct v4l2_mbus_framefmt *
> -__imx214_get_pad_format(struct imx214 *imx214,
> -                       struct v4l2_subdev_state *sd_state,
> -                       unsigned int pad,
> -                       enum v4l2_subdev_format_whence which)
> -{
> -       switch (which) {
> -       case V4L2_SUBDEV_FORMAT_TRY:
> -               return v4l2_subdev_state_get_format(sd_state, pad);
> -       case V4L2_SUBDEV_FORMAT_ACTIVE:
> -               return &imx214->fmt;
> -       default:
> -               return NULL;
> -       }
> -}
> -
> -static int imx214_get_format(struct v4l2_subdev *sd,
> -                            struct v4l2_subdev_state *sd_state,
> -                            struct v4l2_subdev_format *format)
> -{
> -       struct imx214 *imx214 =3D to_imx214(sd);
> -
> -       mutex_lock(&imx214->mutex);
> -       format->format =3D *__imx214_get_pad_format(imx214, sd_state,
> -                                                 format->pad,
> -                                                 format->which);
> -       mutex_unlock(&imx214->mutex);
> -
> -       return 0;
> -}
> -
> -static struct v4l2_rect *
> -__imx214_get_pad_crop(struct imx214 *imx214,
> -                     struct v4l2_subdev_state *sd_state,
> -                     unsigned int pad, enum v4l2_subdev_format_whence wh=
ich)
> -{
> -       switch (which) {
> -       case V4L2_SUBDEV_FORMAT_TRY:
> -               return v4l2_subdev_state_get_crop(sd_state, pad);
> -       case V4L2_SUBDEV_FORMAT_ACTIVE:
> -               return &imx214->crop;
> -       default:
> -               return NULL;
> -       }
> -}
> -
>  static int imx214_set_format(struct v4l2_subdev *sd,
>                              struct v4l2_subdev_state *sd_state,
>                              struct v4l2_subdev_format *format)
> @@ -604,34 +568,23 @@ static int imx214_set_format(struct v4l2_subdev *sd=
,
>         struct v4l2_rect *__crop;
>         const struct imx214_mode *mode;
>
> -       mutex_lock(&imx214->mutex);
> -
> -       __crop =3D __imx214_get_pad_crop(imx214, sd_state, format->pad,
> -                                      format->which);
> -
>         mode =3D v4l2_find_nearest_size(imx214_modes,
>                                       ARRAY_SIZE(imx214_modes), width, he=
ight,
>                                       format->format.width,
>                                       format->format.height);
>
> -       __crop->width =3D mode->width;
> -       __crop->height =3D mode->height;
> +       imx214_update_pad_format(imx214, mode, &format->format,
> +                                format->format.code);
> +       __format =3D v4l2_subdev_state_get_format(sd_state, 0);
>
> -       __format =3D __imx214_get_pad_format(imx214, sd_state, format->pa=
d,
> -                                          format->which);
> -       __format->width =3D __crop->width;
> -       __format->height =3D __crop->height;
> -       __format->code =3D IMX214_MBUS_CODE;
> -       __format->field =3D V4L2_FIELD_NONE;
> -       __format->colorspace =3D V4L2_COLORSPACE_SRGB;
> -       __format->ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(__format->colo=
rspace);
> -       __format->quantization =3D V4L2_MAP_QUANTIZATION_DEFAULT(true,
> -                               __format->colorspace, __format->ycbcr_enc=
);
> -       __format->xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(__format->colo=
rspace);
> +       *__format =3D format->format;
>
> -       format->format =3D *__format;
> +       __crop =3D v4l2_subdev_state_get_crop(sd_state, 0);
> +       __crop->width =3D mode->width;
> +       __crop->height =3D mode->height;
>
> -       mutex_unlock(&imx214->mutex);
> +       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> +               imx214->cur_mode =3D mode;
>
>         return 0;
>  }
> @@ -640,14 +593,9 @@ static int imx214_get_selection(struct v4l2_subdev *=
sd,
>                                 struct v4l2_subdev_state *sd_state,
>                                 struct v4l2_subdev_selection *sel)
>  {
> -       struct imx214 *imx214 =3D to_imx214(sd);
> -
>         switch (sel->target) {
>         case V4L2_SEL_TGT_CROP:
> -               mutex_lock(&imx214->mutex);
> -               sel->r =3D *__imx214_get_pad_crop(imx214, sd_state, sel->=
pad,
> -                                               sel->which);
> -               mutex_unlock(&imx214->mutex);
> +               sel->r =3D *v4l2_subdev_state_get_crop(sd_state, 0);
>                 return 0;
>
>         case V4L2_SEL_TGT_NATIVE_SIZE:
> @@ -826,40 +774,28 @@ static int imx214_write_table(struct imx214 *imx214=
,
>
>  static int imx214_start_streaming(struct imx214 *imx214)
>  {
> -       const struct imx214_mode *mode;
>         int ret;
>
> -       mutex_lock(&imx214->mutex);
>         ret =3D imx214_write_table(imx214, mode_table_common);
>         if (ret < 0) {
>                 dev_err(imx214->dev, "could not sent common table %d\n", =
ret);
> -               goto error;
> +               return ret;
>         }
>
> -       mode =3D v4l2_find_nearest_size(imx214_modes,
> -                               ARRAY_SIZE(imx214_modes), width, height,
> -                               imx214->fmt.width, imx214->fmt.height);
> -       ret =3D imx214_write_table(imx214, mode->reg_table);
> +       ret =3D imx214_write_table(imx214, imx214->cur_mode->reg_table);
>         if (ret < 0) {
>                 dev_err(imx214->dev, "could not sent mode table %d\n", re=
t);
> -               goto error;
> +               return ret;
>         }
>         ret =3D __v4l2_ctrl_handler_setup(&imx214->ctrls);
>         if (ret < 0) {
>                 dev_err(imx214->dev, "could not sync v4l2 controls\n");
> -               goto error;
> +               return ret;
>         }
>         ret =3D regmap_write(imx214->regmap, IMX214_REG_MODE_SELECT, IMX2=
14_MODE_STREAMING);
> -       if (ret < 0) {
> +       if (ret < 0)
>                 dev_err(imx214->dev, "could not sent start table %d\n", r=
et);
> -               goto error;
> -       }
>
> -       mutex_unlock(&imx214->mutex);
> -       return 0;
> -
> -error:
> -       mutex_unlock(&imx214->mutex);
>         return ret;
>  }
>
> @@ -877,6 +813,7 @@ static int imx214_stop_streaming(struct imx214 *imx21=
4)
>  static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
>  {
>         struct imx214 *imx214 =3D to_imx214(subdev);
> +       struct v4l2_subdev_state *state;
>         int ret;
>
>         if (enable) {
> @@ -884,7 +821,9 @@ static int imx214_s_stream(struct v4l2_subdev *subdev=
, int enable)
>                 if (ret < 0)
>                         return ret;
>
> +               state =3D v4l2_subdev_lock_and_get_active_state(subdev);
>                 ret =3D imx214_start_streaming(imx214);
> +               v4l2_subdev_unlock_state(state);
>                 if (ret < 0)
>                         goto err_rpm_put;
>         } else {
> @@ -948,7 +887,7 @@ static const struct v4l2_subdev_pad_ops imx214_subdev=
_pad_ops =3D {
>         .enum_mbus_code =3D imx214_enum_mbus_code,
>         .enum_frame_size =3D imx214_enum_frame_size,
>         .enum_frame_interval =3D imx214_enum_frame_interval,
> -       .get_fmt =3D imx214_get_format,
> +       .get_fmt =3D v4l2_subdev_get_fmt,
>         .set_fmt =3D imx214_set_format,
>         .get_selection =3D imx214_get_selection,
>         .get_frame_interval =3D imx214_get_frame_interval,
> @@ -1079,13 +1018,13 @@ static int imx214_probe(struct i2c_client *client=
)
>         pm_runtime_enable(imx214->dev);
>         pm_runtime_idle(imx214->dev);
>
> +       /* Set default mode to max resolution */
> +       imx214->cur_mode =3D &imx214_modes[0];
> +
>         ret =3D imx214_ctrls_init(imx214);
>         if (ret < 0)
>                 goto error_power_off;
>
> -       mutex_init(&imx214->mutex);
> -       imx214->ctrls.lock =3D &imx214->mutex;
> -
>         imx214->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
>         imx214->pad.flags =3D MEDIA_PAD_FL_SOURCE;
>         imx214->sd.dev =3D &client->dev;
> @@ -1097,20 +1036,27 @@ static int imx214_probe(struct i2c_client *client=
)
>                 goto free_ctrl;
>         }
>
> -       imx214_entity_init_state(&imx214->sd, NULL);
> +       imx214->sd.state_lock =3D imx214->ctrls.lock;
> +       ret =3D v4l2_subdev_init_finalize(&imx214->sd);
> +       if (ret < 0) {
> +               dev_err(dev, "subdev init error: %d\n", ret);
> +               goto free_entity;
> +       }
>
>         ret =3D v4l2_async_register_subdev_sensor(&imx214->sd);
>         if (ret < 0) {
>                 dev_err(dev, "could not register v4l2 device\n");
> -               goto free_entity;
> +               goto error_subdev_cleanup;
>         }
>
>         return 0;
>
> +error_subdev_cleanup:
> +       v4l2_subdev_cleanup(&imx214->sd);
> +
>  free_entity:
>         media_entity_cleanup(&imx214->sd.entity);
>  free_ctrl:
> -       mutex_destroy(&imx214->mutex);
>         v4l2_ctrl_handler_free(&imx214->ctrls);
>  error_power_off:
>         pm_runtime_disable(imx214->dev);
> @@ -1125,13 +1071,12 @@ static void imx214_remove(struct i2c_client *clie=
nt)
>         struct imx214 *imx214 =3D to_imx214(sd);
>
>         v4l2_async_unregister_subdev(&imx214->sd);
> +       v4l2_subdev_cleanup(sd);
>         media_entity_cleanup(&imx214->sd.entity);
>         v4l2_ctrl_handler_free(&imx214->ctrls);
>
>         pm_runtime_disable(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       mutex_destroy(&imx214->mutex);
>  }
>
>  static const struct of_device_id imx214_of_match[] =3D {
>
> --
> 2.47.1
>
>


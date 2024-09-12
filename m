Return-Path: <linux-media+bounces-18212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69411976AFD
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD582B21D98
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488B91BD002;
	Thu, 12 Sep 2024 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEtjPsw3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01551B12E4;
	Thu, 12 Sep 2024 13:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148448; cv=none; b=P/Plfeb+wKVP33NpcqNB/3F9Zx3Ja8/jhTV3HFBbLqrv9LJ9/k8BU8w21yjpmfgJNNQMeb3XIKmE1jvlFqjo4HDmWHcnXar2q8OFnQUX2tJ6pyqBqoCPixNd0IuNyZmR5TKrWJm8lfnF8Qk8zR0cbCsrnl/92Ml4eBbRU3896Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148448; c=relaxed/simple;
	bh=J3qRYWx6Obv/8Jk4V07VK47++xf5tjYuOwRmXzoBmdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GFF3X6aKo9KVE7RnULSppbVSyO2AQei2RbICNcgaSTulrZriDU+YwtwyDE3XJgteQmx4MkanepeTMYjYL2RYhq27G6s//15aVJ5X8Lhh3dmtwt5WXENDcYNlX9SLiFljO2gld0bmaH3dr2rs+lwkMBtQ4H4luCfZaRPxYvA7PAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEtjPsw3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29426C4CECD;
	Thu, 12 Sep 2024 13:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726148448;
	bh=J3qRYWx6Obv/8Jk4V07VK47++xf5tjYuOwRmXzoBmdk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GEtjPsw3w/+74xmqiQyYHOF/0AdIpkaFdL03Qbn7GS5Ls2WxI0aLfpzh8rozf4fae
	 yeQ1z075HuY3E2cJyutca+MewD62ClDJIJttnWZpmavGcIBFrU015ccU9PsR0TABLd
	 7FLwICOaQ0FqgKm0nMEaxrdfken80sCq9FQAWfLocN8KkDeUsvP6nPNtIBBfL3qYJT
	 flQjC0p+/IOHm/LxBOLbM9Z6lOZSGTsephuUnTjjYx6lZ/i4IqEe6Rh08r2X8/DeMb
	 hBkaXJEb055da19OR0fQpXKjOUMmuB7qr/9C68AROlNidG7xuWnRzFad8zV9kRvidl
	 4HVNiDWRHqLjg==
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-710da656c0bso370427a34.0;
        Thu, 12 Sep 2024 06:40:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUI5HdY4J+YfsjhBD62t2T5/Pe6L9dseF0Fv11qlFkUZXb6ICEHlPRs/pcK4cB9zg94CMik3qmmmWgila0=@vger.kernel.org, AJvYcCV5OxmyJruwxMF82tNwPtJfmtmoHY3+Vjn/vLJuEa9oe+xenPdy3CMvnxKTV7UPiUD20vWtBZaX2/txSfk=@vger.kernel.org, AJvYcCVuYt3lr/s3h97Ya0WSVgKzxk5cfo80fiVczfNpDbgbUrY49kWdYw7fU/P0OjPCh2xSWbBS4/onc7ihoU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuPr+li17ME905F8CdFvfEzXSw/xGhUFgy23Aq6wlXfvwfb8b6
	usGOY1G7zyYWWeOA5DcwCuTLdfJDhfrjACUpxzmhJTr7++w13G2iQWkbeCtInuKbfCND0HkvCU7
	gdvSA9bY7dXa86qa4sAhohfL9SG4=
X-Google-Smtp-Source: AGHT+IErXOncpLHOniHlrYCi1sMSwnScBPms2JT7LZ79r0s3QIvCUPm3kzKi0lMFycrztV7CVkQ/jnuNh0MvIsS2CUs=
X-Received: by 2002:a05:6358:988f:b0:1b1:a811:9e9c with SMTP id
 e5c5f4694b2df-1bb23ddc960mr124374855d.18.1726148447394; Thu, 12 Sep 2024
 06:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu> <20240902-imx214-v1-1-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-1-c96cba989315@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 12 Sep 2024 15:40:31 +0200
X-Gmail-Original-Message-ID: <CAPybu_1fDjUr4RSaxAropyDUTVoX8xntW_F0Fn5OdCLFue11cw@mail.gmail.com>
Message-ID: <CAPybu_1fDjUr4RSaxAropyDUTVoX8xntW_F0Fn5OdCLFue11cw@mail.gmail.com>
Subject: Re: [PATCH 01/13] media: i2c: imx214: Use subdev active state
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre

I don't have access to the hardware anymore, so I cannot test this...
but looking at the code I am not sure how it is working...

I would assume that after moving to the subdev active state, you need to re=
move

struct v4l2_mbus_framefmt fmt;
struct v4l2_rect crop;

for struct imx214.

After this patch it looks like you have left the driver in a state
where it is using imx214->fmt in imx214_start_streaming() and the
subdev active state in others.



On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> Port the imx214 sensor driver to use the subdev active state.
>
> Move all the format configuration to the subdevice state and simplify
> the format handling, locking and initialization.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 129 +++++++++++++--------------------------=
------
>  1 file changed, 38 insertions(+), 91 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 4962cfe7c83d..58f3c3f67e0d 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -71,12 +71,6 @@ struct imx214 {
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
> @@ -604,34 +568,19 @@ static int imx214_set_format(struct v4l2_subdev *sd=
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
> +       imx214_update_pad_format(imx214, mode, &format->format, format->f=
ormat.code);
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
> +       __format =3D v4l2_subdev_state_get_format(sd_state, 0);
> +       *__format =3D format->format;
>
> -       format->format =3D *__format;
> -
> -       mutex_unlock(&imx214->mutex);
> +       __crop =3D v4l2_subdev_state_get_crop(sd_state, 0);
> +       __crop->width =3D mode->width;
> +       __crop->height =3D mode->height;
>
>         return 0;
>  }
> @@ -640,14 +589,9 @@ static int imx214_get_selection(struct v4l2_subdev *=
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
> @@ -829,7 +773,6 @@ static int imx214_start_streaming(struct imx214 *imx2=
14)
>         const struct imx214_mode *mode;
>         int ret;
>
> -       mutex_lock(&imx214->mutex);
>         ret =3D imx214_write_table(imx214, mode_table_common);
>         if (ret < 0) {
>                 dev_err(imx214->dev, "could not sent common table %d\n", =
ret);
> @@ -855,11 +798,9 @@ static int imx214_start_streaming(struct imx214 *imx=
214)
>                 goto error;
>         }
>
> -       mutex_unlock(&imx214->mutex);
>         return 0;
>
>  error:
> -       mutex_unlock(&imx214->mutex);
>         return ret;
>  }
>
> @@ -877,6 +818,7 @@ static int imx214_stop_streaming(struct imx214 *imx21=
4)
>  static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
>  {
>         struct imx214 *imx214 =3D to_imx214(subdev);
> +       struct v4l2_subdev_state *state;
>         int ret;
>
>         if (enable) {
> @@ -884,7 +826,9 @@ static int imx214_s_stream(struct v4l2_subdev *subdev=
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
> @@ -948,7 +892,7 @@ static const struct v4l2_subdev_pad_ops imx214_subdev=
_pad_ops =3D {
>         .enum_mbus_code =3D imx214_enum_mbus_code,
>         .enum_frame_size =3D imx214_enum_frame_size,
>         .enum_frame_interval =3D imx214_enum_frame_interval,
> -       .get_fmt =3D imx214_get_format,
> +       .get_fmt =3D v4l2_subdev_get_fmt,
>         .set_fmt =3D imx214_set_format,
>         .get_selection =3D imx214_get_selection,
>         .get_frame_interval =3D imx214_get_frame_interval,
> @@ -1083,9 +1027,6 @@ static int imx214_probe(struct i2c_client *client)
>         if (ret < 0)
>                 goto error_power_off;
>
> -       mutex_init(&imx214->mutex);
> -       imx214->ctrls.lock =3D &imx214->mutex;
> -
>         imx214->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
>         imx214->pad.flags =3D MEDIA_PAD_FL_SOURCE;
>         imx214->sd.dev =3D &client->dev;
> @@ -1097,20 +1038,27 @@ static int imx214_probe(struct i2c_client *client=
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
> @@ -1125,13 +1073,12 @@ static void imx214_remove(struct i2c_client *clie=
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
> 2.46.0
>
>


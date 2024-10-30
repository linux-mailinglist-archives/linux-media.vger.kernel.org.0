Return-Path: <linux-media+bounces-20587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2EE9B61F8
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 12:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 525EC1C21E33
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 11:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097211E500F;
	Wed, 30 Oct 2024 11:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efIpLUtW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501E41E00B6;
	Wed, 30 Oct 2024 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730288192; cv=none; b=e639xWooZg4uRXSolzxKvW18ESHzYHhdvZ8PA2Pe8wzS1tzdMC6M/Jc8hrah04pLD/2KqnQy/GsOF+Rh0I80nKXVJ7Cilli8fb78tztMhwchJjepMBCpCTp5FOMvyLeqnA82rfEYj1gr7sH0sgZlCsyI8qRspcbqgsOCCuuGYac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730288192; c=relaxed/simple;
	bh=EiYLID+rEnnp/6r5IBCq2DGwVezS7+Z7vQIbpQIMvVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7EEhpjNXLc585gN4IJDGlVo0rQOS9KsNjwdjeOViikaAxLdDF1BfoB4Gwbcd7BqhToCCHRGpwvH6XICglgbhFIhSiI3vwb5JZvrQekuuChUyTkVNw7qs9V4A2T9rzdjSWZZK/lmAzXvkVBOalN1Fw0UF7GtD6+uSTLo0Wfazb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efIpLUtW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4383C4CEE8;
	Wed, 30 Oct 2024 11:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730288191;
	bh=EiYLID+rEnnp/6r5IBCq2DGwVezS7+Z7vQIbpQIMvVc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=efIpLUtWWsYY19Ie8ihxuUy70vSKSSjt7dxGOW92VaYOQhWsyaw8ySQa//wVkhM4A
	 qnVcrezFVRC6Tg6PVYohUiR2IWgq4F/Er2HqkeCmopGM5KNoPKT8cbBGqsC4HiHPBn
	 KGvp1qH7UBVuIPF1m5lyHluuwKXdcX6sbs5b83Z3oD/HVC7tdsmUW+HTuGKRfu1r4C
	 1o9s3fFyJPmKZVy/pk+yP28gW2VNgxyqcAG+b1FCnD6D18qRIhrqxglwYFbCEPBJs9
	 E30j8ECOgX+c/RuU4lQbZpqJAaIjZcBJv2aBc+fEBVZ2ibn8R0w7w3KYwp2s2X/m+4
	 azCehS1N326gQ==
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4a47f8a9168so2164824137.0;
        Wed, 30 Oct 2024 04:36:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBpGGQRAhuBZAnlvYGITb/gR3Xps3FSsYELfPBKKYO/J4bR5ei/vWkW4+GWQ1qDBEzVSH6QkyJh+sNFx0=@vger.kernel.org, AJvYcCUT6fm3bafuY+dyIvtQauPzEfxZiLE6hc8j8wepdy5gyzjJwFYLvQYkoL2nMX98JS4S/GPEYG++kfNT04Q=@vger.kernel.org, AJvYcCWUem70JF0m7kwcV5bSAx/mAY34YpCQyfcQHZwJxvysAovrzolzs7/phBch9v51Fsy4e9SHPxDoUEu+e3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOTL9frgzL8dWSmgUPNrnxQu+RaW4KU1GcSSLGfbVex8lDtuyl
	mqIqIX7QW/yiMZseUodQL8cZfRoPT9s4b/hEn0yGFVbap0ZWWiY6QpdbKwSsvWViqqmoqFRkVWk
	ZTRttC2NTG91SV2VCeRO8xf/qixE=
X-Google-Smtp-Source: AGHT+IE/bopOPlbzo3kOBz/rvslHjk/wORt+a1z55e2PGl4vpTj7SqPpWOmXx+xmV9aA3aGKkM6gFW2L0+J3+716734=
X-Received: by 2002:a05:6102:2aca:b0:4a7:502c:5fcc with SMTP id
 ada2fe7eead31-4a8cfb44d47mr13612992137.5.1730288190776; Wed, 30 Oct 2024
 04:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu> <20241021-imx214-v2-2-fbd23e99541e@apitzsch.eu>
In-Reply-To: <20241021-imx214-v2-2-fbd23e99541e@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Wed, 30 Oct 2024 12:36:13 +0100
X-Gmail-Original-Message-ID: <CAPybu_2eeUCPgeg9-D9DRTFgZXDRMwwrwfeW29_yr8Se50+gGA@mail.gmail.com>
Message-ID: <CAPybu_2eeUCPgeg9-D9DRTFgZXDRMwwrwfeW29_yr8Se50+gGA@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] media: i2c: imx214: Use subdev active state
To: git@apitzsch.eu
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

It looks good to me, but I would like Sakari to review it. I am not
sure if it is ok to keep the cur_mode variable.

On Mon, Oct 21, 2024 at 12:14=E2=80=AFAM Andr=C3=A9 Apitzsch via B4 Relay
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
> ---
>  drivers/media/i2c/imx214.c | 159 +++++++++++++++------------------------=
------
>  1 file changed, 53 insertions(+), 106 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 5d411452d342fdb177619cd1c9fd9650d31089bb..990fd0811904fc478c05d6405=
4089fc2879cae94 100644
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
> @@ -604,34 +568,25 @@ static int imx214_set_format(struct v4l2_subdev *sd=
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
> +       if (imx214->cur_mode =3D=3D mode && __format->code =3D=3D format-=
>format.code)
> +               return 0;
>

Isnt'   if (imx214->cur_mode =3D=3D mode) enough?


> -       format->format =3D *__format;
> +       *__format =3D format->format;
>
> -       mutex_unlock(&imx214->mutex);
> +       __crop =3D v4l2_subdev_state_get_crop(sd_state, 0);
> +       __crop->width =3D mode->width;
> +       __crop->height =3D mode->height;
> +
> +       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> +               imx214->cur_mode =3D mode;
>
>         return 0;
>  }
> @@ -640,14 +595,9 @@ static int imx214_get_selection(struct v4l2_subdev *=
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
> @@ -826,40 +776,28 @@ static int imx214_write_table(struct imx214 *imx214=
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
> @@ -877,6 +815,7 @@ static int imx214_stop_streaming(struct imx214 *imx21=
4)
>  static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
>  {
>         struct imx214 *imx214 =3D to_imx214(subdev);
> +       struct v4l2_subdev_state *state;
>         int ret;
>
>         if (enable) {
> @@ -884,7 +823,9 @@ static int imx214_s_stream(struct v4l2_subdev *subdev=
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
> @@ -948,7 +889,7 @@ static const struct v4l2_subdev_pad_ops imx214_subdev=
_pad_ops =3D {
>         .enum_mbus_code =3D imx214_enum_mbus_code,
>         .enum_frame_size =3D imx214_enum_frame_size,
>         .enum_frame_interval =3D imx214_enum_frame_interval,
> -       .get_fmt =3D imx214_get_format,
> +       .get_fmt =3D v4l2_subdev_get_fmt,
>         .set_fmt =3D imx214_set_format,
>         .get_selection =3D imx214_get_selection,
>         .get_frame_interval =3D imx214_get_frame_interval,
> @@ -1079,13 +1020,13 @@ static int imx214_probe(struct i2c_client *client=
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
> 2.47.0
>
>


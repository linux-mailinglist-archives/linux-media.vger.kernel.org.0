Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E286D35FA
	for <lists+linux-media@lfdr.de>; Sun,  2 Apr 2023 09:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbjDBHt4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 03:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDBHt4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 03:49:56 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D74CC19
        for <linux-media@vger.kernel.org>; Sun,  2 Apr 2023 00:49:54 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id t19so25596406qta.12
        for <linux-media@vger.kernel.org>; Sun, 02 Apr 2023 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680421793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbsgdruyEqSGoJq8B1DfhZWOcYwsIgzwvA6tupigzI0=;
        b=IPS9bIv442HLAwMo8pUae1YVXWAj/gMpIeO0xwkdwwFh+R/JfvCYykMKkFN33XsD78
         BHhr144aqkotAOmJXwBJEKTsn5yYvvBf8AODAMdnBMlrsEvCFV9UOY/OeDC1hLDZcLz/
         w9urKG0z8wktwa3khUdN1pLWbcdeFxP7kCOGtDV+lQNqws7ZP2s62oIEZUDhRBa291xl
         xS6AzX1Qa1R7LQSEg19bCSD0lTMb2/CDiRvmKGlzUAeAdZW1FtbWgTDKPbe8Ypgc0XEI
         YYqjnZOVmjcDFENk3MY5XZ3l8c0Dnxy7YpCr0UrMmoKcNwuPVytE3T9iw9sYoyOjUjR0
         9JCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680421793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbsgdruyEqSGoJq8B1DfhZWOcYwsIgzwvA6tupigzI0=;
        b=3OR/4azqnJ6zKdqW2906hOBLZib38hAUPxwrUKEsqslwUvGLrO0lgQi6UjqSEcNYKd
         00kyccB8sfYaMWGGCLsPsmEfRIeNzZ94632DuZ1NQ6Zj4zF8mKMFJo0cIF/RPW8/lmrh
         EZoRXLN2AjvsOePWW+f8RT6R1ES1/OzoqErbRDSuc/QIdy1BAlf1VqBfINsWtZU+7mA3
         +fffSsPTF/ZlU1ROzdqbX8n3irrTIIyoiqZ50b/WDdXuEjhMJZcwebX/39Cnyn7lUdW9
         G7S4stEgWaVvk6Wwc7xT/r61jprvpm2O4PkEpyK/pDaa4NqFnpIW4nV1FEz+TbtPYwZP
         78rA==
X-Gm-Message-State: AO0yUKXtAdQe6J80+ex2+MiKmWu5KW5K1I/weUYqcW56/QIWLz6PYoYZ
        yFxpWVTkZPmrOY4km+rmOVN8W0t64GfvGyejRMo=
X-Google-Smtp-Source: AK7set+hEFbKvL5VaB/Mp+6uyXmcAn+PVHRj3n/azc1stW9VqH9za+7bVuRmoGdiL1+xy04kh0NLRmHNbfD8W3mm7YA=
X-Received: by 2002:a05:622a:199a:b0:3e2:efb6:9d9e with SMTP id
 u26-20020a05622a199a00b003e2efb69d9emr11205557qtc.0.1680421793531; Sun, 02
 Apr 2023 00:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-13-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-13-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 2 Apr 2023 09:49:17 +0200
Message-ID: <CAHp75Vc8sWQ_iyrg56w-u=kTOJGTfOP9HWQBWLHjyv=FB6pLRg@mail.gmail.com>
Subject: Re: [PATCH 12/28] media: atomisp: gc0310: Add exposure and gain controls
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 1, 2023 at 5:00=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Add exposure and gain controls. This allows controlling
> the exposure and gain through standard v4l2 IOCTLs.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/i2c/atomisp-gc0310.c        | 93 ++++++++++++++++---
>  drivers/staging/media/atomisp/i2c/gc0310.h    |  7 +-
>  2 files changed, 86 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers=
/staging/media/atomisp/i2c/atomisp-gc0310.c
> index 115493641010..6c0877ab96e3 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -57,14 +57,64 @@ static int gc0310_write_reg_array(struct i2c_client *=
client,
>         return 0;
>  }
>
> +static int gc0310_exposure_set(struct gc0310_device *dev, u32 exp)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&dev->sd);
> +
> +       return i2c_smbus_write_word_swapped(client, GC0310_AEC_PK_EXPO_H,=
 exp);
> +}
> +
> +static int gc0310_gain_set(struct gc0310_device *dev, u32 gain)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&dev->sd);
> +       u8 again, dgain;
> +       int ret;
> +
> +       /* Taken from original driver, this never sets dgain lower then 3=
2? */
> +
> +       /* Change 0 - 95 to 32 - 127 */
> +       gain +=3D 32;
> +
> +       if (gain < 64) {
> +               again =3D 0x0; /* sqrt(2) */
> +               dgain =3D gain;
> +       } else {
> +               again =3D 0x2; /* 2 * sqrt(2) */
> +               dgain =3D gain / 2;
> +       }
> +
> +       ret =3D i2c_smbus_write_byte_data(client, GC0310_AGC_ADJ, again);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D i2c_smbus_write_byte_data(client, GC0310_DGC_ADJ, dgain);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

Can be

  return i2c_smbus_...;

> +}
> +
>  static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
> -       int ret =3D 0;
> +       struct gc0310_device *dev =3D
> +               container_of(ctrl->handler, struct gc0310_device, ctrls.h=
andler);
> +       int ret;
> +
> +       if (!dev->power_on)
> +               return 0;
>
>         switch (ctrl->id) {
> +       case V4L2_CID_EXPOSURE:
> +               ret =3D gc0310_exposure_set(dev, ctrl->val);
> +               break;
> +       case V4L2_CID_GAIN:
> +               ret =3D gc0310_gain_set(dev, ctrl->val);
> +               break;
>         default:
>                 ret =3D -EINVAL;
> +               break;
>         }
> +
>         return ret;

You can return directly from the switch cases. No need to utilise the
ret variable in it.

>  }
>
> @@ -83,13 +133,18 @@ static int gc0310_init(struct v4l2_subdev *sd)
>         /* set initial registers */
>         ret =3D gc0310_write_reg_array(client, gc0310_reset_register,
>                                      ARRAY_SIZE(gc0310_reset_register));
> +       if (ret)
> +               goto out_unlock;
>
>         /* restore settings */
>         gc0310_res =3D gc0310_res_preview;
>         N_RES =3D N_RES_PREVIEW;
>
> -       mutex_unlock(&dev->input_lock);
> +       /* restore value of all ctrls */
> +       ret =3D __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
>
> +out_unlock:
> +       mutex_unlock(&dev->input_lock);
>         return ret;
>  }
>
> @@ -545,6 +600,26 @@ static const struct v4l2_subdev_ops gc0310_ops =3D {
>         .sensor =3D &gc0310_sensor_ops,
>  };
>
> +static int gc0310_init_controls(struct gc0310_device *dev)
> +{
> +       struct v4l2_ctrl_handler *hdl =3D &dev->ctrls.handler;
> +
> +       v4l2_ctrl_handler_init(hdl, 2);
> +
> +       /* Use same lock for controls as for everything else. */

the same

(and probably drop the period, since it's one-liner comment)

> +       hdl->lock =3D &dev->input_lock;
> +       dev->sd.ctrl_handler =3D hdl;
> +
> +       dev->ctrls.exposure =3D
> +               v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_EXPOSURE, 0, 4=
095, 1, 1023);
> +
> +       /* 32 steps at base gain 1 + 64 half steps at base gain 2 */
> +       dev->ctrls.gain =3D
> +               v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_GAIN, 0, 95, 1=
, 31);
> +
> +       return hdl->error;
> +}
> +
>  static void gc0310_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> @@ -556,7 +631,7 @@ static void gc0310_remove(struct i2c_client *client)
>
>         v4l2_device_unregister_subdev(sd);
>         media_entity_cleanup(&dev->sd.entity);
> -       v4l2_ctrl_handler_free(&dev->ctrl_handler);
> +       v4l2_ctrl_handler_free(&dev->ctrls.handler);
>         kfree(dev);
>  }
>
> @@ -595,21 +670,13 @@ static int gc0310_probe(struct i2c_client *client)
>         dev->pad.flags =3D MEDIA_PAD_FL_SOURCE;
>         dev->format.code =3D MEDIA_BUS_FMT_SGRBG8_1X8;
>         dev->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> -       ret =3D v4l2_ctrl_handler_init(&dev->ctrl_handler, 0);
> +
> +       ret =3D gc0310_init_controls(dev);
>         if (ret) {
>                 gc0310_remove(client);
>                 return ret;
>         }
>
> -       if (dev->ctrl_handler.error) {
> -               gc0310_remove(client);
> -               return dev->ctrl_handler.error;
> -       }
> -
> -       /* Use same lock for controls as for everything else. */
> -       dev->ctrl_handler.lock =3D &dev->input_lock;
> -       dev->sd.ctrl_handler =3D &dev->ctrl_handler;
> -
>         ret =3D media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
>         if (ret)
>                 gc0310_remove(client);
> diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging=
/media/atomisp/i2c/gc0310.h
> index 540334bc7b0e..c15ca2b807f9 100644
> --- a/drivers/staging/media/atomisp/i2c/gc0310.h
> +++ b/drivers/staging/media/atomisp/i2c/gc0310.h
> @@ -126,12 +126,17 @@ struct gc0310_device {
>         struct media_pad pad;
>         struct v4l2_mbus_framefmt format;
>         struct mutex input_lock;
> -       struct v4l2_ctrl_handler ctrl_handler;
>
>         struct camera_sensor_platform_data *platform_data;
>         struct gc0310_resolution *res;
>         u8 type;
>         bool power_on;
> +
> +       struct gc0310_ctrls {
> +               struct v4l2_ctrl_handler handler;
> +               struct v4l2_ctrl *exposure;
> +               struct v4l2_ctrl *gain;
> +       } ctrls;
>  };
>
>  /**
> --
> 2.39.1
>


--=20
With Best Regards,
Andy Shevchenko

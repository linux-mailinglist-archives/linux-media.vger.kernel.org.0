Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8B0E6D35E5
	for <lists+linux-media@lfdr.de>; Sun,  2 Apr 2023 09:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjDBHV4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 03:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDBHVz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 03:21:55 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C481E716
        for <linux-media@vger.kernel.org>; Sun,  2 Apr 2023 00:21:51 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id n14so25572042qta.10
        for <linux-media@vger.kernel.org>; Sun, 02 Apr 2023 00:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680420110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjdq4i/yvr99yDoA8fH6nnKaTHAm/8hSqA9UfaiODCA=;
        b=eWQpGXmy4MRER1kHXqDABDPZXyJRPZbBC40LgLO9t5Ds1cc3iFnmDs/QxenV0ZigMZ
         3ty3a8km3R1ZUF+rmHM99XKhrOq8sa1WEPGjNt6QCSuSdeLEFPJHHfiqPxZUUQYtXoNV
         lpCn4sF0Dr8cgsOyF0XUABQZ1m80YoP3Stnp3rRMGP1ePIP77tlcyoK/jXFrpbml18fa
         l54xsZDWU/vCkw1G79i0EE74cUQfPLOy3aT9DnqGr+9m5zz+9oy2YoXfJlw+rWLa18iZ
         i+SPilGcg/gw0QmtjkGscOMBJGvaqMblXSEMgWeZqPteI0duy+CiuqdKzbtaOmj+lMKg
         YG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680420110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjdq4i/yvr99yDoA8fH6nnKaTHAm/8hSqA9UfaiODCA=;
        b=lPplUbBAayCb7U3EdC66il51DQS+M2Os1IMhsSrGepEcJz2Ci7SHcOewYLDZtQF+So
         QR9rh26D+hQWUJk1Brvo+0zAM/RyQSpQTCKNEivtMY05SPB1IRoORDJZTopvIcvn0dsu
         urhzUUQWBKCfNKTmKql/Zm2sQlHxc2BkL7Itf+d73OKAgqs7+3wqZHI8JPCyLD9rlK9m
         UvjV39hu97MlzVn8umfEd9o9DLc9k18OlslhfaC+dqTKXGTUioTopEpscUtkO3Y6XTT8
         6GkcvHUGy3NMXHU0G3aP2cxu8gBX0wzFLH1jLYA5bcinqOec8Utyy4SYhGqIVjtqAzns
         hfDg==
X-Gm-Message-State: AO0yUKXoCDvJGpf8uWqcudX0lLyo8mX8T9vbCazUlAhUlbD7/4eWyBU4
        isKRi1Yy06QJJJgFJgkxe0CWH1PvmZdwgs9Yi0D+D81rWgsfbQ==
X-Google-Smtp-Source: AK7set+/o8I+pOM249w+yltK84BH9CxqpLGT0JxmGLIHPa7+wKv0vGMsmocxR3xdstMrH2OiHznM3LrlCcLjvqviypQ=
X-Received: by 2002:a05:622a:b:b0:3df:58e7:4aa5 with SMTP id
 x11-20020a05622a000b00b003df58e74aa5mr12411156qtw.0.1680420110420; Sun, 02
 Apr 2023 00:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-4-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-4-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 2 Apr 2023 09:21:14 +0200
Message-ID: <CAHp75VeOtAsXLDjn4zQ9JZ7LvbLkGPGw_wt_iyW3GrMAJStRSw@mail.gmail.com>
Subject: Re: [PATCH 03/28] media: atomisp: ov2680: Error handling fixes
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

On Sat, Apr 1, 2023 at 4:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Fix s_stream error handling

This looks like it should be part of the Subject (missing period).

>
> Fix 3 error handling issues:
>
> 1. In ov2680_s_stream(), when pm_runtime_get_sync() fails it will still
>    have incremented the pm-runtime reference count so we need to call
>    pm_runtime_put()
>
> 2. In ov2680_s_stream() sensor->is_streaming should always be set to fals=
e
>    when the sensor is powered-off even on i2c-communication errors.
>
> 3. In ov2680_probe(), call ov2680_remove() on ov2680_s_config() errors,
>    so that pm_runtime_disable() is properly called to disable the
>    runtime-pm which has been enabled before the ov2680_s_config() call.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers=
/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 3181276ed027..63de214916f5 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -419,7 +419,7 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, in=
t enable)
>         if (enable) {
>                 ret =3D pm_runtime_get_sync(sensor->sd.dev);
>                 if (ret < 0)
> -                       goto error_unlock;
> +                       goto error_power_down;
>
>                 ret =3D ov2680_set_mode(sensor);
>                 if (ret)
> @@ -447,6 +447,7 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, in=
t enable)
>
>  error_power_down:
>         pm_runtime_put(sensor->sd.dev);
> +       sensor->is_streaming =3D false;
>  error_unlock:
>         mutex_unlock(&sensor->input_lock);
>         return ret;
> @@ -644,8 +645,10 @@ static int ov2680_probe(struct i2c_client *client)
>         pm_runtime_use_autosuspend(dev);
>
>         ret =3D ov2680_s_config(&sensor->sd);
> -       if (ret)
> +       if (ret) {
> +               ov2680_remove(client);
>                 return ret;
> +       }
>
>         sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
>         sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> --
> 2.39.1
>


--=20
With Best Regards,
Andy Shevchenko

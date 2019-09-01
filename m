Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D85A7A4C2D
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 23:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728961AbfIAVJh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Sep 2019 17:09:37 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:34466 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728879AbfIAVJh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Sep 2019 17:09:37 -0400
Received: by mail-vk1-f195.google.com with SMTP id h192so2533645vka.1;
        Sun, 01 Sep 2019 14:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DfGhQUmQlwEd5V4oXs2IzZtixormXOqOwnL2xnoqQO4=;
        b=W4iIHDm3oY7OJj5vFvVR6rgCLf7A7S7MGzlJdwjqJCtCj/5HTgpkyKsN4lo4tHF67e
         1CsxJ/0OGCN+IxUtgowLlcTJ7u+POYL3KZ/fuqiy73EK2l+rdg2yXG2ASoRsthGTlft0
         4soCnpf9aXNj/BPewuOGyB6JuuwbJ2y/xYaOQq4ilNGZ1DolmrkJhZIJl/S6OFJUUU/L
         1O3sOl8ZUx1tk4TAA1WEEO0vLv3AMn7dT7sYVQYBc3YvDqrjsR4ucwhVswhLbPVob333
         ZSxtdjcwpn82vAjnxntzbLF5lZs2hgOzWXsZ3v4dJrOtvvMFc4jvos05cB8fhyKV9M3l
         JZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DfGhQUmQlwEd5V4oXs2IzZtixormXOqOwnL2xnoqQO4=;
        b=SSUiNXoMJmsNUk5XnHKQ3I5C/4RjJ63k3VXcFHcTc2Ac1FQo0ViCWaN08TZAUSi+Vg
         URHHZoF6/7gQvRqIpjNVsjUqFLFQZmJ/o+2y278JjQ/PXzzVUSChrwGB8w0+lQCbXyGD
         j1xosK6kyiRyoJhw9L+HbPgnV6ZxEbH8XGjaqqAilQTQEcFnLIVd8SPDPiLGmUIk+xt1
         ITat57A2zqLHlatAYLts3570czqtJbj0P5KQOn+MuvhQjMW3vqtJkd+gM7sLRAMAwNe1
         JbP8Sptc+c5sI0GJ1sTUlMBnbeXG46NK/7/M3O3Bg5plvCyZQ7OqfKeuL7tyjiH6HDhm
         D58g==
X-Gm-Message-State: APjAAAWKm+BwZ1xq6vNXBZ2jQTjv1H/PBTWy7BspzHM79wNxjx7+qmC6
        xDnQ9y+bN+qmPglfAbzVRxqDJ5A3tfXAaAzqTRQ=
X-Google-Smtp-Source: APXvYqxUJ0d83F1un8auPSzaixU7Q6Rx9eWc6bIv/wFgXZR9CSUY8ozE5mXQHw+YOzzdzYYeKAWZin+4xfIRSqeWi/o=
X-Received: by 2002:a1f:d586:: with SMTP id m128mr12870062vkg.24.1567372175232;
 Sun, 01 Sep 2019 14:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190901194032.16207-1-arthurmoraeslago@gmail.com>
In-Reply-To: <20190901194032.16207-1-arthurmoraeslago@gmail.com>
From:   =?UTF-8?B?TGHDrXMgUGM=?= <laispc19@gmail.com>
Date:   Sun, 1 Sep 2019 18:09:23 -0300
Message-ID: <CAG=BupUy+93XBz-6-oSDqm9+hGsxpQOwiGLt_Jgg4fouNfDE0w@mail.gmail.com>
Subject: Re: [Lkcamp] [PATCH] media: vimc: Implement debayer control for mean
 window size
To:     Arthur Moraes do Lago <arthurmoraeslago@gmail.com>
Cc:     helen.koike@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org, hverkuil-cisco@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em dom, 1 de set de 2019 =C3=A0s 16:41, Arthur Moraes do Lago
<arthurmoraeslago@gmail.com> escreveu:
>
> Add mean window size parameter for debayer filter as a control in
> vimc-debayer.
>
> vimc-debayer was patched to allow changing mean windows parameter
> of the filter without needing to reload the driver. The parameter
> can now be set using a v4l2-ctl control(mean_window_size).
>
> Co-developed-by: La=C3=ADs Pessine do Carmo <laispc19@gmail.com>
> Signed-off-by: La=C3=ADs Pessine do Carmo <laispc19@gmail.com>
> Signed-off-by: Arthur Moraes do Lago <arthurmoraeslago@gmail.com>
>
> ---
> This patch was made on top of Shuah Khan's patch (162623).
> Thanks.

We refered to the patch ID from patchwork.kernel.org, but actually the
patch series is named "Collapse vimc single monolithic driver".
Thanks.

> ---
>  drivers/media/platform/vimc/vimc-common.h  |  1 +
>  drivers/media/platform/vimc/vimc-debayer.c | 81 ++++++++++++++++++----
>  2 files changed, 70 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/pl=
atform/vimc/vimc-common.h
> index 5b2282de395c..547ff04a415e 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -19,6 +19,7 @@
>  #define VIMC_CID_VIMC_BASE             (0x00f00000 | 0xf000)
>  #define VIMC_CID_VIMC_CLASS            (0x00f00000 | 1)
>  #define VIMC_CID_TEST_PATTERN          (VIMC_CID_VIMC_BASE + 0)
> +#define VIMC_CID_MEAN_WIN_SIZE         (VIMC_CID_VIMC_BASE + 1)
>
>  #define VIMC_FRAME_MAX_WIDTH 4096
>  #define VIMC_FRAME_MAX_HEIGHT 2160
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/p=
latform/vimc/vimc-debayer.c
> index 6cee911bf149..aa3edeed96bc 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -11,17 +11,11 @@
>  #include <linux/platform_device.h>
>  #include <linux/vmalloc.h>
>  #include <linux/v4l2-mediabus.h>
> +#include <media/v4l2-ctrls.h>
>  #include <media/v4l2-subdev.h>
>
>  #include "vimc-common.h"
>
> -static unsigned int deb_mean_win_size =3D 3;
> -module_param(deb_mean_win_size, uint, 0000);
> -MODULE_PARM_DESC(deb_mean_win_size, " the window size to calculate the m=
ean.\n"
> -       "NOTE: the window size needs to be an odd number, as the main pix=
el "
> -       "stays in the center of the window, otherwise the next odd number=
 "
> -       "is considered");
> -
>  #define IS_SINK(pad) (!pad)
>  #define IS_SRC(pad)  (pad)
>
> @@ -49,6 +43,8 @@ struct vimc_deb_device {
>         u8 *src_frame;
>         const struct vimc_deb_pix_map *sink_pix_map;
>         unsigned int sink_bpp;
> +       unsigned int mean_win_size;
> +       struct v4l2_ctrl_handler hdl;
>  };
>
>  static const struct v4l2_mbus_framefmt sink_fmt_default =3D {
> @@ -387,7 +383,7 @@ static void vimc_deb_calc_rgb_sink(struct vimc_deb_de=
vice *vdeb,
>          * the top left corner of the mean window (considering the curren=
t
>          * pixel as the center)
>          */
> -       seek =3D deb_mean_win_size / 2;
> +       seek =3D vdeb->mean_win_size / 2;
>
>         /* Sum the values of the colors in the mean window */
>
> @@ -477,6 +473,33 @@ static void *vimc_deb_process_frame(struct vimc_ent_=
device *ved,
>
>  }
>
> +static inline void vimc_deb_s_mean_win_size(struct vimc_deb_device *vdeb=
,
> +                                           unsigned int mean_win_size)
> +{
> +               if (vdeb->mean_win_size =3D=3D mean_win_size)
> +                       return;
> +               vdeb->mean_win_size =3D mean_win_size;
> +}
> +
> +static int vimc_deb_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct vimc_deb_device *vdeb =3D
> +               container_of(ctrl->handler, struct vimc_deb_device, hdl);
> +
> +       switch (ctrl->id) {
> +       case VIMC_CID_MEAN_WIN_SIZE:
> +               vimc_deb_s_mean_win_size(vdeb, ctrl->val);
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +       return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops vimc_deb_ctrl_ops =3D {
> +       .s_ctrl =3D vimc_deb_s_ctrl,
> +};
> +
>  static void vimc_deb_release(struct v4l2_subdev *sd)
>  {
>         struct vimc_deb_device *vdeb =3D
> @@ -502,6 +525,24 @@ void vimc_deb_rm(struct vimc_device *vimc, struct vi=
mc_ent_config *vcfg)
>         vimc_ent_sd_unregister(ved, &vdeb->sd);
>  }
>
> +static const struct v4l2_ctrl_config vimc_deb_ctrl_class =3D {
> +       .flags =3D V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY,
> +       .id =3D VIMC_CID_VIMC_CLASS,
> +       .name =3D "VIMC Controls",
> +       .type =3D V4L2_CTRL_TYPE_CTRL_CLASS,
> +};
> +
> +static const struct v4l2_ctrl_config vimc_deb_ctrl_mean_win_size =3D {
> +       .ops =3D &vimc_deb_ctrl_ops,
> +       .id =3D VIMC_CID_MEAN_WIN_SIZE,
> +       .name =3D "Mean window size",
> +       .type =3D V4L2_CTRL_TYPE_INTEGER,
> +       .min =3D 1,
> +       .max =3D 99,
> +       .step =3D 2,
> +       .def =3D 3,
> +};
> +
>  int vimc_deb_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
>  {
>         struct v4l2_device *v4l2_dev =3D &vimc->v4l2_dev;
> @@ -513,6 +554,16 @@ int vimc_deb_add(struct vimc_device *vimc, struct vi=
mc_ent_config *vcfg)
>         if (!vdeb)
>                 return -ENOMEM;
>
> +       /* Create controls: */
> +       v4l2_ctrl_handler_init(&vdeb->hdl, 2);
> +       v4l2_ctrl_new_custom(&vdeb->hdl, &vimc_deb_ctrl_class, NULL);
> +       v4l2_ctrl_new_custom(&vdeb->hdl, &vimc_deb_ctrl_mean_win_size, NU=
LL);
> +       vdeb->sd.ctrl_handler =3D &vdeb->hdl;
> +       if (vdeb->hdl.error) {
> +               ret =3D vdeb->hdl.error;
> +               goto err_free_vdeb;
> +       }
> +
>         /* Initialize ved and sd */
>         ret =3D vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
>                                    vcfg->name,
> @@ -520,13 +571,12 @@ int vimc_deb_add(struct vimc_device *vimc, struct v=
imc_ent_config *vcfg)
>                                    (const unsigned long[2]) {MEDIA_PAD_FL=
_SINK,
>                                    MEDIA_PAD_FL_SOURCE},
>                                    &vimc_deb_int_ops, &vimc_deb_ops);
> -       if (ret) {
> -               kfree(vdeb);
> -               return ret;
> -       }
> +       if (ret)
> +               goto err_free_hdl;
>
>         vdeb->ved.process_frame =3D vimc_deb_process_frame;
>         vdeb->dev =3D &vimc->pdev.dev;
> +       vdeb->mean_win_size =3D vimc_deb_ctrl_mean_win_size.def;
>
>         /* Initialize the frame format */
>         vdeb->sink_fmt =3D sink_fmt_default;
> @@ -541,4 +591,11 @@ int vimc_deb_add(struct vimc_device *vimc, struct vi=
mc_ent_config *vcfg)
>
>         vcfg->ved =3D &vdeb->ved;
>         return 0;
> +
> +err_free_hdl:
> +       v4l2_ctrl_handler_free(&vdeb->hdl);
> +err_free_vdeb:
> +       kfree(vdeb);
> +
> +       return ret;
>  }
> --
> 2.23.0
>
>
> _______________________________________________
> Lkcamp mailing list
> Lkcamp@lists.libreplanetbr.org
> https://lists.libreplanetbr.org/mailman/listinfo/lkcamp



--=20
La=C3=ADs Pessine do Carmo
Engenharia de Computa=C3=A7=C3=A3o 011 - USP S=C3=A3o Carlos

  Membro Semear : Rob=C3=B3tica

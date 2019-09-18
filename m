Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C903B5985
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 04:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbfIRCJJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 22:09:09 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41631 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfIRCJJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 22:09:09 -0400
Received: by mail-lf1-f67.google.com with SMTP id r2so4393304lfn.8;
        Tue, 17 Sep 2019 19:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xq0kveLxNE2T3ls2LyEmKYvxLimXT94JtNx3OU+CAtM=;
        b=C3Mw1aJQ0SCjMaVZZvEWoUApJymRtWWleVo9I7ZMHOLElwlJrWxEvybQ20v04xV1VU
         oTW9DXVQwQVEfhC9/6c8ejdwbOQDj+m97q3q3HfBKejGxDPVRQpmWUcNNemz+0BfaNzO
         GeAbQTqH8O4GyBHWfKEqU6kmM1KBLy9Ze7sQJ+u9iP5XVfqRt/GlhRTq+Wved08OZirx
         y2PZ55hlQdl7PFXdEtEocGKTBb8uAbgvINLdNtHDHufJOPbwDPuV7SPwz4mmeqo8R3aO
         nEMlg6F6ENFhlPA78FJXrtbgiOVyrXii6saRtGMi0ml0S7c3QLLFFxME8n3IJe3E8mMr
         Fu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xq0kveLxNE2T3ls2LyEmKYvxLimXT94JtNx3OU+CAtM=;
        b=c244pMWTpKpnb4JdepI1yxSrlzsY4hoNSXwrZEllU2kSEbzR0mSft9kRSzXE1y4Woi
         48WaNqCrWk7u92RvcA7zjeL/tRPXpE5NT2i04/HGlETslVxSvm3XtvB3b0o6JCWIf10d
         f8MefDvWNrIrqHSLLVyi8UD8GM6gYe/NqN8G2J5D3iKQceOLb5XDBO7iDpEdkFXA3KpC
         NEriviOWaSZh2i6hnER0gcQwNbidZNp/vcNqlad3opz6TEviys2DBDD0VC8hETlepH4+
         rHi9anFlWRXfJX7g4p4m8546xz//m63IWkyY3BkmjUhny4tSQguthE5wAkX7dma7DVx0
         x3iQ==
X-Gm-Message-State: APjAAAWocaO+FIxUkl/AsfMVVjXqMgI0GGT2VaUf9XZM52UmuqLNOv9Z
        mzCA+6Pqrlk+MNEivxwk11th4qd5TCUFQ3UmnrM=
X-Google-Smtp-Source: APXvYqy5saaZ6vTanOYtbuDggxwFjPR4GS8on8Qijjt3MVP5UwqKvzjLuLMastkjTn2xu5HVP4NT8ND9Cx4wQKZrARU=
X-Received: by 2002:a19:6556:: with SMTP id c22mr673189lfj.90.1568772546196;
 Tue, 17 Sep 2019 19:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190915184419.32184-1-lucmaga@gmail.com>
In-Reply-To: <20190915184419.32184-1-lucmaga@gmail.com>
From:   Guilherme Alcarde Gallo <gagallo7@gmail.com>
Date:   Tue, 17 Sep 2019 23:08:35 -0300
Message-ID: <CAF2jNbj7LUzhwBNSLPNXWC=+A+UohiULNq4zbpGS4BaxLJh0qA@mail.gmail.com>
Subject: Re: [Lkcamp] [PATCH v2] media: vimc: fla: Add virtual flash subdevice
To:     =?UTF-8?Q?Lucas_A=2E_M=2E_Magalh=C3=A3es?= <lucmaga@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        lkcamp@lists.libreplanetbr.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lucas!
How are you?

I just have one comment about the strobe thread. Please check it below.


On Sun, Sep 15, 2019 at 3:44 PM Lucas A. M. Magalh=C3=A3es <lucmaga@gmail.c=
om> wrote:
>
> From: Lucas A. M. Magalhaes <lucmaga@gmail.com>
>
> Add a virtual subdevice to simulate the flash control API.
> Those are the supported controls:
> v4l2-ctl -d /dev/v4l-subdev6 -L
> Flash Controls
>
>                        led_mode 0x009c0901 (menu)   : min=3D0 max=3D2 def=
ault=3D0 value=3D0
>                                 0: Off
>                                 1: Flash
>                                 2: Torch
>                   strobe_source 0x009c0902 (menu)   : min=3D0 max=3D1 def=
ault=3D0 value=3D0
>                                 0: Software
>                                 1: External
>                          strobe 0x009c0903 (button) : flags=3Dwrite-only,=
 execute-on-write
>                     stop_strobe 0x009c0904 (button) : flags=3Dwrite-only,=
 execute-on-write
>                   strobe_status 0x009c0905 (bool)   : default=3D0 value=
=3D0 flags=3Dread-only
>                  strobe_timeout 0x009c0906 (int)    : min=3D1 max=3D10 st=
ep=3D1 default=3D10 value=3D10
>            intensity_flash_mode 0x009c0907 (int)    : min=3D0 max=3D255 s=
tep=3D1 default=3D255 value=3D255
>            intensity_torch_mode 0x009c0908 (int)    : min=3D0 max=3D255 s=
tep=3D1 default=3D255 value=3D255
>             intensity_indicator 0x009c0909 (int)    : min=3D0 max=3D255 s=
tep=3D1 default=3D255 value=3D255
>                          faults 0x009c090a (bitmask): max=3D0x00000002 de=
fault=3D0x00000000 value=3D0x00000000
>
> Co-authored-by: Eduardo Barretto <edusbarretto@gmail.com>
> Signed-off-by: Eduardo Barretto <edusbarretto@gmail.com>
> Signed-off-by: Lucas A. M. Magalh=C3=A3es <lucmaga@gmail.com>
>
> ---
> Hi,
>
> This patch depends on the patch series
>         "Collapse vimc into single monolithic driver" version 4.
>
> Changes in v2:
>         - Fix v4l2-complience errors
>         - Add V4L2_CID_FLASH_STROBE_STATUS behavior
>         - Add V4L2_CID_FLASH_STROBE restrictions
>         - Remove vimc_fla_g_volatile_ctrl
>         - Remove unnecessarie V4L2_CID_FLASH_CLASS
>         - Change varables names
>         - Changes to apply over v4 of patch
>                 "Collapse vimc into single monolithic driver"
> ---
>  drivers/media/platform/vimc/Makefile      |   2 +-
>  drivers/media/platform/vimc/vimc-common.c |   2 +
>  drivers/media/platform/vimc/vimc-common.h |   4 +
>  drivers/media/platform/vimc/vimc-core.c   |   5 +
>  drivers/media/platform/vimc/vimc-flash.c  | 200 ++++++++++++++++++++++
>  5 files changed, 212 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/platform/vimc/vimc-flash.c
>
> diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/platfor=
m/vimc/Makefile
> index a53b2b532e9f..e759bbb04b14 100644
> --- a/drivers/media/platform/vimc/Makefile
> +++ b/drivers/media/platform/vimc/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  vimc-y :=3D vimc-core.o vimc-common.o vimc-streamer.o vimc-capture.o \
> -               vimc-debayer.o vimc-scaler.o vimc-sensor.o
> +               vimc-debayer.o vimc-scaler.o vimc-sensor.o vimc-flash.o
>
>  obj-$(CONFIG_VIDEO_VIMC) +=3D vimc.o
>
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/pl=
atform/vimc/vimc-common.c
> index a3120f4f7a90..cb786de75573 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -203,6 +203,8 @@ struct media_pad *vimc_pads_init(u16 num_pads, const =
unsigned long *pads_flag)
>         struct media_pad *pads;
>         unsigned int i;
>
> +       if (!num_pads)
> +               return NULL;
>         /* Allocate memory for the pads */
>         pads =3D kcalloc(num_pads, sizeof(*pads), GFP_KERNEL);
>         if (!pads)
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/pl=
atform/vimc/vimc-common.h
> index 236412ad7548..a1fbbc8066d3 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -169,6 +169,10 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_dev=
ice *vimc,
>                                      const char *vcfg_name);
>  void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
>
> +struct vimc_ent_device *vimc_fla_add(struct vimc_device *vimc,
> +                                    const char *vcfg_name);
> +void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +
>  /**
>   * vimc_pads_init - initialize pads
>   *
> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/plat=
form/vimc/vimc-core.c
> index a1218578cb9a..312723b4ed8a 100644
> --- a/drivers/media/platform/vimc/vimc-core.c
> +++ b/drivers/media/platform/vimc/vimc-core.c
> @@ -91,6 +91,11 @@ static struct vimc_ent_config ent_config[] =3D {
>                 .add =3D vimc_cap_add,
>                 .rm =3D vimc_cap_rm,
>         },
> +       {
> +               .name =3D "Flash Controller",
> +               .add =3D vimc_fla_add,
> +               .rm =3D vimc_fla_rm,
> +       }
>  };
>
>  static const struct vimc_ent_link ent_links[] =3D {
> diff --git a/drivers/media/platform/vimc/vimc-flash.c b/drivers/media/pla=
tform/vimc/vimc-flash.c
> new file mode 100644
> index 000000000000..637e7d0a5919
> --- /dev/null
> +++ b/drivers/media/platform/vimc/vimc-flash.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * vimc-flash.c Virtual Media Controller Driver
> + *
> + * Copyright (C) 2019
> + * Contributors: Lucas A. M. Magalh=C3=A3es <lamm@lucmaga.dev>
> + *               Eduardo Barretto <edusbarretto@gmail.com>
> + *
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/kthread.h>
> +#include <linux/sched.h>
> +#include <linux/vmalloc.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "vimc-common.h"
> +
> +#define VIMC_FLASH_TIMEOUT_STEP 10000
> +#define VIMC_FLASH_TIMEOUT_MAX 50000000
> +
> +struct vimc_fla_device {
> +       struct vimc_ent_device ved;
> +       struct v4l2_subdev sd;
> +       struct v4l2_ctrl_handler hdl;
> +       int strobe_source;
> +       bool is_strobe;
> +       int led_mode;
> +       int indicator_intensity;
> +       int torch_intensity;
> +       int flash_intensity;
> +       u64 timeout;
> +       u64 last_strobe;
> +       struct task_struct *kthread;
> +};
> +
> +void vimc_fla_set_strobe_status(struct v4l2_ctrl_handler *hdl, bool valu=
e){
> +       struct v4l2_ctrl *c;
> +       c =3D v4l2_ctrl_find(hdl, V4L2_CID_FLASH_STROBE_STATUS);
> +       if (!c) return;
> +       v4l2_ctrl_s_ctrl(c, value);
> +
> +}
> +
> +static int vimc_fla_strobe_thread(void *data)
> +{
> +       struct vimc_fla_device *vfla =3D data;
> +       vimc_fla_set_strobe_status(&vfla->hdl, vfla->is_strobe);

This code runs in another thread, but, at this point, the resource
pointed by *data
may be freed just after vimc_fla_strobe_thread is being spawned.
Maybe you should protect this critical region during this thread execution.

> +       vfla->last_strobe =3D ktime_get_ns();
> +       while(vfla->is_strobe &&
> +               vfla->last_strobe + vfla->timeout > ktime_get_ns()){
> +               msleep_interruptible(VIMC_FLASH_TIMEOUT_STEP/1000);
> +       }
> +       vimc_fla_set_strobe_status(&vfla->hdl, false);
> +       return 0;
> +}
> +
> +static int vimc_fla_s_ctrl(struct v4l2_ctrl *c)
> +{
> +
> +       struct vimc_fla_device *vfla =3D
> +               container_of(c->handler, struct vimc_fla_device, hdl);
> +
> +       switch (c->id) {
> +       case V4L2_CID_FLASH_LED_MODE:
> +               vfla->led_mode =3D c->val;
> +               return 0;
> +       case V4L2_CID_FLASH_STROBE_SOURCE:
> +               vfla->strobe_source =3D c->val;
> +               return 0;
> +       case V4L2_CID_FLASH_STROBE:
> +               if (vfla->led_mode !=3D V4L2_FLASH_LED_MODE_FLASH ||
> +                   vfla->strobe_source !=3D V4L2_FLASH_STROBE_SOURCE_SOF=
TWARE){
> +                       return -EILSEQ;
> +               }
> +               vfla->is_strobe =3D true;
> +               vfla->kthread =3D kthread_run(vimc_fla_strobe_thread, vfl=
a, "vimc-flash thread");
> +               return 0;
> +       case V4L2_CID_FLASH_STROBE_STATUS:
> +               vfla->is_strobe =3D c->val;
> +               return 0;
> +       case V4L2_CID_FLASH_STROBE_STOP:
> +               vfla->is_strobe =3D false;
> +               return 0;
> +       case V4L2_CID_FLASH_TIMEOUT:
> +               vfla->timeout =3D c->val;
> +               return 0;
> +       case V4L2_CID_FLASH_INTENSITY:
> +               vfla->flash_intensity =3D c->val;
> +               return 0;
> +       case V4L2_CID_FLASH_TORCH_INTENSITY:
> +               vfla->torch_intensity =3D c->val;
> +               return 0;
> +       case V4L2_CID_FLASH_INDICATOR_INTENSITY:
> +               vfla->indicator_intensity =3D c->val;
> +               return 0;
> +       }
> +       return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops vimc_fla_ctrl_ops =3D {
> +       .s_ctrl =3D vimc_fla_s_ctrl,
> +};
> +
> +static const struct v4l2_subdev_core_ops vimc_fla_core_ops =3D {
> +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_ops vimc_fla_ops =3D {
> +       .core =3D &vimc_fla_core_ops,
> +};
> +
> +/* initialize device */
> +struct vimc_ent_device *vimc_fla_add(struct vimc_device *vimc,
> +                                    const char *vcfg_name)
> +{
> +       struct v4l2_device *v4l2_dev =3D &vimc->v4l2_dev;
> +       struct vimc_fla_device *vfla;
> +       int ret;
> +
> +       /* Allocate the vfla struct */
> +       vfla =3D kzalloc(sizeof(*vfla), GFP_KERNEL);
> +       if (!vfla)
> +               return NULL;
> +
> +       v4l2_ctrl_handler_init(&vfla->hdl, 4);
> +
> +       v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
> +                              V4L2_CID_FLASH_LED_MODE,
> +                              V4L2_FLASH_LED_MODE_TORCH, ~0x7,
> +                              V4L2_FLASH_LED_MODE_NONE);
> +       v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
> +                              V4L2_CID_FLASH_STROBE_SOURCE, 0x1, ~0x3,
> +                              V4L2_FLASH_STROBE_SOURCE_SOFTWARE);
> +       v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +                         V4L2_CID_FLASH_STROBE, 0, 0, 0, 0);
> +       v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +                         V4L2_CID_FLASH_STROBE_STOP, 0, 0, 0, 0);
> +       v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +                         V4L2_CID_FLASH_TIMEOUT, 0,
> +                         VIMC_FLASH_TIMEOUT_MAX,
> +                         VIMC_FLASH_TIMEOUT_STEP,
> +                         VIMC_FLASH_TIMEOUT_STEP);
> +       v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +                         V4L2_CID_FLASH_TORCH_INTENSITY, 0, 255, 1, 255)=
;
> +       v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +                         V4L2_CID_FLASH_INTENSITY, 0, 255, 1, 255);
> +       v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +                         V4L2_CID_FLASH_INDICATOR_INTENSITY, 0, 255, 1, =
255);
> +       v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +                         V4L2_CID_FLASH_STROBE_STATUS, 0, 1, 1, 0);
> +       v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +                         V4L2_CID_FLASH_FAULT, 0,
> +                         V4L2_FLASH_FAULT_TIMEOUT, 0, 0);
> +       vfla->sd.ctrl_handler =3D &vfla->hdl;
> +       if (vfla->hdl.error) {
> +               ret =3D vfla->hdl.error;
> +               goto err_free_vfla;
> +       }
> +
> +       /* Initialize ved and sd */
> +       ret =3D vimc_ent_sd_register(&vfla->ved, &vfla->sd, v4l2_dev,
> +                                  vcfg_name,
> +                                  MEDIA_ENT_F_FLASH, 0, NULL,
> +                                  NULL, &vimc_fla_ops);
> +       if (ret)
> +               goto err_free_hdl;
> +
> +       /* Initialize standard values */
> +       vfla->indicator_intensity =3D 0;
> +       vfla->torch_intensity =3D 0;
> +       vfla->flash_intensity =3D 0;
> +       vfla->is_strobe =3D false;
> +       vfla->timeout =3D 0;
> +       vfla->last_strobe =3D 0;
> +       vfla->led_mode =3D V4L2_FLASH_LED_MODE_NONE;
> +
> +       return &vfla->ved;
> +
> +err_free_hdl:
> +       v4l2_ctrl_handler_free(&vfla->hdl);
> +err_free_vfla:
> +       kfree(vfla);
> +
> +       return NULL;
> +}
> +
> +void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
> +{
> +       struct vimc_fla_device *vfla;
> +
> +       if (!ved)
> +               return;
> +
> +       vfla =3D container_of(ved, struct vimc_fla_device, ved);
> +       vimc_ent_sd_unregister(ved, &vfla->sd);
> +}
> --
> 2.23.0
>
>
> _______________________________________________
> Lkcamp mailing list
> Lkcamp@lists.libreplanetbr.org
> https://lists.libreplanetbr.org/mailman/listinfo/lkcamp

Regards,
Guilherme

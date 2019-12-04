Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93ACE113801
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 00:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbfLDXMj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 18:12:39 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:44115 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbfLDXMj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 18:12:39 -0500
Received: by mail-il1-f195.google.com with SMTP id z12so1163694iln.11;
        Wed, 04 Dec 2019 15:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3Wl9j9QSZWqNdBE3F7rMsxMvtGvPY/ivHq4EzLeb27A=;
        b=oslZsehq9k02NMzpy50v7eX/TMguxYIZ5/IHmkVvZ6hKgNTUb1FJydFXaGIUd7P/4M
         3Ff4zL2xk5964ZOWhP0k6rgTtc6D0MLkm2rhG9F1Khe7OWvc/EZqTi5wRb88SL1AS0Jh
         FJv6xkd2d6DkBpZzNC6sWEcQj2Zjpk/KdO1BVr5dfnTCPKTl3/tQI6TjaJyiKxoPxjNz
         1eUSLBoUzLsFJUe+E63f8zSV+0JV7BtWDNsb8Ce7IzOpDvE2rcOnjFDaNFFKv7Fe2vC7
         ewf/71VdZ0DnWcIKa2mNbbqYuvlgryH5fVbjsDQqQnk7YD2nu4yvQyS73KpXuET871RD
         mYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3Wl9j9QSZWqNdBE3F7rMsxMvtGvPY/ivHq4EzLeb27A=;
        b=sprv0dYKDO4JQh67cOPF79lgSV+VPyZS9s5VeTCKfeJf+etMVm3uYkjmMrqz8VeLjr
         mTFMxQswjA8nD3G8vJWwTQEubw6EoTvTCNPopiMiHs+c480zYdNjFki2/SSwe/axpmAE
         lUrHnUHRGhmvrrHA+uD7zDAureIwXT4YaqMrPCBmo4u0aml+K67sWelo3nEilBhUEneZ
         3JMUkwwLctpQhVNTL+uzW4HioqqVAJPEFy4bFhczENPlw8yhUp33nwfAfvH/Tb8GVpFD
         8gl6s0gJUlT/ZiHutL1O6q3F5bxMxYdlZclh7OmzE56TClgxaUWmTQ+scF9fcFsvPxs8
         9M2g==
X-Gm-Message-State: APjAAAV4WMRx4BficXh64TVwkGinUfaXf0Huwsyhb6aEubnC2Ym75x75
        4R7IMgEci/AKi3hiyU0SlXujrCqhyvpsdtRN2e8=
X-Google-Smtp-Source: APXvYqywZZ1FTGHinN3hDcRW8hdvmSroCbgPqvq4L8dISd2r1qWcXPT0NKWZWk25v7Wn1mntgzbByRqDF+po8cCFrL8=
X-Received: by 2002:a05:6e02:100b:: with SMTP id n11mr5915544ilj.212.1575501157592;
 Wed, 04 Dec 2019 15:12:37 -0800 (PST)
MIME-Version: 1.0
References: <20191203230148.2442-1-lucmaga@gmail.com> <dba2fa57-2101-b24a-a482-97878895fb92@collabora.com>
In-Reply-To: <dba2fa57-2101-b24a-a482-97878895fb92@collabora.com>
From:   =?UTF-8?Q?Lucas_Magalh=C3=A3es?= <lucmaga@gmail.com>
Date:   Wed, 4 Dec 2019 20:12:26 -0300
Message-ID: <CAK0xOaELnX_axasmBaqanWfaoj+AF3kFZjLdzxjEgnHtzFkX5A@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] media: vimc: fla: Add virtual flash subdevice
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Eduardo Barretto <edusbarretto@gmail.com>,
        lkcamp@lists.libreplanetbr.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,
Thanks for the review.

On Wed, Dec 4, 2019 at 7:03 AM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Hi,
> Thanks for the patch
>
> On 12/4/19 12:01 AM, Lucas A. M. Magalh=C3=A3es wrote:
> > From: Lucas A. M. Magalhaes <lucmaga@gmail.com>
> >
> > Add a virtual subdevice to simulate the flash control API.
> > Those are the supported controls:
> > v4l2-ctl -d /dev/v4l-subdev6 -L
> > Flash Controls
> >
> >                         led_mode 0x009c0901 (menu)   : min=3D0 max=3D2 =
default=3D1 value=3D1
> >                                  0: Off
> >                                  1: Flash
> >                                  2: Torch
> >                    strobe_source 0x009c0902 (menu)   : min=3D0 max=3D1 =
default=3D0 value=3D0
> >                                  0: Software
> >                                  1: External
> >                           strobe 0x009c0903 (button) : flags=3Dwrite-on=
ly, execute-on-write
> >                      stop_strobe 0x009c0904 (button) : flags=3Dwrite-on=
ly, execute-on-write
> >                    strobe_status 0x009c0905 (bool)   : default=3D0 valu=
e=3D0 flags=3Dread-only
> >                   strobe_timeout 0x009c0906 (int)    : min=3D50 max=3D4=
00 step=3D50 default=3D50 value=3D400
> >             intensity_flash_mode 0x009c0907 (int)    : min=3D23040 max=
=3D1499600 step=3D11718 default=3D23040 value=3D23040
> >             intensity_torch_mode 0x009c0908 (int)    : min=3D2530 max=
=3D187100 step=3D1460 default=3D2530 value=3D2530
> >              intensity_indicator 0x009c0909 (int)    : min=3D0 max=3D25=
5 step=3D1 default=3D0 value=3D0
> >                           faults 0x009c090a (bitmask): max=3D0x00000002=
 default=3D0x00000000 value=3D0x00000000
> >
> > Co-authored-by: Eduardo Barretto <edusbarretto@gmail.com>
> > Signed-off-by: Eduardo Barretto <edusbarretto@gmail.com>
> > Signed-off-by: Lucas A. M. Magalh=C3=A3es <lucmaga@gmail.com>
> >
> > ---
> > Hi,
> >
> > I've copied some values from another driver (lm3646) to make it more
> > realistic, as suggested by Hans. All values except for
> > V4L2_CID_FLASH_INDICATOR_INTENSITY, which I couldn't find any
> > implementation.
> >
> > The v4l-compliance is failing. From the documentation
> > V4L2_CID_FLASH_STROBE should just work if the
> > V4L2_CID_FLASH_STROBE_SOURCE is "Software" and the
> > V4L2_CID_FLASH_LED_MODE is "Flash", otherwise it should fail. With the
> > standard values configured for the V4L2_CID_FLASH_STROBE will not fail.
> > But during the tests v4l-compliance sets V4L2_CID_FLASH_LED_MODE to
> > "Torch" and V4L2_CID_FLASH_STROBE_SOURCE to "External" which makes
> > V4L2_CID_FLASH_STROBE to fail. How do I proceed? Should the
> > v4l-compliance be changed?
> >
> > Changes in v3:
> >       - Fix style errors
> >       - Use more realistic numbers for the controllers
> >       - Change from kthread to workqueue
> >       - Change commit message for the new controllers values
> >
> > Changes in v2:
> >       - Fix v4l2-complience errors
> >       - Add V4L2_CID_FLASH_STROBE_STATUS behavior
> >       - Add V4L2_CID_FLASH_STROBE restrictions
> >       - Remove vimc_fla_g_volatile_ctrl
> >       - Remove unnecessarie V4L2_CID_FLASH_CLASS
> >       - Change varables names
> >
> >   drivers/media/platform/vimc/Makefile      |   2 +-
> >   drivers/media/platform/vimc/vimc-common.c |   2 +
> >   drivers/media/platform/vimc/vimc-common.h |   4 +
> >   drivers/media/platform/vimc/vimc-core.c   |   5 +
> >   drivers/media/platform/vimc/vimc-flash.c  | 248 +++++++++++++++++++++=
+
> >   5 files changed, 260 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/media/platform/vimc/vimc-flash.c
> >
> > diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/platf=
orm/vimc/Makefile
> > index a53b2b532e9f..e759bbb04b14 100644
> > --- a/drivers/media/platform/vimc/Makefile
> > +++ b/drivers/media/platform/vimc/Makefile
> > @@ -1,6 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0
> >   vimc-y :=3D vimc-core.o vimc-common.o vimc-streamer.o vimc-capture.o =
\
> > -             vimc-debayer.o vimc-scaler.o vimc-sensor.o
> > +             vimc-debayer.o vimc-scaler.o vimc-sensor.o vimc-flash.o
> >
> >   obj-$(CONFIG_VIDEO_VIMC) +=3D vimc.o
> >
> > diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/=
platform/vimc/vimc-common.c
> > index a3120f4f7a90..cb786de75573 100644
> > --- a/drivers/media/platform/vimc/vimc-common.c
> > +++ b/drivers/media/platform/vimc/vimc-common.c
> > @@ -203,6 +203,8 @@ struct media_pad *vimc_pads_init(u16 num_pads, cons=
t unsigned long *pads_flag)
> >       struct media_pad *pads;
> >       unsigned int i;
> >
> > +     if (!num_pads)
> > +             return NULL;
> Please rebase on top of latest master,
> this function was removed in patch 'media: vimc: embed the pads of entiti=
es in the entities' structs'
>
Ok.

> >       /* Allocate memory for the pads */
> >       pads =3D kcalloc(num_pads, sizeof(*pads), GFP_KERNEL);
> >       if (!pads)
> > diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/=
platform/vimc/vimc-common.h
> > index 698db7c07645..19815f0f4d40 100644
> > --- a/drivers/media/platform/vimc/vimc-common.h
> > +++ b/drivers/media/platform/vimc/vimc-common.h
> > @@ -169,6 +169,10 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_d=
evice *vimc,
> >                                    const char *vcfg_name);
> >   void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ve=
d);
> >
> > +struct vimc_ent_device *vimc_fla_add(struct vimc_device *vimc,
> > +                                  const char *vcfg_name);
> This should be lined with the opening '('
>
That's strange. I'm sure it's not like this here. Maybe my smtp is alterati=
ng
my code for some reason. I will look this.

> > +void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_device *ved=
);
> > +
> >   /**
> >    * vimc_pads_init - initialize pads
> >    *
> > diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/pl=
atform/vimc/vimc-core.c
> > index 6e3e5c91ae39..5f6c750d3d8d 100644
> > --- a/drivers/media/platform/vimc/vimc-core.c
> > +++ b/drivers/media/platform/vimc/vimc-core.c
> > @@ -91,6 +91,11 @@ static struct vimc_ent_config ent_config[] =3D {
> >               .add =3D vimc_cap_add,
> >               .rm =3D vimc_cap_rm,
> >       },
> > +     {
> > +             .name =3D "Flash Controller",
> > +             .add =3D vimc_fla_add,
> > +             .rm =3D vimc_fla_rm,
> > +     }
> >   };
> >
> >   static const struct vimc_ent_link ent_links[] =3D {
> > diff --git a/drivers/media/platform/vimc/vimc-flash.c b/drivers/media/p=
latform/vimc/vimc-flash.c
> > new file mode 100644
> > index 000000000000..3918beecec57
> > --- /dev/null
> > +++ b/drivers/media/platform/vimc/vimc-flash.c
> > @@ -0,0 +1,248 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * vimc-flash.c Virtual Media Controller Driver
> > + *
> > + * Copyright (C) 2019
> > + * Contributors: Lucas A. M. Magalh=C3=A3es <lamm@lucmaga.dev>
> > + *               Eduardo Barretto <edusbarretto@gmail.com>
> > + *
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/workqueue.h>
> > +#include <linux/sched.h>
> > +#include <linux/vmalloc.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +#include "vimc-common.h"
> > +
> > +/*
> > + * Flash timeout in ms
> > + */
> > +#define VIMC_FLASH_TIMEOUT_MS_MIN 50
> > +#define VIMC_FLASH_TIMEOUT_MS_MAX 400
> > +#define VIMC_FLASH_TIMEOUT_MS_STEP 50
> > +
> > +/*
> > + * Torch intencity in uA
> > + */
> > +#define VIMC_FLASH_TORCH_UA_MIN 2530
> > +#define VIMC_FLASH_TORCH_UA_MAX 187100
> > +#define VIMC_FLASH_TORCH_UA_STEP 1460
> > +
> > +/*
> > + * Flash intencity in uA
> > + */
> > +#define VIMC_FLASH_FLASH_UA_MIN 23040
> > +#define VIMC_FLASH_FLASH_UA_MAX 1499600
> > +#define VIMC_FLASH_FLASH_UA_STEP 11718
> > +
> > +struct vimc_fla_device {
> > +     struct vimc_ent_device ved;
> > +     struct v4l2_subdev sd;
> > +     struct v4l2_ctrl_handler hdl;
> > +     int strobe_source;
> > +     bool is_strobe;
> > +     int led_mode;
> > +     int indicator_intensity;
> > +     int torch_intensity;
> > +     int flash_intensity;
> > +     u64 timeout;
> > +     u64 last_strobe;
> > +     struct workqueue_struct *wq;
> > +     struct work_struct work;
> > +     struct v4l2_ctrl *strobe_status_ctl;
> > +};
> > +
> > +static void vimc_fla_strobe_work(struct work_struct *work)
> > +{
> > +     struct vimc_fla_device *vfla =3D
> > +             container_of(work, struct vimc_fla_device, work);
> > +     v4l2_ctrl_s_ctrl(vfla->strobe_status_ctl, true);
> > +     vfla->last_strobe =3D ktime_get_ns();
> > +     while (vfla->is_strobe &&
> > +            vfla->last_strobe + vfla->timeout > ktime_get_ns()) {
> > +             msleep_interruptible(VIMC_FLASH_TIMEOUT_MS_STEP);
> > +     }
> > +     v4l2_ctrl_s_ctrl(vfla->strobe_status_ctl, false);
> > +}
> > +
> > +static int vimc_fla_s_ctrl(struct v4l2_ctrl *c)
> > +{
> > +     struct vimc_fla_device *vfla =3D
> > +             container_of(c->handler, struct vimc_fla_device, hdl);
> > +
> > +     switch (c->id) {
> > +     case V4L2_CID_FLASH_LED_MODE:
> > +             vfla->led_mode =3D c->val;
> > +             return 0;
> > +     case V4L2_CID_FLASH_STROBE_SOURCE:
> > +             vfla->strobe_source =3D c->val;
> > +             return 0;
> > +     case V4L2_CID_FLASH_STROBE:
> > +             if (vfla->led_mode !=3D V4L2_FLASH_LED_MODE_FLASH ||
> > +                 vfla->strobe_source !=3D V4L2_FLASH_STROBE_SOURCE_SOF=
TWARE){
> you can add error/warning debug here,
> if you choose not to, then the parentheses are redundant.
> Additionally, the opening '{' should come after a space
> You can run srctipts/checkpatch.pl before submitting to catch such issues
>
> > +                     return -EINVAL;
> > +             }
> > +             queue_work(vfla->wq, &vfla->work);
> > +             return 0;
> > +     case V4L2_CID_FLASH_STROBE_STATUS:
> > +             vfla->is_strobe =3D c->val;
> > +             return 0;
> > +     case V4L2_CID_FLASH_STROBE_STOP:
> > +             vfla->is_strobe =3D false;
> > +             return 0;
> > +     case V4L2_CID_FLASH_TIMEOUT:
> > +             vfla->timeout =3D c->val * 1000000; /* MS to NS */
> > +             return 0;
> > +     case V4L2_CID_FLASH_INTENSITY:
> > +             vfla->flash_intensity =3D c->val;
> > +             return 0;
> > +     case V4L2_CID_FLASH_TORCH_INTENSITY:
> > +             vfla->torch_intensity =3D c->val;
> > +             return 0;
> > +     case V4L2_CID_FLASH_INDICATOR_INTENSITY:
> > +             vfla->indicator_intensity =3D c->val;
> > +             return 0;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops vimc_fla_ctrl_ops =3D {
> > +     .s_ctrl =3D vimc_fla_s_ctrl,
> > +};
> > +
> > +static const struct v4l2_subdev_core_ops vimc_fla_core_ops =3D {
> > +     .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> > +     .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> > +};
> > +
> > +static const struct v4l2_subdev_ops vimc_fla_ops =3D {
> > +     .core =3D &vimc_fla_core_ops,
> > +};
> > +
> > +static void vimc_fla_release(struct v4l2_subdev *sd)
> > +{
> > +     struct vimc_fla_device *vfla =3D
> > +                             container_of(sd, struct vimc_fla_device, =
sd);
> one tab is enough
> > +
> > +     v4l2_ctrl_handler_free(&vfla->hdl);
> > +     kfree(vfla);
> > +}
> > +
> > +static const struct v4l2_subdev_internal_ops vimc_fla_int_ops =3D {
> > +     .release =3D vimc_fla_release,
> > +};
> > +
> > +/* initialize device */
> > +struct vimc_ent_device *vimc_fla_add(struct vimc_device *vimc,
> > +                                  const char *vcfg_name)
> > +{
> > +     struct v4l2_device *v4l2_dev =3D &vimc->v4l2_dev;
> > +     struct vimc_fla_device *vfla;
> > +     int ret;
> > +
> > +     /* Allocate the vfla struct */
> > +     vfla =3D kzalloc(sizeof(*vfla), GFP_KERNEL);
> > +     if (!vfla)
> > +             return NULL;
> I think it is better to change the return values of the .add calbbacks
> to return ERR_PTR upon error and not just NULL so that different types of
> errors can be distinguished.
> (This is not related specifically to this patch),
> If you want you can send a patch fixing that.
>

Sure. I will change it.

> > +
> > +     v4l2_ctrl_handler_init(&vfla->hdl, 4);
> > +     v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                            V4L2_CID_FLASH_LED_MODE,
> > +                            V4L2_FLASH_LED_MODE_TORCH, ~0x7,
> > +                            V4L2_FLASH_LED_MODE_FLASH);
> > +     v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                            V4L2_CID_FLASH_STROBE_SOURCE, 0x1, ~0x3,
> > +                            V4L2_FLASH_STROBE_SOURCE_SOFTWARE);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_STROBE, 0, 0, 0, 0);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_STROBE_STOP, 0, 0, 0, 0);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_TIMEOUT, VIMC_FLASH_TIMEOUT_MS_M=
IN,
> > +                       VIMC_FLASH_TIMEOUT_MS_MAX,
> > +                       VIMC_FLASH_TIMEOUT_MS_STEP,
> > +                       VIMC_FLASH_TIMEOUT_MS_MIN);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_TORCH_INTENSITY,
> > +                       VIMC_FLASH_TORCH_UA_MIN,
> > +                       VIMC_FLASH_TORCH_UA_MAX,
> > +                       VIMC_FLASH_TORCH_UA_STEP,
> > +                       VIMC_FLASH_TORCH_UA_MIN);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_INTENSITY,
> > +                       VIMC_FLASH_FLASH_UA_MIN,
> > +                       VIMC_FLASH_FLASH_UA_MAX,
> > +                       VIMC_FLASH_FLASH_UA_STEP,
> > +                       VIMC_FLASH_FLASH_UA_MIN);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_INDICATOR_INTENSITY,
> > +                       0,
> > +                       255,
> > +                       1,
> > +                       0);
> why not having one line with "0,255,1,0);" ?
>
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_STROBE_STATUS, 0, 1, 1, 0);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_FAULT, 0,
> > +                       V4L2_FLASH_FAULT_TIMEOUT, 0, 0);
> > +     vfla->sd.ctrl_handler =3D &vfla->hdl;
> > +     if (vfla->hdl.error) {
> > +             ret =3D vfla->hdl.error;
> > +             goto err_free_vfla;
> > +     }
> > +     vfla->strobe_status_ctl =3D v4l2_ctrl_find(&vfla->hdl,
> > +                                              V4L2_CID_FLASH_STROBE_ST=
ATUS);
> > +
> > +     /* Initialize ved and sd */
> > +     ret =3D vimc_ent_sd_register(&vfla->ved, &vfla->sd, v4l2_dev,
> > +                                vcfg_name,
> > +                                MEDIA_ENT_F_FLASH, 0, NULL,
> > +                                &vimc_fla_int_ops, &vimc_fla_ops);
> > +     if (ret)
> > +             goto err_free_hdl;
> > +
> > +     /* Create processing workqueue */
> > +     vfla->wq =3D alloc_workqueue("%s", 0, 0, "vimc-flash thread");
> > +     if (!vfla->wq)
> > +             goto err_unregister;
> > +
> > +     INIT_WORK(&vfla->work, vimc_fla_strobe_work);
> > +     /* Initialize standard values */
> > +     vfla->indicator_intensity =3D 0;
> > +     vfla->torch_intensity =3D 0;
> > +     vfla->flash_intensity =3D 0;
> > +     vfla->is_strobe =3D false;
> > +     vfla->timeout =3D 0;
> > +     vfla->last_strobe =3D 0;
> > +     vfla->strobe_source =3D V4L2_FLASH_STROBE_SOURCE_SOFTWARE;
> > +     vfla->led_mode =3D V4L2_FLASH_LED_MODE_FLASH;
> > +
> > +     return &vfla->ved;
> > +
> > +err_unregister:
> > +     vimc_ent_sd_unregister(&vfla->ved, &vfla->sd);
> > +err_free_hdl:
> > +     v4l2_ctrl_handler_free(&vfla->hdl);
> > +err_free_vfla:
> > +     kfree(vfla);
> > +
> > +     return NULL;
> > +}
> > +
> > +void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_device *ved=
)
> > +{
> > +     struct vimc_fla_device *vfla;
> > +
> > +     if (!ved)
> > +             return;
> > +
> > +     vfla =3D container_of(ved, struct vimc_fla_device, ved);
> > +     destroy_workqueue(vfla->wq);
> > +     vimc_ent_sd_unregister(ved, &vfla->sd);
> > +}
> >
> Not sure but I think there are indentation issues in this patch, a tab sh=
ould be 8 spaces

This is strange. I already had style issues on the v2 so I runned the
checkpatch.pl on the
patch before sent and it didn't point this identation issues.

Here is the checkpatch.pl output. It could be the case that my smtp is
alterating the
it before transmission.

$ scripts/checkpatch.pl
patchset/0001-media-vimc-fla-Add-virtual-flash-subdevice.patch
WARNING: Possible unwrapped commit description (prefer a maximum 75
chars per line)
#14:
                       led_mode 0x009c0901 (menu)   : min=3D0 max=3D2
default=3D1 value=3D1

WARNING: Non-standard signature: Co-authored-by:
#30:
Co-authored-by: Eduardo Barretto <edusbarretto@gmail.com>

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#131:
new file mode 100644

total: 0 errors, 3 warnings, 284 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplac=
e.

patchset/0001-media-vimc-fla-Add-virtual-flash-subdevice.patch has
style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.


Thanks,
Lucas

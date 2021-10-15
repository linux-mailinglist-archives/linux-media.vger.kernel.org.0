Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E93142EEBD
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 12:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237963AbhJOK2k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 06:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbhJOK2k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 06:28:40 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96920C061570
        for <linux-media@vger.kernel.org>; Fri, 15 Oct 2021 03:26:33 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id x1so7107843iof.7
        for <linux-media@vger.kernel.org>; Fri, 15 Oct 2021 03:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rj7TZomBB0k48CQI/P48w8SDve0z+a72Yn45I3uorTo=;
        b=dV+9iJljcTdBi0k7V7NFbX1s2EIqmmYvZ9kZk0ZStUT/Xd8WDNzN9smfoPaB1yuBQM
         c9AyoAksp5ipZMANS5xjiy8HX6FA94xTlTgWy1kiLpArE4xhUVOQcjly2/z9Luxr0bEG
         WXG+vUsz0lk+hU/p48BWo1v0lpypmWoTjoHpTvcFB6J49aebmv+NOBrr8LQdCSRqPOwO
         cDFoC2ktj5FCN1/tiICTjDQaZpX4PNlNcSRsnfZmFRz6I6OKvXq6ebHXueLdv3wMGe1O
         ZSMfLBfKTXF6BYyQyqX2TVIfHBx8BIM8HCxY7ECMtZZK2rKXjU7IhUICeVc1Fsi/0X+s
         ihDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rj7TZomBB0k48CQI/P48w8SDve0z+a72Yn45I3uorTo=;
        b=AlQvcGwGwTy9hpU47IwO6vEnC9yuBEC2FJ86GwNE8KPn4ID1nF//IpylCdgQrgCEeA
         E3kHYybGIVUJzYz9itbgQmSdWr5hCyrKSYy0DrN7RsuRYSU3Wd5eVEHWApBRRUYWUyL/
         yvZxFcNfMMardemg8gd4+PouN5DzfGP+U5OQYacmApKNYXL6oQga4dn/hYxCAuboBZJJ
         MiQ/DTQm+OIH/ar9kjfMpraXOqG6qcFz6v9atmP7IuOgNkVowQY2fjPpmMrzeHlF0/dq
         RBZBfOdL0UUBh+Y7H3gf+In1biPF4jYZdwN2+j2rkU1iEaWwMDg8g55TA3FAkd0wb9m8
         SwCQ==
X-Gm-Message-State: AOAM531NkuAcUW24Z30qIC7vUPHe94Li3ipFCNAJWoOqQipnS0W/uoOm
        30Rq0Z45VzgFWlU03TElsvU9hYvLWOtsx67Sb32JVGMAQoyQGVZ1
X-Google-Smtp-Source: ABdhPJyDTY7aWY+PLmcx7wBRw7vzMs6uPRd/UYJxFPablNxQNZfW/pL3XGPcsReX4VZo8GxR4k9L1rYvTavkbyMkjhs=
X-Received: by 2002:a05:6602:1593:: with SMTP id e19mr3226594iow.43.1634293592889;
 Fri, 15 Oct 2021 03:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <3acd9ee4-5a58-6ed4-17fe-61596a5252b8@xs4all.nl> <CAL9mu0+Vm9Xv4PYy-PG7EzVR1Jd1Jg7q=6_ABu1kOM+D3291ZQ@mail.gmail.com>
In-Reply-To: <CAL9mu0+Vm9Xv4PYy-PG7EzVR1Jd1Jg7q=6_ABu1kOM+D3291ZQ@mail.gmail.com>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Fri, 15 Oct 2021 18:25:56 +0800
Message-ID: <CAL9mu0Juhr+nnw=hb78+dYyJDhoJVW_3R6PorhX+yzWEfGFttw@mail.gmail.com>
Subject: Re: [RFC PATCH] media: check for NULL pointer argument in ioctl() if !CONFIG_MMU
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

Your patch working fine on my setup:
HW: stm32f469-disco https://www.st.com/en/evaluation-tools/32f469idiscovery.html

The detail test step:
- rebase kernel on the media tree from
https://git.linuxtv.org/media_tree.git master branch.
  commit 64cdf7e5a3aac0e7c9efdb079e74e22875b0419a
   Author: Irui Wang <irui.wang@mediatek.com>
  Date:   Sun Sep 26 05:39:35 2021 +0200
- merge my 8 patches.
- open nullptr check from v4l2-compliance.
- build kernel & v4l2-compliance.
- v4l2-compliance test failed as before.
- merge your patch, rebuild kernel
- the "fail: v4l2-compliance.cpp(624): doioctl(node, VIDIOC_QUERYCAP,
nullptr) != EFAULT"
  is gone.

Thanks & Regards
Dillon

On Thu, 14 Oct 2021 at 22:02, Dillon Min <dillon.minfei@gmail.com> wrote:
>
> On Thu, 14 Oct 2021 at 19:20, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >
> > If CONFIG_MMU is not set, then copying ioctl arguments from userspace to kernelspace
> > and vice versa will just work (access_ok() always returns true in that case), even if
> > the argument is a NULL pointer.
> >
> > This is definitely a corner case that we want to check for, so add a NULL pointer check
> > to the various core ioctl functions in the media frameworks.
> >
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Reported-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> > Note: this is an RFC only, this might fail if there are ioctls that pass a value as
> > the ioctl argument instead of a pointer to a buffer. I know that that never happens for
> > the V4L2, CEC and MC APIs, but I'm less certain about the DVB/RC APIs.
> >
> > Dillon, can you test if the v4l2-compliance VIDIOC_QUERYCAP(NULL) test now passes with
> > this patch applied?
>
> Sure, I will test this patch.
>
> Best Regards
> Dillon
>
> >
> > Thanks!
> >
> >         Hans
> > ---
> > diff --git a/drivers/media/cec/core/cec-api.c b/drivers/media/cec/core/cec-api.c
> > index 769e6b4cddce..b2498f0dd272 100644
> > --- a/drivers/media/cec/core/cec-api.c
> > +++ b/drivers/media/cec/core/cec-api.c
> > @@ -511,6 +511,11 @@ static long cec_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> >         if (!cec_is_registered(adap))
> >                 return -ENODEV;
> >
> > +#ifndef CONFIG_MMU
> > +       if (_IOC_DIR(cmd) != _IOC_NONE && !arg)
> > +               return -EFAULT;
> > +#endif
> > +
> >         switch (cmd) {
> >         case CEC_ADAP_G_CAPS:
> >                 return cec_adap_g_caps(adap, parg);
> > diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
> > index 5d5a48475a54..1ab0fe8df2d6 100644
> > --- a/drivers/media/dvb-core/dmxdev.c
> > +++ b/drivers/media/dvb-core/dmxdev.c
> > @@ -1187,6 +1187,10 @@ static int dvb_demux_do_ioctl(struct file *file,
> >  static long dvb_demux_ioctl(struct file *file, unsigned int cmd,
> >                             unsigned long arg)
> >  {
> > +#ifndef CONFIG_MMU
> > +       if (_IOC_DIR(cmd) != _IOC_NONE && !arg)
> > +               return -EFAULT;
> > +#endif
> >         return dvb_usercopy(file, cmd, arg, dvb_demux_do_ioctl);
> >  }
> >
> > diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
> > index 15a08d8c69ef..8ed33806fe13 100644
> > --- a/drivers/media/dvb-core/dvb_ca_en50221.c
> > +++ b/drivers/media/dvb-core/dvb_ca_en50221.c
> > @@ -1422,6 +1422,10 @@ static int dvb_ca_en50221_io_do_ioctl(struct file *file,
> >  static long dvb_ca_en50221_io_ioctl(struct file *file,
> >                                     unsigned int cmd, unsigned long arg)
> >  {
> > +#ifndef CONFIG_MMU
> > +       if (_IOC_DIR(cmd) != _IOC_NONE && !arg)
> > +               return -EFAULT;
> > +#endif
> >         return dvb_usercopy(file, cmd, arg, dvb_ca_en50221_io_do_ioctl);
> >  }
> >
> > diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> > index 258637d762d6..b21f28d6d6df 100644
> > --- a/drivers/media/dvb-core/dvb_frontend.c
> > +++ b/drivers/media/dvb-core/dvb_frontend.c
> > @@ -2100,6 +2100,10 @@ static long dvb_frontend_ioctl(struct file *file, unsigned int cmd,
> >         if (!dvbdev)
> >                 return -ENODEV;
> >
> > +#ifndef CONFIG_MMU
> > +       if (_IOC_DIR(cmd) != _IOC_NONE && !arg)
> > +               return -EFAULT;
> > +#endif
> >         return dvb_usercopy(file, cmd, arg, dvb_frontend_do_ioctl);
> >  }
> >
> > @@ -2136,6 +2140,10 @@ static int dvb_frontend_handle_compat_ioctl(struct file *file, unsigned int cmd,
> >         struct dvb_frontend_private *fepriv = fe->frontend_priv;
> >         int i, err = 0;
> >
> > +#ifndef CONFIG_MMU
> > +       if (_IOC_DIR(cmd) != _IOC_NONE && !arg)
> > +               return -EFAULT;
> > +#endif
> >         if (cmd == COMPAT_FE_SET_PROPERTY) {
> >                 struct compat_dtv_properties prop, *tvps = NULL;
> >                 struct compat_dtv_property *tvp = NULL;
> > diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
> > index dddebea644bb..97282946e35e 100644
> > --- a/drivers/media/dvb-core/dvb_net.c
> > +++ b/drivers/media/dvb-core/dvb_net.c
> > @@ -1561,6 +1561,10 @@ static int dvb_net_do_ioctl(struct file *file,
> >  static long dvb_net_ioctl(struct file *file,
> >               unsigned int cmd, unsigned long arg)
> >  {
> > +#ifndef CONFIG_MMU
> > +       if (_IOC_DIR(cmd) != _IOC_NONE && !arg)
> > +               return -EFAULT;
> > +#endif
> >         return dvb_usercopy(file, cmd, arg, dvb_net_do_ioctl);
> >  }
> >
> > diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
> > index 795d9bfaba5c..f2311baadb00 100644
> > --- a/drivers/media/dvb-core/dvbdev.c
> > +++ b/drivers/media/dvb-core/dvbdev.c
> > @@ -184,6 +184,10 @@ long dvb_generic_ioctl(struct file *file,
> >         if (!dvbdev)
> >                 return -ENODEV;
> >
> > +#ifndef CONFIG_MMU
> > +       if (_IOC_DIR(cmd) != _IOC_NONE && !arg)
> > +               return -EFAULT;
> > +#endif
> >         if (!dvbdev->kernel_ioctl)
> >                 return -EINVAL;
> >
> > diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> > index cf5e459b1d96..e25a407b6194 100644
> > --- a/drivers/media/mc/mc-device.c
> > +++ b/drivers/media/mc/mc-device.c
> > @@ -445,6 +445,10 @@ static long media_device_ioctl(struct file *filp, unsigned int cmd,
> >         char __karg[256], *karg = __karg;
> >         long ret;
> >
> > +#ifndef CONFIG_MMU
> > +       if (_IOC_DIR(cmd) != _IOC_NONE && !__arg)
> > +               return -EFAULT;
> > +#endif
> >         if (_IOC_NR(cmd) >= ARRAY_SIZE(ioctl_info)
> >             || ioctl_info[_IOC_NR(cmd)].cmd != cmd)
> >                 return -ENOIOCTLCMD;
> > @@ -526,6 +530,10 @@ static long media_device_compat_ioctl(struct file *filp, unsigned int cmd,
> >         struct media_device *dev = devnode->media_dev;
> >         long ret;
> >
> > +#ifndef CONFIG_MMU
> > +       if (_IOC_DIR(cmd) != _IOC_NONE && !arg)
> > +               return -EFAULT;
> > +#endif
> >         switch (cmd) {
> >         case MEDIA_IOC_ENUM_LINKS32:
> >                 mutex_lock(&dev->graph_mutex);
> > diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
> > index addb8f2d8939..0c1956899fcb 100644
> > --- a/drivers/media/mc/mc-request.c
> > +++ b/drivers/media/mc/mc-request.c
> > @@ -223,6 +223,10 @@ static long media_request_ioctl(struct file *filp, unsigned int cmd,
> >  {
> >         struct media_request *req = filp->private_data;
> >
> > +#ifndef CONFIG_MMU
> > +       if (_IOC_DIR(cmd) != _IOC_NONE && !arg)
> > +               return -EFAULT;
> > +#endif
> >         switch (cmd) {
> >         case MEDIA_REQUEST_IOC_QUEUE:
> >                 return media_request_ioctl_queue(req);
> > diff --git a/drivers/media/pci/bt8xx/dst_ca.c b/drivers/media/pci/bt8xx/dst_ca.c
> > index 85fcdc59f0d1..f7bd7a07606e 100644
> > --- a/drivers/media/pci/bt8xx/dst_ca.c
> > +++ b/drivers/media/pci/bt8xx/dst_ca.c
> > @@ -532,6 +532,10 @@ static long dst_ca_ioctl(struct file *file, unsigned int cmd, unsigned long ioct
> >         void __user *arg = (void __user *)ioctl_arg;
> >         int result = 0;
> >
> > +#ifndef CONFIG_MMU
> > +       if (_IOC_DIR(cmd) != _IOC_NONE && !ioctl_arg)
> > +               return -EFAULT;
> > +#endif
> >         mutex_lock(&dst_ca_mutex);
> >         dvbdev = file->private_data;
> >         state = (struct dst_state *)dvbdev->priv;
> > diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
> > index 7f591ff5269d..9d89c68d2076 100644
> > --- a/drivers/media/rc/lirc_dev.c
> > +++ b/drivers/media/rc/lirc_dev.c
> > @@ -372,6 +372,10 @@ static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> >         u32 val = 0;
> >         int ret;
> >
> > +#ifndef CONFIG_MMU
> > +       if (_IOC_DIR(cmd) != _IOC_NONE && !arg)
> > +               return -EFAULT;
> > +#endif
> >         if (_IOC_DIR(cmd) & _IOC_WRITE) {
> >                 ret = get_user(val, argp);
> >                 if (ret)
> > diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> > index 8176769a89fa..2bb8fa87aa46 100644
> > --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> > +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> > @@ -1254,6 +1254,11 @@ long v4l2_compat_ioctl32(struct file *file, unsigned int cmd, unsigned long arg)
> >         if (!video_is_registered(vdev))
> >                 return -ENODEV;
> >
> > +#ifndef CONFIG_MMU
> > +       if (_IOC_DIR(cmd) != _IOC_NONE && !arg)
> > +               return -EFAULT;
> > +#endif
> > +
> >         if (_IOC_TYPE(cmd) == 'V' && _IOC_NR(cmd) < BASE_VIDIOC_PRIVATE)
> >                 ret = file->f_op->unlocked_ioctl(file, cmd,
> >                                         (unsigned long)compat_ptr(arg));
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 31d0109ce5a8..d4ec18fd1770 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -3279,6 +3279,10 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
> >
> >         /*  Copy arguments into temp kernel buffer  */
> >         if (_IOC_DIR(cmd) != _IOC_NONE) {
> > +#ifndef CONFIG_MMU
> > +               if (!arg)
> > +                       return -EFAULT;
> > +#endif
> >                 if (ioc_size <= sizeof(sbuf)) {
> >                         parg = sbuf;
> >                 } else {

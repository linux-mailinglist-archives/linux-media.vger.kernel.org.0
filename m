Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81D1C6D39F0
	for <lists+linux-media@lfdr.de>; Sun,  2 Apr 2023 21:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjDBTI7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 15:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDBTI6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 15:08:58 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9693CAF33
        for <linux-media@vger.kernel.org>; Sun,  2 Apr 2023 12:08:57 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id x17so4372667qtv.7
        for <linux-media@vger.kernel.org>; Sun, 02 Apr 2023 12:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680462535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6vGHaP71nCPJi8tDOSzi4yqzoQPXYxz/JscVm6tWxs=;
        b=lRwepOBeX/whQTuJp8lkQIW/KHwhpwKOWUtEwEB1Tz2x+a4Pao2uVK8h+2mbyl4YnF
         jfu6mlItY0hbZjPQFVvJQv44f9RrRkCGMfTjzdKuO7DtIONuxfYsylVIJNdLwJMutVUb
         klaO+84G1FrlgPCP08WXWSsO868uDZCz7oveudjeVeWB/nQNOq5kSe226t5lKDm4zwnC
         MQSA5Z6aaLaw9A/Ej4DJHEY0XZ6oVPLU3mL+5nEi0YIj/ode41KIO8C6IwiCwT2B2NiP
         Ka519ipy4Ugh+MDqf7PWdYSDPCY4zlZiXYnxGeBN9QUqOEBEUUkVocbROmbQ+VVx6oiT
         LVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680462535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6vGHaP71nCPJi8tDOSzi4yqzoQPXYxz/JscVm6tWxs=;
        b=C/ImqGv9HPJO8jJ4HhL/6QOwd0sdVGW5Yr9kRIqw0KpKXbuMaUR2aym6uXuKeKD+yj
         59qsha151dZ6tCJqr6TJDfEJp+FTP7Ng+n0ZzkCK2MdhIiTO3OzD7yP/kYw85dehPfbr
         poenOXpgUL7vIThKH8NaE5TUlQ5mUCZAiSeRcAuTbsTbfaL2ai6/BTS981MYFCCKSYvE
         wHX3TW3MlPtpYPzfYLXaeby5q786zyXFq6I88dMxuW4qUbW4/nfVzE3kcgMPgsU2aXU2
         YdwSUOv5V5QJ1xI8XK3M8SObaoFskRADhfL8esgsodysKqGe9aE+zgQIngosKoDBzd4k
         GDeA==
X-Gm-Message-State: AO0yUKWkNlaq9p2XZPP2XKbgvMbNuLltehMRtw8fMVkTgrsZEWo9/KjL
        Jmt4CmWP0OfjC3yCC/XMA0WtNE/b8BVqoWGEkas=
X-Google-Smtp-Source: AKy350YMMhhboqdA7tdBl5JWcQE+bn5RxowQEuPrGZbal2cPuuAoJUkN4fpgLD5wAIs7fAzdEsaXKmFHmoEeyxkwjXE=
X-Received: by 2002:ac8:5905:0:b0:3c0:3c09:a4a4 with SMTP id
 5-20020ac85905000000b003c03c09a4a4mr12665801qty.0.1680462535625; Sun, 02 Apr
 2023 12:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-27-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-27-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 2 Apr 2023 21:08:19 +0200
Message-ID: <CAHp75VfkeQNAwSAbTGFMObsZ1L-BqCN6uDfWohCNSy=eKtTM6g@mail.gmail.com>
Subject: Re: [PATCH 26/28] media: atomisp: Remove struct atomisp_sub_device
 index field
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
> Remove the struct atomisp_sub_device.
>
> This was used for 2 things:
>
> 1. In dev_dbg() messages
> 2. To set the name of the v4l2_subdev for each struct atomisp_sub_device
>
> Now that only 1 subdev is used neither is useful anymore. Remove the _%d
> postfix from the v4l2_subdev name and remove the logging of the asd index
> from the dev_dbg() messages.
>
> In case of the atomisp_s_input() check to see if an input/sensor has
> already been assigned to another subdev the entire check no longer
> makes sense, so instead of changing the dev_err() message there just
> drop the entire check.

There are already dev_dbg() calls w/o __func__. Hence it makes sense
(to me) to drop __func__ in the ones you touched in this patch.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 15 +++++-------
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 23 ++++---------------
>  .../media/atomisp/pci/atomisp_subdev.c        |  3 +--
>  .../media/atomisp/pci/atomisp_subdev.h        |  5 ----
>  4 files changed, 11 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/st=
aging/media/atomisp/pci/atomisp_cmd.c
> index d0386dcb24ce..28663d6fc4dd 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -523,9 +523,8 @@ irqreturn_t atomisp_isr(int irq, void *dev)
>                 while (ia_css_dequeue_isys_event(&eof_event.event) =3D=3D=
 0) {
>                         atomisp_eof_event(&isp->asd, eof_event.event.exp_=
id);
>                         dev_dbg_ratelimited(isp->dev,
> -                                           "%s ISYS event: EOF exp_id %d=
, asd %d\n",
> -                                           __func__, eof_event.event.exp=
_id,
> -                                           isp->asd.index);
> +                                           "%s ISYS event: EOF exp_id %d=
\n",
> +                                           __func__, eof_event.event.exp=
_id);
>                 }
>
>                 irq_infos &=3D ~IA_CSS_IRQ_INFO_ISYS_EVENTS_READY;
> @@ -3302,9 +3301,8 @@ int atomisp_set_parameters(struct video_device *vde=
v,
>         }
>
>         dev_dbg(asd->isp->dev,
> -               "%s: set parameter(per_frame_setting %d) for asd%d with i=
sp_config_id %d of %s\n",
> -               __func__, arg->per_frame_setting, asd->index,
> -               arg->isp_config_id, vdev->name);
> +               "%s: set parameter(per_frame_setting %d) isp_config_id %d=
 of %s\n",
> +               __func__, arg->per_frame_setting, arg->isp_config_id, vde=
v->name);
>
>         if (IS_ISP2401) {
>                 if (atomisp_is_vf_pipe(pipe) && arg->per_frame_setting) {
> @@ -4515,9 +4513,8 @@ int atomisp_set_fmt(struct video_device *vdev, stru=
ct v4l2_format *f)
>                 return -EINVAL;
>
>         dev_dbg(isp->dev,
> -               "setting resolution %ux%u on pad %u for asd%d, bytesperli=
ne %u\n",
> -               f->fmt.pix.width, f->fmt.pix.height, source_pad,
> -               asd->index, f->fmt.pix.bytesperline);
> +               "setting resolution %ux%u on pad %u bytesperline %u\n",
> +               f->fmt.pix.width, f->fmt.pix.height, source_pad, f->fmt.p=
ix.bytesperline);
>
>         v4l2_fh_init(&fh.vfh, vdev);
>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/=
staging/media/atomisp/pci/atomisp_ioctl.c
> index 14700afd92c2..384f31fc66c5 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -671,18 +671,6 @@ static int atomisp_s_input(struct file *file, void *=
fh, unsigned int input)
>                 return -EINVAL;
>         }
>
> -       /*
> -        * check whether the request camera:
> -        * 1: already in use
> -        * 2: if in use, whether it is used by other streams
> -        */
> -       if (isp->inputs[input].asd && isp->inputs[input].asd !=3D asd) {
> -               dev_err(isp->dev,
> -                       "%s, camera is already used by stream: %d\n", __f=
unc__,
> -                       isp->inputs[input].asd->index);
> -               return -EBUSY;
> -       }
> -
>         camera =3D isp->inputs[input].camera;
>         if (!camera) {
>                 dev_err(isp->dev, "%s, no camera\n", __func__);
> @@ -1106,9 +1094,8 @@ static int atomisp_dqbuf_wrapper(struct file *file,=
 void *fh, struct v4l2_buffer
>         buf->reserved2 =3D pipe->frame_config_id[buf->index];
>
>         dev_dbg(isp->dev,
> -               "dqbuf buffer %d (%s) for asd%d with exp_id %d, isp_confi=
g_id %d\n",
> -               buf->index, vdev->name, asd->index, buf->reserved >> 16,
> -               buf->reserved2);
> +               "dqbuf buffer %d (%s) with exp_id %d, isp_config_id %d\n"=
,
> +               buf->index, vdev->name, buf->reserved >> 16, buf->reserve=
d2);
>         return 0;
>  }
>
> @@ -1186,8 +1173,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, u=
nsigned int count)
>
>         mutex_lock(&isp->mutex);
>
> -       dev_dbg(isp->dev, "Start stream on pad %d for asd%d\n",
> -               atomisp_subdev_source_pad(vdev), asd->index);
> +       dev_dbg(isp->dev, "Start stream on pad %d\n", atomisp_subdev_sour=
ce_pad(vdev));
>
>         ret =3D atomisp_pipe_check(pipe, false);
>         if (ret)
> @@ -1320,8 +1306,7 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
>
>         mutex_lock(&isp->mutex);
>
> -       dev_dbg(isp->dev, "Stop stream on pad %d for asd%d\n",
> -               atomisp_subdev_source_pad(vdev), asd->index);
> +       dev_dbg(isp->dev, "Stop stream on pad %d\n", atomisp_subdev_sourc=
e_pad(vdev));
>
>         /*
>          * There is no guarantee that the buffers queued to / owned by th=
e ISP
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers=
/staging/media/atomisp/pci/atomisp_subdev.c
> index 143176bc684a..a0acfdb87177 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> @@ -918,7 +918,7 @@ static int isp_subdev_init_entities(struct atomisp_su=
b_device *asd)
>         int ret;
>
>         v4l2_subdev_init(sd, &isp_subdev_v4l2_ops);
> -       sprintf(sd->name, "ATOMISP_SUBDEV_%d", asd->index);
> +       sprintf(sd->name, "ATOMISP_SUBDEV");
>         v4l2_set_subdevdata(sd, asd);
>         sd->flags |=3D V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEV=
NODE;
>
> @@ -1161,7 +1161,6 @@ int atomisp_subdev_init(struct atomisp_device *isp)
>  {
>         int ret;
>
> -       isp->asd.index =3D 0;
>         isp->asd.isp =3D isp;
>         isp_subdev_init_params(&isp->asd);
>         ret =3D isp_subdev_init_entities(&isp->asd);
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers=
/staging/media/atomisp/pci/atomisp_subdev.h
> index 117803f3cbd1..fee663bc415a 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
> @@ -315,11 +315,6 @@ struct atomisp_sub_device {
>         unsigned int streaming;
>         bool stream_prepared; /* whether css stream is created */
>
> -       /* subdev index: will be used to show which subdev is holding the
> -        * resource, like which camera is used by which subdev
> -        */
> -       unsigned int index;
> -
>         unsigned int latest_preview_exp_id; /* CSS ZSL/SDV raw buffer id =
*/
>
>         unsigned int mipi_frame_size;
> --
> 2.39.1
>


--=20
With Best Regards,
Andy Shevchenko

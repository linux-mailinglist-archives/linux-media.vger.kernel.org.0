Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4D5751E9
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 16:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388609AbfGYO4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 10:56:45 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:41448 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387713AbfGYO4p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 10:56:45 -0400
Received: by mail-qk1-f193.google.com with SMTP id v22so36627128qkj.8
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 07:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2KvsYWRea0gHQ+iKhrkg7aT6KsWi4jdQvi3gbaOJG9s=;
        b=w9Ak98OXPaANv1jKTsDmp6NKqS5rqNntQbUA1OxSCzqAwcD9JUU6oF1a+ul0mGyBR/
         AxkceSQCj6mtoxAjX6h4Qex3ThaPVJ+a/SMmT2MOnnQNNHk1N9Jv8TQBD4odmfcbuwfV
         rj+iIQngrzJAnh3xPOdMMrMvju6Cz3BAMla7T8QkLiyG9GI4lKFnhBLkibYZIPhut4Cr
         ZHNXkr2Qu9yBAaewU/To2oA2Shtryugp9Ub5mKOj8cmcSYx9w0tPWhBTHIQjwdg2PQVA
         ONkbVDGibDpdbdUbe2paolXxoY3IGOqZqt1yffT29J7b6TObgnykdqexd+uEiJko+2hI
         VaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2KvsYWRea0gHQ+iKhrkg7aT6KsWi4jdQvi3gbaOJG9s=;
        b=JEmUeQeqc2XqzMxH1QgYHgf+aWR8afqIysT+wVaRV6wkb9/nr1cEUnSATMWuuVyNhD
         y561t36RAf78Kh2/6s5wblGDiPA82LR878Z3UY2vbQNOub06UGrmyTmOkM05xueUtY6R
         /RlyZJbnb9gEiAt0lCLI8CHkH6z9nV9vHelcGoaahi2lGBVR/+PYf8yXasNZ+jHvZ0Hd
         YZncwjZCfOtGR1YDPWakDOFcw96ye7qtXViI/XRLXi43fjwhpdCxI/39rZGdM0KrIbmv
         2u0Zf+OtcAw+Q9pWS4dTSV+d4xNQbCn9i0AXVmirOnIE0yWyEo/Wb3OlMhVWJKPJ2nqi
         pZCQ==
X-Gm-Message-State: APjAAAU0F/Y9U3YDFTSw12uqt54t90cFMXccpTkqEbLyTDW9QErgf+sh
        9IYlCZ0yWMK8i0B8nEU21YemKkhZaGF2Ao+SybVcUw==
X-Google-Smtp-Source: APXvYqxBufcNa6Cl5b/ulVcousmRBbjY2SdYILRKGy2TLjI8bgrjOyNqWALDq1yw7+jA/vJfQgY2ZyMmemfDJNROo+A=
X-Received: by 2002:a37:9c94:: with SMTP id f142mr53119036qke.427.1564066604285;
 Thu, 25 Jul 2019 07:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <1562082779-31165-1-git-send-email-hugues.fruchet@st.com>
 <1562082779-31165-4-git-send-email-hugues.fruchet@st.com> <81e1a94d-af25-302c-64a6-3cec096d4144@xs4all.nl>
In-Reply-To: <81e1a94d-af25-302c-64a6-3cec096d4144@xs4all.nl>
From:   Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date:   Thu, 25 Jul 2019 16:56:31 +0200
Message-ID: <CA+M3ks7HRc2C+dFpS9AM8ANo+=f360SFTCRrjavbqjd_SWkr_A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: stm32-dcmi: add support of several sub-devices
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hugues Fruchet <hugues.fruchet@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Mickael GUENE <mickael.guene@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeu. 25 juil. 2019 =C3=A0 13:40, Hans Verkuil <hverkuil@xs4all.nl> a =C3=
=A9crit :
>
> On 7/2/19 5:52 PM, Hugues Fruchet wrote:
> > Add support of several sub-devices within pipeline instead
> > of a single one.
> > This allows to support a CSI-2 camera sensor connected
> > through a CSI-2 to parallel bridge.
> >
> > Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> > ---
> >  drivers/media/platform/stm32/stm32-dcmi.c | 204 ++++++++++++++++++++++=
+++++---
> >  1 file changed, 186 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/=
platform/stm32/stm32-dcmi.c
> > index 6f37617..6921e6b 100644
> > --- a/drivers/media/platform/stm32/stm32-dcmi.c
> > +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> > @@ -172,6 +172,7 @@ struct stm32_dcmi {
> >
> >       struct media_device             mdev;
> >       struct media_pad                vid_cap_pad;
> > +     struct media_pipeline           pipeline;
> >  };
> >
> >  static inline struct stm32_dcmi *notifier_to_dcmi(struct v4l2_async_no=
tifier *n)
> > @@ -583,6 +584,131 @@ static void dcmi_buf_queue(struct vb2_buffer *vb)
> >       spin_unlock_irq(&dcmi->irqlock);
> >  }
> >
> > +static struct media_entity *dcmi_find_source(struct stm32_dcmi *dcmi)
> > +{
> > +     struct media_entity *entity =3D &dcmi->vdev->entity;
> > +     struct media_pad *pad;
> > +
> > +     /* Walk searching for entity having no sink */
> > +     while (1) {
> > +             pad =3D &entity->pads[0];
> > +             if (!(pad->flags & MEDIA_PAD_FL_SINK))
> > +                     break;
> > +
> > +             pad =3D media_entity_remote_pad(pad);
> > +             if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> > +                     break;
> > +
> > +             entity =3D pad->entity;
> > +     }
> > +
> > +     return entity;
> > +}
> > +
> > +static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
> > +                            struct v4l2_subdev_pad_config *pad_cfg,
> > +                            struct v4l2_subdev_format *format)
> > +{
> > +     struct media_entity *entity =3D &dcmi->entity.source->entity;
> > +     struct v4l2_subdev *subdev;
> > +     struct media_pad *sink_pad =3D NULL;
> > +     struct media_pad *src_pad =3D NULL;
> > +     struct media_pad *pad =3D NULL;
> > +     struct v4l2_subdev_format fmt =3D *format;
> > +     bool found =3D false;
> > +     int ret;
> > +
> > +     /*
> > +      * Starting from sensor subdevice, walk within
> > +      * pipeline and set format on each subdevice
> > +      */
> > +     while (1) {
> > +             unsigned int i;
> > +
> > +             /* Search if current entity has a source pad */
> > +             for (i =3D 0; i < entity->num_pads; i++) {
> > +                     pad =3D &entity->pads[i];
> > +                     if (pad->flags & MEDIA_PAD_FL_SOURCE) {
> > +                             src_pad =3D pad;
> > +                             found =3D true;
> > +                             break;
> > +                     }
> > +             }
> > +             if (!found)
> > +                     break;
> > +
> > +             subdev =3D media_entity_to_v4l2_subdev(entity);
> > +
> > +             /* Propagate format on sink pad if any, otherwise source =
pad */
> > +             if (sink_pad)
> > +                     pad =3D sink_pad;
> > +
> > +             dev_dbg(dcmi->dev, "%s[%d] pad format set to 0x%x %ux%u\n=
",
> > +                     subdev->name, pad->index, format->format.code,
> > +                     format->format.width, format->format.height);
> > +
> > +             fmt.pad =3D pad->index;
> > +             ret =3D v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &=
fmt);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             /* Walk to next entity */
> > +             sink_pad =3D media_entity_remote_pad(src_pad);
> > +             if (!sink_pad || !is_media_entity_v4l2_subdev(sink_pad->e=
ntity))
> > +                     break;
> > +
> > +             entity =3D sink_pad->entity;
> > +     }
> > +     *format =3D fmt;
> > +
> > +     return 0;
> > +}
> > +
> > +static int dcmi_pipeline_s_stream(struct stm32_dcmi *dcmi, int state)
> > +{
> > +     struct media_entity *entity =3D &dcmi->vdev->entity;
> > +     struct v4l2_subdev *subdev;
> > +     struct media_pad *pad;
> > +     int ret;
> > +
> > +     /* Start/stop all entities within pipeline */
> > +     while (1) {
> > +             pad =3D &entity->pads[0];
> > +             if (!(pad->flags & MEDIA_PAD_FL_SINK))
> > +                     break;
> > +
> > +             pad =3D media_entity_remote_pad(pad);
> > +             if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> > +                     break;
> > +
> > +             entity =3D pad->entity;
> > +             subdev =3D media_entity_to_v4l2_subdev(entity);
> > +
> > +             ret =3D v4l2_subdev_call(subdev, video, s_stream, state);
> > +             if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> > +                     dev_err(dcmi->dev, "%s: %s failed to %s streaming=
 (%d)\n",
> > +                             __func__, subdev->name,
> > +                             state ? "start" : "stop", ret);
> > +                     return ret;
> > +             }
> > +
> > +             dev_dbg(dcmi->dev, "%s is %s\n",
> > +                     subdev->name, state ? "started" : "stopped");
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int dcmi_pipeline_start(struct stm32_dcmi *dcmi)
> > +{
> > +     return dcmi_pipeline_s_stream(dcmi, 1);
> > +}
> > +
> > +static void dcmi_pipeline_stop(struct stm32_dcmi *dcmi)
> > +{
> > +     dcmi_pipeline_s_stream(dcmi, 0);
> > +}
> > +
> >  static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int cou=
nt)
> >  {
> >       struct stm32_dcmi *dcmi =3D vb2_get_drv_priv(vq);
> > @@ -597,14 +723,17 @@ static int dcmi_start_streaming(struct vb2_queue =
*vq, unsigned int count)
> >               goto err_release_buffers;
> >       }
> >
> > -     /* Enable stream on the sub device */
> > -     ret =3D v4l2_subdev_call(dcmi->entity.source, video, s_stream, 1)=
;
> > -     if (ret && ret !=3D -ENOIOCTLCMD) {
> > -             dev_err(dcmi->dev, "%s: Failed to start streaming, subdev=
 streamon error",
> > -                     __func__);
> > +     ret =3D media_pipeline_start(&dcmi->vdev->entity, &dcmi->pipeline=
);
> > +     if (ret < 0) {
> > +             dev_err(dcmi->dev, "%s: Failed to start streaming, media =
pipeline start error (%d)\n",
> > +                     __func__, ret);
> >               goto err_pm_put;
> >       }
> >
> > +     ret =3D dcmi_pipeline_start(dcmi);
> > +     if (ret)
> > +             goto err_media_pipeline_stop;
> > +
> >       spin_lock_irq(&dcmi->irqlock);
> >
> >       /* Set bus width */
> > @@ -676,7 +805,7 @@ static int dcmi_start_streaming(struct vb2_queue *v=
q, unsigned int count)
> >       if (ret) {
> >               dev_err(dcmi->dev, "%s: Start streaming failed, cannot st=
art capture\n",
> >                       __func__);
> > -             goto err_subdev_streamoff;
> > +             goto err_pipeline_stop;
> >       }
> >
> >       /* Enable interruptions */
> > @@ -687,8 +816,11 @@ static int dcmi_start_streaming(struct vb2_queue *=
vq, unsigned int count)
> >
> >       return 0;
> >
> > -err_subdev_streamoff:
> > -     v4l2_subdev_call(dcmi->entity.source, video, s_stream, 0);
> > +err_pipeline_stop:
> > +     dcmi_pipeline_stop(dcmi);
> > +
> > +err_media_pipeline_stop:
> > +     media_pipeline_stop(&dcmi->vdev->entity);
> >
> >  err_pm_put:
> >       pm_runtime_put(dcmi->dev);
> > @@ -713,13 +845,10 @@ static void dcmi_stop_streaming(struct vb2_queue =
*vq)
> >  {
> >       struct stm32_dcmi *dcmi =3D vb2_get_drv_priv(vq);
> >       struct dcmi_buf *buf, *node;
> > -     int ret;
> >
> > -     /* Disable stream on the sub device */
> > -     ret =3D v4l2_subdev_call(dcmi->entity.source, video, s_stream, 0)=
;
> > -     if (ret && ret !=3D -ENOIOCTLCMD)
> > -             dev_err(dcmi->dev, "%s: Failed to stop streaming, subdev =
streamoff error (%d)\n",
> > -                     __func__, ret);
> > +     dcmi_pipeline_stop(dcmi);
> > +
> > +     media_pipeline_stop(&dcmi->vdev->entity);
> >
> >       spin_lock_irq(&dcmi->irqlock);
> >
> > @@ -937,8 +1066,7 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, s=
truct v4l2_format *f)
> >       mf->width =3D sd_framesize.width;
> >       mf->height =3D sd_framesize.height;
> >
> > -     ret =3D v4l2_subdev_call(dcmi->entity.source, pad,
> > -                            set_fmt, NULL, &format);
> > +     ret =3D dcmi_pipeline_s_fmt(dcmi, NULL, &format);
> >       if (ret < 0)
> >               return ret;
> >
> > @@ -1529,7 +1657,20 @@ static int dcmi_graph_notify_complete(struct v4l=
2_async_notifier *notifier)
> >       struct stm32_dcmi *dcmi =3D notifier_to_dcmi(notifier);
> >       int ret;
> >
> > +     /*
> > +      * Now that the graph is complete,
> > +      * we search for the source subdevice
> > +      * in order to expose it through V4L2 interface
> > +      */
> > +     dcmi->entity.source =3D
> > +             media_entity_to_v4l2_subdev(dcmi_find_source(dcmi));
> > +     if (!dcmi->entity.source) {
> > +             dev_err(dcmi->dev, "Source subdevice not found\n");
> > +             return -ENODEV;
> > +     }
> > +
> >       dcmi->vdev->ctrl_handler =3D dcmi->entity.source->ctrl_handler;
> > +
> >       ret =3D dcmi_formats_init(dcmi);
> >       if (ret) {
> >               dev_err(dcmi->dev, "No supported mediabus format found\n"=
);
> > @@ -1574,12 +1715,30 @@ static int dcmi_graph_notify_bound(struct v4l2_=
async_notifier *notifier,
> >                                  struct v4l2_async_subdev *asd)
> >  {
> >       struct stm32_dcmi *dcmi =3D notifier_to_dcmi(notifier);
> > +     unsigned int ret;
> > +     int src_pad;
> >
> >       dev_dbg(dcmi->dev, "Subdev %s bound\n", subdev->name);
> >
> > -     dcmi->entity.source =3D subdev;
> > +     /*
> > +      * Link this sub-device to DCMI, it could be
> > +      * a parallel camera sensor or a bridge
> > +      */
> > +     src_pad =3D media_entity_get_fwnode_pad(&subdev->entity,
> > +                                           subdev->fwnode,
> > +                                           MEDIA_PAD_FL_SOURCE);
> > +
> > +     ret =3D media_create_pad_link(&subdev->entity, src_pad,
> > +                                 &dcmi->vdev->entity, 0,
> > +                                 MEDIA_LNK_FL_IMMUTABLE |
> > +                                 MEDIA_LNK_FL_ENABLED);
> > +     if (ret)
> > +             dev_err(dcmi->dev, "Failed to create media pad link with =
subdev %s\n",
> > +                     subdev->name);
> > +     else
> > +             dev_dbg(dcmi->dev, "DCMI is now linked to %s\n", subdev->=
name);
> >
> > -     return 0;
> > +     return ret;
> >  }
> >
> >  static const struct v4l2_async_notifier_operations dcmi_graph_notify_o=
ps =3D {
> > @@ -1639,6 +1798,15 @@ static int dcmi_graph_init(struct stm32_dcmi *dc=
mi)
> >               return ret;
> >       }
> >
> > +     /* Register all the subdev nodes */
> > +     ret =3D v4l2_device_register_subdev_nodes(&dcmi->v4l2_dev);
>
> This shouldn't be needed. Only MC-centric drivers (i.e. where the pipelin=
e
> has to be configured by userspace) need to do this.

Hi Hans,
I think this point has been discussed in this thread
https://www.spinics.net/lists/linux-media/msg153417.html

In short : since the hardware only offer one possible path we don't expose
the configuration to userland and let DCMI driver configure the
subdevice (like bridge).

Benjamin

>
> Otherwise this patch looks good.
>
> Regards,
>
>         Hans
>
> > +     if (ret) {
> > +             dev_err(dcmi->dev, "Failed to register subdev nodes\n");
> > +             v4l2_async_notifier_unregister(&dcmi->notifier);
> > +             of_node_put(dcmi->entity.remote_node);
> > +             return ret;
> > +     }
> > +
> >       return 0;
> >  }
> >
> >
>

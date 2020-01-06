Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C944B130DAA
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 07:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgAFGpF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 01:45:05 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46740 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbgAFGpF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 01:45:05 -0500
Received: by mail-lf1-f68.google.com with SMTP id f15so35637800lfl.13
        for <linux-media@vger.kernel.org>; Sun, 05 Jan 2020 22:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HMBAUxMQPbHO/cSgd2YKfJbzkUfeuIeiWI+1c+5osNw=;
        b=XljDJwQbgkwR3cLGmVCV4wo9U0u3So8XQmal7tt3FRXEHtXr2L5cCX8I3UQPoIAtyD
         Ega14FUn7wRHALATgsvd4O98UYeV7hXQr6DruxShEIiz/5zhmgeFoT5WBcjBEemCnfSN
         MrFy4Y25l6Sqy2uEYtvESwqQR9QgniZx3T5N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HMBAUxMQPbHO/cSgd2YKfJbzkUfeuIeiWI+1c+5osNw=;
        b=SjQ16aU/dRSt7D/g2lG8iN3fWPG9u3FiXDdh8SNBd6o2B5NBxNpSAIvAffG8cUc99W
         f/5ikQfKTA3tYgXUWppIc9uNAQO5XuJwS1638oq9VTLTa3LzsVTFwR7giMyjJugF77go
         OHjG8ViiZ8LJET+VsDfbxuK4j62zSIu146xn2IaqFCYZA718TyTqEI1RlC9pTc+RvOvc
         fF3SinClj7GCdvM+tYcqa0O3395Gs2KAIHQdI8PCjQAHZBaunOHFIgcwg1cO0yzwXUFZ
         2bQ2/QcI7IGOrXchbH1+Y3IBNbDtT97bbt5PsOleQJx6w7fZ8Vjg31O72aP9DbmpkbGT
         lDCQ==
X-Gm-Message-State: APjAAAVzpsBCKExapnhC3lfm05EQ4WfDj8EczKm7sbz8bH+8gENlCmu3
        V7CQVIYmM0O2MCKrrD0OwvKPJDb/V1GJLY32iDoeGQ==
X-Google-Smtp-Source: APXvYqwQdWQPCeRshynvpcQnxAqzm8aTJVWohKBYlm1JLi/NS2APDeigEB5I9ofwUTwMQpH2UMQrC4N9r6XTxMczJcc=
X-Received: by 2002:a05:6512:25c:: with SMTP id b28mr2218494lfo.184.1578293102658;
 Sun, 05 Jan 2020 22:45:02 -0800 (PST)
MIME-Version: 1.0
References: <4595464.3jghpSLKuc@os-lin-dmo> <616A957C6824E5468EC44010E4F1DA4801477DA25C@MXS02.open-synergy.com>
 <CAD90Vcb-36R+frqxBnmnGJsE+1=qC4txSQOD_pexxiyOkEMgEg@mail.gmail.com> <3224757.fp6Gbkv8E8@os-lin-dmo>
In-Reply-To: <3224757.fp6Gbkv8E8@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Mon, 6 Jan 2020 15:44:51 +0900
Message-ID: <CAD90VcZe+siL4744i5d7huWrMebq2qyGLD7SiL9ASs9MNLAZLw@mail.gmail.com>
Subject: Re: [RFC] virtio video driver
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
        "kraxel@redhat.com" <kraxel@redhat.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "acourbot@chromium.org" <acourbot@chromium.org>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "posciak@chromium.org" <posciak@chromium.org>,
        "marcheu@chromium.org" <marcheu@chromium.org>,
        "stevensd@chromium.org" <stevensd@chromium.org>,
        "dgreid@chromium.org" <dgreid@chromium.org>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "egranata@google.com" <egranata@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

On Fri, Dec 27, 2019 at 11:05 PM Dmitry Sepp
<dmitry.sepp@opensynergy.com> wrote:
>
> Hi Keiichi,
>
> On Mittwoch, 25. Dezember 2019 12:38:55 CET Keiichi Watanabe wrote:
> > Hi Dmitry,
> >
> > Thanks for sharing the driver implementation.
> > Since the virtio protocol specification is still under discussion in
> > virtio-dev@ ML separately, let me add comments only about
> > implementation that are irrelevant to the protocol details.
> > Please find my comments inline.
> >
> > On Fri, Dec 6, 2019 at 1:33 AM Dmitry Sepp <Dmitry.Sepp@opensynergy.com>
> wrote:
> > > From: Kiran Pawar <kiran.pawar@opensynergy.com>
> > >
> > > This adds a Virtio based video driver for video streaming device that
> > > operates input and/or output data buffers to share video devices with
> > > several guests. The current implementation consist of V4L2 based video
> > > driver supporting video functions of decoder and encoder. This can be
> > > extended for other functions e.g. processor, capture and output.
> > > The device uses descriptor structures to advertise and negotiate stream
> > > formats and controls. This allows the driver to modify the processing
> > > logic of the device on a per stream basis.
> > >
> > > Signed-off-by: Dmitry Sepp <Dmitry.Sepp@opensynergy.com>
> > > Signed-off-by: Kiran Pawar <Kiran.Pawar@opensynergy.com>
> > > Signed-off-by: Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>
> > > ---
> > >
> > >  drivers/media/Kconfig                      |    1 +
> > >  drivers/media/Makefile                     |    2 +
> > >  drivers/media/virtio/Kconfig               |   11 +
> > >  drivers/media/virtio/Makefile              |   12 +
> > >  drivers/media/virtio/virtio_video.h        |  372 +++++++
> > >  drivers/media/virtio/virtio_video_caps.c   |  618 +++++++++++
> > >  drivers/media/virtio/virtio_video_dec.c    |  947 +++++++++++++++++
> > >  drivers/media/virtio/virtio_video_dec.h    |   30 +
> > >  drivers/media/virtio/virtio_video_device.c |  747 +++++++++++++
> > >  drivers/media/virtio/virtio_video_driver.c |  278 +++++
> > >  drivers/media/virtio/virtio_video_enc.c    | 1124 ++++++++++++++++++++
> > >  drivers/media/virtio/virtio_video_enc.h    |   30 +
> > >  drivers/media/virtio/virtio_video_vq.c     |  950 +++++++++++++++++
> > >  include/uapi/linux/virtio_ids.h            |    2 +
> > >  include/uapi/linux/virtio_video.h          |  456 ++++++++
> > >  15 files changed, 5580 insertions(+)
> > >  create mode 100644 drivers/media/virtio/Kconfig
> > >  create mode 100644 drivers/media/virtio/Makefile
> > >  create mode 100644 drivers/media/virtio/virtio_video.h
> > >  create mode 100644 drivers/media/virtio/virtio_video_caps.c
> > >  create mode 100644 drivers/media/virtio/virtio_video_dec.c
> > >  create mode 100644 drivers/media/virtio/virtio_video_dec.h
> > >  create mode 100644 drivers/media/virtio/virtio_video_device.c
> > >  create mode 100644 drivers/media/virtio/virtio_video_driver.c
> > >  create mode 100644 drivers/media/virtio/virtio_video_enc.c
> > >  create mode 100644 drivers/media/virtio/virtio_video_enc.h
> > >  create mode 100644 drivers/media/virtio/virtio_video_vq.c
> > >  create mode 100644 include/uapi/linux/virtio_video.h
> > >
> > > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > > index b36a41332867..cc95806e8f8b 100644
> > > --- a/drivers/media/Kconfig
> > > +++ b/drivers/media/Kconfig
> > > @@ -170,6 +170,7 @@ source "drivers/media/pci/Kconfig"
> > >
> > >  source "drivers/media/platform/Kconfig"
> > >  source "drivers/media/mmc/Kconfig"
> > >  source "drivers/media/radio/Kconfig"
> > >
> > > +source "drivers/media/virtio/Kconfig"
> > >
> > >  comment "Supported FireWire (IEEE 1394) Adapters"
> > >
> > >         depends on DVB_CORE && FIREWIRE
> > >
> > > diff --git a/drivers/media/Makefile b/drivers/media/Makefile
> > > index f215f0a89f9e..9517a6f724d1 100644
> > > --- a/drivers/media/Makefile
> > > +++ b/drivers/media/Makefile
> > > @@ -25,6 +25,8 @@ obj-y += rc/
> > >
> > >  obj-$(CONFIG_CEC_CORE) += cec/
> > >
> > > +obj-$(CONFIG_VIDEO_VIRTIO)  += virtio/
> > > +
> > >
> > >  #
> > >  # Finally, merge the drivers that require the core
> > >  #
> > >
> > > diff --git a/drivers/media/virtio/Kconfig b/drivers/media/virtio/Kconfig
> > > new file mode 100644
> > > index 000000000000..3289bcf233f0
> > > --- /dev/null
> > > +++ b/drivers/media/virtio/Kconfig
> > > @@ -0,0 +1,11 @@
> > > +# SPDX-License-Identifier: GPL-2.0+
> > > +# Video driver for virtio
> > > +
> > > +config VIDEO_VIRTIO
> >
> > "VIRTIO_VIDEO" would be better like VIRTIO_NET and VIRTIO_PCI.
> >
> Ok, I agree.
>
> > > +       tristate "Virtio video V4L2 driver"
> > > +       depends on VIRTIO && VIDEO_DEV && VIDEO_V4L2
> > > +       select VIDEOBUF2_DMA_SG
> > > +       select V4L2_MEM2MEM_DEV
> >
> > I suppose you also need "select VIDEOBUF2_V4L2", as struct
> > vb2_v4l2_buffer is used.
> >
> It is selected automatically by VIDEO_V4L2. Also, there are no drivers that
> set it explicitly.

Ah, you're right.
VIDEO_V4L2 selects VIDEOBUF2_V4L2 if VIDEOBUF2_CORE is set.
And, VIDEOBUF2_CORE should be set due to V4L2_MEM2MEM_DEV.
So, this looks okay as is.

>
> > > +       help
> > > +          This is the virtual video driver for virtio.
> > > +          Say Y or M.
> > > diff --git a/drivers/media/virtio/Makefile b/drivers/media/virtio/Makefile
> > > new file mode 100644
> > > index 000000000000..6bc48fde57b4
> > > --- /dev/null
> > > +++ b/drivers/media/virtio/Makefile
> > > @@ -0,0 +1,12 @@
> > > +# SPDX-License-Identifier: GPL-2.0+
> > > +
> > > +obj-$(CONFIG_VIDEO_VIRTIO) += virtio-video.o
> > > +
> > > +virtio-video-objs := \
> > > +    virtio_video_driver.o \
> > > +    virtio_video_vq.o \
> > > +    virtio_video_device.o \
> > > +    virtio_video_dec.o \
> > > +    virtio_video_enc.o \
> > > +    virtio_video_caps.o
> > > +
> > > diff --git a/drivers/media/virtio/virtio_video.h
> > > b/drivers/media/virtio/virtio_video.h new file mode 100644
> > > index 000000000000..23c77dc0cb93
> > > --- /dev/null
> > > +++ b/drivers/media/virtio/virtio_video.h
> > > @@ -0,0 +1,372 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/* Common header for virtio video driver.
> > > + *
> > > + * Copyright 2019 OpenSynergy GmbH.
> > > + *
> > > + * This program is free software; you can redistribute it and/or modify
> > > + * it under the terms of the GNU General Public License as published by
> > > + * the Free Software Foundation; either version 2 of the License, or
> > > + * (at your option) any later version.
> > > + *
> > > + * This program is distributed in the hope that it will be useful,
> > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > + * GNU General Public License for more details.
> > > + *
> > > + * You should have received a copy of the GNU General Public License
> > > + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> > > + */
> > > +
> > > +#ifndef _VIRTIO_VIDEO_H
> > > +#define _VIRTIO_VIDEO_H
> > > +
> > > +#include <linux/virtio.h>
> > > +#include <linux/virtio_ids.h>
> > > +#include <linux/virtio_config.h>
> > > +#include <linux/virtio_video.h>
> > > +#include <linux/list.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-mem2mem.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +
> > > +#define DRIVER_NAME "virtio-video"
> > > +
> > > +#ifndef VIRTIO_ID_VIDEO
> > > +#define VIRTIO_ID_VIDEO 29
> > > +#endif
> > > +
> > > +enum video_pin_type {
> > > +       VIDEO_PIN_TYPE_INPUT = 0,
> > > +       VIDEO_PIN_TYPE_OUTPUT,
> > > +};
> >
> > Why don't you use enums and structs defined in
> > /include/uapi/linux/virtio_video.h?
> > For example, I suppose we don't need this video_pin_type, as we can
> > use enum virtio_video_pin_type defined there.
> > Same for other enums and structs in this file.
> The idea was to have some extra layer of parameter verification. But I also
> agree this might be excessive.
>
> >
> > [snip]
> >
> > > diff --git a/drivers/media/virtio/virtio_video_dec.c
> > > b/drivers/media/virtio/virtio_video_dec.c new file mode 100644
> > > index 000000000000..c2ad62229d21
> > > --- /dev/null
> > > +++ b/drivers/media/virtio/virtio_video_dec.c
> > > @@ -0,0 +1,947 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/* Decoder for virtio video device.
> > > + *
> > > + * Copyright 2019 OpenSynergy GmbH.
> > > + *
> > > + * This program is free software; you can redistribute it and/or modify
> > > + * it under the terms of the GNU General Public License as published by
> > > + * the Free Software Foundation; either version 2 of the License, or
> > > + * (at your option) any later version.
> > > + *
> > > + * This program is distributed in the hope that it will be useful,
> > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > + * GNU General Public License for more details.
> > > + *
> > > + * You should have received a copy of the GNU General Public License
> > > + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> > > + */
> > > +
> > > +#include <media/v4l2-event.h>
> > > +#include <media/v4l2-ioctl.h>
> > > +#include <media/videobuf2-dma-sg.h>
> > > +
> > > +#include "virtio_video.h"
> > > +
> > > +static int virtio_video_queue_setup(struct vb2_queue *vq,
> > > +                                   unsigned int *num_buffers,
> > > +                                   unsigned int *num_planes,
> > > +                                   unsigned int sizes[],
> > > +                                   struct device *alloc_devs[])
> >
> > We have functions named "virtio_video_queue_setup" both in
> > virtio_video_dec.c and virtio_video_enc.c.
> > How about calling them "virtio_video_{dec,enc}_queue_setup" or
> > "virtvideo_{dec,enc}_queue_setup"?
> > Though the naming conflicts of static functions shouldn't cause any
> > problem when building a kernel, indexing tools, such as ctags, should
> > be confused.
> >
> > Same for other functions.
> There are some functions that simply can be moved to common code, we'll look
> into this as well.
>
> >
> > [snip]
> >
> > > +int virtio_video_init_dec_queues(void *priv, struct vb2_queue *src_vq,
> > > +                                struct vb2_queue *dst_vq)
> > > +{
> > > +       int ret;
> > > +       struct virtio_video_stream *stream = priv;
> > > +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> > > +       struct device *dev = vvd->vv->v4l2_dev.dev;
> > > +
> > > +       src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > > +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> >
> > I suppose this driver doesn't support DMABUF mode yet.
> > IIUC, VB_DMABUF should be specified only when a driver supports DMA
> > buffer importing.
> We do support DMABUF. This is exactly how virtio-video works in Android with
> gralloc handles. But ideally the driver needs to know device restrictions and
> alloc accordingly. This is why we needed struct virtio_video_plane_format. I
> guess we'll need to get it back.
>
> >
> > [snip]
> >
> > > +static int virtio_video_s_fmt(struct virtio_video_stream *stream,
> > > +                             struct v4l2_format *f)
> > > +{
> > > +       int i, ret;
> > > +       struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> > > +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> > > +       struct virtio_video *vv = vvd->vv;
> > > +       struct video_format_info info;
> > > +       struct video_format_info *p_info;
> > > +       enum video_pin_type pin = VIDEO_PIN_TYPE_INPUT;
> > > +
> > > +       ret = virtio_video_try_fmt(stream, f);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       info.frame_width = pix_mp->width;
> > > +       info.frame_height = pix_mp->height;
> > > +       info.num_planes = pix_mp->num_planes;
> > > +       info.fourcc_format = pix_mp->pixelformat;
> > > +
> > > +       for (i = 0; i < info.num_planes; i++) {
> > > +               info.plane_format[i].stride =
> > > +
> > > pix_mp->plane_fmt[i].bytesperline;
> > > +               info.plane_format[i].plane_size =
> > > +                                        pix_mp->plane_fmt[i].sizeimage;
> > > +       }
> > > +
> > > +       if (!V4L2_TYPE_IS_OUTPUT(f->type))
> > > +               pin = VIDEO_PIN_TYPE_OUTPUT;
> > > +
> > > +       virtio_video_req_set_params(vv, vvd->id, &info, pin,
> > > +                                   VIDEO_PARAMS_SCOPE_STREAM, stream);
> > > +
> > > +       virtio_video_req_get_params(vv, vvd->id, VIDEO_PIN_TYPE_INPUT,
> > > +                                   VIDEO_PARAMS_SCOPE_STREAM, stream);
> > > +
> > > +       virtio_video_req_get_params(vv, vvd->id, VIDEO_PIN_TYPE_OUTPUT,
> > > +                                   VIDEO_PARAMS_SCOPE_STREAM, stream);
> > > +
> >
> > nit: GET_PARAMS must be called for both queues after SET_PARAMS.
> > So, how about defining a function to call these three functions?
> Yes, might be useful.
>
> >
> > [snip]
> >
> > > +static int virtio_video_device_open(struct file *file)
> > > +{
> > > +       int ret;
> > > +       uint32_t stream_id;
> > > +       char name[TASK_COMM_LEN];
> > > +       struct virtio_video_stream *stream;
> > > +       struct video_device *video_dev = video_devdata(file);
> > > +       struct virtio_video_device *vvd = video_drvdata(file);
> > > +       struct virtio_video *vv = vvd->vv;
> > > +
> > > +       stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> > > +       if (!stream)
> > > +               return -ENOMEM;
> > > +
> > > +       get_task_comm(name, current);
> > > +       virtio_video_stream_id_get(vv, stream, &stream_id);
> > > +       ret = virtio_video_req_stream_create(vv, vvd->id, stream_id,
> > > name);
> >
> > It'd be better not to send virtio requests in open callback to avoid
> > unnecessary overhead. For example, we often open and close /dev/videoX
> > just to check its capabilities. In that case, we don't need to create
> > a stream.
> >
> > Instead, it'd make more sense to send the request when REQBUFS is
> > called by passing a non-zero value as "count" and no stream is created
> > yet.
> > Please see comments for stream_destroy in release callback, too.
> >
> We probably just don't need to open too often. I know udev does this once on
> boot. This is pretty much it.

Hmm, a documentation says that V4L2 open() has no side effects. So, I
wonder if the device state shouldn't be changed by open().
https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/func-open.html#description

Also, asking users to call open() less often doesn't sound like a good
idea. If we can avoid a performance issue in the driver side, we
should do so.
Delaying the requests shouldn't require so much code changes, I guess.

Best regards,
Keiichi


>
> > > +       if (ret) {
> > > +               v4l2_err(&vv->v4l2_dev, "failed to create stream\n");
> > > +               goto err_stream_create;
> > > +       }
> > > +
> > > +       stream->video_dev = video_dev;
> > > +       stream->stream_id = stream_id;
> > > +       stream->state = STREAM_STATE_IDLE;
> > > +       mutex_init(&stream->vq_mutex);
> > > +       INIT_WORK(&stream->work, virtio_video_worker);
> > > +       v4l2_fh_init(&stream->fh, video_dev);
> > > +       stream->fh.ctrl_handler = &stream->ctrl_handler;
> > > +
> > > +       if (vvd->type == VIRTIO_VIDEO_FUNC_DECODER) {
> >
> > nit: How about using switch statements? Same for other if-else
> > statements for vvd->type.
> I agree. It will look more neat.
>
> >
> > [snip]
> >
> > > +
> > > +static int virtio_video_device_release(struct file *file)
> > > +{
> > > +       struct virtio_video_stream *stream = file2stream(file);
> > > +       struct video_device *video_dev = video_devdata(file);
> > > +       struct virtio_video_device *vvd = video_drvdata(file);
> > > +       struct virtio_video *vv = vvd->vv;
> > > +
> > > +       v4l2_fh_del(&stream->fh);
> > > +       v4l2_fh_exit(&stream->fh);
> > > +       mutex_lock(video_dev->lock);
> > > +       v4l2_m2m_ctx_release(stream->fh.m2m_ctx);
> > > +       mutex_unlock(video_dev->lock);
> > > +
> > > +       virtio_video_req_stream_destroy(vv, vvd->id, stream->stream_id);
> >
> > As with STREAM_CREATE requests, STREAM_DESTROY should be sent in
> > REQBUFS callback as well.
> > We can call it in REQBUFS when "v4l2_requestbuffers.count" is 0 and an
> > active stream already exists (i.e. stream_id > 0).
> > Still, it'd be good to keep STREAM_DESTROY here, as users can forget
> > to free buffers via REQBUFS.
> >
> > [snip]
> >
> > > +void virtio_video_resource_id_get(struct virtio_video *vv, uint32_t *id)
> > > +{
> > > +       int handle;
> > > +
> > > +       idr_preload(GFP_KERNEL);
> > > +       spin_lock(&vv->resource_idr_lock);
> > > +       handle = idr_alloc(&vv->resource_idr, NULL, 1, 0, GFP_NOWAIT);
> >
> > We should check if idr_alloc returns no error here or caller-side.
> >
> > [snip]
> >
> > > +static int
> > > +virtio_video_queue_ctrl_buffer_locked(struct virtio_video *vv,
> > > +                                     struct virtio_video_vbuffer *vbuf)
> > > +{
> > > +       struct virtqueue *vq = vv->ctrlq.vq;
> > > +       struct scatterlist *sgs[3], vreq, vout, vresp;
> > > +       int outcnt = 0, incnt = 0;
> > > +       int ret;
> >
> > How about adding WARN_ON(!mutex_is_locked(&vv->ctrlq.qlock)) to
> > prevent misuse and show which lock must be used?
> Makes sense.
>
> >
> > > +
> > > +       if (!vv->vq_ready)
> > > +               return -ENODEV;
> > > +
> > > +       sg_init_one(&vreq, vbuf->buf, vbuf->size);
> > > +       sgs[outcnt + incnt] = &vreq;
> > > +       outcnt++;
> > > +
> > > +       if (vbuf->data_size) {
> > > +               sg_init_one(&vout, vbuf->data_buf, vbuf->data_size);
> > > +               sgs[outcnt + incnt] = &vout;
> > > +               outcnt++;
> > > +       }
> > > +
> > > +       if (vbuf->resp_size) {
> > > +               sg_init_one(&vresp, vbuf->resp_buf, vbuf->resp_size);
> > > +               sgs[outcnt + incnt] = &vresp;
> > > +               incnt++;
> > > +       }
> > > +
> > > +retry:
> > > +       ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
> > > +       if (ret == -ENOSPC) {
> > > +               spin_unlock(&vv->ctrlq.qlock);
> > > +               wait_event(vv->ctrlq.ack_queue, vq->num_free);
> >
> > wait_event_timeout would be better to avoid getting stuck.
> True.
>
> >
> > > +               spin_lock(&vv->ctrlq.qlock);
> > > +               goto retry;
> >
> > I'd use while-loop instead of goto.
> >
> The code was derived from virtio-gpu. Doesn't make too much difference in the
> end.
>
> > [snip]
> >
> > > +int virtio_video_req_stream_create(struct virtio_video *vv,
> > > +                                  uint32_t function_id, uint32_t
> > > stream_id, +                                  const char *name)
> > > +{
> > > +       struct virtio_video_stream_create *req_p;
> > > +       struct virtio_video_vbuffer *vbuf;
> > > +
> > > +       req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
> > > +       if (IS_ERR(req_p))
> > > +               return PTR_ERR(req_p);
> > > +       memset(req_p, 0, sizeof(*req_p));
> >
> > I'm wondering if we don't need to call memset here, as
> > virtio_video_get_vbuf calls memset for vbuf.
> > If it's not true, it'd make sense to call memset in
> > virtio_video_alloc_req instead because we always want to have
> > zero-initialized structs.
> >
> I agree.
>
> Best regards,
> Dmitry.
>
> > [snip]
> >
> > Best regards,
> > Keiichi
>
>

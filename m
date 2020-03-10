Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8F3417F4FC
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 11:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgCJKZO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 06:25:14 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41716 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbgCJKZN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 06:25:13 -0400
Received: by mail-lj1-f196.google.com with SMTP id o10so6721323ljc.8
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2020 03:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4EW8jVcFvlyN+XOI2qNXKHQx2koBIEQW3aiOESFxBlY=;
        b=kkgcRRhT+WkfLcvf1l6zDdie5cPlt53eFzqkN3RMj0sXzoQ4zDYJaObMizdrg4iLy+
         /mpQM82AL4El33d0vqrfhCqAzdJiaWj71Lsogg1ehHxp+X4Ba8buKh7lkKuVBSNycEWU
         818RD0Q3/sMigS++vnGmN15zfxJJn59npSb80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4EW8jVcFvlyN+XOI2qNXKHQx2koBIEQW3aiOESFxBlY=;
        b=rLTcnu4PVwerSXZCz8GArTqfKLExqImZOcQ7FTds3Y5agV7nnrtjUzee4rIYkxsete
         ndyuW/m4aJl5OUgMJLdWJaVyxD1Jwc8LEUD2EDehqjOQTmXGw7Y18yji/ZMMFKO0U5oq
         vqJUlMtIK2Chmbx9vjyY3glTsCFV2rC7TRyPnZ9SWGpVpD0HBtIXf5aRwuGSQ2DiH6CG
         LDYwrUTbGlWS0z5dBOcmGM5clCExSxNOLjXfldP1/6pNGBedPI7ixybsqXUniNog82Z1
         FTNt53tK6nL59f1A1Mad8k8UMoC/ixMWPHSgAfvUAP/xdFkmYgtYnnh9IpGaXPjrzbqY
         ZH/Q==
X-Gm-Message-State: ANhLgQ3Eixkoza7FVeERnqNYCzSGHoOuZeJjxYI3J7uPS4uCTg2uNliF
        Q/erdOOStF2AiFBunZq07f5vM+fZDWx7A5AKJC8Bmw==
X-Google-Smtp-Source: ADFU+vtW5/7zhr7uQJ4/N/Osc/fHTow3Q5wtfAAAUcWazHartRXJFCJ78rc/Sqnm8eBHuNN3bNSX/rhf1ZkAkX7j0LA=
X-Received: by 2002:a05:651c:1139:: with SMTP id e25mr1233556ljo.261.1583835899092;
 Tue, 10 Mar 2020 03:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com> <20200218202753.652093-2-dmitry.sepp@opensynergy.com>
In-Reply-To: <20200218202753.652093-2-dmitry.sepp@opensynergy.com>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Tue, 10 Mar 2020 19:24:45 +0900
Message-ID: <CAD90VcYsM6OV8=y_3pD+n7wBkgv-AMaEZ-t5Goirn4FLi73bmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] video_video: Add the Virtio Video V4L2 driver
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>,
        Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Dmitry for submitting this patch!

Sorry for the slow response.
I implemented virtio-video decoder device for ChromeOS and could play
a video with this driver on a VM on with several local patches [1].
I think the driver is implemented well in general, but I found some
problems to be fixed and a concern:

# v4l2-compiance test
I tried run v4l2-compliance test [2] against this driver, but 8 test
cases are still failing in my environment.
Would you mind fixing it to make it pass?

# Takes a long time to decode the first frame
When we tried a normal video player application, it takes a long time
(2+ seconds) until the first frame is displayed.
We cannot see such a problem when we used our previous virtio-vdec driver [3].

I think this is because the application opens the /dev/video device to
query capability, but the opening the device is an expensive operation
in the current virtio-video driver implementation.
This can be improved by moving STREAM_CREATE request from the open
callback to a place where it's actually needed, as I suggested in the
previous version.
Though you listed this problem as one of "Potential improvements", I
think this is a high priority issue.

# Timing of dequeue
This is not a problem but a concern. The current implementation
processes host responses as 'batches' periodically in
virtio_video_dequeue_cmd_func.
As a result, decoded frames are dequeued as batches as well instead of
being dequeued ASAP.
e.g. 6 frames are dequeued over 10ms, no frames for 90ms, 6 frames over 10ms...

I don't think this is a problem, but it should be aware of this.
Note that the virtio-video seems to have slightly lower power
consumption than the old virtio-vdec (~5%). It may be thanks to this
design choice.

--

See my other review comments inline. Note that my patch [4] addresses
some of them.
By the way, I guess the prefix of this mail's subject should be
"virtio_video" instead of "video_video":)

Best regards,
Keiichi

[1] https://chromium-review.googlesource.com/q/hashtag:%22virtio-video%22+(status:open%20OR%20status:merged)
[2] https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance
[3] https://lwn.net/Articles/803676/
[4] https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2060510/7


On Wed, Feb 19, 2020 at 5:28 AM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> This adds a Virtio based video driver for video streaming device that
> operates input and output data buffers to share video devices with
> several guests. The current implementation consist of V4L2 based video
> driver supporting video functions of decoder and encoder. The device
> uses command structures to advertise and negotiate stream formats and
> controls. This allows the driver to modify the processing logic of the
> device on a per stream basis.
>
> Signed-off-by: Dmitry Sepp <dmitry.sepp@opensynergy.com>
> Signed-off-by: Kiran Pawar <Kiran.Pawar@opensynergy.com>
> Signed-off-by: Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>
> Signed-off-by: Samiullah Khawaja <samiullah.khawaja@opensynergy.com>
> ---
>  drivers/media/Kconfig                       |    1 +
>  drivers/media/Makefile                      |    2 +
>  drivers/media/virtio/Kconfig                |   12 +
>  drivers/media/virtio/Makefile               |   12 +
>  drivers/media/virtio/virtio_video.h         |  402 +++++++
>  drivers/media/virtio/virtio_video_caps.c    |  498 +++++++++
>  drivers/media/virtio/virtio_video_dec.c     |  427 ++++++++
>  drivers/media/virtio/virtio_video_dec.h     |   30 +
>  drivers/media/virtio/virtio_video_device.c  | 1079 +++++++++++++++++++
>  drivers/media/virtio/virtio_video_driver.c  |  315 ++++++
>  drivers/media/virtio/virtio_video_enc.c     |  569 ++++++++++
>  drivers/media/virtio/virtio_video_enc.h     |   30 +
>  drivers/media/virtio/virtio_video_helpers.c |  250 +++++
>  drivers/media/virtio/virtio_video_vq.c      | 1012 +++++++++++++++++
>  include/uapi/linux/virtio_ids.h             |    2 +
>  include/uapi/linux/virtio_video.h           |  469 ++++++++
>  16 files changed, 5110 insertions(+)
>  create mode 100644 drivers/media/virtio/Kconfig
>  create mode 100644 drivers/media/virtio/Makefile
>  create mode 100644 drivers/media/virtio/virtio_video.h
>  create mode 100644 drivers/media/virtio/virtio_video_caps.c
>  create mode 100644 drivers/media/virtio/virtio_video_dec.c
>  create mode 100644 drivers/media/virtio/virtio_video_dec.h
>  create mode 100644 drivers/media/virtio/virtio_video_device.c
>  create mode 100644 drivers/media/virtio/virtio_video_driver.c
>  create mode 100644 drivers/media/virtio/virtio_video_enc.c
>  create mode 100644 drivers/media/virtio/virtio_video_enc.h
>  create mode 100644 drivers/media/virtio/virtio_video_helpers.c
>  create mode 100644 drivers/media/virtio/virtio_video_vq.c
>  create mode 100644 include/uapi/linux/virtio_video.h
>
> diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> index 092e7509af9b..b89169e5d24d 100644
> --- a/drivers/media/Kconfig
> +++ b/drivers/media/Kconfig
> @@ -205,6 +205,7 @@ source "drivers/media/pci/Kconfig"
>  source "drivers/media/platform/Kconfig"
>  source "drivers/media/mmc/Kconfig"
>  source "drivers/media/radio/Kconfig"
> +source "drivers/media/virtio/Kconfig"
>
>  comment "Supported FireWire (IEEE 1394) Adapters"
>         depends on DVB_CORE && FIREWIRE
> diff --git a/drivers/media/Makefile b/drivers/media/Makefile
> index 4a330d0e5e40..1d886730bafd 100644
> --- a/drivers/media/Makefile
> +++ b/drivers/media/Makefile
> @@ -34,6 +34,8 @@ obj-y += rc/
>
>  obj-$(CONFIG_CEC_CORE) += cec/
>
> +obj-$(CONFIG_VIRTIO_VIDEO)  += virtio/
> +
>  #
>  # Finally, merge the drivers that require the core
>  #
> diff --git a/drivers/media/virtio/Kconfig b/drivers/media/virtio/Kconfig
> new file mode 100644
> index 000000000000..82012178254d
> --- /dev/null
> +++ b/drivers/media/virtio/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +# Video driver for virtio
> +
> +config VIRTIO_VIDEO
> +       tristate "Virtio video V4L2 driver"
> +       depends on VIRTIO && VIDEO_DEV && VIDEO_V4L2
> +       select VIDEOBUF2_DMA_SG
> +       select VIDEOBUF2_DMA_CONTIG
> +       select V4L2_MEM2MEM_DEV
> +       help
> +          This is the virtual video driver for virtio.
> +          Say Y or M.
> diff --git a/drivers/media/virtio/Makefile b/drivers/media/virtio/Makefile
> new file mode 100644
> index 000000000000..b17dce4cfc19
> --- /dev/null
> +++ b/drivers/media/virtio/Makefile
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +obj-$(CONFIG_VIRTIO_VIDEO) += virtio-video.o
> +
> +virtio-video-objs := \
> +    virtio_video_driver.o \
> +    virtio_video_device.o \
> +    virtio_video_vq.o \
> +    virtio_video_dec.o \
> +    virtio_video_enc.o \
> +    virtio_video_caps.o \
> +    virtio_video_helpers.o
> diff --git a/drivers/media/virtio/virtio_video.h b/drivers/media/virtio/virtio_video.h
> new file mode 100644
> index 000000000000..c5a5704326c0
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_video.h
> @@ -0,0 +1,402 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/* Common header for virtio video driver.
> + *
> + * Copyright 2019 OpenSynergy GmbH.

2020?

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef _VIRTIO_VIDEO_H
> +#define _VIRTIO_VIDEO_H
> +
> +#include <linux/virtio.h>
> +#include <linux/virtio_ids.h>
> +#include <linux/virtio_config.h>
> +#include <linux/virtio_video.h>
> +#include <linux/list.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#define DRIVER_NAME "virtio-video"
> +
> +#define MIN_BUFS_MIN 0
> +#define MIN_BUFS_MAX 32
> +#define MIN_BUFS_STEP 1
> +#define MIN_BUFS_DEF 1
> +
> +enum virtio_video_device_type {
> +       VIRTIO_VIDEO_DEVICE_ENCODER = 0x0100,
> +       VIRTIO_VIDEO_DEVICE_DECODER,
> +};
> +
> +struct video_format_frame {
> +       struct virtio_video_format_frame frame;
> +       struct virtio_video_format_range *frame_rates;
> +};
> +
> +struct video_format {
> +       struct list_head formats_list_entry;
> +       struct virtio_video_format_desc desc;
> +       struct video_format_frame *frames;
> +};
> +
> +struct video_control_fmt_data {
> +       uint32_t min;
> +       uint32_t max;
> +       uint32_t num;
> +       uint32_t skip_mask;
> +       uint32_t *entries;
> +};
> +
> +struct video_control_format {
> +       struct list_head controls_list_entry;
> +       uint32_t format;
> +       struct video_control_fmt_data *profile;
> +       struct video_control_fmt_data *level;
> +};
> +
> +struct video_plane_format {
> +       uint32_t plane_size;
> +       uint32_t stride;
> +};
> +
> +struct video_format_info {
> +       uint32_t fourcc_format;
> +       uint32_t frame_rate;
> +       uint32_t frame_width;
> +       uint32_t frame_height;
> +       uint32_t min_buffers;
> +       uint32_t max_buffers;
> +       struct virtio_video_crop crop;
> +       uint32_t num_planes;
> +       struct video_plane_format plane_format[VIRTIO_VIDEO_MAX_PLANES];
> +       bool is_updated;
> +};
> +
> +struct video_control_info {
> +       uint32_t profile;
> +       uint32_t level;
> +       uint32_t bitrate;
> +       bool is_updated;
> +};
> +
> +struct virtio_video;
> +struct virtio_video_vbuffer;
> +
> +typedef void (*virtio_video_resp_cb)(struct virtio_video *vv,
> +                                    struct virtio_video_vbuffer *vbuf);
> +
> +struct virtio_video_vbuffer {
> +       char *buf;
> +       int size;
> +
> +       void *data_buf;
> +       uint32_t data_size;
> +
> +       char *resp_buf;
> +       int resp_size;
> +
> +       void *priv;
> +       virtio_video_resp_cb resp_cb;
> +
> +       struct list_head list;
> +};
> +
> +struct virtio_video_queue {
> +       struct virtqueue *vq;
> +       spinlock_t qlock;
> +       wait_queue_head_t ack_queue;
> +       struct work_struct dequeue_work;
> +};
> +
> +struct virtio_video {
> +       struct v4l2_device v4l2_dev;
> +       int instance;

unused?

> +
> +       struct virtio_device *vdev;
> +       struct virtio_video_queue commandq;
> +       struct virtio_video_queue eventq;
> +       wait_queue_head_t wq;
> +       bool vq_ready;
> +
> +       struct kmem_cache *vbufs;
> +
> +       struct idr resource_idr;
> +       spinlock_t resource_idr_lock;
> +       struct idr stream_idr;
> +       spinlock_t stream_idr_lock;
> +
> +       uint32_t max_caps_len;
> +       uint32_t max_resp_len;
> +       bool got_caps;
> +       bool got_control;
> +
> +       bool has_iommu;
> +       bool supp_non_contig;
> +       struct list_head devices_list;
> +
> +       int debug;
> +       int use_dma_mem;
> +};
> +
> +struct virtio_video_device {
> +       struct virtio_video *vv;
> +       struct video_device video_dev;
> +       struct mutex video_dev_mutex;
> +
> +       struct v4l2_m2m_dev *m2m_dev;
> +
> +       struct workqueue_struct *workqueue;
> +
> +       struct list_head devices_list_entry;
> +       /* VIRTIO_VIDEO_FUNC_ */
> +       uint32_t type;
> +
> +       uint32_t num_input_fmts;
> +       struct list_head input_fmt_list;
> +
> +       uint32_t num_output_fmts;
> +       struct list_head output_fmt_list;
> +
> +       struct list_head controls_fmt_list;
> +};
> +
> +enum video_stream_state {
> +       STREAM_STATE_IDLE = 0,
> +       STREAM_STATE_INIT,
> +       STREAM_STATE_METADATA, /* specific to decoder */
> +       STREAM_STATE_RUNNING,
> +       STREAM_STATE_DRAIN,
> +       STREAM_STATE_STOPPED,
> +       STREAM_STATE_RESET, /* specific to encoder */
> +};

Could you use same state names with state machines in the V4L2 documentation?
https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/dev-decoder.html#state-machine

e.g. Rename STREAM_STATE_METADATA to STREAM_STATE_DYNAMIC_RES_CHANGE

> +
> +struct virtio_video_stream {
> +       uint32_t stream_id;
> +       enum video_stream_state state;
> +       struct video_device *video_dev;
> +       struct v4l2_fh fh;
> +       struct mutex vq_mutex;
> +       struct v4l2_ctrl_handler ctrl_handler;
> +       struct video_format_info in_info;
> +       struct video_format_info out_info;
> +       struct video_control_info control;
> +       bool src_cleared;
> +       bool dst_cleared;
> +       bool src_destroyed;
> +       bool dst_destroyed;
> +       struct work_struct work;
> +       struct video_format_frame *current_frame;
> +};
> +
> +struct virtio_video_buffer {
> +       struct v4l2_m2m_buffer v4l2_m2m_vb;
> +       uint32_t resource_id;
> +       bool queued;
> +};
> +
> +static inline gfp_t
> +virtio_video_gfp_flags(struct virtio_video *vv)
> +{
> +       if (vv->use_dma_mem)
> +               return GFP_DMA;
> +       else
> +               return 0;
> +}
> +
> +static inline const struct vb2_mem_ops *
> +virtio_video_mem_ops(struct virtio_video *vv)
> +{
> +       if (vv->supp_non_contig)
> +               return &vb2_dma_sg_memops;
> +       else
> +               return &vb2_dma_contig_memops;
> +}
> +
> +static inline struct virtio_video_device *
> +to_virtio_vd(struct video_device *video_dev)
> +{
> +       return container_of(video_dev, struct virtio_video_device,
> +                        video_dev);
> +}
> +
> +static inline struct virtio_video_stream *file2stream(struct file *file)
> +{
> +       return container_of(file->private_data, struct virtio_video_stream, fh);
> +}
> +
> +static inline struct virtio_video_stream *ctrl2stream(struct v4l2_ctrl *ctrl)
> +{
> +       return container_of(ctrl->handler, struct virtio_video_stream,
> +                           ctrl_handler);
> +}
> +
> +static inline struct virtio_video_stream *work2stream(struct work_struct *work)
> +{
> +       return container_of(work, struct virtio_video_stream, work);
> +}
> +
> +static inline struct virtio_video_buffer *to_virtio_vb(struct vb2_buffer *vb)
> +{
> +       struct vb2_v4l2_buffer *v4l2_vb = to_vb2_v4l2_buffer(vb);
> +
> +       return container_of(v4l2_vb, struct virtio_video_buffer,
> +                           v4l2_m2m_vb.vb);
> +}
> +
> +static inline uint32_t to_virtio_queue_type(enum v4l2_buf_type type)
> +{
> +       if (V4L2_TYPE_IS_OUTPUT(type))
> +               return VIRTIO_VIDEO_QUEUE_TYPE_INPUT;
> +       else
> +               return VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT;
> +}
> +
> +static inline bool within_range(uint32_t min, uint32_t val, uint32_t max)
> +{
> +       return ((val - min) <= (max - min));

This doesn't validate if (min <= val) holds. For example,
within_range(1, 0, 0) returns true.
How about changing this condition to ((min <= val) && (val <= max))?

> +}
> +
> +static inline bool needs_alignment(uint32_t val, uint32_t a)
> +{
> +       if (a == 0 || IS_ALIGNED(val, a))
> +               return false;
> +
> +       return true;
> +}
> +
> +int virtio_video_alloc_vbufs(struct virtio_video *vv);
> +void virtio_video_free_vbufs(struct virtio_video *vv);
> +int virtio_video_alloc_events(struct virtio_video *vv, size_t num);
> +
> +int virtio_video_device_init(struct virtio_video *vv, void *input_buf,
> +                            void *output_buf);
> +void virtio_video_device_deinit(struct virtio_video *vv);
> +
> +void virtio_video_stream_id_get(struct virtio_video *vv,
> +                               struct virtio_video_stream *stream,
> +                               uint32_t *id);
> +void virtio_video_stream_id_put(struct virtio_video *vv, uint32_t id);
> +void virtio_video_resource_id_get(struct virtio_video *vv, uint32_t *id);
> +void virtio_video_resource_id_put(struct virtio_video *vv, uint32_t id);
> +
> +int virtio_video_cmd_stream_create(struct virtio_video *vv, uint32_t stream_id,
> +                                  enum virtio_video_format format,
> +                                  const char *tag);
> +int virtio_video_cmd_stream_destroy(struct virtio_video *vv,
> +                                   uint32_t stream_id);
> +int virtio_video_cmd_stream_drain(struct virtio_video *vv, uint32_t stream_id);
> +int virtio_video_cmd_resource_create(struct virtio_video *vv,
> +                                    uint32_t stream_id, uint32_t resource_id,
> +                                    uint32_t queue_type,
> +                                    struct virtio_video_mem_entry *ents,
> +                                   unsigned int num_planes,
> +                                    unsigned int *num_entry);
> +int virtio_video_cmd_resource_destroy_all(struct virtio_video *vv,
> +                                         struct virtio_video_stream *stream,
> +                                         uint32_t queue_type);
> +int virtio_video_cmd_resource_queue(struct virtio_video *vv, uint32_t stream_id,
> +                                   struct virtio_video_buffer *virtio_vb,
> +                                   uint32_t data_size[], uint8_t num_data_size,
> +                                   uint32_t queue_type);
> +int virtio_video_cmd_queue_clear(struct virtio_video *vv,
> +                                struct virtio_video_stream *stream,
> +                                uint32_t queue_type);
> +int virtio_video_query_capability(struct virtio_video *vv, void *resp_buf,
> +                                 size_t resp_size, uint32_t queue_type);
> +int virtio_video_query_control_profile(struct virtio_video *vv, void *resp_buf,
> +                                      size_t resp_size, uint32_t format);
> +int virtio_video_query_control_level(struct virtio_video *vv, void *resp_buf,
> +                                    size_t resp_size, uint32_t format);
> +int virtio_video_cmd_set_params(struct virtio_video *vv,
> +                               struct virtio_video_stream *stream,
> +                               struct video_format_info *format_info,
> +                               uint32_t queue_type);
> +int virtio_video_cmd_get_params(struct virtio_video *vv,
> +                               struct virtio_video_stream *stream,
> +                               uint32_t queue_type);
> +int virtio_video_cmd_set_control(struct virtio_video *vv,
> +                                uint32_t stream_id,
> +                                uint32_t control, uint32_t val);
> +int virtio_video_cmd_get_control(struct virtio_video *vv,
> +                                struct virtio_video_stream *stream,
> +                                uint32_t ctrl);
> +
> +void virtio_video_queue_res_chg_event(struct virtio_video_stream *stream);
> +void virtio_video_queue_eos_event(struct virtio_video_stream *stream);
> +void virtio_video_cmd_ack(struct virtqueue *vq);
> +void virtio_video_event_ack(struct virtqueue *vq);
> +void virtio_video_dequeue_cmd_func(struct work_struct *work);
> +void virtio_video_dequeue_event_func(struct work_struct *work);
> +void virtio_video_buf_done(struct virtio_video_buffer *virtio_vb,
> +                          uint32_t flags, uint64_t timestamp, uint32_t size);
> +int virtio_video_buf_plane_init(uint32_t idx, uint32_t resource_id,
> +                               struct virtio_video_device *vvd,
> +                               struct virtio_video_stream *stream,
> +                               struct vb2_buffer *vb);
> +void virtio_video_mark_drain_complete(struct virtio_video_stream *stream,
> +                                     struct vb2_v4l2_buffer *v4l2_vb);
> +
> +int virtio_video_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
> +                            unsigned int *num_planes, unsigned int sizes[],
> +                            struct device *alloc_devs[]);
> +int virtio_video_buf_init(struct vb2_buffer *vb);
> +void virtio_video_buf_cleanup(struct vb2_buffer *vb);
> +int virtio_video_querycap(struct file *file, void *fh,
> +                         struct v4l2_capability *cap);
> +int virtio_video_enum_framesizes(struct file *file, void *fh,
> +                                struct v4l2_frmsizeenum *f);
> +int virtio_video_enum_framemintervals(struct file *file, void *fh,
> +                                     struct v4l2_frmivalenum *f);
> +int virtio_video_g_fmt(struct file *file, void *fh, struct v4l2_format *f);
> +int virtio_video_s_fmt(struct file *file, void *fh, struct v4l2_format *f);
> +int virtio_video_try_fmt(struct virtio_video_stream *stream,
> +                        struct v4l2_format *f);
> +int virtio_video_reqbufs(struct file *file, void *priv,
> +                        struct v4l2_requestbuffers *rb);
> +int virtio_video_subscribe_event(struct v4l2_fh *fh,
> +                                const struct v4l2_event_subscription *sub);
> +
> +void virtio_video_free_caps_list(struct list_head *caps_list);
> +int virtio_video_parse_virtio_capability(struct virtio_video_device *vvd,
> +                                         void *input_buf, void *output_buf);
> +void virtio_video_clean_capability(struct virtio_video_device *vvd);
> +int virtio_video_parse_virtio_control(struct virtio_video_device *vvd);
> +void virtio_video_clean_control(struct virtio_video_device *vvd);
> +
> +uint32_t virtio_video_format_to_v4l2(uint32_t format);
> +uint32_t virtio_video_control_to_v4l2(uint32_t control);
> +uint32_t virtio_video_profile_to_v4l2(uint32_t profile);
> +uint32_t virtio_video_level_to_v4l2(uint32_t level);
> +uint32_t virtio_video_v4l2_format_to_virtio(uint32_t v4l2_format);
> +uint32_t virtio_video_v4l2_control_to_virtio(uint32_t v4l2_control);
> +uint32_t virtio_video_v4l2_profile_to_virtio(uint32_t v4l2_profile);
> +uint32_t virtio_video_v4l2_level_to_virtio(uint32_t v4l2_level);
> +
> +struct video_format *find_video_format(struct list_head *fmts_list,
> +                                      uint32_t fourcc);

Add a prefix "virtio_video_" like other functions?

> +void virtio_video_format_from_info(struct video_format_info *info,
> +                                  struct v4l2_pix_format_mplane *pix_mp);
> +void virtio_video_format_fill_default_info(struct video_format_info *dst_info,
> +                                          struct video_format_info *src_info);
> +
> +int virtio_video_g_selection(struct file *file, void *fh,
> +                            struct v4l2_selection *sel);
> +int virtio_video_s_selection(struct file *file, void *fh,
> +                            struct v4l2_selection *sel);
> +
> +#endif /* _VIRTIO_VIDEO_H */
> diff --git a/drivers/media/virtio/virtio_video_caps.c b/drivers/media/virtio/virtio_video_caps.c
> new file mode 100644
> index 000000000000..2f9d4da92810
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_video_caps.c
> @@ -0,0 +1,498 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Driver for virtio video device.
> + *
> + * Copyright 2019 OpenSynergy GmbH.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-dma-sg.h>
> +
> +#include "virtio_video.h"
> +
> +static void virtio_video_free_frame_rates(struct video_format_frame *frame)
> +{
> +       if (!frame)
> +               return;
> +
> +       kfree(frame->frame_rates);
> +}
> +
> +static void virtio_video_free_frames(struct video_format *fmt)
> +{
> +       size_t idx = 0;
> +
> +       if (!fmt)
> +               return;
> +
> +       for (idx = 0; idx < fmt->desc.num_frames; idx++)
> +               virtio_video_free_frame_rates(&fmt->frames[idx]);
> +       kfree(fmt->frames);
> +}
> +
> +static void virtio_video_free_fmt(struct list_head *fmts_list)
> +{
> +       struct video_format *fmt = NULL;
> +       struct video_format *tmp = NULL;
> +
> +       list_for_each_entry_safe(fmt, tmp, fmts_list, formats_list_entry) {
> +               list_del(&fmt->formats_list_entry);
> +               virtio_video_free_frames(fmt);
> +               kfree(fmt);
> +       }
> +}
> +
> +static void virtio_video_free_fmts(struct virtio_video_device *vvd)
> +{
> +       virtio_video_free_fmt(&vvd->input_fmt_list);
> +       virtio_video_free_fmt(&vvd->output_fmt_list);
> +}
> +
> +static void assign_format_range(struct virtio_video_format_range *d_range,
> +                               struct virtio_video_format_range *s_range)

Add "virtio_video" prefix?

> +{
> +       d_range->min = le32_to_cpu(s_range->min);
> +       d_range->max = le32_to_cpu(s_range->max);
> +       d_range->step = le32_to_cpu(s_range->step);
> +}
> +
> +static size_t
> +virtio_video_parse_virtio_frame_rate(struct virtio_video_device *vvd,
> +                                    struct virtio_video_format_range *f_rate,
> +                                    void *buf)
> +{
> +       struct virtio_video_format_range *virtio_frame_rate = NULL;

Generally speaking, it's a good idea to avoid initializing a local
pointer with NULL at its declaration if it must be initialized below.
This is because compilers can raise an error when you forget the
actual initialization.

Though it's not problematic immediately, could you avoid this?
Actually, some parts of this patch don't do so.

> +       size_t frame_rate_size = sizeof(struct virtio_video_format_range);
> +
> +       if (!f_rate || !buf || !vvd)
> +               return 0;
> +
> +       virtio_frame_rate = buf;
> +       assign_format_range(f_rate, virtio_frame_rate);
> +       return frame_rate_size;
> +}
> +
> +static size_t virtio_video_parse_virtio_frame(struct virtio_video_device *vvd,
> +                                             struct video_format_frame *frm,
> +                                             void *buf)
> +{
> +       struct virtio_video *vv = NULL;
> +       struct virtio_video_format_frame *virtio_frame = NULL;
> +       struct virtio_video_format_frame *frame = &frm->frame;
> +       struct virtio_video_format_range *rate = NULL;
> +       size_t idx, offset = 0;
> +       size_t extra_size = 0;
> +
> +       if (!frame || !buf || !vvd)
> +               return 0;
> +
> +       vv = vvd->vv;
> +       virtio_frame = buf;
> +
> +       assign_format_range(&frame->width, &virtio_frame->width);
> +       assign_format_range(&frame->height, &virtio_frame->height);
> +
> +       frame->num_rates = le32_to_cpu(virtio_frame->num_rates);
> +       frm->frame_rates =  kcalloc(frame->num_rates,
> +                                   sizeof(struct virtio_video_format_range),
> +                                   GFP_KERNEL);
> +
> +       offset = sizeof(struct virtio_video_format_frame);
> +       for (idx = 0; idx < frame->num_rates; idx++) {
> +               rate = &frm->frame_rates[idx];
> +               extra_size =
> +                       virtio_video_parse_virtio_frame_rate(vvd, rate,
> +                                                            buf + offset);
> +               if (extra_size == 0) {
> +                       kfree(frm->frame_rates);
> +                       v4l2_err(&vv->v4l2_dev, "failed to parse frame rate\n");
> +                       return 0;
> +               }
> +               offset += extra_size;
> +       }
> +
> +       return offset;
> +}
> +
> +static size_t virtio_video_parse_virtio_fmt(struct virtio_video_device *vvd,
> +                                           struct video_format *fmt, void *buf)
> +{
> +       struct virtio_video *vv = NULL;
> +       struct virtio_video_format_desc *virtio_fmt_desc = NULL;
> +       struct virtio_video_format_desc *fmt_desc = NULL;
> +       struct video_format_frame *frame = NULL;
> +       size_t idx, offset = 0;
> +       size_t extra_size = 0;
> +
> +       if (!fmt || !buf || !vvd)
> +               return 0;
> +
> +       vv = vvd->vv;
> +       virtio_fmt_desc = buf;
> +       fmt_desc = &fmt->desc;
> +
> +       fmt_desc->format =
> +               virtio_video_format_to_v4l2
> +               (le32_to_cpu(virtio_fmt_desc->format));
> +       fmt_desc->mask = le64_to_cpu(virtio_fmt_desc->mask);
> +       fmt_desc->planes_layout = le32_to_cpu(virtio_fmt_desc->planes_layout);
> +
> +       fmt_desc->num_frames = le32_to_cpu(virtio_fmt_desc->num_frames);
> +       fmt->frames = kcalloc(fmt_desc->num_frames,
> +                             sizeof(struct video_format_frame),
> +                             GFP_KERNEL);
> +
> +       offset = sizeof(struct virtio_video_format_desc);
> +       for (idx = 0; idx < fmt_desc->num_frames; idx++) {
> +               frame = &fmt->frames[idx];
> +               extra_size =
> +                       virtio_video_parse_virtio_frame(vvd, frame,
> +                                                       buf + offset);
> +               if (extra_size == 0) {
> +                       kfree(fmt->frames);
> +                       v4l2_err(&vv->v4l2_dev, "failed to parse frame\n");
> +                       return 0;
> +               }
> +               offset += extra_size;
> +       }
> +
> +       return offset;
> +}
> +
> +int virtio_video_parse_virtio_capability(struct virtio_video_device *vvd,
> +                                           void *input_buf, void *output_buf)
> +{
> +       struct virtio_video *vv = NULL;
> +       struct virtio_video_query_capability_resp *input_resp = input_buf;
> +       struct virtio_video_query_capability_resp *output_resp = output_buf;
> +       int fmt_idx = 0;
> +       size_t offset = 0;
> +       struct video_format *fmt = NULL;
> +
> +       if (!input_buf || !output_buf || !vvd)
> +               return -1;

Instead of hard-coding -1, let's use -EINVAL.
Same comments for all other "return -1" in this patch.

> +
> +       vv = vvd->vv;
> +
> +       if (le32_to_cpu(input_resp->num_descs) <= 0 ||
> +           le32_to_cpu(output_resp->num_descs) <= 0) {
> +               v4l2_err(&vv->v4l2_dev, "invalid capability response\n");
> +               return -1;
> +       }
> +
> +       vvd->num_input_fmts = le32_to_cpu(input_resp->num_descs);
> +       offset = sizeof(struct virtio_video_query_capability_resp);
> +
> +       for (fmt_idx = 0; fmt_idx < vvd->num_input_fmts; fmt_idx++) {
> +               size_t fmt_size = 0;
> +
> +               fmt = kzalloc(sizeof(*fmt), GFP_KERNEL);
> +               if (!fmt) {
> +                       virtio_video_free_fmts(vvd);
> +                       return -1;
> +               }
> +
> +               fmt_size = virtio_video_parse_virtio_fmt(vvd, fmt,
> +                                                        input_buf + offset);
> +               if (fmt_size == 0) {
> +                       v4l2_err(&vv->v4l2_dev, "failed to parse input fmt\n");
> +                       virtio_video_free_fmts(vvd);
> +                       kfree(fmt);
> +                       return -1;

Instead of returning from here, please add an error label and goto
statements to centralize error handlings.
cf. https://www.kernel.org/doc/html/v5.4/process/coding-style.html#centralized-exiting-of-functions

> +               }
> +               offset += fmt_size;
> +               list_add(&fmt->formats_list_entry, &vvd->input_fmt_list);
> +       }
> +
> +       vvd->num_output_fmts = le32_to_cpu(output_resp->num_descs);
> +       offset = sizeof(struct virtio_video_query_capability_resp);
> +
> +       for (fmt_idx = 0; fmt_idx < vvd->num_output_fmts; fmt_idx++) {
> +               size_t fmt_size = 0;
> +
> +               fmt = kzalloc(sizeof(*fmt), GFP_KERNEL);
> +               if (!fmt) {
> +                       virtio_video_free_fmts(vvd);
> +                       return -1;
> +               }
> +
> +               fmt_size = virtio_video_parse_virtio_fmt(vvd, fmt,
> +                                                        output_buf + offset);
> +               if (fmt_size == 0) {
> +                       v4l2_err(&vv->v4l2_dev, "failed to parse output fmt\n");
> +                       virtio_video_free_fmts(vvd);
> +                       kfree(fmt);
> +                       return -1;
> +               }
> +               offset += fmt_size;
> +               list_add(&fmt->formats_list_entry, &vvd->output_fmt_list);
> +       }
> +       return 0;
> +}
> +
> +void virtio_video_clean_capability(struct virtio_video_device *vvd)
> +{
> +       if (!vvd)
> +               return;
> +       virtio_video_free_fmts(vvd);
> +}
> +
> +static void
> +virtio_video_free_control_fmt_data(struct video_control_fmt_data *data)
> +{
> +       if (!data)
> +               return;
> +
> +       kfree(data->entries);
> +       kfree(data);
> +}
> +
> +static void virtio_video_free_control_formats(struct virtio_video_device *vvd)
> +{
> +       struct video_control_format *c_fmt = NULL;
> +       struct video_control_format *tmp = NULL;
> +
> +       list_for_each_entry_safe(c_fmt, tmp, &vvd->controls_fmt_list,
> +                                controls_list_entry) {
> +               list_del(&c_fmt->controls_list_entry);
> +               virtio_video_free_control_fmt_data(c_fmt->profile);
> +               virtio_video_free_control_fmt_data(c_fmt->level);
> +               kfree(c_fmt);
> +       }
> +}
> +
> +static int virtio_video_parse_control_levels(struct virtio_video_device *vvd,
> +                                            struct video_control_format *fmt)
> +{
> +       int idx, ret = 0;
> +       struct virtio_video_query_control_resp *resp_buf = NULL;
> +       struct virtio_video_query_control_resp_level *l_resp_buf = NULL;
> +       struct virtio_video *vv = NULL;
> +       uint32_t virtio_format, num_levels, mask = 0;
> +       uint32_t *virtio_levels = NULL;
> +       struct video_control_fmt_data *level = NULL;
> +       int max = 0, min = UINT_MAX;
> +       size_t resp_size;
> +
> +       if (!vvd)
> +               return -EINVAL;
> +
> +       vv = vvd->vv;
> +       resp_size = vv->max_resp_len;
> +
> +       virtio_format = virtio_video_v4l2_format_to_virtio(fmt->format);
> +
> +       resp_buf = kzalloc(resp_size, GFP_KERNEL);
> +       if (IS_ERR(resp_buf)) {
> +               ret = PTR_ERR(resp_buf);
> +               goto err;
> +       }
> +
> +       vv->got_control = false;
> +       ret = virtio_video_query_control_level(vv, resp_buf, resp_size,
> +                                              virtio_format);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to query level\n");
> +               goto err;
> +       }
> +
> +       ret = wait_event_timeout(vv->wq, vv->got_control, 5 * HZ);
> +       if (ret == 0) {
> +               v4l2_err(&vv->v4l2_dev,
> +                        "timed out waiting for query level\n");
> +               ret = -EIO;
> +               goto err;
> +       }
> +
> +       ret = 0;
> +       l_resp_buf = (void *)((char *)resp_buf + sizeof(*resp_buf));
> +       num_levels = le32_to_cpu(l_resp_buf->num);
> +       if (num_levels == 0)
> +               goto err;
> +
> +       fmt->level = kzalloc(sizeof(*level), GFP_KERNEL);
> +       if (!fmt->level) {
> +               ret = -ENOMEM;
> +               goto err;
> +       }
> +
> +       level = fmt->level;
> +       level->entries = kcalloc(num_levels, sizeof(uint32_t), GFP_KERNEL);
> +       if (!level->entries) {
> +               ret = -ENOMEM;
> +               goto err;
> +       }
> +
> +       virtio_levels = (void *)((char *)l_resp_buf + sizeof(*l_resp_buf));
> +
> +       for (idx = 0; idx < num_levels; idx++) {
> +               level->entries[idx] =
> +                       virtio_video_level_to_v4l2
> +                       (le32_to_cpu(virtio_levels[idx]));
> +
> +               mask = mask | (1 << level->entries[idx]);
> +               if (level->entries[idx] > max)
> +                       max = level->entries[idx];
> +               if (level->entries[idx] < min)
> +                       min = level->entries[idx];
> +       }
> +       level->min = min;
> +       level->max = max;
> +       level->num = num_levels;
> +       level->skip_mask = ~mask;
> +err:

"err" is not a good name, as the following 'kfree' must be executed
even without an error.
How about renaming it to "out_free_buf" like the example here?

https://www.kernel.org/doc/html/v5.4/process/coding-style.html#centralized-exiting-of-functions

> +       kfree(resp_buf);
> +       return ret;
> +}
> +
> +static int virtio_video_parse_control_profiles(struct virtio_video_device *vvd,
> +                                              struct video_control_format *fmt)
> +{
> +       int idx, ret = 0;
> +       struct virtio_video_query_control_resp *resp_buf = NULL;
> +       struct virtio_video_query_control_resp_profile *p_resp_buf = NULL;
> +       struct virtio_video *vv = NULL;
> +       uint32_t virtio_format, num_profiles, mask = 0;
> +       uint32_t *virtio_profiles = NULL;
> +       struct video_control_fmt_data *profile = NULL;
> +       int max = 0, min = UINT_MAX;
> +       size_t resp_size;
> +
> +       if (!vvd)
> +               return -EINVAL;
> +
> +       vv = vvd->vv;
> +       resp_size = vv->max_resp_len;
> +       virtio_format = virtio_video_v4l2_format_to_virtio(fmt->format);
> +       resp_buf = kzalloc(resp_size, GFP_KERNEL);
> +       if (IS_ERR(resp_buf)) {
> +               ret = PTR_ERR(resp_buf);
> +               goto err;
> +       }
> +
> +       vv->got_control = false;
> +       ret = virtio_video_query_control_profile(vv, resp_buf, resp_size,
> +                                                virtio_format);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to query profile\n");
> +               goto err;
> +       }
> +
> +       ret = wait_event_timeout(vv->wq, vv->got_control, 5 * HZ);
> +       if (ret == 0) {
> +               v4l2_err(&vv->v4l2_dev,
> +                        "timed out waiting for query profile\n");
> +               ret = -EIO;
> +               goto err;
> +       }
> +
> +       ret = 0;
> +       p_resp_buf = (void *)((char *)resp_buf + sizeof(*resp_buf));
> +       num_profiles = le32_to_cpu(p_resp_buf->num);
> +       if (num_profiles == 0)
> +               goto err;
> +
> +       fmt->profile = kzalloc(sizeof(*profile), GFP_KERNEL);
> +       if (!fmt->profile) {
> +               ret = -ENOMEM;
> +               goto err;
> +       }
> +
> +       profile = fmt->profile;
> +       profile->entries = kcalloc(num_profiles, sizeof(uint32_t), GFP_KERNEL);
> +       if (!profile->entries) {
> +               ret = -ENOMEM;
> +               goto err;
> +       }
> +
> +       virtio_profiles = (void *)((char *)p_resp_buf + sizeof(*p_resp_buf));
> +
> +       for (idx = 0; idx < num_profiles; idx++) {
> +               profile->entries[idx] =
> +                       virtio_video_profile_to_v4l2
> +                       (le32_to_cpu(virtio_profiles[idx]));
> +
> +               mask = mask | (1 << profile->entries[idx]);
> +               if (profile->entries[idx] > max)
> +                       max = profile->entries[idx];
> +               if (profile->entries[idx] < min)
> +                       min = profile->entries[idx];
> +       }
> +       profile->min = min;
> +       profile->max = max;
> +       profile->num = num_profiles;
> +       profile->skip_mask = ~mask;
> +err:

same

> +       kfree(resp_buf);
> +       return ret;
> +}
> +
> +int virtio_video_parse_virtio_control(struct virtio_video_device *vvd)
> +{
> +       struct video_format *fmt = NULL;
> +       struct video_control_format *c_fmt = NULL;
> +       struct virtio_video *vv = NULL;
> +       uint32_t virtio_format;
> +       int ret = 0;
> +
> +       if (!vvd)
> +               return -EINVAL;
> +
> +       vv = vvd->vv;
> +
> +       list_for_each_entry(fmt, &vvd->output_fmt_list, formats_list_entry) {
> +               virtio_format =
> +                       virtio_video_v4l2_format_to_virtio(fmt->desc.format);
> +               if (virtio_format < VIRTIO_VIDEO_FORMAT_CODED_MIN ||
> +                   virtio_format > VIRTIO_VIDEO_FORMAT_CODED_MAX)
> +                       continue;
> +
> +               c_fmt = kzalloc(sizeof(*c_fmt), GFP_KERNEL);
> +               if (!c_fmt) {
> +                       virtio_video_free_control_formats(vvd);
> +                       return -1;
> +               }
> +
> +               c_fmt->format = fmt->desc.format;
> +               ret = virtio_video_parse_control_profiles(vvd, c_fmt);
> +               if (ret) {
> +                       virtio_video_free_control_formats(vvd);
> +                       kfree(c_fmt);

These 'free' functions should be called under "err" label.

> +                       v4l2_err(&vv->v4l2_dev,
> +                                "failed to parse control profile\n");
> +                       goto err;
> +               }
> +               ret = virtio_video_parse_control_levels(vvd, c_fmt);
> +               if (ret) {
> +                       virtio_video_free_control_formats(vvd);
> +                       kfree(c_fmt);
> +                       v4l2_err(&vv->v4l2_dev,
> +                                "failed to parse control level\n");
> +                       goto err;
> +               }
> +               list_add(&c_fmt->controls_list_entry, &vvd->controls_fmt_list);
> +       }
> +       return 0;
> +err:
> +       return ret;
> +}
> +
> +void virtio_video_clean_control(struct virtio_video_device *vvd)
> +{
> +       if (!vvd)
> +               return;
> +
> +       virtio_video_free_control_formats(vvd);
> +}
> diff --git a/drivers/media/virtio/virtio_video_dec.c b/drivers/media/virtio/virtio_video_dec.c
> new file mode 100644
> index 000000000000..fc805933fc5e
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_video_dec.c
> @@ -0,0 +1,427 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Decoder for virtio video device.
> + *
> + * Copyright 2019 OpenSynergy GmbH.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +
> +#include "virtio_video.h"
> +
> +static void virtio_video_dec_buf_queue(struct vb2_buffer *vb)
> +{
> +       int i, ret;
> +       struct vb2_buffer *src_buf;
> +       struct vb2_v4l2_buffer *src_vb;
> +       struct virtio_video_buffer *virtio_vb;
> +       uint32_t data_size[VB2_MAX_PLANES] = {0};
> +       struct vb2_v4l2_buffer *v4l2_vb = to_vb2_v4l2_buffer(vb);
> +       struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct virtio_video *vv = vvd->vv;
> +
> +       v4l2_m2m_buf_queue(stream->fh.m2m_ctx, v4l2_vb);
> +
> +       if ((stream->state != STREAM_STATE_INIT) ||
> +           !V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
> +               return;
> +
> +       src_vb = v4l2_m2m_next_src_buf(stream->fh.m2m_ctx);
> +       if (!src_vb) {
> +               v4l2_err(&vv->v4l2_dev, "no src buf during initialization\n");
> +               return;
> +       }
> +
> +       src_buf = &src_vb->vb2_buf;
> +       for (i = 0; i < src_buf->num_planes; ++i)
> +               data_size[i] = src_buf->planes[i].bytesused;
> +
> +       virtio_vb = to_virtio_vb(src_buf);
> +
> +       ret = virtio_video_cmd_resource_queue(vv, stream->stream_id,
> +                                             virtio_vb, data_size,
> +                                             src_buf->num_planes,
> +                                             VIRTIO_VIDEO_QUEUE_TYPE_INPUT);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to queue an src buffer\n");
> +               return;
> +       }
> +
> +       virtio_vb->queued = true;
> +       stream->src_cleared = false;
> +       src_vb = v4l2_m2m_src_buf_remove(stream->fh.m2m_ctx);
> +}
> +
> +static int virtio_video_dec_start_streaming(struct vb2_queue *vq,
> +                                           unsigned int count)
> +{
> +       struct virtio_video_stream *stream = vb2_get_drv_priv(vq);
> +
> +       if (!V4L2_TYPE_IS_OUTPUT(vq->type) &&
> +           stream->state >= STREAM_STATE_INIT)
> +               stream->state = STREAM_STATE_RUNNING;
> +
> +       return 0;
> +}
> +
> +static void virtio_video_dec_stop_streaming(struct vb2_queue *vq)
> +{
> +       int ret, queue_type;
> +       bool *cleared;
> +       bool is_v4l2_output = V4L2_TYPE_IS_OUTPUT(vq->type);
> +       struct virtio_video_stream *stream = vb2_get_drv_priv(vq);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct virtio_video *vv = vvd->vv;
> +       struct vb2_v4l2_buffer *v4l2_vb;
> +
> +       if (is_v4l2_output) {
> +               cleared = &stream->src_cleared;
> +               queue_type = VIRTIO_VIDEO_QUEUE_TYPE_INPUT;
> +       } else {
> +               cleared = &stream->dst_cleared;
> +               queue_type = VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT;
> +       }
> +
> +       ret = virtio_video_cmd_queue_clear(vv, stream, queue_type);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to clear queue\n");
> +               return;
> +       }
> +
> +       ret = wait_event_timeout(vv->wq, *cleared, 5 * HZ);
> +       if (ret == 0) {
> +               v4l2_err(&vv->v4l2_dev, "timed out waiting for queue clear\n");
> +               return;
> +       }
> +
> +       for (;;) {
> +               if (is_v4l2_output)
> +                       v4l2_vb = v4l2_m2m_src_buf_remove(stream->fh.m2m_ctx);
> +               else
> +                       v4l2_vb = v4l2_m2m_dst_buf_remove(stream->fh.m2m_ctx);
> +               if (!v4l2_vb)
> +                       break;
> +               v4l2_m2m_buf_done(v4l2_vb, VB2_BUF_STATE_ERROR);
> +       }
> +}
> +
> +static const struct vb2_ops virtio_video_dec_qops = {
> +       .queue_setup     = virtio_video_queue_setup,
> +       .buf_init        = virtio_video_buf_init,
> +       .buf_cleanup     = virtio_video_buf_cleanup,
> +       .buf_queue       = virtio_video_dec_buf_queue,
> +       .start_streaming = virtio_video_dec_start_streaming,
> +       .stop_streaming  = virtio_video_dec_stop_streaming,
> +       .wait_prepare    = vb2_ops_wait_prepare,
> +       .wait_finish     = vb2_ops_wait_finish,
> +};
> +
> +static int virtio_video_dec_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       int ret = 0;
> +       struct virtio_video_stream *stream = ctrl2stream(ctrl);
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
> +               if (stream->state >= STREAM_STATE_METADATA)
> +                       ctrl->val = stream->out_info.min_buffers;
> +               else
> +                       ctrl->val = 0;
> +               break;
> +       default:
> +               ret = -EINVAL;
> +       }
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops virtio_video_dec_ctrl_ops = {
> +       .g_volatile_ctrl        = virtio_video_dec_g_volatile_ctrl,
> +};
> +
> +int virtio_video_dec_init_ctrls(struct virtio_video_stream *stream)
> +{
> +       struct v4l2_ctrl *ctrl;
> +
> +       v4l2_ctrl_handler_init(&stream->ctrl_handler, 1);
> +
> +       ctrl = v4l2_ctrl_new_std(&stream->ctrl_handler,
> +                               &virtio_video_dec_ctrl_ops,
> +                               V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
> +                               MIN_BUFS_MIN, MIN_BUFS_MAX, MIN_BUFS_STEP,
> +                               MIN_BUFS_DEF);
> +       ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;

Need to check if ctrl is non-NULL.

> +
> +       if (stream->ctrl_handler.error)
> +               return stream->ctrl_handler.error;
> +
> +       v4l2_ctrl_handler_setup(&stream->ctrl_handler);
> +
> +       return 0;
> +}
> +
> +int virtio_video_dec_init_queues(void *priv, struct vb2_queue *src_vq,
> +                                struct vb2_queue *dst_vq)
> +{
> +       int ret;
> +       struct virtio_video_stream *stream = priv;
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct virtio_video *vv = vvd->vv;
> +       struct device *dev = vv->v4l2_dev.dev;
> +
> +       src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +       src_vq->drv_priv = stream;
> +       src_vq->buf_struct_size = sizeof(struct virtio_video_buffer);
> +       src_vq->ops = &virtio_video_dec_qops;
> +       src_vq->mem_ops = virtio_video_mem_ops(vv);
> +       src_vq->min_buffers_needed = stream->in_info.min_buffers;
> +       src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +       src_vq->lock = &stream->vq_mutex;
> +       src_vq->gfp_flags = virtio_video_gfp_flags(vv);
> +       src_vq->dev = dev;
> +
> +       ret = vb2_queue_init(src_vq);
> +       if (ret)
> +               return ret;
> +
> +       dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +       dst_vq->drv_priv = stream;
> +       dst_vq->buf_struct_size = sizeof(struct virtio_video_buffer);
> +       dst_vq->ops = &virtio_video_dec_qops;
> +       dst_vq->mem_ops = virtio_video_mem_ops(vv);
> +       dst_vq->min_buffers_needed = stream->out_info.min_buffers;
> +       dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +       dst_vq->lock = &stream->vq_mutex;
> +       dst_vq->gfp_flags = virtio_video_gfp_flags(vv);
> +       dst_vq->dev = dev;
> +
> +       return vb2_queue_init(dst_vq);
> +}
> +
> +static int virtio_video_try_decoder_cmd(struct file *file, void *fh,
> +                                       struct v4l2_decoder_cmd *cmd)
> +{
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = video_drvdata(file);
> +       struct virtio_video *vv = vvd->vv;
> +
> +       if (stream->state == STREAM_STATE_DRAIN)
> +               return -EBUSY;
> +
> +       switch (cmd->cmd) {
> +       case V4L2_DEC_CMD_STOP:
> +       case V4L2_DEC_CMD_START:
> +               if (cmd->flags != 0) {
> +                       v4l2_err(&vv->v4l2_dev, "flags=%u are not supported",
> +                                cmd->flags);
> +                       return -EINVAL;
> +               }
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int virtio_video_decoder_cmd(struct file *file, void *fh,
> +                                   struct v4l2_decoder_cmd *cmd)
> +{
> +       int ret;
> +       struct vb2_queue *src_vq, *dst_vq;
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = video_drvdata(file);
> +       struct virtio_video *vv = vvd->vv;
> +
> +       ret = virtio_video_try_decoder_cmd(file, fh, cmd);
> +       if (ret < 0)
> +               return ret;
> +
> +       dst_vq = v4l2_m2m_get_vq(stream->fh.m2m_ctx,
> +                                V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +
> +       switch (cmd->cmd) {
> +       case V4L2_DEC_CMD_START:
> +               vb2_clear_last_buffer_dequeued(dst_vq);
> +               break;
> +       case V4L2_DEC_CMD_STOP:
> +               src_vq = v4l2_m2m_get_vq(stream->fh.m2m_ctx,
> +                                        V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +
> +               if (!vb2_is_streaming(src_vq)) {
> +                       v4l2_dbg(1, vv->debug,
> +                                &vv->v4l2_dev, "output is not streaming\n");
> +                       return 0;
> +               }
> +
> +               if (!vb2_is_streaming(dst_vq)) {
> +                       v4l2_dbg(1, vv->debug,
> +                                &vv->v4l2_dev, "capture is not streaming\n");
> +                       return 0;
> +               }
> +
> +               ret = virtio_video_cmd_stream_drain(vv, stream->stream_id);
> +               if (ret) {
> +                       v4l2_err(&vv->v4l2_dev, "failed to drain stream\n");
> +                       return ret;
> +               }
> +
> +               stream->state = STREAM_STATE_DRAIN;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int virtio_video_dec_enum_fmt_vid_cap(struct file *file, void *fh,
> +                                            struct v4l2_fmtdesc *f)
> +{
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct video_format_info *info = NULL;
> +       struct video_format *fmt = NULL;
> +       unsigned long input_mask = 0;
> +       int idx = 0, bit_num = 0;
> +
> +       if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +               return -EINVAL;
> +
> +       if (f->index >= vvd->num_output_fmts)
> +               return -EINVAL;
> +
> +       info = &stream->in_info;
> +       list_for_each_entry(fmt, &vvd->input_fmt_list, formats_list_entry) {
> +               if (info->fourcc_format == fmt->desc.format) {
> +                       input_mask = fmt->desc.mask;
> +                       break;
> +               }
> +       }
> +
> +       if (input_mask == 0)
> +               return -EINVAL;
> +
> +       list_for_each_entry(fmt, &vvd->output_fmt_list, formats_list_entry) {
> +               if (test_bit(bit_num, &input_mask)) {
> +                       if (f->index == idx) {
> +                               f->pixelformat = fmt->desc.format;
> +                               return 0;
> +                       }
> +                       idx++;
> +               }
> +               bit_num++;
> +       }
> +       return -EINVAL;
> +}
> +
> +
> +int virtio_video_dec_enum_fmt_vid_out(struct file *file, void *fh,
> +                                     struct v4l2_fmtdesc *f)
> +{
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct video_format *fmt = NULL;
> +       int idx = 0;
> +
> +       if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +               return -EINVAL;
> +
> +       if (f->index >= vvd->num_input_fmts)
> +               return -EINVAL;
> +
> +       list_for_each_entry(fmt, &vvd->input_fmt_list, formats_list_entry) {
> +               if (f->index == idx) {
> +                       f->pixelformat = fmt->desc.format;
> +                       return 0;
> +               }
> +               idx++;
> +       }
> +       return -EINVAL;
> +}
> +
> +static int virtio_video_dec_s_fmt(struct file *file, void *fh,
> +                                 struct v4l2_format *f)
> +{
> +       int ret;
> +       struct virtio_video_stream *stream = file2stream(file);
> +
> +       ret = virtio_video_s_fmt(file, fh, f);
> +       if (ret)
> +               return ret;
> +
> +       if (V4L2_TYPE_IS_OUTPUT(f->type)) {
> +               if (stream->state == STREAM_STATE_IDLE)
> +                       stream->state = STREAM_STATE_INIT;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops virtio_video_dec_ioctl_ops = {
> +       .vidioc_querycap        = virtio_video_querycap,
> +
> +       .vidioc_enum_fmt_vid_cap = virtio_video_dec_enum_fmt_vid_cap,
> +       .vidioc_g_fmt_vid_cap   = virtio_video_g_fmt,
> +       .vidioc_s_fmt_vid_cap   = virtio_video_dec_s_fmt,
> +
> +       .vidioc_enum_fmt_vid_cap_mplane = virtio_video_dec_enum_fmt_vid_cap,
> +       .vidioc_g_fmt_vid_cap_mplane    = virtio_video_g_fmt,
> +       .vidioc_s_fmt_vid_cap_mplane    = virtio_video_dec_s_fmt,
> +
> +       .vidioc_enum_fmt_vid_out = virtio_video_dec_enum_fmt_vid_out,
> +       .vidioc_g_fmt_vid_out   = virtio_video_g_fmt,
> +       .vidioc_s_fmt_vid_out   = virtio_video_dec_s_fmt,
> +
> +       .vidioc_enum_fmt_vid_out_mplane = virtio_video_dec_enum_fmt_vid_out,
> +       .vidioc_g_fmt_vid_out_mplane    = virtio_video_g_fmt,
> +       .vidioc_s_fmt_vid_out_mplane    = virtio_video_dec_s_fmt,
> +
> +       .vidioc_g_selection = virtio_video_g_selection,
> +       .vidioc_s_selection = virtio_video_s_selection,
> +
> +       .vidioc_try_decoder_cmd = virtio_video_try_decoder_cmd,
> +       .vidioc_decoder_cmd     = virtio_video_decoder_cmd,
> +       .vidioc_enum_frameintervals = virtio_video_enum_framemintervals,
> +       .vidioc_enum_framesizes = virtio_video_enum_framesizes,
> +
> +       .vidioc_reqbufs         = virtio_video_reqbufs,
> +       .vidioc_querybuf        = v4l2_m2m_ioctl_querybuf,
> +       .vidioc_qbuf            = v4l2_m2m_ioctl_qbuf,
> +       .vidioc_dqbuf           = v4l2_m2m_ioctl_dqbuf,
> +       .vidioc_prepare_buf     = v4l2_m2m_ioctl_prepare_buf,
> +       .vidioc_create_bufs     = v4l2_m2m_ioctl_create_bufs,
> +       .vidioc_expbuf          = v4l2_m2m_ioctl_expbuf,
> +
> +       .vidioc_streamon        = v4l2_m2m_ioctl_streamon,
> +       .vidioc_streamoff       = v4l2_m2m_ioctl_streamoff,
> +
> +       .vidioc_subscribe_event = virtio_video_subscribe_event,
> +       .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +int virtio_video_dec_init(struct video_device *vd)
> +{
> +       ssize_t num;
> +
> +       vd->ioctl_ops = &virtio_video_dec_ioctl_ops;
> +       num = strscpy(vd->name, "stateful-decoder", sizeof(vd->name));

Don't we want to check the value of "num"?
Also, how about having a word "virtio" in the name of the driver?

> +
> +       return 0;
> +}
> diff --git a/drivers/media/virtio/virtio_video_dec.h b/drivers/media/virtio/virtio_video_dec.h
> new file mode 100644
> index 000000000000..0a1252248bbf
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_video_dec.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/* Decoder header for virtio video driver.
> + *
> + * Copyright 2019 OpenSynergy GmbH.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef _VIRTIO_VIDEO_DEC_H
> +#define _VIRTIO_VIDEO_DEC_H
> +
> +#include "virtio_video.h"
> +
> +int virtio_video_dec_init(struct video_device *vd);
> +int virtio_video_dec_init_ctrls(struct virtio_video_stream *stream);
> +int virtio_video_dec_init_queues(void *priv, struct vb2_queue *src_vq,
> +                                struct vb2_queue *dst_vq);
> +
> +#endif /* _VIRTIO_VIDEO_DEC_H */
> diff --git a/drivers/media/virtio/virtio_video_device.c b/drivers/media/virtio/virtio_video_device.c
> new file mode 100644
> index 000000000000..130e705580d1
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_video_device.c
> @@ -0,0 +1,1079 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Driver for virtio video device.
> + *
> + * Copyright 2019 OpenSynergy GmbH.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-dma-sg.h>
> +
> +#include "virtio_video.h"
> +#include "virtio_video_dec.h"
> +#include "virtio_video_enc.h"
> +
> +int virtio_video_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
> +                            unsigned int *num_planes, unsigned int sizes[],
> +                            struct device *alloc_devs[])
> +{
> +       int i;
> +       struct virtio_video_stream *stream = vb2_get_drv_priv(vq);
> +       struct video_format_info *p_info;
> +
> +       if (*num_planes)
> +               return 0;
> +
> +       if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +               p_info = &stream->in_info;
> +       else
> +               p_info = &stream->out_info;
> +
> +       *num_planes = p_info->num_planes;
> +
> +       for (i = 0; i < p_info->num_planes; i++)
> +               sizes[i] = p_info->plane_format[i].plane_size;
> +
> +       return 0;
> +}
> +
> +int virtio_video_buf_init(struct vb2_buffer *vb)
> +{
> +       int ret = 0;
> +       unsigned int i, j;
> +       struct scatterlist *sg;
> +       struct virtio_video_mem_entry *ents;
> +       uint32_t num_ents[VIRTIO_VIDEO_MAX_PLANES];
> +       struct sg_table *sgt[VIRTIO_VIDEO_MAX_PLANES];
> +       uint32_t resource_id, nents = 0;
> +       struct vb2_queue *vq = vb->vb2_queue;
> +       enum v4l2_buf_type queue_type = vq->type;
> +       struct virtio_video_stream *stream = vb2_get_drv_priv(vq);
> +       struct virtio_video_buffer *virtio_vb = to_virtio_vb(vb);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct virtio_video *vv = vvd->vv;
> +
> +       virtio_video_resource_id_get(vv, &resource_id);
> +
> +       if (vv->supp_non_contig) {
> +               for (i = 0; i < vb->num_planes; i++) {
> +                       sgt[i] = vb2_dma_sg_plane_desc(vb, i);
> +                       nents += sgt[i]->nents;
> +               }
> +
> +               ents = kcalloc(nents, sizeof(*ents), GFP_KERNEL);
> +               if (!ents)
> +                       return -ENOMEM;
> +
> +               for (i = 0; i < vb->num_planes; ++i) {
> +                       for_each_sg(sgt[i]->sgl, sg, sgt[i]->nents, j) {
> +                               ents[j].addr = cpu_to_le64(vv->has_iommu
> +                                                          ? sg_dma_address(sg)
> +                                                          : sg_phys(sg));
> +                               ents[j].length = cpu_to_le32(sg->length);
> +                       }
> +                       num_ents[i] = sgt[i]->nents;
> +               }
> +       } else {
> +               nents = vb->num_planes;
> +
> +               ents = kcalloc(nents, sizeof(*ents), GFP_KERNEL);
> +               if (!ents)
> +                       return -ENOMEM;
> +
> +               for (i = 0; i < vb->num_planes; ++i) {
> +                       ents[i].addr =
> +                               cpu_to_le64(vb2_dma_contig_plane_dma_addr(vb,
> +                                                                         i));
> +                       ents[i].length = cpu_to_le32(vb->planes[i].length);
> +                       num_ents[i] = 1;
> +               }
> +       }
> +
> +       v4l2_dbg(1, vv->debug, &vv->v4l2_dev, "mem entries:\n");
> +       if (vv->debug >= 1) {
> +               for (i = 0; i < nents; i++)
> +                       pr_debug("\t%03i: addr=%llx length=%u\n", i,
> +                                       ents[i].addr, ents[i].length);
> +       }
> +
> +       ret = virtio_video_cmd_resource_create(vv, stream->stream_id,
> +                                              resource_id,
> +                                              to_virtio_queue_type(queue_type),
> +                                              ents, vb->num_planes,
> +                                              num_ents);
> +       if (ret) {
> +               virtio_video_resource_id_put(vvd->vv, resource_id);
> +               kfree(ents);
> +
> +               return ret;
> +       }
> +
> +       virtio_vb->queued = false;
> +       virtio_vb->resource_id = resource_id;
> +
> +       return 0;
> +}
> +
> +void virtio_video_buf_cleanup(struct vb2_buffer *vb)
> +{
> +       struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
> +       struct virtio_video_buffer *virtio_vb = to_virtio_vb(vb);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct virtio_video *vv = vvd->vv;
> +
> +       virtio_video_resource_id_put(vv, virtio_vb->resource_id);
> +}
> +
> +int virtio_video_querycap(struct file *file, void *fh,
> +                         struct v4l2_capability *cap)
> +{
> +       struct video_device *video_dev = video_devdata(file);
> +
> +       strncpy(cap->driver, DRIVER_NAME, sizeof(cap->driver));
> +       strncpy(cap->card, video_dev->name, sizeof(cap->card));
> +       snprintf(cap->bus_info, sizeof(cap->bus_info), "virtio:%s",
> +                video_dev->name);

v4l2-compliance test raises an error on this prefix "virtio:".
We have two options:
1. Move the driver code to /platform/ and use a prefix "platform:"
like other virtual drivers such as vivid and vicodec.
2. Modify v4l2-compliance test.

I'm not sure which is better, though.

> +
> +       cap->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> +       cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
> +
> +       return 0;
> +}
> +
> +int virtio_video_enum_framesizes(struct file *file, void *fh,
> +                                struct v4l2_frmsizeenum *f)
> +{
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct video_format *fmt = NULL;
> +       struct video_format_frame *frm = NULL;
> +       struct virtio_video_format_frame *frame = NULL;
> +       int idx = f->index;
> +
> +       fmt = find_video_format(&vvd->input_fmt_list, f->pixel_format);
> +       if (fmt == NULL)
> +               fmt = find_video_format(&vvd->output_fmt_list, f->pixel_format);
> +       if (fmt == NULL)
> +               return -EINVAL;
> +
> +       if (idx >= fmt->desc.num_frames)
> +               return -EINVAL;
> +
> +       frm = &fmt->frames[idx];
> +       frame = &frm->frame;
> +
> +       if (frame->width.min == frame->width.max &&
> +           frame->height.min == frame->height.max) {
> +               f->type = V4L2_FRMSIZE_TYPE_DISCRETE;
> +               f->discrete.width = frame->width.min;
> +               f->discrete.height = frame->height.min;
> +               return 0;
> +       }
> +
> +       f->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
> +       f->stepwise.min_width = frame->width.min;
> +       f->stepwise.max_width = frame->width.max;
> +       f->stepwise.min_height = frame->height.min;
> +       f->stepwise.max_height = frame->height.max;
> +       f->stepwise.step_width = frame->width.step;
> +       f->stepwise.step_height = frame->height.step;
> +       return 0;
> +}
> +
> +static bool in_stepped_interval(uint32_t int_start, uint32_t int_end,
> +                               uint32_t step, uint32_t point)

How about changing the interface like this?

static bool in_stepped_interval(const struct
virtio_video_format_range* range, uint32_t point)

> +{
> +       if (point < int_start || point > int_end)

You can use within_range.

> +               return false;
> +
> +       if (step == 0 && int_start == int_end && int_start == point)
> +               return true;
> +
> +       if (step != 0 && (point - int_start) % step == 0)
> +               return true;
> +
> +       return false;
> +}
> +
> +int virtio_video_enum_framemintervals(struct file *file, void *fh,
> +                                     struct v4l2_frmivalenum *f)
> +{
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct video_format *fmt = NULL;
> +       struct video_format_frame *frm = NULL;
> +       struct virtio_video_format_frame *frame = NULL;
> +       struct virtio_video_format_range *frate = NULL;
> +       int idx = f->index;
> +       int f_idx = 0;
> +
> +       fmt = find_video_format(&vvd->input_fmt_list, f->pixel_format);
> +       if (fmt == NULL)
> +               fmt = find_video_format(&vvd->output_fmt_list, f->pixel_format);
> +       if (fmt == NULL)
> +               return -EINVAL;
> +
> +       for (f_idx = 0; f_idx <= fmt->desc.num_frames; f_idx++) {
> +               frm = &fmt->frames[f_idx];
> +               frame = &frm->frame;
> +               if (in_stepped_interval(frame->width.min, frame->width.max,
> +                                       frame->width.step, f->width) &&
> +                  in_stepped_interval(frame->height.min, frame->height.max,
> +                                       frame->height.step, f->height))
> +                       break;
> +       }
> +
> +       if (frame == NULL || f->index >= frame->num_rates)
> +               return -EINVAL;
> +
> +       frate = &frm->frame_rates[idx];
> +       if (frate->max == frate->min) {
> +               f->type = V4L2_FRMIVAL_TYPE_DISCRETE;
> +               f->discrete.numerator = 1;
> +               f->discrete.denominator = frate->max;
> +       } else {
> +               f->stepwise.min.numerator = 1;
> +               f->stepwise.min.denominator = frate->max;
> +               f->stepwise.max.numerator = 1;
> +               f->stepwise.max.denominator = frate->min;
> +               f->stepwise.step.numerator = 1;
> +               f->stepwise.step.denominator = frate->step;
> +               if (frate->step == 1)
> +                       f->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
> +               else
> +                       f->type = V4L2_FRMIVAL_TYPE_STEPWISE;
> +       }
> +       return 0;
> +}
> +
> +
> +int virtio_video_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
> +{
> +       struct video_format_info *info;
> +       struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +       struct virtio_video_stream *stream = file2stream(file);
> +
> +       if (!V4L2_TYPE_IS_OUTPUT(f->type))
> +               info = &stream->out_info;
> +       else
> +               info = &stream->in_info;
> +
> +       virtio_video_format_from_info(info, pix_mp);
> +
> +       return 0;
> +}
> +
> +int virtio_video_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
> +{
> +       int i, ret;
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct virtio_video *vv = vvd->vv;
> +       struct video_format_info info;
> +       struct video_format_info *p_info;
> +       uint32_t queue;
> +
> +       ret = virtio_video_try_fmt(stream, f);
> +       if (ret)
> +               return ret;
> +
> +       if (V4L2_TYPE_IS_OUTPUT(f->type)) {
> +               virtio_video_format_fill_default_info(&info, &stream->in_info);
> +               queue = VIRTIO_VIDEO_QUEUE_TYPE_INPUT;
> +       } else {
> +               virtio_video_format_fill_default_info(&info, &stream->out_info);
> +               queue = VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT;
> +       }
> +
> +       info.frame_width = pix_mp->width;
> +       info.frame_height = pix_mp->height;
> +       info.num_planes = pix_mp->num_planes;
> +       info.fourcc_format = pix_mp->pixelformat;
> +
> +       for (i = 0; i < info.num_planes; i++) {
> +               info.plane_format[i].stride =
> +                                        pix_mp->plane_fmt[i].bytesperline;
> +               info.plane_format[i].plane_size =
> +                                        pix_mp->plane_fmt[i].sizeimage;
> +       }
> +
> +       virtio_video_cmd_set_params(vv, stream, &info, queue);
> +       virtio_video_cmd_get_params(vv, stream, VIRTIO_VIDEO_QUEUE_TYPE_INPUT);
> +       virtio_video_cmd_get_params(vv, stream, VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
> +
> +       if (V4L2_TYPE_IS_OUTPUT(f->type))
> +               p_info = &stream->in_info;
> +       else
> +               p_info = &stream->out_info;
> +
> +       virtio_video_format_from_info(p_info, pix_mp);
> +
> +       return 0;
> +}
> +
> +int virtio_video_g_selection(struct file *file, void *fh,
> +                        struct v4l2_selection *sel)
> +{
> +       struct video_format_info *info = NULL;
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = video_drvdata(file);
> +
> +       switch (vvd->type) {
> +       case VIRTIO_VIDEO_DEVICE_ENCODER:
> +               if (!V4L2_TYPE_IS_OUTPUT(sel->type))
> +                       return -EINVAL;
> +               info = &stream->in_info;
> +               break;
> +       case VIRTIO_VIDEO_DEVICE_DECODER:
> +               if (V4L2_TYPE_IS_OUTPUT(sel->type))
> +                       return -EINVAL;
> +               info = &stream->out_info;
> +               break;
> +       default:
> +               v4l2_err(&vvd->vv->v4l2_dev, "unsupported device type\n");
> +               return -EINVAL;
> +       }
> +
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> +       case V4L2_SEL_TGT_COMPOSE_PADDED:

Can't we support V4L2_SEL_TGT_COMPOSE as well?

> +               sel->r.width = info->frame_width;
> +               sel->r.height = info->frame_height;
> +               break;
> +       default:
> +               v4l2_dbg(1, vvd->vv->debug, &vvd->vv->v4l2_dev,
> +                        "unsupported/invalid selection target\n");
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +int virtio_video_s_selection(struct file *file, void *fh,
> +                            struct v4l2_selection *sel)
> +{
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct virtio_video *vv = vvd->vv;
> +       int ret;
> +
> +       stream->out_info.crop.top = sel->r.top;
> +       stream->out_info.crop.left = sel->r.left;
> +       stream->out_info.crop.width = sel->r.width;
> +       stream->out_info.crop.height = sel->r.height;
> +
> +       ret = virtio_video_cmd_set_params(vv, stream,  &stream->out_info,
> +                                          VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
> +       if (ret < 0)
> +               return -EINVAL;
> +
> +       /* Get actual selection that was set */
> +       return virtio_video_cmd_get_params(vv, stream,
> +                                          VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
> +}
> +
> +int virtio_video_try_fmt(struct virtio_video_stream *stream,
> +                        struct v4l2_format *f)
> +{
> +       int i, idx = 0;
> +       struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct video_format *fmt = NULL;
> +       bool found = false;
> +       struct video_format_frame *frm = NULL;
> +       struct virtio_video_format_frame *frame = NULL;
> +
> +       if (V4L2_TYPE_IS_OUTPUT(f->type))
> +               fmt = find_video_format(&vvd->input_fmt_list,
> +                                       pix_mp->pixelformat);
> +       else
> +               fmt = find_video_format(&vvd->output_fmt_list,
> +                                       pix_mp->pixelformat);
> +
> +       if (!fmt) {

Why is this condition needed?

> +               if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +                       virtio_video_format_from_info(&stream->out_info,
> +                                                     pix_mp);
> +               else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +                       virtio_video_format_from_info(&stream->in_info,
> +                                                     pix_mp);
> +               else
> +                       return -EINVAL;
> +               return 0;
> +       }
> +
> +       for (i = 0; i < fmt->desc.num_frames && !found; i++) {

|width| and |height| don't make any sense for coded formats whose
metadata are in stream, such as VPx and H.264.

So, we should have a if-statement like this before this for-loop:

if (pix_mp->width == 0 && pix_mp->height == 0)  {
        stream->current_frame = &fmt->frames[0];
        return 0;
}

> +               frm = &fmt->frames[i];
> +               frame = &frm->frame;
> +               if (!within_range(frame->width.min, pix_mp->width,
> +                                 frame->width.max))
> +                       continue;
> +
> +               if (!within_range(frame->height.min, pix_mp->width,

pix_mp->height

> +                                 frame->height.max))
> +                       continue;
> +               idx = i;
> +               /*
> +                * Try to find a more suitable frame size. Go with the current
> +                * one otherwise.
> +                */
> +               if (needs_alignment(pix_mp->width, frame->width.step))
> +                       continue;
> +
> +               if (needs_alignment(pix_mp->height, frame->height.step))
> +                       continue;
> +
> +               stream->current_frame = frm;
> +               found = true;
> +       }
> +
> +       if (!found) {
> +               frm = &fmt->frames[idx];

If num_frames==0, Null-dereference can occur.
Even though the device is expected to return at least one frame info,
the driver should add a check to avoid crash.

> +               frame = &frm->frame;
> +               pix_mp->width = clamp(pix_mp->width, frame->width.min,
> +                                     frame->width.max);
> +               if (frame->width.step != 0)
> +                       pix_mp->width = ALIGN(pix_mp->width, frame->width.step);
> +
> +               pix_mp->height = clamp(pix_mp->height, frame->height.min,
> +                                      frame->height.max);
> +               if (frame->height.step != 0)
> +                       pix_mp->height = ALIGN(pix_mp->height,
> +                                              frame->height.step);
> +               stream->current_frame = frm;
> +       }
> +
> +       return 0;
> +}
> +
> +static int virtio_video_queue_free(struct virtio_video *vv,
> +                         struct virtio_video_stream *stream,
> +                         enum v4l2_buf_type type)
> +{
> +       int ret;
> +       uint32_t queue_type = to_virtio_queue_type(type);
> +
> +       ret = virtio_video_cmd_resource_destroy_all(vv, stream,
> +                                                   queue_type);
> +       if (ret)
> +               v4l2_warn(&vv->v4l2_dev,
> +                         "failed to destroy resources\n");
> +
> +       return 0;
> +}
> +
> +int virtio_video_reqbufs(struct file *file, void *priv,
> +                        struct v4l2_requestbuffers *rb)
> +{
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct v4l2_m2m_ctx *m2m_ctx = stream->fh.m2m_ctx;
> +       struct vb2_queue *vq = v4l2_m2m_get_vq(m2m_ctx, rb->type);
> +       struct virtio_video_device *vvd = video_drvdata(file);
> +
> +       if (rb->count == 0)
> +               virtio_video_queue_free(vvd->vv, stream, vq->type);
> +
> +       return v4l2_m2m_reqbufs(file, m2m_ctx, rb);
> +}
> +
> +int virtio_video_subscribe_event(struct v4l2_fh *fh,
> +                                const struct v4l2_event_subscription *sub)
> +{
> +       switch (sub->type) {
> +       case V4L2_EVENT_SOURCE_CHANGE:
> +               return v4l2_src_change_event_subscribe(fh, sub);
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +void virtio_video_queue_eos_event(struct virtio_video_stream *stream)
> +{
> +       static const struct v4l2_event eos_event = {
> +               .type = V4L2_EVENT_EOS
> +       };
> +
> +       v4l2_event_queue_fh(&stream->fh, &eos_event);
> +}
> +
> +void virtio_video_queue_res_chg_event(struct virtio_video_stream *stream)
> +{
> +       static const struct v4l2_event ev_src_ch = {
> +               .type = V4L2_EVENT_SOURCE_CHANGE,
> +               .u.src_change.changes =
> +                       V4L2_EVENT_SRC_CH_RESOLUTION,
> +       };
> +
> +       v4l2_event_queue_fh(&stream->fh, &ev_src_ch);
> +}
> +
> +void virtio_video_mark_drain_complete(struct virtio_video_stream *stream,
> +                                     struct vb2_v4l2_buffer *v4l2_vb)
> +{
> +       struct vb2_buffer *vb2_buf;
> +
> +       v4l2_vb->flags |= V4L2_BUF_FLAG_LAST;
> +
> +       vb2_buf = &v4l2_vb->vb2_buf;
> +       vb2_buf->planes[0].bytesused = 0;
> +
> +       v4l2_m2m_buf_done(v4l2_vb, VB2_BUF_STATE_DONE);
> +       stream->state = STREAM_STATE_STOPPED;
> +}
> +
> +void virtio_video_buf_done(struct virtio_video_buffer *virtio_vb,
> +                          uint32_t flags, uint64_t timestamp, uint32_t size)
> +{
> +       int i;
> +       enum vb2_buffer_state done_state = VB2_BUF_STATE_DONE;
> +       struct vb2_v4l2_buffer *v4l2_vb = &virtio_vb->v4l2_m2m_vb.vb;
> +       struct vb2_buffer *vb = &v4l2_vb->vb2_buf;
> +       struct vb2_queue *vb2_queue = vb->vb2_queue;
> +       struct virtio_video_stream *stream = vb2_get_drv_priv(vb2_queue);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct video_format_info *p_info;
> +
> +       virtio_vb->queued = false;
> +
> +       if (flags & VIRTIO_VIDEO_BUFFER_FLAG_ERR)
> +               done_state = VB2_BUF_STATE_ERROR;
> +
> +       if (flags & VIRTIO_VIDEO_BUFFER_FLAG_IFRAME)
> +               v4l2_vb->flags |= V4L2_BUF_FLAG_KEYFRAME;
> +
> +       if (flags & VIRTIO_VIDEO_BUFFER_FLAG_BFRAME)
> +               v4l2_vb->flags |= V4L2_BUF_FLAG_BFRAME;
> +
> +       if (flags & VIRTIO_VIDEO_BUFFER_FLAG_PFRAME)
> +               v4l2_vb->flags |= V4L2_BUF_FLAG_PFRAME;
> +
> +       if (flags & VIRTIO_VIDEO_BUFFER_FLAG_EOS) {
> +               v4l2_vb->flags |= V4L2_BUF_FLAG_LAST;
> +               stream->state = STREAM_STATE_STOPPED;
> +               virtio_video_queue_eos_event(stream);
> +       }
> +
> +       if (!V4L2_TYPE_IS_OUTPUT(vb2_queue->type)) {
> +               switch (vvd->type) {
> +               case VIRTIO_VIDEO_DEVICE_ENCODER:
> +                       vb->planes[0].bytesused = size;
> +                       break;
> +               case VIRTIO_VIDEO_DEVICE_DECODER:
> +                       p_info = &stream->out_info;
> +                       for (i = 0; i < p_info->num_planes; i++)
> +                               vb->planes[i].bytesused =
> +                                       p_info->plane_format[i].plane_size;

This is not always correct because the host can returns an empty
buffer with the EOS flag or the ERR flag.
In such case, we need to set 0 to bytesused.

However, the current protocol doesn't define how to notify |bytesused|
for decoder.
We may need to extend the protocol to have |size| for each plane?

> +                       break;
> +               }
> +
> +               vb->timestamp = timestamp;
> +       }
> +
> +       v4l2_m2m_buf_done(v4l2_vb, done_state);
> +}
> +
> +static void virtio_video_worker(struct work_struct *work)

Question:
Why do you enqueue buffers here instead of in virtio_video_dec_buf_queue?
Furthermore, I wonder why we have virtio_video_cmd_resource_queue for
INPUT both in this function and that function.

> +{
> +       unsigned int i;
> +       int ret;
> +       struct vb2_buffer *vb2_buf;
> +       struct vb2_v4l2_buffer *src_vb, *dst_vb;
> +       struct virtio_video_buffer *virtio_vb;
> +       struct virtio_video_stream *stream = work2stream(work);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct vb2_queue *src_vq =
> +               v4l2_m2m_get_vq(stream->fh.m2m_ctx,
> +                               V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +       struct vb2_queue *dst_vq =
> +               v4l2_m2m_get_vq(stream->fh.m2m_ctx,
> +                               V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +       struct virtio_video *vv = vvd->vv;
> +       uint32_t data_size[VB2_MAX_PLANES] = {0};
> +
> +       mutex_lock(dst_vq->lock);

Can't we narrow the range that requires the lock?
How about obtaining a lock just before virtio_video_cmd_resource_queue()?

At least, we can get lock inside of the for-loop to avoid blocking
another work for a long time.

> +       for (;;) {
> +               dst_vb = v4l2_m2m_next_dst_buf(stream->fh.m2m_ctx);
> +               if (dst_vb == NULL)
> +                       break;
> +
> +               vb2_buf = &dst_vb->vb2_buf;
> +               virtio_vb = to_virtio_vb(vb2_buf);
> +
> +               for (i = 0; i < vb2_buf->num_planes; ++i)
> +                       data_size[i] = vb2_buf->planes[i].bytesused;
> +
> +               ret = virtio_video_cmd_resource_queue
> +                       (vv, stream->stream_id, virtio_vb, data_size,
> +                        vb2_buf->num_planes, VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
> +               if (ret) {
> +                       v4l2_err(&vv->v4l2_dev,
> +                                 "failed to queue a dst buffer\n");
> +                       v4l2_m2m_job_finish(vvd->m2m_dev, stream->fh.m2m_ctx);
> +                       mutex_unlock(dst_vq->lock);
> +                       return;
> +               }
> +
> +               virtio_vb->queued = true;
> +               stream->dst_cleared = false;
> +               dst_vb = v4l2_m2m_dst_buf_remove(stream->fh.m2m_ctx);
> +       }
> +       mutex_unlock(dst_vq->lock);
> +
> +       mutex_lock(src_vq->lock);
> +       for (;;) {
> +               if (stream->state == STREAM_STATE_DRAIN)
> +                       break;
> +
> +               src_vb = v4l2_m2m_next_src_buf(stream->fh.m2m_ctx);
> +               if (src_vb == NULL)
> +                       break;
> +
> +               vb2_buf = &src_vb->vb2_buf;
> +               virtio_vb = to_virtio_vb(vb2_buf);
> +
> +               for (i = 0; i < vb2_buf->num_planes; ++i)
> +                       data_size[i] = vb2_buf->planes[i].bytesused;
> +
> +               ret = virtio_video_cmd_resource_queue
> +                       (vv, stream->stream_id, virtio_vb, data_size,
> +                        vb2_buf->num_planes, VIRTIO_VIDEO_QUEUE_TYPE_INPUT);
> +               if (ret) {
> +                       v4l2_err(&vv->v4l2_dev,
> +                                 "failed to queue an src buffer\n");
> +                       v4l2_m2m_job_finish(vvd->m2m_dev, stream->fh.m2m_ctx);
> +                       mutex_unlock(src_vq->lock);
> +                       return;
> +               }
> +
> +               virtio_vb->queued = true;
> +               stream->src_cleared = false;
> +               src_vb = v4l2_m2m_src_buf_remove(stream->fh.m2m_ctx);
> +       }
> +       mutex_unlock(src_vq->lock);
> +
> +       v4l2_m2m_job_finish(vvd->m2m_dev, stream->fh.m2m_ctx);
> +}
> +
> +static int virtio_video_device_open(struct file *file)
> +{
> +       int ret;
> +       uint32_t stream_id;
> +       char name[TASK_COMM_LEN];
> +       struct virtio_video_stream *stream;
> +       struct video_format *default_fmt;
> +       enum virtio_video_format format;
> +       struct video_device *video_dev = video_devdata(file);
> +       struct virtio_video_device *vvd = video_drvdata(file);
> +       struct virtio_video *vv = vvd->vv;
> +
> +       switch (vvd->type) {
> +       case VIRTIO_VIDEO_DEVICE_ENCODER:
> +               default_fmt = list_first_entry_or_null(&vvd->output_fmt_list,
> +                                                      struct video_format,
> +                                                      formats_list_entry);
> +               break;
> +       case VIRTIO_VIDEO_DEVICE_DECODER:
> +               default_fmt = list_first_entry_or_null(&vvd->input_fmt_list,
> +                                                      struct video_format,
> +                                                      formats_list_entry);
> +               break;
> +       default:
> +               v4l2_err(&vv->v4l2_dev, "unsupported device type\n");

How about printing vvd->type?

> +               return -EIO;
> +       }
> +
> +       if (!default_fmt) {
> +               v4l2_err(&vv->v4l2_dev, "device failed to start\n");
> +               return -EIO;
> +       }
> +
> +       stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> +       if (!stream)
> +               return -ENOMEM;
> +
> +       get_task_comm(name, current);
> +       format = virtio_video_v4l2_format_to_virtio(default_fmt->desc.format);

As I mentioned in the previous version, it's better to avoid expensive
operations like stream creation in open callback because applications
usually open a video device only to query capabilities.
We can delay to send stream_create until calling REQBUFS.

> +       virtio_video_stream_id_get(vv, stream, &stream_id);
> +       ret = virtio_video_cmd_stream_create(vv, stream_id, format, name);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to create stream\n");
> +               goto err_stream_create;
> +       }
> +
> +       stream->video_dev = video_dev;
> +       stream->stream_id = stream_id;
> +       stream->state = STREAM_STATE_IDLE;
> +
> +       ret = virtio_video_cmd_get_params(vv, stream,
> +                                         VIRTIO_VIDEO_QUEUE_TYPE_INPUT);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to get stream in params\n");
> +               goto err_init_ctrls;
> +       }
> +
> +       ret = virtio_video_cmd_get_params(vv, stream,
> +                                         VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to get stream out params\n");
> +               goto err_init_ctrls;
> +       }
> +
> +       ret = virtio_video_cmd_get_control(vv, stream,
> +                                          VIRTIO_VIDEO_CONTROL_PROFILE);

Since VIRTIO_VIODE_COTROLs are optional , we shouldn't call it unconditonally.
Especially, CONTROL_PROFILE is valid only when a special type of coded
formats is used.

> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to get stream profile\n");
> +               goto err_init_ctrls;
> +       }
> +
> +       ret = virtio_video_cmd_get_control(vv, stream,
> +                                          VIRTIO_VIDEO_CONTROL_LEVEL);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to get stream level\n");
> +               goto err_init_ctrls;
> +       }
> +
> +       ret = virtio_video_cmd_get_control(vv, stream,
> +                                          VIRTIO_VIDEO_CONTROL_BITRATE);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to get stream bitrate\n");
> +               goto err_init_ctrls;
> +       }
> +
> +       mutex_init(&stream->vq_mutex);
> +       INIT_WORK(&stream->work, virtio_video_worker);
> +       v4l2_fh_init(&stream->fh, video_dev);
> +       stream->fh.ctrl_handler = &stream->ctrl_handler;
> +
> +       switch (vvd->type) {
> +       case VIRTIO_VIDEO_DEVICE_ENCODER:
> +               stream->fh.m2m_ctx =
> +                       v4l2_m2m_ctx_init(vvd->m2m_dev, stream,
> +                                         &virtio_video_enc_init_queues);
> +               break;
> +       case VIRTIO_VIDEO_DEVICE_DECODER:
> +               stream->fh.m2m_ctx =
> +                       v4l2_m2m_ctx_init(vvd->m2m_dev, stream,
> +                                         &virtio_video_dec_init_queues);
> +               break;
> +       default:
> +               v4l2_err(&vv->v4l2_dev, "unsupported device type\n");
> +               goto err_stream_create;
> +       }
> +
> +       v4l2_m2m_set_src_buffered(stream->fh.m2m_ctx, true);
> +       v4l2_m2m_set_dst_buffered(stream->fh.m2m_ctx, true);
> +       file->private_data = &stream->fh;
> +       v4l2_fh_add(&stream->fh);
> +
> +       switch (vvd->type) {
> +       case VIRTIO_VIDEO_DEVICE_ENCODER:
> +               ret = virtio_video_enc_init_ctrls(stream);
> +               break;
> +       case VIRTIO_VIDEO_DEVICE_DECODER:
> +               ret = virtio_video_dec_init_ctrls(stream);
> +               break;
> +       default:
> +               ret = 0;
> +               break;

unreachable or error?

> +       }
> +
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to init controls\n");
> +               goto err_init_ctrls;
> +       }
> +       return 0;
> +
> +err_init_ctrls:
> +       v4l2_fh_del(&stream->fh);
> +       v4l2_fh_exit(&stream->fh);
> +       mutex_lock(video_dev->lock);
> +       v4l2_m2m_ctx_release(stream->fh.m2m_ctx);
> +       mutex_unlock(video_dev->lock);
> +err_stream_create:
> +       virtio_video_stream_id_put(vv, stream_id);
> +       kfree(stream);
> +
> +       return ret;
> +}
> +
> +static int virtio_video_device_release(struct file *file)
> +{
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct video_device *video_dev = video_devdata(file);
> +       struct virtio_video_device *vvd = video_drvdata(file);
> +       struct virtio_video *vv = vvd->vv;
> +
> +       v4l2_fh_del(&stream->fh);
> +       v4l2_fh_exit(&stream->fh);
> +       mutex_lock(video_dev->lock);
> +       v4l2_m2m_ctx_release(stream->fh.m2m_ctx);
> +       mutex_unlock(video_dev->lock);
> +
> +       virtio_video_cmd_stream_destroy(vv, stream->stream_id);
> +       virtio_video_stream_id_put(vv, stream->stream_id);
> +
> +       kfree(stream);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_file_operations virtio_video_device_fops = {
> +       .owner          = THIS_MODULE,
> +       .open           = virtio_video_device_open,
> +       .release        = virtio_video_device_release,
> +       .poll           = v4l2_m2m_fop_poll,
> +       .unlocked_ioctl = video_ioctl2,
> +       .mmap           = v4l2_m2m_fop_mmap,
> +};
> +
> +static void virtio_video_device_run(void *priv)
> +{
> +       struct virtio_video_stream *stream = priv;
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +
> +       queue_work(vvd->workqueue, &stream->work);
> +}
> +
> +static int virtio_video_device_job_ready(void *priv)
> +{
> +       struct virtio_video_stream *stream = priv;
> +
> +       if (stream->state == STREAM_STATE_STOPPED)
> +               return 0;
> +
> +       if (v4l2_m2m_num_src_bufs_ready(stream->fh.m2m_ctx) > 0 ||
> +           v4l2_m2m_num_dst_bufs_ready(stream->fh.m2m_ctx) > 0)
> +               return 1;
> +
> +       return 0;
> +}
> +
> +static void virtio_video_device_job_abort(void *priv)
> +{
> +       struct virtio_video_stream *stream = priv;
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +
> +       v4l2_m2m_job_finish(vvd->m2m_dev, stream->fh.m2m_ctx);
> +}
> +
> +static const struct v4l2_m2m_ops virtio_video_device_m2m_ops = {
> +       .device_run     = virtio_video_device_run,
> +       .job_ready      = virtio_video_device_job_ready,
> +       .job_abort      = virtio_video_device_job_abort,
> +};
> +
> +static int virtio_video_device_register(struct virtio_video_device *vvd)
> +{
> +       int ret = 0;
> +       struct video_device *vd = NULL;
> +       struct virtio_video *vv = NULL;
> +
> +       if (!vvd)
> +               return -EINVAL;
> +
> +       vd = &vvd->video_dev;
> +       vv = vvd->vv;
> +
> +       switch (vvd->type) {
> +       case VIRTIO_VIDEO_DEVICE_ENCODER:
> +               ret = virtio_video_enc_init(vd);
> +               break;
> +       case VIRTIO_VIDEO_DEVICE_DECODER:
> +               ret = virtio_video_dec_init(vd);
> +               break;
> +       default:
> +               v4l2_err(&vv->v4l2_dev, "unknown device type\n");
> +               return -EINVAL;
> +       }
> +
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to init device\n");
> +               return ret;
> +       }
> +
> +       ret = video_register_device(vd, VFL_TYPE_GRABBER, 0);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to register video device\n");
> +               return ret;
> +       }
> +
> +       vvd->workqueue = alloc_ordered_workqueue(vd->name,
> +                                                WQ_MEM_RECLAIM | WQ_FREEZABLE);
> +       if (!vvd->workqueue) {
> +               v4l2_err(&vv->v4l2_dev, "failed to create a workqueue");
> +               video_unregister_device(vd);
> +               return -ENOMEM;
> +       }
> +
> +       list_add(&vvd->devices_list_entry, &vv->devices_list);
> +       v4l2_info(&vv->v4l2_dev, "Device '%s' registered as /dev/video%d\n",
> +                 vd->name, vd->num);
> +
> +       return 0;
> +}
> +
> +static void virtio_video_device_unregister(struct virtio_video_device *vvd)
> +{
> +       if (!vvd)
> +               return;
> +
> +       list_del(&vvd->devices_list_entry);
> +       flush_workqueue(vvd->workqueue);
> +       destroy_workqueue(vvd->workqueue);
> +       video_unregister_device(&vvd->video_dev);
> +}
> +
> +static struct virtio_video_device *
> +virtio_video_device_create(struct virtio_video *vv)
> +{
> +       struct device *dev = NULL;
> +       struct video_device *vd = NULL;
> +       struct v4l2_m2m_dev *m2m_dev = NULL;
> +       struct virtio_video_device *vvd = NULL;
> +
> +       if (!vv)
> +               return ERR_PTR(-EINVAL);
> +
> +       dev = &vv->vdev->dev;
> +
> +       vvd = devm_kzalloc(dev, sizeof(*vvd), GFP_KERNEL);
> +       if (!vvd)
> +               return ERR_PTR(-ENOMEM);
> +
> +       m2m_dev = v4l2_m2m_init(&virtio_video_device_m2m_ops);
> +       if (IS_ERR(m2m_dev)) {
> +               v4l2_err(&vv->v4l2_dev, "failed to init m2m device\n");
> +               goto err;
> +       }
> +
> +       vvd->vv = vv;
> +       vvd->m2m_dev = m2m_dev;
> +       mutex_init(&vvd->video_dev_mutex);
> +       vd = &vvd->video_dev;
> +       vd->lock = &vvd->video_dev_mutex;
> +       vd->v4l2_dev = &vv->v4l2_dev;
> +       vd->vfl_dir = VFL_DIR_M2M;
> +       vd->ioctl_ops = NULL;
> +       vd->fops = &virtio_video_device_fops;
> +       vd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
> +       vd->release = video_device_release_empty;
> +
> +       /* Use the selection API instead */
> +       v4l2_disable_ioctl(vd, VIDIOC_CROPCAP);
> +       v4l2_disable_ioctl(vd, VIDIOC_G_CROP);
> +       v4l2_disable_ioctl(vd, VIDIOC_S_CROP);
> +
> +       video_set_drvdata(vd, vvd);
> +
> +       INIT_LIST_HEAD(&vvd->input_fmt_list);
> +       INIT_LIST_HEAD(&vvd->output_fmt_list);
> +       INIT_LIST_HEAD(&vvd->controls_fmt_list);
> +
> +       vvd->num_output_fmts = 0;
> +       vvd->num_input_fmts = 0;
> +
> +       switch (vv->vdev->id.device) {
> +       case VIRTIO_ID_VIDEO_ENC:
> +               vvd->type = VIRTIO_VIDEO_DEVICE_ENCODER;
> +               break;
> +       case VIRTIO_ID_VIDEO_DEC:
> +       default:

error if it's neither VIDEO_ENC nore VIDEO_DEC?

> +               vvd->type = VIRTIO_VIDEO_DEVICE_DECODER;
> +               break;
> +       }
> +
> +       return vvd;
> +
> +err:
> +       devm_kfree(dev, vvd);
> +
> +       return ERR_CAST(m2m_dev);
> +}
> +
> +void virtio_video_device_destroy(struct virtio_video_device *vvd)
> +{
> +       if (!vvd)
> +               return;
> +
> +       v4l2_m2m_release(vvd->m2m_dev);
> +       devm_kfree(&vvd->vv->vdev->dev, vvd);
> +}
> +
> +int virtio_video_device_init(struct virtio_video *vv,
> +                            void *input_buf, void *output_buf)
> +{
> +       int ret = 0;
> +       struct virtio_video_device *vvd = NULL;
> +
> +       if (!vv || !input_buf || !output_buf)
> +               return -EINVAL;
> +
> +
> +       vvd = virtio_video_device_create(vv);
> +       if (IS_ERR(vvd)) {
> +               v4l2_err(&vv->v4l2_dev,
> +                        "failed to create virtio video device\n");
> +               ret = PTR_ERR(vvd);
> +               goto failed;
> +       }
> +
> +       ret = virtio_video_parse_virtio_capability(vvd, input_buf, output_buf);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to parse a function\n");
> +               virtio_video_device_destroy(vvd);
> +               ret = -EINVAL;
> +               goto failed;
> +       }
> +
> +       ret = virtio_video_parse_virtio_control(vvd);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to query controls\n");
> +               virtio_video_clean_capability(vvd);
> +               virtio_video_device_destroy(vvd);

Please do these cleanups after goto.

> +               goto failed;
> +       }
> +
> +       ret = virtio_video_device_register(vvd);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev,
> +                        "failed to init virtio video device\n");
> +               virtio_video_clean_control(vvd);
> +               virtio_video_clean_capability(vvd);
> +               virtio_video_device_destroy(vvd);
> +               goto failed;
> +       }
> +
> +       return 0;
> +
> +failed:
> +       virtio_video_device_deinit(vv);
> +
> +       return ret;
> +}
> +
> +void virtio_video_device_deinit(struct virtio_video *vv)
> +{
> +       struct virtio_video_device *vvd = NULL, *tmp = NULL;
> +
> +       list_for_each_entry_safe(vvd, tmp, &vv->devices_list,
> +                                devices_list_entry) {
> +               virtio_video_device_unregister(vvd);
> +               virtio_video_clean_control(vvd);
> +               virtio_video_clean_capability(vvd);
> +               virtio_video_device_destroy(vvd);
> +       }
> +}
> diff --git a/drivers/media/virtio/virtio_video_driver.c b/drivers/media/virtio/virtio_video_driver.c
> new file mode 100644
> index 000000000000..2d4fd7671f4f
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_video_driver.c
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Driver for virtio video device.
> + *
> + * Copyright 2019 OpenSynergy GmbH.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/version.h>
> +#include <linux/dma-mapping.h>
> +
> +#include "virtio_video.h"
> +
> +static unsigned int debug;
> +module_param(debug, uint, 0644);
> +
> +static unsigned int use_dma_mem;
> +module_param(use_dma_mem, uint, 0644);
> +MODULE_PARM_DESC(use_dma_mem, "Try to allocate buffers from the DMA zone");
> +
> +static void virtio_video_init_vq(struct virtio_video_queue *vvq,
> +                                void (*work_func)(struct work_struct *work))
> +{
> +       spin_lock_init(&vvq->qlock);
> +       init_waitqueue_head(&vvq->ack_queue);
> +       INIT_WORK(&vvq->dequeue_work, work_func);
> +}
> +
> +static void *dma_phys_alloc(struct device *dev, size_t size,
> +                           dma_addr_t *dma_handle, gfp_t gfp,
> +                           unsigned long attrs)
> +{
> +       void *ret;
> +
> +       ret = (void *)__get_free_pages(gfp, get_order(size));
> +       if (ret)
> +               *dma_handle = virt_to_phys(ret) - PFN_PHYS(dev->dma_pfn_offset);
> +
> +       return ret;
> +}
> +
> +static void dma_phys_free(struct device *dev, size_t size,
> +                         void *cpu_addr, dma_addr_t dma_addr,
> +                         unsigned long attrs)
> +{
> +       free_pages((unsigned long)cpu_addr, get_order(size));
> +}
> +
> +static dma_addr_t dma_phys_map_page(struct device *dev, struct page *page,
> +                                   unsigned long offset, size_t size,
> +                                   enum dma_data_direction dir,
> +                                   unsigned long attrs)
> +{
> +       return page_to_phys(page) + offset - PFN_PHYS(dev->dma_pfn_offset);
> +}
> +
> +static int dma_phys_map_sg(struct device *dev, struct scatterlist *sgl,
> +                          int nents, enum dma_data_direction dir,
> +                          unsigned long attrs)
> +{
> +       int i;
> +       struct scatterlist *sg;
> +
> +       for_each_sg(sgl, sg, nents, i) {
> +               dma_addr_t offset = PFN_PHYS(dev->dma_pfn_offset);
> +               void *va;
> +
> +               BUG_ON(!sg_page(sg));

AFAIK, BUG_ON isn't recommended to use.
At least, /scripts/checkpatch.pl complains it.

> +               va = sg_virt(sg);
> +               sg_dma_address(sg) = (dma_addr_t)virt_to_phys(va) - offset;
> +               sg_dma_len(sg) = sg->length;
> +       }
> +
> +       return nents;
> +}
> +
> +const struct dma_map_ops dma_phys_ops = {
> +       .alloc                  = dma_phys_alloc,
> +       .free                   = dma_phys_free,
> +       .map_page               = dma_phys_map_page,
> +       .map_sg                 = dma_phys_map_sg,
> +};
> +
> +static int virtio_video_query_cap_resp_buf(struct virtio_video *vv, void
> +                                          **resp_buf, int queue_type)
> +{
> +       int ret = 0;
> +       int resp_size = vv->max_caps_len;
> +
> +       *resp_buf = kzalloc(vv->max_caps_len, GFP_KERNEL);
> +       if (IS_ERR(*resp_buf)) {
> +               ret = PTR_ERR(*resp_buf);
> +               goto err;
> +       }
> +
> +       vv->got_caps = false;
> +       ret = virtio_video_query_capability(vv, *resp_buf, resp_size,
> +                                           queue_type);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to query capability\n");
> +               goto err;
> +       }
> +
> +       ret = wait_event_timeout(vv->wq, vv->got_caps, 5 * HZ);
> +       if (ret == 0) {
> +               v4l2_err(&vv->v4l2_dev, "timed out waiting for get caps\n");
> +               ret = -EIO;
> +               goto err;
> +       }
> +
> +       return 0;
> +err:
> +       return ret;
> +}
> +
> +static int virtio_video_init(struct virtio_video *vv)
> +{
> +       int ret = 0;
> +       void *input_resp_buf = NULL;
> +       void *output_resp_buf = NULL;
> +
> +       if (!vv)
> +               return -EINVAL;
> +
> +       ret = virtio_video_query_cap_resp_buf(vv, &input_resp_buf,
> +                                             VIRTIO_VIDEO_QUEUE_TYPE_INPUT);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to get input caps\n");
> +               goto err;
> +       }
> +
> +       ret = virtio_video_query_cap_resp_buf(vv, &output_resp_buf,
> +                                             VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to get output caps\n");
> +               goto err;
> +       }
> +
> +       ret = virtio_video_device_init(vv, input_resp_buf, output_resp_buf);
> +       if (ret)
> +               v4l2_err(&vv->v4l2_dev, "failed to initialize devices\n");
> +
> +err:
> +       kfree(input_resp_buf);
> +       kfree(output_resp_buf);
> +
> +       return ret;
> +};
> +
> +static int virtio_video_probe(struct virtio_device *vdev)
> +{
> +       int ret;
> +       struct virtio_video *vv;
> +       struct virtqueue *vqs[2];
> +       struct device *dev = &vdev->dev;
> +
> +       static const char * const names[] = { "control", "event" };
> +       static vq_callback_t *callbacks[] = {
> +               virtio_video_cmd_ack,
> +               virtio_video_event_ack
> +       };
> +
> +       if (!virtio_has_feature(vdev, VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES)) {
> +               dev_err(dev, "device must support guest allocated buffers\n");
> +               return -ENODEV;
> +       }
> +
> +       vv = devm_kzalloc(dev, sizeof(*vv), GFP_KERNEL);
> +       if (!vv)
> +               return -ENOMEM;
> +
> +       vv->vdev = vdev;
> +       vv->debug = debug;
> +       vv->use_dma_mem = use_dma_mem;
> +       vdev->priv = vv;
> +
> +       spin_lock_init(&vv->resource_idr_lock);
> +       idr_init(&vv->resource_idr);
> +       spin_lock_init(&vv->stream_idr_lock);
> +       idr_init(&vv->stream_idr);
> +
> +       init_waitqueue_head(&vv->wq);
> +
> +       if (virtio_has_feature(vdev, VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG))
> +               vv->supp_non_contig = true;
> +
> +       vv->has_iommu = !virtio_has_iommu_quirk(vdev);
> +       if (!vv->has_iommu)
> +               set_dma_ops(dev, &dma_phys_ops);
> +
> +       dev_set_name(dev, "%s.%i", DRIVER_NAME, vdev->index);
> +       ret = v4l2_device_register(dev, &vv->v4l2_dev);
> +       if (ret)
> +               goto err_v4l2_reg;
> +
> +       virtio_video_init_vq(&vv->commandq, virtio_video_dequeue_cmd_func);
> +       virtio_video_init_vq(&vv->eventq, virtio_video_dequeue_event_func);
> +
> +       ret = virtio_find_vqs(vdev, 2, vqs, callbacks, names, NULL);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to find virt queues\n");
> +               goto err_vqs;
> +       }
> +
> +       vv->commandq.vq = vqs[0];
> +       vv->eventq.vq = vqs[1];
> +
> +       ret = virtio_video_alloc_vbufs(vv);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to alloc vbufs\n");
> +               goto err_vbufs;
> +       }
> +
> +       virtio_cread(vdev, struct virtio_video_config, max_caps_length,
> +                    &vv->max_caps_len);
> +       if (!vv->max_caps_len) {
> +               v4l2_err(&vv->v4l2_dev, "max_caps_len is zero\n");
> +               ret = -EINVAL;
> +               goto err_config;
> +       }
> +
> +       virtio_cread(vdev, struct virtio_video_config, max_resp_length,
> +                    &vv->max_resp_len);
> +       if (!vv->max_resp_len) {
> +               v4l2_err(&vv->v4l2_dev, "max_resp_len is zero\n");
> +               ret = -EINVAL;
> +               goto err_config;
> +       }
> +
> +       ret = virtio_video_alloc_events(vv, vv->eventq.vq->num_free);
> +       if (ret)
> +               goto err_events;
> +
> +       virtio_device_ready(vdev);
> +       vv->vq_ready = true;
> +       vv->got_caps = false;
> +
> +       INIT_LIST_HEAD(&vv->devices_list);
> +
> +       ret = virtio_video_init(vv);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev,
> +                        "failed to init virtio video\n");
> +               goto err_init;
> +       }
> +
> +       return 0;
> +
> +err_init:
> +err_events:
> +err_config:
> +       virtio_video_free_vbufs(vv);
> +err_vbufs:
> +       vdev->config->del_vqs(vdev);
> +err_vqs:
> +       v4l2_device_unregister(&vv->v4l2_dev);
> +err_v4l2_reg:
> +       devm_kfree(&vdev->dev, vv);
> +
> +       return ret;
> +}
> +
> +static void virtio_video_remove(struct virtio_device *vdev)
> +{
> +       struct virtio_video *vv = vdev->priv;
> +
> +       virtio_video_device_deinit(vv);
> +       virtio_video_free_vbufs(vv);
> +       vdev->config->del_vqs(vdev);
> +       v4l2_device_unregister(&vv->v4l2_dev);
> +       devm_kfree(&vdev->dev, vv);
> +}
> +
> +static struct virtio_device_id id_table[] = {
> +       { VIRTIO_ID_VIDEO_DEC, VIRTIO_DEV_ANY_ID },
> +       { VIRTIO_ID_VIDEO_ENC, VIRTIO_DEV_ANY_ID },
> +       { 0 },
> +};
> +
> +static unsigned int features[] = {
> +       VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES,
> +       VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG,
> +};
> +
> +static struct virtio_driver virtio_video_driver = {
> +       .feature_table = features,
> +       .feature_table_size = ARRAY_SIZE(features),
> +       .driver.name = DRIVER_NAME,
> +       .driver.owner = THIS_MODULE,
> +       .id_table = id_table,
> +       .probe = virtio_video_probe,
> +       .remove = virtio_video_remove,
> +};
> +
> +module_virtio_driver(virtio_video_driver);
> +
> +MODULE_DEVICE_TABLE(virtio, id_table);
> +MODULE_DESCRIPTION("virtio video driver");
> +MODULE_AUTHOR("Dmitry Sepp <dmitry.sepp@opensynergy.com>");
> +MODULE_AUTHOR("Kiran Pawar <kiran.pawar@opensynergy.com>");
> +MODULE_AUTHOR("Nikolay Martyanov <nikolay.martyanov@opensynergy.com>");
> +MODULE_AUTHOR("Samiullah Khawaja <samiullah.khawaja@opensynergy.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/virtio/virtio_video_enc.c b/drivers/media/virtio/virtio_video_enc.c
> new file mode 100644
> index 000000000000..d9bd5f293900
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_video_enc.c
> @@ -0,0 +1,569 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Encoder for virtio video device.
> + *
> + * Copyright 2019 OpenSynergy GmbH.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +
> +#include "virtio_video.h"
> +
> +static void virtio_video_enc_buf_queue(struct vb2_buffer *vb)
> +{
> +       struct vb2_v4l2_buffer *v4l2_vb = to_vb2_v4l2_buffer(vb);
> +       struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
> +
> +       v4l2_m2m_buf_queue(stream->fh.m2m_ctx, v4l2_vb);
> +
> +}
> +
> +static int virtio_video_enc_start_streaming(struct vb2_queue *vq,
> +                                       unsigned int count)
> +{
> +       struct virtio_video_stream *stream = vb2_get_drv_priv(vq);
> +       bool input_queue = V4L2_TYPE_IS_OUTPUT(vq->type);
> +
> +       if (stream->state == STREAM_STATE_INIT ||
> +           (!input_queue && stream->state == STREAM_STATE_RESET) ||
> +           (input_queue && stream->state == STREAM_STATE_STOPPED))
> +               stream->state = STREAM_STATE_RUNNING;
> +
> +       return 0;
> +}
> +
> +static void virtio_video_enc_stop_streaming(struct vb2_queue *vq)
> +{
> +       int ret, queue_type;
> +       bool *cleared;
> +       bool is_v4l2_output = V4L2_TYPE_IS_OUTPUT(vq->type);
> +       struct virtio_video_stream *stream = vb2_get_drv_priv(vq);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct virtio_video *vv = vvd->vv;
> +       struct vb2_v4l2_buffer *v4l2_vb;
> +
> +       if (is_v4l2_output) {
> +               cleared = &stream->src_cleared;
> +               queue_type = VIRTIO_VIDEO_QUEUE_TYPE_INPUT;
> +       } else {
> +               cleared = &stream->dst_cleared;
> +               queue_type = VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT;
> +       }
> +
> +       ret = virtio_video_cmd_queue_clear(vv, stream, queue_type);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev, "failed to clear queue\n");
> +               return;
> +       }
> +
> +       ret = wait_event_timeout(vv->wq, *cleared, 5 * HZ);
> +       if (ret == 0) {
> +               v4l2_err(&vv->v4l2_dev, "timed out waiting for queue clear\n");
> +               return;
> +       }
> +
> +       for (;;) {
> +               if (is_v4l2_output)
> +                       v4l2_vb = v4l2_m2m_src_buf_remove(stream->fh.m2m_ctx);
> +               else
> +                       v4l2_vb = v4l2_m2m_dst_buf_remove(stream->fh.m2m_ctx);
> +               if (!v4l2_vb)
> +                       break;
> +               v4l2_m2m_buf_done(v4l2_vb, VB2_BUF_STATE_ERROR);
> +       }
> +
> +       if (is_v4l2_output)
> +               stream->state = STREAM_STATE_STOPPED;
> +       else
> +               stream->state = STREAM_STATE_RESET;
> +}
> +
> +static const struct vb2_ops virtio_video_enc_qops = {
> +       .queue_setup     = virtio_video_queue_setup,
> +       .buf_init        = virtio_video_buf_init,
> +       .buf_cleanup     = virtio_video_buf_cleanup,
> +       .buf_queue       = virtio_video_enc_buf_queue,
> +       .start_streaming = virtio_video_enc_start_streaming,
> +       .stop_streaming  = virtio_video_enc_stop_streaming,
> +       .wait_prepare    = vb2_ops_wait_prepare,
> +       .wait_finish     = vb2_ops_wait_finish,
> +};
> +
> +static int virtio_video_enc_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       int ret = 0;
> +       struct virtio_video_stream *stream = ctrl2stream(ctrl);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct virtio_video *vv = vvd->vv;
> +       uint32_t control, value;
> +
> +       control = virtio_video_v4l2_control_to_virtio(ctrl->id);
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_MPEG_VIDEO_BITRATE:
> +               ret = virtio_video_cmd_set_control(vv, stream->stream_id,
> +                                                  control, ctrl->val);
> +               break;
> +       case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> +               value = virtio_video_v4l2_level_to_virtio(ctrl->val);
> +               ret = virtio_video_cmd_set_control(vv, stream->stream_id,
> +                                                  control, value);
> +               break;
> +       case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
> +               value = virtio_video_v4l2_profile_to_virtio(ctrl->val);
> +               ret = virtio_video_cmd_set_control(vv, stream->stream_id,
> +                                                  control, value);
> +               break;
> +       default:
> +               ret = -EINVAL;
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +static int virtio_video_enc_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       int ret = 0;
> +       struct virtio_video_stream *stream = ctrl2stream(ctrl);
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
> +               if (stream->state >= STREAM_STATE_INIT)
> +                       ctrl->val = stream->in_info.min_buffers;
> +               else
> +                       ctrl->val = 0;
> +               break;
> +       default:
> +               ret = -EINVAL;
> +       }
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops virtio_video_enc_ctrl_ops = {
> +       .g_volatile_ctrl        = virtio_video_enc_g_volatile_ctrl,
> +       .s_ctrl                 = virtio_video_enc_s_ctrl,
> +};
> +
> +int virtio_video_enc_init_ctrls(struct virtio_video_stream *stream)
> +{
> +       struct v4l2_ctrl *ctrl;
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct virtio_video *vv = vvd->vv;
> +       struct video_control_format *c_fmt = NULL;
> +
> +       v4l2_ctrl_handler_init(&stream->ctrl_handler, 1);
> +
> +       ctrl = v4l2_ctrl_new_std(&stream->ctrl_handler,
> +                               &virtio_video_enc_ctrl_ops,
> +                               V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
> +                               MIN_BUFS_MIN, MIN_BUFS_MAX, MIN_BUFS_STEP,
> +                               MIN_BUFS_DEF);
> +       ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
> +
> +       list_for_each_entry(c_fmt, &vvd->controls_fmt_list,
> +                           controls_list_entry) {
> +               switch (c_fmt->format) {
> +               case V4L2_PIX_FMT_H264:
> +                       if (c_fmt->profile)
> +                               v4l2_ctrl_new_std_menu
> +                                       (&stream->ctrl_handler,
> +                                        &virtio_video_enc_ctrl_ops,
> +                                        V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +                                        c_fmt->profile->max,
> +                                        c_fmt->profile->skip_mask,
> +                                        c_fmt->profile->min);
> +
> +                       if (c_fmt->level)
> +                               v4l2_ctrl_new_std_menu
> +                                       (&stream->ctrl_handler,
> +                                        &virtio_video_enc_ctrl_ops,
> +                                        V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> +                                        c_fmt->level->max,
> +                                        c_fmt->level->skip_mask,
> +                                        c_fmt->level->min);
> +                       break;
> +               default:
> +                       v4l2_dbg(1, vv->debug,
> +                                &vv->v4l2_dev, "unsupported format\n");
> +                       break;
> +               }
> +       }
> +
> +       if (stream->control.bitrate) {
> +               v4l2_ctrl_new_std(&stream->ctrl_handler,
> +                                 &virtio_video_enc_ctrl_ops,
> +                                 V4L2_CID_MPEG_VIDEO_BITRATE,
> +                                 1, stream->control.bitrate,
> +                                 1, stream->control.bitrate);
> +       }
> +
> +       if (stream->ctrl_handler.error)
> +               return stream->ctrl_handler.error;
> +
> +       v4l2_ctrl_handler_setup(&stream->ctrl_handler);
> +
> +       return 0;
> +}
> +
> +int virtio_video_enc_init_queues(void *priv, struct vb2_queue *src_vq,
> +                                struct vb2_queue *dst_vq)
> +{
> +       int ret;
> +       struct virtio_video_stream *stream = priv;
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct virtio_video *vv = vvd->vv;
> +       struct device *dev = vv->v4l2_dev.dev;
> +
> +       src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +       src_vq->drv_priv = stream;
> +       src_vq->buf_struct_size = sizeof(struct virtio_video_buffer);
> +       src_vq->ops = &virtio_video_enc_qops;
> +       src_vq->mem_ops = virtio_video_mem_ops(vv);
> +       src_vq->min_buffers_needed = stream->in_info.min_buffers;
> +       src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +       src_vq->lock = &stream->vq_mutex;
> +       src_vq->gfp_flags = virtio_video_gfp_flags(vv);
> +       src_vq->dev = dev;
> +
> +       ret = vb2_queue_init(src_vq);
> +       if (ret)
> +               return ret;
> +
> +       dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +       dst_vq->drv_priv = stream;
> +       dst_vq->buf_struct_size = sizeof(struct virtio_video_buffer);
> +       dst_vq->ops = &virtio_video_enc_qops;
> +       dst_vq->mem_ops = virtio_video_mem_ops(vv);
> +       dst_vq->min_buffers_needed = stream->out_info.min_buffers;
> +       dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +       dst_vq->lock = &stream->vq_mutex;
> +       dst_vq->gfp_flags = virtio_video_gfp_flags(vv);
> +       dst_vq->dev = dev;
> +
> +       return vb2_queue_init(dst_vq);
> +}
> +
> +static int virtio_video_try_encoder_cmd(struct file *file, void *fh,
> +                                       struct v4l2_encoder_cmd *cmd)
> +{
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = video_drvdata(file);
> +       struct virtio_video *vv = vvd->vv;
> +
> +       if (stream->state == STREAM_STATE_DRAIN)
> +               return -EBUSY;
> +
> +       switch (cmd->cmd) {
> +       case V4L2_ENC_CMD_STOP:
> +       case V4L2_ENC_CMD_START:
> +               if (cmd->flags != 0) {
> +                       v4l2_err(&vv->v4l2_dev, "flags=%u are not supported",
> +                                cmd->flags);
> +                       return -EINVAL;
> +               }
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int virtio_video_encoder_cmd(struct file *file, void *fh,
> +                                   struct v4l2_encoder_cmd *cmd)
> +{
> +       int ret;
> +       struct vb2_queue *src_vq, *dst_vq;
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = video_drvdata(file);
> +       struct virtio_video *vv = vvd->vv;
> +
> +       ret = virtio_video_try_encoder_cmd(file, fh, cmd);
> +       if (ret < 0)
> +               return ret;
> +
> +       dst_vq = v4l2_m2m_get_vq(stream->fh.m2m_ctx,
> +                                V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +
> +       switch (cmd->cmd) {
> +       case V4L2_ENC_CMD_START:
> +               vb2_clear_last_buffer_dequeued(dst_vq);
> +               stream->state = STREAM_STATE_RUNNING;
> +               break;
> +       case V4L2_ENC_CMD_STOP:
> +               src_vq = v4l2_m2m_get_vq(stream->fh.m2m_ctx,
> +                                        V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +
> +               if (!vb2_is_streaming(src_vq)) {
> +                       v4l2_dbg(1, vv->debug,
> +                                &vv->v4l2_dev, "output is not streaming\n");
> +                       return 0;
> +               }
> +
> +               if (!vb2_is_streaming(dst_vq)) {
> +                       v4l2_dbg(1, vv->debug,
> +                                &vv->v4l2_dev, "capture is not streaming\n");
> +                       return 0;
> +               }
> +
> +               ret = virtio_video_cmd_stream_drain(vv, stream->stream_id);
> +               if (ret) {
> +                       v4l2_err(&vv->v4l2_dev, "failed to drain stream\n");
> +                       return ret;
> +               }
> +
> +               stream->state = STREAM_STATE_DRAIN;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int virtio_video_enc_enum_fmt_vid_cap(struct file *file, void *fh,
> +                                            struct v4l2_fmtdesc *f)
> +{
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct video_format *fmt = NULL;
> +       int idx = 0;
> +
> +       if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +               return -EINVAL;
> +
> +       if (f->index >= vvd->num_output_fmts)
> +               return -EINVAL;
> +
> +       list_for_each_entry(fmt, &vvd->output_fmt_list, formats_list_entry) {
> +               if (f->index == idx) {
> +                       f->pixelformat = fmt->desc.format;
> +                       return 0;
> +               }
> +               idx++;
> +       }
> +       return -EINVAL;
> +}
> +
> +static int virtio_video_enc_enum_fmt_vid_out(struct file *file, void *fh,
> +                                            struct v4l2_fmtdesc *f)
> +{
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct video_format_info *info = NULL;
> +       struct video_format *fmt = NULL;
> +       unsigned long output_mask = 0;
> +       int idx = 0, bit_num = 0;
> +
> +       if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +               return -EINVAL;
> +
> +       if (f->index >= vvd->num_input_fmts)
> +               return -EINVAL;
> +
> +       info = &stream->out_info;
> +       list_for_each_entry(fmt, &vvd->output_fmt_list, formats_list_entry) {
> +               if (info->fourcc_format == fmt->desc.format) {
> +                       output_mask = fmt->desc.mask;
> +                       break;
> +               }
> +       }
> +
> +       if (output_mask == 0)
> +               return -EINVAL;
> +
> +       list_for_each_entry(fmt, &vvd->input_fmt_list, formats_list_entry) {
> +               if (test_bit(bit_num, &output_mask)) {
> +                       if (f->index == idx) {
> +                               f->pixelformat = fmt->desc.format;
> +                               return 0;
> +                       }
> +                       idx++;
> +               }
> +               bit_num++;
> +       }
> +       return -EINVAL;
> +}
> +
> +static int virtio_video_enc_s_fmt(struct file *file, void *fh,
> +                                 struct v4l2_format *f)
> +{
> +       int ret;
> +       struct virtio_video_stream *stream = file2stream(file);
> +
> +       ret = virtio_video_s_fmt(file, fh, f);
> +       if (ret)
> +               return ret;
> +
> +       if (!V4L2_TYPE_IS_OUTPUT(f->type)) {
> +               if (stream->state == STREAM_STATE_IDLE)
> +                       stream->state = STREAM_STATE_INIT;
> +       }
> +
> +       return 0;
> +}
> +
> +static int virtio_video_enc_try_framerate(struct virtio_video_stream *stream,
> +                                         unsigned int fps)
> +{
> +       int rate_idx;
> +       struct video_format_frame *frame = NULL;
> +
> +       if (stream->current_frame == NULL)
> +               return -EINVAL;
> +
> +       frame = stream->current_frame;
> +       for (rate_idx = 0; rate_idx < frame->frame.num_rates; rate_idx++) {
> +               struct virtio_video_format_range *frame_rate =
> +                       &frame->frame_rates[rate_idx];
> +
> +               if (within_range(frame_rate->min, fps, frame_rate->max))
> +                       return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static void virtio_video_timeperframe_from_info(struct video_format_info *info,
> +                                               struct v4l2_fract *timeperframe)
> +{
> +       timeperframe->numerator = info->frame_rate;
> +       timeperframe->denominator = 1;
> +}
> +
> +static int virtio_video_enc_g_parm(struct file *file, void *priv,
> +                                  struct v4l2_streamparm *a)
> +{
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct virtio_video *vv = vvd->vv;
> +       struct v4l2_outputparm *out = &a->parm.output;
> +       struct v4l2_fract *timeperframe = &out->timeperframe;
> +
> +       if (!V4L2_TYPE_IS_OUTPUT(a->type)) {
> +               v4l2_err(&vv->v4l2_dev,
> +                        "getting FPS is only possible for the output queue\n");
> +               return -EINVAL;
> +       }
> +
> +       out->capability = V4L2_CAP_TIMEPERFRAME;
> +       virtio_video_timeperframe_from_info(&stream->in_info, timeperframe);
> +
> +       return 0;
> +}
> +
> +static int virtio_video_enc_s_parm(struct file *file, void *priv,
> +                                  struct v4l2_streamparm *a)
> +{
> +       int ret;
> +       u64 frame_interval, frame_rate;
> +       struct video_format_info info;
> +       struct virtio_video_stream *stream = file2stream(file);
> +       struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
> +       struct virtio_video *vv = vvd->vv;
> +       struct v4l2_outputparm *out = &a->parm.output;
> +       struct v4l2_fract *timeperframe = &out->timeperframe;
> +
> +       if (V4L2_TYPE_IS_OUTPUT(a->type)) {
> +               frame_interval = timeperframe->numerator * (u64)USEC_PER_SEC;
> +               do_div(frame_interval, timeperframe->denominator);
> +               if (!frame_interval)
> +                       return -EINVAL;
> +
> +               frame_rate = (u64)USEC_PER_SEC;
> +               do_div(frame_rate, frame_interval);
> +       } else {
> +               v4l2_err(&vv->v4l2_dev,
> +                        "setting FPS is only possible for the output queue\n");
> +               return -EINVAL;
> +       }
> +
> +       ret = virtio_video_enc_try_framerate(stream, frame_rate);
> +       if (ret)
> +               return ret;
> +
> +       virtio_video_format_fill_default_info(&info, &stream->in_info);
> +       info.frame_rate = frame_rate;
> +
> +       virtio_video_cmd_set_params(vv, stream, &info,
> +                                   VIRTIO_VIDEO_QUEUE_TYPE_INPUT);
> +       virtio_video_cmd_get_params(vv, stream, VIRTIO_VIDEO_QUEUE_TYPE_INPUT);
> +       virtio_video_cmd_get_params(vv, stream, VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
> +
> +       out->capability = V4L2_CAP_TIMEPERFRAME;
> +       virtio_video_timeperframe_from_info(&stream->in_info, timeperframe);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops virtio_video_enc_ioctl_ops = {
> +       .vidioc_querycap        = virtio_video_querycap,
> +
> +       .vidioc_enum_fmt_vid_cap = virtio_video_enc_enum_fmt_vid_cap,
> +       .vidioc_g_fmt_vid_cap   = virtio_video_g_fmt,
> +       .vidioc_s_fmt_vid_cap   = virtio_video_enc_s_fmt,
> +
> +       .vidioc_enum_fmt_vid_cap_mplane = virtio_video_enc_enum_fmt_vid_cap,
> +       .vidioc_g_fmt_vid_cap_mplane    = virtio_video_g_fmt,
> +       .vidioc_s_fmt_vid_cap_mplane    = virtio_video_enc_s_fmt,
> +
> +       .vidioc_enum_fmt_vid_out = virtio_video_enc_enum_fmt_vid_out,
> +       .vidioc_g_fmt_vid_out   = virtio_video_g_fmt,
> +       .vidioc_s_fmt_vid_out   = virtio_video_enc_s_fmt,
> +
> +       .vidioc_enum_fmt_vid_out_mplane = virtio_video_enc_enum_fmt_vid_out,
> +       .vidioc_g_fmt_vid_out_mplane    = virtio_video_g_fmt,
> +       .vidioc_s_fmt_vid_out_mplane    = virtio_video_enc_s_fmt,
> +
> +       .vidioc_try_encoder_cmd = virtio_video_try_encoder_cmd,
> +       .vidioc_encoder_cmd     = virtio_video_encoder_cmd,
> +       .vidioc_enum_frameintervals = virtio_video_enum_framemintervals,
> +       .vidioc_enum_framesizes = virtio_video_enum_framesizes,
> +
> +       .vidioc_g_selection = virtio_video_g_selection,
> +       .vidioc_s_selection = virtio_video_s_selection,
> +
> +       .vidioc_reqbufs         = virtio_video_reqbufs,
> +       .vidioc_querybuf        = v4l2_m2m_ioctl_querybuf,
> +       .vidioc_qbuf            = v4l2_m2m_ioctl_qbuf,
> +       .vidioc_dqbuf           = v4l2_m2m_ioctl_dqbuf,
> +       .vidioc_prepare_buf     = v4l2_m2m_ioctl_prepare_buf,
> +       .vidioc_create_bufs     = v4l2_m2m_ioctl_create_bufs,
> +       .vidioc_expbuf          = v4l2_m2m_ioctl_expbuf,
> +
> +       .vidioc_streamon        = v4l2_m2m_ioctl_streamon,
> +       .vidioc_streamoff       = v4l2_m2m_ioctl_streamoff,
> +
> +       .vidioc_s_parm          = virtio_video_enc_s_parm,
> +       .vidioc_g_parm          = virtio_video_enc_g_parm,
> +
> +       .vidioc_subscribe_event = virtio_video_subscribe_event,
> +       .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +int virtio_video_enc_init(struct video_device *vd)
> +{
> +       ssize_t num;
> +
> +       vd->ioctl_ops = &virtio_video_enc_ioctl_ops;
> +       num = strscpy(vd->name, "stateful-encoder", sizeof(vd->name));
> +
> +       return 0;
> +}
> diff --git a/drivers/media/virtio/virtio_video_enc.h b/drivers/media/virtio/virtio_video_enc.h
> new file mode 100644
> index 000000000000..3d2a27a8e08c
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_video_enc.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/* Encoder header for virtio video driver.
> + *
> + * Copyright 2019 OpenSynergy GmbH.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef _VIRTIO_VIDEO_ENC_H
> +#define _VIRTIO_VIDEO_ENC_H
> +
> +#include "virtio_video.h"
> +
> +int virtio_video_enc_init(struct video_device *vd);
> +int virtio_video_enc_init_ctrls(struct virtio_video_stream *stream);
> +int virtio_video_enc_init_queues(void *priv, struct vb2_queue *src_vq,
> +                                struct vb2_queue *dst_vq);
> +
> +#endif /* _VIRTIO_VIDEO_ENC_H */
> diff --git a/drivers/media/virtio/virtio_video_helpers.c b/drivers/media/virtio/virtio_video_helpers.c
> new file mode 100644
> index 000000000000..bc4754e7ca78
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_video_helpers.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Driver for virtio video device.
> + *
> + * Copyright 2019 OpenSynergy GmbH.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "virtio_video.h"
> +
> +struct virtio_video_convert_table {
> +       uint32_t virtio_value;
> +       uint32_t v4l2_value;
> +};
> +
> +static struct virtio_video_convert_table level_table[] = {
> +       { VIRTIO_VIDEO_LEVEL_H264_1_0, V4L2_MPEG_VIDEO_H264_LEVEL_1_0 },
> +       { VIRTIO_VIDEO_LEVEL_H264_1_1, V4L2_MPEG_VIDEO_H264_LEVEL_1_1 },
> +       { VIRTIO_VIDEO_LEVEL_H264_1_2, V4L2_MPEG_VIDEO_H264_LEVEL_1_2 },
> +       { VIRTIO_VIDEO_LEVEL_H264_1_3, V4L2_MPEG_VIDEO_H264_LEVEL_1_3 },
> +       { VIRTIO_VIDEO_LEVEL_H264_2_0, V4L2_MPEG_VIDEO_H264_LEVEL_2_0 },
> +       { VIRTIO_VIDEO_LEVEL_H264_2_1, V4L2_MPEG_VIDEO_H264_LEVEL_2_1 },
> +       { VIRTIO_VIDEO_LEVEL_H264_2_2, V4L2_MPEG_VIDEO_H264_LEVEL_2_2 },
> +       { VIRTIO_VIDEO_LEVEL_H264_3_0, V4L2_MPEG_VIDEO_H264_LEVEL_3_0 },
> +       { VIRTIO_VIDEO_LEVEL_H264_3_1, V4L2_MPEG_VIDEO_H264_LEVEL_3_1 },
> +       { VIRTIO_VIDEO_LEVEL_H264_3_2, V4L2_MPEG_VIDEO_H264_LEVEL_3_2 },
> +       { VIRTIO_VIDEO_LEVEL_H264_4_0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0 },
> +       { VIRTIO_VIDEO_LEVEL_H264_4_1, V4L2_MPEG_VIDEO_H264_LEVEL_4_1 },
> +       { VIRTIO_VIDEO_LEVEL_H264_4_2, V4L2_MPEG_VIDEO_H264_LEVEL_4_2 },
> +       { VIRTIO_VIDEO_LEVEL_H264_5_0, V4L2_MPEG_VIDEO_H264_LEVEL_5_0 },
> +       { VIRTIO_VIDEO_LEVEL_H264_5_1, V4L2_MPEG_VIDEO_H264_LEVEL_5_1 },
> +       { 0 },
> +};
> +
> +uint32_t virtio_video_level_to_v4l2(uint32_t level)
> +{
> +       size_t idx;
> +
> +       for (idx = 0; idx < ARRAY_SIZE(level_table); idx++) {
> +               if (level_table[idx].virtio_value == level)
> +                       return level_table[idx].v4l2_value;
> +       }
> +
> +       return 0;

0 is a valid profile. e.g. V4L2_MPEG_VIDEO_H264_LEVEL_1_0 == 0.
How about returning a negative number for errors?

> +}
> +
> +uint32_t virtio_video_v4l2_level_to_virtio(uint32_t v4l2_level)
> +{
> +       size_t idx;
> +
> +       for (idx = 0; idx < ARRAY_SIZE(level_table); idx++) {
> +               if (level_table[idx].v4l2_value == v4l2_level)
> +                       return level_table[idx].virtio_value;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct virtio_video_convert_table profile_table[] = {
> +       { VIRTIO_VIDEO_PROFILE_H264_BASELINE,
> +               V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE },
> +       { VIRTIO_VIDEO_PROFILE_H264_MAIN, V4L2_MPEG_VIDEO_H264_PROFILE_MAIN },
> +       { VIRTIO_VIDEO_PROFILE_H264_EXTENDED,
> +               V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED },
> +       { VIRTIO_VIDEO_PROFILE_H264_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH },
> +       { VIRTIO_VIDEO_PROFILE_H264_HIGH10PROFILE,
> +               V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10 },
> +       { VIRTIO_VIDEO_PROFILE_H264_HIGH422PROFILE,
> +               V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422},
> +       { VIRTIO_VIDEO_PROFILE_H264_HIGH444PREDICTIVEPROFILE,
> +               V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE },
> +       { VIRTIO_VIDEO_PROFILE_H264_SCALABLEBASELINE,
> +               V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_BASELINE },
> +       { VIRTIO_VIDEO_PROFILE_H264_SCALABLEHIGH,
> +               V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH },
> +       { VIRTIO_VIDEO_PROFILE_H264_STEREOHIGH,
> +               V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH },
> +       { VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH,
> +               V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH },
> +       { 0 },

How about VP9's profiles?

> +};
> +
> +uint32_t virtio_video_profile_to_v4l2(uint32_t profile)
> +{
> +       size_t idx;
> +
> +       for (idx = 0; idx < ARRAY_SIZE(profile_table); idx++) {
> +               if (profile_table[idx].virtio_value == profile)
> +                       return profile_table[idx].v4l2_value;
> +       }
> +
> +       return 0;
> +}
> +
> +uint32_t virtio_video_v4l2_profile_to_virtio(uint32_t v4l2_profile)
> +{
> +       size_t idx;
> +
> +       for (idx = 0; idx < ARRAY_SIZE(profile_table); idx++) {
> +               if (profile_table[idx].v4l2_value == v4l2_profile)
> +                       return profile_table[idx].virtio_value;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct virtio_video_convert_table format_table[] = {
> +       { VIRTIO_VIDEO_FORMAT_ARGB8888, V4L2_PIX_FMT_ARGB32 },
> +       { VIRTIO_VIDEO_FORMAT_BGRA8888, V4L2_PIX_FMT_ABGR32 },
> +       { VIRTIO_VIDEO_FORMAT_NV12, V4L2_PIX_FMT_NV12 },
> +       { VIRTIO_VIDEO_FORMAT_YUV420, V4L2_PIX_FMT_YUV420 },
> +       { VIRTIO_VIDEO_FORMAT_YVU420, V4L2_PIX_FMT_YVU420 },
> +       { VIRTIO_VIDEO_FORMAT_MPEG2, V4L2_PIX_FMT_MPEG2 },
> +       { VIRTIO_VIDEO_FORMAT_MPEG4, V4L2_PIX_FMT_MPEG4 },
> +       { VIRTIO_VIDEO_FORMAT_H264, V4L2_PIX_FMT_H264 },
> +       { VIRTIO_VIDEO_FORMAT_HEVC, V4L2_PIX_FMT_HEVC },
> +       { VIRTIO_VIDEO_FORMAT_VP8, V4L2_PIX_FMT_VP8 },
> +       { VIRTIO_VIDEO_FORMAT_VP9, V4L2_PIX_FMT_VP9 },
> +       { 0 },
> +};
> +
> +uint32_t virtio_video_format_to_v4l2(uint32_t format)
> +{
> +       size_t idx;
> +
> +       for (idx = 0; idx < ARRAY_SIZE(format_table); idx++) {
> +               if (format_table[idx].virtio_value == format)
> +                       return format_table[idx].v4l2_value;
> +       }
> +
> +       return 0;
> +}
> +
> +uint32_t virtio_video_v4l2_format_to_virtio(uint32_t v4l2_format)
> +{
> +       size_t idx;
> +
> +       for (idx = 0; idx < ARRAY_SIZE(format_table); idx++) {
> +               if (format_table[idx].v4l2_value == v4l2_format)
> +                       return format_table[idx].virtio_value;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct virtio_video_convert_table control_table[] = {
> +       { VIRTIO_VIDEO_CONTROL_BITRATE, V4L2_CID_MPEG_VIDEO_BITRATE },
> +       { VIRTIO_VIDEO_CONTROL_PROFILE, V4L2_CID_MPEG_VIDEO_H264_PROFILE },
> +       { VIRTIO_VIDEO_CONTROL_LEVEL, V4L2_CID_MPEG_VIDEO_H264_LEVEL },
> +       { 0 },
> +};
> +
> +uint32_t virtio_video_control_to_v4l2(uint32_t control)
> +{
> +       size_t idx;
> +
> +       for (idx = 0; idx < ARRAY_SIZE(control_table); idx++) {
> +               if (control_table[idx].virtio_value == control)
> +                       return control_table[idx].v4l2_value;
> +       }
> +
> +       return 0;
> +}
> +
> +uint32_t virtio_video_v4l2_control_to_virtio(uint32_t v4l2_control)
> +{
> +       size_t idx;
> +
> +       for (idx = 0; idx < ARRAY_SIZE(control_table); idx++) {
> +               if (control_table[idx].v4l2_value == v4l2_control)
> +                       return control_table[idx].virtio_value;
> +       }
> +
> +       return 0;
> +}
> +
> +uint32_t virtio_video_get_format_from_virtio_profile(uint32_t virtio_profile)
> +{
> +       if (virtio_profile >= VIRTIO_VIDEO_PROFILE_H264_MIN &&
> +           virtio_profile <= VIRTIO_VIDEO_PROFILE_H264_MAX)
> +               return VIRTIO_VIDEO_FORMAT_H264;
> +       else if (virtio_profile >= VIRTIO_VIDEO_PROFILE_HEVC_MIN &&
> +                virtio_profile <= VIRTIO_VIDEO_PROFILE_HEVC_MAX)
> +               return VIRTIO_VIDEO_FORMAT_HEVC;
> +       else if (virtio_profile >= VIRTIO_VIDEO_PROFILE_VP8_MIN &&
> +                virtio_profile <= VIRTIO_VIDEO_PROFILE_VP8_MAX)
> +               return VIRTIO_VIDEO_FORMAT_VP8;
> +       else if (virtio_profile >= VIRTIO_VIDEO_PROFILE_VP9_MIN &&
> +                virtio_profile <= VIRTIO_VIDEO_PROFILE_VP9_MAX)
> +               return VIRTIO_VIDEO_FORMAT_VP9;
> +
> +       return 0;
> +}
> +
> +struct video_format *find_video_format(struct list_head *fmts_list,
> +                                      uint32_t format)
> +{
> +       struct video_format *fmt = NULL;
> +
> +       list_for_each_entry(fmt, fmts_list, formats_list_entry) {
> +               if (fmt->desc.format == format)
> +                       return fmt;
> +       }
> +
> +       return NULL;
> +}
> +
> +void virtio_video_format_from_info(struct video_format_info *info,
> +                                  struct v4l2_pix_format_mplane *pix_mp)
> +{
> +       int i;
> +
> +       pix_mp->width = info->frame_width;
> +       pix_mp->height = info->frame_height;
> +       pix_mp->field = V4L2_FIELD_NONE;
> +       pix_mp->colorspace = V4L2_COLORSPACE_REC709;
> +       pix_mp->xfer_func = 0;
> +       pix_mp->ycbcr_enc = 0;
> +       pix_mp->quantization = 0;
> +       memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
> +       memset(pix_mp->plane_fmt[0].reserved, 0,
> +              sizeof(pix_mp->plane_fmt[0].reserved));
> +
> +       pix_mp->num_planes = info->num_planes;
> +       pix_mp->pixelformat = info->fourcc_format;
> +
> +       for (i = 0; i < info->num_planes; i++) {
> +               pix_mp->plane_fmt[i].bytesperline =
> +                                        info->plane_format[i].stride;
> +               pix_mp->plane_fmt[i].sizeimage =
> +                                        info->plane_format[i].plane_size;
> +       }
> +}
> +
> +void virtio_video_format_fill_default_info(struct video_format_info *dst_info,
> +                                         struct video_format_info *src_info)
> +{
> +       memcpy(dst_info, src_info, sizeof(*dst_info));
> +}
> diff --git a/drivers/media/virtio/virtio_video_vq.c b/drivers/media/virtio/virtio_video_vq.c
> new file mode 100644
> index 000000000000..4679e6b49cf3
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_video_vq.c
> @@ -0,0 +1,1012 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Driver for virtio video device.
> + *
> + * Copyright 2019 OpenSynergy GmbH.
> + *
> + * Based on drivers/gpu/drm/virtio/virtgpu_vq.c
> + * Copyright (C) 2015 Red Hat, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "virtio_video.h"
> +
> +#define MAX_INLINE_CMD_SIZE   298
> +#define MAX_INLINE_RESP_SIZE  298
> +#define VBUFFER_SIZE          (sizeof(struct virtio_video_vbuffer) \
> +                              + MAX_INLINE_CMD_SIZE               \
> +                              + MAX_INLINE_RESP_SIZE)
> +
> +void virtio_video_resource_id_get(struct virtio_video *vv, uint32_t *id)

How about renaming virtio_video_resource_id_{get,put} to
{virtio_video_resource_id_alloc, remove}?
It sounds like a function "*_get" doesn't have any side effect but it does.

> +{
> +       int handle;
> +
> +       idr_preload(GFP_KERNEL);
> +       spin_lock(&vv->resource_idr_lock);
> +       handle = idr_alloc(&vv->resource_idr, NULL, 1, 0, GFP_NOWAIT);
> +       spin_unlock(&vv->resource_idr_lock);
> +       idr_preload_end();
> +       *id = handle;
> +}
> +
> +void virtio_video_resource_id_put(struct virtio_video *vv, uint32_t id)
> +{
> +       spin_lock(&vv->resource_idr_lock);
> +       idr_remove(&vv->resource_idr, id);
> +       spin_unlock(&vv->resource_idr_lock);
> +}
> +
> +void virtio_video_stream_id_get(struct virtio_video *vv,
> +                               struct virtio_video_stream *stream,
> +                               uint32_t *id)
> +{
> +       int handle;
> +
> +       idr_preload(GFP_KERNEL);
> +       spin_lock(&vv->stream_idr_lock);
> +       handle = idr_alloc(&vv->stream_idr, stream, 1, 0, 0);
> +       spin_unlock(&vv->stream_idr_lock);
> +       idr_preload_end();
> +       *id = handle;
> +}
> +
> +void virtio_video_stream_id_put(struct virtio_video *vv, uint32_t id)
> +{
> +       spin_lock(&vv->stream_idr_lock);
> +       idr_remove(&vv->stream_idr, id);
> +       spin_unlock(&vv->stream_idr_lock);
> +}
> +
> +void virtio_video_cmd_ack(struct virtqueue *vq)
> +{
> +       struct virtio_video *vv = vq->vdev->priv;
> +
> +       schedule_work(&vv->commandq.dequeue_work);
> +}
> +
> +void virtio_video_event_ack(struct virtqueue *vq)
> +{
> +       struct virtio_video *vv = vq->vdev->priv;
> +
> +       schedule_work(&vv->eventq.dequeue_work);
> +}
> +
> +static struct virtio_video_vbuffer *
> +virtio_video_get_vbuf(struct virtio_video *vv, int size,
> +                     int resp_size, void *resp_buf,
> +                     virtio_video_resp_cb resp_cb)
> +{
> +       struct virtio_video_vbuffer *vbuf;
> +
> +       vbuf = kmem_cache_alloc(vv->vbufs, GFP_KERNEL);
> +       if (!vbuf)
> +               return ERR_PTR(-ENOMEM);
> +       memset(vbuf, 0, VBUFFER_SIZE);
> +
> +       BUG_ON(size > MAX_INLINE_CMD_SIZE);
> +       vbuf->buf = (void *)vbuf + sizeof(*vbuf);
> +       vbuf->size = size;
> +
> +       vbuf->resp_cb = resp_cb;
> +       vbuf->resp_size = resp_size;
> +       if (resp_size <= MAX_INLINE_RESP_SIZE && !resp_buf)
> +               vbuf->resp_buf = (void *)vbuf->buf + size;
> +       else
> +               vbuf->resp_buf = resp_buf;
> +       BUG_ON(!vbuf->resp_buf);
> +
> +       return vbuf;
> +}
> +
> +static void free_vbuf(struct virtio_video *vv,
> +                     struct virtio_video_vbuffer *vbuf)
> +{
> +       if (!vbuf->resp_cb &&
> +           vbuf->resp_size > MAX_INLINE_RESP_SIZE)
> +               kfree(vbuf->resp_buf);
> +       kfree(vbuf->data_buf);
> +       kmem_cache_free(vv->vbufs, vbuf);
> +}
> +
> +static void reclaim_vbufs(struct virtqueue *vq, struct list_head *reclaim_list)
> +{
> +       struct virtio_video_vbuffer *vbuf;
> +       unsigned int len;
> +       struct virtio_video *vv = vq->vdev->priv;
> +       int freed = 0;
> +
> +       while ((vbuf = virtqueue_get_buf(vq, &len))) {
> +               list_add_tail(&vbuf->list, reclaim_list);
> +               freed++;
> +       }
> +       if (freed == 0)
> +               v4l2_dbg(1, vv->debug, &vv->v4l2_dev,
> +                        "zero vbufs reclaimed\n");
> +}
> +
> +static void detach_vbufs(struct virtqueue *vq, struct list_head *detach_list)
> +{
> +       struct virtio_video_vbuffer *vbuf;
> +
> +       while ((vbuf = virtqueue_detach_unused_buf(vq)) != NULL)
> +               list_add_tail(&vbuf->list, detach_list);
> +}
> +
> +static void virtio_video_deatch_vbufs(struct virtio_video *vv)
> +{
> +       struct list_head detach_list;
> +       struct virtio_video_vbuffer *entry, *tmp;
> +
> +       INIT_LIST_HEAD(&detach_list);
> +
> +       detach_vbufs(vv->eventq.vq, &detach_list);
> +       detach_vbufs(vv->commandq.vq, &detach_list);
> +
> +       if (list_empty(&detach_list))
> +               return;
> +
> +       list_for_each_entry_safe(entry, tmp, &detach_list, list) {
> +               list_del(&entry->list);
> +               free_vbuf(vv, entry);
> +       }
> +}
> +
> +int virtio_video_alloc_vbufs(struct virtio_video *vv)
> +{
> +       vv->vbufs =
> +               kmem_cache_create("virtio-video-vbufs", VBUFFER_SIZE,
> +                                 __alignof__(struct virtio_video_vbuffer), 0,
> +                                 NULL);
> +       if (!vv->vbufs)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +void virtio_video_free_vbufs(struct virtio_video *vv)
> +{
> +       virtio_video_deatch_vbufs(vv);
> +       kmem_cache_destroy(vv->vbufs);
> +       vv->vbufs = NULL;
> +}
> +
> +static void *virtio_video_alloc_req(struct virtio_video *vv,
> +                                   struct virtio_video_vbuffer **vbuffer_p,
> +                                   int size)
> +{
> +       struct virtio_video_vbuffer *vbuf;
> +
> +       vbuf = virtio_video_get_vbuf(vv, size,
> +                                    sizeof(struct virtio_video_cmd_hdr),
> +                                    NULL, NULL);
> +       if (IS_ERR(vbuf)) {
> +               *vbuffer_p = NULL;
> +               return ERR_CAST(vbuf);
> +       }
> +       *vbuffer_p = vbuf;
> +
> +       return vbuf->buf;
> +}
> +
> +static void *
> +virtio_video_alloc_req_resp(struct virtio_video *vv,
> +                           virtio_video_resp_cb cb,
> +                           struct virtio_video_vbuffer **vbuffer_p,
> +                           int req_size, int resp_size,
> +                           void *resp_buf)
> +{
> +       struct virtio_video_vbuffer *vbuf;
> +
> +       vbuf = virtio_video_get_vbuf(vv, req_size, resp_size, resp_buf, cb);
> +       if (IS_ERR(vbuf)) {
> +               *vbuffer_p = NULL;
> +               return ERR_CAST(vbuf);
> +       }
> +       *vbuffer_p = vbuf;
> +
> +       return vbuf->buf;
> +}
> +
> +void virtio_video_dequeue_cmd_func(struct work_struct *work)
> +{
> +       struct virtio_video *vv =
> +               container_of(work, struct virtio_video,
> +                            commandq.dequeue_work);
> +       struct list_head reclaim_list;
> +       struct virtio_video_vbuffer *entry, *tmp;
> +       struct virtio_video_cmd_hdr *resp;
> +
> +       INIT_LIST_HEAD(&reclaim_list);
> +       spin_lock(&vv->commandq.qlock);
> +       do {
> +               virtqueue_disable_cb(vv->commandq.vq);
> +               reclaim_vbufs(vv->commandq.vq, &reclaim_list);
> +
> +       } while (!virtqueue_enable_cb(vv->commandq.vq));
> +       spin_unlock(&vv->commandq.qlock);
> +
> +       list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
> +               resp = (struct virtio_video_cmd_hdr *)entry->resp_buf;
> +               if (resp->type >=
> +                   cpu_to_le32(VIRTIO_VIDEO_RESP_ERR_INVALID_OPERATION))
> +                       v4l2_dbg(1, vv->debug, &vv->v4l2_dev,
> +                                "response 0x%x\n", le32_to_cpu(resp->type));
> +               if (entry->resp_cb)
> +                       entry->resp_cb(vv, entry);
> +
> +               list_del(&entry->list);
> +               free_vbuf(vv, entry);
> +       }
> +       wake_up(&vv->commandq.ack_queue);
> +}
> +
> +void virtio_video_dequeue_event_func(struct work_struct *work)
> +{
> +       struct virtio_video *vv =
> +               container_of(work, struct virtio_video,
> +                            eventq.dequeue_work);
> +       struct list_head reclaim_list;
> +       struct virtio_video_vbuffer *entry, *tmp;
> +
> +       INIT_LIST_HEAD(&reclaim_list);
> +       spin_lock(&vv->eventq.qlock);
> +       do {
> +               virtqueue_disable_cb(vv->eventq.vq);
> +               reclaim_vbufs(vv->eventq.vq, &reclaim_list);
> +
> +       } while (!virtqueue_enable_cb(vv->eventq.vq));
> +       spin_unlock(&vv->eventq.qlock);
> +
> +       list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
> +               entry->resp_cb(vv, entry);
> +               list_del(&entry->list);
> +       }
> +       wake_up(&vv->eventq.ack_queue);
> +}
> +
> +static int
> +virtio_video_queue_cmd_buffer_locked(struct virtio_video *vv,
> +                                     struct virtio_video_vbuffer *vbuf)
> +{
> +       struct virtqueue *vq = vv->commandq.vq;
> +       struct scatterlist *sgs[3], vreq, vout, vresp;
> +       int outcnt = 0, incnt = 0;
> +       int ret;
> +
> +       if (!vv->vq_ready)
> +               return -ENODEV;
> +
> +       sg_init_one(&vreq, vbuf->buf, vbuf->size);
> +       sgs[outcnt + incnt] = &vreq;
> +       outcnt++;
> +
> +       if (vbuf->data_size) {
> +               sg_init_one(&vout, vbuf->data_buf, vbuf->data_size);
> +               sgs[outcnt + incnt] = &vout;
> +               outcnt++;
> +       }
> +
> +       if (vbuf->resp_size) {
> +               sg_init_one(&vresp, vbuf->resp_buf, vbuf->resp_size);
> +               sgs[outcnt + incnt] = &vresp;
> +               incnt++;
> +       }
> +
> +retry:
> +       ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
> +       if (ret == -ENOSPC) {
> +               spin_unlock(&vv->commandq.qlock);
> +               wait_event(vv->commandq.ack_queue, vq->num_free);
> +               spin_lock(&vv->commandq.qlock);
> +               goto retry;
> +       } else {
> +               virtqueue_kick(vq);
> +       }
> +
> +       return ret;
> +}
> +
> +static int virtio_video_queue_cmd_buffer(struct virtio_video *vv,
> +                                         struct virtio_video_vbuffer *vbuf)
> +{
> +       int ret;
> +
> +       spin_lock(&vv->commandq.qlock);
> +       ret = virtio_video_queue_cmd_buffer_locked(vv, vbuf);
> +       spin_unlock(&vv->commandq.qlock);
> +
> +       return ret;
> +}
> +
> +static int virtio_video_queue_event_buffer(struct virtio_video *vv,
> +                                          struct virtio_video_vbuffer *vbuf)
> +{
> +       int ret;
> +       struct scatterlist vresp;
> +       struct virtqueue *vq = vv->eventq.vq;
> +
> +       spin_lock(&vv->eventq.qlock);
> +       sg_init_one(&vresp, vbuf->resp_buf, vbuf->resp_size);
> +       ret = virtqueue_add_inbuf(vq, &vresp, 1, vbuf, GFP_ATOMIC);
> +       spin_unlock(&vv->eventq.qlock);
> +       if (ret)
> +               return ret;
> +
> +       virtqueue_kick(vq);
> +
> +       return 0;
> +}
> +
> +static void virtio_video_event_cb(struct virtio_video *vv,
> +                                 struct virtio_video_vbuffer *vbuf)
> +{
> +       int ret;
> +       struct virtio_video_stream *stream;
> +       struct virtio_video_event *event =
> +               (struct virtio_video_event *)vbuf->resp_buf;
> +
> +       stream = idr_find(&vv->stream_idr, event->stream_id);
> +       if (!stream) {
> +               v4l2_warn(&vv->v4l2_dev, "no stream %u found for event\n",
> +                         event->stream_id);
> +               return;
> +       }
> +
> +       switch (le32_to_cpu(event->event_type)) {
> +       case VIRTIO_VIDEO_EVENT_DECODER_RESOLUTION_CHANGED:
> +               virtio_video_cmd_get_params(vv, stream,
> +                                          VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
> +               virtio_video_queue_res_chg_event(stream);
> +               if (stream->state == STREAM_STATE_INIT) {
> +                       stream->state = STREAM_STATE_METADATA;
> +                       wake_up(&vv->wq);
> +               }
> +               break;
> +       default:
> +               v4l2_warn(&vv->v4l2_dev, "failed to queue event buffer\n");
> +               break;
> +       }
> +
> +       memset(vbuf->resp_buf, 0, vbuf->resp_size);
> +       ret = virtio_video_queue_event_buffer(vv, vbuf);
> +       if (ret)
> +               v4l2_warn(&vv->v4l2_dev, "queue event buffer failed\n");
> +}
> +
> +int virtio_video_alloc_events(struct virtio_video *vv, size_t num)
> +{
> +       int ret;
> +       size_t i;
> +       struct virtio_video_vbuffer *vbuf;
> +
> +       for (i = 0; i < num; i++) {
> +               vbuf = virtio_video_get_vbuf(vv, 0,
> +                                            sizeof(struct virtio_video_event),
> +                                            NULL, virtio_video_event_cb);
> +               if (IS_ERR(vbuf))
> +                       return PTR_ERR(vbuf);
> +
> +               ret = virtio_video_queue_event_buffer(vv, vbuf);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +int virtio_video_cmd_stream_create(struct virtio_video *vv, uint32_t stream_id,
> +                                  enum virtio_video_format format,
> +                                  const char *tag)
> +{
> +       struct virtio_video_stream_create *req_p;
> +       struct virtio_video_vbuffer *vbuf;
> +
> +       req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
> +       if (IS_ERR(req_p))
> +               return PTR_ERR(req_p);
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_STREAM_CREATE);
> +       req_p->hdr.stream_id = cpu_to_le32(stream_id);
> +       req_p->in_mem_type = cpu_to_le32(VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES);
> +       req_p->out_mem_type = cpu_to_le32(VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES);
> +       req_p->coded_format = cpu_to_le32(format);
> +       strncpy(req_p->tag, tag, sizeof(req_p->tag) - 1);
> +       req_p->tag[sizeof(req_p->tag) - 1] = 0;
> +
> +       return virtio_video_queue_cmd_buffer(vv, vbuf);
> +}
> +
> +int virtio_video_cmd_stream_destroy(struct virtio_video *vv, uint32_t stream_id)
> +{
> +       struct virtio_video_stream_destroy *req_p;
> +       struct virtio_video_vbuffer *vbuf;
> +
> +       req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
> +       if (IS_ERR(req_p))
> +               return PTR_ERR(req_p);
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_STREAM_DESTROY);
> +       req_p->hdr.stream_id = cpu_to_le32(stream_id);
> +
> +       return virtio_video_queue_cmd_buffer(vv, vbuf);
> +}
> +
> +int virtio_video_cmd_stream_drain(struct virtio_video *vv, uint32_t stream_id)
> +{
> +       struct virtio_video_stream_drain *req_p;
> +       struct virtio_video_vbuffer *vbuf;
> +
> +       req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
> +       if (IS_ERR(req_p))
> +               return PTR_ERR(req_p);
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_STREAM_DRAIN);
> +       req_p->hdr.stream_id = cpu_to_le32(stream_id);
> +
> +       return virtio_video_queue_cmd_buffer(vv, vbuf);
> +}
> +
> +int virtio_video_cmd_resource_create(struct virtio_video *vv,
> +                                    uint32_t stream_id, uint32_t resource_id,
> +                                    uint32_t queue_type,
> +                                    struct virtio_video_mem_entry *ents,
> +                                    unsigned int num_planes,
> +                                    unsigned int *num_entry)
> +{
> +       unsigned int i = 0, nents = 0;
> +       struct virtio_video_resource_create *req_p;
> +       struct virtio_video_vbuffer *vbuf;
> +
> +       req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
> +       if (IS_ERR(req_p))
> +               return PTR_ERR(req_p);
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_RESOURCE_CREATE);
> +       req_p->hdr.stream_id = cpu_to_le32(stream_id);
> +       req_p->resource_id = cpu_to_le32(resource_id);
> +       req_p->queue_type = cpu_to_le32(queue_type);
> +        req_p->num_planes = cpu_to_le32(num_planes);
> +
> +       for (i = 0; i < num_planes; i++) {
> +               nents += num_entry[i];
> +               req_p->num_entries[i] = cpu_to_le32(num_entry[i]);
> +       }
> +
> +       vbuf->data_buf = ents;
> +       vbuf->data_size = sizeof(*ents) * nents;
> +
> +       return virtio_video_queue_cmd_buffer(vv, vbuf);
> +}
> +
> +int virtio_video_cmd_resource_destroy_all(struct virtio_video *vv,
> +                                         struct virtio_video_stream *stream,
> +                                         enum virtio_video_queue_type qtype)
> +{
> +       struct virtio_video_resource_destroy_all *req_p;
> +       struct virtio_video_vbuffer *vbuf;
> +
> +       req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
> +       if (IS_ERR(req_p))
> +               return PTR_ERR(req_p);
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_RESOURCE_DESTROY_ALL);
> +       req_p->hdr.stream_id = cpu_to_le32(stream->stream_id);
> +       req_p->queue_type = cpu_to_le32(qtype);
> +
> +       return virtio_video_queue_cmd_buffer(vv, vbuf);

We should make DESTROY_ALL a synchrounous command.
It seems that stream->{src,dst}_destroyed is defined but not used.

> +}
> +
> +static void
> +virtio_video_cmd_resource_queue_cb(struct virtio_video *vv,
> +                                  struct virtio_video_vbuffer *vbuf)
> +{
> +       uint32_t flags, bytesused;
> +       uint64_t timestamp;
> +       struct virtio_video_buffer *virtio_vb = vbuf->priv;
> +       struct virtio_video_resource_queue_resp *resp =
> +               (struct virtio_video_resource_queue_resp *)vbuf->resp_buf;
> +
> +       flags = le32_to_cpu(resp->flags);
> +       bytesused = le32_to_cpu(resp->size);
> +       timestamp = le64_to_cpu(resp->timestamp);
> +
> +       virtio_video_buf_done(virtio_vb, flags, timestamp, bytesused);
> +}
> +
> +int virtio_video_cmd_resource_queue(struct virtio_video *vv, uint32_t stream_id,
> +                                   struct virtio_video_buffer *virtio_vb,
> +                                   uint32_t data_size[],
> +                                   uint8_t num_data_size, uint32_t queue_type)
> +{
> +       uint8_t i;
> +       struct virtio_video_resource_queue *req_p;
> +       struct virtio_video_resource_queue_resp *resp_p;
> +       struct virtio_video_vbuffer *vbuf;
> +       size_t resp_size = sizeof(struct virtio_video_resource_queue_resp);
> +
> +       req_p = virtio_video_alloc_req_resp(vv,
> +                                           &virtio_video_cmd_resource_queue_cb,
> +                                           &vbuf, sizeof(*req_p), resp_size,
> +                                           NULL);
> +       if (IS_ERR(req_p))
> +               return PTR_ERR(req_p);
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_RESOURCE_QUEUE);
> +       req_p->hdr.stream_id = cpu_to_le32(stream_id);
> +       req_p->queue_type = cpu_to_le32(queue_type);
> +       req_p->resource_id = cpu_to_le32(virtio_vb->resource_id);
> +       req_p->num_data_sizes = num_data_size;
> +       req_p->timestamp =
> +               cpu_to_le64(virtio_vb->v4l2_m2m_vb.vb.vb2_buf.timestamp);
> +
> +       for (i = 0; i < num_data_size; ++i)
> +               req_p->data_sizes[i] = cpu_to_le32(data_size[i]);
> +
> +       resp_p = (struct virtio_video_resource_queue_resp *)vbuf->resp_buf;
> +       memset(resp_p, 0, sizeof(*resp_p));
> +
> +       vbuf->priv = virtio_vb;
> +
> +       return virtio_video_queue_cmd_buffer(vv, vbuf);
> +}
> +
> +static void
> +virtio_video_cmd_queue_clear_cb(struct virtio_video *vv,
> +                               struct virtio_video_vbuffer *vbuf)
> +{
> +       struct virtio_video_stream *stream = vbuf->priv;
> +       struct virtio_video_queue_clear *req_p =
> +               (struct virtio_video_queue_clear *)vbuf->buf;
> +
> +       if (le32_to_cpu(req_p->queue_type) == VIRTIO_VIDEO_QUEUE_TYPE_INPUT)
> +               stream->src_cleared = true;
> +       else
> +               stream->dst_cleared = true;
> +
> +       wake_up(&vv->wq);
> +}
> +
> +int virtio_video_cmd_queue_clear(struct virtio_video *vv,
> +                                struct virtio_video_stream *stream,
> +                                uint32_t queue_type)
> +{
> +       struct virtio_video_queue_clear *req_p;
> +       struct virtio_video_vbuffer *vbuf;
> +
> +       req_p = virtio_video_alloc_req_resp
> +               (vv, &virtio_video_cmd_queue_clear_cb,
> +                &vbuf, sizeof(*req_p),
> +                sizeof(struct virtio_video_cmd_hdr), NULL);
> +       if (IS_ERR(req_p))
> +               return PTR_ERR(req_p);
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_QUEUE_CLEAR);
> +       req_p->hdr.stream_id = cpu_to_le32(stream->stream_id);
> +       req_p->queue_type = cpu_to_le32(queue_type);
> +
> +       vbuf->priv = stream;
> +
> +       return virtio_video_queue_cmd_buffer(vv, vbuf);
> +}
> +
> +static void
> +virtio_video_query_caps_cb(struct virtio_video *vv,
> +                          struct virtio_video_vbuffer *vbuf)
> +{
> +       bool *got_resp_p = vbuf->priv;
> +       *got_resp_p = true;
> +       wake_up(&vv->wq);
> +}
> +
> +int virtio_video_query_capability(struct virtio_video *vv, void *resp_buf,
> +                                 size_t resp_size, uint32_t queue_type)
> +{
> +       struct virtio_video_query_capability *req_p = NULL;
> +       struct virtio_video_vbuffer *vbuf = NULL;
> +
> +       if (!vv || !resp_buf)
> +               return -1;
> +
> +       req_p = virtio_video_alloc_req_resp(vv, &virtio_video_query_caps_cb,
> +                                           &vbuf, sizeof(*req_p), resp_size,
> +                                           resp_buf);
> +       if (IS_ERR(req_p))
> +               return -1;
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_QUERY_CAPABILITY);
> +       req_p->queue_type = cpu_to_le32(queue_type);
> +
> +       vbuf->priv = &vv->got_caps;
> +
> +       return virtio_video_queue_cmd_buffer(vv, vbuf);
> +}
> +
> +int virtio_video_query_control_level(struct virtio_video *vv, void *resp_buf,
> +                                    size_t resp_size, uint32_t format)
> +{
> +       struct virtio_video_query_control *req_p = NULL;
> +       struct virtio_video_query_control_level *ctrl_l = NULL;
> +       struct virtio_video_vbuffer *vbuf = NULL;
> +       uint32_t req_size = 0;
> +
> +       if (!vv || !resp_buf)
> +               return -1;
> +
> +       req_size = sizeof(struct virtio_video_query_control) +
> +               sizeof(struct virtio_video_query_control_level);
> +
> +       req_p = virtio_video_alloc_req_resp(vv, &virtio_video_query_caps_cb,
> +                                           &vbuf, req_size, resp_size,
> +                                           resp_buf);
> +       if (IS_ERR(req_p))
> +               return -1;
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_QUERY_CONTROL);
> +       req_p->control = cpu_to_le32(VIRTIO_VIDEO_CONTROL_LEVEL);
> +       ctrl_l = (void *)((char *)req_p +
> +                         sizeof(struct virtio_video_query_control));
> +       ctrl_l->format = cpu_to_le32(format);
> +
> +       vbuf->priv = &vv->got_control;
> +
> +       return virtio_video_queue_cmd_buffer(vv, vbuf);
> +}
> +
> +int virtio_video_query_control_profile(struct virtio_video *vv, void *resp_buf,
> +                                      size_t resp_size, uint32_t format)
> +{
> +       struct virtio_video_query_control *req_p = NULL;
> +       struct virtio_video_query_control_profile *ctrl_p = NULL;
> +       struct virtio_video_vbuffer *vbuf = NULL;
> +       uint32_t req_size = 0;
> +
> +       if (!vv || !resp_buf)
> +               return -1;
> +
> +       req_size = sizeof(struct virtio_video_query_control) +
> +               sizeof(struct virtio_video_query_control_profile);
> +
> +       req_p = virtio_video_alloc_req_resp(vv, &virtio_video_query_caps_cb,
> +                                           &vbuf, req_size, resp_size,
> +                                           resp_buf);
> +       if (IS_ERR(req_p))
> +               return -1;
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_QUERY_CONTROL);
> +       req_p->control = cpu_to_le32(VIRTIO_VIDEO_CONTROL_PROFILE);
> +       ctrl_p = (void *)((char *)req_p +
> +                         sizeof(struct virtio_video_query_control));
> +       ctrl_p->format = cpu_to_le32(format);
> +
> +       vbuf->priv = &vv->got_control;
> +
> +       return virtio_video_queue_cmd_buffer(vv, vbuf);
> +}
> +
> +static void
> +virtio_video_cmd_get_params_cb(struct virtio_video *vv,
> +                              struct virtio_video_vbuffer *vbuf)
> +{
> +       int i;
> +       struct virtio_video_get_params_resp *resp =
> +               (struct virtio_video_get_params_resp *)vbuf->resp_buf;
> +       struct virtio_video_params *params = &resp->params;
> +       struct virtio_video_stream *stream = vbuf->priv;
> +       enum virtio_video_queue_type queue_type;
> +       struct video_format_info *format_info = NULL;
> +
> +       queue_type = le32_to_cpu(params->queue_type);
> +       if (queue_type == VIRTIO_VIDEO_QUEUE_TYPE_INPUT)
> +               format_info = &stream->in_info;
> +       else
> +               format_info = &stream->out_info;
> +
> +       if (!format_info)
> +               return;
> +
> +       format_info->frame_rate = le32_to_cpu(params->frame_rate);
> +       format_info->frame_width = le32_to_cpu(params->frame_width);
> +       format_info->frame_height = le32_to_cpu(params->frame_height);
> +       format_info->min_buffers = le32_to_cpu(params->min_buffers);
> +       format_info->max_buffers = le32_to_cpu(params->max_buffers);
> +       format_info->fourcc_format =
> +               virtio_video_format_to_v4l2(le32_to_cpu(params->format));
> +
> +       format_info->crop.top = le32_to_cpu(params->crop.top);
> +       format_info->crop.left = le32_to_cpu(params->crop.left);
> +       format_info->crop.width = le32_to_cpu(params->crop.width);
> +       format_info->crop.height = le32_to_cpu(params->crop.height);
> +
> +       format_info->num_planes = le32_to_cpu(params->num_planes);
> +       for (i = 0; i < le32_to_cpu(params->num_planes); i++) {
> +               struct virtio_video_plane_format *plane_formats =
> +                                                &params->plane_formats[i];
> +               struct video_plane_format *plane_format =
> +                                                &format_info->plane_format[i];
> +
> +               plane_format->plane_size =
> +                                le32_to_cpu(plane_formats->plane_size);
> +               plane_format->stride = le32_to_cpu(plane_formats->stride);
> +       }
> +
> +       format_info->is_updated = true;
> +       wake_up(&vv->wq);
> +}
> +
> +int virtio_video_cmd_get_params(struct virtio_video *vv,
> +                              struct virtio_video_stream *stream,
> +                              uint32_t queue_type)
> +{
> +       int ret;
> +       struct virtio_video_get_params *req_p = NULL;
> +       struct virtio_video_vbuffer *vbuf = NULL;
> +       struct virtio_video_get_params_resp *resp_p;
> +       struct video_format_info *format_info = NULL;
> +       size_t resp_size = sizeof(struct virtio_video_get_params_resp);
> +
> +       if (!vv || !stream)
> +               return -1;
> +
> +       req_p = virtio_video_alloc_req_resp(vv,
> +                                       &virtio_video_cmd_get_params_cb,
> +                                       &vbuf, sizeof(*req_p), resp_size,
> +                                       NULL);
> +
> +       if (IS_ERR(req_p))
> +               return PTR_ERR(req_p);
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_GET_PARAMS);
> +       req_p->hdr.stream_id = cpu_to_le32(stream->stream_id);
> +       req_p->queue_type = cpu_to_le32(queue_type);
> +
> +       resp_p = (struct virtio_video_get_params_resp *)vbuf->resp_buf;
> +       memset(resp_p, 0, sizeof(*resp_p));
> +
> +       if (req_p->queue_type == VIRTIO_VIDEO_QUEUE_TYPE_INPUT)
> +               format_info = &stream->in_info;
> +       else
> +               format_info = &stream->out_info;
> +
> +       format_info->is_updated = false;
> +
> +       vbuf->priv = stream;
> +       ret = virtio_video_queue_cmd_buffer(vv, vbuf);
> +       if (ret)
> +               return ret;
> +
> +       ret = wait_event_timeout(vv->wq,
> +                                format_info->is_updated, 5 * HZ);
> +       if (ret == 0) {
> +               v4l2_err(&vv->v4l2_dev, "timed out waiting for get_params\n");
> +               return -1;
> +       }
> +       return 0;
> +}
> +
> +int
> +virtio_video_cmd_set_params(struct virtio_video *vv,
> +                           struct virtio_video_stream *stream,
> +                           struct video_format_info *format_info,
> +                           uint32_t queue_type)

I think we need to make SET_PARAMS synchronous?
Even get_params is synchrnous and called after set_params, get_params
can return parameters that is not changed by set_params.

> +{
> +       int i;
> +       struct virtio_video_set_params *req_p;
> +       struct virtio_video_vbuffer *vbuf;
> +
> +       req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
> +       if (IS_ERR(req_p))
> +               return PTR_ERR(req_p);
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_SET_PARAMS);
> +       req_p->hdr.stream_id = cpu_to_le32(stream->stream_id);
> +       req_p->params.queue_type = cpu_to_le32(queue_type);
> +       req_p->params.frame_rate = cpu_to_le32(format_info->frame_rate);
> +       req_p->params.frame_width = cpu_to_le32(format_info->frame_width);
> +       req_p->params.frame_height = cpu_to_le32(format_info->frame_height);
> +       req_p->params.format = virtio_video_v4l2_format_to_virtio(
> +                                cpu_to_le32(format_info->fourcc_format));
> +       req_p->params.min_buffers = cpu_to_le32(format_info->min_buffers);
> +       req_p->params.max_buffers = cpu_to_le32(format_info->max_buffers);
> +       req_p->params.num_planes = cpu_to_le32(format_info->num_planes);
> +
> +       for (i = 0; i < format_info->num_planes; i++) {
> +               struct virtio_video_plane_format *plane_formats =
> +                       &req_p->params.plane_formats[i];
> +               struct video_plane_format *plane_format =
> +                       &format_info->plane_format[i];
> +               plane_formats->plane_size =
> +                                cpu_to_le32(plane_format->plane_size);
> +               plane_formats->stride = cpu_to_le32(plane_format->stride);
> +       }
> +
> +       return virtio_video_queue_cmd_buffer(vv, vbuf);
> +}
> +
> +static void
> +virtio_video_cmd_get_ctrl_profile_cb(struct virtio_video *vv,
> +                                    struct virtio_video_vbuffer *vbuf)
> +{
> +       struct virtio_video_get_control_resp *resp =
> +               (struct virtio_video_get_control_resp *)vbuf->resp_buf;
> +       struct virtio_video_control_val_profile *resp_p = NULL;
> +       struct virtio_video_stream *stream = vbuf->priv;
> +       struct video_control_info *control = &stream->control;
> +
> +       if (!control)
> +               return;
> +
> +       resp_p = (void *)((char *) resp +
> +                         sizeof(struct virtio_video_get_control_resp));
> +
> +       control->profile = le32_to_cpu(resp_p->profile);
> +       control->is_updated = true;
> +       wake_up(&vv->wq);
> +}
> +
> +static void
> +virtio_video_cmd_get_ctrl_level_cb(struct virtio_video *vv,
> +                                  struct virtio_video_vbuffer *vbuf)
> +{
> +       struct virtio_video_get_control_resp *resp =
> +               (struct virtio_video_get_control_resp *)vbuf->resp_buf;
> +       struct virtio_video_control_val_level *resp_p = NULL;
> +       struct virtio_video_stream *stream = vbuf->priv;
> +       struct video_control_info *control = &stream->control;
> +
> +       if (!control)
> +               return;
> +
> +       resp_p = (void *)((char *)resp +
> +                         sizeof(struct virtio_video_get_control_resp));
> +
> +       control->level = le32_to_cpu(resp_p->level);
> +       control->is_updated = true;
> +       wake_up(&vv->wq);
> +}
> +
> +static void
> +virtio_video_cmd_get_ctrl_bitrate_cb(struct virtio_video *vv,
> +                                    struct virtio_video_vbuffer *vbuf)
> +{
> +       struct virtio_video_get_control_resp *resp =
> +               (struct virtio_video_get_control_resp *)vbuf->resp_buf;
> +       struct virtio_video_control_val_bitrate *resp_p = NULL;
> +       struct virtio_video_stream *stream = vbuf->priv;
> +       struct video_control_info *control = &stream->control;
> +
> +       if (!control)
> +               return;
> +
> +       resp_p = (void *)((char *) resp +
> +                         sizeof(struct virtio_video_get_control_resp));
> +
> +       control->bitrate = le32_to_cpu(resp_p->bitrate);
> +       control->is_updated = true;
> +       wake_up(&vv->wq);
> +}
> +
> +int virtio_video_cmd_get_control(struct virtio_video *vv,
> +                                struct virtio_video_stream *stream,
> +                                uint32_t virtio_ctrl)
> +{
> +       int ret = 0;
> +       struct virtio_video_get_control *req_p = NULL;
> +       struct virtio_video_get_control_resp *resp_p = NULL;
> +       struct virtio_video_vbuffer *vbuf = NULL;
> +       size_t resp_size = sizeof(struct virtio_video_get_control_resp);
> +       virtio_video_resp_cb cb;
> +
> +       if (!vv)
> +               return -1;
> +
> +       switch (virtio_ctrl) {
> +       case VIRTIO_VIDEO_CONTROL_PROFILE:
> +               resp_size += sizeof(struct virtio_video_control_val_profile);
> +               cb = &virtio_video_cmd_get_ctrl_profile_cb;
> +               break;
> +       case VIRTIO_VIDEO_CONTROL_LEVEL:
> +               resp_size += sizeof(struct virtio_video_control_val_level);
> +               cb = &virtio_video_cmd_get_ctrl_level_cb;
> +               break;
> +       case VIRTIO_VIDEO_CONTROL_BITRATE:
> +               resp_size += sizeof(struct virtio_video_control_val_bitrate);
> +               cb = &virtio_video_cmd_get_ctrl_bitrate_cb;
> +               break;
> +       default:
> +               return -1;
> +       }
> +
> +       req_p = virtio_video_alloc_req_resp(vv, cb, &vbuf,
> +                                           sizeof(*req_p), resp_size, NULL);
> +       if (IS_ERR(req_p))
> +               return PTR_ERR(req_p);
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_GET_CONTROL);
> +       req_p->hdr.stream_id = cpu_to_le32(stream->stream_id);
> +       req_p->control = cpu_to_le32(virtio_ctrl);
> +
> +       resp_p = (struct virtio_video_get_control_resp *)vbuf->resp_buf;
> +       memset(resp_p, 0, resp_size);
> +
> +       stream->control.is_updated = false;
> +
> +       vbuf->priv = stream;
> +       ret = virtio_video_queue_cmd_buffer(vv, vbuf);
> +       if (ret)
> +               return ret;
> +
> +       ret = wait_event_timeout(vv->wq, stream->control.is_updated, 5 * HZ);
> +       if (ret == 0) {
> +               v4l2_err(&vv->v4l2_dev, "timed out waiting for get_params\n");
> +               return -1;
> +       }
> +       return 0;
> +}
> +
> +int virtio_video_cmd_set_control(struct virtio_video *vv, uint32_t stream_id,
> +                                uint32_t control, uint32_t value)
> +{
> +       struct virtio_video_set_control *req_p = NULL;
> +       struct virtio_video_vbuffer *vbuf = NULL;
> +       struct virtio_video_control_val_level *ctrl_l = NULL;
> +       struct virtio_video_control_val_profile *ctrl_p = NULL;
> +       struct virtio_video_control_val_bitrate *ctrl_b = NULL;
> +       size_t size;
> +
> +       if (!vv || value == 0)
> +               return -EINVAL;
> +
> +       switch (control) {
> +       case VIRTIO_VIDEO_CONTROL_PROFILE:
> +               size = sizeof(struct virtio_video_control_val_profile);
> +               break;
> +       case VIRTIO_VIDEO_CONTROL_LEVEL:
> +               size = sizeof(struct virtio_video_control_val_level);
> +               break;
> +       case VIRTIO_VIDEO_CONTROL_BITRATE:
> +               size = sizeof(struct virtio_video_control_val_bitrate);
> +               break;
> +       default:
> +               return -1;
> +       }
> +
> +       req_p = virtio_video_alloc_req(vv, &vbuf, size + sizeof(*req_p));
> +       if (IS_ERR(req_p))
> +               return PTR_ERR(req_p);
> +
> +       req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_SET_CONTROL);
> +       req_p->hdr.stream_id = cpu_to_le32(stream_id);
> +       req_p->control = cpu_to_le32(control);
> +
> +       switch (control) {
> +       case VIRTIO_VIDEO_CONTROL_PROFILE:
> +               ctrl_p = (void *)((char *)req_p +
> +                                 sizeof(struct virtio_video_set_control));
> +               ctrl_p->profile = cpu_to_le32(value);
> +               break;
> +       case VIRTIO_VIDEO_CONTROL_LEVEL:
> +               ctrl_l = (void *)((char *)req_p +
> +                                sizeof(struct virtio_video_set_control));
> +               ctrl_l->level = cpu_to_le32(value);
> +               break;
> +       case VIRTIO_VIDEO_CONTROL_BITRATE:
> +               ctrl_b = (void *)((char *)req_p +
> +                                sizeof(struct virtio_video_set_control));
> +               ctrl_b->bitrate = cpu_to_le32(value);
> +               break;
> +       }
> +
> +       return virtio_video_queue_cmd_buffer(vv, vbuf);
> +}
> +
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index 6d5c3b2d4f4d..89dfc94ecaa3 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -43,5 +43,7 @@
>  #define VIRTIO_ID_INPUT        18 /* virtio input */
>  #define VIRTIO_ID_VSOCK        19 /* virtio vsock transport */
>  #define VIRTIO_ID_CRYPTO       20 /* virtio crypto */
> +#define VIRTIO_ID_VIDEO_ENC    30 /* virtio video encoder */
> +#define VIRTIO_ID_VIDEO_DEC    31 /* virtio video decoder */
>
>  #endif /* _LINUX_VIRTIO_IDS_H */
> diff --git a/include/uapi/linux/virtio_video.h b/include/uapi/linux/virtio_video.h
> new file mode 100644
> index 000000000000..0dd98a2237c6
> --- /dev/null
> +++ b/include/uapi/linux/virtio_video.h
> @@ -0,0 +1,469 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Virtio Video Device
> + *
> + * This header is BSD licensed so anyone can use the definitions
> + * to implement compatible drivers/servers:
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in the
> + *    documentation and/or other materials provided with the distribution.
> + * 3. Neither the name of IBM nor the names of its contributors
> + *    may be used to endorse or promote products derived from this software
> + *    without specific prior written permission.
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> + * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> + * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
> + * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL IBM OR
> + * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> + * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> + * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
> + * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
> + * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
> + * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
> + * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> + * SUCH DAMAGE.
> + *
> + * Copyright (C) 2019 OpenSynergy GmbH.
> + */
> +
> +#ifndef _UAPI_LINUX_VIRTIO_VIDEO_H
> +#define _UAPI_LINUX_VIRTIO_VIDEO_H
> +
> +#include <linux/types.h>
> +#include <linux/virtio_config.h>
> +
> +/*
> + * Feature bits
> + */
> +
> +/* Guest pages can be used for video buffers. */
> +#define VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES 0
> +/*
> + * The host can process buffers even if they are non-contiguous memory such as
> + * scatter-gather lists.
> + */
> +#define VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG 1
> +
> +/*
> + * Image formats
> + */
> +
> +enum virtio_video_format {
> +       /* Raw formats */
> +       VIRTIO_VIDEO_FORMAT_RAW_MIN = 1,
> +       VIRTIO_VIDEO_FORMAT_ARGB8888 = VIRTIO_VIDEO_FORMAT_RAW_MIN,
> +       VIRTIO_VIDEO_FORMAT_BGRA8888,
> +       VIRTIO_VIDEO_FORMAT_NV12, /* 12  Y/CbCr 4:2:0  */
> +       VIRTIO_VIDEO_FORMAT_YUV420, /* 12  YUV 4:2:0     */
> +       VIRTIO_VIDEO_FORMAT_YVU420, /* 12  YVU 4:2:0     */
> +       VIRTIO_VIDEO_FORMAT_RAW_MAX = VIRTIO_VIDEO_FORMAT_YVU420,
> +
> +       /* Coded formats */
> +       VIRTIO_VIDEO_FORMAT_CODED_MIN = 0x1000,
> +       VIRTIO_VIDEO_FORMAT_MPEG2 =
> +               VIRTIO_VIDEO_FORMAT_CODED_MIN, /* MPEG-2 Part 2 */
> +       VIRTIO_VIDEO_FORMAT_MPEG4, /* MPEG-4 Part 2 */
> +       VIRTIO_VIDEO_FORMAT_H264, /* H.264 */
> +       VIRTIO_VIDEO_FORMAT_HEVC, /* HEVC aka H.265*/
> +       VIRTIO_VIDEO_FORMAT_VP8, /* VP8 */
> +       VIRTIO_VIDEO_FORMAT_VP9, /* VP9 */
> +       VIRTIO_VIDEO_FORMAT_CODED_MAX = VIRTIO_VIDEO_FORMAT_VP9,
> +};
> +
> +enum virtio_video_profile {
> +       /* H.264 */
> +       VIRTIO_VIDEO_PROFILE_H264_MIN = 0x100,
> +       VIRTIO_VIDEO_PROFILE_H264_BASELINE = VIRTIO_VIDEO_PROFILE_H264_MIN,
> +       VIRTIO_VIDEO_PROFILE_H264_MAIN,
> +       VIRTIO_VIDEO_PROFILE_H264_EXTENDED,
> +       VIRTIO_VIDEO_PROFILE_H264_HIGH,
> +       VIRTIO_VIDEO_PROFILE_H264_HIGH10PROFILE,
> +       VIRTIO_VIDEO_PROFILE_H264_HIGH422PROFILE,
> +       VIRTIO_VIDEO_PROFILE_H264_HIGH444PREDICTIVEPROFILE,
> +       VIRTIO_VIDEO_PROFILE_H264_SCALABLEBASELINE,
> +       VIRTIO_VIDEO_PROFILE_H264_SCALABLEHIGH,
> +       VIRTIO_VIDEO_PROFILE_H264_STEREOHIGH,
> +       VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH,
> +       VIRTIO_VIDEO_PROFILE_H264_MAX = VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH,
> +
> +       /* HEVC */
> +       VIRTIO_VIDEO_PROFILE_HEVC_MIN = 0x200,
> +       VIRTIO_VIDEO_PROFILE_HEVC_MAIN = VIRTIO_VIDEO_PROFILE_HEVC_MIN,
> +       VIRTIO_VIDEO_PROFILE_HEVC_MAIN10,
> +       VIRTIO_VIDEO_PROFILE_HEVC_MAIN_STILL_PICTURE,
> +       VIRTIO_VIDEO_PROFILE_HEVC_MAX =
> +               VIRTIO_VIDEO_PROFILE_HEVC_MAIN_STILL_PICTURE,
> +
> +       /* VP8 */
> +       VIRTIO_VIDEO_PROFILE_VP8_MIN = 0x300,
> +       VIRTIO_VIDEO_PROFILE_VP8_PROFILE0 = VIRTIO_VIDEO_PROFILE_VP8_MIN,
> +       VIRTIO_VIDEO_PROFILE_VP8_PROFILE1,
> +       VIRTIO_VIDEO_PROFILE_VP8_PROFILE2,
> +       VIRTIO_VIDEO_PROFILE_VP8_PROFILE3,
> +       VIRTIO_VIDEO_PROFILE_VP8_MAX = VIRTIO_VIDEO_PROFILE_VP8_PROFILE3,
> +
> +       /* VP9 */
> +       VIRTIO_VIDEO_PROFILE_VP9_MIN = 0x400,
> +       VIRTIO_VIDEO_PROFILE_VP9_PROFILE0 = VIRTIO_VIDEO_PROFILE_VP9_MIN,
> +       VIRTIO_VIDEO_PROFILE_VP9_PROFILE1,
> +       VIRTIO_VIDEO_PROFILE_VP9_PROFILE2,
> +       VIRTIO_VIDEO_PROFILE_VP9_PROFILE3,
> +       VIRTIO_VIDEO_PROFILE_VP9_MAX = VIRTIO_VIDEO_PROFILE_VP9_PROFILE3,
> +};
> +
> +enum virtio_video_level {
> +       /* H.264 */
> +       VIRTIO_VIDEO_LEVEL_H264_MIN = 0x100,
> +       VIRTIO_VIDEO_LEVEL_H264_1_0 = VIRTIO_VIDEO_LEVEL_H264_MIN,
> +       VIRTIO_VIDEO_LEVEL_H264_1_1,
> +       VIRTIO_VIDEO_LEVEL_H264_1_2,
> +       VIRTIO_VIDEO_LEVEL_H264_1_3,
> +       VIRTIO_VIDEO_LEVEL_H264_2_0,
> +       VIRTIO_VIDEO_LEVEL_H264_2_1,
> +       VIRTIO_VIDEO_LEVEL_H264_2_2,
> +       VIRTIO_VIDEO_LEVEL_H264_3_0,
> +       VIRTIO_VIDEO_LEVEL_H264_3_1,
> +       VIRTIO_VIDEO_LEVEL_H264_3_2,
> +       VIRTIO_VIDEO_LEVEL_H264_4_0,
> +       VIRTIO_VIDEO_LEVEL_H264_4_1,
> +       VIRTIO_VIDEO_LEVEL_H264_4_2,
> +       VIRTIO_VIDEO_LEVEL_H264_5_0,
> +       VIRTIO_VIDEO_LEVEL_H264_5_1,
> +       VIRTIO_VIDEO_LEVEL_H264_MAX = VIRTIO_VIDEO_LEVEL_H264_5_1,
> +};
> +
> +/*
> + * Config
> + */
> +
> +struct virtio_video_config {
> +       __le32 version;
> +       __le32 max_caps_length;
> +       __le32 max_resp_length;
> +};
> +
> +/*
> + * Commands
> + */
> +
> +enum virtio_video_cmd_type {
> +       /* Command */
> +       VIRTIO_VIDEO_CMD_QUERY_CAPABILITY = 0x0100,
> +       VIRTIO_VIDEO_CMD_STREAM_CREATE,
> +       VIRTIO_VIDEO_CMD_STREAM_DESTROY,
> +       VIRTIO_VIDEO_CMD_STREAM_DRAIN,
> +       VIRTIO_VIDEO_CMD_RESOURCE_CREATE,
> +       VIRTIO_VIDEO_CMD_RESOURCE_QUEUE,
> +       VIRTIO_VIDEO_CMD_RESOURCE_DESTROY_ALL,
> +       VIRTIO_VIDEO_CMD_QUEUE_CLEAR,
> +       VIRTIO_VIDEO_CMD_GET_PARAMS,
> +       VIRTIO_VIDEO_CMD_SET_PARAMS,
> +       VIRTIO_VIDEO_CMD_QUERY_CONTROL,
> +       VIRTIO_VIDEO_CMD_GET_CONTROL,
> +       VIRTIO_VIDEO_CMD_SET_CONTROL,
> +
> +       /* Response */
> +       VIRTIO_VIDEO_RESP_OK_NODATA = 0x0200,
> +       VIRTIO_VIDEO_RESP_OK_QUERY_CAPABILITY,
> +       VIRTIO_VIDEO_RESP_OK_RESOURCE_QUEUE,
> +       VIRTIO_VIDEO_RESP_OK_GET_PARAMS,
> +       VIRTIO_VIDEO_RESP_OK_QUERY_CONTROL,
> +       VIRTIO_VIDEO_RESP_OK_GET_CONTROL,
> +
> +       VIRTIO_VIDEO_RESP_ERR_INVALID_OPERATION = 0x0300,
> +       VIRTIO_VIDEO_RESP_ERR_OUT_OF_MEMORY,
> +       VIRTIO_VIDEO_RESP_ERR_INVALID_STREAM_ID,
> +       VIRTIO_VIDEO_RESP_ERR_INVALID_RESOURCE_ID,
> +       VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER,
> +       VIRTIO_VIDEO_RESP_ERR_UNSUPPORTED_CONTROL,
> +};
> +
> +struct virtio_video_cmd_hdr {
> +       __le32 type; /* One of enum virtio_video_cmd_type */
> +       __le32 stream_id;
> +};
> +
> +/* VIRTIO_VIDEO_CMD_QUERY_CAPABILITY */
> +enum virtio_video_queue_type {
> +       VIRTIO_VIDEO_QUEUE_TYPE_INPUT = 0x100,
> +       VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT,
> +};
> +
> +struct virtio_video_query_capability {
> +       struct virtio_video_cmd_hdr hdr;
> +       __le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +       __u8 padding[4];
> +};
> +
> +enum virtio_video_planes_layout_flag {
> +       VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER = 1 << 0,
> +       VIRTIO_VIDEO_PLANES_LAYOUT_PER_PLANE = 1 << 1,
> +};
> +
> +struct virtio_video_format_range {
> +       __le32 min;
> +       __le32 max;
> +       __le32 step;
> +       __u8 padding[4];
> +};
> +
> +struct virtio_video_format_frame {
> +       struct virtio_video_format_range width;
> +       struct virtio_video_format_range height;
> +       __le32 num_rates;
> +       __u8 padding[4];
> +       /* Followed by struct virtio_video_format_range frame_rates[] */
> +};
> +
> +struct virtio_video_format_desc {
> +       __le64 mask;
> +       __le32 format; /* One of VIRTIO_VIDEO_FORMAT_* types */
> +       __le32 planes_layout; /* Bitmask with VIRTIO_VIDEO_PLANES_LAYOUT_* */
> +       __le32 plane_align;
> +       __le32 num_frames;
> +       /* Followed by struct virtio_video_format_frame frames[] */
> +};
> +
> +struct virtio_video_query_capability_resp {
> +       struct virtio_video_cmd_hdr hdr;
> +       __le32 num_descs;
> +       __u8 padding[4];
> +       /* Followed by struct virtio_video_format_desc descs[] */
> +};
> +
> +/* VIRTIO_VIDEO_CMD_STREAM_CREATE */
> +enum virtio_video_mem_type {
> +       VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES,
> +};
> +
> +struct virtio_video_stream_create {
> +       struct virtio_video_cmd_hdr hdr;
> +       __le32 in_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
> +       __le32 out_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
> +       __le32 coded_format; /* One of VIRTIO_VIDEO_FORMAT_* types */
> +       __u8 padding[4];
> +       __u8 tag[64];
> +};
> +
> +/* VIRTIO_VIDEO_CMD_STREAM_DESTROY */
> +struct virtio_video_stream_destroy {
> +       struct virtio_video_cmd_hdr hdr;
> +};
> +
> +/* VIRTIO_VIDEO_CMD_STREAM_DRAIN */
> +struct virtio_video_stream_drain {
> +       struct virtio_video_cmd_hdr hdr;
> +};
> +
> +/* VIRTIO_VIDEO_CMD_RESOURCE_CREATE */
> +struct virtio_video_mem_entry {
> +       __le64 addr;
> +       __le32 length;
> +       __u8 padding[4];
> +};
> +
> +#define VIRTIO_VIDEO_MAX_PLANES 8
> +
> +struct virtio_video_resource_create {
> +       struct virtio_video_cmd_hdr hdr;
> +       __le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +       __le32 resource_id;
> +       __le32 planes_layout;
> +       __le32 num_planes;
> +       __le32 plane_offsets[VIRTIO_VIDEO_MAX_PLANES];
> +       __le32 num_entries[VIRTIO_VIDEO_MAX_PLANES];
> +       /* Followed by struct virtio_video_mem_entry entries[] */
> +};
> +
> +/* VIRTIO_VIDEO_CMD_RESOURCE_QUEUE */
> +struct virtio_video_resource_queue {
> +       struct virtio_video_cmd_hdr hdr;
> +       __le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +       __le32 resource_id;
> +       __le64 timestamp;
> +       __le32 num_data_sizes;
> +       __le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
> +       __u8 padding[4];
> +};
> +
> +enum virtio_video_buffer_flag {
> +       VIRTIO_VIDEO_BUFFER_FLAG_ERR = 0x0001,
> +       VIRTIO_VIDEO_BUFFER_FLAG_EOS = 0x0002,
> +
> +       /* Encoder only */
> +       VIRTIO_VIDEO_BUFFER_FLAG_IFRAME = 0x0004,
> +       VIRTIO_VIDEO_BUFFER_FLAG_PFRAME = 0x0008,
> +       VIRTIO_VIDEO_BUFFER_FLAG_BFRAME = 0x0010,
> +};
> +
> +struct virtio_video_resource_queue_resp {
> +       struct virtio_video_cmd_hdr hdr;
> +       __le64 timestamp;
> +       __le32 flags; /* One of VIRTIO_VIDEO_BUFFER_FLAG_* flags */
> +       __le32 size; /* Encoded size */
> +};
> +
> +/* VIRTIO_VIDEO_CMD_RESOURCE_DESTROY_ALL */
> +struct virtio_video_resource_destroy_all {
> +       struct virtio_video_cmd_hdr hdr;
> +       __le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +       __u8 padding[4];
> +};
> +
> +/* VIRTIO_VIDEO_CMD_QUEUE_CLEAR */
> +struct virtio_video_queue_clear {
> +       struct virtio_video_cmd_hdr hdr;
> +       __le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +       __u8 padding[4];
> +};
> +
> +/* VIRTIO_VIDEO_CMD_GET_PARAMS */
> +struct virtio_video_plane_format {
> +       __le32 plane_size;
> +       __le32 stride;
> +};
> +
> +struct virtio_video_crop {
> +       __le32 left;
> +       __le32 top;
> +       __le32 width;
> +       __le32 height;
> +};
> +
> +struct virtio_video_params {
> +       __le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +       __le32 format; /* One of VIRTIO_VIDEO_FORMAT_* types */
> +       __le32 frame_width;
> +       __le32 frame_height;
> +       __le32 min_buffers;
> +       __le32 max_buffers;
> +       struct virtio_video_crop crop;
> +       __le32 frame_rate;
> +       __le32 num_planes;
> +       struct virtio_video_plane_format plane_formats[VIRTIO_VIDEO_MAX_PLANES];
> +};
> +
> +struct virtio_video_get_params {
> +       struct virtio_video_cmd_hdr hdr;
> +       __le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +       __u8 padding[4];
> +};
> +
> +struct virtio_video_get_params_resp {
> +       struct virtio_video_cmd_hdr hdr;
> +       struct virtio_video_params params;
> +};
> +
> +/* VIRTIO_VIDEO_CMD_SET_PARAMS */
> +struct virtio_video_set_params {
> +       struct virtio_video_cmd_hdr hdr;
> +       struct virtio_video_params params;
> +};
> +
> +/* VIRTIO_VIDEO_CMD_QUERY_CONTROL */
> +enum virtio_video_control_type {
> +       VIRTIO_VIDEO_CONTROL_BITRATE = 1,
> +       VIRTIO_VIDEO_CONTROL_PROFILE,
> +       VIRTIO_VIDEO_CONTROL_LEVEL,
> +};
> +
> +struct virtio_video_query_control_profile {
> +       __le32 format; /* One of VIRTIO_VIDEO_FORMAT_* */
> +       __u8 padding[4];
> +};
> +
> +struct virtio_video_query_control_level {
> +       __le32 format; /* One of VIRTIO_VIDEO_FORMAT_* */
> +       __u8 padding[4];
> +};
> +
> +struct virtio_video_query_control {
> +       struct virtio_video_cmd_hdr hdr;
> +       __le32 control; /* One of VIRTIO_VIDEO_CONTROL_* types */
> +       __u8 padding[4];
> +       /*
> +        * Followed by a value of struct virtio_video_query_control_*
> +        * in accordance with the value of control.
> +        */
> +};
> +
> +struct virtio_video_query_control_resp_profile {
> +       __le32 num;
> +       __u8 padding[4];
> +       /* Followed by an array le32 profiles[] */
> +};
> +
> +struct virtio_video_query_control_resp_level {
> +       __le32 num;
> +       __u8 padding[4];
> +       /* Followed by an array le32 level[] */
> +};
> +
> +struct virtio_video_query_control_resp {
> +       struct virtio_video_cmd_hdr hdr;
> +       /* Followed by one of struct virtio_video_query_control_resp_* */
> +};
> +
> +/* VIRTIO_VIDEO_CMD_GET_CONTROL */
> +struct virtio_video_get_control {
> +       struct virtio_video_cmd_hdr hdr;
> +       __le32 control; /* One of VIRTIO_VIDEO_CONTROL_* types */
> +       __u8 padding[4];
> +};
> +
> +struct virtio_video_control_val_bitrate {
> +       __le32 bitrate;
> +       __u8 padding[4];
> +};
> +
> +struct virtio_video_control_val_profile {
> +       __le32 profile;
> +       __u8 padding[4];
> +};
> +
> +struct virtio_video_control_val_level {
> +       __le32 level;
> +       __u8 padding[4];
> +};
> +
> +struct virtio_video_get_control_resp {
> +       struct virtio_video_cmd_hdr hdr;
> +       /* Followed by one of struct virtio_video_control_val_* */
> +};
> +
> +/* VIRTIO_VIDEO_CMD_SET_CONTROL */
> +struct virtio_video_set_control {
> +       struct virtio_video_cmd_hdr hdr;
> +       __le32 control; /* One of VIRTIO_VIDEO_CONTROL_* types */
> +       __u8 padding[4];
> +       /* Followed by one of struct virtio_video_control_val_* */
> +};
> +
> +struct virtio_video_set_control_resp {
> +       struct virtio_video_cmd_hdr hdr;
> +};
> +
> +/*
> + * Events
> + */
> +
> +enum virtio_video_event_type {
> +       /* For all devices */
> +       VIRTIO_VIDEO_EVENT_ERROR = 0x0100,
> +
> +       /* For decoder only */
> +       VIRTIO_VIDEO_EVENT_DECODER_RESOLUTION_CHANGED = 0x0200,
> +};
> +
> +struct virtio_video_event {
> +       __le32 event_type; /* One of VIRTIO_VIDEO_EVENT_* types */
> +       __le32 stream_id;
> +};
> +
> +#endif /* _UAPI_LINUX_VIRTIO_VIDEO_H */

> --
> 2.25.0
>

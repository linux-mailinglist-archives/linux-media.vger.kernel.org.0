Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 521C2F2944
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 09:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbfKGIg1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 03:36:27 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35899 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbfKGIg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 03:36:27 -0500
Received: by mail-lf1-f68.google.com with SMTP id m6so935981lfl.3
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 00:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M1rwd9fhmcDDMfIL/XkkyVH7uylRUi4Jyf7B+v9fz2E=;
        b=fC7qJFO0f1sJ4/CrZ2koyP33RgzS1/i3OeqbpqC+K00fCHrpiaTGl9gSmMY9TDumJD
         KS9MYEweLMWz+ek+3RQUolwDHHL+mNl7AQneGziA44AyJtk3OvucmP3z6O1MxwnOBMPr
         Ovi7QdbY1UfuQjJ9tPq69WDQCId9hDw0mCL5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M1rwd9fhmcDDMfIL/XkkyVH7uylRUi4Jyf7B+v9fz2E=;
        b=FPJo9cigYq2gRME99BEX2TJCKpCyZUPL46YTGfhHyzoxbhYtyYeR5zMcgU9Pvd2I2n
         0zYdsn+OV9Yi+jerOoSlGWOrjF+HwBaUM1YaL55UUUhuWPVyEJ4H3Ix/Ltel/tAU9fs1
         MLKxh6MHAHXEVC9ovqFAtdGhtbG/yYf4fPvLDWG+PbRSPSt8Y/blx3VS8PHwRlCHN0z2
         QVjnVATYF53tVJ+kS22Y88bT1JH+iIbFhYLLAd8MK1yKkRolWJrDkeT55cNr2dxx+IRL
         KCu07OhBoWS2lz+CL2p7dycAyjKc9FfL67Pc/FLSzhOUgWl/tJ122Ktc8++QS8lvON50
         PNNw==
X-Gm-Message-State: APjAAAXB8tt5TNehYIDqhCXSPNszbqRvaLeBRGxFUUhSAf9ccXyfifgd
        r3r1Pda5MMKTmD1DGxhB+v37PAM/YbU9HZxtkPahBOhtHeg=
X-Google-Smtp-Source: APXvYqx9a6h9mnZudXKfktQLC2CLmGU7rVprlfcBN7a0/Yy177cjQ4A/AqkwTGl+hc3yg/PCU26NSY5aTcE8ECqYJlc=
X-Received: by 2002:a19:f608:: with SMTP id x8mr1596607lfe.112.1573115779219;
 Thu, 07 Nov 2019 00:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20191031071127.187836-1-keiichiw@chromium.org>
In-Reply-To: <20191031071127.187836-1-keiichiw@chromium.org>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Thu, 7 Nov 2019 17:36:07 +0900
Message-ID: <CAD90VcY5PbWwy3a=a2mTDGZSo-Nsiro5jx1yTWLUR0MDLwjSyA@mail.gmail.com>
Subject: Re: [RFC PATCH] media: pci: Add VirtIO video decoder driver
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Enrico Granata <egranata@google.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Lingfeng Yang <lfy@google.com>,
        David Stevens <stevensd@chromium.org>,
        nicolas.dufresne@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

Gentle ping.

-Keiichi

On Thu, Oct 31, 2019 at 4:11 PM Keiichi Watanabe <keiichiw@chromium.org> wrote:
>
> This patch adds a VirtIO video decoder driver, which provides a
> functionality of hardware accelerated video decoding in virtual
> machines. This implementation complies with the draft of the
> virtio-vdec specification we recently proposed in virtio-dev ML [1,2].
> PDF version of the draft is available in [3].
>
> This driver provides V4L2 stateful video decoder interface [4].
>
> We tested this driver on a VM in ChromeOS (Google Pixelbook). The
> guest kernel's version is 4.19 and host's version is 4.4. We used
> crosvm [5] as a VMM here. Patches for the host-side virtio-vdec device
> are shown in [6].
> Note that the device doesn't communicate with the host's hardware
> directly. Instead, it uses Chrome's video decoder APIs provided in
> ChromeOS.
>
> As this is still under development, we have following limitations:
> * Dynamic resolution change is not supported.
> * It assumes that both OUTPUT/CAPTURE buffers are allocated as
>   DMA-bufs via virtio-gpu and passed as resource handles exported by
>   [7]. We're discussing a better approach in the threads of [1,7].
> * It assumes that the user pass an integer via vb2_plane's data_offset
>   to use it as |timestamp| in virtio-vdec. So, we needed a local
>   patch [8].
> * Several TODO comments are still remaining.
>
> Any feedback will be really appreciated. Thanks in advance!
>
> [1]: https://markmail.org/message/f2lxoyxltenqcq4t (virtio-dev)
> [2]: https://patchwork.kernel.org/patch/11151995/ (LKML)
> [3]: https://drive.google.com/corp/drive/u/1/folders/1hed-mTVI7dj0M_iab4DTfx5kPMLoeX8R
> [4]: https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/dev-decoder.html
> [5]: https://chromium.googlesource.com/chromiumos/platform/crosvm/
> [6]: https://chromium-review.googlesource.com/q/hashtag:%22virtio-vdec-device%22
> [7]: https://patchwork.freedesktop.org/patch/330305/
> [8]: https://crrev.com/c/1772842/6
>
> Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
> ---
>  drivers/media/pci/Kconfig                   |    2 +
>  drivers/media/pci/Makefile                  |    1 +
>  drivers/media/pci/virtio-vdec/Kconfig       |   11 +
>  drivers/media/pci/virtio-vdec/Makefile      |    2 +
>  drivers/media/pci/virtio-vdec/virtio_vdec.c | 2240 +++++++++++++++++++
>  include/uapi/linux/virtio_ids.h             |    1 +
>  include/uapi/linux/virtio_vdec.h            |  224 ++
>  7 files changed, 2481 insertions(+)
>  create mode 100644 drivers/media/pci/virtio-vdec/Kconfig
>  create mode 100644 drivers/media/pci/virtio-vdec/Makefile
>  create mode 100644 drivers/media/pci/virtio-vdec/virtio_vdec.c
>  create mode 100644 include/uapi/linux/virtio_vdec.h
>
> diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
> index dcb3719f440e..b70d68f7cae1 100644
> --- a/drivers/media/pci/Kconfig
> +++ b/drivers/media/pci/Kconfig
> @@ -9,6 +9,8 @@ menuconfig MEDIA_PCI_SUPPORT
>
>  if MEDIA_PCI_SUPPORT
>
> +source "drivers/media/pci/virtio-vdec/Kconfig"
> +
>  if MEDIA_CAMERA_SUPPORT
>         comment "Media capture support"
>  source "drivers/media/pci/meye/Kconfig"
> diff --git a/drivers/media/pci/Makefile b/drivers/media/pci/Makefile
> index 984fa247096d..f24b32ddb627 100644
> --- a/drivers/media/pci/Makefile
> +++ b/drivers/media/pci/Makefile
> @@ -33,3 +33,4 @@ obj-$(CONFIG_STA2X11_VIP) += sta2x11/
>  obj-$(CONFIG_VIDEO_SOLO6X10) += solo6x10/
>  obj-$(CONFIG_VIDEO_COBALT) += cobalt/
>  obj-$(CONFIG_VIDEO_TW5864) += tw5864/
> +obj-$(CONFIG_VIRTIO_VDEC) += virtio-vdec/
> diff --git a/drivers/media/pci/virtio-vdec/Kconfig b/drivers/media/pci/virtio-vdec/Kconfig
> new file mode 100644
> index 000000000000..6cfef7fc256f
> --- /dev/null
> +++ b/drivers/media/pci/virtio-vdec/Kconfig
> @@ -0,0 +1,11 @@
> +config VIRTIO_VDEC
> +       bool "Virtio video decoder"
> +       depends on VIRTIO_PCI && VIDEO_DEV && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> +       select VIDEOBUF2_VMALLOC
> +       select VIDEOBUF2_DMA_SG
> +       select VIDEOBUF2_V4L2
> +       select V4L2_MEM2MEM_DEV
> +       help
> +          This driver supports video decoding using host-side devices.
> +
> +          If unsure, say 'N'.
> diff --git a/drivers/media/pci/virtio-vdec/Makefile b/drivers/media/pci/virtio-vdec/Makefile
> new file mode 100644
> index 000000000000..972c0c200f13
> --- /dev/null
> +++ b/drivers/media/pci/virtio-vdec/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIRTIO_VDEC) += virtio_vdec.o
> diff --git a/drivers/media/pci/virtio-vdec/virtio_vdec.c b/drivers/media/pci/virtio-vdec/virtio_vdec.c
> new file mode 100644
> index 000000000000..f93c5c19845a
> --- /dev/null
> +++ b/drivers/media/pci/virtio-vdec/virtio_vdec.c
> @@ -0,0 +1,2240 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * VirtIO Video Decoder
> + *
> + * Copyright 2019 Google LLC.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dma-buf.h>
> +#include <linux/fs.h>
> +#include <linux/module.h>
> +#include <linux/net.h>
> +#include <linux/pci_ids.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/videodev2.h>
> +#include <linux/virtio_config.h>
> +#include <linux/virtio_ids.h>
> +#include <linux/virtio_pci.h>
> +#include <linux/virtio_ring.h>
> +#include <linux/virtio_vdec.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-vmalloc.h>
> +#define VIRTIO_VDEC_NAME "virtio_vdec"
> +
> +#define DST_QUEUE_OFF_BASE (1 << 30)
> +
> +#define vdec_debug(virt_vdev, fmt, args...)                                    \
> +       dev_dbg(&virt_vdev->vid_dev.dev, "%s:%d " fmt, __func__, __LINE__,     \
> +               ##args)
> +
> +#define vdec_err(virt_vdev, fmt, args...)                                      \
> +       dev_err(&virt_vdev->vid_dev.dev, "%s:%d " fmt, __func__, __LINE__,     \
> +               ##args)
> +
> +/**
> + * struct virtvdec_dev - VirtIO video decode driver data.
> + *
> + * @virt_dev:          Reference to a virtio device struct.
> + * @vid_dev:           Video device struct.
> + * @v4l2_dev:          V4L2 device struct.
> + * @lock:              Lock for the video device and vb2 queues.
> + * @src_fmts:          Array of supported bitstream formats.
> + * @dst_fmts:          Array of supported frame formats.
> + * @vq_in:             virtqueue for inputs (i.e. host requests).
> + * @vq_in_lock:        Lock for @vq_in.
> + * @vq_in_work:        Delayed work for host requests.
> + * @vq_out:            virtqueue for outputs (i.e. guest requests).
> + * @vq_out_lock:       Lock for @vq_out.
> + * @vq_out_work:       Delayed work for guest requests.
> + * @out_waitq:         Wait queue for guest requests.
> + * @subscriptions:     List head of all subscriptions for host request.
> + * @contexts:          List head of all active contexts.
> + * @num_ctxs:          Number of contexts created so far.
> + */
> +struct virtvdec_dev {
> +       struct virtio_device *virt_dev;
> +       struct video_device vid_dev;
> +       struct v4l2_device v4l2_dev;
> +
> +       struct mutex lock;
> +
> +       struct virtio_vdec_format_desc src_fmts[VIRTIO_VDEC_NUM_FORMATS];
> +       struct virtio_vdec_format_desc dst_fmts[VIRTIO_VDEC_NUM_FORMATS];
> +
> +       struct virtqueue *vq_in;
> +       struct mutex vq_in_lock;
> +       struct work_struct vq_in_work;
> +
> +       struct virtqueue *vq_out;
> +       struct mutex vq_out_lock;
> +       struct work_struct vq_out_work;
> +       wait_queue_head_t out_waitq;
> +
> +       struct list_head subscriptions;
> +       struct list_head contexts;
> +
> +       int num_ctxs;
> +};
> +
> +/**
> + * enum virtvdec_state - State of V4L2 stateful video decoder.
> + */
> +enum virtvdec_state {
> +       VIRTVDEC_STATE_INITIALIZING = 0,
> +       VIRTVDEC_STATE_CAPTURE_SETUP,
> +       VIRTVDEC_STATE_STOPPED,
> +       VIRTVDEC_STATE_DECODING,
> +       VIRTVDEC_STATE_DRAINING,
> +       VIRTVDEC_STATE_DRAINED,
> +       VIRTVDEC_STATE_SEEK,
> +       /* TODO(keiichiw): Dynamic resolution change is unsupported */
> +       /* VIRTVDEC_STATE_DRC, */
> +};
> +
> +/**
> + * struct virtvdec_ctx - Context (instance) private data.
> + *
> + * @list:              List head to attach to the driver data.
> + * @id:                Instance ID.
> + * @fh:                V4L2 file handler,
> + * @dev:               Driver data to which the context belongs
> + * @hdl:               Control handler.
> + * @state:             Decoder state.
> + * @ctrl_handler:      Control handler used to register controls.
> + * @src_fmt:           V4L2 pixel format of active source format.
> + * @vdec_src_fmt:      virtio-vdec pixel format of active source format.
> + * @dst_fmt:           V4L2 pixel format of active destination format.
> + * @vdec_dst_fmt:      virtio-vdec pixel format of active destination format.
> + * @crop:              Crop rectangle.
> + * @min_capbufs:       Minimum number of CAPTURE buffers.
> + * @max_capbufs:       Maximum number of CAPTURE buffers.
> + * @src_vbq:           Videobuf2 source queue.
> + * @src_queue:         Internal source buffer queue.
> + * @dst_vbq:           Videobuf2 destination queue.
> + * @dst_queue:         Internal destination buffer queue.
> + * @has_host_session:  Whether it has corresponding host-side session.
> + * @outbuf_handles:    List of registered resource handles for OUTPUT buffers.
> + * @capbuf_handles:    List of registered resource handles for CAPTURE buffers.
> + * @outbuf_handle_map: Mapping from an index to a resource handle for OUTPUT
> + *                     buffers.
> + * @capbuf_handle_map: Mapping from an index to a resource handle for CAPTURE
> + *                     buffers.
> + * @outbuf_vb2_map:    Mapping from an index to a vb2 buffer for OUTPUT
> + *                     buffers.
> + * @capbuf_vb2_map:    Mapping from an index to a vb2 buffer for CAPTURE
> + *                     buffers.
> + * @stored_capbuf:     Videobuf2 destination buffer used to notify DRAINED
> + *                     by specifying V4L2_BUF_FLAG_LAST;
> + * @waiting_drained:   Whether it's waiting for a DRAINED event coming from the
> + *                     host.
> + */
> +struct virtvdec_ctx {
> +       struct list_head list;
> +       int id;
> +       struct v4l2_fh fh;
> +       struct virtvdec_dev *dev;
> +       struct v4l2_ctrl_handler hdl;
> +       enum virtvdec_state state;
> +       struct v4l2_ctrl_handler ctrl_handler;
> +
> +       struct v4l2_pix_format_mplane src_fmt;
> +       const struct virtio_vdec_format_desc *vdec_src_fmt;
> +       struct v4l2_pix_format_mplane dst_fmt;
> +       struct virtio_vdec_format_desc *vdec_dst_fmt;
> +
> +       struct v4l2_crop crop;
> +       u32 min_capbufs;
> +       u32 max_capbufs;
> +
> +       struct vb2_queue src_vbq;
> +       struct list_head src_queue;
> +       struct vb2_queue dst_vbq;
> +       struct list_head dst_queue;
> +       bool has_host_session;
> +
> +       struct list_head outbuf_handles;
> +       struct list_head capbuf_handles;
> +
> +#define VIRTIO_VDEC_MAX_BUFFER_COUNT 32
> +       u32 outbuf_handle_map[VIRTIO_VDEC_MAX_BUFFER_COUNT];
> +       u32 capbuf_handle_map[VIRTIO_VDEC_MAX_BUFFER_COUNT];
> +       struct vb2_buffer *outbuf_vb2_map[VIRTIO_VDEC_MAX_BUFFER_COUNT];
> +       struct vb2_buffer *capbuf_vb2_map[VIRTIO_VDEC_MAX_BUFFER_COUNT];
> +
> +       /*
> +        * Store one CAPTURE buffer to notify DRAINED to the user.
> +        *
> +        * @stored_capbuf won't be used for decoded frames.
> +        * Instead, when VIRTIO_VDEC_HOST_REQ_DRAINED arrives, vb2_buffer_done
> +        * is called for this buffer with V4L2_BUF_FLAG_LAST.
> +        *
> +        * Note: the value of VIRTIO_VDEC_DRAINED_NOTIFICATION_BUFFER_INDEX must
> +        * be 0 since there is no guarantee how many buffers the client will
> +        * enqueue.
> +        */
> +#define VIRTIO_VDEC_DRAINED_NOTIFICATION_BUFFER_INDEX 0
> +       struct vb2_buffer *stored_capbuf;
> +       bool waiting_drained;
> +};
> +
> +struct virtvdec_buf {
> +       struct vb2_v4l2_buffer vb;
> +       struct list_head list;
> +};
> +
> +static inline struct virtvdec_buf *
> +virtvdec_vb2_to_virtvdec_buf(const struct vb2_buffer *buf)
> +{
> +       return container_of(to_vb2_v4l2_buffer(buf), struct virtvdec_buf, vb);
> +}
> +
> +static struct virtvdec_ctx *virtvdec_get_context(struct virtvdec_dev *dev,
> +                                                int id)
> +{
> +       struct virtvdec_ctx *ctx, *next;
> +
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       list_for_each_entry_safe(ctx, next, &dev->contexts, list)
> +               if (ctx->id == id)
> +                       return ctx;
> +
> +       return NULL;
> +}
> +
> +static void virtvdec_del_context(struct virtvdec_dev *dev, const int id)
> +{
> +       struct virtvdec_ctx *ctx, *next;
> +
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       list_for_each_entry_safe(ctx, next, &dev->contexts, list) {
> +               if (ctx->id == id) {
> +                       list_del_init(&ctx->list);
> +                       mutex_unlock(&dev->lock);
> +                       return;
> +               }
> +       }
> +}
> +
> +static int virtvdec_initialize_id(struct virtvdec_ctx *ctx)
> +{
> +       struct virtvdec_dev *dev = ctx->dev;
> +
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       ctx->id = dev->num_ctxs;
> +       dev->num_ctxs += 1;
> +       list_add_tail(&ctx->list, &dev->contexts);
> +
> +       return 0;
> +}
> +
> +static struct virtvdec_ctx *virtvdec_fh_to_ctx(const struct v4l2_fh *fh)
> +{
> +       return container_of(fh, struct virtvdec_ctx, fh);
> +}
> +
> +/**
> + * struct vdec_host_req_subscription - Used to specify a host request to be
> + * waited for.
> + *
> + * @list:              List head to attach to the driver data.
> + * @done:              Completion for the notification to the a subscriber
> + * @type:              type of a host request waited for.
> + * @instance_id:       instance_id of a host request waited for.
> + * @result:            result of the reported host request
> + */
> +struct vdec_host_req_subscription {
> +       struct list_head list;
> +       struct completion done;
> +       u32 type;
> +       u32 instance_id;
> +       int result;
> +};
> +
> +#define DEFINE_SUBSCRIPTION(name, req, id)                                     \
> +       struct vdec_host_req_subscription name = {                             \
> +               .type = VIRTIO_VDEC_HOST_REQ_##req,                            \
> +               .instance_id = id,                                             \
> +       }
> +
> +#define DEFINE_SUBSCRIPTION_QUERY(name) DEFINE_SUBSCRIPTION(name, QUERY, 0)
> +#define DEFINE_SUBSCRIPTION_OPEN(name, id) DEFINE_SUBSCRIPTION(name, OPEN, id)
> +#define DEFINE_SUBSCRIPTION_CLOSE(name, id) DEFINE_SUBSCRIPTION(name, CLOSE, id)
> +#define DEFINE_SUBSCRIPTION_SET_BUFFER_COUNT(name, id)                         \
> +       DEFINE_SUBSCRIPTION(name, SET_BUFFER_COUNT, id)
> +#define DEFINE_SUBSCRIPTION_FLUSHED(name, id)                                  \
> +       DEFINE_SUBSCRIPTION(name, FLUSHED, id)
> +
> +static bool virtvdec_match_host_req_subscription(
> +       const struct virtio_vdec_host_req *req,
> +       const struct vdec_host_req_subscription *sub)
> +{
> +       if (req->type != sub->type)
> +               return false;
> +       switch (req->type) {
> +       case VIRTIO_VDEC_HOST_REQ_QUERY:
> +               /* No need to check instance_id */
> +               return true;
> +       case VIRTIO_VDEC_HOST_REQ_OPEN:
> +       case VIRTIO_VDEC_HOST_REQ_CLOSE:
> +       case VIRTIO_VDEC_HOST_REQ_SET_BUFFER_COUNT:
> +       case VIRTIO_VDEC_HOST_REQ_FLUSHED:
> +               return req->instance_id == sub->instance_id;
> +       default:
> +               return false;
> +       }
> +}
> +
> +/*
> + * Utilities for vdec_host_req_subscription. *
> + */
> +static void virtvdec_host_req_subscribe(struct virtvdec_dev *dev,
> +                                       struct vdec_host_req_subscription *sub)
> +{
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       init_completion(&sub->done);
> +
> +       list_add_tail(&sub->list, &dev->subscriptions);
> +}
> +
> +static void virtvdec_host_req_wait(struct virtvdec_dev *dev,
> +                                  struct vdec_host_req_subscription *sub)
> +{
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       mutex_unlock(&dev->lock);
> +       wait_for_completion(&sub->done);
> +       mutex_lock(&dev->lock);
> +}
> +
> +/**
> + * Virtqueue operations
> + */
> +static int
> +virtvdec_process_host_req_query(struct virtvdec_dev *dev,
> +                               const struct virtio_vdec_host_req *req)
> +{
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       if (req->result != VIRTIO_VDEC_HOST_REQ_RESULT_SUCCESS) {
> +               vdec_err(dev, "failed to query to the host : %d", req->result);
> +               return req->result;
> +       }
> +
> +       memcpy(dev->src_fmts, &req->query.bitstream_formats,
> +              sizeof(dev->src_fmts));
> +       memcpy(dev->dst_fmts, &req->query.frame_formats, sizeof(dev->dst_fmts));
> +
> +       return 0;
> +}
> +
> +static void virtvdec_set_capture_format(struct virtvdec_ctx *ctx,
> +                                       struct v4l2_pix_format_mplane *pix_mp)
> +{
> +       int i;
> +
> +       for (i = 0; i < pix_mp->num_planes; ++i) {
> +               pix_mp->plane_fmt[i].bytesperline = pix_mp->width;
> +               pix_mp->plane_fmt[i].sizeimage =
> +                       pix_mp->plane_fmt[i].bytesperline * pix_mp->height;
> +
> +               /*
> +                * NV12 has chroma planes subsampled by 2.
> +                *
> +                * TODO(keiichiw): This computation can be wrong for some
> +                * formats like YUV420.
> +                * We might be able to a helper for this computation.
> +                * cf. https://lkml.org/lkml/2019/4/17/158
> +                */
> +               if (i != 0)
> +                       pix_mp->plane_fmt[i].sizeimage /= 2;
> +       }
> +
> +       ctx->dst_fmt = *pix_mp;
> +}
> +
> +static int
> +virtvdec_process_host_req_stream_info(struct virtvdec_dev *dev,
> +                                     const struct virtio_vdec_host_req *req)
> +{
> +       struct virtvdec_ctx *ctx;
> +       const struct virtio_vdec_host_req_stream_info *info = &req->stream_info;
> +       struct v4l2_pix_format_mplane pix_mp = {};
> +       static const struct v4l2_event event = {
> +               .type = V4L2_EVENT_SOURCE_CHANGE,
> +               .u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION
> +       };
> +
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       ctx = virtvdec_get_context(dev, req->instance_id);
> +       if (!ctx) {
> +               vdec_err(
> +                       dev,
> +                       "invalid instance_id passed from the host for stream_info: %d",
> +                       req->instance_id);
> +               return -EINVAL;
> +       }
> +
> +       /* Store stream information */
> +       /* Only support MPLANE */
> +       pix_mp = ctx->dst_fmt;
> +       pix_mp.pixelformat = info->raw_fourcc;
> +       pix_mp.width = info->fb_width;
> +       pix_mp.height = info->fb_height;
> +
> +       /* num_planes */
> +       /* TODO(keiichiw): Support other pixel formats. */
> +       if (pix_mp.pixelformat == V4L2_PIX_FMT_NV12)
> +               pix_mp.num_planes = 2;
> +       else {
> +               vdec_err(dev, "unknown pixel format: %d", pix_mp.pixelformat);
> +               return -EINVAL;
> +       }
> +
> +       virtvdec_set_capture_format(ctx, &pix_mp);
> +
> +       ctx->min_capbufs = info->min_frame_buffer_count;
> +       ctx->max_capbufs = info->max_frame_buffer_count;
> +       ctx->crop.c.left = info->crop.left;
> +       ctx->crop.c.top = info->crop.top;
> +       ctx->crop.c.width = info->crop.width;
> +       ctx->crop.c.height = info->crop.height;
> +
> +       if (ctx->state == VIRTVDEC_STATE_INITIALIZING)
> +               ctx->state = VIRTVDEC_STATE_CAPTURE_SETUP;
> +
> +       v4l2_event_queue_fh(&ctx->fh, &event);
> +
> +       return 0;
> +}
> +
> +static void virtvdec_vb2_buffer_done(struct virtvdec_ctx *ctx,
> +                                    bool output_buffer, int buffer_id,
> +                                    u64 timestamp)
> +{
> +       struct vb2_buffer *vb;
> +
> +       WARN_ON(!mutex_is_locked(&ctx->dev->lock));
> +
> +       if (buffer_id < 0)
> +               return;
> +
> +       if (buffer_id >= VIRTIO_VDEC_MAX_BUFFER_COUNT) {
> +               vdec_err(ctx->dev, "invalid buffer_id for %s buffer: %d",
> +                        output_buffer ? "OUTPUT" : "CAPTURE", buffer_id);
> +               return;
> +       }
> +
> +       if (output_buffer) {
> +               vb = ctx->outbuf_vb2_map[buffer_id];
> +               ctx->outbuf_vb2_map[buffer_id] = NULL;
> +       } else {
> +               vb = ctx->capbuf_vb2_map[buffer_id];
> +               ctx->capbuf_vb2_map[buffer_id] = NULL;
> +       }
> +
> +       if (!vb) {
> +               vdec_err(ctx->dev, "empty %s buffer: %d",
> +                        output_buffer ? "OUTPUT" : "CAPTURE", buffer_id);
> +               return;
> +       }
> +
> +       vb->timestamp = timestamp * NSEC_PER_SEC;
> +       vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
> +}
> +
> +static int virtvdec_lookup_index_from_handle(const struct virtvdec_ctx *ctx,
> +                                            bool output_buffer, int handle)
> +{
> +       const u32 *handle_map;
> +       int i;
> +
> +       WARN_ON(!mutex_is_locked(&ctx->dev->lock));
> +
> +       if (output_buffer)
> +               handle_map = ctx->outbuf_handle_map;
> +       else
> +               handle_map = ctx->capbuf_handle_map;
> +
> +       for (i = 0; i < VIRTIO_VDEC_MAX_BUFFER_COUNT; ++i)
> +               if (handle_map[i] == handle)
> +                       return i;
> +
> +       vdec_err(ctx->dev, "invalid handle for %s: %d",
> +                output_buffer ? "OUTPUT" : "CAPTURE", handle);
> +
> +       return -1;
> +}
> +
> +static int
> +virtvdec_process_host_req_buffer(struct virtvdec_dev *dev,
> +                                const struct virtio_vdec_host_req *req,
> +                                bool output_buffer)
> +{
> +       struct virtvdec_ctx *ctx;
> +       const struct list_head *queue;
> +       struct virtvdec_buf *cur, *next;
> +       u32 index;
> +       u64 timestamp;
> +
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       ctx = virtvdec_get_context(dev, req->instance_id);
> +       if (!ctx) {
> +               vdec_err(dev, "invalid instance_id: %d", req->instance_id);
> +               return -EINVAL;
> +       }
> +
> +       if (output_buffer) {
> +               index = virtvdec_lookup_index_from_handle(
> +                       ctx, true, req->bitstream_buffer.handle);
> +               timestamp = 0; /* Don't need timestamp for OUTPUT buffer*/
> +               queue = &ctx->src_queue;
> +       } else {
> +               index = virtvdec_lookup_index_from_handle(
> +                       ctx, false, req->frame_buffer.handles[0]);
> +               timestamp = req->frame_buffer.cookie;
> +               queue = &ctx->dst_queue;
> +       }
> +
> +       list_for_each_entry_safe(cur, next, queue, list) {
> +               if (cur->vb.vb2_buf.index == index) {
> +                       list_del_init(&cur->list);
> +                       break;
> +               }
> +       }
> +
> +       virtvdec_vb2_buffer_done(ctx, output_buffer, index, timestamp);
> +
> +       return 0;
> +}
> +
> +static int
> +virtvdec_process_host_req_drained(struct virtvdec_dev *dev,
> +                                 const struct virtio_vdec_host_req *req)
> +{
> +       struct virtvdec_ctx *ctx;
> +
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       ctx = virtvdec_get_context(dev, req->instance_id);
> +       if (!ctx) {
> +               vdec_err(dev, "DRAINED notified for invalid instance_id: %d",
> +                        req->instance_id);
> +               return -EINVAL;
> +       }
> +
> +       if (!ctx->waiting_drained)
> +               return 0;
> +       ctx->waiting_drained = false;
> +
> +       if (!ctx->stored_capbuf) {
> +               vdec_err(dev, "stored_capbuf is not stored: instance=%d",
> +                        req->instance_id);
> +               return -EINVAL;
> +       }
> +
> +       to_vb2_v4l2_buffer(ctx->stored_capbuf)->flags |= V4L2_BUF_FLAG_LAST;
> +       ctx->stored_capbuf->planes[0].bytesused = 0;
> +       vb2_buffer_done(ctx->stored_capbuf, VB2_BUF_STATE_DONE);
> +
> +       list_del(&virtvdec_vb2_to_virtvdec_buf(ctx->stored_capbuf)->list);
> +       ctx->stored_capbuf = NULL;
> +
> +       ctx->state = VIRTVDEC_STATE_DRAINED;
> +
> +       return 0;
> +}
> +
> +/* Report a fatal error to the user */
> +static void virtvdec_signal_error(struct virtvdec_ctx *ctx)
> +{
> +       if (!ctx)
> +               return;
> +
> +       vb2_queue_error(&ctx->src_vbq);
> +       vb2_queue_error(&ctx->dst_vbq);
> +}
> +
> +static int virtvdec_process_host_req(struct virtvdec_dev *dev,
> +                                    const struct virtio_vdec_host_req *req)
> +{
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       /* Handle an error from the host */
> +       if (req->result) {
> +               struct virtvdec_ctx *ctx;
> +
> +               ctx = virtvdec_get_context(dev, req->instance_id);
> +               if (ctx) {
> +                       vdec_err(
> +                               dev,
> +                               "error notified from the host for instance %d: %d",
> +                               req->instance_id, req->type);
> +                       virtvdec_signal_error(ctx);
> +               } else {
> +                       /*
> +                        * When the host notifies an error for an invalid
> +                        * instance, signal fatal error to all instances,
> +                        * as it means something bad happened.
> +                        */
> +                       struct virtvdec_ctx *next;
> +
> +                       vdec_err(dev, "error notified from the host: %d",
> +                                req->type);
> +                       list_for_each_entry_safe(ctx, next, &dev->contexts,
> +                                                 list) {
> +                               virtvdec_signal_error(ctx);
> +                       }
> +               }
> +
> +               return -EIO;
> +       }
> +
> +       switch (req->type) {
> +       case VIRTIO_VDEC_HOST_REQ_QUERY:
> +               return virtvdec_process_host_req_query(dev, req);
> +       case VIRTIO_VDEC_HOST_REQ_STREAM_INFO:
> +               return virtvdec_process_host_req_stream_info(dev, req);
> +       case VIRTIO_VDEC_HOST_REQ_BITSTREAM_BUFFER:
> +               return virtvdec_process_host_req_buffer(dev, req,
> +                                                       true /* OUTPUT */);
> +       case VIRTIO_VDEC_HOST_REQ_FRAME_BUFFER:
> +               return virtvdec_process_host_req_buffer(dev, req,
> +                                                       false /* CAPTURE */);
> +       case VIRTIO_VDEC_HOST_REQ_DRAINED:
> +               return virtvdec_process_host_req_drained(dev, req);
> +       case VIRTIO_VDEC_HOST_REQ_OPEN:
> +       case VIRTIO_VDEC_HOST_REQ_CLOSE:
> +       case VIRTIO_VDEC_HOST_REQ_SET_BUFFER_COUNT:
> +       case VIRTIO_VDEC_HOST_REQ_REGISTER_BUFFER:
> +       case VIRTIO_VDEC_HOST_REQ_FLUSHED:
> +               /* Do nothing */
> +               return 0;
> +       default:
> +               vdec_err(dev, "got an unknown host request from the host: %d",
> +                        req->type);
> +               return -EINVAL;
> +       }
> +}
> +
> +/**
> + * virtvdec_check_subscription - Call complete() if the incoming request is
> + * subscribed.
> + */
> +static void virtvdec_check_subscription(struct virtvdec_dev *dev,
> +                                       const struct virtio_vdec_host_req *req,
> +                                       int result)
> +{
> +       struct vdec_host_req_subscription *sub, *next;
> +
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       list_for_each_entry_safe(sub, next, &dev->subscriptions, list) {
> +               if (virtvdec_match_host_req_subscription(req, sub)) {
> +                       sub->result = result;
> +                       complete(&sub->done);
> +                       list_del(&sub->list);
> +                       break;
> +               }
> +       }
> +}
> +
> +/**
> + * virtvdec_vq_add_inbuf - expose a buffer for virtio_vdec_host_req to the host
> + */
> +static int virtvdec_vq_add_inbuf(struct virtqueue *vq,
> +                                struct virtio_vdec_host_req *buffer)
> +{
> +       struct scatterlist sg[1];
> +
> +       sg_init_one(sg, buffer, sizeof(*buffer));
> +       return virtqueue_add_inbuf(vq, sg, ARRAY_SIZE(sg), buffer, GFP_KERNEL);
> +}
> +
> +/**
> + * virtvdec_vq_in_work_handler - process incoming host requests and send
> + * notifications to subscribers.
> + */
> +static void virtvdec_vq_in_work_handler(struct work_struct *work)
> +{
> +       struct virtvdec_dev *dev;
> +       u32 len;
> +       struct virtio_vdec_host_req *req;
> +       bool kick_vq = false;
> +
> +       dev = container_of(work, struct virtvdec_dev, vq_in_work);
> +
> +       mutex_lock(&dev->lock);
> +       mutex_lock(&dev->vq_in_lock);
> +       while ((req = virtqueue_get_buf(dev->vq_in, &len)) != NULL) {
> +               int ret;
> +
> +               mutex_unlock(&dev->vq_in_lock);
> +               ret = virtvdec_process_host_req(dev, req);
> +               virtvdec_check_subscription(dev, req, ret);
> +               mutex_lock(&dev->vq_in_lock);
> +               /* Reuse the inqueue entry */
> +               WARN_ON(virtvdec_vq_add_inbuf(dev->vq_in, req) < 0);
> +               kick_vq = true;
> +       }
> +       if (kick_vq)
> +               virtqueue_kick(dev->vq_in);
> +
> +       mutex_unlock(&dev->vq_in_lock);
> +       mutex_unlock(&dev->lock);
> +}
> +
> +static void virtvdec_vq_in_cb(struct virtqueue *vq)
> +{
> +       struct virtvdec_dev *dev = vq->vdev->priv;
> +
> +       schedule_work(&dev->vq_in_work);
> +}
> +
> +static void virtvdec_vq_out_work_handler(struct work_struct *work)
> +{
> +       struct virtvdec_dev *dev =
> +               container_of(work, struct virtvdec_dev, vq_out_work);
> +       struct virtio_vdec_guest_req *req;
> +       u32 len;
> +       bool wake_waitq = false;
> +
> +       mutex_lock(&dev->vq_out_lock);
> +       while ((req = virtqueue_get_buf(dev->vq_out, &len)) != NULL) {
> +               wake_waitq = true;
> +               kfree(req);
> +       }
> +       mutex_unlock(&dev->vq_out_lock);
> +
> +       if (wake_waitq)
> +               wake_up_interruptible_all(&dev->out_waitq);
> +}
> +
> +static void virtvdec_vq_out_cb(struct virtqueue *vq)
> +{
> +       struct virtvdec_dev *dev = vq->vdev->priv;
> +
> +       /*
> +        * TODO(keiichiw): Optimization idea
> +        * - Invoke wake_up_interruptible_all(&dev->out_waitq) here.
> +        * - Call virtqueue_get_buf() in virtvdec_send_request()
> +        */
> +
> +       schedule_work(&dev->vq_out_work);
> +}
> +
> +/**
> + * virtvdec_init_inqueue - expose virtqueue entries to the host as many as
> + * possible
> + */
> +static int virtvdec_init_inqueue(struct virtvdec_dev *dev)
> +{
> +       struct virtio_vdec_host_req *buffer;
> +       int ret;
> +
> +       mutex_lock(&dev->vq_in_lock);
> +
> +       while (dev->vq_in->num_free > 0) {
> +               buffer = devm_kzalloc(&dev->virt_dev->dev, sizeof(*buffer),
> +                                     GFP_KERNEL);
> +               if (!buffer) {
> +                       ret = -ENOMEM;
> +                       goto clear_queue;
> +               }
> +               ret = virtvdec_vq_add_inbuf(dev->vq_in, buffer);
> +               if (ret) {
> +                       vdec_err(dev, "failed to give inbuf to host: %d", ret);
> +                       goto clear_queue;
> +               }
> +       }
> +
> +       mutex_unlock(&dev->vq_in_lock);
> +       return 0;
> +
> +clear_queue:
> +       while ((buffer = virtqueue_detach_unused_buf(dev->vq_in)))
> +               kfree(buffer);
> +
> +       mutex_unlock(&dev->vq_in_lock);
> +       return ret;
> +}
> +
> +/**
> + * virtvdec_send_request - enqueue a request to the virtqueue.
> + * @dev: the virtio-vdec device
> + * @req: the request to be enqueued
> + *
> + * If it fails, frees @req and returns a non-zero value.
> + */
> +static int virtvdec_send_request(struct virtvdec_dev *dev,
> +                                struct virtio_vdec_guest_req *req)
> +{
> +       struct scatterlist sg[1];
> +       int ret;
> +
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       mutex_lock(&dev->vq_out_lock);
> +
> +       sg_init_one(sg, req, sizeof(*req));
> +       while ((ret = virtqueue_add_outbuf(dev->vq_out, sg, ARRAY_SIZE(sg), req,
> +                                          GFP_KERNEL)) == -ENOSPC) {
> +               mutex_unlock(&dev->vq_out_lock);
> +               if (!wait_event_timeout(
> +                           dev->out_waitq,
> +                           atomic_read((atomic_t *)&dev->vq_out->num_free),
> +                           HZ)) {
> +                       vdec_err(dev, "failed to send Virtqueue req: -EBUSY");
> +                       return -EBUSY;
> +               }
> +               mutex_lock(&dev->vq_out_lock);
> +       }
> +
> +       if (ret) {
> +               vdec_err(dev, "failed to send virtqueue req: %d", ret);
> +               goto error;
> +       }
> +
> +       virtqueue_kick(dev->vq_out);
> +       mutex_unlock(&dev->vq_out_lock);
> +       return 0;
> +
> +error:
> +       kfree(req);
> +       mutex_unlock(&dev->vq_out_lock);
> +       return ret;
> +}
> +
> +/**
> + * virtvdec_allocate_guest_req - allocate and initialize virtio_vdec_guest_
> + * req struct.
> + *
> + * Returns NULL if it fails to allocate the memory.
> + */
> +static struct virtio_vdec_guest_req *
> +virtvdec_allocate_guest_req(int type, int instance_id)
> +{
> +       struct virtio_vdec_guest_req *req;
> +
> +       req = kzalloc(sizeof(*req), GFP_KERNEL);
> +       if (!req)
> +               return NULL;
> +
> +       req->type = type;
> +       req->instance_id = instance_id;
> +
> +       return req;
> +}
> +
> +static int virtvdec_send_request_query(struct virtvdec_dev *dev)
> +{
> +       struct virtio_vdec_guest_req *req;
> +
> +       req = virtvdec_allocate_guest_req(VIRTIO_VDEC_GUEST_REQ_QUERY, 0);
> +       if (req == NULL)
> +               return -ENOMEM;
> +       return virtvdec_send_request(dev, req);
> +}
> +
> +static int virtvdec_send_request_open(const struct virtvdec_ctx *ctx)
> +{
> +       struct virtio_vdec_guest_req *req;
> +
> +       req = virtvdec_allocate_guest_req(VIRTIO_VDEC_GUEST_REQ_OPEN, ctx->id);
> +       if (req == NULL)
> +               return -ENOMEM;
> +
> +       req->open.coded_fourcc = ctx->src_fmt.pixelformat;
> +
> +       return virtvdec_send_request(ctx->dev, req);
> +}
> +
> +static int virtvdec_send_request_close(const struct virtvdec_ctx *ctx)
> +{
> +       struct virtio_vdec_guest_req *req;
> +
> +       req = virtvdec_allocate_guest_req(VIRTIO_VDEC_GUEST_REQ_CLOSE, ctx->id);
> +       if (req == NULL)
> +               return -ENOMEM;
> +
> +       return virtvdec_send_request(ctx->dev, req);
> +}
> +
> +static int
> +virtvdec_send_request_set_buffer_count(const struct virtvdec_ctx *ctx,
> +                                      int buffer_type, int buffer_count)
> +{
> +       struct virtio_vdec_guest_req *req;
> +       struct virtio_vdec_guest_req_set_buffer_count *req_set_bc;
> +
> +       req = virtvdec_allocate_guest_req(
> +               VIRTIO_VDEC_GUEST_REQ_SET_BUFFER_COUNT, ctx->id);
> +       if (req == NULL)
> +               return -ENOMEM;
> +
> +       req_set_bc = &req->set_buffer_count;
> +       req_set_bc->type = buffer_type;
> +       req_set_bc->buffer_count = buffer_count;
> +
> +       return virtvdec_send_request(ctx->dev, req);
> +}
> +
> +static int virtvdec_send_request_register_buffer(const struct virtvdec_ctx *ctx,
> +                                                const int buf_type,
> +                                                struct vb2_buffer *vb,
> +                                                const u32 handle)
> +{
> +       struct virtio_vdec_guest_req *req;
> +       struct virtio_vdec_guest_req_register_buffer *req_buf;
> +       int i;
> +
> +       req = virtvdec_allocate_guest_req(VIRTIO_VDEC_GUEST_REQ_REGISTER_BUFFER,
> +                                         ctx->id);
> +       if (req == NULL)
> +               return -ENOMEM;
> +
> +       req_buf = &req->register_buffer;
> +       req_buf->type = buf_type;
> +
> +       req_buf->num_planes = vb->num_planes;
> +       for (i = 0; i < vb->num_planes; ++i) {
> +               req_buf->planes[i].handle = handle;
> +               req_buf->planes[i].length = vb->planes[i].length;
> +
> +               /*
> +                * Always use 0 for offset here.
> +                * The offsets passed from the client are used in
> +                * OUTPUT/CAPTURE requests
> +                */
> +               req_buf->planes[i].offset = 0;
> +       }
> +
> +       return virtvdec_send_request(ctx->dev, req);
> +}
> +
> +static int virtvdec_send_request_ack_stream_info(const struct virtvdec_ctx *ctx)
> +{
> +       struct virtio_vdec_guest_req *req;
> +
> +       req = virtvdec_allocate_guest_req(VIRTIO_VDEC_GUEST_REQ_ACK_STREAM_INFO,
> +                                         ctx->id);
> +       if (req == NULL)
> +               return -ENOMEM;
> +
> +       return virtvdec_send_request(ctx->dev, req);
> +}
> +
> +static int
> +virtvdec_send_request_bitstream_buffer(const struct virtvdec_ctx *ctx,
> +                                      const struct vb2_buffer *vb)
> +{
> +       struct virtio_vdec_guest_req *req;
> +       struct virtio_vdec_guest_req_bitstream_buffer *bb;
> +
> +       req = virtvdec_allocate_guest_req(
> +               VIRTIO_VDEC_GUEST_REQ_BITSTREAM_BUFFER, ctx->id);
> +       if (req == NULL)
> +               return -ENOMEM;
> +
> +       bb = &req->bitstream_buffer;
> +       bb->handle = ctx->outbuf_handle_map[vb->index];
> +       bb->offset = vb->planes[0].data_offset;
> +       bb->length = vb->planes[0].bytesused;
> +       bb->cookie = vb->timestamp / NSEC_PER_SEC;
> +
> +       return virtvdec_send_request(ctx->dev, req);
> +}
> +
> +static int virtvdec_send_request_frame_buffer(const struct virtvdec_ctx *ctx,
> +                                             const struct vb2_buffer *vb)
> +{
> +       const struct v4l2_pix_format_mplane *dst_fmt = &ctx->dst_fmt;
> +       struct virtio_vdec_guest_req *req;
> +       struct virtio_vdec_guest_req_frame_buffer *fb;
> +       int handle;
> +       int i;
> +
> +       WARN_ON(!mutex_is_locked(&ctx->dev->lock));
> +
> +       req = virtvdec_allocate_guest_req(VIRTIO_VDEC_GUEST_REQ_FRAME_BUFFER,
> +                                         ctx->id);
> +       if (req == NULL)
> +               return -ENOMEM;
> +
> +       fb = &req->frame_buffer;
> +       handle = ctx->capbuf_handle_map[vb->index];
> +
> +       for (i = 0; i < dst_fmt->num_planes; ++i) {
> +               fb->planes[i].handle = handle;
> +               fb->planes[i].offset = vb->planes[i].data_offset;
> +               fb->planes[i].stride = dst_fmt->width;
> +       }
> +
> +       return virtvdec_send_request(ctx->dev, req);
> +}
> +
> +static int virtvdec_send_request_drain(const struct virtvdec_ctx *ctx)
> +{
> +       struct virtio_vdec_guest_req *req;
> +
> +       req = virtvdec_allocate_guest_req(VIRTIO_VDEC_GUEST_REQ_DRAIN, ctx->id);
> +       if (req == NULL)
> +               return -ENOMEM;
> +
> +       return virtvdec_send_request(ctx->dev, req);
> +}
> +
> +static int virtvdec_send_request_flush(const struct virtvdec_ctx *ctx)
> +{
> +       struct virtio_vdec_guest_req *req;
> +
> +       req = virtvdec_allocate_guest_req(VIRTIO_VDEC_GUEST_REQ_FLUSH, ctx->id);
> +       if (req == NULL)
> +               return -ENOMEM;
> +
> +       return virtvdec_send_request(ctx->dev, req);
> +}
> +
> +/*
> + * Video decoding controls
> + */
> +
> +static int virtvdec_vidioc_querycap(struct file *file, void *priv,
> +                                   struct v4l2_capability *cap)
> +{
> +       strlcpy(cap->driver, VIRTIO_VDEC_NAME, sizeof(cap->driver));
> +       strlcpy(cap->card, "virtio video decoder", sizeof(cap->card));
> +       snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI: virtio-vdec");
> +       return 0;
> +}
> +
> +static const struct virtio_vdec_format_desc *
> +virtvdec_find_src_format(const struct virtvdec_dev *dev, u32 fourcc)
> +{
> +       int i;
> +
> +       for (i = 0; i < VIRTIO_VDEC_NUM_FORMATS; ++i)
> +               if (dev->src_fmts[i].mask != 0 &&
> +                   dev->src_fmts[i].fourcc == fourcc)
> +                       return &dev->src_fmts[i];
> +
> +       return NULL;
> +}
> +
> +static int virtvdec_vidioc_enum_framesizes(struct file *file, void *prov,
> +                                          struct v4l2_frmsizeenum *fsize)
> +{
> +       const struct virtvdec_dev *dev = video_drvdata(file);
> +       const struct virtio_vdec_format_desc *fmt;
> +
> +       if (fsize->index != 0) {
> +               vdec_err(dev, "invalid frame size index (expected 0, got %d)",
> +                        fsize->index);
> +               return -EINVAL;
> +       }
> +       fmt = virtvdec_find_src_format(dev, fsize->pixel_format);
> +       if (!fmt) {
> +               vdec_err(dev, "unsupported bitstream format (%08x)",
> +                        fsize->pixel_format);
> +               return -EINVAL;
> +       }
> +       fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +       fsize->stepwise.min_width = fmt->width.min;
> +       fsize->stepwise.max_width = fmt->width.max;
> +       fsize->stepwise.step_width = fmt->width.step;
> +       fsize->stepwise.min_height = fmt->height.min;
> +       fsize->stepwise.max_height = fmt->height.max;
> +       fsize->stepwise.step_height = fmt->height.step;
> +
> +       return 0;
> +}
> +
> +static int virtvdec_vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
> +                                   bool bitstream_format)
> +{
> +       const struct virtvdec_dev *dev = video_drvdata(file);
> +       const struct virtio_vdec_format_desc *formats;
> +       const struct virtio_vdec_format_desc *fmt;
> +       int fmt_cnt;
> +       int i;
> +
> +       if (bitstream_format)
> +               formats = dev->src_fmts;
> +       else
> +               formats = dev->dst_fmts;
> +
> +       fmt_cnt = 0;
> +       for (i = 0; i < VIRTIO_VDEC_NUM_FORMATS; ++i) {
> +               if (!formats[i].mask)
> +                       continue;
> +               if (fmt_cnt == f->index) {
> +                       fmt = &formats[i];
> +                       f->pixelformat = fmt->fourcc;
> +                       f->flags = 0;
> +                       if (bitstream_format)
> +                               f->flags |= V4L2_FMT_FLAG_COMPRESSED;
> +                       return 0;
> +               }
> +               fmt_cnt++;
> +       }
> +       return -EINVAL;
> +}
> +
> +static int virtvdec_vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
> +                                           struct v4l2_fmtdesc *f)
> +{
> +       return virtvdec_vidioc_enum_fmt(file, f, false);
> +}
> +
> +static int virtvdec_vidioc_enum_fmt_vid_out(struct file *file, void *priv,
> +                                           struct v4l2_fmtdesc *f)
> +{
> +       return virtvdec_vidioc_enum_fmt(file, f, true);
> +}
> +
> +static int virtvdec_vidioc_fmt_vid_cap_mplane(struct file *file, void *priv,
> +                                             struct v4l2_format *f)
> +{
> +       const struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +
> +       if (ctx->state == VIRTVDEC_STATE_INITIALIZING)
> +               return -EINVAL;
> +
> +       f->fmt.pix_mp = ctx->dst_fmt;
> +
> +       return 0;
> +}
> +
> +static int virtvdec_vidioc_s_fmt_vid_cap_mplane(struct file *file, void *priv,
> +                                               struct v4l2_format *f)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +       struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +
> +       virtvdec_set_capture_format(ctx, pix_mp);
> +
> +       return 0;
> +}
> +
> +static int virtvdec_vidioc_g_fmt_vid_out_mplane(struct file *file, void *priv,
> +                                               struct v4l2_format *f)
> +{
> +       const struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +
> +       f->type = ctx->vdec_src_fmt->fourcc;
> +       f->fmt.pix_mp = ctx->src_fmt;
> +
> +       return 0;
> +}
> +
> +static int virtvdec_vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
> +                                                 struct v4l2_format *f)
> +{
> +       const struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +       const struct virtio_vdec_format_desc *fmt;
> +       const struct v4l2_pix_format_mplane *pix_mp;
> +
> +       pix_mp = &f->fmt.pix_mp;
> +
> +       fmt = virtvdec_find_src_format(ctx->dev, pix_mp->pixelformat);
> +       if (!fmt) {
> +               vdec_err(ctx->dev, "failed to try output format");
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int virtvdec_vidioc_s_fmt_vid_out_mplane(struct file *file, void *priv,
> +                                               struct v4l2_format *f)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +       const struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +       int ret;
> +
> +       if (ctx->state != VIRTVDEC_STATE_INITIALIZING) {
> +               vdec_err(ctx->dev,
> +                        "dynamic resolution change is not supported");
> +               return -EINVAL;
> +       }
> +
> +       ret = virtvdec_vidioc_try_fmt_vid_out_mplane(file, priv, f);
> +       if (ret)
> +               return ret;
> +       ctx->vdec_src_fmt =
> +               virtvdec_find_src_format(ctx->dev, pix_mp->pixelformat);
> +       ctx->src_fmt = *pix_mp;
> +
> +       return 0;
> +}
> +
> +static int virtvdec_vidioc_g_selection(struct file *file, void *priv,
> +                                      struct v4l2_selection *s)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +
> +       if (V4L2_TYPE_IS_OUTPUT(s->type))
> +               return -EINVAL;
> +
> +       /* TODO(keiichiw): Should we check s->target? */
> +
> +       s->r.width = ctx->crop.c.width;
> +       s->r.height = ctx->crop.c.height;
> +       s->r.top = ctx->crop.c.top;
> +       s->r.left = ctx->crop.c.left;
> +
> +       return 0;
> +}
> +
> +static int virtvdec_send_request_open_sync(const struct virtvdec_ctx *ctx)
> +{
> +       DEFINE_SUBSCRIPTION_OPEN(sub, ctx->id);
> +       int ret;
> +
> +       virtvdec_host_req_subscribe(ctx->dev, &sub);
> +       ret = virtvdec_send_request_open(ctx);
> +       if (ret) {
> +               vdec_err(ctx->dev, "failed to send open request");
> +               return ret;
> +       }
> +       virtvdec_host_req_wait(ctx->dev, &sub);
> +
> +       return sub.result;
> +}
> +
> +static int virtvdec_open_session(struct virtvdec_ctx *ctx)
> +{
> +       struct virtvdec_dev *dev = ctx->dev;
> +       int ret;
> +
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       ret = virtvdec_initialize_id(ctx);
> +       if (ret)
> +               return ret;
> +
> +       ret = virtvdec_send_request_open_sync(ctx);
> +       if (!ret)
> +               ctx->has_host_session = true;
> +
> +       return ret;
> +}
> +
> +static int virtvdec_close_session(struct virtvdec_ctx *ctx)
> +{
> +       DEFINE_SUBSCRIPTION_CLOSE(sub, ctx->id);
> +       int ret;
> +
> +       WARN_ON(!mutex_is_locked(&ctx->dev->lock));
> +
> +       /*
> +        * TODO(keiichiw): we might need to:
> +        * - re-initialize fields in ctx
> +        * - free all allocated memories
> +        **/
> +
> +       if (!ctx->has_host_session)
> +               return 0;
> +
> +       virtvdec_host_req_subscribe(ctx->dev, &sub);
> +       ret = virtvdec_send_request_close(ctx);
> +       if (ret)
> +               return ret;
> +
> +       virtvdec_host_req_wait(ctx->dev, &sub);
> +       ctx->has_host_session = false;
> +
> +       return sub.result;
> +}
> +
> +static int virtvdec_vidioc_reqbufs(struct file *file, void *priv,
> +                                  struct v4l2_requestbuffers *rb)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +       struct vb2_queue *vbq;
> +       int buffer_type;
> +       int ret;
> +
> +       WARN_ON(!mutex_is_locked(&ctx->dev->lock));
> +
> +       if (V4L2_TYPE_IS_OUTPUT(rb->type)) {
> +               buffer_type = VIRTIO_VDEC_GUEST_REQ_BUFFER_TYPE_BITSTREAM;
> +               vbq = &ctx->src_vbq;
> +       } else {
> +               buffer_type = VIRTIO_VDEC_GUEST_REQ_BUFFER_TYPE_FRAME;
> +               vbq = &ctx->dst_vbq;
> +
> +               if (rb->count > 0 && rb->count < ctx->min_capbufs)
> +                       rb->count = ctx->min_capbufs;
> +
> +               /* TODO(keiichiw): Check max_capbufs? */
> +       }
> +
> +       if (rb->count == 0) {
> +               ctx->waiting_drained = false;
> +
> +               if (ctx->state != VIRTVDEC_STATE_INITIALIZING) {
> +                       WARN_ON(!ctx->has_host_session);
> +
> +                       ret = virtvdec_close_session(ctx);
> +                       if (ret) {
> +                               vdec_err(
> +                                       ctx->dev,
> +                                       "failed to close host-side session : %d",
> +                                       ret);
> +                               return ret;
> +                       }
> +               }
> +
> +               ctx->state = VIRTVDEC_STATE_INITIALIZING;
> +
> +               return vb2_reqbufs(vbq, rb);
> +       }
> +
> +       if (!ctx->has_host_session) {
> +               ret = virtvdec_open_session(ctx);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       if (V4L2_TYPE_IS_OUTPUT(rb->type) ||
> +           ctx->state == VIRTVDEC_STATE_CAPTURE_SETUP) {
> +               DEFINE_SUBSCRIPTION_SET_BUFFER_COUNT(sub, ctx->id);
> +               int buf_count;
> +
> +               virtvdec_host_req_subscribe(ctx->dev, &sub);
> +
> +               /*
> +                * For CAPTURE, save one buffer for
> +                * VIRTIO_VDEC_DRAINED_NOTIFICATION_BUFFER_INDEX
> +                */
> +               if (V4L2_TYPE_IS_OUTPUT(rb->type))
> +                       buf_count = rb->count;
> +               else
> +                       buf_count = rb->count - 1;
> +
> +               ret = virtvdec_send_request_set_buffer_count(ctx, buffer_type,
> +                                                            buf_count);
> +               if (ret)
> +                       return ret;
> +               virtvdec_host_req_wait(ctx->dev, &sub);
> +               if (sub.result)
> +                       return sub.result;
> +       }
> +
> +       return vb2_reqbufs(vbq, rb);
> +}
> +
> +static int virtvdec_vidioc_querybuf(struct file *file, void *priv,
> +                                   struct v4l2_buffer *buf)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +       int ret;
> +
> +       if (V4L2_TYPE_IS_OUTPUT(buf->type)) {
> +               ret = vb2_querybuf(&ctx->src_vbq, buf);
> +       } else {
> +               ret = vb2_querybuf(&ctx->dst_vbq, buf);
> +               buf->m.planes[0].m.mem_offset += DST_QUEUE_OFF_BASE;
> +               buf->m.offset += DST_QUEUE_OFF_BASE;
> +       }
> +       if (ret)
> +               vdec_err(ctx->dev, "QUERYBUF for type %d failed", buf->type);
> +       return ret;
> +}
> +
> +static int virtvdec_vidioc_qbuf(struct file *file, void *priv,
> +                               struct v4l2_buffer *buf)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +
> +       if (V4L2_TYPE_IS_OUTPUT(buf->type))
> +               return vb2_qbuf(&ctx->src_vbq, ctx->dev->vid_dev.v4l2_dev->mdev,
> +                               buf);
> +       else
> +               return vb2_qbuf(&ctx->dst_vbq, ctx->dev->vid_dev.v4l2_dev->mdev,
> +                               buf);
> +}
> +
> +static int virtvdec_vidioc_dqbuf(struct file *file, void *priv,
> +                                struct v4l2_buffer *buf)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +       int ret;
> +
> +       if (V4L2_TYPE_IS_OUTPUT(buf->type))
> +               ret = vb2_dqbuf(&ctx->src_vbq, buf, file->f_flags & O_NONBLOCK);
> +       else
> +               ret = vb2_dqbuf(&ctx->dst_vbq, buf, file->f_flags & O_NONBLOCK);
> +
> +       if (ret)
> +               return ret;
> +
> +       if (!V4L2_TYPE_IS_OUTPUT(buf->type) &&
> +           !(buf->flags & V4L2_BUF_FLAG_LAST)) {
> +               int i;
> +
> +               for (i = 0; i < ctx->dst_fmt.num_planes; ++i)
> +                       buf->m.planes[i].bytesused =
> +                               ctx->dst_fmt.plane_fmt[i].sizeimage;
> +       }
> +
> +       return 0;
> +}
> +
> +static int virtvdec_vidioc_expbuf(struct file *file, void *priv,
> +                                 struct v4l2_exportbuffer *eb)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +       int ret;
> +
> +       if (V4L2_TYPE_IS_OUTPUT(eb->type))
> +               ret = vb2_expbuf(&ctx->src_vbq, eb);
> +       else
> +               ret = vb2_expbuf(&ctx->dst_vbq, eb);
> +
> +       if (ret)
> +               vdec_err(ctx->dev, "EXPBUF for type %d failed", eb->type);
> +       return ret;
> +}
> +
> +static int virtvdec_vidioc_streamon(struct file *file, void *priv,
> +                                   enum v4l2_buf_type type)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +       int ret;
> +
> +       if (V4L2_TYPE_IS_OUTPUT(type))
> +               ret = vb2_streamon(&ctx->src_vbq, type);
> +       else {
> +               switch (ctx->state) {
> +               case VIRTVDEC_STATE_STOPPED:
> +                       ctx->state = VIRTVDEC_STATE_DECODING;
> +                       break;
> +               case VIRTVDEC_STATE_CAPTURE_SETUP:
> +                       ctx->state = VIRTVDEC_STATE_DECODING;
> +                       ret = virtvdec_send_request_ack_stream_info(ctx);
> +                       if (ret) {
> +                               vdec_err(ctx->dev,
> +                                        "failed to send AckStreamInfo");
> +                               return ret;
> +                       }
> +                       break;
> +               default:
> +                       break;
> +               }
> +               ret = vb2_streamon(&ctx->dst_vbq, type);
> +       }
> +       if (ret)
> +               vdec_err(ctx->dev, "STREAMON for type %d failed", type);
> +       return ret;
> +}
> +
> +static int virtvdec_vidioc_streamoff(struct file *file, void *priv,
> +                                    enum v4l2_buf_type type)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +       int ret;
> +
> +       if (V4L2_TYPE_IS_OUTPUT(type))
> +               ret = vb2_streamoff(&ctx->src_vbq, type);
> +       else
> +               ret = vb2_streamoff(&ctx->dst_vbq, type);
> +
> +       if (ret)
> +               vdec_err(ctx->dev, "STREAMOFF for type %d failed", type);
> +       return ret;
> +}
> +
> +static int
> +virtvdec_vidioc_subscribe_event(struct v4l2_fh *fh,
> +                               const struct v4l2_event_subscription *sub)
> +{
> +       switch (sub->type) {
> +       case V4L2_EVENT_EOS:
> +               return v4l2_event_subscribe(fh, sub, 2, NULL);
> +       case V4L2_EVENT_SOURCE_CHANGE:
> +               return v4l2_src_change_event_subscribe(fh, sub);
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static int virtvdec_vidioc_try_decoder_cmd(struct file *file, void *priv,
> +                                          struct v4l2_decoder_cmd *cmd)
> +{
> +       switch (cmd->cmd) {
> +       case V4L2_DEC_CMD_START:
> +       case V4L2_DEC_CMD_STOP:
> +               return 0;
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static int virtvdec_vidioc_decoder_cmd(struct file *file, void *priv,
> +                                      struct v4l2_decoder_cmd *cmd)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(priv);
> +       int ret;
> +
> +       ret = virtvdec_vidioc_try_decoder_cmd(file, priv, cmd);
> +       if (ret)
> +               return ret;
> +
> +       switch (cmd->cmd) {
> +       case V4L2_DEC_CMD_START:
> +               ctx->state = VIRTVDEC_STATE_DECODING;
> +               /* TODO(keiichiw): Do something else? */
> +
> +               return 0;
> +       case V4L2_DEC_CMD_STOP:
> +               ctx->state = VIRTVDEC_STATE_DRAINING;
> +
> +               if (!vb2_is_streaming(&ctx->src_vbq))
> +                       vdec_debug(ctx->dev,
> +                                  "Output stream is off. No need to drain.");
> +
> +               if (!vb2_is_streaming(&ctx->dst_vbq))
> +                       vdec_debug(ctx->dev,
> +                                  "Capture stream is off. No need to drain.");
> +
> +               ctx->waiting_drained = true;
> +               ret = virtvdec_send_request_drain(ctx);
> +               if (ret)
> +                       vdec_err(ctx->dev, "failed to send drain request: %d",
> +                                ret);
> +               return ret;
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static const struct v4l2_ioctl_ops virtvdec_ioctl_dec_ops = {
> +       .vidioc_querycap = virtvdec_vidioc_querycap,
> +       .vidioc_enum_framesizes = virtvdec_vidioc_enum_framesizes,
> +       .vidioc_enum_fmt_vid_cap = virtvdec_vidioc_enum_fmt_vid_cap,
> +       .vidioc_enum_fmt_vid_out = virtvdec_vidioc_enum_fmt_vid_out,
> +       .vidioc_g_fmt_vid_cap_mplane = virtvdec_vidioc_fmt_vid_cap_mplane,
> +       .vidioc_g_fmt_vid_out_mplane = virtvdec_vidioc_g_fmt_vid_out_mplane,
> +       .vidioc_try_fmt_vid_cap_mplane = virtvdec_vidioc_fmt_vid_cap_mplane,
> +       .vidioc_try_fmt_vid_out_mplane = virtvdec_vidioc_try_fmt_vid_out_mplane,
> +       .vidioc_s_fmt_vid_cap_mplane = virtvdec_vidioc_s_fmt_vid_cap_mplane,
> +       .vidioc_s_fmt_vid_out_mplane = virtvdec_vidioc_s_fmt_vid_out_mplane,
> +       .vidioc_g_selection = virtvdec_vidioc_g_selection,
> +       .vidioc_reqbufs = virtvdec_vidioc_reqbufs,
> +       .vidioc_querybuf = virtvdec_vidioc_querybuf,
> +       .vidioc_qbuf = virtvdec_vidioc_qbuf,
> +       .vidioc_dqbuf = virtvdec_vidioc_dqbuf,
> +       .vidioc_expbuf = virtvdec_vidioc_expbuf,
> +       .vidioc_streamon = virtvdec_vidioc_streamon,
> +       .vidioc_streamoff = virtvdec_vidioc_streamoff,
> +       .vidioc_subscribe_event = virtvdec_vidioc_subscribe_event,
> +       .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +
> +       .vidioc_decoder_cmd = virtvdec_vidioc_decoder_cmd,
> +       .vidioc_try_decoder_cmd = virtvdec_vidioc_try_decoder_cmd,
> +};
> +
> +/*
> + * Device operations
> + */
> +static int virtvdec_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
> +                               unsigned int *num_planes, unsigned int sizes[],
> +                               struct device *alloc_devs[])
> +{
> +       const struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(vq->drv_priv);
> +       const struct v4l2_pix_format_mplane *fmt;
> +       int i;
> +
> +       switch (vq->type) {
> +       case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +               fmt = &ctx->src_fmt;
> +               break;
> +       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +               fmt = &ctx->dst_fmt;
> +               break;
> +       default:
> +               vdec_err(ctx->dev, "unsupported buffer type: %d", vq->type);
> +               return -EINVAL;
> +       }
> +
> +       if (*num_buffers < 1)
> +               *num_buffers = 1;
> +
> +       if (*num_buffers > VIDEO_MAX_FRAME)
> +               *num_buffers = VIDEO_MAX_FRAME;
> +
> +       *num_planes = fmt->num_planes;
> +
> +       for (i = 0; i < *num_planes; ++i)
> +               sizes[i] = fmt->plane_fmt[i].sizeimage;
> +
> +       return 0;
> +}
> +
> +/**
> + * virtvdec_get_dma_buf_handle - get a virtgpu's resource handle from vb2_buffer
> + *
> + * This function relies on https://patchwork.kernel.org/patch/11142679/
> + */
> +static int virtvdec_get_dma_buf_handle(struct vb2_buffer *vb, u32 *handle)
> +{
> +       struct sg_table *sgt;
> +       int ret = 0;
> +
> +       sgt = vb2_dma_sg_plane_desc(vb, 0);
> +       if (IS_ERR(sgt))
> +               return PTR_ERR(sgt);
> +
> +       if (sgt->nents != 1)
> +               return -EINVAL;
> +
> +       *handle = sg_dma_address(sgt->sgl);
> +
> +       return ret;
> +}
> +
> +struct virtvdec_registered_handle {
> +       u32 handle;
> +       struct list_head list;
> +};
> +
> +/**
> + * virtvdec_handle_registered - check if a virtgpu handle is already registered
> + * to the host
> + */
> +static bool
> +virtvdec_handle_registered(const struct list_head *registered_handles,
> +                          u32 handle)
> +{
> +       struct virtvdec_registered_handle *cur, *next;
> +
> +       list_for_each_entry_safe(cur, next, registered_handles, list) {
> +               if (cur->handle == handle)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
> +static int virtvdec_buf_prepare(struct vb2_buffer *vb)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(vb->vb2_queue->drv_priv);
> +       struct list_head *registered_handles;
> +       u32 *handle_map;
> +       u32 virtio_buf_type;
> +       int ret;
> +       u32 handle = 0;
> +
> +       WARN_ON(!mutex_is_locked(&ctx->dev->lock));
> +
> +       ret = virtvdec_get_dma_buf_handle(vb, &handle);
> +       if (ret) {
> +               vdec_err(
> +                       ctx->dev,
> +                       "failed to get DMA-buf handle for OUTPUT buffer %d: %d",
> +                       vb->index, ret);
> +               return ret;
> +       }
> +
> +       if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> +               registered_handles = &ctx->outbuf_handles;
> +               handle_map = ctx->outbuf_handle_map;
> +               virtio_buf_type = VIRTIO_VDEC_GUEST_REQ_BUFFER_TYPE_BITSTREAM;
> +       } else {
> +               registered_handles = &ctx->capbuf_handles;
> +               handle_map = ctx->capbuf_handle_map;
> +               virtio_buf_type = VIRTIO_VDEC_GUEST_REQ_BUFFER_TYPE_FRAME;
> +       }
> +
> +       /* Register a resource handle to the host if it's unused so far */
> +       if (!virtvdec_handle_registered(registered_handles, handle)) {
> +               struct virtvdec_registered_handle *registered_handle;
> +
> +               ret = virtvdec_send_request_register_buffer(
> +                       ctx, virtio_buf_type, vb, handle);
> +               if (ret) {
> +                       vdec_err(ctx->dev,
> +                                "failed to register buffer: %d/%d %d", ctx->id,
> +                                vb->index, handle);
> +                       return ret;
> +               }
> +
> +               /* Remember that |handle| is registered */
> +               registered_handle =
> +                       devm_kzalloc(&ctx->dev->virt_dev->dev,
> +                                    sizeof(*registered_handle), GFP_KERNEL);
> +               registered_handle->handle = handle;
> +               list_add_tail(&registered_handle->list, registered_handles);
> +       }
> +
> +       /* Update the mapping from a index to resource handle */
> +       if (handle != handle_map[vb->index]) {
> +               int i;
> +
> +               /* Invalidate obsolete entries in the table */
> +               for (i = 0; i < VIRTIO_VDEC_MAX_BUFFER_COUNT; ++i)
> +                       if (handle_map[i] == handle)
> +                               handle_map[i] = 0;
> +
> +               handle_map[vb->index] = handle;
> +       }
> +
> +       return 0;
> +}
> +
> +static void virtvdec_buf_queue_core(struct vb2_buffer *vb)
> +{
> +       struct vb2_queue *vq = vb->vb2_queue;
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(vq->drv_priv);
> +       struct virtvdec_buf *buf = virtvdec_vb2_to_virtvdec_buf(vb);
> +       int ret;
> +
> +       WARN_ON(!mutex_is_locked(&ctx->dev->lock));
> +
> +       if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> +               list_add_tail(&buf->list, &ctx->src_queue);
> +
> +               ret = virtvdec_send_request_bitstream_buffer(ctx, vb);
> +
> +               if (ret)
> +                       vdec_err(ctx->dev,
> +                                "failed to send request_bitstream_buffer: %d",
> +                                ret);
> +       } else {
> +               list_add_tail(&buf->list, &ctx->dst_queue);
> +
> +               if (vb->index ==
> +                   VIRTIO_VDEC_DRAINED_NOTIFICATION_BUFFER_INDEX) {
> +                       ctx->stored_capbuf = vb;
> +                       return;
> +               }
> +
> +               ret = virtvdec_send_request_frame_buffer(ctx, vb);
> +               if (ret)
> +                       vdec_err(ctx->dev,
> +                                "failed to send request_frame_buffer");
> +       }
> +}
> +
> +static void virtvdec_buf_queue(struct vb2_buffer *vb)
> +{
> +       struct vb2_queue *vq = vb->vb2_queue;
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(vq->drv_priv);
> +
> +       WARN_ON(!mutex_is_locked(&ctx->dev->lock));
> +
> +       virtvdec_buf_queue_core(vb);
> +       switch (vq->type) {
> +       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +               ctx->capbuf_vb2_map[vb->index] = vb;
> +               return;
> +       case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +               ctx->outbuf_vb2_map[vb->index] = vb;
> +               return;
> +       default:
> +               vdec_err(ctx->dev, "unsupported buffer type: %d", vq->type);
> +       }
> +}
> +
> +static int virtvdec_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(vq->drv_priv);
> +
> +       if (ctx->state == VIRTVDEC_STATE_CAPTURE_SETUP)
> +               ctx->state = VIRTVDEC_STATE_DECODING;
> +       return 0;
> +}
> +
> +/**
> + * virtvdec_stop_streaming
> + *
> + * TODO(keiichiw):
> + * Though the user can call stop_streaming for each buffer queue
> + * separately (OUTPUT/CAPTURE), VIRTIO_VDEC_GUEST_REQ_DRAIN affects both
> + * queues. So, we might want to update the protocol. Otherwise, we need
> + * to re-enqueue some requeusts for the other buffer.
> + */
> +static void virtvdec_stop_streaming(struct vb2_queue *vq)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(vq->drv_priv);
> +       struct list_head *registered_handles;
> +       LIST_HEAD(queue);
> +       DEFINE_SUBSCRIPTION_FLUSHED(sub, ctx->id);
> +       int i, ret;
> +       u32 *handle_map;
> +
> +       if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +               if (ctx->state != VIRTVDEC_STATE_STOPPED) {
> +                       vdec_err(ctx->dev,
> +                                "stop_streaming for %s at state %d isn't supported",
> +                                V4L2_TYPE_IS_OUTPUT(vq->type) ? "OUTPUT" : "CAPTURE",
> +                                ctx->state);
> +                       return;
> +               }
> +
> +               list_splice_init(&ctx->src_queue, &queue);
> +               registered_handles = &ctx->outbuf_handles;
> +               handle_map = ctx->outbuf_handle_map;
> +       } else {
> +               list_splice_init(&ctx->dst_queue, &queue);
> +               registered_handles = &ctx->capbuf_handles;
> +               handle_map = ctx->capbuf_handle_map;
> +       }
> +
> +       /* Empty registered buffers */
> +       for (i = 0; i < VIRTIO_VDEC_MAX_BUFFER_COUNT; ++i)
> +               handle_map[i] = 0;
> +
> +       while (!list_empty(registered_handles)) {
> +               struct virtvdec_registered_handle *rh;
> +
> +               rh = list_first_entry(registered_handles,
> +                                     struct virtvdec_registered_handle, list);
> +               list_del(&rh->list);
> +       }
> +
> +       /* Send FLUSH request and wait for the response. */
> +       /* TODO(keiichiw): If no buffer, this FLUSH request can be skipped. */
> +       virtvdec_host_req_subscribe(ctx->dev, &sub);
> +       ret = virtvdec_send_request_flush(ctx);
> +       /* TODO(keiichiw): Should the driver signal an error? */
> +       if (ret)
> +               vdec_err(ctx->dev, "failed to send FLUSH request: %d", ret);
> +
> +       virtvdec_host_req_wait(ctx->dev, &sub);
> +
> +       while (!list_empty(&queue)) {
> +               struct virtvdec_buf *b =
> +                       list_first_entry(&queue, struct virtvdec_buf, list);
> +
> +               for (i = 0; i < b->vb.vb2_buf.num_planes; ++i)
> +                       vb2_set_plane_payload(&b->vb.vb2_buf, i, 0);
> +               vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +               list_del(&b->list);
> +       }
> +
> +       if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +               if (ctx->state == VIRTVDEC_STATE_STOPPED)
> +                       ctx->state = VIRTVDEC_STATE_SEEK;
> +       } else {
> +               ctx->state = VIRTVDEC_STATE_STOPPED;
> +       }
> +}
> +
> +static const struct vb2_ops virtvdec_qops = {
> +       .queue_setup = virtvdec_queue_setup,
> +       .buf_prepare = virtvdec_buf_prepare,
> +       .buf_queue = virtvdec_buf_queue,
> +       .start_streaming = virtvdec_start_streaming,
> +       .stop_streaming = virtvdec_stop_streaming,
> +       .wait_prepare = vb2_ops_wait_prepare,
> +       .wait_finish = vb2_ops_wait_finish,
> +};
> +
> +static int virtvdec_init_vb2_queue(struct vb2_queue *q,
> +                                  struct virtvdec_ctx *ctx,
> +                                  enum v4l2_buf_type type)
> +{
> +       q->type = type;
> +       q->io_modes = VB2_DMABUF;
> +       q->lock = &ctx->dev->lock;
> +       q->ops = &virtvdec_qops;
> +       q->mem_ops = &vb2_dma_sg_memops;
> +       q->drv_priv = &ctx->fh;
> +       q->buf_struct_size = sizeof(struct virtvdec_buf);
> +       q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +       q->dev = &ctx->dev->virt_dev->dev;
> +       return vb2_queue_init(q);
> +}
> +
> +static void
> +virtvdec_init_v4l2_fmt(const struct virtio_vdec_format_desc *vdec_fmt,
> +                      struct v4l2_pix_format_mplane *v4l2_fmt)
> +{
> +       memset(v4l2_fmt, 0, sizeof(*v4l2_fmt));
> +
> +       v4l2_fmt->pixelformat = vdec_fmt->fourcc;
> +       /* TODO(keiichiw): Is it okay to use max? */
> +       v4l2_fmt->width = vdec_fmt->width.max;
> +       v4l2_fmt->height = vdec_fmt->height.max;
> +}
> +
> +static struct virtio_vdec_format_desc *
> +virtvdec_get_default_format(struct virtvdec_dev *dev,
> +                           const bool bitstream_format)
> +{
> +       int i;
> +       struct virtio_vdec_format_desc *formats;
> +
> +       if (bitstream_format)
> +               formats = dev->src_fmts;
> +       else
> +               formats = dev->dst_fmts;
> +       for (i = 0; i < VIRTIO_VDEC_NUM_FORMATS; ++i) {
> +               if (formats[i].mask)
> +                       return &formats[i];
> +       }
> +
> +       return NULL;
> +}
> +
> +static int virtvdec_init_ctx(struct virtvdec_dev *dev, struct virtvdec_ctx *ctx)
> +{
> +       int ret;
> +
> +       ctx->state = VIRTVDEC_STATE_INITIALIZING;
> +       /* Initialize src/dst formats */
> +       ctx->vdec_src_fmt = virtvdec_get_default_format(dev, true);
> +       virtvdec_init_v4l2_fmt(ctx->vdec_src_fmt, &ctx->src_fmt);
> +       ctx->vdec_dst_fmt = virtvdec_get_default_format(dev, false);
> +       virtvdec_init_v4l2_fmt(ctx->vdec_dst_fmt, &ctx->dst_fmt);
> +       ctx->has_host_session = false;
> +       ret = virtvdec_init_vb2_queue(&ctx->src_vbq, ctx,
> +                                     V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +       if (ret) {
> +               vdec_err(dev, "failed to initialize OUTPUT buffer");
> +               return ret;
> +       }
> +       ret = virtvdec_init_vb2_queue(&ctx->dst_vbq, ctx,
> +                                     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +       if (ret) {
> +               vdec_err(dev, "failed to initialize CAPTURE buffer");
> +               return ret;
> +       }
> +
> +       INIT_LIST_HEAD(&ctx->src_queue);
> +       INIT_LIST_HEAD(&ctx->dst_queue);
> +       INIT_LIST_HEAD(&ctx->outbuf_handles);
> +       INIT_LIST_HEAD(&ctx->capbuf_handles);
> +
> +       return 0;
> +}
> +
> +struct virtvdec_ctrl {
> +       u32 id;
> +       s32 min;
> +       s32 max;
> +       s32 step;
> +       s32 def;
> +};
> +
> +static struct virtvdec_ctrl virtvdec_dec_ctrls[] = {
> +       {
> +               .id = V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
> +               .min = 1,
> +               .max = 32,
> +               .step = 1,
> +               .def = 8,
> +       },
> +};
> +
> +static int virtvdec_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops virtvdec_ctrl_ops = {
> +       .g_volatile_ctrl = virtvdec_g_volatile_ctrl,
> +};
> +
> +static int virtvdec_init_ctrl_handler(struct virtvdec_ctx *ctx)
> +{
> +       struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
> +       int num_ctrls;
> +       int i;
> +       int ret;
> +
> +       num_ctrls = ARRAY_SIZE(virtvdec_dec_ctrls);
> +       ret = v4l2_ctrl_handler_init(hdl, num_ctrls);
> +       if (ret)
> +               return ret;
> +
> +       for (i = 0; i < num_ctrls; ++i) {
> +               struct virtvdec_ctrl *ctrl = &virtvdec_dec_ctrls[i];
> +
> +               v4l2_ctrl_new_std(hdl, &virtvdec_ctrl_ops, ctrl->id, ctrl->min,
> +                                 ctrl->max, ctrl->step, ctrl->def);
> +       }
> +
> +       ret = hdl->error;
> +       if (ret) {
> +               v4l2_ctrl_handler_free(hdl);
> +               return ret;
> +       }
> +
> +       ctx->fh.ctrl_handler = hdl;
> +       return v4l2_ctrl_handler_setup(hdl);
> +}
> +
> +static int virtvdec_open(struct file *file)
> +{
> +       struct virtvdec_dev *dev = video_drvdata(file);
> +       struct virtvdec_ctx *ctx = NULL;
> +       int ret;
> +
> +       /* Initialize ctx */
> +       ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +       v4l2_fh_init(&ctx->fh, video_devdata(file));
> +       file->private_data = &ctx->fh;
> +       v4l2_fh_add(&ctx->fh);
> +
> +       ctx->dev = dev;
> +
> +       /*  Control_handler */
> +       ret = virtvdec_init_ctrl_handler(ctx);
> +       if (ret) {
> +               vdec_err(dev, "failed to initialize control handler");
> +               goto error;
> +       }
> +
> +       ret = virtvdec_init_ctx(dev, ctx);
> +       if (ret) {
> +               vdec_err(dev, "failed to initialize ctx");
> +               goto error;
> +       }
> +       return 0;
> +
> +error:
> +       kfree(ctx);
> +       return ret;
> +}
> +
> +static int virtvdec_release(struct file *file)
> +{
> +       struct virtvdec_dev *dev = video_drvdata(file);
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(file->private_data);
> +       int ret;
> +
> +       mutex_lock(&dev->lock);
> +
> +       ret = virtvdec_close_session(ctx);
> +
> +       v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +       virtvdec_del_context(dev, ctx->id);
> +       kfree(ctx);
> +
> +       mutex_unlock(&dev->lock);
> +       return ret;
> +}
> +
> +static __poll_t virtvdec_poll(struct file *file, poll_table *wait)
> +{
> +       struct virtvdec_ctx *ctx = virtvdec_fh_to_ctx(file->private_data);
> +       struct vb2_queue *src_q, *dst_q;
> +       struct vb2_buffer *src_vb = NULL, *dst_vb = NULL;
> +       unsigned int rc = 0;
> +       unsigned long flags;
> +
> +       src_q = &ctx->src_vbq;
> +       dst_q = &ctx->dst_vbq;
> +
> +       /*
> +        * There has to be at least one buffer queued on each queued_list, which
> +        * means either in driver already or waiting for driver to claim it
> +        * and start processing.
> +        */
> +       if ((!vb2_is_streaming(src_q) || list_empty(&src_q->queued_list)) &&
> +           (!vb2_is_streaming(dst_q) || list_empty(&dst_q->queued_list))) {
> +               return POLLERR;
> +       }
> +
> +       poll_wait(file, &ctx->fh.wait, wait);
> +       poll_wait(file, &src_q->done_wq, wait);
> +       poll_wait(file, &dst_q->done_wq, wait);
> +
> +       if (v4l2_event_pending(&ctx->fh))
> +               rc |= POLLPRI;
> +
> +       spin_lock_irqsave(&src_q->done_lock, flags);
> +
> +       if (!list_empty(&src_q->done_list))
> +               src_vb = list_first_entry(&src_q->done_list, struct vb2_buffer,
> +                                         done_entry);
> +
> +       if (src_vb && (src_vb->state == VB2_BUF_STATE_DONE ||
> +                      src_vb->state == VB2_BUF_STATE_ERROR))
> +               rc |= POLLOUT | POLLWRNORM;
> +
> +       spin_unlock_irqrestore(&src_q->done_lock, flags);
> +
> +       spin_lock_irqsave(&dst_q->done_lock, flags);
> +
> +       if (!list_empty(&dst_q->done_list))
> +               dst_vb = list_first_entry(&dst_q->done_list, struct vb2_buffer,
> +                                         done_entry);
> +
> +       if (dst_vb && (dst_vb->state == VB2_BUF_STATE_DONE ||
> +                      dst_vb->state == VB2_BUF_STATE_ERROR))
> +               rc |= POLLIN | POLLRDNORM;
> +
> +       spin_unlock_irqrestore(&dst_q->done_lock, flags);
> +
> +       return rc;
> +}
> +
> +static const struct v4l2_file_operations virtvdec_fops = {
> +       .owner = THIS_MODULE,
> +       .open = virtvdec_open,
> +       .release = virtvdec_release,
> +       .unlocked_ioctl = video_ioctl2,
> +       .poll = virtvdec_poll,
> +};
> +
> +static int virtvdec_fill_supported_format(struct virtvdec_dev *dev)
> +{
> +       DEFINE_SUBSCRIPTION_QUERY(sub);
> +       int ret;
> +
> +       WARN_ON(!mutex_is_locked(&dev->lock));
> +
> +       virtvdec_host_req_subscribe(dev, &sub);
> +       ret = virtvdec_send_request_query(dev);
> +       if (ret)
> +               return ret;
> +       virtvdec_host_req_wait(dev, &sub);
> +       return sub.result;
> +}
> +
> +static int virtvdec_init_virtqueues(struct virtio_device *vdev,
> +                                   struct virtvdec_dev *dev)
> +{
> +       vq_callback_t *callbacks[] = { virtvdec_vq_in_cb, virtvdec_vq_out_cb };
> +       static const char * const names[] = { "in", "out" };
> +       struct virtqueue *vqs[2];
> +       int ret;
> +
> +       /* Initialize virtqueues */
> +       ret = virtio_find_vqs(vdev, 2, vqs, callbacks, names, NULL);
> +       if (ret) {
> +               dev_err(&vdev->dev, "failed to find virtio vdec queues: %d",
> +                       ret);
> +               return ret;
> +       }
> +       dev->vq_in = vqs[0];
> +       dev->vq_out = vqs[1];
> +
> +       mutex_init(&dev->vq_in_lock);
> +       mutex_init(&dev->vq_out_lock);
> +
> +       INIT_WORK(&dev->vq_in_work, virtvdec_vq_in_work_handler);
> +       INIT_WORK(&dev->vq_out_work, virtvdec_vq_out_work_handler);
> +
> +       init_waitqueue_head(&dev->out_waitq);
> +
> +       return 0;
> +}
> +
> +static int virtvdec_probe(struct virtio_device *virt_dev)
> +{
> +       int ret;
> +       struct virtvdec_dev *dev;
> +       struct video_device *vid_dev;
> +
> +       dev = devm_kzalloc(&virt_dev->dev, sizeof(*dev), GFP_KERNEL);
> +       if (!dev)
> +               return -ENOMEM;
> +       virt_dev->priv = dev;
> +       dev->virt_dev = virt_dev;
> +       /* Initialize counters */
> +       dev->num_ctxs = 1;
> +
> +       mutex_init(&dev->lock);
> +       vid_dev = &dev->vid_dev;
> +       strlcpy(vid_dev->name, "virtio-vdec", sizeof(vid_dev->name));
> +       vid_dev->v4l2_dev = &dev->v4l2_dev;
> +       vid_dev->fops = &virtvdec_fops;
> +       vid_dev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> +       vid_dev->vfl_dir = VFL_DIR_M2M;
> +       vid_dev->ioctl_ops = &virtvdec_ioctl_dec_ops;
> +       vid_dev->lock = &dev->lock;
> +       vid_dev->release = video_device_release_empty;
> +       video_set_drvdata(vid_dev, dev);
> +
> +       /*  Initialize Virtio device */
> +       ret = virtvdec_init_virtqueues(virt_dev, dev);
> +       if (ret)
> +               return ret;
> +
> +       INIT_LIST_HEAD(&dev->subscriptions);
> +       INIT_LIST_HEAD(&dev->contexts);
> +
> +       ret = virtvdec_init_inqueue(dev);
> +       if (ret) {
> +               dev_err(&virt_dev->dev, "failed to fill in virtqueue: %d", ret);
> +               return ret;
> +       }
> +
> +       virtio_device_ready(virt_dev);
> +       virtqueue_kick(dev->vq_in);
> +
> +       mutex_lock(&dev->lock);
> +       ret = virtvdec_fill_supported_format(dev);
> +       mutex_unlock(&dev->lock);
> +       if (ret)
> +               return ret;
> +
> +       dma_coerce_mask_and_coherent(&virt_dev->dev, DMA_BIT_MASK(64));
> +
> +       ret = v4l2_device_register(&virt_dev->dev, &dev->v4l2_dev);
> +       if (ret) {
> +               dev_err(&virt_dev->dev, "failed registering V4L2 device");
> +               return ret;
> +       }
> +
> +       ret = video_register_device(vid_dev, VFL_TYPE_GRABBER, 0);
> +       if (ret) {
> +               dev_err(&virt_dev->dev, "failed registering video device: %d",
> +                       ret);
> +               goto unregister_v4l2_device;
> +       }
> +
> +       v4l2_info(&dev->v4l2_dev, "Device registered as /dev/video%d",
> +                 vid_dev->num);
> +
> +       return 0;
> +
> +unregister_v4l2_device:
> +       v4l2_device_unregister(&dev->v4l2_dev);
> +       mutex_destroy(&dev->lock);
> +       return ret;
> +}
> +
> +static void virtvdec_remove(struct virtio_device *virt_dev)
> +{
> +       /* TODO(keiichiw): implement */
> +}
> +
> +static struct virtio_device_id id_table[] = {
> +       { VIRTIO_ID_VDEC, VIRTIO_DEV_ANY_ID },
> +       { 0 },
> +};
> +
> +static struct virtio_driver virtvdec_driver = {
> +       .driver.name = KBUILD_MODNAME,
> +       .driver.owner = THIS_MODULE,
> +       .id_table = id_table,
> +       .probe = virtvdec_probe,
> +       .remove = virtvdec_remove,
> +};
> +
> +module_virtio_driver(virtvdec_driver);
> +MODULE_DEVICE_TABLE(virtio, id_table);
> +MODULE_DESCRIPTION("VirtIO video decoder driver");
> +MODULE_AUTHOR("Keiichi Watanabe <keiichiw@chromium.org>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index 585e07b27333..c0d941e10a1e 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -46,5 +46,6 @@
>  #define VIRTIO_ID_IOMMU        23 /* virtio IOMMU */
>  #define VIRTIO_ID_FS           26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM         27 /* virtio pmem */
> +#define VIRTIO_ID_VDEC         40 /* virtio video decoder */
>
>  #endif /* _LINUX_VIRTIO_IDS_H */
> diff --git a/include/uapi/linux/virtio_vdec.h b/include/uapi/linux/virtio_vdec.h
> new file mode 100644
> index 000000000000..70dfc2662b79
> --- /dev/null
> +++ b/include/uapi/linux/virtio_vdec.h
> @@ -0,0 +1,224 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * VirtIO Video Decoder
> + *
> + * Copyright 2019 Google LLC.
> + */
> +
> +#ifndef _LINUX_VIRTIO_VDEC_H
> +#define _LINUX_VIRTIO_VDEC_H
> +#include <linux/types.h>
> +
> +#define VIRTIO_VDEC_VQ_OUT 0
> +#define VIRTIO_VDEC_VQ_IN 1
> +#define VIRTIO_VDEC_QUEUE_COUNT 2
> +#define VIRTIO_VDEC_NUM_FORMATS 32
> +
> +/* Same with VIDEO_MAX_PLANES in videodev2.h */
> +#define VIRTIO_VDEC_MAX_PLANES 8
> +
> +/*
> + * Query
> + */
> +struct virtio_vdec_range {
> +       __le32 min;
> +       __le32 max;
> +       __le32 step;
> +};
> +
> +struct virtio_vdec_format_desc {
> +       __le32 fourcc;
> +       /*
> +        * For bitstream formats: Bit (1 << N) corresponds to frame_formats[N].
> +        * For frame formats: Bit (1 << N) corresponds to bitstream_formats[N].
> +        * entry is invalid if 0
> +        */
> +       __le32 mask;
> +       /*
> +        * For bitstream formats: Stream coded resolution.
> +        * For frame formats:   Frame buffer resolution.
> +        */
> +       struct virtio_vdec_range width;
> +       struct virtio_vdec_range height;
> +};
> +
> +struct virtio_vdec_host_req_query {
> +       struct virtio_vdec_format_desc
> +               bitstream_formats[VIRTIO_VDEC_NUM_FORMATS];
> +       struct virtio_vdec_format_desc frame_formats[VIRTIO_VDEC_NUM_FORMATS];
> +};
> +
> +/*
> + * Open
> + */
> +struct virtio_vdec_guest_req_open {
> +       __le32 coded_fourcc;
> +};
> +
> +/*
> + * Set Buffer Count
> + */
> +
> +enum virtio_vdec_buffer_type {
> +       VIRTIO_VDEC_GUEST_REQ_BUFFER_TYPE_BITSTREAM = 0,
> +       VIRTIO_VDEC_GUEST_REQ_BUFFER_TYPE_FRAME = 1,
> +};
> +
> +struct virtio_vdec_guest_req_set_buffer_count {
> +       __le32 type;
> +       __le32 buffer_count;
> +};
> +
> +struct virtio_vdec_host_req_set_buffer_count {
> +       __le32 type;
> +       __le32 buffer_count;
> +};
> +
> +/*
> + * Register Buffer
> + */
> +
> +struct virtio_vdec_guest_req_register_buffer {
> +       __le32 type;
> +       __le32 num_planes;
> +       struct virtio_vdec_plane {
> +               __le32 handle;
> +               __le32 offset;
> +               __le32 length;
> +       } planes[VIRTIO_VDEC_MAX_PLANES];
> +};
> +
> +struct virtio_vdec_host_req_register_buffer {
> +       __le32 type;
> +       __le32 handles[VIRTIO_VDEC_MAX_PLANES];
> +};
> +
> +/*
> + * Decode
> + */
> +
> +struct virtio_vdec_guest_req_frame_buffer {
> +       struct virtio_vdec_frame_buffer_plane {
> +               __le32 handle;
> +               __le32 offset;
> +               __le32 stride;
> +               __le32 length; /* length of plane data */
> +       } planes[VIRTIO_VDEC_MAX_PLANES];
> +};
> +
> +struct virtio_vdec_guest_req_bitstream_buffer {
> +       __le32 handle;
> +       __le32 offset;
> +       __le32 length; /* length of valid data */
> +       __le64 cookie;
> +};
> +
> +/*
> + * Stream info
> + */
> +
> +struct virtio_vdec_host_req_stream_info {
> +       __le32 raw_fourcc;
> +       __le32 fb_width;
> +       __le32 fb_height;
> +       __le32 min_frame_buffer_count;
> +       __le32 max_frame_buffer_count;
> +       struct virtio_vdec_host_req_stream_crop {
> +               __le32 left;
> +               __le32 top;
> +               __le32 width;
> +               __le32 height;
> +       } crop;
> +};
> +
> +struct virtio_vdec_host_req_frame_buffer {
> +       __le32 handles[VIRTIO_VDEC_MAX_PLANES];
> +       __le64 cookie;
> +};
> +
> +struct virtio_vdec_host_req_bitstream_buffer {
> +       __le32 handle;
> +};
> +
> +/*
> + * Guest/Host Requests
> + */
> +
> +enum virtio_vdec_guest_req_type {
> +       VIRTIO_VDEC_GUEST_REQ_UNDEFINED = 0,
> +
> +       /* Global */
> +       VIRTIO_VDEC_GUEST_REQ_QUERY = 0x0100,
> +
> +       /* Per instance */
> +       VIRTIO_VDEC_GUEST_REQ_OPEN = 0x0200,
> +       VIRTIO_VDEC_GUEST_REQ_SET_BUFFER_COUNT,
> +       VIRTIO_VDEC_GUEST_REQ_REGISTER_BUFFER,
> +       VIRTIO_VDEC_GUEST_REQ_BITSTREAM_BUFFER,
> +       VIRTIO_VDEC_GUEST_REQ_ACK_STREAM_INFO,
> +       VIRTIO_VDEC_GUEST_REQ_FRAME_BUFFER,
> +       VIRTIO_VDEC_GUEST_REQ_DRAIN,
> +       VIRTIO_VDEC_GUEST_REQ_FLUSH,
> +       VIRTIO_VDEC_GUEST_REQ_CLOSE,
> +};
> +
> +struct virtio_vdec_guest_req {
> +       __le32 type;
> +       __le32 instance_id;
> +       __le32 reserved;
> +       union {
> +               struct virtio_vdec_guest_req_open open;
> +               struct virtio_vdec_guest_req_set_buffer_count set_buffer_count;
> +               struct virtio_vdec_guest_req_register_buffer register_buffer;
> +               struct virtio_vdec_guest_req_bitstream_buffer bitstream_buffer;
> +               struct virtio_vdec_guest_req_frame_buffer frame_buffer;
> +       };
> +};
> +
> +enum virtio_vdec_host_req_type {
> +       VIRTIO_VDEC_HOST_REQ_UNDEFINED = 0,
> +
> +       /* Global */
> +       VIRTIO_VDEC_HOST_REQ_QUERY = 0x0100,
> +
> +       /* Per instance */
> +       VIRTIO_VDEC_HOST_REQ_OPEN = 0x0200,
> +       VIRTIO_VDEC_HOST_REQ_SET_BUFFER_COUNT,
> +       VIRTIO_VDEC_HOST_REQ_REGISTER_BUFFER,
> +       VIRTIO_VDEC_HOST_REQ_BITSTREAM_BUFFER,
> +       VIRTIO_VDEC_HOST_REQ_STREAM_INFO,
> +       VIRTIO_VDEC_HOST_REQ_FRAME_BUFFER,
> +       VIRTIO_VDEC_HOST_REQ_DRAINED,
> +       VIRTIO_VDEC_HOST_REQ_FLUSHED,
> +       VIRTIO_VDEC_HOST_REQ_CLOSE,
> +       VIRTIO_VDEC_HOST_REQ_EOS,
> +
> +       /* Global Error response */
> +       VIRTIO_VDEC_HOST_REQ_NOTIFY_GLOBAL_ERROR = 0x1100,
> +};
> +
> +enum virtio_vdec_host_req_result {
> +       /* Success */
> +       VIRTIO_VDEC_HOST_REQ_RESULT_SUCCESS = 0,
> +
> +       /* Error */
> +       VIRTIO_VDEC_HOST_REQ_RESULT_ERROR_UNSPEC = 0x1000,
> +       VIRTIO_VDEC_HOST_REQ_RESULT_ERROR_INVALID_REQUEST,
> +       VIRTIO_VDEC_HOST_REQ_RESULT_ERROR_INVALID_INSTANCE_ID,
> +};
> +
> +struct virtio_vdec_host_req {
> +       __le32 type; /* VIRTIO_VDEC_HOST_REQ_* */
> +       __le32 result; /* VIRTIO_VDEC_HOST_REQ_RESULT_ */
> +       __le32 instance_id;
> +       __le32 reserved; /* for 64-bit alignment */
> +       union {
> +               struct virtio_vdec_host_req_query query;
> +               struct virtio_vdec_host_req_set_buffer_count set_buffer_count;
> +               struct virtio_vdec_host_req_register_buffer register_buffer;
> +               struct virtio_vdec_host_req_bitstream_buffer bitstream_buffer;
> +               struct virtio_vdec_host_req_stream_info stream_info;
> +               struct virtio_vdec_host_req_frame_buffer frame_buffer;
> +       };
> +};
> +#endif /* _LINUX_VIRTIO_VDEC_H */
> --
> 2.24.0.rc0.303.g954a862665-goog
>

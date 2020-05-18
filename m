Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39F41D7B5D
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 16:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgEROgr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 10:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbgEROgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 10:36:47 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779C3C061A0C
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 07:36:45 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id n5so10759086wmd.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 07:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oNW7opUL9Ahibylk0CWlrCURGJcXRHM8AlAqJFfFa6s=;
        b=Gaace6Lg0kbz9ERgViXak5FDXJdM9NFujNti10RUcj3ErfLUz9T6U881Wx0DyoDuhn
         gFLdXdTOhcvZG3GYYIAf2LXati6WGZWQ16x3AsKhDEn9mvVcMbb7wgiev05X/v7n/gRd
         D/aeIgzKtC4jh2GzwVYE32NpZTvlijHNrf0uXymyYOYkVff7poYZ9sRKYDlVCHoGpHnx
         OC62utGCt/wWUWbO/bc8GeEIGMHTMU5ZBE2oJfOIt94/wg2bMSxLa6wsEaocezWeVY2Y
         Wj0mILGvNgKOQ4NjPY1LDjtxAjIpfzb8HO4XybwTIab0hhvlEKvHmfU34lLSV+YSOyTu
         Zp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oNW7opUL9Ahibylk0CWlrCURGJcXRHM8AlAqJFfFa6s=;
        b=ZmS94rLGou3I8MooXiZB5Q6sSPlqslBXV0ACNhEAAYEQCwsgtoT6xGWVq4+Nvb8gEB
         cpc5FmSP3wAe6Ba+vPjrR2H5kX0TFZ56XeBnWgyunY50mWLTtOlHYVX0z7AXN1GUoTmC
         9be5K+uMImP0PgNpOXTHwEZl3ZeikPOBjRZ7RcO/jLk78FbU+9AHub71JJv+WCddBfoJ
         HlusqxEplhvkxi2DtKA7BGgj0Yh7PXX0Lj6dl33yD7oTDmhbnwqrkaMdrs9Ju9rA4QcD
         fdEwE/EUlfetXVFKB6CU89e6g67O32SuyU+0RhTIoPnlTGNXoUSU6Tzdc5ivL7NhIg7/
         tXTw==
X-Gm-Message-State: AOAM530iehraFQYtwYCjSUDrwv3Dg6p/9nfKVPyrwLBI5KPoYKERLTOu
        7vkRKtOuq1LU7oj+MLpHl9u6CecCtWXHAn0rzIebEw==
X-Google-Smtp-Source: ABdhPJwWW/g0qw+U9zPJmRncQqee4zwntPniinxLgFRWcF0qwrnUMcQgkgaqh3Z3YHomQyQ6UgqTJ7NxOtNHPeWHSK0=
X-Received: by 2002:a1c:2457:: with SMTP id k84mr18715250wmk.96.1589812603344;
 Mon, 18 May 2020 07:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-34-laurent.pinchart@ideasonboard.com> <3de6ce28-1089-19c2-cdac-64796a46638f@xs4all.nl>
In-Reply-To: <3de6ce28-1089-19c2-cdac-64796a46638f@xs4all.nl>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 18 May 2020 15:36:27 +0100
Message-ID: <CAPY8ntBDss5ZKPo3mRUP0-9KNHA6kQEQwrnvyUpOh0Ru7O5CKA@mail.gmail.com>
Subject: Re: [PATCH v2 33/34] staging: bcm2835-isp: Add support for BC2835 ISP
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans.

Thanks for the review.
A few of these I need to leave for Naush to answer.
Ideas On Board have been contracted to drive this upstreaming process,
so many of these will be left to them to address and generate a v2.

On Mon, 18 May 2020 at 13:02, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 04/05/2020 11:26, Laurent Pinchart wrote:
> > From: Naushir Patuck <naush@raspberrypi.com>
> >
> > Port the V4L2 compatible driver for the ISP unit found on Broadcom BCM2=
835
> > chips.
> >
> > The driver interfaces though the VideoCore unit using the VCHIQ MMAL
> > interface.
> >
> > ISP driver upported from from RaspberryPi BSP at revision:
> > 6c3505be6c3e ("staging: vc04_services: isp: Make all references to bcm2=
835_isp_fmt const")
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > [Adapt to staging by moving all modifications that in the BSP are scatt=
ered
> > in core components inside this directory]
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../v4l/pixfmt-meta-bcm2835-isp-stats.rst     |   41 +
> >  drivers/staging/vc04_services/Kconfig         |    2 +
> >  drivers/staging/vc04_services/Makefile        |    1 +
> >  .../staging/vc04_services/bcm2835-isp/Kconfig |   14 +
> >  .../vc04_services/bcm2835-isp/Makefile        |   10 +
> >  .../bcm2835-isp/bcm2835-v4l2-isp.c            | 1632 +++++++++++++++++
> >  .../bcm2835-isp/bcm2835_isp_ctrls.h           |   67 +
> >  .../bcm2835-isp/bcm2835_isp_fmts.h            |  301 +++
> >  .../include/uapi/linux/bcm2835-isp.h          |  333 ++++
> >  .../staging/vc04_services/vchiq-mmal/Kconfig  |    3 +-
> >  .../vc04_services/vchiq-mmal/mmal-encodings.h |    4 +
> >  .../vchiq-mmal/mmal-parameters.h              |  153 +-
> >  12 files changed, 2559 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/staging/vc04_services/Documentation/userspa=
ce-api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst
> >  create mode 100644 drivers/staging/vc04_services/bcm2835-isp/Kconfig
> >  create mode 100644 drivers/staging/vc04_services/bcm2835-isp/Makefile
> >  create mode 100644 drivers/staging/vc04_services/bcm2835-isp/bcm2835-v=
4l2-isp.c
> >  create mode 100644 drivers/staging/vc04_services/bcm2835-isp/bcm2835_i=
sp_ctrls.h
> >  create mode 100644 drivers/staging/vc04_services/bcm2835-isp/bcm2835_i=
sp_fmts.h
> >  create mode 100644 drivers/staging/vc04_services/include/uapi/linux/bc=
m2835-isp.h
> >
>
> <snip>
>
> > diff --git a/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp=
.c b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
> > new file mode 100644
> > index 000000000000..a32faab4b8dc
> > --- /dev/null
> > +++ b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
> > @@ -0,0 +1,1632 @@
>
> <snip>
>
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Broadcom BCM2835 ISP driver
> > + *
> > + * Copyright =C2=A9 2019-2020 Raspberry Pi (Trading) Ltd.
> > + *
> > + * Author: Naushir Patuck (naush@raspberrypi.com)
> > + *
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +
> > +#include "vchiq-mmal/mmal-msg.h"
> > +#include "vchiq-mmal/mmal-parameters.h"
> > +#include "vchiq-mmal/mmal-vchiq.h"
> > +
> > +#include "bcm2835_isp_ctrls.h"
> > +#include "bcm2835_isp_fmts.h"
> > +
> > +static unsigned int debug;
> > +module_param(debug, uint, 0644);
> > +MODULE_PARM_DESC(debug, "activates debug info");
> > +
> > +static unsigned int video_nr =3D 13;
> > +module_param(video_nr, uint, 0644);
> > +MODULE_PARM_DESC(video_nr, "base video device number");
> > +
> > +#define BCM2835_ISP_NAME "bcm2835-isp"
> > +#define BCM2835_ISP_ENTITY_NAME_LEN 32
> > +
> > +#define BCM2835_ISP_NUM_OUTPUTS 1
> > +#define BCM2835_ISP_NUM_CAPTURES 2
> > +#define BCM2835_ISP_NUM_METADATA 1
> > +
> > +#define BCM2835_ISP_NUM_NODES                                         =
       \
> > +             (BCM2835_ISP_NUM_OUTPUTS + BCM2835_ISP_NUM_CAPTURES +   \
> > +              BCM2835_ISP_NUM_METADATA)
> > +
> > +/* Default frame dimension of 1280 pixels. */
> > +#define DEFAULT_DIM 1280U
> > +/*
> > + * Maximum frame dimension of 16384 pixels.  Even though the ISP runs =
in tiles,
> > + * have a sensible limit so that we do not create an excessive number =
of tiles
> > + * to process.
> > + */
> > +#define MAX_DIM 16384U
> > +/*
> > + * Minimum frame dimension of 64 pixels.  Anything lower, and the tili=
ng
> > + * algorihtm may not be able to cope when applying filter context.
> > + */
> > +#define MIN_DIM 64U
> > +
> > +/* Per-queue, driver-specific private data */
> > +struct bcm2835_isp_q_data {
> > +     /*
> > +      * These parameters should be treated as gospel, with everything =
else
> > +      * being determined from them.
> > +      */
> > +     unsigned int bytesperline;
> > +     unsigned int width;
> > +     unsigned int height;
> > +     unsigned int sizeimage;
> > +     const struct bcm2835_isp_fmt *fmt;
> > +};
> > +
> > +/*
> > + * Structure to describe a single node /dev/video<N> which represents =
a single
> > + * input or output queue to the ISP device.
> > + */
> > +struct bcm2835_isp_node {
> > +     int vfl_dir;
> > +     unsigned int id;
> > +     const char *name;
> > +     struct video_device vfd;
> > +     struct media_pad pad;
> > +     struct media_intf_devnode *intf_devnode;
> > +     struct media_link *intf_link;
> > +     struct mutex lock; /* top level device node lock */
> > +     struct mutex queue_lock;
> > +
> > +     struct vb2_queue queue;
> > +     unsigned int sequence;
> > +
> > +     /* The list of formats supported on the node. */
> > +     struct bcm2835_isp_fmt_list supported_fmts;
> > +
> > +     struct bcm2835_isp_q_data q_data;
> > +
> > +     /* Parent device structure */
> > +     struct bcm2835_isp_dev *dev;
> > +
> > +     bool registered;
> > +     bool media_node_registered;
> > +     bool queue_init;
> > +};
> > +
> > +/*
> > + * Structure representing the entire ISP device, comprising several in=
put and
> > + * output nodes /dev/video<N>.
> > + */
> > +struct bcm2835_isp_dev {
> > +     struct v4l2_device v4l2_dev;
> > +     struct device *dev;
> > +     struct v4l2_ctrl_handler ctrl_handler;
> > +     struct media_device mdev;
> > +     struct media_entity entity;
> > +     bool media_device_registered;
> > +     bool media_entity_registered;
> > +     struct vchiq_mmal_instance *mmal_instance;
> > +     struct vchiq_mmal_component *component;
> > +     struct completion frame_cmplt;
> > +
> > +     struct bcm2835_isp_node node[BCM2835_ISP_NUM_NODES];
> > +     struct media_pad pad[BCM2835_ISP_NUM_NODES];
> > +     atomic_t num_streaming;
> > +
> > +     /* Image pipeline controls. */
> > +     int r_gain;
> > +     int b_gain;
> > +};
> > +
> > +struct bcm2835_isp_buffer {
> > +     struct vb2_v4l2_buffer vb;
> > +     struct mmal_buffer mmal;
> > +};
> > +
> > +static
> > +inline struct bcm2835_isp_dev *node_get_dev(struct bcm2835_isp_node *n=
ode)
> > +{
> > +     return node->dev;
> > +}
> > +
> > +static inline bool node_is_output(struct bcm2835_isp_node *node)
> > +{
> > +     return node->queue.type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT;
> > +}
> > +
> > +static inline bool node_is_capture(struct bcm2835_isp_node *node)
> > +{
> > +     return node->queue.type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
> > +}
> > +
> > +static inline bool node_is_stats(struct bcm2835_isp_node *node)
> > +{
> > +     return node->queue.type =3D=3D V4L2_BUF_TYPE_META_CAPTURE;
> > +}
> > +
> > +static inline enum v4l2_buf_type index_to_queue_type(int index)
> > +{
> > +     if (index < BCM2835_ISP_NUM_OUTPUTS)
> > +             return V4L2_BUF_TYPE_VIDEO_OUTPUT;
> > +     else if (index < BCM2835_ISP_NUM_OUTPUTS + BCM2835_ISP_NUM_CAPTUR=
ES)
> > +             return V4L2_BUF_TYPE_VIDEO_CAPTURE;
> > +     else
> > +             return V4L2_BUF_TYPE_META_CAPTURE;
> > +}
> > +
> > +static struct vchiq_mmal_port *get_port_data(struct bcm2835_isp_node *=
node)
> > +{
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +
> > +     if (!dev->component)
> > +             return NULL;
> > +
> > +     switch (node->queue.type) {
> > +     case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> > +             return &dev->component->input[node->id];
> > +     case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > +     case V4L2_BUF_TYPE_META_CAPTURE:
> > +             return &dev->component->output[node->id];
> > +     default:
> > +             v4l2_err(&dev->v4l2_dev, "%s: Invalid queue type %u\n",
> > +                      __func__, node->queue.type);
> > +             break;
> > +     }
> > +     return NULL;
> > +}
> > +
> > +static int set_isp_param(struct bcm2835_isp_node *node, u32 parameter,
> > +                      void *value, u32 value_size)
> > +{
> > +     struct vchiq_mmal_port *port =3D get_port_data(node);
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +
> > +     return vchiq_mmal_port_parameter_set(dev->mmal_instance, port,
> > +                                          parameter, value, value_size=
);
> > +}
> > +
> > +static int set_wb_gains(struct bcm2835_isp_node *node)
> > +{
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     struct mmal_parameter_awbgains gains =3D {
> > +             .r_gain =3D { dev->r_gain, 1000 },
> > +             .b_gain =3D { dev->b_gain, 1000 }
> > +     };
> > +
> > +     return set_isp_param(node, MMAL_PARAMETER_CUSTOM_AWB_GAINS,
> > +                          &gains, sizeof(gains));
> > +}
> > +
> > +static int set_digital_gain(struct bcm2835_isp_node *node, uint32_t ga=
in)
> > +{
> > +     struct mmal_parameter_rational digital_gain =3D {
> > +             .num =3D gain,
> > +             .den =3D 1000
> > +     };
> > +
> > +     return set_isp_param(node, MMAL_PARAMETER_DIGITAL_GAIN,
> > +                          &digital_gain, sizeof(digital_gain));
> > +}
> > +
> > +static const struct bcm2835_isp_fmt *get_fmt(u32 mmal_fmt)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(supported_formats); i++) {
> > +             if (supported_formats[i].mmal_fmt =3D=3D mmal_fmt)
> > +                     return &supported_formats[i];
> > +     }
> > +     return NULL;
> > +}
> > +
> > +static const
> > +struct bcm2835_isp_fmt *find_format_by_fourcc(unsigned int fourcc,
> > +                                           struct bcm2835_isp_node *no=
de)
> > +{
> > +     struct bcm2835_isp_fmt_list *fmts =3D &node->supported_fmts;
> > +     const struct bcm2835_isp_fmt *fmt;
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < fmts->num_entries; i++) {
> > +             fmt =3D fmts->list[i];
> > +             if (fmt->fourcc =3D=3D fourcc)
> > +                     return fmt;
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +static const
> > +struct bcm2835_isp_fmt *find_format(struct v4l2_format *f,
> > +                                 struct bcm2835_isp_node *node)
> > +{
> > +     return find_format_by_fourcc(node_is_stats(node) ?
> > +                                  f->fmt.meta.dataformat :
> > +                                  f->fmt.pix.pixelformat,
> > +                                  node);
> > +}
> > +
> > +/* vb2_to_mmal_buffer() - converts vb2 buffer header to MMAL
> > + *
> > + * Copies all the required fields from a VB2 buffer to the MMAL buffer=
 header,
> > + * ready for sending to the VPU.
> > + */
> > +static void vb2_to_mmal_buffer(struct mmal_buffer *buf,
> > +                            struct vb2_v4l2_buffer *vb2)
> > +{
> > +     u64 pts;
> > +
> > +     buf->mmal_flags =3D 0;
> > +     if (vb2->flags & V4L2_BUF_FLAG_KEYFRAME)
> > +             buf->mmal_flags |=3D MMAL_BUFFER_HEADER_FLAG_KEYFRAME;
> > +
> > +     /* Data must be framed correctly as one frame per buffer. */
> > +     buf->mmal_flags |=3D MMAL_BUFFER_HEADER_FLAG_FRAME_END;
> > +
> > +     buf->length =3D vb2->vb2_buf.planes[0].bytesused;
> > +     /*
> > +      * Minor ambiguity in the V4L2 spec as to whether passing in a 0 =
length
> > +      * buffer, or one with V4L2_BUF_FLAG_LAST set denotes end of stre=
am.
> > +      * Handle either.
> > +      */
> > +     if (!buf->length || vb2->flags & V4L2_BUF_FLAG_LAST)
> > +             buf->mmal_flags |=3D MMAL_BUFFER_HEADER_FLAG_EOS;
> > +
> > +     /* vb2 timestamps in nsecs, mmal in usecs */
> > +     pts =3D vb2->vb2_buf.timestamp;
> > +     do_div(pts, 1000);
> > +     buf->pts =3D pts;
> > +     buf->dts =3D MMAL_TIME_UNKNOWN;
> > +}
> > +
> > +static void mmal_buffer_cb(struct vchiq_mmal_instance *instance,
> > +                        struct vchiq_mmal_port *port, int status,
> > +                        struct mmal_buffer *mmal_buf)
> > +{
> > +     struct bcm2835_isp_buffer *q_buf;
> > +     struct bcm2835_isp_node *node =3D port->cb_ctx;
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     struct vb2_v4l2_buffer *vb2;
> > +
> > +     q_buf =3D container_of(mmal_buf, struct bcm2835_isp_buffer, mmal)=
;
> > +     vb2 =3D &q_buf->vb;
> > +     v4l2_dbg(2, debug, &dev->v4l2_dev,
> > +              "%s: port:%s[%d], status:%d, buf:%p, dmabuf:%p, length:%=
lu, flags %u, pts %lld\n",
> > +              __func__, node_is_output(node) ? "input" : "output", nod=
e->id,
> > +              status, mmal_buf, mmal_buf->dma_buf, mmal_buf->length,
> > +              mmal_buf->mmal_flags, mmal_buf->pts);
> > +
> > +     if (mmal_buf->cmd)
> > +             v4l2_err(&dev->v4l2_dev,
> > +                      "%s: Unexpected event on output callback - %08x\=
n",
> > +                      __func__, mmal_buf->cmd);
> > +
> > +     if (status) {
> > +             /* error in transfer */
> > +             if (vb2) {
> > +                     /* there was a buffer with the error so return it=
 */
> > +                     vb2_buffer_done(&vb2->vb2_buf, VB2_BUF_STATE_ERRO=
R);
> > +             }
> > +             return;
> > +     }
> > +
> > +     /* vb2 timestamps in nsecs, mmal in usecs */
> > +     vb2->vb2_buf.timestamp =3D mmal_buf->pts * 1000;
> > +     vb2->sequence =3D node->sequence++;
> > +     vb2_set_plane_payload(&vb2->vb2_buf, 0, mmal_buf->length);
> > +     vb2_buffer_done(&vb2->vb2_buf, VB2_BUF_STATE_DONE);
> > +
> > +     if (!port->enabled)
> > +             complete(&dev->frame_cmplt);
> > +}
> > +
> > +static void setup_mmal_port_format(struct bcm2835_isp_node *node,
> > +                                struct vchiq_mmal_port *port)
> > +{
> > +     struct bcm2835_isp_q_data *q_data =3D &node->q_data;
> > +
> > +     port->format.encoding =3D q_data->fmt->mmal_fmt;
> > +     /* Raw image format - set width/height */
> > +     port->es.video.width =3D (q_data->bytesperline << 3) / q_data->fm=
t->depth;
> > +     port->es.video.height =3D q_data->height;
> > +     port->es.video.crop.width =3D q_data->width;
> > +     port->es.video.crop.height =3D q_data->height;
> > +     port->es.video.crop.x =3D 0;
> > +     port->es.video.crop.y =3D 0;
> > +};
> > +
> > +static int setup_mmal_port(struct bcm2835_isp_node *node)
> > +{
> > +     struct vchiq_mmal_port *port =3D get_port_data(node);
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     unsigned int enable =3D 1;
> > +     int ret;
> > +
> > +     v4l2_dbg(2, debug, &dev->v4l2_dev, "%s: setup %s[%d]\n", __func__=
,
> > +              node->name, node->id);
> > +
> > +     vchiq_mmal_port_parameter_set(dev->mmal_instance, port,
> > +                                   MMAL_PARAMETER_ZERO_COPY, &enable,
> > +                                   sizeof(enable));
> > +     setup_mmal_port_format(node, port);
> > +     ret =3D vchiq_mmal_port_set_format(dev->mmal_instance, port);
> > +     if (ret < 0) {
> > +             v4l2_dbg(1, debug, &dev->v4l2_dev,
> > +                      "%s: vchiq_mmal_port_set_format failed\n",
> > +                      __func__);
> > +             return ret;
> > +     }
> > +
> > +     if (node->q_data.sizeimage < port->minimum_buffer.size) {
> > +             v4l2_err(&dev->v4l2_dev,
> > +                      "buffer size mismatch sizeimage %u < min size %u=
\n",
> > +                      node->q_data.sizeimage, port->minimum_buffer.siz=
e);
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int bcm2835_isp_mmal_buf_cleanup(struct mmal_buffer *mmal_buf)
> > +{
> > +     mmal_vchi_buffer_cleanup(mmal_buf);
> > +
> > +     if (mmal_buf->dma_buf) {
> > +             dma_buf_put(mmal_buf->dma_buf);
> > +             mmal_buf->dma_buf =3D NULL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int bcm2835_isp_node_queue_setup(struct vb2_queue *q,
> > +                                     unsigned int *nbuffers,
> > +                                     unsigned int *nplanes,
> > +                                     unsigned int sizes[],
> > +                                     struct device *alloc_devs[])
> > +{
> > +     struct bcm2835_isp_node *node =3D vb2_get_drv_priv(q);
> > +     struct vchiq_mmal_port *port;
> > +     unsigned int size;
> > +
> > +     if (setup_mmal_port(node))
> > +             return -EINVAL;
> > +
> > +     size =3D node->q_data.sizeimage;
> > +     if (size =3D=3D 0) {
> > +             v4l2_info(&node_get_dev(node)->v4l2_dev,
> > +                       "%s: Image size unset in queue_setup for node %=
s[%d]\n",
> > +                       __func__, node->name, node->id);
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (*nplanes)
> > +             return sizes[0] < size ? -EINVAL : 0;
> > +
> > +     *nplanes =3D 1;
> > +     sizes[0] =3D size;
> > +
> > +     port =3D get_port_data(node);
> > +     port->current_buffer.size =3D size;
> > +
> > +     if (*nbuffers < port->minimum_buffer.num)
> > +             *nbuffers =3D port->minimum_buffer.num;
> > +
> > +     port->current_buffer.num =3D *nbuffers;
> > +
> > +     v4l2_dbg(2, debug, &node_get_dev(node)->v4l2_dev,
> > +              "%s: Image size %u, nbuffers %u for node %s[%d]\n",
> > +              __func__, sizes[0], *nbuffers, node->name, node->id);
> > +     return 0;
> > +}
> > +
> > +static int bcm2835_isp_buf_init(struct vb2_buffer *vb)
> > +{
> > +     struct bcm2835_isp_node *node =3D vb2_get_drv_priv(vb->vb2_queue)=
;
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     struct vb2_v4l2_buffer *vb2 =3D to_vb2_v4l2_buffer(vb);
> > +     struct bcm2835_isp_buffer *buf =3D
> > +             container_of(vb2, struct bcm2835_isp_buffer, vb);
> > +
> > +     v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: vb %p\n", __func__, vb);
> > +
> > +     buf->mmal.buffer =3D vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> > +     buf->mmal.buffer_size =3D vb2_plane_size(&buf->vb.vb2_buf, 0);
> > +     mmal_vchi_buffer_init(dev->mmal_instance, &buf->mmal);
> > +     return 0;
> > +}
> > +
> > +static int bcm2835_isp_buf_prepare(struct vb2_buffer *vb)
> > +{
> > +     struct bcm2835_isp_node *node =3D vb2_get_drv_priv(vb->vb2_queue)=
;
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     struct vb2_v4l2_buffer *vb2 =3D to_vb2_v4l2_buffer(vb);
> > +     struct bcm2835_isp_buffer *buf =3D
> > +             container_of(vb2, struct bcm2835_isp_buffer, vb);
> > +     struct dma_buf *dma_buf;
> > +     int ret;
> > +
> > +     v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: type: %d ptr %p\n",
> > +              __func__, vb->vb2_queue->type, vb);
> > +
> > +     if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> > +             if (vb2->field =3D=3D V4L2_FIELD_ANY)
> > +                     vb2->field =3D V4L2_FIELD_NONE;
> > +             if (vb2->field !=3D V4L2_FIELD_NONE) {
> > +                     v4l2_err(&dev->v4l2_dev,
> > +                              "%s field isn't supported\n", __func__);
> > +                     return -EINVAL;
> > +             }
> > +     }
> > +
> > +     if (vb2_plane_size(vb, 0) < node->q_data.sizeimage) {
> > +             v4l2_err(&dev->v4l2_dev,
> > +                      "%s data will not fit into plane (%lu < %lu)\n",
> > +                      __func__, vb2_plane_size(vb, 0),
> > +                      (long)node->q_data.sizeimage);
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
> > +             vb2_set_plane_payload(vb, 0, node->q_data.sizeimage);
> > +
> > +     switch (vb->memory) {
> > +     case VB2_MEMORY_DMABUF:
> > +             dma_buf =3D dma_buf_get(vb->planes[0].m.fd);
> > +
> > +             if (dma_buf !=3D buf->mmal.dma_buf) {
> > +                     /*
> > +                      * dmabuf either hasn't already been mapped, or i=
t has
> > +                      * changed.
> > +                      */
> > +                     if (buf->mmal.dma_buf) {
> > +                             v4l2_err(&dev->v4l2_dev,
> > +                                      "%s Buffer changed - why did the=
 core not call cleanup?\n",
> > +                                      __func__);
> > +                             bcm2835_isp_mmal_buf_cleanup(&buf->mmal);
> > +                     }
> > +
> > +                     buf->mmal.dma_buf =3D dma_buf;
> > +             } else {
> > +                     /*
> > +                      * Already have a reference to the buffer, so rel=
ease it
> > +                      * here.
> > +                      */
> > +                     dma_buf_put(dma_buf);
> > +             }
> > +             ret =3D 0;
> > +             break;
> > +     case VB2_MEMORY_MMAP:
> > +             /*
> > +              * We want to do this at init, but vb2_core_expbuf checks=
 that
> > +              * the index < q->num_buffers, and q->num_buffers only ge=
ts
> > +              * updated once all the buffers are allocated.
> > +              */
> > +             if (!buf->mmal.dma_buf) {
> > +                     ret =3D vb2_core_expbuf_dmabuf(vb->vb2_queue,
> > +                                                  vb->vb2_queue->type,
> > +                                                  vb->index, 0, O_CLOE=
XEC,
> > +                                                  &buf->mmal.dma_buf);
> > +                     v4l2_dbg(3, debug, &dev->v4l2_dev,
> > +                              "%s: exporting ptr %p to dmabuf %p\n",
> > +                              __func__, vb, buf->mmal.dma_buf);
> > +                     if (ret)
> > +                             v4l2_err(&dev->v4l2_dev,
> > +                                      "%s: Failed to expbuf idx %d, re=
t %d\n",
> > +                                      __func__, vb->index, ret);
> > +             } else {
> > +                     ret =3D 0;
> > +             }
> > +             break;
> > +     default:
> > +             ret =3D -EINVAL;
> > +             break;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static void bcm2835_isp_node_buffer_queue(struct vb2_buffer *buf)
> > +{
> > +     struct bcm2835_isp_node *node =3D vb2_get_drv_priv(buf->vb2_queue=
);
> > +     struct vb2_v4l2_buffer *vbuf =3D
> > +             container_of(buf, struct vb2_v4l2_buffer, vb2_buf);
> > +     struct bcm2835_isp_buffer *buffer =3D
> > +             container_of(vbuf, struct bcm2835_isp_buffer, vb);
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +
> > +     v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: node %s[%d], buffer %p\n"=
,
> > +              __func__, node->name, node->id, buffer);
> > +
> > +     vb2_to_mmal_buffer(&buffer->mmal, &buffer->vb);
> > +     v4l2_dbg(3, debug, &dev->v4l2_dev,
> > +              "%s: node %s[%d] - submitting  mmal dmabuf %p\n", __func=
__,
> > +              node->name, node->id, buffer->mmal.dma_buf);
> > +     vchiq_mmal_submit_buffer(dev->mmal_instance, get_port_data(node),
> > +                              &buffer->mmal);
> > +}
> > +
> > +static void bcm2835_isp_buffer_cleanup(struct vb2_buffer *vb)
> > +{
> > +     struct vb2_v4l2_buffer *vb2 =3D to_vb2_v4l2_buffer(vb);
> > +     struct bcm2835_isp_buffer *buffer =3D
> > +             container_of(vb2, struct bcm2835_isp_buffer, vb);
> > +
> > +     bcm2835_isp_mmal_buf_cleanup(&buffer->mmal);
> > +}
> > +
> > +static int bcm2835_isp_node_start_streaming(struct vb2_queue *q,
> > +                                         unsigned int count)
> > +{
> > +     struct bcm2835_isp_node *node =3D vb2_get_drv_priv(q);
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     struct vchiq_mmal_port *port =3D get_port_data(node);
> > +     int ret;
> > +
> > +     v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: node %s[%d] (count %u)\n"=
,
> > +              __func__, node->name, node->id, count);
> > +
> > +     ret =3D vchiq_mmal_component_enable(dev->mmal_instance, dev->comp=
onent);
> > +     if (ret) {
> > +             v4l2_err(&dev->v4l2_dev, "%s: Failed enabling component, =
ret %d\n",
> > +                      __func__, ret);
> > +             return -EIO;
> > +     }
> > +
> > +     node->sequence =3D 0;
> > +     port->cb_ctx =3D node;
> > +     ret =3D vchiq_mmal_port_enable(dev->mmal_instance, port,
> > +                                  mmal_buffer_cb);
> > +     if (!ret)
> > +             atomic_inc(&dev->num_streaming);
> > +     else
> > +             v4l2_err(&dev->v4l2_dev,
> > +                      "%s: Failed enabling port, ret %d\n", __func__, =
ret);
> > +
>
> It's not obvious from this code what happens with outstanding buffers if =
there
> is an error. They should be returned to vb2 with state VB2_BUF_STATE_QUEU=
ED.
> Does that happen?

No, it doesn't. That needs to be fixed.

> > +     return ret;
> > +}
> > +
> > +static void bcm2835_isp_node_stop_streaming(struct vb2_queue *q)
> > +{
> > +     struct bcm2835_isp_node *node =3D vb2_get_drv_priv(q);
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     struct vchiq_mmal_port *port =3D get_port_data(node);
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: node %s[%d], mmal port %p=
\n",
> > +              __func__, node->name, node->id, port);
> > +
> > +     init_completion(&dev->frame_cmplt);
> > +
> > +     /* Disable MMAL port - this will flush buffers back */
> > +     ret =3D vchiq_mmal_port_disable(dev->mmal_instance, port);
> > +     if (ret)
> > +             v4l2_err(&dev->v4l2_dev,
> > +                      "%s: Failed disabling %s port, ret %d\n", __func=
__,
> > +                      node_is_output(node) ? "i/p" : "o/p",
> > +                      ret);
> > +
> > +     while (atomic_read(&port->buffers_with_vpu)) {
> > +             v4l2_dbg(1, debug, &dev->v4l2_dev,
> > +                      "%s: Waiting for buffers to be returned - %d out=
standing\n",
> > +                      __func__, atomic_read(&port->buffers_with_vpu));
> > +             ret =3D wait_for_completion_timeout(&dev->frame_cmplt, HZ=
);
> > +             if (ret <=3D 0) {
> > +                     v4l2_err(&dev->v4l2_dev,
> > +                              "%s: Timeout waiting for buffers to be r=
eturned - %d outstanding\n",
> > +                              __func__,
> > +                              atomic_read(&port->buffers_with_vpu));
> > +                     break;
> > +             }
> > +     }
> > +
> > +     /* Release the VCSM handle here to release the associated dmabuf =
*/
> > +     for (i =3D 0; i < q->num_buffers; i++) {
> > +             struct vb2_v4l2_buffer *vb2 =3D to_vb2_v4l2_buffer(q->buf=
s[i]);
> > +             struct bcm2835_isp_buffer *buf =3D
> > +                     container_of(vb2, struct bcm2835_isp_buffer, vb);
> > +             bcm2835_isp_mmal_buf_cleanup(&buf->mmal);
> > +     }
> > +
> > +     atomic_dec(&dev->num_streaming);
> > +     /* If all ports disabled, then disable the component */
> > +     if (atomic_read(&dev->num_streaming) =3D=3D 0) {
> > +             ret =3D vchiq_mmal_component_disable(dev->mmal_instance,
> > +                                                dev->component);
> > +             if (ret) {
> > +                     v4l2_err(&dev->v4l2_dev,
> > +                              "%s: Failed disabling component, ret %d\=
n",
> > +                              __func__, ret);
> > +             }
> > +     }
> > +
> > +     /*
> > +      * Simply wait for any vb2 buffers to finish. We could take steps=
 to
> > +      * make them complete more quickly if we care, or even return the=
m
> > +      * ourselves.
> > +      */
> > +     vb2_wait_for_all_buffers(&node->queue);
> > +}
> > +
> > +static const struct vb2_ops bcm2835_isp_node_queue_ops =3D {
> > +     .queue_setup            =3D bcm2835_isp_node_queue_setup,
> > +     .buf_init               =3D bcm2835_isp_buf_init,
> > +     .buf_prepare            =3D bcm2835_isp_buf_prepare,
> > +     .buf_queue              =3D bcm2835_isp_node_buffer_queue,
> > +     .buf_cleanup            =3D bcm2835_isp_buffer_cleanup,
> > +     .start_streaming        =3D bcm2835_isp_node_start_streaming,
> > +     .stop_streaming         =3D bcm2835_isp_node_stop_streaming,
> > +};
> > +
> > +static const
> > +struct bcm2835_isp_fmt *get_default_format(struct bcm2835_isp_node *no=
de)
> > +{
> > +     return node->supported_fmts.list[0];
> > +}
> > +
> > +static inline unsigned int get_bytesperline(int width,
> > +                                         const struct bcm2835_isp_fmt =
*fmt)
> > +{
> > +     return ALIGN((width * fmt->depth) >> 3, fmt->bytesperline_align);
> > +}
> > +
> > +static inline unsigned int get_sizeimage(int bpl, int width, int heigh=
t,
> > +                                      const struct bcm2835_isp_fmt *fm=
t)
> > +{
> > +     return (bpl * height * fmt->size_multiplier_x2) >> 1;
> > +}
> > +
> > +static int bcm2835_isp_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct bcm2835_isp_dev *dev =3D
> > +           container_of(ctrl->handler, struct bcm2835_isp_dev, ctrl_ha=
ndler);
> > +     struct bcm2835_isp_node *node =3D &dev->node[0];
> > +     int ret =3D 0;
> > +
> > +     /*
> > +      * The ISP firmware driver will ensure these settings are applied=
 on
> > +      * a frame boundary, so we are safe to write them as they come in=
.
> > +      *
> > +      * Note that the bcm2835_isp_* param structures are identical to =
the
> > +      * mmal-parameters.h definitions.  This avoids the need for unnec=
essary
> > +      * field-by-field copying between structures.
> > +      */
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_RED_BALANCE:
> > +             dev->r_gain =3D ctrl->val;
> > +             ret =3D set_wb_gains(node);
> > +             break;
> > +     case V4L2_CID_BLUE_BALANCE:
> > +             dev->b_gain =3D ctrl->val;
> > +             ret =3D set_wb_gains(node);
> > +             break;
> > +     case V4L2_CID_DIGITAL_GAIN:
> > +             ret =3D set_digital_gain(node, ctrl->val);
> > +             break;
> > +     case V4L2_CID_USER_BCM2835_ISP_CC_MATRIX:
> > +             ret =3D set_isp_param(node, MMAL_PARAMETER_CUSTOM_CCM,
> > +                                 ctrl->p_new.p_u8,
> > +                                 sizeof(struct bcm2835_isp_custom_ccm)=
);
> > +             break;
> > +     case V4L2_CID_USER_BCM2835_ISP_LENS_SHADING:
> > +             ret =3D set_isp_param(node, MMAL_PARAMETER_LENS_SHADING_O=
VERRIDE,
> > +                                 ctrl->p_new.p_u8,
> > +                                 sizeof(struct bcm2835_isp_lens_shadin=
g));
> > +             break;
> > +     case V4L2_CID_USER_BCM2835_ISP_BLACK_LEVEL:
> > +             ret =3D set_isp_param(node, MMAL_PARAMETER_BLACK_LEVEL,
> > +                                 ctrl->p_new.p_u8,
> > +                                 sizeof(struct bcm2835_isp_black_level=
));
> > +             break;
> > +     case V4L2_CID_USER_BCM2835_ISP_GEQ:
> > +             ret =3D set_isp_param(node, MMAL_PARAMETER_GEQ,
> > +                                 ctrl->p_new.p_u8,
> > +                                 sizeof(struct bcm2835_isp_geq));
> > +             break;
> > +     case V4L2_CID_USER_BCM2835_ISP_GAMMA:
> > +             ret =3D set_isp_param(node, MMAL_PARAMETER_GAMMA,
> > +                                 ctrl->p_new.p_u8,
> > +                                 sizeof(struct bcm2835_isp_gamma));
> > +             break;
> > +     case V4L2_CID_USER_BCM2835_ISP_DENOISE:
> > +             ret =3D set_isp_param(node, MMAL_PARAMETER_DENOISE,
> > +                                 ctrl->p_new.p_u8,
> > +                                 sizeof(struct bcm2835_isp_denoise));
> > +             break;
> > +     case V4L2_CID_USER_BCM2835_ISP_SHARPEN:
> > +             ret =3D set_isp_param(node, MMAL_PARAMETER_SHARPEN,
> > +                                 ctrl->p_new.p_u8,
> > +                                 sizeof(struct bcm2835_isp_sharpen));
> > +             break;
> > +     case V4L2_CID_USER_BCM2835_ISP_DPC:
> > +             ret =3D set_isp_param(node, MMAL_PARAMETER_DPC,
> > +                                 ctrl->p_new.p_u8,
> > +                                 sizeof(struct bcm2835_isp_dpc));
> > +             break;
> > +     default:
> > +             v4l2_info(&dev->v4l2_dev, "Unrecognised control\n");
> > +             ret =3D -EINVAL;
> > +     }
> > +
> > +     if (ret) {
> > +             v4l2_err(&dev->v4l2_dev, "%s: Failed setting ctrl \"%s\" =
(%08x), err %d\n",
> > +                      __func__, ctrl->name, ctrl->id, ret);
> > +             ret =3D -EIO;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops bcm2835_isp_ctrl_ops =3D {
> > +     .s_ctrl =3D bcm2835_isp_s_ctrl,
> > +};
> > +
> > +static const struct v4l2_file_operations bcm2835_isp_fops =3D {
> > +     .owner          =3D THIS_MODULE,
> > +     .open           =3D v4l2_fh_open,
> > +     .release        =3D vb2_fop_release,
> > +     .poll           =3D vb2_fop_poll,
> > +     .unlocked_ioctl =3D video_ioctl2,
> > +     .mmap           =3D vb2_fop_mmap
> > +};
> > +
> > +static int populate_qdata_fmt(struct v4l2_format *f,
> > +                           struct bcm2835_isp_node *node)
> > +{
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     struct bcm2835_isp_q_data *q_data =3D &node->q_data;
> > +     struct vchiq_mmal_port *port;
> > +     int ret;
> > +
> > +     if (!node_is_stats(node)) {
> > +             v4l2_dbg(1, debug, &dev->v4l2_dev,
> > +                      "%s: Setting pix format for type %d, wxh: %ux%u,=
 fmt: %08x, size %u\n",
> > +                      __func__, f->type, f->fmt.pix.width, f->fmt.pix.=
height,
> > +                      f->fmt.pix.pixelformat, f->fmt.pix.sizeimage);
> > +
> > +             q_data->fmt =3D find_format(f, node);
> > +             q_data->width =3D f->fmt.pix.width;
> > +             q_data->height =3D f->fmt.pix.height;
> > +             q_data->height =3D f->fmt.pix.height;
> > +
> > +             /* All parameters should have been set correctly by try_f=
mt */
> > +             q_data->bytesperline =3D f->fmt.pix.bytesperline;
> > +             q_data->sizeimage =3D f->fmt.pix.sizeimage;
> > +     } else {
> > +             v4l2_dbg(1, debug, &dev->v4l2_dev,
> > +                      "%s: Setting meta format for fmt: %08x, size %u\=
n",
> > +                      __func__, f->fmt.meta.dataformat,
> > +                      f->fmt.meta.buffersize);
> > +
> > +             q_data->fmt =3D find_format(f, node);
> > +             q_data->width =3D 0;
> > +             q_data->height =3D 0;
> > +             q_data->bytesperline =3D 0;
> > +             q_data->sizeimage =3D f->fmt.meta.buffersize;
> > +     }
> > +
> > +     v4l2_dbg(1, debug, &dev->v4l2_dev,
> > +              "%s: Calculated bpl as %u, size %u\n", __func__,
> > +              q_data->bytesperline, q_data->sizeimage);
> > +
> > +     /* If we have a component then setup the port as well */
> > +     port =3D get_port_data(node);
> > +     setup_mmal_port_format(node, port);
> > +     ret =3D vchiq_mmal_port_set_format(dev->mmal_instance, port);
> > +     if (ret) {
> > +             v4l2_err(&dev->v4l2_dev,
> > +                      "%s: Failed vchiq_mmal_port_set_format on port, =
ret %d\n",
> > +                      __func__, ret);
> > +             ret =3D -EINVAL;
> > +     }
> > +
> > +     if (q_data->sizeimage < port->minimum_buffer.size) {
> > +             v4l2_err(&dev->v4l2_dev,
> > +                      "%s: Current buffer size of %u < min buf size %u=
 - driver mismatch to MMAL\n",
> > +                      __func__,
> > +                      q_data->sizeimage,
> > +                      port->minimum_buffer.size);
> > +     }
> > +
> > +     v4l2_dbg(1, debug, &dev->v4l2_dev,
> > +              "%s: Set format for type %d, wxh: %dx%d, fmt: %08x, size=
 %u\n",
> > +              __func__, f->type, q_data->width, q_data->height,
> > +              q_data->fmt->fourcc, q_data->sizeimage);
> > +
> > +     return ret;
> > +}
> > +
> > +static int bcm2835_isp_node_querycap(struct file *file, void *priv,
> > +                                  struct v4l2_capability *cap)
> > +{
> > +     strscpy(cap->driver, BCM2835_ISP_NAME, sizeof(cap->driver));
> > +     strscpy(cap->card, BCM2835_ISP_NAME, sizeof(cap->card));
> > +     snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> > +              BCM2835_ISP_NAME);
> > +
> > +     return 0;
> > +}
> > +
> > +static int bcm2835_isp_node_g_fmt(struct file *file, void *priv,
> > +                               struct v4l2_format *f)
> > +{
> > +     struct bcm2835_isp_node *node =3D video_drvdata(file);
> > +
> > +     if (f->type !=3D node->queue.type)
> > +             return -EINVAL;
> > +
> > +     if (node_is_stats(node)) {
> > +             f->fmt.meta.dataformat =3D V4L2_META_FMT_BCM2835_ISP_STAT=
S;
> > +             f->fmt.meta.buffersize =3D
> > +                     get_port_data(node)->minimum_buffer.size;
> > +     } else {
> > +             struct bcm2835_isp_q_data *q_data =3D &node->q_data;
> > +
> > +             f->fmt.pix.width =3D q_data->width;
> > +             f->fmt.pix.height =3D q_data->height;
> > +             f->fmt.pix.field =3D V4L2_FIELD_NONE;
> > +             f->fmt.pix.pixelformat =3D q_data->fmt->fourcc;
> > +             f->fmt.pix.bytesperline =3D q_data->bytesperline;
> > +             f->fmt.pix.sizeimage =3D q_data->sizeimage;
> > +             f->fmt.pix.colorspace =3D q_data->fmt->colorspace;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int bcm2835_isp_node_enum_fmt(struct file *file, void  *priv,
> > +                                  struct v4l2_fmtdesc *f)
> > +{
> > +     struct bcm2835_isp_node *node =3D video_drvdata(file);
> > +     struct bcm2835_isp_fmt_list *fmts =3D &node->supported_fmts;
> > +
> > +     if (f->type !=3D node->queue.type)
> > +             return -EINVAL;
> > +
> > +     if (f->index < fmts->num_entries) {
> > +             /* Format found */
> > +             f->pixelformat =3D fmts->list[f->index]->fourcc;
> > +             f->flags =3D fmts->list[f->index]->flags;
> > +             return 0;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int bcm2835_isp_enum_framesizes(struct file *file, void *priv,
> > +                                    struct v4l2_frmsizeenum *fsize)
> > +{
> > +     struct bcm2835_isp_node *node =3D video_drvdata(file);
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     const struct bcm2835_isp_fmt *fmt;
> > +
> > +     if (node_is_stats(node) || fsize->index)
> > +             return -EINVAL;
> > +
> > +     fmt =3D find_format_by_fourcc(fsize->pixel_format, node);
> > +     if (!fmt) {
> > +             v4l2_err(&dev->v4l2_dev, "Invalid pixel code: %x\n",
> > +                      fsize->pixel_format);
> > +             return -EINVAL;
> > +     }
> > +
> > +     fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> > +     fsize->stepwise.min_width =3D MIN_DIM;
> > +     fsize->stepwise.max_width =3D MAX_DIM;
> > +     fsize->stepwise.step_width =3D fmt->step_size;
> > +
> > +     fsize->stepwise.min_height =3D MIN_DIM;
> > +     fsize->stepwise.max_height =3D MAX_DIM;
> > +     fsize->stepwise.step_height =3D fmt->step_size;
> > +
> > +     return 0;
> > +}
> > +
> > +static int bcm2835_isp_node_try_fmt(struct file *file, void *priv,
> > +                                 struct v4l2_format *f)
> > +{
> > +     struct bcm2835_isp_node *node =3D video_drvdata(file);
> > +     const struct bcm2835_isp_fmt *fmt;
> > +
> > +     if (f->type !=3D node->queue.type)
> > +             return -EINVAL;
> > +
> > +     fmt =3D find_format(f, node);
> > +     if (!fmt)
> > +             fmt =3D get_default_format(node);
> > +
> > +     if (!node_is_stats(node)) {
> > +             f->fmt.pix.width =3D max(min(f->fmt.pix.width, MAX_DIM),
> > +                                    MIN_DIM);
> > +             f->fmt.pix.height =3D max(min(f->fmt.pix.height, MAX_DIM)=
,
> > +                                     MIN_DIM);
> > +
> > +             f->fmt.pix.pixelformat =3D fmt->fourcc;
> > +             f->fmt.pix.colorspace =3D fmt->colorspace;
> > +             f->fmt.pix.bytesperline =3D get_bytesperline(f->fmt.pix.w=
idth,
> > +                                                        fmt);
> > +             f->fmt.pix.field =3D V4L2_FIELD_NONE;
> > +             f->fmt.pix.sizeimage =3D
> > +                     get_sizeimage(f->fmt.pix.bytesperline, f->fmt.pix=
.width,
> > +                                   f->fmt.pix.height, fmt);
> > +     } else {
> > +             f->fmt.meta.dataformat =3D fmt->fourcc;
> > +             f->fmt.meta.buffersize =3D
> > +                             get_port_data(node)->minimum_buffer.size;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int bcm2835_isp_node_s_fmt(struct file *file, void *priv,
> > +                               struct v4l2_format *f)
> > +{
> > +     struct bcm2835_isp_node *node =3D video_drvdata(file);
> > +     int ret;
> > +
> > +     if (f->type !=3D node->queue.type)
> > +             return -EINVAL;
> > +
> > +     ret =3D bcm2835_isp_node_try_fmt(file, priv, f);
> > +     if (ret)
> > +             return ret;
> > +
> > +     v4l2_dbg(1, debug, &node_get_dev(node)->v4l2_dev,
> > +              "%s: Set format for node %s[%d]\n",
> > +              __func__, node->name, node->id);
> > +
> > +     return populate_qdata_fmt(f, node);
> > +}
> > +
> > +static int bcm2835_isp_node_s_selection(struct file *file, void *fh,
> > +                                     struct v4l2_selection *s)
> > +{
> > +     struct mmal_parameter_crop crop;
> > +     struct bcm2835_isp_node *node =3D video_drvdata(file);
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     struct vchiq_mmal_port *port =3D get_port_data(node);
> > +
> > +     /* This return value is required fro V4L2 compliance. */
> > +     if (node_is_stats(node))
> > +             return -ENOTTY;
> > +
> > +     if (!s->r.width || !s->r.height)
> > +             return -EINVAL;
>
> I'm missing a check for s->target.

Ack

> > +
> > +     /* Adjust the crop window if goes outside the frame dimensions. *=
/
> > +     s->r.left =3D min((unsigned int)max(s->r.left, 0),
> > +                     node->q_data.width - MIN_DIM);
> > +     s->r.top =3D min((unsigned int)max(s->r.top, 0),
> > +                    node->q_data.height - MIN_DIM);
> > +     s->r.width =3D max(min(s->r.width, node->q_data.width - s->r.left=
),
> > +                      MIN_DIM);
> > +     s->r.height =3D max(min(s->r.height, node->q_data.height - s->r.t=
op),
> > +                       MIN_DIM);
> > +
> > +     crop.rect.x =3D s->r.left;
> > +     crop.rect.y =3D s->r.top;
> > +     crop.rect.width =3D s->r.width;
> > +     crop.rect.height =3D s->r.height;
> > +
> > +     return vchiq_mmal_port_parameter_set(dev->mmal_instance, port,
> > +                                          MMAL_PARAMETER_CROP,
> > +                                          &crop, sizeof(crop));
> > +}
> > +
> > +static int bcm2835_isp_node_g_selection(struct file *file, void *fh,
> > +                                     struct v4l2_selection *s)
> > +{
> > +     struct bcm2835_isp_node *node =3D video_drvdata(file);
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     struct vchiq_mmal_port *port =3D get_port_data(node);
> > +     struct mmal_parameter_crop crop;
> > +     u32 crop_size =3D sizeof(crop);
> > +     int ret;
> > +
> > +     /* This return value is required for V4L2 compliance. */
> > +     if (node_is_stats(node))
> > +             return -ENOTTY;
> > +
> > +     /* We can only return out an input crop. */
> > +     if (s->target !=3D V4L2_SEL_TGT_CROP)
> > +             return -EINVAL;
>
> No support for _TGT_CROP_DEFAULT/BOUNDS? Those are usually supported
> by drivers and are typically set to the width/height of the current
> format.
>
> I recommend adding support for these targets.

Trying to find any good M2M drivers to use as an example was tricky,
but if the return value can be as simple as the current width/height,
then that's easy.

> > +
> > +     ret =3D vchiq_mmal_port_parameter_get(dev->mmal_instance, port,
> > +                                         MMAL_PARAMETER_CROP,
> > +                                         &crop, &crop_size);
> > +     if (!ret)
> > +             return -EINVAL;
> > +
> > +     s->r.left =3D crop.rect.x;
> > +     s->r.top =3D crop.rect.y;
> > +     s->r.width =3D crop.rect.width;
> > +     s->r.height =3D crop.rect.height;
> > +
> > +     return 0;
> > +}
> > +
> > +static int bcm3285_isp_subscribe_event(struct v4l2_fh *fh,
> > +                                    const struct v4l2_event_subscripti=
on *s)
> > +{
> > +     switch (s->type) {
> > +     /* Cannot change source parameters dynamically at runtime. */
> > +     case V4L2_EVENT_SOURCE_CHANGE:
> > +             return -EINVAL;
> > +     case V4L2_EVENT_CTRL:
> > +             return v4l2_ctrl_subscribe_event(fh, s);
> > +     default:
> > +             return v4l2_event_subscribe(fh, s, 4, NULL);
> > +     }
> > +}
> > +
> > +static const struct v4l2_ioctl_ops bcm2835_isp_node_ioctl_ops =3D {
> > +     .vidioc_querycap                =3D bcm2835_isp_node_querycap,
> > +     .vidioc_g_fmt_vid_cap           =3D bcm2835_isp_node_g_fmt,
> > +     .vidioc_g_fmt_vid_out           =3D bcm2835_isp_node_g_fmt,
> > +     .vidioc_g_fmt_meta_cap          =3D bcm2835_isp_node_g_fmt,
> > +     .vidioc_s_fmt_vid_cap           =3D bcm2835_isp_node_s_fmt,
> > +     .vidioc_s_fmt_vid_out           =3D bcm2835_isp_node_s_fmt,
> > +     .vidioc_s_fmt_meta_cap          =3D bcm2835_isp_node_s_fmt,
> > +     .vidioc_try_fmt_vid_cap         =3D bcm2835_isp_node_try_fmt,
> > +     .vidioc_try_fmt_vid_out         =3D bcm2835_isp_node_try_fmt,
> > +     .vidioc_try_fmt_meta_cap        =3D bcm2835_isp_node_try_fmt,
> > +     .vidioc_s_selection             =3D bcm2835_isp_node_s_selection,
> > +     .vidioc_g_selection             =3D bcm2835_isp_node_g_selection,
> > +
> > +     .vidioc_enum_fmt_vid_cap        =3D bcm2835_isp_node_enum_fmt,
> > +     .vidioc_enum_fmt_vid_out        =3D bcm2835_isp_node_enum_fmt,
> > +     .vidioc_enum_fmt_meta_cap       =3D bcm2835_isp_node_enum_fmt,
> > +     .vidioc_enum_framesizes         =3D bcm2835_isp_enum_framesizes,
> > +
> > +     .vidioc_reqbufs                 =3D vb2_ioctl_reqbufs,
> > +     .vidioc_querybuf                =3D vb2_ioctl_querybuf,
> > +     .vidioc_qbuf                    =3D vb2_ioctl_qbuf,
> > +     .vidioc_dqbuf                   =3D vb2_ioctl_dqbuf,
> > +     .vidioc_expbuf                  =3D vb2_ioctl_expbuf,
> > +     .vidioc_create_bufs             =3D vb2_ioctl_create_bufs,
> > +     .vidioc_prepare_buf             =3D vb2_ioctl_prepare_buf,
> > +
> > +     .vidioc_streamon                =3D vb2_ioctl_streamon,
> > +     .vidioc_streamoff               =3D vb2_ioctl_streamoff,
> > +
> > +     .vidioc_subscribe_event         =3D bcm3285_isp_subscribe_event,
> > +     .vidioc_unsubscribe_event       =3D v4l2_event_unsubscribe,
> > +};
> > +
> > +/*
> > + * Size of the array to provide to the VPU when asking for the list of=
 supported
> > + * formats.
> > + *
> > + * The ISP component currently advertises 33 input formats, so add a s=
mall
> > + * overhead on that.
> > + */
> > +#define MAX_SUPPORTED_ENCODINGS 40
> > +
> > +/* Populate node->supported_fmts with the formats supported by those p=
orts. */
> > +static int bcm2835_isp_get_supported_fmts(struct bcm2835_isp_node *nod=
e)
> > +{
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     struct bcm2835_isp_fmt const **list;
> > +     unsigned int i, j, num_encodings;
> > +     u32 fourccs[MAX_SUPPORTED_ENCODINGS];
> > +     u32 param_size =3D sizeof(fourccs);
> > +     int ret;
> > +
> > +     ret =3D vchiq_mmal_port_parameter_get(dev->mmal_instance,
> > +                                         get_port_data(node),
> > +                                         MMAL_PARAMETER_SUPPORTED_ENCO=
DINGS,
> > +                                         &fourccs, &param_size);
> > +
> > +     if (ret) {
> > +             if (ret =3D=3D MMAL_MSG_STATUS_ENOSPC) {
> > +                     v4l2_err(&dev->v4l2_dev,
> > +                              "%s: port has more encoding than we prov=
ided space for. Some are dropped.\n",
> > +                              __func__);
> > +                     num_encodings =3D MAX_SUPPORTED_ENCODINGS;
> > +             } else {
> > +                     v4l2_err(&dev->v4l2_dev, "%s: get_param ret %u.\n=
",
> > +                              __func__, ret);
> > +                     return -EINVAL;
> > +             }
> > +     } else {
> > +             num_encodings =3D param_size / sizeof(u32);
> > +     }
> > +
> > +     /*
> > +      * Assume at this stage that all encodings will be supported in V=
4L2.
> > +      * Any that aren't supported will waste a very small amount of me=
mory.
> > +      */
> > +     list =3D devm_kzalloc(dev->dev,
> > +                         sizeof(struct bcm2835_isp_fmt *) * num_encodi=
ngs,
> > +                         GFP_KERNEL);
> > +     if (!list)
> > +             return -ENOMEM;
> > +     node->supported_fmts.list =3D list;
> > +
> > +     for (i =3D 0, j =3D 0; i < num_encodings; i++) {
> > +             const struct bcm2835_isp_fmt *fmt =3D get_fmt(fourccs[i])=
;
> > +
> > +             if (fmt) {
> > +                     list[j] =3D fmt;
> > +                     j++;
> > +             }
> > +     }
> > +     node->supported_fmts.num_entries =3D j;
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * Register a device node /dev/video<N> to go along with one of the IS=
P's input
> > + * or output nodes.
> > + */
> > +static int register_node(struct bcm2835_isp_dev *dev,
> > +                      struct bcm2835_isp_node *node,
> > +                      int index)
> > +{
> > +     struct video_device *vfd;
> > +     struct vb2_queue *queue;
> > +     int ret;
> > +
> > +     mutex_init(&node->lock);
> > +
> > +     node->dev =3D dev;
> > +     vfd =3D &node->vfd;
> > +     queue =3D &node->queue;
> > +     queue->type =3D index_to_queue_type(index);
> > +     /*
> > +      * Setup the node type-specific params.
> > +      *
> > +      * Only the OUTPUT node can set controls and crop windows. Howeve=
r,
> > +      * we must allow the s/g_selection ioctl on the stats node as v4l=
2
> > +      * compliance expects it to return a -ENOTTY, and the framework
> > +      * does not handle it if the ioctl is disabled.
> > +      */
> > +     switch (queue->type) {
> > +     case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> > +             vfd->device_caps =3D V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STR=
EAMING;
> > +             node->id =3D index;
> > +             node->vfl_dir =3D VFL_DIR_TX;
> > +             node->name =3D "output";
> > +             break;
> > +     case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > +             vfd->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_ST=
REAMING;
> > +             /* First Capture node starts at id 0, etc. */
> > +             node->id =3D index - BCM2835_ISP_NUM_OUTPUTS;
> > +             node->vfl_dir =3D VFL_DIR_RX;
> > +             node->name =3D "capture";
> > +             v4l2_disable_ioctl(&node->vfd, VIDIOC_S_CTRL);
> > +             v4l2_disable_ioctl(&node->vfd, VIDIOC_S_SELECTION);
> > +             v4l2_disable_ioctl(&node->vfd, VIDIOC_G_SELECTION);
> > +             break;
> > +     case V4L2_BUF_TYPE_META_CAPTURE:
> > +             vfd->device_caps =3D V4L2_CAP_META_CAPTURE | V4L2_CAP_STR=
EAMING;
> > +             node->id =3D index - BCM2835_ISP_NUM_OUTPUTS;
> > +             node->vfl_dir =3D VFL_DIR_RX;
> > +             node->name =3D "stats";
> > +             v4l2_disable_ioctl(&node->vfd, VIDIOC_S_CTRL);
>
> Why not disable S/G_SELECTION for meta capture here rather than test for =
it
> in the op functions?

I'd have to ask Naush. There were some very odd interactions with
v4l2-compliance that he was struggling with.

> > +             break;
> > +     }
> > +
> > +     /* We use the selection API instead of the old crop API. */
> > +     v4l2_disable_ioctl(vfd, VIDIOC_CROPCAP);
> > +     v4l2_disable_ioctl(vfd, VIDIOC_G_CROP);
> > +     v4l2_disable_ioctl(vfd, VIDIOC_S_CROP);
>
> No need for this: the core handles this and will disable these ioctls
> automatically.

The core will ENABLE these if g_selection and s_selection are defined,
and uses mapping functions to try and convert between the two APIs.
This may be down to missing the target check in s_selection, but again
I seem to recall v4l2-compliance was reporting failures on these
ioctls.

> > +
> > +     ret =3D bcm2835_isp_get_supported_fmts(node);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Initialise the the video node. */
> > +     vfd->vfl_type   =3D VFL_TYPE_VIDEO;
> > +     vfd->fops       =3D &bcm2835_isp_fops,
> > +     vfd->ioctl_ops  =3D &bcm2835_isp_node_ioctl_ops,
> > +     vfd->minor      =3D -1,
> > +     vfd->release    =3D video_device_release_empty,
> > +     vfd->queue      =3D &node->queue;
> > +     vfd->lock       =3D &node->lock;
> > +     vfd->v4l2_dev   =3D &dev->v4l2_dev;
> > +     vfd->vfl_dir    =3D node->vfl_dir;
> > +
> > +     node->q_data.fmt =3D get_default_format(node);
> > +     node->q_data.width =3D DEFAULT_DIM;
> > +     node->q_data.height =3D DEFAULT_DIM;
> > +     node->q_data.bytesperline =3D
> > +             get_bytesperline(DEFAULT_DIM, node->q_data.fmt);
> > +     node->q_data.sizeimage =3D node_is_stats(node) ?
> > +                              get_port_data(node)->recommended_buffer.=
size :
> > +                              get_sizeimage(node->q_data.bytesperline,
> > +                                            node->q_data.width,
> > +                                            node->q_data.height,
> > +                                            node->q_data.fmt);
> > +
> > +     queue->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > +     queue->drv_priv =3D node;
> > +     queue->ops =3D &bcm2835_isp_node_queue_ops;
> > +     queue->mem_ops =3D &vb2_dma_contig_memops;
> > +     queue->buf_struct_size =3D sizeof(struct bcm2835_isp_buffer);
> > +     queue->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +     queue->dev =3D dev->dev;
> > +     queue->lock =3D &node->queue_lock;
> > +
> > +     ret =3D vb2_queue_init(queue);
> > +     if (ret < 0) {
> > +             v4l2_info(&dev->v4l2_dev, "vb2_queue_init failed\n");
> > +             return ret;
> > +     }
> > +     node->queue_init =3D true;
> > +
> > +     /* Define the device names */
> > +     snprintf(vfd->name, sizeof(node->vfd.name), "%s-%s%d", BCM2835_IS=
P_NAME,
> > +              node->name, node->id);
> > +
> > +     ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, video_nr + ind=
ex);
> > +     if (ret) {
> > +             v4l2_err(&dev->v4l2_dev,
> > +                      "Failed to register video %s[%d] device node\n",
> > +                      node->name, node->id);
> > +             return ret;
> > +     }
>
> Move registering the video device to the end of this function.
> Otherwise the output video device would be created (and available for
> userspace) before the controls are added.

Ack

> > +
> > +     node->registered =3D true;
> > +     video_set_drvdata(vfd, node);
> > +
> > +     /* Set some controls and defaults, but only on the VIDEO_OUTPUT n=
ode. */
> > +     if (node_is_output(node)) {
> > +             unsigned int i;
> > +
> > +             /* Use this ctrl template to assign all out ISP custom ct=
rls. */
> > +             struct v4l2_ctrl_config ctrl_template =3D {
> > +                     .ops            =3D &bcm2835_isp_ctrl_ops,
> > +                     .type           =3D V4L2_CTRL_TYPE_U8,
> > +                     .def            =3D 0,
> > +                     .min            =3D 0x00,
> > +                     .max            =3D 0xff,
> > +                     .step           =3D 1,
> > +             };
> > +
> > +             v4l2_ctrl_handler_init(&dev->ctrl_handler, 4);
> > +
> > +             dev->r_gain =3D 1000;
> > +             dev->b_gain =3D 1000;
> > +
> > +             v4l2_ctrl_new_std(&dev->ctrl_handler,  &bcm2835_isp_ctrl_=
ops,
> > +                               V4L2_CID_RED_BALANCE, 1, 0xffff, 1,
> > +                               dev->r_gain);
> > +
> > +             v4l2_ctrl_new_std(&dev->ctrl_handler, &bcm2835_isp_ctrl_o=
ps,
> > +                               V4L2_CID_BLUE_BALANCE, 1, 0xffff, 1,
> > +                               dev->b_gain);
> > +
> > +             v4l2_ctrl_new_std(&dev->ctrl_handler, &bcm2835_isp_ctrl_o=
ps,
> > +                               V4L2_CID_DIGITAL_GAIN, 1, 0xffff, 1, 10=
00);
> > +
> > +             for (i =3D 0; i < ARRAY_SIZE(custom_ctrls); i++) {
> > +                     ctrl_template.name =3D custom_ctrls[i].name;
> > +                     ctrl_template.id =3D custom_ctrls[i].id;
> > +                     ctrl_template.dims[0] =3D custom_ctrls[i].size;
> > +                     ctrl_template.flags =3D custom_ctrls[i].flags;
> > +                     v4l2_ctrl_new_custom(&dev->ctrl_handler,
> > +                                          &ctrl_template, NULL);
> > +             }
> > +
> > +             node->vfd.ctrl_handler =3D &dev->ctrl_handler;
>
> Missing error check.

Ack

> > +     }
> > +
> > +     v4l2_info(&dev->v4l2_dev,
> > +               "Device node %s[%d] registered as /dev/video%d\n",
> > +               node->name, node->id, vfd->num);
> > +
> > +     return 0;
> > +}
> > +
> > +/* Unregister one of the /dev/video<N> nodes associated with the ISP. =
*/
> > +static void unregister_node(struct bcm2835_isp_node *node)
> > +{
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +
> > +     v4l2_info(&dev->v4l2_dev,
> > +               "Unregistering node %s[%d] device node /dev/video%d\n",
> > +               node->name, node->id, node->vfd.num);
> > +
> > +     if (node->queue_init)
> > +             vb2_queue_release(&node->queue);
> > +
> > +     if (node->registered) {
> > +             video_unregister_device(&node->vfd);
> > +             if (node_is_output(node))
> > +                     v4l2_ctrl_handler_free(&dev->ctrl_handler);
> > +     }
> > +
> > +     /*
> > +      * node->supported_fmts.list is free'd automatically
> > +      * as a managed resource.
> > +      */
> > +     node->supported_fmts.list =3D NULL;
> > +     node->supported_fmts.num_entries =3D 0;
> > +     node->vfd.ctrl_handler =3D NULL;
> > +     node->registered =3D false;
> > +     node->queue_init =3D false;
> > +}
> > +
> > +static void media_controller_unregister(struct bcm2835_isp_dev *dev)
> > +{
> > +     unsigned int i;
> > +
> > +     v4l2_info(&dev->v4l2_dev, "Unregister from media controller\n");
> > +
> > +     if (dev->media_device_registered) {
> > +             media_device_unregister(&dev->mdev);
> > +             media_device_cleanup(&dev->mdev);
> > +             dev->media_device_registered =3D false;
> > +     }
> > +
> > +     kfree(dev->entity.name);
> > +     dev->entity.name =3D NULL;
> > +
> > +     if (dev->media_entity_registered) {
> > +             media_device_unregister_entity(&dev->entity);
> > +             dev->media_entity_registered =3D false;
> > +     }
> > +
> > +     for (i =3D 0; i < BCM2835_ISP_NUM_NODES; i++) {
> > +             struct bcm2835_isp_node *node =3D &dev->node[i];
> > +
> > +             if (node->media_node_registered) {
> > +                     media_remove_intf_links(node->intf_link->intf);
> > +                     media_entity_remove_links(&dev->node[i].vfd.entit=
y);
> > +                     media_devnode_remove(node->intf_devnode);
> > +                     media_device_unregister_entity(&node->vfd.entity)=
;
> > +                     kfree(node->vfd.entity.name);
> > +             }
> > +             node->media_node_registered =3D false;
> > +     }
> > +
> > +     dev->v4l2_dev.mdev =3D NULL;
> > +}
> > +
> > +static int media_controller_register_node(struct bcm2835_isp_dev *dev,=
 int num)
> > +{
> > +     struct bcm2835_isp_node *node =3D &dev->node[num];
> > +     struct media_entity *entity =3D &node->vfd.entity;
> > +     int output =3D node_is_output(node);
> > +     char *name;
> > +     int ret;
> > +
> > +     v4l2_info(&dev->v4l2_dev,
> > +               "Register %s node %d with media controller\n",
> > +               output ? "output" : "capture", num);
> > +     entity->obj_type =3D MEDIA_ENTITY_TYPE_VIDEO_DEVICE;
> > +     entity->function =3D MEDIA_ENT_F_IO_V4L;
> > +     entity->info.dev.major =3D VIDEO_MAJOR;
> > +     entity->info.dev.minor =3D node->vfd.minor;
> > +     name =3D kmalloc(BCM2835_ISP_ENTITY_NAME_LEN, GFP_KERNEL);
> > +     if (!name) {
> > +             ret =3D -ENOMEM;
> > +             goto error_no_mem;
> > +     }
> > +     snprintf(name, BCM2835_ISP_ENTITY_NAME_LEN, "%s0-%s%d",
> > +              BCM2835_ISP_NAME, output ? "output" : "capture", num);
> > +     entity->name =3D name;
> > +     node->pad.flags =3D output ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_S=
INK;
> > +     ret =3D media_entity_pads_init(entity, 1, &node->pad);
> > +     if (ret)
> > +             goto error_pads_init;
> > +     ret =3D media_device_register_entity(&dev->mdev, entity);
> > +     if (ret)
> > +             goto error_register_entity;
> > +
> > +     node->intf_devnode =3D media_devnode_create(&dev->mdev,
> > +                                               MEDIA_INTF_T_V4L_VIDEO,=
 0,
> > +                                               VIDEO_MAJOR, node->vfd.=
minor);
> > +     if (!node->intf_devnode) {
> > +             ret =3D -ENOMEM;
> > +             goto error_devnode_create;
> > +     }
> > +
> > +     node->intf_link =3D media_create_intf_link(entity,
> > +                                              &node->intf_devnode->int=
f,
> > +                                              MEDIA_LNK_FL_IMMUTABLE |
> > +                                              MEDIA_LNK_FL_ENABLED);
> > +     if (!node->intf_link) {
> > +             ret =3D -ENOMEM;
> > +             goto error_create_intf_link;
> > +     }
> > +
> > +     if (output)
> > +             ret =3D media_create_pad_link(entity, 0, &dev->entity, nu=
m,
> > +                                         MEDIA_LNK_FL_IMMUTABLE |
> > +                                                 MEDIA_LNK_FL_ENABLED)=
;
> > +     else
> > +             ret =3D media_create_pad_link(&dev->entity, num, entity, =
0,
> > +                                         MEDIA_LNK_FL_IMMUTABLE |
> > +                                         MEDIA_LNK_FL_ENABLED);
> > +     if (ret)
> > +             goto error_create_pad_link;
> > +
> > +     dev->node[num].media_node_registered =3D true;
> > +     return 0;
> > +
> > +error_create_pad_link:
> > +     media_remove_intf_links(&node->intf_devnode->intf);
> > +error_create_intf_link:
> > +     media_devnode_remove(node->intf_devnode);
> > +error_devnode_create:
> > +     media_device_unregister_entity(&node->vfd.entity);
> > +error_register_entity:
> > +error_pads_init:
> > +     kfree(entity->name);
> > +     entity->name =3D NULL;
> > +error_no_mem:
> > +     if (ret)
> > +             v4l2_info(&dev->v4l2_dev, "Error registering node\n");
> > +
> > +     return ret;
> > +}
> > +
> > +static int media_controller_register(struct bcm2835_isp_dev *dev)
> > +{
> > +     char *name;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     v4l2_dbg(2, debug, &dev->v4l2_dev, "Registering with media contro=
ller\n");
> > +     dev->mdev.dev =3D dev->dev;
> > +     strscpy(dev->mdev.model, "bcm2835-isp",
> > +             sizeof(dev->mdev.model));
> > +     strscpy(dev->mdev.bus_info, "platform:bcm2835-isp",
> > +             sizeof(dev->mdev.bus_info));
> > +     media_device_init(&dev->mdev);
> > +     dev->v4l2_dev.mdev =3D &dev->mdev;
> > +
> > +     v4l2_dbg(2, debug, &dev->v4l2_dev, "Register entity for nodes\n")=
;
> > +
> > +     name =3D kmalloc(BCM2835_ISP_ENTITY_NAME_LEN, GFP_KERNEL);
> > +     if (!name) {
> > +             ret =3D -ENOMEM;
> > +             goto done;
> > +     }
> > +     snprintf(name, BCM2835_ISP_ENTITY_NAME_LEN, "bcm2835_isp0");
> > +     dev->entity.name =3D name;
> > +     dev->entity.obj_type =3D MEDIA_ENTITY_TYPE_BASE;
> > +     dev->entity.function =3D MEDIA_ENT_F_PROC_VIDEO_SCALER;
> > +
> > +     for (i =3D 0; i < BCM2835_ISP_NUM_NODES; i++) {
> > +             dev->pad[i].flags =3D node_is_output(&dev->node[i]) ?
> > +                                     MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_=
SOURCE;
> > +     }
> > +
> > +     ret =3D media_entity_pads_init(&dev->entity, BCM2835_ISP_NUM_NODE=
S,
> > +                                  dev->pad);
> > +     if (ret)
> > +             goto done;
> > +
> > +     ret =3D media_device_register_entity(&dev->mdev, &dev->entity);
> > +     if (ret)
> > +             goto done;
> > +
> > +     dev->media_entity_registered =3D true;
> > +     for (i =3D 0; i < BCM2835_ISP_NUM_NODES; i++) {
> > +             ret =3D media_controller_register_node(dev, i);
> > +             if (ret)
> > +                     goto done;
> > +     }
> > +
> > +     ret =3D media_device_register(&dev->mdev);
> > +     if (!ret)
> > +             dev->media_device_registered =3D true;
> > +done:
> > +     return ret;
> > +}
> > +
> > +static int bcm2835_isp_remove(struct platform_device *pdev)
> > +{
> > +     struct bcm2835_isp_dev *dev =3D platform_get_drvdata(pdev);
> > +     unsigned int i;
> > +
> > +     media_controller_unregister(dev);
> > +
> > +     for (i =3D 0; i < BCM2835_ISP_NUM_NODES; i++)
> > +             unregister_node(&dev->node[i]);
> > +
> > +     v4l2_device_unregister(&dev->v4l2_dev);
> > +
> > +     if (dev->component)
> > +             vchiq_mmal_component_finalise(dev->mmal_instance,
> > +                                           dev->component);
> > +
> > +     vchiq_mmal_finalise(dev->mmal_instance);
> > +
> > +     return 0;
> > +}
> > +
> > +static int bcm2835_isp_probe(struct platform_device *pdev)
> > +{
> > +     struct bcm2835_isp_dev *dev;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> > +     if (!dev)
> > +             return -ENOMEM;
> > +
> > +     dev->dev =3D &pdev->dev;
> > +
> > +     ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D vchiq_mmal_init(&dev->mmal_instance);
> > +     if (ret) {
> > +             v4l2_device_unregister(&dev->v4l2_dev);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D vchiq_mmal_component_init(dev->mmal_instance, "ril.isp",
> > +                                     &dev->component);
> > +     if (ret) {
> > +             v4l2_err(&dev->v4l2_dev,
> > +                      "%s: failed to create ril.isp component\n", __fu=
nc__);
> > +             goto error;
> > +     }
> > +
> > +     if ((dev->component->inputs !=3D BCM2835_ISP_NUM_OUTPUTS) ||
> > +         (dev->component->outputs !=3D BCM2835_ISP_NUM_CAPTURES +
> > +                                     BCM2835_ISP_NUM_METADATA)) {
> > +             v4l2_err(&dev->v4l2_dev,
> > +                      "%s: ril.isp returned %d i/p (%d expected), %d o=
/p (%d expected) ports\n",
> > +                       __func__, dev->component->inputs,
> > +                       BCM2835_ISP_NUM_OUTPUTS,
> > +                       dev->component->outputs,
> > +                       BCM2835_ISP_NUM_CAPTURES + BCM2835_ISP_NUM_META=
DATA);
> > +             goto error;
> > +     }
> > +
> > +     atomic_set(&dev->num_streaming, 0);
> > +
> > +     for (i =3D 0; i < BCM2835_ISP_NUM_NODES; i++) {
> > +             struct bcm2835_isp_node *node =3D &dev->node[i];
> > +
> > +             ret =3D register_node(dev, node, i);
> > +             if (ret)
> > +                     goto error;
> > +     }
> > +
> > +     ret =3D media_controller_register(dev);
> > +     if (ret)
> > +             goto error;
> > +
> > +     platform_set_drvdata(pdev, dev);
> > +     v4l2_info(&dev->v4l2_dev, "Loaded V4L2 %s\n", BCM2835_ISP_NAME);
> > +     return 0;
> > +
> > +error:
> > +     bcm2835_isp_remove(pdev);
> > +
> > +     return ret;
> > +}
> > +
> > +static struct platform_driver bcm2835_isp_pdrv =3D {
> > +     .probe =3D bcm2835_isp_probe,
> > +     .remove =3D bcm2835_isp_remove,
> > +     .driver =3D {
> > +                     .name =3D BCM2835_ISP_NAME,
> > +               },
> > +};
> > +
> > +module_platform_driver(bcm2835_isp_pdrv);
> > +
> > +MODULE_DESCRIPTION("BCM2835 ISP driver");
> > +MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
> > +MODULE_LICENSE("GPL");
> > +MODULE_VERSION("1.0");
> > +MODULE_ALIAS("platform:bcm2835-isp");
> > diff --git a/drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_ctrl=
s.h b/drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_ctrls.h
> > new file mode 100644
> > index 000000000000..cfbb1063aad1
> > --- /dev/null
> > +++ b/drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_ctrls.h
> > @@ -0,0 +1,67 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Broadcom BCM2835 ISP driver
> > + *
> > + * Copyright =C2=A9 2019-2020 Raspberry Pi (Trading) Ltd.
> > + *
> > + * Author: Naushir Patuck (naush@raspberrypi.com)
> > + *
> > + */
> > +
> > +#ifndef BCM2835_ISP_CTRLS
> > +#define BCM2835_ISP_CTRLS
> > +
> > +#include <linux/bcm2835-isp.h>
> > +
> > +struct bcm2835_isp_custom_ctrl {
> > +     const char *name;
> > +     u32 id;
> > +     u32 size;
> > +     u32 flags;
> > +};
> > +
> > +static const struct bcm2835_isp_custom_ctrl custom_ctrls[] =3D {
> > +     {
> > +             .name   =3D "Colour Correction Matrix",
> > +             .id     =3D V4L2_CID_USER_BCM2835_ISP_CC_MATRIX,
> > +             .size   =3D sizeof(struct bcm2835_isp_custom_ccm),
> > +             .flags  =3D 0
> > +     }, {
> > +             .name   =3D "Lens Shading",
> > +             .id     =3D V4L2_CID_USER_BCM2835_ISP_LENS_SHADING,
> > +             .size   =3D sizeof(struct bcm2835_isp_lens_shading),
> > +             .flags  =3D V4L2_CTRL_FLAG_EXECUTE_ON_WRITE
> > +     }, {
> > +             .name   =3D "Black Level",
> > +             .id     =3D V4L2_CID_USER_BCM2835_ISP_BLACK_LEVEL,
> > +             .size   =3D sizeof(struct bcm2835_isp_black_level),
> > +             .flags  =3D 0
> > +     }, {
> > +             .name   =3D "Green Equalisation",
> > +             .id     =3D V4L2_CID_USER_BCM2835_ISP_GEQ,
> > +             .size   =3D sizeof(struct bcm2835_isp_geq),
> > +             .flags  =3D 0
> > +     }, {
> > +             .name   =3D "Gamma",
> > +             .id     =3D V4L2_CID_USER_BCM2835_ISP_GAMMA,
> > +             .size   =3D sizeof(struct bcm2835_isp_gamma),
> > +             .flags  =3D 0
> > +     }, {
> > +             .name   =3D "Sharpen",
> > +             .id     =3D V4L2_CID_USER_BCM2835_ISP_SHARPEN,
> > +             .size   =3D sizeof(struct bcm2835_isp_sharpen),
> > +             .flags  =3D 0
> > +     }, {
> > +             .name   =3D "Denoise",
> > +             .id     =3D V4L2_CID_USER_BCM2835_ISP_DENOISE,
> > +             .size   =3D sizeof(struct bcm2835_isp_denoise),
> > +             .flags  =3D 0
> > +     }, {
> > +             .name   =3D "Defective Pixel Correction",
> > +             .id     =3D V4L2_CID_USER_BCM2835_ISP_DPC,
> > +             .size   =3D sizeof(struct bcm2835_isp_dpc),
> > +             .flags  =3D 0
> > +     }
> > +};
> > +
> > +#endif
> > diff --git a/drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_fmts=
.h b/drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_fmts.h
> > new file mode 100644
> > index 000000000000..af3bde152bb2
> > --- /dev/null
> > +++ b/drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_fmts.h
> > @@ -0,0 +1,301 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Broadcom BCM2835 ISP driver
> > + *
> > + * Copyright =C2=A9 2019-2020 Raspberry Pi (Trading) Ltd.
> > + *
> > + * Author: Naushir Patuck (naush@raspberrypi.com)
> > + *
> > + */
> > +
> > +#ifndef BCM2835_ISP_FMTS
> > +#define BCM2835_ISP_FMTS
> > +
> > +#include <linux/videodev2.h>
> > +#include "vchiq-mmal/mmal-encodings.h"
> > +
> > +struct bcm2835_isp_fmt {
> > +     u32 fourcc;
> > +     int depth;
> > +     int bytesperline_align;
> > +     u32 flags;
> > +     u32 mmal_fmt;
> > +     int size_multiplier_x2;
> > +     enum v4l2_colorspace colorspace;
> > +     unsigned int step_size;
> > +};
> > +
> > +struct bcm2835_isp_fmt_list {
> > +     struct bcm2835_isp_fmt const **list;
> > +     unsigned int num_entries;
> > +};
> > +
> > +static const struct bcm2835_isp_fmt supported_formats[] =3D {
> > +     {
> > +             /* YUV formats */
> > +             .fourcc             =3D V4L2_PIX_FMT_YUV420,
> > +             .depth              =3D 8,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_I420,
> > +             .size_multiplier_x2 =3D 3,
> > +             .colorspace         =3D V4L2_COLORSPACE_SMPTE170M,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_YVU420,
> > +             .depth              =3D 8,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_YV12,
> > +             .size_multiplier_x2 =3D 3,
> > +             .colorspace         =3D V4L2_COLORSPACE_SMPTE170M,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_NV12,
> > +             .depth              =3D 8,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_NV12,
> > +             .size_multiplier_x2 =3D 3,
> > +             .colorspace         =3D V4L2_COLORSPACE_SMPTE170M,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_NV21,
> > +             .depth              =3D 8,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_NV21,
> > +             .size_multiplier_x2 =3D 3,
> > +             .colorspace         =3D V4L2_COLORSPACE_SMPTE170M,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_YUYV,
> > +             .depth              =3D 16,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_YUYV,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_SMPTE170M,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_UYVY,
> > +             .depth              =3D 16,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_UYVY,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_SMPTE170M,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_YVYU,
> > +             .depth              =3D 16,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_YVYU,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_SMPTE170M,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_VYUY,
> > +             .depth              =3D 16,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_VYUY,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_SMPTE170M,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             /* RGB formats */
> > +             .fourcc             =3D V4L2_PIX_FMT_RGB24,
> > +             .depth              =3D 24,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_RGB24,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_SRGB,
> > +             .step_size          =3D 1,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_RGB565,
> > +             .depth              =3D 16,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_RGB16,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_SRGB,
> > +             .step_size          =3D 1,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_BGR24,
> > +             .depth              =3D 24,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BGR24,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_SRGB,
> > +             .step_size          =3D 1,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_ABGR32,
> > +             .depth              =3D 32,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BGRA,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_SRGB,
> > +             .step_size          =3D 1,
> > +     }, {
> > +             /* Bayer formats */
> > +             /* 8 bit */
> > +             .fourcc             =3D V4L2_PIX_FMT_SRGGB8,
> > +             .depth              =3D 8,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SRGGB8,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_SBGGR8,
> > +             .depth              =3D 8,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SBGGR8,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_SGRBG8,
> > +             .depth              =3D 8,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGRBG8,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_SGBRG8,
> > +             .depth              =3D 8,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGBRG8,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             /* 10 bit */
> > +             .fourcc             =3D V4L2_PIX_FMT_SRGGB10P,
> > +             .depth              =3D 10,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SRGGB10P,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_SBGGR10P,
> > +             .depth              =3D 10,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SBGGR10P,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_SGRBG10P,
> > +             .depth              =3D 10,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGRBG10P,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_SGBRG10P,
> > +             .depth              =3D 10,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGBRG10P,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             /* 12 bit */
> > +             .fourcc             =3D V4L2_PIX_FMT_SRGGB12P,
> > +             .depth              =3D 12,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SRGGB12P,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_SBGGR12P,
> > +             .depth              =3D 12,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SBGGR12P,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_SGRBG12P,
> > +             .depth              =3D 12,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGRBG12P,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_SGBRG12P,
> > +             .depth              =3D 12,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGBRG12P,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             /* 16 bit */
> > +             .fourcc             =3D V4L2_PIX_FMT_SRGGB16,
> > +             .depth              =3D 16,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SRGGB16,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_SBGGR16,
> > +             .depth              =3D 16,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SBGGR16,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_SGRBG16,
> > +             .depth              =3D 16,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGRBG16,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             .fourcc             =3D V4L2_PIX_FMT_SGBRG16,
> > +             .depth              =3D 16,
> > +             .bytesperline_align =3D 32,
> > +             .flags              =3D 0,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGBRG16,
> > +             .size_multiplier_x2 =3D 2,
> > +             .colorspace         =3D V4L2_COLORSPACE_RAW,
> > +             .step_size          =3D 2,
> > +     }, {
> > +             /* ISP statistics format */
> > +             .fourcc             =3D V4L2_META_FMT_BCM2835_ISP_STATS,
> > +             .mmal_fmt           =3D MMAL_ENCODING_BRCM_STATS,
> > +             /* The rest are not valid fields for stats. */
> > +     }
> > +};
> > +
> > +#endif
> > diff --git a/drivers/staging/vc04_services/include/uapi/linux/bcm2835-i=
sp.h b/drivers/staging/vc04_services/include/uapi/linux/bcm2835-isp.h
> > new file mode 100644
> > index 000000000000..edc452fa8318
> > --- /dev/null
> > +++ b/drivers/staging/vc04_services/include/uapi/linux/bcm2835-isp.h
> > @@ -0,0 +1,333 @@
> > +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD=
-3-Clause) */
> > +/*
> > + * bcm2835-isp.h
> > + *
> > + * BCM2835 ISP driver - user space header file.
> > + *
> > + * Copyright =C2=A9 2019-2020 Raspberry Pi (Trading) Ltd.
> > + *
> > + * Author: Naushir Patuck (naush@raspberrypi.com)
> > + *
> > + */
> > +
> > +#ifndef __BCM2835_ISP_H_
> > +#define __BCM2835_ISP_H_
> > +
> > +#include <linux/v4l2-controls.h>
> > +
> > +/* TODO: move the control IDs definitions to v4l2-controls.h */
> > +#define V4L2_CID_USER_BCM2835_ISP_BASE         (V4L2_CID_USER_BASE + 0=
x10c0)
>
> As the TODO says: move this to v4l2-controls.h. Currently the 0x10c0 offs=
et
> clashes with V4L2_CID_USER_ATMEL_ISC_BASE, so that certainly should be fi=
xed.
>
> > +
> > +/* TODO: move the formats definitions to videodev2.h */
> > +/* 12  Y/CbCr 4:2:0 128 pixel wide column */
> > +#define V4L2_PIX_FMT_NV12_COL128 v4l2_fourcc('N', 'C', '1', '2')
> > +/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in a 128 bytes / 96 pixe=
l wide column */
> > +#define V4L2_PIX_FMT_NV12_10_COL128 v4l2_fourcc('N', 'C', '3', '0')

These 2 seem to have been picked up into this patch set when they
really belong to the codec driver. I have got documentation written
for them.

> > +/* Sensor Ancillary metadata */
> > +#define V4L2_META_FMT_SENSOR_DATA v4l2_fourcc('S', 'E', 'N', 'S')
> > +/* BCM2835 ISP image statistics output */
> > +#define V4L2_META_FMT_BCM2835_ISP_STATS v4l2_fourcc('B', 'S', 'T', 'A'=
)
> > +
> > +#define V4L2_CID_USER_BCM2835_ISP_CC_MATRIX  \
> > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0001)
> > +#define V4L2_CID_USER_BCM2835_ISP_LENS_SHADING       \
> > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0002)
> > +#define V4L2_CID_USER_BCM2835_ISP_BLACK_LEVEL        \
> > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0003)
> > +#define V4L2_CID_USER_BCM2835_ISP_GEQ                \
> > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0004)
> > +#define V4L2_CID_USER_BCM2835_ISP_GAMMA              \
> > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0005)
> > +#define V4L2_CID_USER_BCM2835_ISP_DENOISE    \
> > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0006)
> > +#define V4L2_CID_USER_BCM2835_ISP_SHARPEN    \
> > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0007)
> > +#define V4L2_CID_USER_BCM2835_ISP_DPC                \
> > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0008)
>
> There is no documentation for these controls. Specifically, it doesn't
> tell you which struct should be used.
>
> > +
> > +/*
> > + * All structs below are directly mapped onto the equivalent structs i=
n
> > + * drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
> > + * for convenience.
> > + */
> > +
> > +/**
> > + * struct bcm2835_isp_rational - Rational value type.
> > + *
> > + * @num:     Numerator.
> > + * @den:     Denominator.
> > + */
> > +struct bcm2835_isp_rational {
> > +     __s32 num;
> > +     __s32 den;
>
> Wouldn't it make more sense if den is a __u32?
>
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_ccm - Colour correction matrix.
> > + *
> > + * @ccm:     3x3 correction matrix coefficients.
> > + * @offsets: 1x3 correction offsets.
> > + */
> > +struct bcm2835_isp_ccm {
> > +     struct bcm2835_isp_rational ccm[3][3];
> > +     __s32 offsets[3];
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_custom_ccm - Custom CCM applied with the
> > + *                              V4L2_CID_USER_BCM2835_ISP_CC_MATRIX ct=
rl.
> > + *
> > + * @enabled: Enable custom CCM.
> > + * @ccm:     Custom CCM coefficients and offsets.
> > + */
> > +struct bcm2835_isp_custom_ccm {
> > +     __u32 enabled;
> > +     struct bcm2835_isp_ccm ccm;
> > +};
> > +
> > +/**
> > + * enum bcm2835_isp_gain_format - format of the gains in the lens shad=
ing
> > + *                             tables used with the
> > + *                             V4L2_CID_USER_BCM2835_ISP_LENS_SHADING =
ctrl.
> > + *
> > + * @GAIN_FORMAT_U0P8_1:              Gains are u0.8 format, starting a=
t 1.0
> > + * @GAIN_FORMAT_U1P7_0:              Gains are u1.7 format, starting a=
t 0.0
> > + * @GAIN_FORMAT_U1P7_1:              Gains are u1.7 format, starting a=
t 1.0
> > + * @GAIN_FORMAT_U2P6_0:              Gains are u2.6 format, starting a=
t 0.0
> > + * @GAIN_FORMAT_U2P6_1:              Gains are u2.6 format, starting a=
t 1.0
> > + * @GAIN_FORMAT_U3P5_0:              Gains are u3.5 format, starting a=
t 0.0
> > + * @GAIN_FORMAT_U3P5_1:              Gains are u3.5 format, starting a=
t 1.0
> > + * @GAIN_FORMAT_U4P10:               Gains are u4.10 format, starting =
at 0.0
> > + */
> > +enum bcm2835_isp_gain_format {
> > +     GAIN_FORMAT_U0P8_1 =3D 0,
> > +     GAIN_FORMAT_U1P7_0 =3D 1,
> > +     GAIN_FORMAT_U1P7_1 =3D 2,
> > +     GAIN_FORMAT_U2P6_0 =3D 3,
> > +     GAIN_FORMAT_U2P6_1 =3D 4,
> > +     GAIN_FORMAT_U3P5_0 =3D 5,
> > +     GAIN_FORMAT_U3P5_1 =3D 6,
> > +     GAIN_FORMAT_U4P10  =3D 7,
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_lens_shading - Lens shading tables supplied with=
 the
> > + *                                V4L2_CID_USER_BCM2835_ISP_LENS_SHADI=
NG
> > + *                                ctrl.
> > + *
> > + * @enabled:         Enable lens shading.
> > + * @grid_cell_size:  Size of grid cells in samples (16, 32, 64, 128 or=
 256).
> > + * @grid_width:              Width of lens shading tables in grid cell=
s.
> > + * @grid_stride:     Row to row distance (in grid cells) between grid =
cells
> > + *                   in the same horizontal location.
> > + * @grid_height:     Height of lens shading tables in grid cells.
> > + * @mem_handle_table:        Memory handle to the tables.
>
> What sort of handle is this? I.e. where does it come from?

This is being reworked to be a dmabuf fd allocated by userspace using dma-h=
eaps.

> > + * @ref_transform:   Reference transform - unsupported, please pass ze=
ro.
> > + * @corner_sampled:  Whether the gains are sampled at the corner point=
s
> > + *                   of the grid cells or in the cell centres.
> > + * @gain_format:     Format of the gains (see enum &bcm2835_isp_gain_f=
ormat).
> > + */
> > +struct bcm2835_isp_lens_shading {
> > +     __u32 enabled;
> > +     __u32 grid_cell_size;
> > +     __u32 grid_width;
> > +     __u32 grid_stride;
> > +     __u32 grid_height;
> > +     __u32 mem_handle_table;
> > +     __u32 ref_transform;
> > +     __u32 corner_sampled;
> > +     __u32 gain_format;
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_black_level - Sensor black level set with the
> > + *                               V4L2_CID_USER_BCM2835_ISP_BLACK_LEVEL=
 ctrl.
> > + *
> > + * @enabled:         Enable black level.
> > + * @black_level_r:   Black level for red channel.
> > + * @black_level_g:   Black level for green channels.
> > + * @black_level_b:   Black level for blue channel.
> > + */
> > +struct bcm2835_isp_black_level {
> > +     __u32 enabled;
> > +     __u16 black_level_r;
> > +     __u16 black_level_g;
> > +     __u16 black_level_b;
> > +     __u8 pad_[2]; /* Unused */
>
> I prefer 'padding' over 'pad_'.
>
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_geq - Green equalisation parameters set with the
> > + *                       V4L2_CID_USER_BCM2835_ISP_GEQ ctrl.
> > + *
> > + * @enabled: Enable green equalisation.
> > + * @offset:  Fixed offset of the green equalisation threshold.
> > + * @slope:   Slope of the green equalisation threshold.
> > + */
> > +struct bcm2835_isp_geq {
> > +     __u32 enabled;
> > +     __u32 offset;
> > +     struct bcm2835_isp_rational slope;
> > +};
> > +
> > +#define BCM2835_NUM_GAMMA_PTS 33
> > +
> > +/**
> > + * struct bcm2835_isp_gamma - Gamma parameters set with the
> > + *                         V4L2_CID_USER_BCM2835_ISP_GAMMA ctrl.
> > + *
> > + * @enabled: Enable gamma adjustment.
> > + * @X:               X values of the points defining the gamma curve.
> > + *           Values should be scaled to 16 bits.
> > + * @Y:               Y values of the points defining the gamma curve.
> > + *           Values should be scaled to 16 bits.
>
> I assume 0 =3D=3D black and 0xffff =3D=3D white (or max luminance)?
>
> And so typically x[0] =3D=3D y[0] =3D=3D 0 and x[32] =3D=3D y[32] =3D=3D =
0xffff?
>
> > + */
> > +struct bcm2835_isp_gamma {
> > +     __u32 enabled;
> > +     __u16 x[BCM2835_NUM_GAMMA_PTS];
> > +     __u16 y[BCM2835_NUM_GAMMA_PTS];
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_denoise - Denoise parameters set with the
> > + *                           V4L2_CID_USER_BCM2835_ISP_DENOISE ctrl.
> > + *
> > + * @enabled: Enable denoise.
> > + * @constant:        Fixed offset of the noise threshold.
> > + * @slope:   Slope of the noise threshold.
> > + * @strength:        Denoise strength between 0.0 (off) and 1.0 (maxim=
um).
> > + */
> > +struct bcm2835_isp_denoise {
> > +     __u32 enabled;
> > +     __u32 constant;
> > +     struct bcm2835_isp_rational slope;
> > +     struct bcm2835_isp_rational strength;
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_sharpen - Sharpen parameters set with the
> > + *                           V4L2_CID_USER_BCM2835_ISP_SHARPEN ctrl.
> > + *
> > + * @enabled: Enable sharpening.
> > + * @threshold:       Threshold at which to start sharpening pixels.
> > + * @strength:        Strength with which pixel sharpening increases.
> > + * @limit:   Limit to the amount of sharpening applied.
> > + */
> > +struct bcm2835_isp_sharpen {
> > +     __u32 enabled;
> > +     struct bcm2835_isp_rational threshold;
> > +     struct bcm2835_isp_rational strength;
> > +     struct bcm2835_isp_rational limit;
> > +};
> > +
> > +/**
> > + * enum bcm2835_isp_dpc_mode - defective pixel correction (DPC) streng=
th.
> > + *
> > + * @DPC_MODE_OFF:            No DPC.
> > + * @DPC_MODE_NORMAL:         Normal DPC.
> > + * @DPC_MODE_STRONG:         Strong DPC.
> > + */
> > +enum bcm2835_isp_dpc_mode {
> > +     DPC_MODE_OFF =3D 0,
> > +     DPC_MODE_NORMAL =3D 1,
> > +     DPC_MODE_STRONG =3D 2,
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_dpc - Defective pixel correction (DPC) parameter=
s set
> > + *                       with the V4L2_CID_USER_BCM2835_ISP_DPC ctrl.
> > + *
> > + * @enabled: Enable DPC.
> > + * @strength:        DPC strength (see enum &bcm2835_isp_dpc_mode).
>
> Isn't DPC_MODE_OFF equal to just setting 'enabled' to false? If so,
> wouldn't the 'strength' field be sufficient?
>
> > + */
> > +struct bcm2835_isp_dpc {
> > +     __u32 enabled;
> > +     __u32 strength;
> > +};
> > +
> > +/*
> > + * ISP statistics structures.
> > + *
> > + * The bcm2835_isp_stats structure is generated at the output of the
> > + * statistics node.  Note that this does not directly map onto the sta=
tistics
> > + * output of the ISP HW.  Instead, the MMAL firmware code maps the HW =
statistics
> > + * to the bcm2835_isp_stats structure.
> > + */
> > +#define DEFAULT_AWB_REGIONS_X 16
> > +#define DEFAULT_AWB_REGIONS_Y 12
> > +
> > +#define NUM_HISTOGRAMS 2
> > +#define NUM_HISTOGRAM_BINS 128
> > +#define AWB_REGIONS (DEFAULT_AWB_REGIONS_X * DEFAULT_AWB_REGIONS_Y)
> > +#define FLOATING_REGIONS 16
> > +#define AGC_REGIONS 16
> > +#define FOCUS_REGIONS 12
> > +
> > +/**
> > + * struct bcm2835_isp_stats_hist - Histogram statistics
> > + *
> > + * @r_hist:  Red channel histogram.
> > + * @g_hist:  Combined green channel histogram.
> > + * @b_hist:  Blue channel histogram.
> > + */
> > +struct bcm2835_isp_stats_hist {
> > +     __u32 r_hist[NUM_HISTOGRAM_BINS];
> > +     __u32 g_hist[NUM_HISTOGRAM_BINS];
> > +     __u32 b_hist[NUM_HISTOGRAM_BINS];
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_stats_region - Region sums.
> > + *
> > + * @counted: The number of 2x2 bayer tiles accumulated.
> > + * @notcounted:      The number of 2x2 bayer tiles not accumulated.
> > + * @r_sum:   Total sum of counted pixels in the red channel for a regi=
on.
> > + * @g_sum:   Total sum of counted pixels in the green channel for a re=
gion.
> > + * @b_sum:   Total sum of counted pixels in the blue channel for a reg=
ion.
> > + */
> > +struct bcm2835_isp_stats_region {
> > +     __u32 counted;
> > +     __u32 notcounted;
> > +     __u64 r_sum;
> > +     __u64 g_sum;
> > +     __u64 b_sum;
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_stats_focus - Focus statistics.
> > + *
> > + * @contrast_val:    Focus measure - accumulated output of the focus f=
ilter.
> > + *                   In the first dimension, index [0] counts pixels b=
elow a
> > + *                   preset threshold, and index [1] counts pixels abo=
ve the
> > + *                   threshold.  In the second dimension, index [0] us=
es the
> > + *                   first predefined filter, and index [1] uses the s=
econd
> > + *                   predefined filter.
> > + * @contrast_val_num:        The number of counted pixels in the above=
 accumulation.
> > + */
> > +struct bcm2835_isp_stats_focus {
> > +     __u64 contrast_val[2][2];
> > +     __u32 contrast_val_num[2][2];
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_stats - ISP statistics.
> > + *
> > + * @version:         Version of the bcm2835_isp_stats structure.
> > + * @size:            Size of the bcm2835_isp_stats structure.
> > + * @hist:            Histogram statistics for the entire image.
> > + * @awb_stats:               Statistics for the regions defined for AW=
B calculations.
> > + * @floating_stats:  Statistics for arbitrarily placed (floating) regi=
ons.
> > + * @agc_stats:               Statistics for the regions defined for AG=
C calculations.
> > + * @focus_stats:     Focus filter statistics for the focus regions.
> > + */
> > +struct bcm2835_isp_stats {
> > +     __u32 version;
> > +     __u32 size;
> > +     struct bcm2835_isp_stats_hist hist[NUM_HISTOGRAMS];
> > +     struct bcm2835_isp_stats_region awb_stats[AWB_REGIONS];
> > +     struct bcm2835_isp_stats_region floating_stats[FLOATING_REGIONS];
> > +     struct bcm2835_isp_stats_region agc_stats[AGC_REGIONS];
> > +     struct bcm2835_isp_stats_focus focus_stats[FOCUS_REGIONS];
> > +};
> > +
> > +#endif /* __BCM2835_ISP_H_ */
> > diff --git a/drivers/staging/vc04_services/vchiq-mmal/Kconfig b/drivers=
/staging/vc04_services/vchiq-mmal/Kconfig
> > index 106f71e709df..072f3c755a68 100644
> > --- a/drivers/staging/vc04_services/vchiq-mmal/Kconfig
> > +++ b/drivers/staging/vc04_services/vchiq-mmal/Kconfig
> > @@ -5,4 +5,5 @@ config BCM2835_VCHIQ_MMAL
> >       help
> >         Enables the MMAL API over VCHIQ interface as used for the
> >         majority of the multimedia services on VideoCore.
> > -       Defaults to Y when the Broadcomd BCM2835 camera host is selecte=
d.
> > +       Defaults to Y when the Broadcomd BCM2835 camera host or ISP are
> > +       selected.
> > diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h =
b/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h
> > index 44ba91aa6d47..8d904fcce388 100644
> > --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h
> > +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h
> > @@ -100,6 +100,10 @@
> >   */
> >  #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')
> >
> > +/** ISP image statistics format
> > + */
> > +#define MMAL_ENCODING_BRCM_STATS       MMAL_FOURCC('S', 'T', 'A', 'T')
> > +
> >  /* }@ */
> >
> >  /** \name Pre-defined audio encodings */
> > diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h=
 b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
> > index 1793103b18fd..b3552af5cf8f 100644
> > --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
> > +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
> > @@ -221,6 +221,62 @@ enum mmal_parameter_camera_type {
> >       MMAL_PARAMETER_SHUTTER_SPEED,
> >               /**< Takes a @ref MMAL_PARAMETER_AWB_GAINS_T */
> >       MMAL_PARAMETER_CUSTOM_AWB_GAINS,
> > +             /**< Takes a @ref MMAL_PARAMETER_CAMERA_SETTINGS_T */
> > +     MMAL_PARAMETER_CAMERA_SETTINGS,
> > +             /**< Takes a @ref MMAL_PARAMETER_PRIVACY_INDICATOR_T */
> > +     MMAL_PARAMETER_PRIVACY_INDICATOR,
> > +             /**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
> > +     MMAL_PARAMETER_VIDEO_DENOISE,
> > +             /**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
> > +     MMAL_PARAMETER_STILLS_DENOISE,
> > +             /**< Takes a @ref MMAL_PARAMETER_CAMERA_ANNOTATE_T */
> > +     MMAL_PARAMETER_ANNOTATE,
> > +             /**< Takes a @ref MMAL_PARAMETER_STEREOSCOPIC_MODE_T */
> > +     MMAL_PARAMETER_STEREOSCOPIC_MODE,
> > +             /**< Takes a @ref MMAL_PARAMETER_CAMERA_INTERFACE_T */
> > +     MMAL_PARAMETER_CAMERA_INTERFACE,
> > +             /**< Takes a @ref MMAL_PARAMETER_CAMERA_CLOCKING_MODE_T *=
/
> > +     MMAL_PARAMETER_CAMERA_CLOCKING_MODE,
> > +             /**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_CONFIG_T */
> > +     MMAL_PARAMETER_CAMERA_RX_CONFIG,
> > +             /**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_TIMING_T */
> > +     MMAL_PARAMETER_CAMERA_RX_TIMING,
> > +             /**< Takes a @ref MMAL_PARAMETER_UINT32_T */
> > +     MMAL_PARAMETER_DPF_CONFIG,
> > +
> > +     /* 0x50 */
> > +             /**< Takes a @ref MMAL_PARAMETER_UINT32_T */
> > +     MMAL_PARAMETER_JPEG_RESTART_INTERVAL,
> > +             /**< Takes a @ref MMAL_PARAMETER_UINT32_T */
> > +     MMAL_PARAMETER_CAMERA_ISP_BLOCK_OVERRIDE,
> > +             /**< Takes a @ref MMAL_PARAMETER_LENS_SHADING_T */
> > +     MMAL_PARAMETER_LENS_SHADING_OVERRIDE,
> > +             /**< Takes a @ref MMAL_PARAMETER_UINT32_T */
> > +     MMAL_PARAMETER_BLACK_LEVEL,
> > +             /**< Takes a @ref MMAL_PARAMETER_RESIZE_T */
> > +     MMAL_PARAMETER_RESIZE_PARAMS,
> > +             /**< Takes a @ref MMAL_PARAMETER_CROP_T */
> > +     MMAL_PARAMETER_CROP,
> > +             /**< Takes a @ref MMAL_PARAMETER_INT32_T */
> > +     MMAL_PARAMETER_OUTPUT_SHIFT,
> > +             /**< Takes a @ref MMAL_PARAMETER_INT32_T */
> > +     MMAL_PARAMETER_CCM_SHIFT,
> > +             /**< Takes a @ref MMAL_PARAMETER_CUSTOM_CCM_T */
> > +     MMAL_PARAMETER_CUSTOM_CCM,
> > +             /**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
> > +     MMAL_PARAMETER_ANALOG_GAIN,
> > +             /**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
> > +     MMAL_PARAMETER_DIGITAL_GAIN,
> > +             /**< Takes a @ref MMAL_PARAMETER_DENOISE_T */
> > +     MMAL_PARAMETER_DENOISE,
> > +             /**< Takes a @ref MMAL_PARAMETER_SHARPEN_T */
> > +     MMAL_PARAMETER_SHARPEN,
> > +             /**< Takes a @ref MMAL_PARAMETER_GEQ_T */
> > +     MMAL_PARAMETER_GEQ,
> > +             /**< Tales a @ref MMAP_PARAMETER_DPC_T */
> > +     MMAL_PARAMETER_DPC,
> > +             /**< Tales a @ref MMAP_PARAMETER_GAMMA_T */
> > +     MMAL_PARAMETER_GAMMA,
> >  };
> >
> >  struct mmal_parameter_rational {
> > @@ -779,7 +835,102 @@ struct mmal_parameter_camera_info {
> >       struct mmal_parameter_camera_info_camera
> >               cameras[MMAL_PARAMETER_CAMERA_INFO_MAX_CAMERAS];
> >       struct mmal_parameter_camera_info_flash
> > -                             flashes[MMAL_PARAMETER_CAMERA_INFO_MAX_FL=
ASHES];
> > +             flashes[MMAL_PARAMETER_CAMERA_INFO_MAX_FLASHES];
> > +};
> > +
> > +struct mmal_parameter_ccm {
> > +     struct mmal_parameter_rational ccm[3][3];
> > +     s32 offsets[3];
> > +};
> > +
> > +struct mmal_parameter_custom_ccm {
> > +     u32 enabled; /**< Enable the custom CCM. */
> > +     struct mmal_parameter_ccm ccm; /**< CCM to be used. */
> > +};
> > +
> > +struct mmal_parameter_lens_shading {
> > +     u32 enabled;
> > +     u32 grid_cell_size;
> > +     u32 grid_width;
> > +     u32 grid_stride;
> > +     u32 grid_height;
> > +     u32 mem_handle_table;
> > +     u32 ref_transform;
> > +};
> > +
> > +enum mmal_parameter_ls_gain_format_type {
> > +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U0P8_1 =3D 0,
> > +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_0 =3D 1,
> > +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_1 =3D 2,
> > +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_0 =3D 3,
> > +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_1 =3D 4,
> > +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_0 =3D 5,
> > +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_1 =3D 6,
> > +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U4P10  =3D 7,
> > +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_DUMMY  =3D 0x7FFFFFFF
> > +};
> > +
> > +struct mmal_parameter_lens_shading_v2 {
> > +     u32 enabled;
> > +     u32 grid_cell_size;
> > +     u32 grid_width;
> > +     u32 grid_stride;
> > +     u32 grid_height;
> > +     u32 mem_handle_table;
> > +     u32 ref_transform;
> > +     u32 corner_sampled;
> > +     enum mmal_parameter_ls_gain_format_type gain_format;
> > +};
> > +
> > +struct mmal_parameter_black_level {
> > +     u32 enabled;
> > +     u16 black_level_r;
> > +     u16 black_level_g;
> > +     u16 black_level_b;
> > +     u8 pad_[2]; /* Unused */
> > +};
> > +
> > +struct mmal_parameter_geq {
> > +     u32 enabled;
> > +     u32 offset;
> > +     struct mmal_parameter_rational slope;
> > +};
> > +
> > +#define MMAL_NUM_GAMMA_PTS 33
> > +struct mmal_parameter_gamma {
> > +     u32 enabled;
> > +     u16 x[MMAL_NUM_GAMMA_PTS];
> > +     u16 y[MMAL_NUM_GAMMA_PTS];
> > +};
> > +
> > +struct mmal_parameter_denoise {
> > +     u32 enabled;
> > +     u32 constant;
> > +     struct mmal_parameter_rational slope;
> > +     struct mmal_parameter_rational strength;
> > +};
> > +
> > +struct mmal_parameter_sharpen {
> > +     u32 enabled;
> > +     struct mmal_parameter_rational threshold;
> > +     struct mmal_parameter_rational strength;
> > +     struct mmal_parameter_rational limit;
> > +};
> > +
> > +enum mmal_dpc_mode {
> > +     MMAL_DPC_MODE_OFF =3D 0,
> > +     MMAL_DPC_MODE_NORMAL =3D 1,
> > +     MMAL_DPC_MODE_STRONG =3D 2,
> > +     MMAL_DPC_MODE_MAX =3D 0x7FFFFFFF,
> > +};
> > +
> > +struct mmal_parameter_dpc {
> > +     u32 enabled;
> > +     u32 strength;
> > +};
> > +
> > +struct mmal_parameter_crop {
> > +     struct vchiq_mmal_rect rect;
> >  };
> >
> >  #endif
> >

Cheer
  Dave

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3A3200239
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 08:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729367AbgFSGxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 02:53:37 -0400
Received: from mga07.intel.com ([134.134.136.100]:38400 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729080AbgFSGxh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 02:53:37 -0400
IronPort-SDR: GZseZQbqig6a13waVEv3w+rMkqJzsj6K5CKZiSzVOUBl3Qr1mdiIWhrWMiu7Gm/Kri2UTj0Xs1
 wV75COcGjPRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="208108958"
X-IronPort-AV: E=Sophos;i="5.75,254,1589266800"; 
   d="scan'208";a="208108958"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2020 23:53:36 -0700
IronPort-SDR: +4LuYp7Q2608zhXwp2LjnrFySdknHRRFrbwO1c6mehJUX0/TDWTAFy8h0uZxeKSZVWBbTz9lIp
 5Zj3vX7LQlvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,254,1589266800"; 
   d="scan'208";a="421764752"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.37.62])
  by orsmga004.jf.intel.com with ESMTP; 18 Jun 2020 23:53:32 -0700
Date:   Fri, 19 Jun 2020 08:53:30 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        virtio-dev@lists.oasis-open.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        "open list:VIRTIO GPU DRIVER" 
        <virtualization@lists.linux-foundation.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] virtio: add dma-buf support for exported objects
Message-ID: <20200619065329.GA12127@ubuntu>
References: <20200526105811.30784-1-stevensd@chromium.org>
 <20200526105811.30784-2-stevensd@chromium.org>
 <20200604145620-mutt-send-email-mst@kernel.org>
 <20200618122856.GC4189@ubuntu>
 <CAD=HUj6NY5W1ePKwZhPM+MDTtgEooy-rjo6QX6Fj2qAFtS8H3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj6NY5W1ePKwZhPM+MDTtgEooy-rjo6QX6Fj2qAFtS8H3g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

On Fri, Jun 19, 2020 at 10:57:37AM +0900, David Stevens wrote:
> On Thu, Jun 18, 2020 at 9:29 PM Guennadi Liakhovetski
> <guennadi.liakhovetski@linux.intel.com> wrote:
> >
> > Hi Michael,
> >
> > On Thu, Jun 04, 2020 at 03:05:23PM -0400, Michael S. Tsirkin wrote:
> > > On Tue, May 26, 2020 at 07:58:09PM +0900, David Stevens wrote:
> > > > This change adds a new flavor of dma-bufs that can be used by virtio
> > > > drivers to share exported objects. A virtio dma-buf can be queried by
> > > > virtio drivers to obtain the UUID which identifies the underlying
> > > > exported object.
> > > >
> > > > Signed-off-by: David Stevens <stevensd@chromium.org>
> > >
> > > Is this just for graphics? If yes I'd rather we put it in the graphics
> > > driver. We can always move it later ...
> >
> > Wouldn't this be the API that audio virtualisation will have to use to share
> > buffers between the host and any guests?
> 
> The new flavor of dma-buf isn't directly related to sharing buffers
> between the host and the guest. The purpose of this API is to help
> share buffers between multiple virtio devices - e.g. share buffers
> created by a virito-gpu device with a virito-video device. In
> particular, the new flavor of dma-buf provides a mechanism to attach
> identifying metadata to a dma-buf object that is shared between
> different virtio drivers in a single guest. This identifying metadata
> can then be passed to the importing device and used to fetch some
> resource from the exporting device. But the new flavor of dma-buf is
> an abstraction within the guest kernel, independent of the host-guest
> boundary, and it's definitely not necessary if we're only talking
> about a single virtio subsystem.

Thanks for the explanation!

Regards
Guennadi

> > > > ---
> > > >  drivers/virtio/Makefile         |  2 +-
> > > >  drivers/virtio/virtio.c         |  6 +++
> > > >  drivers/virtio/virtio_dma_buf.c | 89 +++++++++++++++++++++++++++++++++
> > > >  include/linux/virtio.h          |  1 +
> > > >  include/linux/virtio_dma_buf.h  | 58 +++++++++++++++++++++
> > > >  5 files changed, 155 insertions(+), 1 deletion(-)
> > > >  create mode 100644 drivers/virtio/virtio_dma_buf.c
> > > >  create mode 100644 include/linux/virtio_dma_buf.h
> > > >
> > > > diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> > > > index 29a1386ecc03..ecdae5b596de 100644
> > > > --- a/drivers/virtio/Makefile
> > > > +++ b/drivers/virtio/Makefile
> > > > @@ -1,5 +1,5 @@
> > > >  # SPDX-License-Identifier: GPL-2.0
> > > > -obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
> > > > +obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
> > > >  obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
> > > >  obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
> > > >  virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> > > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > > index a977e32a88f2..5d46f0ded92d 100644
> > > > --- a/drivers/virtio/virtio.c
> > > > +++ b/drivers/virtio/virtio.c
> > > > @@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(register_virtio_device);
> > > >
> > > > +bool is_virtio_device(struct device *dev)
> > > > +{
> > > > +   return dev->bus == &virtio_bus;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(is_virtio_device);
> > > > +
> > > >  void unregister_virtio_device(struct virtio_device *dev)
> > > >  {
> > > >     int index = dev->index; /* save for after device release */
> > > > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> > > > new file mode 100644
> > > > index 000000000000..23e3399b11ed
> > > > --- /dev/null
> > > > +++ b/drivers/virtio/virtio_dma_buf.c
> > > > @@ -0,0 +1,89 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +/*
> > > > + * dma-bufs for virtio exported objects
> > > > + *
> > > > + * Copyright (C) 2020 Google, Inc.
> > > > + */
> > > > +
> > > > +#include <linux/virtio_dma_buf.h>
> > > > +
> > > > +/**
> > > > + * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> > > > + *
> > > > + * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
> > > > + * for an virtio exported object that can be queried by other virtio drivers
> > > > + * for the object's UUID.
> > > > + */
> > > > +struct dma_buf *virtio_dma_buf_export(
> > > > +           const struct virtio_dma_buf_export_info *virtio_exp_info)
> > > > +{
> > > > +   struct dma_buf_export_info exp_info;
> > > > +
> > > > +   if (!virtio_exp_info->ops
> > > > +           || virtio_exp_info->ops->ops.attach != &virtio_dma_buf_attach
> > > > +           || !virtio_exp_info->ops->get_uuid) {
> > > > +           return ERR_PTR(-EINVAL);
> > > > +   }
> > > > +
> > > > +   exp_info.exp_name = virtio_exp_info->exp_name;
> > > > +   exp_info.owner = virtio_exp_info->owner;
> > > > +   exp_info.ops = &virtio_exp_info->ops->ops;
> > > > +   exp_info.size = virtio_exp_info->size;
> > > > +   exp_info.flags = virtio_exp_info->flags;
> > > > +   exp_info.resv = virtio_exp_info->resv;
> > > > +   exp_info.priv = virtio_exp_info->priv;
> > > > +   BUILD_BUG_ON(sizeof(struct virtio_dma_buf_export_info)
> > > > +                != sizeof(struct dma_buf_export_info));
> > >
> > > This is the only part that gives me pause. Why do we need this hack?
> > > What's wrong with just using dma_buf_export_info directly,
> > > and if you want the virtio ops, just using container_off?
> > >
> > >
> > >
> > > > +
> > > > +   return dma_buf_export(&exp_info);
> > > > +}
> > > > +EXPORT_SYMBOL(virtio_dma_buf_export);
> > > > +
> > > > +/**
> > > > + * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
> > > > + */
> > > > +int virtio_dma_buf_attach(struct dma_buf *dma_buf,
> > > > +                     struct dma_buf_attachment *attach)
> > > > +{
> > > > +   int ret;
> > > > +   const struct virtio_dma_buf_ops *ops = container_of(
> > > > +                   dma_buf->ops, const struct virtio_dma_buf_ops, ops);
> > > > +
> > > > +   if (ops->device_attach) {
> > > > +           ret = ops->device_attach(dma_buf, attach);
> > > > +           if (ret)
> > > > +                   return ret;
> > > > +   }
> > > > +   return 0;
> > > > +}
> > > > +EXPORT_SYMBOL(virtio_dma_buf_attach);
> > > > +
> > > > +/**
> > > > + * is_virtio_dma_buf - returns true if the given dma-buf is a virtio dma-buf
> > > > + * @dma_buf: buffer to query
> > > > + */
> > > > +bool is_virtio_dma_buf(struct dma_buf *dma_buf)
> > > > +{
> > > > +   return dma_buf->ops->attach == &virtio_dma_buf_attach;
> > > > +}
> > > > +EXPORT_SYMBOL(is_virtio_dma_buf);
> > > > +
> > > > +/**
> > > > + * virtio_dma_buf_get_uuid - gets the uuid of the virtio dma-buf's exported object
> > > > + * @dma_buf: [in] buffer to query
> > > > + * @uuid: [out] the uuid
> > > > + *
> > > > + * Returns: 0 on success, negative on failure.
> > > > + */
> > > > +int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,
> > > > +                       uuid_t *uuid)
> > > > +{
> > > > +   const struct virtio_dma_buf_ops *ops = container_of(
> > > > +                   dma_buf->ops, const struct virtio_dma_buf_ops, ops);
> > > > +
> > > > +   if (!is_virtio_dma_buf(dma_buf))
> > > > +           return -EINVAL;
> > > > +
> > > > +   return ops->get_uuid(dma_buf, uuid);
> > > > +}
> > > > +EXPORT_SYMBOL(virtio_dma_buf_get_uuid);
> > > > diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> > > > index 15f906e4a748..9397e25616c4 100644
> > > > --- a/include/linux/virtio.h
> > > > +++ b/include/linux/virtio.h
> > > > @@ -128,6 +128,7 @@ static inline struct virtio_device *dev_to_virtio(struct device *_dev)
> > > >  void virtio_add_status(struct virtio_device *dev, unsigned int status);
> > > >  int register_virtio_device(struct virtio_device *dev);
> > > >  void unregister_virtio_device(struct virtio_device *dev);
> > > > +bool is_virtio_device(struct device *dev);
> > > >
> > > >  void virtio_break_device(struct virtio_device *dev);
> > > >
> > > > diff --git a/include/linux/virtio_dma_buf.h b/include/linux/virtio_dma_buf.h
> > > > new file mode 100644
> > > > index 000000000000..29fee167afbd
> > > > --- /dev/null
> > > > +++ b/include/linux/virtio_dma_buf.h
> > > > @@ -0,0 +1,58 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +/*
> > > > + * dma-bufs for virtio exported objects
> > > > + *
> > > > + * Copyright (C) 2020 Google, Inc.
> > > > + */
> > > > +
> > > > +#ifndef _LINUX_VIRTIO_DMA_BUF_H
> > > > +#define _LINUX_VIRTIO_DMA_BUF_H
> > > > +
> > > > +#include <linux/dma-buf.h>
> > > > +#include <linux/uuid.h>
> > > > +#include <linux/virtio.h>
> > > > +
> > > > +/**
> > > > + * struct virtio_dma_buf_ops - operations possible on exported object dma-buf
> > > > + * @ops: the base dma_buf_ops. ops.attach MUST be virtio_dma_buf_attach.
> > > > + * @device_attach: [optional] callback invoked by virtio_dma_buf_attach during
> > > > + *            all attach operations.
> > > > + * @get_uid: [required] callback to get the uuid of the exported object.
> > > > + */
> > > > +struct virtio_dma_buf_ops {
> > > > +   struct dma_buf_ops ops;
> > > > +   int (*device_attach)(struct dma_buf *dma_buf,
> > > > +                        struct dma_buf_attachment *attach);
> > > > +   int (*get_uuid)(struct dma_buf *dma_buf, uuid_t *uuid);
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct virtio_dma_buf_export_info - see struct dma_buf_export_info
> > > > + */
> > > > +struct virtio_dma_buf_export_info {
> > > > +   const char *exp_name;
> > > > +   struct module *owner;
> > > > +   const struct virtio_dma_buf_ops *ops;
> > > > +   size_t size;
> > > > +   int flags;
> > > > +   struct dma_resv *resv;
> > > > +   void *priv;
> > > > +};
> > > > +
> > > > +/**
> > > > + * DEFINE_VIRTIO_DMA_BUF_EXPORT_INFO - helper macro for exporters
> > > > + */
> > > > +#define DEFINE_VIRTIO_DMA_BUF_EXPORT_INFO(name)    \
> > > > +   struct virtio_dma_buf_export_info name = { \
> > > > +           .exp_name = KBUILD_MODNAME, \
> > > > +           .owner = THIS_MODULE }
> > > > +
> > > > +int virtio_dma_buf_attach(struct dma_buf *dma_buf,
> > > > +                     struct dma_buf_attachment *attach);
> > > > +
> > > > +struct dma_buf *virtio_dma_buf_export(
> > > > +           const struct virtio_dma_buf_export_info *virtio_exp_info);
> > > > +bool is_virtio_dma_buf(struct dma_buf *dma_buf);
> > > > +int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf, uuid_t *uuid);
> > > > +
> > > > +#endif /* _LINUX_VIRTIO_DMA_BUF_H */
> > > > --
> > > > 2.27.0.rc0.183.gde8f92d652-goog
> > >
> > > _______________________________________________
> > > Virtualization mailing list
> > > Virtualization@lists.linux-foundation.org
> > > https://lists.linuxfoundation.org/mailman/listinfo/virtualization

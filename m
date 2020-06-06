Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B7F1F0877
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2020 22:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbgFFUE1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jun 2020 16:04:27 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29134 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728229AbgFFUE0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Jun 2020 16:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591473864;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dbpBb4MSkQWgLg9Nn7J60Pj1PPVIBaYGkqlC19OVAoU=;
        b=iLkfwZ5RI5dAwhs23tvDYVkDaMLmzXgbnoWZWH4jGUcW9wWjQcIf6zriu5o68Q1PtGaWpl
        72GkJYecc9Wkg3hteOyhKB8WPhcTEpa5rQoDrT3s3aIzQjX8rPaw06VX8LQbAHXAcSzPkY
        SPAT8UD8FdTrzRJYBRR7TUNSj03b5gs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-Dg0eBt_wNVCDpG81CMWkrA-1; Sat, 06 Jun 2020 16:04:20 -0400
X-MC-Unique: Dg0eBt_wNVCDpG81CMWkrA-1
Received: by mail-wr1-f71.google.com with SMTP id l1so5336063wrc.8
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2020 13:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dbpBb4MSkQWgLg9Nn7J60Pj1PPVIBaYGkqlC19OVAoU=;
        b=cBn3QjpU1EcMzEX/WZNZWV3q9anV+Bo+9PCjT26/52jd2V9LpDkrwkgsErOlfvb2mb
         Acs+GYWD88c5b+ny0fBKLGgXet5/K4mgyvNHrtm4WffUAPtFj/Y3bjhM4txJmel4tizx
         EPBXCexrUfu3Ozj81ctaH9Pv1OeobPT5t8lZXjqWJnBgu0egG73OhGbiZspQXAAaGXE5
         gywp8jg/mE9fjQfKfa6Ecdjd34/SevO5+K6IrA+uLz2cAMgPHehtRhJ4t0lyCWssuLsP
         D/DEx2AGO0O0/YVUDoP3QuAdoZbFuG8638Cg4+d2ADdTYDpexdi/kYkMPY2nF495RbR/
         TAzQ==
X-Gm-Message-State: AOAM530bMCCs6KROR6FCwrqOJDj7fAB28GXklkbAFvP8ezYvZnzLJ2Ph
        jdKHoPgl01cTFdUVCja380MEGYxtTrqwVq+GjAgruGu86SmVueGxfIwYKmxvC9G5/Ii1qXHxLrN
        z10RjMrq6wDoqaVde+xIKt5M=
X-Received: by 2002:a1c:9acf:: with SMTP id c198mr8645772wme.172.1591473859039;
        Sat, 06 Jun 2020 13:04:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF/K0kPe+1BU5+z6wf6mCOoFiN46YBrIzFqjnlbkr449lWKdRucwcJZf/rZHdlV+ssrzYp6g==
X-Received: by 2002:a1c:9acf:: with SMTP id c198mr8645737wme.172.1591473858743;
        Sat, 06 Jun 2020 13:04:18 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
        by smtp.gmail.com with ESMTPSA id b8sm17369698wrm.35.2020.06.06.13.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 13:04:17 -0700 (PDT)
Date:   Sat, 6 Jun 2020 16:04:14 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        open list <linux-kernel@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO GPU DRIVER" 
        <virtualization@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, virtio-dev@lists.oasis-open.org
Subject: Re: [PATCH v4 1/3] virtio: add dma-buf support for exported objects
Message-ID: <20200606160155-mutt-send-email-mst@kernel.org>
References: <20200526105811.30784-1-stevensd@chromium.org>
 <20200526105811.30784-2-stevensd@chromium.org>
 <20200604145620-mutt-send-email-mst@kernel.org>
 <CAD=HUj74mKs5AfcViD3CBva86E0Hvg_pmYChAJe3ny8jtnZ8Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj74mKs5AfcViD3CBva86E0Hvg_pmYChAJe3ny8jtnZ8Tw@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 05, 2020 at 10:28:42AM +0900, David Stevens wrote:
> On Fri, Jun 5, 2020 at 4:05 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, May 26, 2020 at 07:58:09PM +0900, David Stevens wrote:
> > > This change adds a new flavor of dma-bufs that can be used by virtio
> > > drivers to share exported objects. A virtio dma-buf can be queried by
> > > virtio drivers to obtain the UUID which identifies the underlying
> > > exported object.
> > >
> > > Signed-off-by: David Stevens <stevensd@chromium.org>
> >
> > Is this just for graphics? If yes I'd rather we put it in the graphics
> > driver. We can always move it later ...
> 
> As stated in the cover letter, this will be used by virtio-video.
> 
> The proposed virtio-video patches: https://markmail.org/thread/p5d3k566srtdtute
> The patch which imports these dma-bufs (slightly out of data, uses v3
> of this patch set): https://markmail.org/thread/j4xlqaaim266qpks
> 
> > > ---
> > >  drivers/virtio/Makefile         |  2 +-
> > >  drivers/virtio/virtio.c         |  6 +++
> > >  drivers/virtio/virtio_dma_buf.c | 89 +++++++++++++++++++++++++++++++++
> > >  include/linux/virtio.h          |  1 +
> > >  include/linux/virtio_dma_buf.h  | 58 +++++++++++++++++++++
> > >  5 files changed, 155 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/virtio/virtio_dma_buf.c
> > >  create mode 100644 include/linux/virtio_dma_buf.h
> > >
> > > diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> > > index 29a1386ecc03..ecdae5b596de 100644
> > > --- a/drivers/virtio/Makefile
> > > +++ b/drivers/virtio/Makefile
> > > @@ -1,5 +1,5 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > > -obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
> > > +obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
> > >  obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
> > >  obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
> > >  virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > index a977e32a88f2..5d46f0ded92d 100644
> > > --- a/drivers/virtio/virtio.c
> > > +++ b/drivers/virtio/virtio.c
> > > @@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
> > >  }
> > >  EXPORT_SYMBOL_GPL(register_virtio_device);
> > >
> > > +bool is_virtio_device(struct device *dev)
> > > +{
> > > +     return dev->bus == &virtio_bus;
> > > +}
> > > +EXPORT_SYMBOL_GPL(is_virtio_device);
> > > +
> > >  void unregister_virtio_device(struct virtio_device *dev)
> > >  {
> > >       int index = dev->index; /* save for after device release */
> > > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> > > new file mode 100644
> > > index 000000000000..23e3399b11ed
> > > --- /dev/null
> > > +++ b/drivers/virtio/virtio_dma_buf.c
> > > @@ -0,0 +1,89 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * dma-bufs for virtio exported objects
> > > + *
> > > + * Copyright (C) 2020 Google, Inc.
> > > + */
> > > +
> > > +#include <linux/virtio_dma_buf.h>
> > > +
> > > +/**
> > > + * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> > > + *
> > > + * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
> > > + * for an virtio exported object that can be queried by other virtio drivers
> > > + * for the object's UUID.
> > > + */
> > > +struct dma_buf *virtio_dma_buf_export(
> > > +             const struct virtio_dma_buf_export_info *virtio_exp_info)
> > > +{
> > > +     struct dma_buf_export_info exp_info;
> > > +
> > > +     if (!virtio_exp_info->ops
> > > +             || virtio_exp_info->ops->ops.attach != &virtio_dma_buf_attach
> > > +             || !virtio_exp_info->ops->get_uuid) {
> > > +             return ERR_PTR(-EINVAL);
> > > +     }
> > > +
> > > +     exp_info.exp_name = virtio_exp_info->exp_name;
> > > +     exp_info.owner = virtio_exp_info->owner;
> > > +     exp_info.ops = &virtio_exp_info->ops->ops;
> > > +     exp_info.size = virtio_exp_info->size;
> > > +     exp_info.flags = virtio_exp_info->flags;
> > > +     exp_info.resv = virtio_exp_info->resv;
> > > +     exp_info.priv = virtio_exp_info->priv;
> > > +     BUILD_BUG_ON(sizeof(struct virtio_dma_buf_export_info)
> > > +                  != sizeof(struct dma_buf_export_info));
> >
> > This is the only part that gives me pause. Why do we need this hack?
> > What's wrong with just using dma_buf_export_info directly,
> > and if you want the virtio ops, just using container_off?
> 
> This approach provides a more explicit type signature and a little
> more type safety, I think. If others don't think it's a worthwhile
> tradeoff, I can remove it.
> 
> -David

The cost is that if dma_buf_export_info changes even slightly, we get
weird crashes.

-- 
MST


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C521F148A
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 10:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729140AbgFHIcm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 04:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgFHIck (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 04:32:40 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10003C08C5C4
        for <linux-media@vger.kernel.org>; Mon,  8 Jun 2020 01:32:39 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id l17so2614677qki.9
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2020 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PkfMEWlNgP90ibnqQv2yIrVhs/aB8dQaB0QBolj6lX8=;
        b=Vj1M3E7piAR8EdJ/2WukrZENcXk8IwxoiTbVha0RqsbMjV7r2TKfbezAWNZATmQBH6
         R3tvyTf3j8YnCWM2B1CtRsLYCQFrBZD9aVxoIYa4Y53VEoUWU9W4ZEAHG5tb/S0P7Plf
         Ahb+ccoluv11TQLpbde4PJhwTBXMEPPMsNoDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PkfMEWlNgP90ibnqQv2yIrVhs/aB8dQaB0QBolj6lX8=;
        b=Ff5bjOLZZ85I5hgQQhHwrQ1KGbxGP147N5iJf5E84w3kHlMfODwC6HOHoPI8c4TwNT
         XN7De4IzAG3EzgEnQ+edy4jMUJ0x8fNmwiPqCvocmROV8FcnPah0aKo5GlOiVOVHkkkE
         SMXLKydrdULLQBimJwxhKDhmPCoJQImTg6IZ6+nEyZdF2WrT/y+KF0QMZMRvuR8YI5aX
         pqsHYfX90VwLCSOCAWZDCJGjVFuNKubEEAt9loiTVhzfLPWig/tsPbLU2Wg6ynARAUed
         tkFV2OFIyoJhOx8j5BKEvduSI7mBQJ76BRu4WU2wTYr0a7s3CbV+kiFgK1Q0PNfUwEe3
         sdJg==
X-Gm-Message-State: AOAM5302XulOHc+NRB2xCHUzoty2bTv/pwtHaxwh69uE9gMBoe1C4aFN
        s9rn6D7m/INdWP/c5KqbZs+jAV8STbtwsOjddVcqWQ==
X-Google-Smtp-Source: ABdhPJwzNNR1KQE/DLKBgKo5vCFDKV9ETdj3TA7gn/orQ9aPIf72pnxU2G5F2nV4vlaOlcDCPQr1nAoQiw8TDjF+gqI=
X-Received: by 2002:a05:620a:21cc:: with SMTP id h12mr21201387qka.194.1591605158027;
 Mon, 08 Jun 2020 01:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200526105811.30784-1-stevensd@chromium.org> <20200526105811.30784-2-stevensd@chromium.org>
 <20200604145620-mutt-send-email-mst@kernel.org> <CAD=HUj74mKs5AfcViD3CBva86E0Hvg_pmYChAJe3ny8jtnZ8Tw@mail.gmail.com>
 <20200606160155-mutt-send-email-mst@kernel.org> <CAD=HUj5Jn+grQVfxmPSSnERdGwnu8RceDsdpWpoxXH+WL4k+qw@mail.gmail.com>
 <20200608015728-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200608015728-mutt-send-email-mst@kernel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Mon, 8 Jun 2020 17:32:26 +0900
Message-ID: <CAD=HUj68NfNK+0go7Z-XeZ2ckWJpYsym3G+-DfJyoUm+dJDznQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] virtio: add dma-buf support for exported objects
To:     "Michael S. Tsirkin" <mst@redhat.com>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 8, 2020 at 3:00 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Jun 08, 2020 at 10:33:09AM +0900, David Stevens wrote:
> > On Sun, Jun 7, 2020 at 5:04 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Fri, Jun 05, 2020 at 10:28:42AM +0900, David Stevens wrote:
> > > > On Fri, Jun 5, 2020 at 4:05 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Tue, May 26, 2020 at 07:58:09PM +0900, David Stevens wrote:
> > > > > > This change adds a new flavor of dma-bufs that can be used by virtio
> > > > > > drivers to share exported objects. A virtio dma-buf can be queried by
> > > > > > virtio drivers to obtain the UUID which identifies the underlying
> > > > > > exported object.
> > > > > >
> > > > > > Signed-off-by: David Stevens <stevensd@chromium.org>
> > > > >
> > > > > Is this just for graphics? If yes I'd rather we put it in the graphics
> > > > > driver. We can always move it later ...
> > > >
> > > > As stated in the cover letter, this will be used by virtio-video.
> > > >
> > > > The proposed virtio-video patches: https://markmail.org/thread/p5d3k566srtdtute
> > > > The patch which imports these dma-bufs (slightly out of data, uses v3
> > > > of this patch set): https://markmail.org/thread/j4xlqaaim266qpks
> > > >
> > > > > > ---
> > > > > >  drivers/virtio/Makefile         |  2 +-
> > > > > >  drivers/virtio/virtio.c         |  6 +++
> > > > > >  drivers/virtio/virtio_dma_buf.c | 89 +++++++++++++++++++++++++++++++++
> > > > > >  include/linux/virtio.h          |  1 +
> > > > > >  include/linux/virtio_dma_buf.h  | 58 +++++++++++++++++++++
> > > > > >  5 files changed, 155 insertions(+), 1 deletion(-)
> > > > > >  create mode 100644 drivers/virtio/virtio_dma_buf.c
> > > > > >  create mode 100644 include/linux/virtio_dma_buf.h
> > > > > >
> > > > > > diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> > > > > > index 29a1386ecc03..ecdae5b596de 100644
> > > > > > --- a/drivers/virtio/Makefile
> > > > > > +++ b/drivers/virtio/Makefile
> > > > > > @@ -1,5 +1,5 @@
> > > > > >  # SPDX-License-Identifier: GPL-2.0
> > > > > > -obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
> > > > > > +obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
> > > > > >  obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
> > > > > >  obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
> > > > > >  virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> > > > > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > > > > index a977e32a88f2..5d46f0ded92d 100644
> > > > > > --- a/drivers/virtio/virtio.c
> > > > > > +++ b/drivers/virtio/virtio.c
> > > > > > @@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(register_virtio_device);
> > > > > >
> > > > > > +bool is_virtio_device(struct device *dev)
> > > > > > +{
> > > > > > +     return dev->bus == &virtio_bus;
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_GPL(is_virtio_device);
> > > > > > +
> > > > > >  void unregister_virtio_device(struct virtio_device *dev)
> > > > > >  {
> > > > > >       int index = dev->index; /* save for after device release */
> > > > > > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..23e3399b11ed
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/virtio/virtio_dma_buf.c
> > > > > > @@ -0,0 +1,89 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > > > +/*
> > > > > > + * dma-bufs for virtio exported objects
> > > > > > + *
> > > > > > + * Copyright (C) 2020 Google, Inc.
> > > > > > + */
> > > > > > +
> > > > > > +#include <linux/virtio_dma_buf.h>
> > > > > > +
> > > > > > +/**
> > > > > > + * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> > > > > > + *
> > > > > > + * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
> > > > > > + * for an virtio exported object that can be queried by other virtio drivers
> > > > > > + * for the object's UUID.
> > > > > > + */
> > > > > > +struct dma_buf *virtio_dma_buf_export(
> > > > > > +             const struct virtio_dma_buf_export_info *virtio_exp_info)
> > > > > > +{
> > > > > > +     struct dma_buf_export_info exp_info;
> > > > > > +
> > > > > > +     if (!virtio_exp_info->ops
> > > > > > +             || virtio_exp_info->ops->ops.attach != &virtio_dma_buf_attach
> > > > > > +             || !virtio_exp_info->ops->get_uuid) {
> > > > > > +             return ERR_PTR(-EINVAL);
> > > > > > +     }
> > > > > > +
> > > > > > +     exp_info.exp_name = virtio_exp_info->exp_name;
> > > > > > +     exp_info.owner = virtio_exp_info->owner;
> > > > > > +     exp_info.ops = &virtio_exp_info->ops->ops;
> > > > > > +     exp_info.size = virtio_exp_info->size;
> > > > > > +     exp_info.flags = virtio_exp_info->flags;
> > > > > > +     exp_info.resv = virtio_exp_info->resv;
> > > > > > +     exp_info.priv = virtio_exp_info->priv;
> > > > > > +     BUILD_BUG_ON(sizeof(struct virtio_dma_buf_export_info)
> > > > > > +                  != sizeof(struct dma_buf_export_info));
> > > > >
> > > > > This is the only part that gives me pause. Why do we need this hack?
> > > > > What's wrong with just using dma_buf_export_info directly,
> > > > > and if you want the virtio ops, just using container_off?
> > > >
> > > > This approach provides a more explicit type signature and a little
> > > > more type safety, I think. If others don't think it's a worthwhile
> > > > tradeoff, I can remove it.
> > > >
> > > > -David
> > >
> > > The cost is that if dma_buf_export_info changes even slightly, we get
> > > weird crashes.
> >
> > I'm not sure I understand what types of changes you're referring to.
> > As this is written, virtio-dma-buf is just another client of the
> > dma-buf API. If this were rewritten to use dma-buf directly, then
> > whatever code calls virtio_dma_buf_export would become a client of the
> > dma-buf API. If the semantics of existing fields in the dma-buf API
> > were changed and virtio-dma-buf wasn't updated, then yes, you could
> > get weird crashes from virtio-dma-buf.
> > However, the same problem would
> > exist if virtio_dma_buf_export used dma-buf directly - changes to
> > dma-buf's semantics could cause weird crashes if the caller of
> > virtio_dma_buf_export wasn't updated properly. The only potential
> > source of problems I see is if virtio_dma_buf_export_info wasn't
> > updated properly, but virtio_dma_buf_export_info is dead simple, so I
> > don't know if that's really a problem.
> >
> > -David
>
> I think you can get weird crashes if fields in dma buf are reordered, or
> if a field size changes.  You have a build bug catching overall struct
> size changes but that can remain the same due do compiler padding or
> such.

Since it's manually copying the fields instead of trying something
clever like memcpy, I don't see how reordering the fields or changing
the size of the fields would cause problems. Right now,
virtio_dma_buf_export is just a regular client of dma_buf_export, no
different than any of the other call sites in the kernel.

Overall, I don't really think that this is a problem. If someone makes
breaking changes to the semantics of dma-buf, then they will need to
update this call site, just like they will need to update all of the
other call sites in the kernel. If someone adds new functionality to
dma-buf and adds another field to dma_buf_export_info, the build bug
is a reminder to add it to virtio_dma_buf_export_info. However, if the
struct padding happens to work out such that the build bug doesn't
trigger, that doesn't really matter - it just means that the new
dma-buf feature won't be exposed by virito-dma-buf until someone needs
it and notices that the new field is missing.

-David

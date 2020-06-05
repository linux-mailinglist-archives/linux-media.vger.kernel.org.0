Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552DF1EEF06
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 03:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgFEB2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 21:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgFEB2y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 21:28:54 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F0CC08C5C1
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 18:28:53 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id g28so8225829qkl.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 18:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y/nqmn16Yw0SQZqn88EIVGM4HFQd8IWQBv7BdFGkZBA=;
        b=Djwuxcxs7hMaNuqV5sa0Qt4loVXVD289IkhwAUeoo9toxuTynSobzLXQofFQ/mxxmA
         chX1YXEbRvziHsS2t9CF+sRs3hitooR08WRDXrroJv4P7KQvweF5vSAapRuCRXxcin75
         AMdZf0yCjV6zh6r2M2eGqgwJQzS57I0WUDha8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y/nqmn16Yw0SQZqn88EIVGM4HFQd8IWQBv7BdFGkZBA=;
        b=hejNuGrw7UaO/jsZ+fb9vzKvExLplkdWE6rqfLiNtrS+ErOJ93H25qx6YtZLEjjMV5
         gX2YNC3lOzW3vjjFRwA8Gj5iexVW815Fu/K4t+K/jpuTgyMSVljBQFLE4cpTT6hYfxdd
         n2YMGQnGIl3ciVLqbNBG/cONFJQXmCzY8wL3KNTMOXpq0zal1tLag4yrl8A3pglDRMTI
         loI62+qzzsiCexImf9e0yIUWSUqlCBDEC1KmHWJ9w73D/scnJvgReuVmCpyee/tIjygP
         AwzzG5vTfX6/rTizFx1N+X94QCC+bBeH74Sp2+RWAtbS+HZPLzbfLLujv9Wk8Oyf294E
         8uIA==
X-Gm-Message-State: AOAM531MuGke8zUAC50LKJFYo9TE0rqikRZGe52EysFaCJo2wKg3utGG
        StvMb9OzbR2UB2n/WNGwPjLHkhk1N/41OYVqeoIlLA==
X-Google-Smtp-Source: ABdhPJzI3XPBWQSo123FOo+T+xLNNe5zY7aIfXdAy9YU7XblVgMgV74iVNrnVs1mdh7B4N8NJ72GXVJk+yl0MoIt45U=
X-Received: by 2002:a05:620a:21cc:: with SMTP id h12mr7527247qka.194.1591320533032;
 Thu, 04 Jun 2020 18:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200526105811.30784-1-stevensd@chromium.org> <20200526105811.30784-2-stevensd@chromium.org>
 <20200604145620-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200604145620-mutt-send-email-mst@kernel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Fri, 5 Jun 2020 10:28:42 +0900
Message-ID: <CAD=HUj74mKs5AfcViD3CBva86E0Hvg_pmYChAJe3ny8jtnZ8Tw@mail.gmail.com>
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

On Fri, Jun 5, 2020 at 4:05 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, May 26, 2020 at 07:58:09PM +0900, David Stevens wrote:
> > This change adds a new flavor of dma-bufs that can be used by virtio
> > drivers to share exported objects. A virtio dma-buf can be queried by
> > virtio drivers to obtain the UUID which identifies the underlying
> > exported object.
> >
> > Signed-off-by: David Stevens <stevensd@chromium.org>
>
> Is this just for graphics? If yes I'd rather we put it in the graphics
> driver. We can always move it later ...

As stated in the cover letter, this will be used by virtio-video.

The proposed virtio-video patches: https://markmail.org/thread/p5d3k566srtdtute
The patch which imports these dma-bufs (slightly out of data, uses v3
of this patch set): https://markmail.org/thread/j4xlqaaim266qpks

> > ---
> >  drivers/virtio/Makefile         |  2 +-
> >  drivers/virtio/virtio.c         |  6 +++
> >  drivers/virtio/virtio_dma_buf.c | 89 +++++++++++++++++++++++++++++++++
> >  include/linux/virtio.h          |  1 +
> >  include/linux/virtio_dma_buf.h  | 58 +++++++++++++++++++++
> >  5 files changed, 155 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/virtio/virtio_dma_buf.c
> >  create mode 100644 include/linux/virtio_dma_buf.h
> >
> > diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> > index 29a1386ecc03..ecdae5b596de 100644
> > --- a/drivers/virtio/Makefile
> > +++ b/drivers/virtio/Makefile
> > @@ -1,5 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > -obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
> > +obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
> >  obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
> >  obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
> >  virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > index a977e32a88f2..5d46f0ded92d 100644
> > --- a/drivers/virtio/virtio.c
> > +++ b/drivers/virtio/virtio.c
> > @@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(register_virtio_device);
> >
> > +bool is_virtio_device(struct device *dev)
> > +{
> > +     return dev->bus == &virtio_bus;
> > +}
> > +EXPORT_SYMBOL_GPL(is_virtio_device);
> > +
> >  void unregister_virtio_device(struct virtio_device *dev)
> >  {
> >       int index = dev->index; /* save for after device release */
> > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> > new file mode 100644
> > index 000000000000..23e3399b11ed
> > --- /dev/null
> > +++ b/drivers/virtio/virtio_dma_buf.c
> > @@ -0,0 +1,89 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * dma-bufs for virtio exported objects
> > + *
> > + * Copyright (C) 2020 Google, Inc.
> > + */
> > +
> > +#include <linux/virtio_dma_buf.h>
> > +
> > +/**
> > + * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> > + *
> > + * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
> > + * for an virtio exported object that can be queried by other virtio drivers
> > + * for the object's UUID.
> > + */
> > +struct dma_buf *virtio_dma_buf_export(
> > +             const struct virtio_dma_buf_export_info *virtio_exp_info)
> > +{
> > +     struct dma_buf_export_info exp_info;
> > +
> > +     if (!virtio_exp_info->ops
> > +             || virtio_exp_info->ops->ops.attach != &virtio_dma_buf_attach
> > +             || !virtio_exp_info->ops->get_uuid) {
> > +             return ERR_PTR(-EINVAL);
> > +     }
> > +
> > +     exp_info.exp_name = virtio_exp_info->exp_name;
> > +     exp_info.owner = virtio_exp_info->owner;
> > +     exp_info.ops = &virtio_exp_info->ops->ops;
> > +     exp_info.size = virtio_exp_info->size;
> > +     exp_info.flags = virtio_exp_info->flags;
> > +     exp_info.resv = virtio_exp_info->resv;
> > +     exp_info.priv = virtio_exp_info->priv;
> > +     BUILD_BUG_ON(sizeof(struct virtio_dma_buf_export_info)
> > +                  != sizeof(struct dma_buf_export_info));
>
> This is the only part that gives me pause. Why do we need this hack?
> What's wrong with just using dma_buf_export_info directly,
> and if you want the virtio ops, just using container_off?

This approach provides a more explicit type signature and a little
more type safety, I think. If others don't think it's a worthwhile
tradeoff, I can remove it.

-David

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694A81D19B9
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 17:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730421AbgEMPpM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 11:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgEMPpM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 11:45:12 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5CCC061A0C
        for <linux-media@vger.kernel.org>; Wed, 13 May 2020 08:45:11 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id d191so1521158oib.12
        for <linux-media@vger.kernel.org>; Wed, 13 May 2020 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mei1LatTmGdj+EOMqNvHhmuC380OhE62eU0mPCj4HIU=;
        b=TIT8H80mk+o//K+Djr3m9ymdXjqeJJh7T1O0QGR3OB+cw9gH6v6k/2XsLqv7s+oaGI
         UWDF28wRCnpwGYavm+XRQfy+8o2ez7RJBPSI+LHD5tVHIt5p1Sr7uwpr2rlisGEov6IA
         64dCFZ8mHEj3yDnfE1IkxFdtbSA94SYqY5inY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mei1LatTmGdj+EOMqNvHhmuC380OhE62eU0mPCj4HIU=;
        b=jC/zk7VHR7bfCcaq1uTxkOsITQfwZduLFBo2J197MtQCKHnaMiSblfKFbl3Erj5cih
         8Z1P3hbVe5V0oTy2u8jEKgArrPFZIJSL7feOqtZTCkqnPNGRCohEj5X+i8DissWbsh29
         ewA0L9PYLCZRCjdtyX+mo69iro8VRV1oXyQvRldrvC30L6iUEaKKSIHjI3ibUbLXahqv
         qes3895nrY41oI7Fu+NY1Fm5YsCNa8Q2irFS+0NX3uZjMq5kgtmYU4aRn2PywDsr89qA
         uM81ci4TAwNzZnWHmtC30emK3ZdyXimFJZ6FyOWuCkIo95YiRc9wQ7ETenksINa+/5MS
         Bt6w==
X-Gm-Message-State: AGi0Pub3DX/z1l1XY4ireHH5KaAeBfa4g1di21ELgnmvTa04Lw2EnoaY
        tRHLyjMXh4xmp/TpBDDAnsY8U5EKGHffHOizYomZUw==
X-Google-Smtp-Source: APiQypI5v/GPcuUPKMBM3NTNqytmPwdux2KcE1khhFrjveIV/zK1dS2UemFwYRgCFispMAUfUJhE2vXjRmumZEBkQZg=
X-Received: by 2002:aca:3b41:: with SMTP id i62mr9169611oia.101.1589384711122;
 Wed, 13 May 2020 08:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org> <20200311112004.47138-2-stevensd@chromium.org>
In-Reply-To: <20200311112004.47138-2-stevensd@chromium.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 13 May 2020 17:45:00 +0200
Message-ID: <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
To:     David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO CORE, NET..." 
        <virtualization@lists.linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, virtio-dev@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 11, 2020 at 12:20 PM David Stevens <stevensd@chromium.org> wrote:
>
> This change adds a new dma-buf operation that allows dma-bufs to be used
> by virtio drivers to share exported objects. The new operation allows
> the importing driver to query the exporting driver for the UUID which
> identifies the underlying exported object.
>
> Signed-off-by: David Stevens <stevensd@chromium.org>

Adding Tomasz Figa, I've discussed this with him at elce last year I
think. Just to make sure.

Bunch of things:
- obviously we need the users of this in a few drivers, can't really
review anything stand-alone
- adding very specific ops to the generic interface is rather awkward,
eventually everyone wants that and we end up in a mess. I think the
best solution here would be if we create a struct virtio_dma_buf which
subclasses dma-buf, add a (hopefully safe) runtime upcasting
functions, and then a virtio_dma_buf_get_uuid() function. Just storing
the uuid should be doable (assuming this doesn't change during the
lifetime of the buffer), so no need for a callback.
- for the runtime upcasting the usual approach is to check the ->ops
pointer. Which means that would need to be the same for all virtio
dma_bufs, which might get a bit awkward. But I'd really prefer we not
add allocator specific stuff like this to dma-buf.
-Daniel

> ---
>  drivers/dma-buf/dma-buf.c | 12 ++++++++++++
>  include/linux/dma-buf.h   | 18 ++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d4097856c86b..fa5210ba6aaa 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1158,6 +1158,18 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_vunmap);
>
> +int dma_buf_get_uuid(struct dma_buf *dmabuf, uuid_t *uuid)
> +{
> +       if (WARN_ON(!dmabuf) || !uuid)
> +               return -EINVAL;
> +
> +       if (!dmabuf->ops->get_uuid)
> +               return -ENODEV;
> +
> +       return dmabuf->ops->get_uuid(dmabuf, uuid);
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_get_uuid);
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  {
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index abf5459a5b9d..00758523597d 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -251,6 +251,21 @@ struct dma_buf_ops {
>
>         void *(*vmap)(struct dma_buf *);
>         void (*vunmap)(struct dma_buf *, void *vaddr);
> +
> +       /**
> +        * @get_uuid
> +        *
> +        * This is called by dma_buf_get_uuid to get the UUID which identifies
> +        * the buffer to virtio devices.
> +        *
> +        * This callback is optional.
> +        *
> +        * Returns:
> +        *
> +        * 0 on success or a negative error code on failure. On success uuid
> +        * will be populated with the buffer's UUID.
> +        */
> +       int (*get_uuid)(struct dma_buf *dmabuf, uuid_t *uuid);
>  };
>
>  /**
> @@ -444,4 +459,7 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
>                  unsigned long);
>  void *dma_buf_vmap(struct dma_buf *);
>  void dma_buf_vunmap(struct dma_buf *, void *vaddr);
> +
> +int dma_buf_get_uuid(struct dma_buf *dmabuf, uuid_t *uuid);
> +
>  #endif /* __DMA_BUF_H__ */
> --
> 2.25.1.481.gfbce0eb801-goog
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

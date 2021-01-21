Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC562FEC26
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 14:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbhAUNkF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 08:40:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728425AbhAUNiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 08:38:00 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69576C0613C1
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 05:37:20 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id f11so2482902ljm.8
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 05:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LEqV0YucJGoO/qBUnA782Gstn0eiwdK9KK0CxAlgdFQ=;
        b=mIzR3TwpRPZooXGXgWEuR9yR78ZPR30DNBbIDReYCADSMlmmjuZuogNLufjqNeEFmH
         io35mw8ym0R9pRMxY2MW9keSCMXyrglcOAQ+O2nsUTxojaiGc2Q6xkYMkwXTKQk2lz5j
         xG3n7HIaExSXumKW64SYDrRhrHtoAwsrebmVIEZIFQYqMTnTeXQNVb1rMrOXaJR1JmUd
         QvS4P3o1zYpF8zCOGpF6hL7VTo5KthcTjQs+h+VQxWTV+V4RXv/d3NwnD52MxnHA2d59
         0Wkp5u5d+DxsSy61ytCIITtSf1XyiQzoYZOmSKcG0rbwuV+G5ty9mqkAC2UpW5GHgR8T
         SBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LEqV0YucJGoO/qBUnA782Gstn0eiwdK9KK0CxAlgdFQ=;
        b=cu27JuwT/qnXx99kf7oBlov50wCuujKB7BjqdLFdsjRb6Qd2N7YJ++quGhMSgpiRJX
         oIy2e08lLWMgdO4QphcpE/PTdBBj7zfrI+Jy9VUXRBU8kZf+af7ovRmYzSG4qv75EGnV
         JOkJSfglJ/MIFGcSx5q+EFNl9nxbOdhPnSpyyLUluvfhG/+n4xO669kKagliuPNXYfJF
         sHdIOtEVnkLS1Ompa2fDfmQnaTidBCJtQvJXjaqZxD+rlFCtaQ805lSf6jQz++rxmbI7
         FvdNoFuxHOD9QGYcGdpSH/i4/BwZyxNueYkms1aoru4f2mZRVVh7EvYXrB7ceaGrGRBx
         ZNXA==
X-Gm-Message-State: AOAM533Wnp5zt7VyBngNIZga4jOVEoom2s+A1li3a5qXMAmekvwhyE8P
        MV0VTD1goSfr9zasP+0mPdFrKVSvL0cHzc6EF8xTkQ==
X-Google-Smtp-Source: ABdhPJxKZVbqnH9MKFQr85KsvcDFd9G/BZ8oEWUq3NI2FnjiApGPAJEEtYP3Dslc+F02CFXuVn/j8TGnSZ0AmQNIV44=
X-Received: by 2002:a2e:9dc1:: with SMTP id x1mr6636681ljj.32.1611236238882;
 Thu, 21 Jan 2021 05:37:18 -0800 (PST)
MIME-Version: 1.0
References: <20210119204508.9256-1-john.stultz@linaro.org> <20210119204508.9256-3-john.stultz@linaro.org>
In-Reply-To: <20210119204508.9256-3-john.stultz@linaro.org>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 21 Jan 2021 19:07:06 +0530
Message-ID: <CAO_48GGQ5AbHBWK6Bo75vihscmMTSdsVTYqWD2SjF_B5RdYWvg@mail.gmail.com>
Subject: Re: [RESEND][PATCH 3/3] dma-buf: heaps: Rework heep allocation hooks
 to return struct dma_buf instead of fd
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,

On Wed, 20 Jan 2021 at 02:15, John Stultz <john.stultz@linaro.org> wrote:
>
> Every heap needs to create a dmabuf and then export it to a fd
> via dma_buf_fd(), so to consolidate things a bit, have the heaps
> just return a struct dmabuf * and let the top level
> dma_heap_buffer_alloc() call handle creating the fd via
> dma_buf_fd().

Thanks for the patch! LGTM, feels a lot neater now. I'll merge into
drm-misc-next.
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: =C3=98rjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/dma-buf/dma-heap.c          | 14 +++++++++++++-
>  drivers/dma-buf/heaps/cma_heap.c    | 22 +++++++---------------
>  drivers/dma-buf/heaps/system_heap.c | 21 +++++++--------------
>  include/linux/dma-heap.h            | 12 ++++++------
>  4 files changed, 33 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index afd22c9dbdcf..6b5db954569f 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -52,6 +52,9 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap,=
 size_t len,
>                                  unsigned int fd_flags,
>                                  unsigned int heap_flags)
>  {
> +       struct dma_buf *dmabuf;
> +       int fd;
> +
>         /*
>          * Allocations from all heaps have to begin
>          * and end on page boundaries.
> @@ -60,7 +63,16 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap=
, size_t len,
>         if (!len)
>                 return -EINVAL;
>
> -       return heap->ops->allocate(heap, len, fd_flags, heap_flags);
> +       dmabuf =3D heap->ops->allocate(heap, len, fd_flags, heap_flags);
> +       if (IS_ERR(dmabuf))
> +               return PTR_ERR(dmabuf);
> +
> +       fd =3D dma_buf_fd(dmabuf, fd_flags);
> +       if (fd < 0) {
> +               dma_buf_put(dmabuf);
> +               /* just return, as put will call release and that will fr=
ee */
> +       }
> +       return fd;
>  }
>
>  static int dma_heap_open(struct inode *inode, struct file *file)
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 0c76cbc3fb11..985c41ffd85b 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -272,10 +272,10 @@ static const struct dma_buf_ops cma_heap_buf_ops =
=3D {
>         .release =3D cma_heap_dma_buf_release,
>  };
>
> -static int cma_heap_allocate(struct dma_heap *heap,
> -                                 unsigned long len,
> -                                 unsigned long fd_flags,
> -                                 unsigned long heap_flags)
> +static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> +                                        unsigned long len,
> +                                        unsigned long fd_flags,
> +                                        unsigned long heap_flags)
>  {
>         struct cma_heap *cma_heap =3D dma_heap_get_drvdata(heap);
>         struct cma_heap_buffer *buffer;
> @@ -290,7 +290,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
>
>         buffer =3D kzalloc(sizeof(*buffer), GFP_KERNEL);
>         if (!buffer)
> -               return -ENOMEM;
> +               return ERR_PTR(-ENOMEM);
>
>         INIT_LIST_HEAD(&buffer->attachments);
>         mutex_init(&buffer->lock);
> @@ -349,15 +349,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
>                 ret =3D PTR_ERR(dmabuf);
>                 goto free_pages;
>         }
> -
> -       ret =3D dma_buf_fd(dmabuf, fd_flags);
> -       if (ret < 0) {
> -               dma_buf_put(dmabuf);
> -               /* just return, as put will call release and that will fr=
ee */
> -               return ret;
> -       }
> -
> -       return ret;
> +       return dmabuf;
>
>  free_pages:
>         kfree(buffer->pages);
> @@ -366,7 +358,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
>  free_buffer:
>         kfree(buffer);
>
> -       return ret;
> +       return ERR_PTR(ret);
>  }
>
>  static const struct dma_heap_ops cma_heap_ops =3D {
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index 2321c91891f6..7b154424aeb3 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -332,10 +332,10 @@ static struct page *alloc_largest_available(unsigne=
d long size,
>         return NULL;
>  }
>
> -static int system_heap_allocate(struct dma_heap *heap,
> -                               unsigned long len,
> -                               unsigned long fd_flags,
> -                               unsigned long heap_flags)
> +static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
> +                                           unsigned long len,
> +                                           unsigned long fd_flags,
> +                                           unsigned long heap_flags)
>  {
>         struct system_heap_buffer *buffer;
>         DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> @@ -350,7 +350,7 @@ static int system_heap_allocate(struct dma_heap *heap=
,
>
>         buffer =3D kzalloc(sizeof(*buffer), GFP_KERNEL);
>         if (!buffer)
> -               return -ENOMEM;
> +               return ERR_PTR(-ENOMEM);
>
>         INIT_LIST_HEAD(&buffer->attachments);
>         mutex_init(&buffer->lock);
> @@ -400,14 +400,7 @@ static int system_heap_allocate(struct dma_heap *hea=
p,
>                 ret =3D PTR_ERR(dmabuf);
>                 goto free_pages;
>         }
> -
> -       ret =3D dma_buf_fd(dmabuf, fd_flags);
> -       if (ret < 0) {
> -               dma_buf_put(dmabuf);
> -               /* just return, as put will call release and that will fr=
ee */
> -               return ret;
> -       }
> -       return ret;
> +       return dmabuf;
>
>  free_pages:
>         for_each_sgtable_sg(table, sg, i) {
> @@ -421,7 +414,7 @@ static int system_heap_allocate(struct dma_heap *heap=
,
>                 __free_pages(page, compound_order(page));
>         kfree(buffer);
>
> -       return ret;
> +       return ERR_PTR(ret);
>  }
>
>  static const struct dma_heap_ops system_heap_ops =3D {
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 454e354d1ffb..5bc5c946af58 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -16,15 +16,15 @@ struct dma_heap;
>
>  /**
>   * struct dma_heap_ops - ops to operate on a given heap
> - * @allocate:          allocate dmabuf and return fd
> + * @allocate:          allocate dmabuf and return struct dma_buf ptr
>   *
> - * allocate returns dmabuf fd  on success, -errno on error.
> + * allocate returns dmabuf on success, ERR_PTR(-errno) on error.
>   */
>  struct dma_heap_ops {
> -       int (*allocate)(struct dma_heap *heap,
> -                       unsigned long len,
> -                       unsigned long fd_flags,
> -                       unsigned long heap_flags);
> +       struct dma_buf *(*allocate)(struct dma_heap *heap,
> +                                   unsigned long len,
> +                                   unsigned long fd_flags,
> +                                   unsigned long heap_flags);
>  };
>
>  /**
> --
> 2.17.1
>

Best,
Sumit.

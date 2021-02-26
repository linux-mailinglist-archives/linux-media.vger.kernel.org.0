Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21021325E60
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 08:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhBZHiL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 02:38:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhBZHhr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 02:37:47 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED72C061574
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 23:37:07 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id b8so8279833oti.7
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 23:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VQgZEeHJdf6Bfk1LIoWC2HIkTuWyVFZe6jHDYc9nISE=;
        b=MTOO3T/7o4+Kk3jwJNeTNrbRnWQRL6blOAlspjkX9zFyM6aHksKTw5L9lX8ZhG//Ke
         MRbs9dmfhRppCWYeENEHFnKToI3YNcFN0GTIaqMRgzaxHF+ARvRFMEEGLbEG7gIWgJyn
         82/AghDRLileNUQNudm9qZHISDiEwDDqdF4Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VQgZEeHJdf6Bfk1LIoWC2HIkTuWyVFZe6jHDYc9nISE=;
        b=D4RTxTmyQOUK+STD98sqFeIjsMp5g+L6DdU2g7ie1A3qyvmdDZ7HsUO6qhWJfduK8Q
         nNtAg6Sh3jOZyaNUdGzOninouguLri06DqTTyxSmR5DlAzrOP4rZjxKybo/V68CK8IIE
         K//euAzK226DaEPXVSzx2gYqrKHpd2wm6mFNQ8jts+5QzJYYowE6+rDJAkG2x1VaAw3K
         DiqZX/KIOKcbhvvwXww9NAdJA9Iv4wbe2xMXq0Ru9LbOYnBR85JVe1qWAQ5KhNCT7fYU
         2w5vpss55D5vtziZxBeoeyeJSxGUtf7Fo0dNNB+Hncm47qUIYtCkm1thV2QEw5rMKx1J
         dY6w==
X-Gm-Message-State: AOAM5337cPf23K/hjeVwTWBOcvbvYZwaGfpV8193sxrgW2VmQw3sD8hv
        sQrcp4H+1UTToLndnP7YcQzEHjYLs1Bj5BbUnyGNhw==
X-Google-Smtp-Source: ABdhPJzr069PMRWNCVN2fwP3STHObwlwny7T1Jhy/pGm0WViCqvjVbehuOse2fxwPjKBXt2Y8wHFc/jl2bd+sCABeoI=
X-Received: by 2002:a9d:46e:: with SMTP id 101mr1053650otc.303.1614325026472;
 Thu, 25 Feb 2021 23:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20210226040908.3274666-1-john.stultz@linaro.org>
In-Reply-To: <20210226040908.3274666-1-john.stultz@linaro.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 26 Feb 2021 08:36:55 +0100
Message-ID: <CAKMK7uHGutJiZ879NAweTHka=gZQBw9zWQSDJn6bTLS6bJwvvg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set VM_PFNMAP in mmap for system and cma heaps
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Christian Koenig <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 26, 2021 at 5:09 AM John Stultz <john.stultz@linaro.org> wrote:
>
> Per discussion and patches here:
>   https://lore.kernel.org/dri-devel/20210223105951.912577-1-daniel.vetter=
@ffwll.ch/
>
> Daniel is planning on making VM_PFNMAP required on dmabufs.
>
> Thus to avoid the warn_on noise, set the VM_PFNMAP in the
> system and cma heap's mmap handler.
>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: =C3=98rjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>

System heap uses remap_pfn_range so looks fine, but cma heap inserts
pages, and that's not fine for VM_PFNMAP. You need to use
vm_insert_pfn or remap_pfn_range or one of the related pfn mapping
functions for that too. I think this should splat when you run it.

Also note that remap_pfn_range updates the vma flags already correctly
for you, so you probably don't want to do that.

Also given that both deal with struct page there's a ton of divergence
between these two that doesn't make much sense. Maybe could even share
the code fully, aside from how you allocate the struct pages.
-Daniel

> ---
>  drivers/dma-buf/heaps/cma_heap.c    | 1 +
>  drivers/dma-buf/heaps/system_heap.c | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 364fc2f3e499..34bc3987f942 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -185,6 +185,7 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, stru=
ct vm_area_struct *vma)
>
>         vma->vm_ops =3D &dma_heap_vm_ops;
>         vma->vm_private_data =3D buffer;
> +       vma->vm_flags |=3D VM_PFNMAP;
>
>         return 0;
>  }
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index 3548b20cb98c..8995e3cbfcaf 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -228,8 +228,10 @@ static int system_heap_mmap(struct dma_buf *dmabuf, =
struct vm_area_struct *vma)
>                         return ret;
>                 addr +=3D PAGE_SIZE;
>                 if (addr >=3D vma->vm_end)
> -                       return 0;
> +                       break;
>         }
> +
> +       vma->vm_flags |=3D VM_PFNMAP;
>         return 0;
>  }
>
> --
> 2.25.1
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

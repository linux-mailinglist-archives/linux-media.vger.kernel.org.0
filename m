Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 424772FFDB3
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 08:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbhAVH51 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 02:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbhAVH5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 02:57:25 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05973C0613D6
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 23:56:41 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id u25so6308896lfc.2
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 23:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f2zRDUhBwnVP7tCaaBYDyBHO3WlC21+sK4f4qAGJOCI=;
        b=ooLdJkATi6/2fEB5idp2CRg5f3UiIOidhHf3ayOHeKjzppxkT0HkFh1Qpt0+cx2scW
         9TRsscg8UxCHBswLJk3rlH+y2AU+wqUJbRDxCcs2PU6F/Fl9Q1XghsLC0Im+Yb4S2H5I
         n1s6qqC3k+2t6r/GL0itPdpmTPBXjXfxS1UWz908azcwM1jJHQFBYOqmnhqBUGBw0HD9
         J0CSEqdsJAOvna2Q56Y9w9g91cBA18gOe/aXbr/RVSEVgzlWiM5lvWlFY2alEyykArkq
         JcBiUItzm89cgvg5yLmWhiUajU/rFsvwNxy7Iv1d5gT5s08tweA4y6yqT9ErV1YVjCaw
         x6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f2zRDUhBwnVP7tCaaBYDyBHO3WlC21+sK4f4qAGJOCI=;
        b=TdYeKA8rdGrbFxBkp0GUgFoAh5iX24Sg88KT7MTYpz61q118LcE9JTJxAUh+wYZ5vi
         p8cMbqV66z4RRFOVMJhJ/ZJJBRRbZ956QlmbuxKSh3LaRdmmkY6UfQiohxe+6Vr7RV1q
         4kmsuYShqXjims7kM3FyItY6M2LS4kipsbmW73p903k49rhBXK6J5cvRas+JzoFQM83F
         6d3+v0/4t09A4+6YeN59ZIHpdKsDsfLk3YP+NVUDda7Jb/4gt2v5g8axtXDJsWb9/dzB
         xc9b0Se40W0jeZk4wPPJlD6nJX4pc9YBot3bq3wUIbh6lgJtN5hZ3O6Z9acEBWlMhhNU
         n7yg==
X-Gm-Message-State: AOAM530+iXwCex5q0irasgXTNjb6ZNcSmovoItwTtw+D/bHKOi0EacQE
        HDGwuGbpx3CuY9WN7kwC/zQT4Y5oHo4OHksGJQjwmA==
X-Google-Smtp-Source: ABdhPJzDdNdouQ4GUOqShkAT1c4FUePpXmAYA00uB0PATJCkEJiA7J+aoxHR1CgglxjxPNR15g3wHTQl2OKZ+YzEjxU=
X-Received: by 2002:a19:7616:: with SMTP id c22mr25218lff.550.1611302200416;
 Thu, 21 Jan 2021 23:56:40 -0800 (PST)
MIME-Version: 1.0
References: <20210119204508.9256-1-john.stultz@linaro.org> <20210119204508.9256-2-john.stultz@linaro.org>
In-Reply-To: <20210119204508.9256-2-john.stultz@linaro.org>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Fri, 22 Jan 2021 13:26:29 +0530
Message-ID: <CAO_48GEYGzY8cZybwrXgfODhuoAJqi4AvwbZbWd+PiYjMqKYpw@mail.gmail.com>
Subject: Re: [RESEND][PATCH 2/3] dma-buf: heaps: Add a WARN_ON should the
 vmap_cnt go negative
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

Hi John, Suren,


On Wed, 20 Jan 2021 at 02:15, John Stultz <john.stultz@linaro.org> wrote:
>
> We shouldn't vunmap more then we vmap, but if we do, make
> sure we complain loudly.

I was checking the general usage of vunmap in the kernel, and I
couldn't find many instances where we need to WARN_ON for the vunmap
count more than vmap count. Is there a specific need for this in the heaps?

Best,
Sumit.
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
> Suggested-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/dma-buf/heaps/cma_heap.c    | 1 +
>  drivers/dma-buf/heaps/system_heap.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 364fc2f3e499..0c76cbc3fb11 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -232,6 +232,7 @@ static void cma_heap_vunmap(struct dma_buf *dmabuf, s=
truct dma_buf_map *map)
>         struct cma_heap_buffer *buffer =3D dmabuf->priv;
>
>         mutex_lock(&buffer->lock);
> +       WARN_ON(buffer->vmap_cnt =3D=3D 0);
>         if (!--buffer->vmap_cnt) {
>                 vunmap(buffer->vaddr);
>                 buffer->vaddr =3D NULL;
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index 405351aad2a8..2321c91891f6 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -273,6 +273,7 @@ static void system_heap_vunmap(struct dma_buf *dmabuf=
, struct dma_buf_map *map)
>         struct system_heap_buffer *buffer =3D dmabuf->priv;
>
>         mutex_lock(&buffer->lock);
> +       WARN_ON(buffer->vmap_cnt =3D=3D 0);
>         if (!--buffer->vmap_cnt) {
>                 vunmap(buffer->vaddr);
>                 buffer->vaddr =3D NULL;
> --
> 2.17.1
>

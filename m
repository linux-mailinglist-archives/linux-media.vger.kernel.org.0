Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 453D0738CF5
	for <lists+linux-media@lfdr.de>; Wed, 21 Jun 2023 19:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbjFURVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jun 2023 13:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjFURVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jun 2023 13:21:20 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D6019A3
        for <linux-media@vger.kernel.org>; Wed, 21 Jun 2023 10:21:18 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-bd6446528dcso5933868276.2
        for <linux-media@vger.kernel.org>; Wed, 21 Jun 2023 10:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687368078; x=1689960078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSAk//p3tdpjYImZmcR5EhVEtjoOajC1V7uGVNMF2Bg=;
        b=q/QuiXaZ88rtUbd3QeAHuuJ5YdEG8Dj33lwUpfxAKx2j6K8dza966+C6Vx9qTjeHAC
         dvjLDPex73PhJtmsc00qVmNWc81PBSoK5/DqmDEkoQRwZg7wdCgDYwv6KNw7NQHQg0ss
         QCxMpM2hyzH5EJ0IKPpWTrAOr75BDqkN90Q3p4Z+NGub6vJjdVMSx+/dWrdARkm/qa+K
         j6nLL7mAq/4hVfWhFluDu/adCBBVVG4zebIR3JHTZ/osWCH9Wbr92Ycmird8V3zgA09l
         iM+oXXoIN7YX8PqJDsa+yxmqavyepFXWWbCVfvkQEus4wkvqcgdDn/f+isiJhlvZC9Fa
         qF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687368078; x=1689960078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fSAk//p3tdpjYImZmcR5EhVEtjoOajC1V7uGVNMF2Bg=;
        b=RgVMQ+NoHJsBjGzIaztxaW9cImQbxIh4xXRzP0qQhXTGJeW5v/4LkIioGDCGceLszw
         wsSDL/fgPY9RmeIHTzIGD1el5YOR+PLYu63YyECWDtvhJ0/MYuSKI81dvuwd/CHYWitY
         LdhEhvFM1WixxxK0eV/pZc7NY3HlxOh91Wg96YHc6SIXaqklDzTDsVKYDiLVOo5ouohq
         gF9WXL+QlR6u29q+Yk5AgKAoJL3YuxACx17vBWGQoIJhxdYLZtJrqK9ZtwpPKDEtOE6y
         lCRkmGm/jotknuXhS7qn8n5/PTQY3ScC9FvtKA9syEWOa9atyMdXBZ7hCspmVTcba3kq
         NcoQ==
X-Gm-Message-State: AC+VfDzLYI4msRAT0U41rjKpUNktInvrjr9t1y1Ww278IT5Em7ZzL/SA
        SsAtUcfg751pveaglNY4NiUQ4jv3phnBXvlxbYltBw==
X-Google-Smtp-Source: ACHHUZ6QsXC3OAIyOliYBKtqphS99pcdIqKPy8YCP9uA7AvPGJKpRGqoCdEsBhlAqNN17J1t3eSvc6iLsH8DsBI66fE=
X-Received: by 2002:a25:d3c6:0:b0:bcb:f3cc:e965 with SMTP id
 e189-20020a25d3c6000000b00bcbf3cce965mr12582408ybf.11.1687368078014; Wed, 21
 Jun 2023 10:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230529223935.2672495-1-dmitry.osipenko@collabora.com> <20230529223935.2672495-3-dmitry.osipenko@collabora.com>
In-Reply-To: <20230529223935.2672495-3-dmitry.osipenko@collabora.com>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Wed, 21 Jun 2023 10:21:07 -0700
Message-ID: <CABdmKX2RU2iYyUssBpwS17zA1dfegjzdo4pxp0r8cOCWcY9=kg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] dma-buf/heaps: Don't assert held reservation lock
 for dma-buf mmapping
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        kernel@collabora.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 29, 2023 at 3:46=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Don't assert held dma-buf reservation lock on memory mapping of exported
> buffer.
>
> We're going to change dma-buf mmap() locking policy such that exporters
> will have to handle the lock. The previous locking policy caused deadlock
> problem for DRM drivers in a case of self-imported dma-bufs once these
> drivers are moved to use reservation lock universally. The problem
> solved by moving the lock down to exporters. This patch prepares dma-buf
> heaps for the locking policy update.
>
Hi Dmitry,

I see that in patch 6 of this series calls to
dma_resv_lock/dma_resv_unlock have been added to the
drm_gem_shmem_helper functions and some exporters. But I'm curious why
no dma_resv_lock/dma_resv_unlock calls were added to these two dma-buf
heap exporters for mmap?

Thanks,
T.J.

> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/dma-buf/heaps/cma_heap.c    | 3 ---
>  drivers/dma-buf/heaps/system_heap.c | 3 ---
>  2 files changed, 6 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 1131fb943992..28fb04eccdd0 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -13,7 +13,6 @@
>  #include <linux/dma-buf.h>
>  #include <linux/dma-heap.h>
>  #include <linux/dma-map-ops.h>
> -#include <linux/dma-resv.h>
>  #include <linux/err.h>
>  #include <linux/highmem.h>
>  #include <linux/io.h>
> @@ -183,8 +182,6 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, stru=
ct vm_area_struct *vma)
>  {
>         struct cma_heap_buffer *buffer =3D dmabuf->priv;
>
> -       dma_resv_assert_held(dmabuf->resv);
> -
>         if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) =3D=3D 0)
>                 return -EINVAL;
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index e8bd10e60998..fcf836ba9c1f 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -13,7 +13,6 @@
>  #include <linux/dma-buf.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dma-heap.h>
> -#include <linux/dma-resv.h>
>  #include <linux/err.h>
>  #include <linux/highmem.h>
>  #include <linux/mm.h>
> @@ -202,8 +201,6 @@ static int system_heap_mmap(struct dma_buf *dmabuf, s=
truct vm_area_struct *vma)
>         struct sg_page_iter piter;
>         int ret;
>
> -       dma_resv_assert_held(dmabuf->resv);
> -
>         for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
>                 struct page *page =3D sg_page_iter_page(&piter);
>
> --
> 2.40.1
>

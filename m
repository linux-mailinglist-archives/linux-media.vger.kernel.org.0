Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA3422E0DE5
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 18:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgLVRmH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 12:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727094AbgLVRmG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 12:42:06 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D949C0613D3
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 09:41:26 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id q75so2926041wme.2
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 09:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2tShhQx8mQBytbH6oSP/Lexw9bjVrbZJJZuL/Xlj3Jk=;
        b=eoSMQdQoB6clWf0OIFF/G3eNNMD4UbmfsMSVcKbfZlIYXWsks4j8qWhnSKpMSE+aiU
         XDxkPY0by/jTR1TNhMOWS2qpoxK5++qjXsuKoUt0HVgyZX4TPc5DuPh0lIdkfWj/DpNa
         tWqGCePnf/qSXC2XvN9bPCPTLN15/eEq2NSqoNW+Oj8dkgkmgpHZ9bBFfhPZl0K6A49V
         wpYmFRvfgXuuulHr9Sa5hy1wel3nOTPVPDBBv/vADj89B37oDYj0tnL917BGNwHXDMOv
         fz9iwW9h9lnBTFslVjFtPGvghcivF2aLvdjXJEtdQyzvSBj/0PtacD4JJ8wsGf6BRxIP
         es4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2tShhQx8mQBytbH6oSP/Lexw9bjVrbZJJZuL/Xlj3Jk=;
        b=ZoDYGMFNMHRsVvy9UuxbEplraE5I+J9WId7k9cADdT9vxRskXOK5t0qR2Fjhmk33Gz
         ijvRWMOWNYRjysTYXJV8Tz9M1pBDNs1X70m0nWHSxGAFPyKGttQ0VKPdEC+iMnkIXo4e
         7vAxEi5g3hkeau0KVAJPpu13vIy77ZUjv3D5HrXe4aNsQ7eKimKwqJTnSqc3kAjddhan
         7UORwkwuH9/FwPBoMpnqtkU8QJTnXo5QK+UTC975zoV4yG4yRLUvnT/Oc/GVWt90hV7+
         /4w9PMJHy2YlPvzqWd8rkmPj2YIxXcil8d1YjHWAO4UHRNxbLfifNmXncJo8Nlw+E2+Z
         qcCw==
X-Gm-Message-State: AOAM530Yp7idMT2Aa/C10MylC4PX8cMQH/cheeGikvTZeLqOHOm45xTW
        FXpjVLRDYo8t6FVPbrvSjQvth41FOhdO+I2eh9BuMQ==
X-Google-Smtp-Source: ABdhPJxbM8Ww9Ypgamgu2x/v856Cynt1Ll2r1L4SxUKgct06akwCCGv5+MhMuKhKwWbBtSDr6Ilh7EdRVTrBBM62Cco=
X-Received: by 2002:a1c:bc57:: with SMTP id m84mr22861339wmf.163.1608658884672;
 Tue, 22 Dec 2020 09:41:24 -0800 (PST)
MIME-Version: 1.0
References: <20201217230612.32397-1-john.stultz@linaro.org>
In-Reply-To: <20201217230612.32397-1-john.stultz@linaro.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 22 Dec 2020 09:41:13 -0800
Message-ID: <CAJuCfpGHGnMtfOr8S2zrCX+fBZErc+BWTsNHUi9-y1B-GN9bkQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/3] dma-buf: heaps: Add deferred-free-helper library code
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,
Just a couple nits, otherwise looks sane to me.

On Thu, Dec 17, 2020 at 3:06 PM John Stultz <john.stultz@linaro.org> wrote:
>
> This patch provides infrastructure for deferring buffer frees.
>
> This is a feature ION provided which when used with some form
> of a page pool, provides a nice performance boost in an
> allocation microbenchmark. The reason it helps is it allows the
> page-zeroing to be done out of the normal allocation/free path,
> and pushed off to a kthread.

I suggest adding some more description for this API and how it can be
used. IIUC there are 2 uses: lazy deferred freeing using kthread, and
object pooling. no_pool parameter I think deserves some explanation
(disallows pooling when system is under memory pressure).

>
> As not all heaps will find this useful, its implemented as
> a optional helper library that heaps can utilize.
>
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
> ---
>  drivers/dma-buf/heaps/Kconfig                |   3 +
>  drivers/dma-buf/heaps/Makefile               |   1 +
>  drivers/dma-buf/heaps/deferred-free-helper.c | 136 +++++++++++++++++++
>  drivers/dma-buf/heaps/deferred-free-helper.h |  15 ++
>  4 files changed, 155 insertions(+)
>  create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.c
>  create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.h
>
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfi=
g
> index a5eef06c4226..ecf65204f714 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -1,3 +1,6 @@
> +config DMABUF_HEAPS_DEFERRED_FREE
> +       bool
> +
>  config DMABUF_HEAPS_SYSTEM
>         bool "DMA-BUF System Heap"
>         depends on DMABUF_HEAPS
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makef=
ile
> index 974467791032..4e7839875615 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_DMABUF_HEAPS_DEFERRED_FREE) +=3D deferred-free-helper.o
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> diff --git a/drivers/dma-buf/heaps/deferred-free-helper.c b/drivers/dma-b=
uf/heaps/deferred-free-helper.c
> new file mode 100644
> index 000000000000..b8f54860454f
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/deferred-free-helper.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Deferred dmabuf freeing helper
> + *
> + * Copyright (C) 2020 Linaro, Ltd.
> + *
> + * Based on the ION page pool code
> + * Copyright (C) 2011 Google, Inc.
> + */
> +
> +#include <linux/freezer.h>
> +#include <linux/list.h>
> +#include <linux/slab.h>
> +#include <linux/swap.h>
> +#include <linux/sched/signal.h>
> +
> +#include "deferred-free-helper.h"
> +
> +static LIST_HEAD(free_list);
> +static size_t list_size;
> +wait_queue_head_t freelist_waitqueue;
> +struct task_struct *freelist_task;
> +static DEFINE_MUTEX(free_list_lock);
> +
> +enum {
> +       USE_POOL =3D 0,
> +       SKIP_POOL =3D 1,
> +};

This enum is used for a bool parameter. Either make it part of the
public API or eliminate and use bool instead.

> +
> +void deferred_free(struct deferred_freelist_item *item,
> +                  void (*free)(struct deferred_freelist_item*, bool),
> +                  size_t size)
> +{
> +       INIT_LIST_HEAD(&item->list);
> +       item->size =3D size;
> +       item->free =3D free;
> +
> +       mutex_lock(&free_list_lock);
> +       list_add(&item->list, &free_list);
> +       list_size +=3D size;
> +       mutex_unlock(&free_list_lock);
> +       wake_up(&freelist_waitqueue);
> +}
> +
> +static size_t free_one_item(bool nopool)
> +{
> +       size_t size =3D 0;
> +       struct deferred_freelist_item *item;
> +
> +       mutex_lock(&free_list_lock);
> +       if (list_empty(&free_list)) {
> +               mutex_unlock(&free_list_lock);
> +               return 0;
> +       }
> +       item =3D list_first_entry(&free_list, struct deferred_freelist_it=
em, list);
> +       list_del(&item->list);
> +       size =3D item->size;
> +       list_size -=3D size;
> +       mutex_unlock(&free_list_lock);
> +
> +       item->free(item, nopool);
> +       return size;
> +}
> +
> +static unsigned long get_freelist_size(void)
> +{
> +       unsigned long size;
> +
> +       mutex_lock(&free_list_lock);
> +       size =3D list_size;
> +       mutex_unlock(&free_list_lock);
> +       return size;
> +}
> +
> +static unsigned long freelist_shrink_count(struct shrinker *shrinker,
> +                                          struct shrink_control *sc)
> +{
> +       return get_freelist_size();
> +}
> +
> +static unsigned long freelist_shrink_scan(struct shrinker *shrinker,
> +                                         struct shrink_control *sc)
> +{
> +       int total_freed =3D 0;
> +
> +       if (sc->nr_to_scan =3D=3D 0)
> +               return 0;
> +
> +       while (total_freed < sc->nr_to_scan) {
> +               int freed =3D free_one_item(SKIP_POOL);
> +
> +               if (!freed)
> +                       break;
> +
> +               total_freed +=3D freed;
> +       }
> +
> +       return total_freed;
> +}
> +
> +static struct shrinker freelist_shrinker =3D {
> +       .count_objects =3D freelist_shrink_count,
> +       .scan_objects =3D freelist_shrink_scan,
> +       .seeks =3D DEFAULT_SEEKS,
> +       .batch =3D 0,
> +};
> +
> +static int deferred_free_thread(void *data)
> +{
> +       while (true) {
> +               wait_event_freezable(freelist_waitqueue,
> +                                    get_freelist_size() > 0);
> +
> +               free_one_item(USE_POOL);
> +       }
> +
> +       return 0;
> +}
> +
> +static int deferred_freelist_init(void)
> +{
> +       list_size =3D 0;
> +
> +       init_waitqueue_head(&freelist_waitqueue);
> +       freelist_task =3D kthread_run(deferred_free_thread, NULL,
> +                                   "%s", "dmabuf-deferred-free-worker");
> +       if (IS_ERR(freelist_task)) {
> +               pr_err("%s: creating thread for deferred free failed\n",
> +                      __func__);
> +               return -1;
> +       }
> +       sched_set_normal(freelist_task, 19);
> +
> +       return register_shrinker(&freelist_shrinker);
> +}
> +device_initcall(deferred_freelist_init);
> diff --git a/drivers/dma-buf/heaps/deferred-free-helper.h b/drivers/dma-b=
uf/heaps/deferred-free-helper.h
> new file mode 100644
> index 000000000000..09a2274a897c
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/deferred-free-helper.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef DEFERRED_FREE_HELPER_H
> +#define DEFERRED_FREE_HELPER_H
> +
> +struct deferred_freelist_item {
> +       size_t size;
> +       void (*free)(struct deferred_freelist_item *i, bool no_pool);
> +       struct list_head list;
> +};

I assume deferred_freelist_item gets embedded in a structure that is
actually being freed?

> +
> +void deferred_free(struct deferred_freelist_item *item,
> +                  void (*free)(struct deferred_freelist_item *i, bool no=
_pool),
> +                  size_t size);
> +#endif
> --
> 2.17.1
>

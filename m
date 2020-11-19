Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAFF2B91EE
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 13:01:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbgKSL6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 06:58:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgKSL6U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 06:58:20 -0500
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25326C0613CF
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 03:58:19 -0800 (PST)
Received: by mail-oo1-xc44.google.com with SMTP id t10so1274144oon.4
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 03:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=laYv70RrJGedyGzvnWwLg8QepXfyreqfTEPVDRWx40s=;
        b=Ea0hzl9RD2aAks6n/xYTIO3SmGf4FMFqeMCR+uSCsV2xclfAZvT7UbbvSgku1PZW1y
         N4TdZdda01ZbT3XbAurG/+p7DOtxDGnkCBj19hQikSc89k6P0MEEio5oCJid48VE42Br
         cbWc2x2aSW3aWWTcqQR8bevbVZsli5PfwLV3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=laYv70RrJGedyGzvnWwLg8QepXfyreqfTEPVDRWx40s=;
        b=JV1YHSh+AF2rrEnQZDORBd1cICeqlVaRt2rN+yO5GOyCK4+Z1Z9AN8Qg63nmO2BI4k
         T135MlgaoN2W3j1x8G/kvUCIGTCip4l3I06rAb7c6CqrwZQDI+AfpKFDkhKIFT4gmmSB
         idNi/CHia+WtUpQDINPvYRW9YjDfW3oQxJ7YBvBemmB25WuSowegK6xI1v0AL0Eck/Fp
         gRRmq8WRt7QuHuFj8iWM4uMhmimWgm8TR/7CzbL1LK51Hm+j/RBwlyYH8P0smcaTh1LH
         UvaPyyjbdB0pjjWmLGcklcvLdOCZheCsYvfIa/V6d4W2mzUPr8vDS2u/LVUijl/ygJ42
         rPow==
X-Gm-Message-State: AOAM532GhVdIxctMAlyTV2EQ3+CDnhTm12iMcGWjARqFG8AjyvBNTQ72
        GQCKIMDTAthnCvY72xkWtWIu1n/eYFeqMXMYv9HbJw==
X-Google-Smtp-Source: ABdhPJwypeDRP1qNzzv9UID/Lwq+YjhE17MWNrnxQCVp7BZQUnIACr3wTz7lz/0IId/1OT6LDpJ7KXqokcDjSDVq/es=
X-Received: by 2002:a4a:9486:: with SMTP id k6mr10042278ooi.85.1605787098521;
 Thu, 19 Nov 2020 03:58:18 -0800 (PST)
MIME-Version: 1.0
References: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
In-Reply-To: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 19 Nov 2020 12:58:07 +0100
Message-ID: <CAKMK7uEaYQmu6zBR5rYj=O1DdhzO2q_bMhntwxEuqbMqh_E9aQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] dma-fence: allow signaling drivers to set
 fence timestamp
To:     Veera Sundaram Sankaran <veeras@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Dave Airlie <airlied@linux.ie>,
        "Clark, Rob" <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        pdhaval@codeaurora.org, Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 12, 2020 at 7:27 PM Veera Sundaram Sankaran
<veeras@codeaurora.org> wrote:
>
> Some drivers have hardware capability to get the precise timestamp of
> certain events based on which the fences are triggered. This allows it
> to set accurate timestamp factoring out any software and IRQ latencies.
> Move the timestamp parameter out of union in dma_fence struct to allow
> signaling drivers to set it. If the parameter is not set, ktime_get is
> used to set the current time to fence timestamp during dma_fence_signal.
>
> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>

So with they "why?" question fully resolved, I think this is a bit too
much a hack. I think much better if we pass the timestamp explicitly,
in a new dma_fence_signal_timestamp variant. That means a bit more
work, but I think it will handle this special case cleaner.

Also means we need to wire the timestamp through the entire call stack
on the drm side too. So we need a drm_send_event_locked_timestamp
variant too for send_vblank_event.
-Daniel

> ---
>  drivers/dma-buf/dma-fence.c | 18 ++++++++++--------
>  include/linux/dma-fence.h   | 15 +++------------
>  2 files changed, 13 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 43624b4..7cef49a 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2012 Canonical Ltd
>   * Copyright (C) 2012 Texas Instruments
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
>   *
>   * Authors:
>   * Rob Clark <robdclark@gmail.com>
> @@ -329,7 +330,6 @@ void __dma_fence_might_wait(void)
>  int dma_fence_signal_locked(struct dma_fence *fence)
>  {
>         struct dma_fence_cb *cur, *tmp;
> -       struct list_head cb_list;
>
>         lockdep_assert_held(fence->lock);
>
> @@ -337,16 +337,18 @@ int dma_fence_signal_locked(struct dma_fence *fence)
>                                       &fence->flags)))
>                 return -EINVAL;
>
> -       /* Stash the cb_list before replacing it with the timestamp */
> -       list_replace(&fence->cb_list, &cb_list);
> -
> -       fence->timestamp = ktime_get();
> +       /* set current time, if not set by signaling driver */
> +       if (!fence->timestamp)
> +               fence->timestamp = ktime_get();
>         set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
>         trace_dma_fence_signaled(fence);
>
> -       list_for_each_entry_safe(cur, tmp, &cb_list, node) {
> -               INIT_LIST_HEAD(&cur->node);
> -               cur->func(fence, cur);
> +       if (!list_empty(&fence->cb_list)) {
> +               list_for_each_entry_safe(cur, tmp, &fence->cb_list, node) {
> +                       INIT_LIST_HEAD(&cur->node);
> +                       cur->func(fence, cur);
> +               }
> +               INIT_LIST_HEAD(&fence->cb_list);
>         }
>
>         return 0;
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 09e23ad..a9eebaf 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2012 Canonical Ltd
>   * Copyright (C) 2012 Texas Instruments
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
>   *
>   * Authors:
>   * Rob Clark <robdclark@gmail.com>
> @@ -70,26 +71,16 @@ struct dma_fence {
>          * release the fence it is unused. No one should be adding to the
>          * cb_list that they don't themselves hold a reference for.
>          *
> -        * The lifetime of the timestamp is similarly tied to both the
> -        * rcu freelist and the cb_list. The timestamp is only set upon
> -        * signaling while simultaneously notifying the cb_list. Ergo, we
> -        * only use either the cb_list of timestamp. Upon destruction,
> -        * neither are accessible, and so we can use the rcu. This means
> -        * that the cb_list is *only* valid until the signal bit is set,
> -        * and to read either you *must* hold a reference to the fence,
> -        * and not just the rcu_read_lock.
> -        *
>          * Listed in chronological order.
>          */
>         union {
>                 struct list_head cb_list;
> -               /* @cb_list replaced by @timestamp on dma_fence_signal() */
> -               ktime_t timestamp;
> -               /* @timestamp replaced by @rcu on dma_fence_release() */
> +               /* @cb_list replaced by @rcu on dma_fence_release() */
>                 struct rcu_head rcu;
>         };
>         u64 context;
>         u64 seqno;
> +       ktime_t timestamp;
>         unsigned long flags;
>         struct kref refcount;
>         int error;
> --
> 2.7.4
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

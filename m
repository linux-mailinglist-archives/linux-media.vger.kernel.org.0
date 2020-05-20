Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F631DB087
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 12:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgETKsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 06:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgETKsP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 06:48:15 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BF2C061A0E;
        Wed, 20 May 2020 03:48:15 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id s21so3231134ejd.2;
        Wed, 20 May 2020 03:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=BJ/UCzsi6VWkG3ZZDu+33O2d2bF1wj81EEaZB1Z7K30=;
        b=WEPQ8MJrWaSjujdfKushADVupApSDARb7vrKJ/fPzUsc3mC/ujYkoHlzhlGNkA308s
         8QlM2py1RTW3ThJuqL16Dpm1nPcK2exZHYTewSxgEmvnBX8O73WjrhSWRPP0hp7qqKfW
         NbQHSbLaGDcilmMiDH6e6NwoD7qWS80mADr92pxpSZYaDKfCSgT0euPlX2HhzHki488r
         g5uQmhh21dl5sC0qN5bsGNktaK5rHkVXszDrtbSsBuxkKRcSA+thic04zS4eH6+Xbrwq
         PTAE7Nk0wBp+2n35cDhBohVR1UyNtmIR8pSjt57EXmTRH7q+SThhRTT0BzCiW4he0NaY
         g5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=BJ/UCzsi6VWkG3ZZDu+33O2d2bF1wj81EEaZB1Z7K30=;
        b=Mi8J9u3Ql0muuzXcoyeH7MOWFLBGs55jq3oDXmtci1cFU/c+07XjHymYEadWBac9+/
         HAS7sxeOMkl0hOZDX7bsHOAhYPoNHSLQOFC4UZCvzDHaLZweT0uRCYzNksiyG89/g/8h
         m/z+lKcavODDZ6AIHO6rSGSnUNfrpCoSjm3g44G5bbQwqQRQ9e6PK95n/oXQV7t2FSOh
         chQ7swEWJQWIOrH+xpzU+pVLLvWX+qb8fNSv+ElHC+Zn/m89mzDkBa6lw83rsaourSWu
         ha7YtZeoo2Tu40hzxOqk8kBZktyjdZVZKMtOem2x0/7j/1u/4KU7Pbc4oBkL9GFc+/iL
         jiqQ==
X-Gm-Message-State: AOAM5310fZ/vqPHxWEONxCZynTmFgnMHABFB87fLu2FKTDEE+RzAotoa
        FKQJTBqh/+bg1mgJ7bF+1tcWp1Fi
X-Google-Smtp-Source: ABdhPJwl6ENc60zjPf1yS0B2rvn9LuXNOLk4I5UDfSAupLCD7BKpxI1kC22/RvD9+6+rp/IyTh2rFg==
X-Received: by 2002:a17:906:8514:: with SMTP id i20mr3004443ejx.298.1589971693861;
        Wed, 20 May 2020 03:48:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id m3sm1558631ede.58.2020.05.20.03.48.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 May 2020 03:48:13 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH v1 13/25] dma-buf: Use sequence counter with associated
 wound/wait mutex
To:     "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
Cc:     "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        amd-gfx@lists.freedesktop.org,
        "Paul E. McKenney" <paulmck@kernel.org>,
        David Airlie <airlied@linux.ie>,
        "Sebastian A. Siewior" <bigeasy@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org
References: <20200519214547.352050-1-a.darwish@linutronix.de>
 <20200519214547.352050-14-a.darwish@linutronix.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e28c251e-5771-598c-37dd-c6be2de4b9e1@gmail.com>
Date:   Wed, 20 May 2020 12:48:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200519214547.352050-14-a.darwish@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 19.05.20 um 23:45 schrieb Ahmed S. Darwish:
> A sequence counter write side critical section must be protected by some
> form of locking to serialize writers. If the serialization primitive is
> not disabling preemption implicitly, preemption has to be explicitly
> disabled before entering the sequence counter write side critical
> section.
>
> The dma-buf reservation subsystem uses plain sequence counters to manage
> updates to reservations. Writer serialization is accomplished through a
> wound/wait mutex.
>
> Acquiring a wound/wait mutex does not disable preemption, so this needs
> to be done manually before and after the write side critical section.
>
> Use the newly-added seqcount_ww_mutex_t instead:
>
>    - It associates the ww_mutex with the sequence count, which enables
>      lockdep to validate that the write side critical section is properly
>      serialized.
>
>    - It removes the need to explicitly add preempt_disable/enable()
>      around the write side critical section because the write_begin/end()
>      functions for this new data type automatically do this.
>
> If lockdep is disabled this ww_mutex lock association is compiled out
> and has neither storage size nor runtime overhead.

Mhm, is the dma_resv object the only user of this new seqcount_ww_mutex 
variant ?

If yes we are trying to get rid of this sequence counter for quite some 
time, so I would rather invest the additional time to finish this.

Regards,
Christian.

>
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> ---
>   drivers/dma-buf/dma-resv.c                       | 8 +-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 --
>   include/linux/dma-resv.h                         | 2 +-
>   3 files changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 590ce7ad60a0..3aba2b2bfc48 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -128,7 +128,7 @@ subsys_initcall(dma_resv_lockdep);
>   void dma_resv_init(struct dma_resv *obj)
>   {
>   	ww_mutex_init(&obj->lock, &reservation_ww_class);
> -	seqcount_init(&obj->seq);
> +	seqcount_ww_mutex_init(&obj->seq, &obj->lock);
>   
>   	RCU_INIT_POINTER(obj->fence, NULL);
>   	RCU_INIT_POINTER(obj->fence_excl, NULL);
> @@ -259,7 +259,6 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>   	fobj = dma_resv_get_list(obj);
>   	count = fobj->shared_count;
>   
> -	preempt_disable();
>   	write_seqcount_begin(&obj->seq);
>   
>   	for (i = 0; i < count; ++i) {
> @@ -281,7 +280,6 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>   	smp_store_mb(fobj->shared_count, count);
>   
>   	write_seqcount_end(&obj->seq);
> -	preempt_enable();
>   	dma_fence_put(old);
>   }
>   EXPORT_SYMBOL(dma_resv_add_shared_fence);
> @@ -308,14 +306,12 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>   	if (fence)
>   		dma_fence_get(fence);
>   
> -	preempt_disable();
>   	write_seqcount_begin(&obj->seq);
>   	/* write_seqcount_begin provides the necessary memory barrier */
>   	RCU_INIT_POINTER(obj->fence_excl, fence);
>   	if (old)
>   		old->shared_count = 0;
>   	write_seqcount_end(&obj->seq);
> -	preempt_enable();
>   
>   	/* inplace update, no shared fences */
>   	while (i--)
> @@ -393,13 +389,11 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>   	src_list = dma_resv_get_list(dst);
>   	old = dma_resv_get_excl(dst);
>   
> -	preempt_disable();
>   	write_seqcount_begin(&dst->seq);
>   	/* write_seqcount_begin provides the necessary memory barrier */
>   	RCU_INIT_POINTER(dst->fence_excl, new);
>   	RCU_INIT_POINTER(dst->fence, dst_list);
>   	write_seqcount_end(&dst->seq);
> -	preempt_enable();
>   
>   	dma_resv_list_free(src_list);
>   	dma_fence_put(old);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 9dff792c9290..87fd32aae8f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -258,11 +258,9 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>   	new->shared_count = k;
>   
>   	/* Install the new fence list, seqcount provides the barriers */
> -	preempt_disable();
>   	write_seqcount_begin(&resv->seq);
>   	RCU_INIT_POINTER(resv->fence, new);
>   	write_seqcount_end(&resv->seq);
> -	preempt_enable();
>   
>   	/* Drop the references to the removed fences or move them to ef_list */
>   	for (i = j, k = 0; i < old->shared_count; ++i) {
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index a6538ae7d93f..d44a77e8a7e3 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -69,7 +69,7 @@ struct dma_resv_list {
>    */
>   struct dma_resv {
>   	struct ww_mutex lock;
> -	seqcount_t seq;
> +	seqcount_ww_mutex_t seq;
>   
>   	struct dma_fence __rcu *fence_excl;
>   	struct dma_resv_list __rcu *fence;


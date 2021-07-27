Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C90D3D7010
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 09:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235656AbhG0HLx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 03:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235409AbhG0HLw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 03:11:52 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AD9C061757;
        Tue, 27 Jul 2021 00:11:53 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id f14-20020a05600c154eb02902519e4abe10so1075766wmg.4;
        Tue, 27 Jul 2021 00:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sxFcXJToDZMWgKe9LXihsrB1La88hBN0XlIyclx9/f4=;
        b=lEwkbL1rJM3F+mDQtqOuqfdOKPbBUOy0nmusGJjX0L5q1YZx4htOz5BKUJfkjr0piO
         CY09atvv4CfAk0NzHPj9jUDGJOSCtbJNnxqJyC9tbWfiHqlBNYMUDNKX4KIwZmFJOaW2
         qTTlAUaE1yMSabskDSytArp1jmYkizKRsVZueOY/3G1p+GghiUTGbmouLXY6zHnunsjO
         s8FT3oi0Wfiqo6Fs1W3THmkyZDlTpxmz3ZOe+atFKCudwAcB3tqM4PSwO7pPnYwXq1cs
         SGGOjMe1KVNTvXj+XsJ84gOdHT/ZsmBvWMr7VgLf9oOjAoQGWQ6XqOvNoAOxblkgd10m
         dxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sxFcXJToDZMWgKe9LXihsrB1La88hBN0XlIyclx9/f4=;
        b=Chj/xoHuYvn+lRZa98PMaOuqXCToiQ6S25bIy5RosUviLZHnCttSep1dfhNm39Z55B
         6oWH2qZVqXX8heCon6mmstYbOurdlv8Qb+s/qn4tvoZ04JmCQDZRAkmGxNbytHGy6eY/
         wahtajjEXMu82nJoGj3Wkz5CDozQ4q160aI4nVIbUbnsOCWMtUSQrGzHcvt87iHJMUJ8
         COEwdJ75p62CwPkEvTw/lTPGTk7FZJLuOhvdGzoc52r3odsMPFE1i3VCoEVq7b7F+vaw
         1JuyG+hraZppKwv0jfomhJeEtplScdDN4cwMAbe3d4CTyc/hFLskQIxeTLiLBYgL2pOK
         pgAA==
X-Gm-Message-State: AOAM532eMzu4j7/EVXkzSo1t36TuBP5bxoO/ckraz86ku3uTRp5/nuUW
        WNOQgKQPI86JowI+6ioq41olzUXOqsA=
X-Google-Smtp-Source: ABdhPJz/MgnHtkxYirTPDve81q42RkzbN1vyC5mjRajaoM6gwdEzfJ2NEGQCc32h6XQNzHYHd+Rkxg==
X-Received: by 2002:a7b:c108:: with SMTP id w8mr20709070wmi.99.1627369911654;
        Tue, 27 Jul 2021 00:11:51 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ae22:6310:9a31:9877? ([2a02:908:1252:fb60:ae22:6310:9a31:9877])
        by smtp.gmail.com with ESMTPSA id m9sm881309wrz.75.2021.07.27.00.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 00:11:51 -0700 (PDT)
Subject: Re: [RFC 1/4] dma-fence: Add deadline awareness
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Matthew Brost <matthew.brost@intel.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <20210726233854.2453899-2-robdclark@gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <50b181fe-6605-b7ac-36a6-8bcda2930e6f@gmail.com>
Date:   Tue, 27 Jul 2021 09:11:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726233854.2453899-2-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 27.07.21 um 01:38 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Add a way to hint to the fence signaler of an upcoming deadline, such as
> vblank, which the fence waiter would prefer not to miss.  This is to aid
> the fence signaler in making power management decisions, like boosting
> frequency as the deadline approaches and awareness of missing deadlines
> so that can be factored in to the frequency scaling.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/dma-buf/dma-fence.c | 39 +++++++++++++++++++++++++++++++++++++
>   include/linux/dma-fence.h   | 17 ++++++++++++++++
>   2 files changed, 56 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index ce0f5eff575d..2e0d25ab457e 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -910,6 +910,45 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
>   }
>   EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>   
> +
> +/**
> + * dma_fence_set_deadline - set desired fence-wait deadline
> + * @fence:    the fence that is to be waited on
> + * @deadline: the time by which the waiter hopes for the fence to be
> + *            signaled
> + *
> + * Inform the fence signaler of an upcoming deadline, such as vblank, by
> + * which point the waiter would prefer the fence to be signaled by.  This
> + * is intended to give feedback to the fence signaler to aid in power
> + * management decisions, such as boosting GPU frequency if a periodic
> + * vblank deadline is approaching.
> + */
> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> +{
> +	unsigned long flags;
> +
> +	if (dma_fence_is_signaled(fence))
> +		return;
> +
> +	spin_lock_irqsave(fence->lock, flags);
> +
> +	/* If we already have an earlier deadline, keep it: */
> +	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags) &&
> +	    ktime_before(fence->deadline, deadline)) {
> +		spin_unlock_irqrestore(fence->lock, flags);
> +		return;
> +	}
> +
> +	fence->deadline = deadline;
> +	set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags);
> +
> +	spin_unlock_irqrestore(fence->lock, flags);
> +
> +	if (fence->ops->set_deadline)
> +		fence->ops->set_deadline(fence, deadline);
> +}
> +EXPORT_SYMBOL(dma_fence_set_deadline);
> +
>   /**
>    * dma_fence_init - Initialize a custom fence.
>    * @fence: the fence to initialize
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 6ffb4b2c6371..4e6cfe4e6fbc 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -88,6 +88,7 @@ struct dma_fence {
>   		/* @timestamp replaced by @rcu on dma_fence_release() */
>   		struct rcu_head rcu;
>   	};
> +	ktime_t deadline;

Mhm, adding the flag sounds ok to me but I'm a bit hesitating adding the 
deadline as extra field here.

We tuned the dma_fence structure intentionally so that it is only 64 bytes.

Regards,
Christian.

>   	u64 context;
>   	u64 seqno;
>   	unsigned long flags;
> @@ -99,6 +100,7 @@ enum dma_fence_flag_bits {
>   	DMA_FENCE_FLAG_SIGNALED_BIT,
>   	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>   	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> +	DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>   	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
>   };
>   
> @@ -261,6 +263,19 @@ struct dma_fence_ops {
>   	 */
>   	void (*timeline_value_str)(struct dma_fence *fence,
>   				   char *str, int size);
> +
> +	/**
> +	 * @set_deadline:
> +	 *
> +	 * Callback to allow a fence waiter to inform the fence signaler of an
> +	 * upcoming deadline, such as vblank, by which point the waiter would
> +	 * prefer the fence to be signaled by.  This is intended to give feedback
> +	 * to the fence signaler to aid in power management decisions, such as
> +	 * boosting GPU frequency.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
>   };
>   
>   void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
> @@ -586,6 +601,8 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>   	return ret < 0 ? ret : 0;
>   }
>   
> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
> +
>   struct dma_fence *dma_fence_get_stub(void);
>   struct dma_fence *dma_fence_allocate_private_stub(void);
>   u64 dma_fence_context_alloc(unsigned num);


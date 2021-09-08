Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4499B403EB6
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 19:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240432AbhIHR5M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 13:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbhIHR5L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 13:57:11 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDB0C061575
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 10:56:03 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 9so2866020edx.11
        for <linux-media@vger.kernel.org>; Wed, 08 Sep 2021 10:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nTI6uK5ZnZFKdkZzGsIFw1dg5sgvvgRR4gACSjk5hCg=;
        b=cemRhJ2zuSZZ3HxEtjInYPYJfG1GLROgLf0r9GtH7A7FK/Vh2l1Dc24o8OZw9emjXr
         SXtEaW5ocCG1RzaFmV94775zVSaEEZt8lydGwWr5x8XO6ti4K3njTeWBZ23CurSzeoYj
         ZMqW7jGZBPmb9iWSjZ/OG2+hxlmu8C1HH9Jk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=nTI6uK5ZnZFKdkZzGsIFw1dg5sgvvgRR4gACSjk5hCg=;
        b=iuwwM9ybLSornyw+2Ygaz/ZrLMoKgFUlCifE53na1Ww/I8GTjMip03DrQ5r5FYFD02
         Y2VhBXTguZOuDnARYa2mB/xKQ7RzlJcM5Sj/QZfDA0KpJNlIkws8lOPTqsGvoxMAFKL/
         ZV2i7p0Mh2MSI1krbOCC9OuQoCv5sRvEa01DXuHTKov5TX+3DhR6fJ3uO1EgCBZ3qowu
         qEkqZbxYNkwlq485DX1LqYpnKBNfN0oqJ70ga/f8KbSo6HsrmzemHebRggYHrwINlu6c
         /KhouvDdtOEtb17g5C/FXeiE17EYq9gu9HxnZ/35CQpHO4Jej+OBCTqOBpmOA6mjmAJI
         iuMA==
X-Gm-Message-State: AOAM530FFt10axLFlMhHgCiOxoBxFRMdyTdlnZJHQG6O6Y5q89cVn15E
        JWdwKBOEtEu4RrNRqU6ccTDI5g==
X-Google-Smtp-Source: ABdhPJxhIq7UANzQZ2ADFeFtoKV7zIh9j1x7mEufNI0IxeaJGvGSzLeD/6EQflC2FwO8pjqQK18/iw==
X-Received: by 2002:a50:fd98:: with SMTP id o24mr4955151edt.129.1631123762032;
        Wed, 08 Sep 2021 10:56:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id jx21sm1370002ejb.41.2021.09.08.10.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 10:56:01 -0700 (PDT)
Date:   Wed, 8 Sep 2021 19:55:59 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/9] dma-fence: Add deadline awareness
Message-ID: <YTj5LzD19u5Rgz+J@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210903184806.1680887-2-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 03, 2021 at 11:47:52AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a way to hint to the fence signaler of an upcoming deadline, such as
> vblank, which the fence waiter would prefer not to miss.  This is to aid
> the fence signaler in making power management decisions, like boosting
> frequency as the deadline approaches and awareness of missing deadlines
> so that can be factored in to the frequency scaling.
> 
> v2: Drop dma_fence::deadline and related logic to filter duplicate
>     deadlines, to avoid increasing dma_fence size.  The fence-context
>     implementation will need similar logic to track deadlines of all
>     the fences on the same timeline.  [ckoenig]
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/dma-buf/dma-fence.c | 20 ++++++++++++++++++++
>  include/linux/dma-fence.h   | 16 ++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index ce0f5eff575d..1f444863b94d 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -910,6 +910,26 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
>  }
>  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
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
> +	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
> +		fence->ops->set_deadline(fence, deadline);
> +}
> +EXPORT_SYMBOL(dma_fence_set_deadline);
> +
>  /**
>   * dma_fence_init - Initialize a custom fence.
>   * @fence: the fence to initialize
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 6ffb4b2c6371..9c809f0d5d0a 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
>  	DMA_FENCE_FLAG_SIGNALED_BIT,
>  	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>  	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> +	DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>  	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
>  };
>  
> @@ -261,6 +262,19 @@ struct dma_fence_ops {
>  	 */
>  	void (*timeline_value_str)(struct dma_fence *fence,
>  				   char *str, int size);
> +
> +	/**
> +	 * @set_deadline:
> +	 *
> +	 * Callback to allow a fence waiter to inform the fence signaler of an
> +	 * upcoming deadline, such as vblank, by which point the waiter would
> +	 * prefer the fence to be signaled by.  This is intended to give feedback
> +	 * to the fence signaler to aid in power management decisions, such as
> +	 * boosting GPU frequency.

Please add here that this callback is called without &dma_fence.lock held,
and that locking is up to callers if they have some state to manage.

I realized that while scratching some heads over your later patches.
-Daniel

> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
>  };
>  
>  void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
> @@ -586,6 +600,8 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>  	return ret < 0 ? ret : 0;
>  }
>  
> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
> +
>  struct dma_fence *dma_fence_get_stub(void);
>  struct dma_fence *dma_fence_allocate_private_stub(void);
>  u64 dma_fence_context_alloc(unsigned num);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

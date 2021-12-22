Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5925747D8A4
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238079AbhLVVVQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbhLVVVQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:21:16 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0F0C061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:21:15 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id j21so13515026edt.9
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UOyNk6zHot8QJ2cJj1ziXQ3UAlzgLdXMmKFvUQzRJ6s=;
        b=I1ZLCqeUseVSQW/GgASZaPFuH/1JrRTu7shw7XShZKIhdJmmDlR3gDxh0fdD9uquQR
         x64PtNAVCHc5jM8/4w3rSqLFuZYuc22woVMM6VaUBU1Ung2cQ5+FtLY7w+fDIesoC5gA
         dwuGiruGn33XTKgqhWzf7T4mErCD0n3vpPW6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UOyNk6zHot8QJ2cJj1ziXQ3UAlzgLdXMmKFvUQzRJ6s=;
        b=pqn2BTTiiZl7VTRShPg56LfFl3usCmHe3MGHbMWX3EhKiyqeMpukbX+R36afDfLrDz
         j28QFzAwgMS5eugxaFlV7vtUfoZjsgVYvm4pmuI2u86xW/t2b845dp1P4qeO6CGiuDsY
         pbL8KNU1pvxpEE9XOGJRVXhfYswTowbmkDzF+Inh7CzHIEr6FnBvsJnRDLSXnc50jakS
         nQadtjrDbVb9ObsLvd3d9hWETEZa2UJoabP4eyOh7P8aXk3Z66PHV0CgIe+n/DBVP1WQ
         /48lDK1M6SzYHPZTncC7xjQNp1AwwwI9qV+KAYvArLOqIcV2R4jWgqlZvrhm+JgWY33d
         4pJA==
X-Gm-Message-State: AOAM530HurJib1I2qgS06OPoSWuGGa/FdWbiGQ9LI+CWZdPUKuIJjJYQ
        7q2qUyOu/ZR/mSY9LO3PgDWzkw==
X-Google-Smtp-Source: ABdhPJyIVxXQ4Ca2/Cnk62TAAxp7H1zzuGUjDQtNGiMuNW3/Ir6dsDSolAiY+ly2PBzTCNa4kdfmRQ==
X-Received: by 2002:a05:6402:1914:: with SMTP id e20mr4559319edz.96.1640208074237;
        Wed, 22 Dec 2021 13:21:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id hq9sm1063167ejc.57.2021.12.22.13.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:21:13 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:21:12 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 04/24] dma-buf: add dma_resv_get_singleton v2
Message-ID: <YcOWyHzY22ZCCvef@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-5-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:33:51PM +0100, Christian König wrote:
> Add a function to simplify getting a single fence for all the fences in
> the dma_resv object.
> 
> v2: fix ref leak in error handling
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 52 ++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-resv.h   |  2 ++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 480c305554a1..694716a3d66d 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -34,6 +34,7 @@
>   */
>  
>  #include <linux/dma-resv.h>
> +#include <linux/dma-fence-array.h>
>  #include <linux/export.h>
>  #include <linux/mm.h>
>  #include <linux/sched/mm.h>
> @@ -657,6 +658,57 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
>  }
>  EXPORT_SYMBOL_GPL(dma_resv_get_fences);
>  
> +/**
> + * dma_resv_get_singleton - Get a single fence for all the fences
> + * @obj: the reservation object
> + * @write: true if we should return all fences
> + * @fence: the resulting fence
> + *
> + * Get a single fence representing all the fences inside the resv object.
> + * Returns either 0 for success or -ENOMEM.
> + *
> + * Warning: This can't be used like this when adding the fence back to the resv
> + * object since that can lead to stack corruption when finalizing the
> + * dma_fence_array.

Uh I don't get this one? I thought the only problem with nested fences is
the signalling recursion, which we work around with the irq_work?

Also if there's really an issue with dma_fence_array fences, then that
warning should be on the dma_resv kerneldoc, not somewhere hidden like
this. And finally I really don't see what can go wrong, sure we'll end up
with the same fence once in the dma_resv_list and then once more in the
fence array. But they're all refcounted, so really shouldn't matter.

The code itself looks correct, but me not understanding what even goes
wrong here freaks me out a bit.

I guess something to figure out next year, I kinda hoped I could squeeze a
review in before I disappear :-/
-Daniel

> + */
> +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> +			   struct dma_fence **fence)
> +{
> +	struct dma_fence_array *array;
> +	struct dma_fence **fences;
> +	unsigned count;
> +	int r;
> +
> +	r = dma_resv_get_fences(obj, write, &count, &fences);
> +        if (r)
> +		return r;
> +
> +	if (count == 0) {
> +		*fence = NULL;
> +		return 0;
> +	}
> +
> +	if (count == 1) {
> +		*fence = fences[0];
> +		kfree(fences);
> +		return 0;
> +	}
> +
> +	array = dma_fence_array_create(count, fences,
> +				       dma_fence_context_alloc(1),
> +				       1, false);
> +	if (!array) {
> +		while (count--)
> +			dma_fence_put(fences[count]);
> +		kfree(fences);
> +		return -ENOMEM;
> +	}
> +
> +	*fence = &array->base;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
> +
>  /**
>   * dma_resv_wait_timeout - Wait on reservation's objects
>   * shared and/or exclusive fences.
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index fa2002939b19..cdfbbda6f600 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -438,6 +438,8 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>  int dma_resv_get_fences(struct dma_resv *obj, bool write,
>  			unsigned int *num_fences, struct dma_fence ***fences);
> +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> +			   struct dma_fence **fence);
>  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
>  long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
>  			   unsigned long timeout);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

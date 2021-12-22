Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B35D347D911
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 23:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235099AbhLVWFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 17:05:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbhLVWF3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 17:05:29 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E64EBC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 14:05:28 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id j6so13756161edw.12
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 14:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JXq+5dsY8Bw6O6xbPcewh11jsddjQUU7f6PccADeVp8=;
        b=FdevmSAT2QN0i6s5X2Gg01OrLYPi1IoWtg3nJsFYGzcoYslzwlwpsx6ndo+RYwMTY+
         6caTpATFpuzhpIpFg7IYgC0Vg/3I8NYJQb1wQSNTJTX3FxrabgP0n3bQGkunKtCbU7MH
         7rTMGctqC4TFS0gpnE79Gxs7QKZvShbTUUXeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JXq+5dsY8Bw6O6xbPcewh11jsddjQUU7f6PccADeVp8=;
        b=7ffI2pWeFOxE6nn1SKTKuTBzBU1bNACRvUHxO1h6vhQLy/PhpgW/jHX4mceK6Gqc1q
         3pa52KRWXxqkPTp38jQpnx4PlExeeuenCkAMZ8y1W5LlT/bZo9mVz/IH1VbYgB2FgmCw
         2rZ9dksujIrvDSa6wN1m6ATkXgOHVHJGORXYax3E5hJ2opFUI+b7SxPbIiPTAxx/Ul53
         orMrs1Ng8b+EufbJoD0Bk2Wl6qnXwrp+aI/bXEf0i4vg9/+7CivThsWutEbyVVKQaHAN
         /ZsPSBU/WgrFd2P54kiJuh0atuMrUlhgXwPJHU0D2lXH2UZuC3gh1QGvVL+2LYDnN+af
         Jd6A==
X-Gm-Message-State: AOAM5333k6gcLkxAe6eKjWvxT7MGvO23UB5fN4n/bKyqvzTgGbnKTWaE
        NDDnXunq8oYouenMuXr9tQCTWg==
X-Google-Smtp-Source: ABdhPJxrmggVIJ3vzjr6h0B36cTMwYShzuIu5ndivNPTudzJbwapW1arhLeUWChHQLLQWzHyXuZ9SQ==
X-Received: by 2002:a05:6402:27d1:: with SMTP id c17mr4373894ede.128.1640210727567;
        Wed, 22 Dec 2021 14:05:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s5sm1090628ejn.205.2021.12.22.14.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 14:05:27 -0800 (PST)
Date:   Wed, 22 Dec 2021 23:05:25 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 20/24] dma-buf: add DMA_RESV_USAGE_KERNEL
Message-ID: <YcOhJfy3O7lydic8@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-21-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-21-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:34:07PM +0100, Christian König wrote:
> Add an usage for kernel submissions. Waiting for those
> are mandatory for dynamic DMA-bufs.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Again just skipping to the doc bikeshedding, maybe with more cc others
help with some code review too.

>  EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 4f3a6abf43c4..29d799991496 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -54,8 +54,30 @@ struct dma_resv_list;
>   *
>   * This enum describes the different use cases for a dma_resv object and
>   * controls which fences are returned when queried.
> + *
> + * An important fact is that there is the order KERNEL<WRITE<READ and
> + * when the dma_resv object is asked for fences for one use case the fences
> + * for the lower use case are returned as well.
> + *
> + * For example when asking for WRITE fences then the KERNEL fences are returned
> + * as well. Similar when asked for READ fences then both WRITE and KERNEL
> + * fences are returned as well.
>   */
>  enum dma_resv_usage {
> +	/**
> +	 * @DMA_RESV_USAGE_KERNEL: For in kernel memory management only.
> +	 *
> +	 * This should only be used for things like copying or clearing memory
> +	 * with a DMA hardware engine for the purpose of kernel memory
> +	 * management.
> +	 *
> +         * Drivers *always* need to wait for those fences before accessing the

s/need to/must/ to stay with usual RFC wording. It's a hard requirement or
there's a security bug somewhere.

> +	 * resource protected by the dma_resv object. The only exception for
> +	 * that is when the resource is known to be locked down in place by
> +	 * pinning it previously.

Is this true? This sounds more confusing than helpful, because afaik in
general our pin interfaces do not block for any kernel fences. dma_buf_pin
doesn't do that for sure. And I don't think ttm does that either.

I think the only safe thing here is to state that it's safe if a) the
resource is pinned down and b) the callers has previously waited for the
kernel fences.

I also think we should put that wait for kernel fences into dma_buf_pin(),
but that's maybe a later patch.
-Daniel



> +	 */
> +	DMA_RESV_USAGE_KERNEL,
> +
>  	/**
>  	 * @DMA_RESV_USAGE_WRITE: Implicit write synchronization.
>  	 *
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

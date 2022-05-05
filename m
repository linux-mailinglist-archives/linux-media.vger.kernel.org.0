Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32D5A51C0B5
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 15:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357211AbiEENdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 09:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379536AbiEENdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 09:33:02 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4148256FA8
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 06:29:23 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bv19so8749235ejb.6
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 06:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Ui21piTZ0ApfGLe6rSNYF+vmLdIPcNpHB647yaNJAEA=;
        b=GUYSMOZfibAtHewRxv7NXvJfooeNyLie4/C/2WhzfE1nZb66wcOaxp+lICUXVBORYe
         topja/IRIvJeuJTYG3rs0ab7/us7cJ5gwWYgW2ms4wIGyHjiP1g79yloC/utlJWo6cW/
         kBpNUgOtkT4bJPg5gjRorgiC9a2Opu0cDeSQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Ui21piTZ0ApfGLe6rSNYF+vmLdIPcNpHB647yaNJAEA=;
        b=Yw7L12ikImj+kboHYvqblTkPX3nXN6xwuZZ1j+BCDeOT6Zq77Pko3bZY63UVj1qyul
         uh4KSk3weZ62UKT+2mDq9yITNAVRzWe/PVpK060v9lsJx/POwZrs2QIpqSX6ATL8GYzX
         /QO9Xt2LGQRXz8gf4sOvREqCF9asZxFNxyJ/mk1dkVg67RRj8+lPipRDQHcIWm6jVon0
         wWrykPuO4Oh8TNqQy9vpimn6Uq4SG4yQ49bc2Qjq/0cDBeWsVsO9BRm8WxUznpKXKDEe
         xxm3ZW2atRh2LKAfXIK2Fbcpk/vW7l6vyPxEBJp62S4ZsTXyGf5l4oRn4KPfJqiW93vx
         oElQ==
X-Gm-Message-State: AOAM530uz0uoqG6bVs5KsLoDingl0koePZRUf7mDZXKdyN3vwSDr9/Il
        Ju26iyq0R4Xz2is/PyS2UBEEgA==
X-Google-Smtp-Source: ABdhPJwRHjykKqfmXvKBcfez+gqf/TcR5Uph1IH55dlRwflfrsGd9ZGWVMc2tb/Xq5lMPmwUta9buA==
X-Received: by 2002:a17:907:7282:b0:6ef:f412:f7c4 with SMTP id dt2-20020a170907728200b006eff412f7c4mr25973036ejc.258.1651757361694;
        Thu, 05 May 2022 06:29:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l10-20020a170906938a00b006f3ef214e68sm770067ejx.206.2022.05.05.06.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 06:29:21 -0700 (PDT)
Date:   Thu, 5 May 2022 15:29:19 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/5] dma-buf: cleanup dma_fence_unwrap selftest
Message-ID: <YnPRL7ndeh9z01mW@phenom.ffwll.local>
References: <20220504122256.1654-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504122256.1654-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 04, 2022 at 02:22:52PM +0200, Christian König wrote:
> The selftests, fix the error handling, remove unused functions and stop
> leaking memory in failed tests.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/st-dma-fence-unwrap.c | 40 +++++++++++----------------
>  1 file changed, 16 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 039f016b57be..59628add93f5 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -4,27 +4,19 @@
>   * Copyright (C) 2022 Advanced Micro Devices, Inc.
>   */
>  
> +#include <linux/dma-fence.h>
> +#include <linux/dma-fence-array.h>
> +#include <linux/dma-fence-chain.h>
>  #include <linux/dma-fence-unwrap.h>
> -#if 0
> -#include <linux/kernel.h>
> -#include <linux/kthread.h>
> -#include <linux/mm.h>
> -#include <linux/sched/signal.h>
> -#include <linux/slab.h>
> -#include <linux/spinlock.h>
> -#include <linux/random.h>
> -#endif
>  
>  #include "selftest.h"
>  
>  #define CHAIN_SZ (4 << 10)
>  
> -static inline struct mock_fence {
> +struct mock_fence {
>  	struct dma_fence base;
>  	spinlock_t lock;
> -} *to_mock_fence(struct dma_fence *f) {
> -	return container_of(f, struct mock_fence, base);
> -}
> +};
>  
>  static const char *mock_name(struct dma_fence *f)
>  {
> @@ -45,7 +37,8 @@ static struct dma_fence *mock_fence(void)
>  		return NULL;
>  
>  	spin_lock_init(&f->lock);
> -	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
> +	dma_fence_init(&f->base, &mock_ops, &f->lock,
> +		       dma_fence_context_alloc(1), 1);
>  
>  	return &f->base;
>  }
> @@ -113,7 +106,6 @@ static int sanitycheck(void *arg)
>  	if (!chain)
>  		return -ENOMEM;
>  
> -	dma_fence_signal(f);
>  	dma_fence_put(chain);
>  	return err;
>  }
> @@ -154,10 +146,10 @@ static int unwrap_array(void *arg)
>  		err = -EINVAL;
>  	}
>  
> -	dma_fence_signal(f1);
> -	dma_fence_signal(f2);
> +	dma_fence_put(f1);
> +	dma_fence_put(f2);

I'm completely lost on why you add these _put() calls? The reference we
create all get transferred over to the container object, and that takes
care of releasing them.

The other bits with error handling and code cleanup all look good, and
dropping dma_fence_signal calls also makes sense. But this one I don't
get.
-Daniel

>  	dma_fence_put(array);
> -	return 0;
> +	return err;
>  }
>  
>  static int unwrap_chain(void *arg)
> @@ -196,10 +188,10 @@ static int unwrap_chain(void *arg)
>  		err = -EINVAL;
>  	}
>  
> -	dma_fence_signal(f1);
> -	dma_fence_signal(f2);
> +	dma_fence_put(f1);
> +	dma_fence_put(f2);
>  	dma_fence_put(chain);
> -	return 0;
> +	return err;
>  }
>  
>  static int unwrap_chain_array(void *arg)
> @@ -242,10 +234,10 @@ static int unwrap_chain_array(void *arg)
>  		err = -EINVAL;
>  	}
>  
> -	dma_fence_signal(f1);
> -	dma_fence_signal(f2);
> +	dma_fence_put(f1);
> +	dma_fence_put(f2);
>  	dma_fence_put(chain);
> -	return 0;
> +	return err;
>  }
>  
>  int dma_fence_unwrap(void)
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

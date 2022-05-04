Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18FD65199FF
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 10:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346324AbiEDIlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 04:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbiEDIle (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 04:41:34 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D6C1EC67
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 01:37:59 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id k27so892036edk.4
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 01:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BNL7KIW6kxM9k9cdZBj1imgEmU92+ByIR2+zSIfh3W4=;
        b=XyoCgz7izeRHcOlXJtGaUGLoVwJ3DZignFWDMyoeyOGD8GqeO5CGjR7XUPqzDIpBpc
         txECebQCI6i++1RIhzX9GWHHaf7PilCsO6dj7LorEHwERfZsMUgve7gnAg8RD/sBf+5I
         xde6p/ewPWmU/vO8mtKrbeaCjKuWAet2quBx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BNL7KIW6kxM9k9cdZBj1imgEmU92+ByIR2+zSIfh3W4=;
        b=rKvdUu9pQk+wWPB+RornzH9RaUeS6E2EaqkTjrAjC9F+SEq/Xkb5tzB5+0XlFP5ejY
         wruuaPTTQ1zgRmrb6dW7k+N7WQwbRe+JBZ6rjB+9ABx6AFKhb5AYdChgMWXrt3L7zSmC
         5Av2sHJrhYuyyPyhjSVN6F24yC7eYwZ+F/skSMQ6cSpSJI3x1UqCk/XopmwOOS7asZf8
         iZg0vBNKwhVtcaA/9WQgbiuemamXA/B/ItBHmMTi4r8TdKQnsUKPwcR0HvqThMBT8ip0
         6YiWL1TlDrRYtaNt/PXDF3e0vJmdJJiaU3JHnABbYVwMQb7Dg2t/YuWnduKem5e9vtaa
         A1zA==
X-Gm-Message-State: AOAM531XKmcbX3hsZgz6EwHRKFwYI4NakDd6rQi8yDWOAAoqAFED87bm
        KscQmOZUqJLWaBARCzD+H6iSDA==
X-Google-Smtp-Source: ABdhPJwjIC0uXOv50791ypiDyMq23LCfSaFjItQaS8cd7IEBVAaSbl4zf2R19aljGFnH2PmfR2L4oA==
X-Received: by 2002:aa7:d510:0:b0:427:b7fe:50c7 with SMTP id y16-20020aa7d510000000b00427b7fe50c7mr17116707edq.221.1651653477455;
        Wed, 04 May 2022 01:37:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p14-20020a056402154e00b0042617ba63a8sm8775516edx.50.2022.05.04.01.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:37:56 -0700 (PDT)
Date:   Wed, 4 May 2022 10:37:55 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 2/3] dma-buf: cleanup dma_fence_unwrap implementation and
 selftest
Message-ID: <YnI7Y2betlUEZ1lx@phenom.ffwll.local>
References: <20220426124637.329764-1-christian.koenig@amd.com>
 <20220426124637.329764-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426124637.329764-2-christian.koenig@amd.com>
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

On Tue, Apr 26, 2022 at 02:46:36PM +0200, Christian König wrote:
> Move the code from the inline functions into exported functions.
> 
> While at it also cleanup the the selftests, fix the error handling,
> remove unused functions and stop leaking memory in failed tests.

Can you split this out? At least I'm not seeing why this has to be all
smashed into one patch.
-Daniel

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/Makefile              |  2 +-
>  drivers/dma-buf/dma-fence-unwrap.c    | 59 +++++++++++++++++++++++++++
>  drivers/dma-buf/st-dma-fence-unwrap.c | 40 ++++++++----------
>  include/linux/dma-fence-unwrap.h      | 52 ++---------------------
>  4 files changed, 80 insertions(+), 73 deletions(-)
>  create mode 100644 drivers/dma-buf/dma-fence-unwrap.c
> 
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 4c9eb53ba3f8..70ec901edf2c 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> -	 dma-resv.o
> +	 dma-fence-unwrap.o dma-resv.o
>  obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
>  obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>  obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> new file mode 100644
> index 000000000000..711be125428c
> --- /dev/null
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * dma-fence-util: misc functions for dma_fence objects
> + *
> + * Copyright (C) 2022 Advanced Micro Devices, Inc.
> + * Authors:
> + *	Christian König <christian.koenig@amd.com>
> + */
> +
> +#include <linux/dma-fence.h>
> +#include <linux/dma-fence-array.h>
> +#include <linux/dma-fence-chain.h>
> +#include <linux/dma-fence-unwrap.h>
> +
> +/* Internal helper to start new array iteration, don't use directly */
> +static struct dma_fence *
> +__dma_fence_unwrap_array(struct dma_fence_unwrap *cursor)
> +{
> +	cursor->array = dma_fence_chain_contained(cursor->chain);
> +	cursor->index = 0;
> +	return dma_fence_array_first(cursor->array);
> +}
> +
> +/**
> + * dma_fence_unwrap_first - return the first fence from fence containers
> + * @head: the entrypoint into the containers
> + * @cursor: current position inside the containers
> + *
> + * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
> + * first fence.
> + */
> +struct dma_fence *dma_fence_unwrap_first(struct dma_fence *head,
> +					 struct dma_fence_unwrap *cursor)
> +{
> +	cursor->chain = dma_fence_get(head);
> +	return __dma_fence_unwrap_array(cursor);
> +}
> +EXPORT_SYMBOL_GPL(dma_fence_unwrap_first);
> +
> +/**
> + * dma_fence_unwrap_next - return the next fence from a fence containers
> + * @cursor: current position inside the containers
> + *
> + * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
> + * the next fence from them.
> + */
> +struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
> +{
> +	struct dma_fence *tmp;
> +
> +	++cursor->index;
> +	tmp = dma_fence_array_next(cursor->array, cursor->index);
> +	if (tmp)
> +		return tmp;
> +
> +	cursor->chain = dma_fence_chain_walk(cursor->chain);
> +	return __dma_fence_unwrap_array(cursor);
> +}
> +EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
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
> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
> index 77e335a1bcac..e7c219da4ed7 100644
> --- a/include/linux/dma-fence-unwrap.h
> +++ b/include/linux/dma-fence-unwrap.h
> @@ -1,7 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * fence-chain: chain fences together in a timeline
> - *
>   * Copyright (C) 2022 Advanced Micro Devices, Inc.
>   * Authors:
>   *	Christian König <christian.koenig@amd.com>
> @@ -10,8 +8,7 @@
>  #ifndef __LINUX_DMA_FENCE_UNWRAP_H
>  #define __LINUX_DMA_FENCE_UNWRAP_H
>  
> -#include <linux/dma-fence-chain.h>
> -#include <linux/dma-fence-array.h>
> +struct dma_fence;
>  
>  /**
>   * struct dma_fence_unwrap - cursor into the container structure
> @@ -33,50 +30,9 @@ struct dma_fence_unwrap {
>  	unsigned int index;
>  };
>  
> -/* Internal helper to start new array iteration, don't use directly */
> -static inline struct dma_fence *
> -__dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
> -{
> -	cursor->array = dma_fence_chain_contained(cursor->chain);
> -	cursor->index = 0;
> -	return dma_fence_array_first(cursor->array);
> -}
> -
> -/**
> - * dma_fence_unwrap_first - return the first fence from fence containers
> - * @head: the entrypoint into the containers
> - * @cursor: current position inside the containers
> - *
> - * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
> - * first fence.
> - */
> -static inline struct dma_fence *
> -dma_fence_unwrap_first(struct dma_fence *head, struct dma_fence_unwrap *cursor)
> -{
> -	cursor->chain = dma_fence_get(head);
> -	return __dma_fence_unwrap_array(cursor);
> -}
> -
> -/**
> - * dma_fence_unwrap_next - return the next fence from a fence containers
> - * @cursor: current position inside the containers
> - *
> - * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
> - * the next fence from them.
> - */
> -static inline struct dma_fence *
> -dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
> -{
> -	struct dma_fence *tmp;
> -
> -	++cursor->index;
> -	tmp = dma_fence_array_next(cursor->array, cursor->index);
> -	if (tmp)
> -		return tmp;
> -
> -	cursor->chain = dma_fence_chain_walk(cursor->chain);
> -	return __dma_fence_unwrap_array(cursor);
> -}
> +struct dma_fence *dma_fence_unwrap_first(struct dma_fence *head,
> +					 struct dma_fence_unwrap *cursor);
> +struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
>  
>  /**
>   * dma_fence_unwrap_for_each - iterate over all fences in containers
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

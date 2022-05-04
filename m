Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81E33519B9B
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 11:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343608AbiEDJ2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 05:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347139AbiEDJ15 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 05:27:57 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CF727146
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 02:24:17 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id k27so1013441edk.4
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 02:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=eP7qk9rE+DElEkH+hPMJK20KqOseXBdrVeXk5pAYHcA=;
        b=SGhQbUTK5cVK+fCpl+nPL11ObT4dz9LJGmovY0JUUwjmenfLdoAaMNTv+F9EEVgEbu
         0L8psXLy3dME9Yd85dWKaVzflrVYiNR7J8dKpEtMaoej76KKL26pzXa9KEh0Np4DC0nT
         Dpx1juIrJFh4VlB9+nXXO5iwuVD/qPc2JoPWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=eP7qk9rE+DElEkH+hPMJK20KqOseXBdrVeXk5pAYHcA=;
        b=kvOWnJsRJDoMbcB80eJS+VpJ7IIl79mI/XVKPzsPDceLESGVRPCmv6lLg9SG0kQ3m4
         IIYew6szWFxk4T6feRzp3Sk5skWrsIRPd5V4zZyHqZ7hNpAtyVxghkeNwkR8wzq6GykJ
         /clxO6q6r4KJKLxS1SZwTggZEEIbyRIXAE+YuRbxESsPHPQjwgOQD12Z9cySfNZNaeX7
         aWApTMNJDupm0P48azJsjl9aJyLsNaoSzToVtcfUDWs7brd5HM7YCZ7yfwYElD8f3Loh
         4kIjN9SYG8MUoDVUaj4yRJtqXplXXGV1sFytoRJoP9okfFs0drOwS2LmaYZRkg1l3EpC
         SXkg==
X-Gm-Message-State: AOAM5330Jje5foVGZBMcKZfEFyY433aHDiVLbaEsHNYUObMhY/NlxwEw
        KPx7FNR5GHHW86ECGPrE9Q7cMQ==
X-Google-Smtp-Source: ABdhPJyC0Jl6YQFerFyoeXRBnnEwxZZEVLBTFiw3W03WT0A8vTJDg5BHqaccxA9RZ02laxSPX/4oRg==
X-Received: by 2002:a05:6402:370c:b0:425:a9c4:88c4 with SMTP id ek12-20020a056402370c00b00425a9c488c4mr22349417edb.190.1651656256295;
        Wed, 04 May 2022 02:24:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id g7-20020aa7d1c7000000b0042617ba63b1sm8898052edp.59.2022.05.04.02.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 02:24:15 -0700 (PDT)
Date:   Wed, 4 May 2022 11:24:14 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 3/3] dma-buf: generalize fence merging
Message-ID: <YnJGPo5/lR6WI41X@phenom.ffwll.local>
References: <20220426124637.329764-1-christian.koenig@amd.com>
 <20220426124637.329764-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426124637.329764-3-christian.koenig@amd.com>
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

On Tue, Apr 26, 2022 at 02:46:37PM +0200, Christian K�nig wrote:
> Introduce a dma_fence_merge() macro which allows to unwrap fences which
> potentially can be containers as well and then merge them back together
> into a flat dma_fence_array.
> 
> Signed-off-by: Christian K�nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-unwrap.c    |  95 ++++++++++++++++++++
>  drivers/dma-buf/st-dma-fence-unwrap.c |  47 ++++++++++
>  drivers/dma-buf/sync_file.c           | 119 ++------------------------
>  include/linux/dma-fence-unwrap.h      |  24 ++++++
>  4 files changed, 172 insertions(+), 113 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 711be125428c..c9becc74896d 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -11,6 +11,7 @@
>  #include <linux/dma-fence-array.h>
>  #include <linux/dma-fence-chain.h>
>  #include <linux/dma-fence-unwrap.h>
> +#include <linux/slab.h>
>  
>  /* Internal helper to start new array iteration, don't use directly */
>  static struct dma_fence *
> @@ -57,3 +58,97 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
>  	return __dma_fence_unwrap_array(cursor);
>  }
>  EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
> +
> +/* Implementation for the dma_fence_merge() marco, don't use directly */
> +struct dma_fence *__dma_fence_merge(unsigned int num_fences,
> +				    struct dma_fence **fences,
> +				    struct dma_fence_unwrap *iter)
> +{
> +	struct dma_fence_array *result;
> +	struct dma_fence *tmp, **array;
> +	unsigned int i, count;
> +
> +	count = 0;
> +	for (i = 0; i < num_fences; ++i) {
> +		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
> +			if (!dma_fence_is_signaled(tmp))

So I realized that dma_fence_array don't filter out signalled fences, but
dma_fence_chain does. I wonder whether we shouldn't be more consistent
here and push these checks into dma_fence_unwrap for everyone, and then
also add a huge warning that every time you iterate you might get fewer
fences, since that could lead to surprises :-)

Anyway kinda orthogonal.

> +				++count;
> +	}
> +
> +	if (count == 0)
> +		return dma_fence_get_stub();
> +
> +	if (count > INT_MAX)
> +		return NULL;

If you actually want to make this secure you need to bail out when the
count goes above INT_MAX for the first time, since you might have wrapped
still. It's a bit annoying to fix though since there's no
dma_fence_unwrap_end to clean up the temp references.

> +
> +	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
> +	if (!array)
> +		return NULL;
> +
> +	/*
> +	 * We can't guarantee that inpute fences are ordered by context, but
> +	 * it is still quite likely when this function is used multiple times.
> +	 * So attempt to order the fences by context as we pass over them and
> +	 * merge fences with the same context.
> +	 */
> +	for (i = 0; i < num_fences; ++i)
> +		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);

Maybe add a comment here like "Since this function is only used through
the dma_fence_merge macro we can thrash the argument array and use it as
scratch space" or something like that, I was freaked out for a bit what's
going on here :-)

> +
> +	count = 0;
> +	do {
> +		unsigned int sel;
> +
> +restart:
> +		tmp = NULL;
> +		for (i = 0; i < num_fences; ++i) {
> +			struct dma_fence *next = fences[i];
> +
> +			if (!next || dma_fence_is_signaled(next))
> +				continue;
> +
> +			if (!tmp || tmp->context > next->context) {
> +				tmp = next;
> +				sel = i;
> +
> +			} else if (tmp->context < next->context) {
> +				continue;
> +
> +			} else if (dma_fence_is_later(tmp, next)) {
> +				fences[i] = dma_fence_unwrap_next(&iter[i]);
> +				goto restart;
> +			} else {
> +				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> +				goto restart;
> +			}
> +		}
> +
> +		if (tmp) {
> +			array[count++] = dma_fence_get(tmp);
> +			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> +		}
> +	} while (tmp);
> +
> +	if (count == 0) {
> +		tmp = dma_fence_get_stub();
> +		goto return_tmp;
> +	}
> +
> +	if (count == 1) {
> +		tmp = array[0];
> +		goto return_tmp;
> +	}
> +
> +	result = dma_fence_array_create(count, array,
> +					dma_fence_context_alloc(1),
> +					1, false);
> +	if (!result) {
> +		tmp = NULL;
> +		goto return_tmp;
> +	}
> +	return &result->base;
> +
> +return_tmp:
> +	kfree(array);
> +	return tmp;
> +}
> +EXPORT_SYMBOL_GPL(__dma_fence_merge);
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 59628add93f5..23ab134417ed 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -240,6 +240,52 @@ static int unwrap_chain_array(void *arg)
>  	return err;
>  }
>  
> +static int unwrap_merge(void *arg)
> +{
> +	struct dma_fence *fence, *f1, *f2, *f3;
> +	struct dma_fence_unwrap iter;
> +	int err = 0;
> +
> +	f1 = mock_fence();
> +	if (!f1)
> +		return -ENOMEM;
> +
> +	f2 = mock_fence();
> +	if (!f2) {
> +		err = -ENOMEM;
> +		goto error_put_f1;
> +	}
> +
> +	f3 = dma_fence_merge(f1, f2);
> +	if (!f3) {
> +		err = -ENOMEM;
> +		goto error_put_f2;
> +	}
> +
> +	dma_fence_unwrap_for_each(fence, &iter, f3) {
> +		if (fence == f1) {
> +			f1 = NULL;
> +		} else if (fence == f2) {
> +			f2 = NULL;
> +		} else {
> +			pr_err("Unexpected fence!\n");
> +			err = -EINVAL;
> +		}
> +	}
> +
> +	if (f1 || f2) {
> +		pr_err("Not all fences seen!\n");
> +		err = -EINVAL;
> +	}
> +
> +	dma_fence_put(f3);
> +error_put_f2:
> +	dma_fence_put(f2);
> +error_put_f1:
> +	dma_fence_put(f1);
> +	return err;
> +}

This doesn't really exercise any of the interesting cases in your merge
loop, i.e. when there's multiple fences on the same timeline from
different containters. Would be good to exercise these cases too, since it
took me a while to understand what you're doing.

> +
>  int dma_fence_unwrap(void)
>  {
>  	static const struct subtest tests[] = {
> @@ -247,6 +293,7 @@ int dma_fence_unwrap(void)
>  		SUBTEST(unwrap_array),
>  		SUBTEST(unwrap_chain),
>  		SUBTEST(unwrap_chain_array),
> +		SUBTEST(unwrap_merge),
>  	};
>  
>  	return subtests(tests, NULL);
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index 0fe564539166..fe149d7e3ce2 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -146,50 +146,6 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
>  	return buf;
>  }
>  
> -static int sync_file_set_fence(struct sync_file *sync_file,
> -			       struct dma_fence **fences, int num_fences)
> -{
> -	struct dma_fence_array *array;
> -
> -	/*
> -	 * The reference for the fences in the new sync_file and held
> -	 * in add_fence() during the merge procedure, so for num_fences == 1
> -	 * we already own a new reference to the fence. For num_fence > 1
> -	 * we own the reference of the dma_fence_array creation.
> -	 */
> -
> -	if (num_fences == 0) {
> -		sync_file->fence = dma_fence_get_stub();
> -		kfree(fences);
> -
> -	} else if (num_fences == 1) {
> -		sync_file->fence = fences[0];
> -		kfree(fences);
> -
> -	} else {
> -		array = dma_fence_array_create(num_fences, fences,
> -					       dma_fence_context_alloc(1),
> -					       1, false);
> -		if (!array)
> -			return -ENOMEM;
> -
> -		sync_file->fence = &array->base;
> -	}
> -
> -	return 0;
> -}
> -
> -static void add_fence(struct dma_fence **fences,
> -		      int *i, struct dma_fence *fence)
> -{
> -	fences[*i] = fence;
> -
> -	if (!dma_fence_is_signaled(fence)) {
> -		dma_fence_get(fence);
> -		(*i)++;
> -	}
> -}
> -
>  /**
>   * sync_file_merge() - merge two sync_files
>   * @name:	name of new fence
> @@ -203,84 +159,21 @@ static void add_fence(struct dma_fence **fences,
>  static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>  					 struct sync_file *b)
>  {
> -	struct dma_fence *a_fence, *b_fence, **fences;
> -	struct dma_fence_unwrap a_iter, b_iter;
> -	unsigned int index, num_fences;
>  	struct sync_file *sync_file;
> +	struct dma_fence *fence;
>  
>  	sync_file = sync_file_alloc();
>  	if (!sync_file)
>  		return NULL;
>  
> -	num_fences = 0;
> -	dma_fence_unwrap_for_each(a_fence, &a_iter, a->fence)
> -		++num_fences;
> -	dma_fence_unwrap_for_each(b_fence, &b_iter, b->fence)
> -		++num_fences;
> -
> -	if (num_fences > INT_MAX)
> -		goto err_free_sync_file;
> -
> -	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
> -	if (!fences)
> -		goto err_free_sync_file;
> -
> -	/*
> -	 * We can't guarantee that fences in both a and b are ordered, but it is
> -	 * still quite likely.
> -	 *
> -	 * So attempt to order the fences as we pass over them and merge fences
> -	 * with the same context.
> -	 */
> -
> -	index = 0;
> -	for (a_fence = dma_fence_unwrap_first(a->fence, &a_iter),
> -	     b_fence = dma_fence_unwrap_first(b->fence, &b_iter);
> -	     a_fence || b_fence; ) {
> -
> -		if (!b_fence) {
> -			add_fence(fences, &index, a_fence);
> -			a_fence = dma_fence_unwrap_next(&a_iter);
> -
> -		} else if (!a_fence) {
> -			add_fence(fences, &index, b_fence);
> -			b_fence = dma_fence_unwrap_next(&b_iter);
> -
> -		} else if (a_fence->context < b_fence->context) {
> -			add_fence(fences, &index, a_fence);
> -			a_fence = dma_fence_unwrap_next(&a_iter);
> -
> -		} else if (b_fence->context < a_fence->context) {
> -			add_fence(fences, &index, b_fence);
> -			b_fence = dma_fence_unwrap_next(&b_iter);
> -
> -		} else if (__dma_fence_is_later(a_fence->seqno, b_fence->seqno,
> -						a_fence->ops)) {
> -			add_fence(fences, &index, a_fence);
> -			a_fence = dma_fence_unwrap_next(&a_iter);
> -			b_fence = dma_fence_unwrap_next(&b_iter);
> -
> -		} else {
> -			add_fence(fences, &index, b_fence);
> -			a_fence = dma_fence_unwrap_next(&a_iter);
> -			b_fence = dma_fence_unwrap_next(&b_iter);
> -		}
> +	fence = dma_fence_merge(a->fence, b->fence);
> +	if (!fence) {
> +		fput(sync_file->file);
> +		return NULL;
>  	}
> -
> -	if (sync_file_set_fence(sync_file, fences, index) < 0)
> -		goto err_put_fences;
> -
> +	sync_file->fence = fence;
>  	strlcpy(sync_file->user_name, name, sizeof(sync_file->user_name));
>  	return sync_file;
> -
> -err_put_fences:
> -	while (index)
> -		dma_fence_put(fences[--index]);
> -	kfree(fences);
> -
> -err_free_sync_file:
> -	fput(sync_file->file);
> -	return NULL;
>  }
>  
>  static int sync_file_release(struct inode *inode, struct file *file)
> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
> index e7c219da4ed7..7c0fab318301 100644
> --- a/include/linux/dma-fence-unwrap.h
> +++ b/include/linux/dma-fence-unwrap.h
> @@ -48,4 +48,28 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
>  	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
>  	     fence = dma_fence_unwrap_next(cursor))
>  
> +struct dma_fence *__dma_fence_merge(unsigned int num_fences,
> +				    struct dma_fence **fences,
> +				    struct dma_fence_unwrap *cursors);
> +
> +/**
> + * dma_fence_merge - unwrap and merge fences
> + *
> + * All fences given as parameters are unwrapped and merged back together as flat
> + * dma_fence_array. Useful if multiple containers need to be merged together.
> + *
> + * Implemented as a macro to allocate the necessary arrays on the stack and
> + * account the stack frame size to the caller.
> + *
> + * Returns NULL on memory allocation failure, a dma_fence object representing
> + * all the given fences otherwise.
> + */
> +#define dma_fence_merge(...)					\
> +	({							\
> +		struct dma_fence *__f[] = { __VA_ARGS__ };	\
> +		struct dma_fence_unwrap __c[ARRAY_SIZE(__f)];	\
> +								\
> +		__dma_fence_merge(ARRAY_SIZE(__f), __f, __c);	\

This is fancy :-)

Aside from the nits lgtm and should be useful.
-Daniel

> +	})
> +
>  #endif
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDF5F97FA5
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 18:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbfHUQFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 12:05:00 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39946 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbfHUQFA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 12:05:00 -0400
Received: by mail-ed1-f68.google.com with SMTP id h8so3545475edv.7
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 09:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=PQJzaKCMOyJ9cU3DjRwvUQW5X0QqM3/O0kDiRQb5Fws=;
        b=EL8c2Kjeg/3PdUXDP426h6rXAU9ZHvTlfR6UKJaur5GqpZKBEEqvA38G5oqyB95yU0
         IREqeCTr+s9FBNyaAxmfOyUiwAeCNqAppyjLDs0q3oQtQBwS5fmB+ET1kNasO5Gwz97+
         OBWoEX0tN8p7drJexvFCn/OMITNqrOvZ251RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=PQJzaKCMOyJ9cU3DjRwvUQW5X0QqM3/O0kDiRQb5Fws=;
        b=b7uBTairl89boNTyp7532ckBiVej0gMegJpGGALb4YX/jIBKayiATyvSRtlvOt1BQq
         Mg5hoot29+USS0Ci4k+msGN7b+n4q4F0mWFSyBoRIK+R0VNWJmZU9TpycKIBoTl5N8uz
         1qxbpCI2WI3W4Ec0aBUCHAxVIuddAk9c5EHrj8Tz8M5GfPEcJPcJ9gbmZClJM05iw8bC
         XXqSAJKlp1AJP+pwT03GASoL5U6MgIvMbNJ5XVyDkSgGSqcEqqBTVqMt0UcBa/JoD76S
         SyMoCxVVf8isUMr4Vysosa5MJhUrZkpZc41jamnURuMb+Lqgf3Z5hFbHKeGEtauaS1SN
         ONDA==
X-Gm-Message-State: APjAAAUtcwogZalLbq58y/JY2S17eQE2UwmRxqBIHvyFoMNR7h4/2ROn
        r0/aphLeLAWOAVsQd8nI6eGYzg==
X-Google-Smtp-Source: APXvYqzfBlG84lxHLAw426uNJramGTgcjxmP98IF3UpKL+sGMYXE31acDeKoLVmTgmziF7MVHCmc4g==
X-Received: by 2002:a17:906:254f:: with SMTP id j15mr31543641ejb.69.1566403497424;
        Wed, 21 Aug 2019 09:04:57 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id ay8sm3203806ejb.4.2019.08.21.09.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 09:04:56 -0700 (PDT)
Date:   Wed, 21 Aug 2019 18:04:54 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 07/10] dma-buf/resv: add new fences container
 implementation
Message-ID: <20190821160454.GN11147@phenom.ffwll.local>
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-8-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190821123147.110736-8-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 21, 2019 at 02:31:44PM +0200, Christian König wrote:
> Add a new container for fences which internally uses
> dma_fence_array's to store the fences.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 221 +++++++++++++++++++++++++++++++++++++
>  include/linux/dma-resv.h   |  49 ++++++++
>  2 files changed, 270 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index d3a9a3bb15f0..83033b3e8521 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -33,6 +33,7 @@
>   */
>  
>  #include <linux/dma-resv.h>
> +#include <linux/dma-fence-array.h>
>  #include <linux/export.h>
>  
>  /**
> @@ -55,6 +56,226 @@ EXPORT_SYMBOL(reservation_seqcount_class);
>  const char reservation_seqcount_string[] = "reservation_seqcount";
>  EXPORT_SYMBOL(reservation_seqcount_string);
>  
> +static void dma_resv_fences_init(struct dma_resv_fences *fences)
> +{
> +	RCU_INIT_POINTER(fences->fence, NULL);
> +	fences->staged = NULL;
> +}
> +
> +static void dma_resv_fences_fini(struct dma_resv_fences *fences)
> +{
> +	/*
> +	 * This object should be dead and all references must have
> +	 * been released to it, so no need to be protected with rcu.
> +	 */
> +	dma_fence_put(rcu_dereference_protected(fences->fence, true));
> +	dma_fence_array_free(fences->staged);
> +}
> +
> +/**
> + * dma_resv_fences_reserve - allocate fence slots
> + * @fences: fences object where we need slots
> + * @num_fences: number of fence slots we need
> + *
> + * Make sure that we have at least @num_fences + all the existing ones free
> + * slots in the staged dma_fence_array.
> + *
> + * Returns -ENOMEM on allocation failure, 0 otherwise.
> + */
> +int dma_resv_fences_reserve(struct dma_resv *obj,
> +			    struct dma_resv_fences *fences,
> +			    unsigned int num_fences)
> +{
> +	struct dma_fence *fence = dma_resv_fences_deref(obj, fences);
> +	struct dma_fence_array *staged, *array;
> +	unsigned int i;
> +
> +	array = fences->staged;
> +	if (!array)
> +		array = to_dma_fence_array(fence);
> +
> +	if (array)
> +		num_fences += array->num_fences;
> +	else if (fence)
> +		num_fences += 1;
> +
> +	staged = fences->staged;
> +	if (staged && dma_fence_array_max_fences(staged) >= num_fences)
> +		return 0;
> +
> +	staged = dma_fence_array_alloc(num_fences, NULL);
> +	if (!staged)
> +		return -ENOMEM;
> +
> +	/* Copy over all fences from the old object */
> +	if (array) {
> +		for (i = 0; i < array->num_fences; ++i) {
> +			struct dma_fence *f = array->fences[i];
> +
> +			staged->fences[i] = dma_fence_get(f);
> +		}
> +		staged->num_fences = array->num_fences;
> +
> +	} else if (fence) {
> +		staged->fences[0] = dma_fence_get(fence);
> +		staged->num_fences = 1;
> +
> +	} else {
> +		staged->num_fences = 0;
> +	}
> +
> +	dma_fence_array_free(fences->staged);
> +	fences->staged = staged;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(dma_resv_fences_reserve);
> +
> +/**
> + * dma_resv_fences_assign - set the singleton fence
> + * @fences: fences object where to set the fence
> + * @fence: singleton fence for the object
> + *
> + * Internal helper to assign the signleton fence without grapping a reference.
> + * If the old fence is a dma_fence_array try to recycle it.
> + */
> +static void dma_resv_fences_assign(struct dma_resv *obj,
> +				   struct dma_resv_fences *fences,
> +				   struct dma_fence *fence)
> +{
> +	struct dma_fence_array *array, *staged;
> +	unsigned int num_fences, i;
> +	struct dma_fence *old;
> +
> +	old = dma_resv_fences_deref(obj, fences);
> +	rcu_assign_pointer(fences->fence, fence);
> +
> +	dma_fence_array_free(fences->staged);
> +	fences->staged = NULL;
> +
> +	/* Try to recycle the old fence array */
> +	staged = to_dma_fence_array(old);
> +	if (!staged)
> +		goto drop_old;
> +
> +	array = to_dma_fence_array(fence);
> +	if (array)
> +		num_fences = array->num_fences;
> +	else
> +		num_fences = fence ? 1 : 0;
> +
> +	if (dma_fence_array_max_fences(staged) < num_fences)
> +		goto drop_old;
> +
> +	/* Try to drop the last reference */
> +	if (!dma_fence_array_recycle(staged))

Without an rcu barrier here you're not syncing to new clients at all.
I don't think this works, and I expect that once you've readded all the
barriers and retry loops we're back to seqlocks.
-Daniel

> +		return;
> +
> +	/* Make sure the staged array has the latest fences */
> +	if (array) {
> +		for (i = 0; i < array->num_fences; ++i) {
> +			struct dma_fence *f = array->fences[i];
> +
> +			if (f == staged->fences[i])
> +				continue;
> +
> +			dma_fence_put(staged->fences[i]);
> +			staged->fences[i] = dma_fence_get(f);
> +		}
> +		for (;i < staged->num_fences; ++i)
> +			dma_fence_put(staged->fences[i]);
> +		staged->num_fences = array->num_fences;
> +
> +	} else if (fence) {
> +		for (i = 0; i < staged->num_fences; ++i)
> +			dma_fence_put(staged->fences[i]);
> +		staged->fences[0] = dma_fence_get(fence);
> +		staged->num_fences = 1;
> +	} else {
> +		for (i = 0; i < staged->num_fences; ++i)
> +			dma_fence_put(staged->fences[i]);
> +		staged->num_fences = 0;
> +	}
> +
> +	fences->staged = staged;
> +	return;
> +
> +drop_old:
> +	dma_fence_put(old);
> +}
> +
> +/**
> + * dma_resv_fences_set - set the singleton fence
> + * @fences: fences object where to set the fence
> + * @fence: singleton fence for the object
> + *
> + * Grabs a reference to the new fence and replaces the current singleton fence
> + * with a new one. If the old fence is a dma_fence_array try to recycle it.
> + */
> +void dma_resv_fences_set(struct dma_resv *obj,
> +			 struct dma_resv_fences *fences,
> +			 struct dma_fence *fence)
> +{
> +	dma_fence_get(fence);
> +	dma_resv_fences_assign(obj, fences, fence);
> +}
> +EXPORT_SYMBOL(dma_resv_fences_set);
> +
> +/**
> + * dma_resv_fences_add - add a fence to the staged fence_array
> + * @fences: fences object where to add the fence to
> + * @fence: fence to add
> + *
> + * Add a new fence to the staged fence_array.
> + */
> +void dma_resv_fences_add(struct dma_resv_fences *fences,
> +			 struct dma_fence *fence)
> +{
> +	struct dma_fence_array *staged = fences->staged;
> +	struct dma_fence *old;
> +	unsigned int i;
> +
> +#ifndef CONFIG_DEBUG_MUTEXES
> +	for (i = 0; i < staged->num_fences; ++i) {
> +		old = staged->fences[i];
> +
> +		if (old->context == fence->context ||
> +		    dma_fence_is_signaled(old)) {
> +			dma_fence_put(old);
> +			goto replace;
> +		}
> +	}
> +#endif
> +
> +	BUG_ON(staged->num_fences >= dma_fence_array_max_fences(staged));
> +	i = staged->num_fences++;
> +
> +replace:
> +	staged->fences[i] = dma_fence_get(fence);
> +}
> +EXPORT_SYMBOL(dma_resv_fences_add);
> +
> +/**
> + * dma_resv_fences_commit - commit the staged dma_fence_array
> + * @fences: fences object where the commit should happen
> + *
> + * Commit the fences staged in the dma_fence_array and make them visible to
> + * other threads.
> + */
> +void dma_resv_fences_commit(struct dma_resv *obj,
> +			    struct dma_resv_fences *fences)
> +{
> +	struct dma_fence_array *staged = fences->staged;
> +
> +	if (!staged || !staged->num_fences)
> +		return;
> +
> +	fences->staged = NULL;
> +	dma_fence_array_init(staged, dma_fence_context_alloc(1), 1, false);
> +	dma_resv_fences_assign(obj, fences, &staged->base);
> +}
> +EXPORT_SYMBOL(dma_resv_fences_commit);
> +
>  /**
>   * dma_resv_list_alloc - allocate fence list
>   * @shared_max: number of fences we need space for
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 03b0f95682b0..c70f13fa6789 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -45,10 +45,33 @@
>  #include <linux/seqlock.h>
>  #include <linux/rcupdate.h>
>  
> +struct dma_resv;
> +
>  extern struct ww_class reservation_ww_class;
>  extern struct lock_class_key reservation_seqcount_class;
>  extern const char reservation_seqcount_string[];
>  
> +/**
> + * struct dma_resv_fences - fences inside a reservation object
> + * @fence: the current RCU protected singleton fence
> + * @staged: optional staged dma_fence_array to replace @fence
> + */
> +struct dma_resv_fences {
> +	struct dma_fence __rcu *fence;
> +	struct dma_fence_array *staged;
> +};
> +
> +int dma_resv_fences_reserve(struct dma_resv *obj,
> +			    struct dma_resv_fences *fences,
> +			    unsigned int num_fences);
> +void dma_resv_fences_set(struct dma_resv *obj,
> +			 struct dma_resv_fences *fences,
> +			 struct dma_fence *fence);
> +void dma_resv_fences_add(struct dma_resv_fences *fences,
> +			 struct dma_fence *fence);
> +void dma_resv_fences_commit(struct dma_resv *obj,
> +			    struct dma_resv_fences *fences);
> +
>  /**
>   * struct dma_resv_list - a list of shared fences
>   * @rcu: for internal use
> @@ -80,6 +103,32 @@ struct dma_resv {
>  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>  
> +/**
> + * dma_resv_fences_deref - get singleton fence
> + * @obj: the reservation object
> + * @fences: the fences object
> + *
> + * Returns the singleton fence from a resv_fences object.
> + */
> +static inline struct dma_fence *
> +dma_resv_fences_deref(struct dma_resv *obj, struct dma_resv_fences *fences)
> +{
> +	return rcu_dereference_protected(fences->fence,
> +					 dma_resv_held(obj));
> +}
> +
> +/**
> + * dma_resv_fences_get_rcu - RCU get single fence
> + * @fences: fences structure where we need to get a reference for
> + *
> + * Get a reference to the single fence representing the synchronization.
> + */
> +static inline struct dma_fence *
> +dma_resv_fences_get_rcu(struct dma_resv_fences *fences)
> +{
> +	return dma_fence_get_rcu_safe(&fences->fence);
> +}
> +
>  /**
>   * dma_resv_get_list - get the reservation object's
>   * shared fence list, with update-side lock held
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

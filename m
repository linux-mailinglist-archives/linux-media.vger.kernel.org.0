Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8FA02B6E2C
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 20:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbgKQTLj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 14:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgKQTLi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 14:11:38 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F409C0617A6
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 11:11:38 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h21so4286626wmb.2
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 11:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hu7bOYUgtnFLMBiA1U9xKBu85h7yzSk1KLbNCN463rI=;
        b=X5xkpElnuKlOphb7oubo5uykS6+OI+php6jhCFtFcZhmtzzwWArV8Df6/gG5zzJ117
         AYrkJBx9rLECsYAk6+Z/lS3xFE5GUhpCTUDLmj4v406RilyJDbUB9Uyu+0VSDGYgvm2l
         jukkd1AGe1UjqosgfxOcW7pjmYpNky0Zfc6wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=hu7bOYUgtnFLMBiA1U9xKBu85h7yzSk1KLbNCN463rI=;
        b=PRxms6TTXII2sBvXo3ZKvCOP3E8n/TD4PlalGfPVOBaFHsi//WXj9b8GpV+g548nSJ
         mbH52+b5YynG8YVQtmiF/lEL9nUL66onG0UN0yVrOQJ5UOJH3YLEk3GjINwUuJJmOE/K
         W9UrR6nkSJmVdDlK5SPrzy+21Yt0kFTtRp+sTwz6enhMcLbwiXNICPTMf7C9f5MBCCd6
         zzLxBEUfxbjayTN5bn6lRpmWUoCDBIxGHrtsUqZEuYJCK1YjuYwjaHs60JVFhxPTeEwu
         N+O8Op17fbBTCbLTsq/z7Dam2uFtbx70a7pJR/QTpuQRISHzelVI/er1916GAm1dllps
         PrIQ==
X-Gm-Message-State: AOAM532z7mwc3fITDznhbo+ZQXu0vJdBC6SMmvr7jRETDhEpf49Jfx4B
        H7lKLjMPhPvs/WdxV6NXetvo8w==
X-Google-Smtp-Source: ABdhPJwbYqX7pbIz2K9J0KeaqAR4C73oOOuRTBZ3QqO4swjxEvr2VoxyUPHO42dNRwlmR9/xM6NPWg==
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr604240wmj.41.1605640297385;
        Tue, 17 Nov 2020 11:11:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a14sm4774135wmj.40.2020.11.17.11.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 11:11:36 -0800 (PST)
Date:   Tue, 17 Nov 2020 20:11:34 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 31/42] drm/ttm/ttm_bo: Fix one function header - demote
 lots of kernel-doc abuses
Message-ID: <20201117191134.GR401619@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-32-lee.jones@linaro.org>
 <7745c8a0-12ad-8dcd-3740-51c640ea4ef2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7745c8a0-12ad-8dcd-3740-51c640ea4ef2@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 16, 2020 at 09:33:48PM +0100, Christian K�nig wrote:
> Am 16.11.20 um 18:41 schrieb Lee Jones:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >   drivers/gpu/drm/ttm/ttm_bo.c:51: warning: Function parameter or member 'ttm_global_mutex' not described in 'DEFINE_MUTEX'
> >   drivers/gpu/drm/ttm/ttm_bo.c:286: warning: Function parameter or member 'bo' not described in 'ttm_bo_cleanup_memtype_use'
> >   drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'bo' not described in 'ttm_bo_cleanup_refs'
> >   drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'interruptible' not described in 'ttm_bo_cleanup_refs'
> >   drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'no_wait_gpu' not described in 'ttm_bo_cleanup_refs'
> >   drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'unlock_resv' not described in 'ttm_bo_cleanup_refs'
> >   drivers/gpu/drm/ttm/ttm_bo.c:424: warning: Function parameter or member 'bdev' not described in 'ttm_bo_delayed_delete'
> >   drivers/gpu/drm/ttm/ttm_bo.c:424: warning: Function parameter or member 'remove_all' not described in 'ttm_bo_delayed_delete'
> >   drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'bo' not described in 'ttm_bo_evict_swapout_allowable'
> >   drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'ctx' not described in 'ttm_bo_evict_swapout_allowable'
> >   drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'locked' not described in 'ttm_bo_evict_swapout_allowable'
> >   drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'busy' not described in 'ttm_bo_evict_swapout_allowable'
> >   drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'bo' not described in 'ttm_bo_add_move_fence'
> >   drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'man' not described in 'ttm_bo_add_move_fence'
> >   drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'mem' not described in 'ttm_bo_add_move_fence'
> >   drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'no_wait_gpu' not described in 'ttm_bo_add_move_fence'
> >   drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'bo' not described in 'ttm_bo_mem_force_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'place' not described in 'ttm_bo_mem_force_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'mem' not described in 'ttm_bo_mem_force_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'ctx' not described in 'ttm_bo_mem_force_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'bo' not described in 'ttm_bo_mem_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'placement' not described in 'ttm_bo_mem_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'mem' not described in 'ttm_bo_mem_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'ctx' not described in 'ttm_bo_mem_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:1387: warning: Function parameter or member 'ctx' not described in 'ttm_bo_swapout'
> > 
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Huang Rui <ray.huang@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> Reviewed-by: Christian K�nig <christian.koenig@amd.com>
> 
> Going to pick that one up for upstreaming.

I mass applied this pile, so also this one. Thanks for patch&review.
-Daniel

> 
> Thanks,
> Christian.
> 
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo.c | 23 ++++++++++++-----------
> >   1 file changed, 12 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index e6bcbfe530ecc..9a03c7834b1ed 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -45,7 +45,7 @@
> >   static void ttm_bo_global_kobj_release(struct kobject *kobj);
> > -/**
> > +/*
> >    * ttm_global_mutex - protecting the global BO state
> >    */
> >   DEFINE_MUTEX(ttm_global_mutex);
> > @@ -278,7 +278,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
> >   	return ret;
> >   }
> > -/**
> > +/*
> >    * Call bo::reserved.
> >    * Will release GPU memory type usage on destruction.
> >    * This is the place to put in driver specific hooks to release
> > @@ -352,9 +352,10 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
> >    * Must be called with lru_lock and reservation held, this function
> >    * will drop the lru lock and optionally the reservation lock before returning.
> >    *
> > - * @interruptible         Any sleeps should occur interruptibly.
> > - * @no_wait_gpu           Never wait for gpu. Return -EBUSY instead.
> > - * @unlock_resv           Unlock the reservation lock as well.
> > + * @bo:                    The buffer object to clean-up
> > + * @interruptible:         Any sleeps should occur interruptibly.
> > + * @no_wait_gpu:           Never wait for gpu. Return -EBUSY instead.
> > + * @unlock_resv:           Unlock the reservation lock as well.
> >    */
> >   static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
> > @@ -420,7 +421,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
> >   	return 0;
> >   }
> > -/**
> > +/*
> >    * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
> >    * encountered buffers.
> >    */
> > @@ -628,7 +629,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
> >   }
> >   EXPORT_SYMBOL(ttm_bo_eviction_valuable);
> > -/**
> > +/*
> >    * Check the target bo is allowable to be evicted or swapout, including cases:
> >    *
> >    * a. if share same reservation object with ctx->resv, have assumption
> > @@ -767,7 +768,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> >   	return ret;
> >   }
> > -/**
> > +/*
> >    * Add the last move fence to the BO and reserve a new shared slot.
> >    */
> >   static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
> > @@ -803,7 +804,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
> >   	return 0;
> >   }
> > -/**
> > +/*
> >    * Repeatedly evict memory from the LRU for @mem_type until we create enough
> >    * space, or we've evicted everything and there isn't enough space.
> >    */
> > @@ -865,7 +866,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
> >   	return 0;
> >   }
> > -/**
> > +/*
> >    * Creates space for memory region @mem according to its type.
> >    *
> >    * This function first searches for free space in compatible memory types in
> > @@ -1430,7 +1431,7 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
> >   }
> >   EXPORT_SYMBOL(ttm_bo_wait);
> > -/**
> > +/*
> >    * A buffer object shrink method that tries to swap out the first
> >    * buffer object on the bo_global::swap_lru list.
> >    */
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

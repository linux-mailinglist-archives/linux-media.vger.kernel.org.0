Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0E440FAD0
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 16:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236689AbhIQOyF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 10:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236570AbhIQOxu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 10:53:50 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C65BC061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 07:52:28 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id j13so31047513edv.13
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4qS+tt3C0ZYNclfI1pgK07MNXYZAOvx318h8HoEwcCo=;
        b=M63t4yL9jhyjtLRv25j1Pdh3L7uyIp0PM0PgJt617pbRTm5S2so9t1OyjSB7OhXujz
         isPuBItyjFDPMWD0mdzKWkDjHZMfLlS4QjQF+ljDB0fa3DORQ7+vYZOOxJBQEqLZnjkQ
         cvlJwZ33rt3pXoBKRVaLkWC3v00VVpAnM4NJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4qS+tt3C0ZYNclfI1pgK07MNXYZAOvx318h8HoEwcCo=;
        b=ZSzpexL3659EODuitb8thqDGLrcnJBCXEaCFFmN1MXKS49fvFddUScypvcrUl33Aik
         W3IT9oEef+nclKu/eNfQ7AcNJalaIv7gYVEAot1KylG7bk+z5z+YoXyPyakPAt/wrCo9
         jfsLImLUVxq5ZMxm7EDb1SdwXQ/zyBLHR2+SUJqDQVJwGcmOBgTpK96cnwNka71cTj5M
         +d8BA3CZd+vORUTcsfJqsUNIVb9KtbQBV5kzK+z6MCjvIt8QrdwMzmHcxJUMBnSwTsTM
         EfUmkvJj0Wz9542G1LVLt75r17wbpYsUns9Ov+m32ni2MiPmAUMmXeiBFQ/0hnh/JOp/
         i/Lg==
X-Gm-Message-State: AOAM530mJkxBz3mjpteIUYo05x8nzwTuv0MuLeDLVNujiSLWP6S+0Jnm
        qIYCqJKm8FF3VAkTUeLZDJVAYw==
X-Google-Smtp-Source: ABdhPJxeDJzAFZPXsUaCi7oxKwLot8V1c/M4K6oO/Es12uIBRQqDR7eOJksrtVTsBbZW+ZgscxxfPg==
X-Received: by 2002:a50:fa89:: with SMTP id w9mr13216244edr.113.1631890346738;
        Fri, 17 Sep 2021 07:52:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w5sm2424958ejz.25.2021.09.17.07.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 07:52:26 -0700 (PDT)
Date:   Fri, 17 Sep 2021 16:52:24 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: Re: [PATCH 12/26] drm/scheduler: use new iterator in
 drm_sched_job_add_implicit_dependencies v2
Message-ID: <YUSrqLa5IoXuxS1y@phenom.ffwll.local>
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-13-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917123513.1106-13-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 17, 2021 at 02:34:59PM +0200, Christian König wrote:
> Simplifying the code a bit.
> 
> v2: use dma_resv_for_each_fence
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 042c16b5d54a..5bc5f775abe1 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -699,30 +699,16 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>  					    struct drm_gem_object *obj,
>  					    bool write)
>  {
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
>  	int ret;
> -	struct dma_fence **fences;
> -	unsigned int i, fence_count;
> -
> -	if (!write) {
> -		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
> -
> -		return drm_sched_job_add_dependency(job, fence);
> -	}
> -
> -	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
> -	if (ret || !fence_count)
> -		return ret;
>  
> -	for (i = 0; i < fence_count; i++) {
> -		ret = drm_sched_job_add_dependency(job, fences[i]);
> +	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {

Hah I got tricked reading your 2nd patch, the iter_begin() is included and
we don't need iter_end for this. Please correct my comments for patch 2
:-)

On this as-is:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +		ret = drm_sched_job_add_dependency(job, fence);
>  		if (ret)
> -			break;
> +			return ret;
>  	}
> -
> -	for (; i < fence_count; i++)
> -		dma_fence_put(fences[i]);
> -	kfree(fences);
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB4C6CF5F4
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 11:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729767AbfJHJZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 05:25:57 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34401 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729440AbfJHJZ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 05:25:57 -0400
Received: by mail-ed1-f65.google.com with SMTP id p10so15033260edq.1
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8FLTNDeQpw5ic8RVn6DsnVa758Xb9dG4nxfxq0sKO2E=;
        b=LAZ46mJUFAxcnWOyo+nJpPksfRTymGrZL6YYd+E7a+cjrRURnGcoF6tYsGF/NUCFT+
         e1MS6jNo3DWKh0PAxOG0QL72CXSoMolMNu2qvX/p7ubl3LSBto/qHVvPn5MN6KYnlY/X
         CJ4yTrWPX2y4MzrTK3h+DfQDr8/xcyWDvi6KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=8FLTNDeQpw5ic8RVn6DsnVa758Xb9dG4nxfxq0sKO2E=;
        b=l3YM/ZStXFnj2KcMhp0TeeI7Pv1U8toGkn71yy5Jr2oadGUvDyshiP9zPXhysw3kgw
         TqN2OeJD1wDgYG8NbpqAYOL558a9uGwimZvt17JGikeuGQF2gTGDercv7AX+sDdf0NZ2
         Psfn4k683R05GvB9jTlAbpuI8wt74S8noo0atRKdJaHU6QrXaKLf4By+l6uWXf0Az85V
         idkH+fGhrxoAY3PKEJ5OKQVr0kGy6ave8zRaJUdGNOuzsRjD9DiyUj2+TdxeaheHtZ21
         M/vAvfVACrhd78CbDRakad5m5qB9+U3vxQ4A/IlTvdpYZyRZczCoWWQNXDaEKNcFaua+
         eWew==
X-Gm-Message-State: APjAAAWl9OhwMSO5Y/BPHuqt6IIo+co637WHLR6z586Aqt5qChGDO86O
        bEN/d7+RE1hysMqf+TTpwlYS8w==
X-Google-Smtp-Source: APXvYqxZSLLTGUD1CwFlRjRk0T91rOBLKbkbtn+YdWvMVYfBnJL3PUkaczNDbRLz4gJs02C4wNw6yw==
X-Received: by 2002:a17:906:b298:: with SMTP id q24mr27677774ejz.168.1570526755266;
        Tue, 08 Oct 2019 02:25:55 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id g15sm3721014edp.0.2019.10.08.02.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 02:25:54 -0700 (PDT)
Date:   Tue, 8 Oct 2019 11:25:52 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/ttm: use the parent resv for ghost objects v2
Message-ID: <20191008092552.GG16989@phenom.ffwll.local>
References: <20190829142917.13058-1-christian.koenig@amd.com>
 <20190829142917.13058-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190829142917.13058-3-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 29, 2019 at 04:29:15PM +0200, Christian König wrote:
> This way we can even pipeline imported BO evictions.
> 
> v2: Limit this to only cases when the parent object uses a separate
>     reservation object as well. This fixes another OOM problem.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Since I read quite a bit of ttm I figured I'll review this too, but I'm
totally lost. And git blame gives me at best commits with one-liner commit
messages, and the docs aren't explaining much at all either (and generally
they didn't get updated at all with all the changes in the past years). 

I have a vague idea of what you're doing here, but not enough to do review
with any confidence. And from other ttm patches from amd it feels a lot
like we have essentially a bus factor of 1 for all things ttm :-/
-Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index fe81c565e7ef..2ebe9fe7f6c8 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -517,7 +517,9 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>  	kref_init(&fbo->base.kref);
>  	fbo->base.destroy = &ttm_transfered_destroy;
>  	fbo->base.acc_size = 0;
> -	fbo->base.base.resv = &fbo->base.base._resv;
> +	if (bo->base.resv == &bo->base._resv)
> +		fbo->base.base.resv = &fbo->base.base._resv;
> +
>  	dma_resv_init(fbo->base.base.resv);
>  	ret = dma_resv_trylock(fbo->base.base.resv);
>  	WARN_ON(!ret);
> @@ -716,7 +718,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>  		if (ret)
>  			return ret;
>  
> -		dma_resv_add_excl_fence(ghost_obj->base.resv, fence);
> +		dma_resv_add_excl_fence(&ghost_obj->base._resv, fence);
>  
>  		/**
>  		 * If we're not moving to fixed memory, the TTM object
> @@ -729,7 +731,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>  		else
>  			bo->ttm = NULL;
>  
> -		ttm_bo_unreserve(ghost_obj);
> +		dma_resv_unlock(&ghost_obj->base._resv);
>  		ttm_bo_put(ghost_obj);
>  	}
>  
> @@ -772,7 +774,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
>  		if (ret)
>  			return ret;
>  
> -		dma_resv_add_excl_fence(ghost_obj->base.resv, fence);
> +		dma_resv_add_excl_fence(&ghost_obj->base._resv, fence);
>  
>  		/**
>  		 * If we're not moving to fixed memory, the TTM object
> @@ -785,7 +787,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
>  		else
>  			bo->ttm = NULL;
>  
> -		ttm_bo_unreserve(ghost_obj);
> +		dma_resv_unlock(&ghost_obj->base._resv);
>  		ttm_bo_put(ghost_obj);
>  
>  	} else if (from->flags & TTM_MEMTYPE_FLAG_FIXED) {
> @@ -841,7 +843,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>  	if (ret)
>  		return ret;
>  
> -	ret = dma_resv_copy_fences(ghost->base.resv, bo->base.resv);
> +	ret = dma_resv_copy_fences(&ghost->base._resv, bo->base.resv);
>  	/* Last resort, wait for the BO to be idle when we are OOM */
>  	if (ret)
>  		ttm_bo_wait(bo, false, false);
> @@ -850,7 +852,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>  	bo->mem.mem_type = TTM_PL_SYSTEM;
>  	bo->ttm = NULL;
>  
> -	ttm_bo_unreserve(ghost);
> +	dma_resv_unlock(&ghost->base._resv);
>  	ttm_bo_put(ghost);
>  
>  	return 0;
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

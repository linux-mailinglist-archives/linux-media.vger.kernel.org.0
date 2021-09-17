Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E0940FAD4
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 16:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbhIQOy7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 10:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234100AbhIQOy6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 10:54:58 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2D2C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 07:53:36 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id v22so26752870edd.11
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 07:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=i7wK8PAy0pTln1Ij7WUju223Tboi1RO9p+q6y08OLdQ=;
        b=UUlDPJH5THY/fyLkI2T7gaCqZRXS3ctAzfWpLsWlez/mGxf+1bKjUyVjIelTu+4raQ
         ie843+Jb4jSnRKKXHBzpaTEKWlrvs5yqOUZk+4FksFw9KMVm2OKu5zCtfIRe2zZ0u7tr
         dxk43ymJdoEHjaFGj9tOPTHm6xUKu+/uGoAQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=i7wK8PAy0pTln1Ij7WUju223Tboi1RO9p+q6y08OLdQ=;
        b=Pi197YIOO+ASG8qXycG22GPWDAirt3iFF8nht3v4gwGWP7Jul+pJJOJ9K66dix3l4q
         LoDYwcRKp74M+zb3PjNzYkq/dQPR3JX9oh84zj1zpmKpYuUrIbWVAPKgphQO3vMxXKg0
         qXwH1vmwdmOT6TKO6e/0HSHHJvNx4rrfjMrRmJpyZSs8ZR61XBqYZIGaMuA4MLaMly1G
         JdYQONx3+D3lts14tLr80As/vVX/CCdcU1ul27uiWq7mh8AVgjOmPOZT6N0BMWc9oTEP
         vr6TTVoPsqH68yhGVyY51WilLRF5o7yWqgCHKP2oaOv9krZVFA5A6Jz3/QRphIHW9ieB
         SH/A==
X-Gm-Message-State: AOAM531M03ET812GQv6fmBcCRjeEQPXt+JRzq1Nau5Ld4XwbZqcA5INP
        Cn3nr461g43ozQ0JeKOaGvFsHw==
X-Google-Smtp-Source: ABdhPJz8wdHWvCd01v4kCjRcWM6KPrx/VnjgO/KDJQJBvz9h1g3363BbbrSpXMNQj/pYRAh1e1Vezw==
X-Received: by 2002:a17:906:3fd7:: with SMTP id k23mr12397223ejj.176.1631890414444;
        Fri, 17 Sep 2021 07:53:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id ml12sm2429067ejb.29.2021.09.17.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 07:53:34 -0700 (PDT)
Date:   Fri, 17 Sep 2021 16:53:32 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: Re: [PATCH 20/26] drm: use new iterator in
 drm_gem_fence_array_add_implicit v2
Message-ID: <YUSr7AN3vv6kpreo@phenom.ffwll.local>
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-21-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917123513.1106-21-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 17, 2021 at 02:35:07PM +0200, Christian König wrote:
> Simplifying the code a bit.
> 
> v2: add missing rcu_read_lock()/unlock()
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

This will be gone as soon as I can land the last conversion patches. Plus
it's always called with dma_resv_lock held.

I wouldn't bother tbh.
-Daniel

> ---
>  drivers/gpu/drm/drm_gem.c | 34 ++++++++++++----------------------
>  1 file changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 09c820045859..c2c41b668f40 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1340,31 +1340,21 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
>  				     struct drm_gem_object *obj,
>  				     bool write)
>  {
> -	int ret;
> -	struct dma_fence **fences;
> -	unsigned int i, fence_count;
> -
> -	if (!write) {
> -		struct dma_fence *fence =
> -			dma_resv_get_excl_unlocked(obj->resv);
> -
> -		return drm_gem_fence_array_add(fence_array, fence);
> -	}
> -
> -	ret = dma_resv_get_fences(obj->resv, NULL,
> -						&fence_count, &fences);
> -	if (ret || !fence_count)
> -		return ret;
> -
> -	for (i = 0; i < fence_count; i++) {
> -		ret = drm_gem_fence_array_add(fence_array, fences[i]);
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
> +	int ret = 0;
> +
> +	rcu_read_lock();
> +	dma_resv_iter_begin(&cursor, obj->resv, write);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		rcu_read_unlock();
> +		ret = drm_gem_fence_array_add(fence_array, fence);
> +		rcu_read_lock();
>  		if (ret)
>  			break;
>  	}
> -
> -	for (; i < fence_count; i++)
> -		dma_fence_put(fences[i]);
> -	kfree(fences);
> +	dma_resv_iter_end(&cursor);
> +	rcu_read_unlock();
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

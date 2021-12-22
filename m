Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EABB47D8B9
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238743AbhLVVam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:30:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234425AbhLVVal (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:30:41 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5A2C06173F
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:30:41 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id bm14so13617252edb.5
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cRuxaJUssp+3x7yqlysYE2p8OoJ6aDX0xXr2ZckK16U=;
        b=KP2ZB8x9mT1Rkak3thP1kypDm8oatJJtSsCJZnCX2xS28QtkRB2qgE4fihR14jxAAC
         g1F3xxGk7NNzdhhsyxgdLZBxvhrrbDboX+KahX37I1+aR1X9+nSsmcHSn7bO0ysKrZNd
         IO/IP3UvQVGLj3h1SjMf+VjJlm5+pgIkT7iKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cRuxaJUssp+3x7yqlysYE2p8OoJ6aDX0xXr2ZckK16U=;
        b=4TGaRWBvl9eOC3W23koImLVsTKRt9qHFJ1vA87vO+0UdSaTLiGcFL6t6k0xCQ2ct/u
         JTDxYunbRW2mlr3M37vJMPmz4oS7daImj4lWCUhfh32g7BwqwCK8sxCP1hwoE1PBGKb2
         jnxGDuNQ1Svud93DreEeablFR+XYq6TRMW9B8mCf4o7T49nZbq69Yk+pFcOLetf7TQQB
         IBnW2u5YLoL/rXcqc64KZXQddHZp7+L2vFWmri7J2wmbaoflVfdpEjlDyvf3zwYGhyGq
         9XNOIX0rAjcDRVeuevJAtOa2TNK3loxq5fbSkQgw0j2n6jxOvvXEorUtLjpuGaXDTppf
         rdyQ==
X-Gm-Message-State: AOAM531WX3rskUz10wysq2QjdZrRTMquzPMsJlnuwPF7F+5QXBj6yC7X
        AGQgmnTRkVBaFVUk/9cLfPQRWA==
X-Google-Smtp-Source: ABdhPJwK4laAQJWZO9107YfUXlS+5KTEbT9Av7yKnW08IQXOuHhQ+uXbytjjJxGVeJE7kHRHfqd8rw==
X-Received: by 2002:a17:907:7241:: with SMTP id ds1mr3868968ejc.695.1640208640204;
        Wed, 22 Dec 2021 13:30:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b10sm1320362ede.52.2021.12.22.13.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:30:39 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:30:38 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 09/24] drm/radeon: stop using dma_resv_excl_fence
Message-ID: <YcOY/jR9nogI7yzU@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-10-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-10-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:33:56PM +0100, Christian König wrote:
> Instead use the new dma_resv_get_singleton function.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/radeon/radeon_display.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 573154268d43..a6f875118f01 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -533,7 +533,12 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
>  		DRM_ERROR("failed to pin new rbo buffer before flip\n");
>  		goto cleanup;
>  	}
> -	work->fence = dma_fence_get(dma_resv_excl_fence(new_rbo->tbo.base.resv));
> +	r = dma_resv_get_singleton(new_rbo->tbo.base.resv, false, &work->fence);
> +	if (r) {
> +		radeon_bo_unreserve(new_rbo);
> +		DRM_ERROR("failed to get new rbo buffer fences\n");
> +		goto cleanup;
> +	}

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	radeon_bo_get_tiling_flags(new_rbo, &tiling_flags, NULL);
>  	radeon_bo_unreserve(new_rbo);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509F647D8F2
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237387AbhLVVvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232335AbhLVVvY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:51:24 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E755C061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:51:23 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id b13so13721889edd.8
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tvMuyvqKENJPxfYNvPBdLBk/Q0Wu/qzhmc/BjawCPSo=;
        b=CPeuFuALlPY2M7TTTvs430ZAgWX3z4eHsR15vVCComngcPfMN/3b1I9hB3sP72T1of
         FgPUZ0qOV8PVMFUFczgp7jCLSsuNRFMuRVeInQh0X+Flyi84Qe3jWG6CUlOsw2yNDA63
         VFAZ7oJ9+m8l/c51UW7wiAGZ6Kb0zO+HE1PgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tvMuyvqKENJPxfYNvPBdLBk/Q0Wu/qzhmc/BjawCPSo=;
        b=CwvPRLwFjRsFnBZCTraKqPkn/NYddT4kkH2CQWH9atPzSNVPti1I9lFT29CnUBo+eG
         d4H/QFRaWCPMXlrIOdEHSpBFTteePJU4G5slvA5mhJRI23+SbH+ruHEg16WpiCMBro/O
         otrCMVdOUtcIVC7Pw8Sa3wCC/8Efk+22NPd4xf2c/4qSsPcbrPad3aR1hJIrcl803ztv
         ou6G0pbXrFAbiwkk2b+fUZMWi+2FuFnq0nHeuUlZcP1OQQ2yO2mn4WKildp4zYx38XVF
         /u1umxTtwiGwRRT5RXAMjbbOWBf/+wrPxVZ/hS1gGnccU1v3hYmH+s824CfVHw6kUJLo
         Ihvw==
X-Gm-Message-State: AOAM531+4yD9RIQETAu3hMogfpsj6HVMKpQ3QpSSSRC21ompfnDPNiZV
        nykMNk76DNZr0Sj5orcxdgPeWj72I8Q7UA==
X-Google-Smtp-Source: ABdhPJwVGe0nyH+ZbABYq6LPipkNqDcq5EgwVrsId62oST/trYTfKTAhQzsjzEcYTc9rYFgRDXORgQ==
X-Received: by 2002:a17:906:249a:: with SMTP id e26mr3866884ejb.492.1640209882226;
        Wed, 22 Dec 2021 13:51:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id hr36sm1123687ejc.28.2021.12.22.13.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:51:21 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:51:20 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 15/24] drm: support more than one write fence in
 drm_gem_plane_helper_prepare_fb
Message-ID: <YcOd2DpbI0QTPhPh@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-16-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-16-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:34:02PM +0100, Christian König wrote:
> Use dma_resv_get_singleton() here to eventually get more than one write
> fence as single fence.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Patch title should be drm/atomic-helper: prefix, not just drm:

With that nit:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem_atomic_helper.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> index c3189afe10cb..9338ddb7edff 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -143,25 +143,21 @@
>   */
>  int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  {
> -	struct dma_resv_iter cursor;
>  	struct drm_gem_object *obj;
>  	struct dma_fence *fence;
> +	int ret;
>  
>  	if (!state->fb)
>  		return 0;
>  
>  	obj = drm_gem_fb_get_obj(state->fb, 0);
> -	dma_resv_iter_begin(&cursor, obj->resv, false);
> -	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> -		/* TODO: Currently there should be only one write fence, so this
> -		 * here works fine. But drm_atomic_set_fence_for_plane() should
> -		 * be changed to be able to handle more fences in general for
> -		 * multiple BOs per fb anyway. */
> -		dma_fence_get(fence);
> -		break;
> -	}
> -	dma_resv_iter_end(&cursor);
> +	ret = dma_resv_get_singleton(obj->resv, false, &fence);
> +	if (ret)
> +		return ret;
>  
> +	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
> +	 * to handle more fences in general for multiple BOs per fb.
> +	 */
>  	drm_atomic_set_fence_for_plane(state, fence);
>  	return 0;
>  }
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

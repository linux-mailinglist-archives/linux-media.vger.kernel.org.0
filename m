Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE89442C215
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 16:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbhJMOIU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 10:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhJMOIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 10:08:18 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8215EC061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:06:15 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id m22so9013624wrb.0
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cIG68W/tQJNgWN+jsVPFh0cg8v247trbObwIJoHes/8=;
        b=HEbyI7lPjO/SeLtFv2N47Myw4+qpe2RXDpO6C1fJpiGMP64+S8rRjTdQr/nN9d9NXo
         xiNpscMX/s53q1YD3kWt5GT/kePPKjZRRrSh5fJYmpjvk/kGhEF0ekf5a2uG+AhQNEhy
         vr6CeyNj14gersIusRRdOLU0D9Vw18z/uenPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cIG68W/tQJNgWN+jsVPFh0cg8v247trbObwIJoHes/8=;
        b=AorZBzJ0xZdUsCIkfArW4MsODRDxvHTHWSlMtirJfDe9AdsM7X1hbAZuvkPYGVGQU4
         HGvEmlIb4XztvI2Z7lD0yJpQWFn6vxAUD/iviT4RQNmmNYQeNobxAExwniEo/RTY3N3d
         baApr00qhnB6anZaE1NTnUVkz16CkoPzV10uie+EKvrRr+x0dwjIJdwOcqWVqXCYB+OD
         tizdRifaLMr+QX5ztdz0cMC+Udi9t+mBiuco5w27LtpH9buADDqWKBkOusdWvoxSE+PO
         f4xAGPOrZF27z4jTXZkYowzYztuvaBwJcXoc8AnzfXsSbGkqP+9qSkQWngnSNIT1hMAN
         0QPw==
X-Gm-Message-State: AOAM532I0IMo3c3VAbXwHpEVIphMfwptWh0dWZIP5qCE+oyRJUsEkW00
        E2W7FDz8kxfCPxKBrVXqFon6Ai5cekFNSA==
X-Google-Smtp-Source: ABdhPJwjgQ0DiXTrs41jVl5BYH6DQcXR5MUd9Sxq+V+NNJmQjSNclYZi7GSa7EEkZ0U+lattZFKFBQ==
X-Received: by 2002:adf:a183:: with SMTP id u3mr40196310wru.330.1634133972353;
        Wed, 13 Oct 2021 07:06:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id e16sm11711795wrw.17.2021.10.13.07.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 07:06:11 -0700 (PDT)
Date:   Wed, 13 Oct 2021 16:06:10 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 11/28] drm/amdgpu: use the new iterator in
 amdgpu_sync_resv
Message-ID: <YWbn0hZQgYAohsrz@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-12-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-12-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 05, 2021 at 01:37:25PM +0200, Christian König wrote:
> Simplifying the code a bit.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Yeah these iterators rock :-)
-Daniel

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 44 ++++++++----------------
>  1 file changed, 14 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> index 862eb3c1c4c5..f7d8487799b2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -252,41 +252,25 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
>  		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
>  		     void *owner)
>  {
> -	struct dma_resv_list *flist;
> +	struct dma_resv_iter cursor;
>  	struct dma_fence *f;
> -	unsigned i;
> -	int r = 0;
> +	int r;
>  
>  	if (resv == NULL)
>  		return -EINVAL;
>  
> -	/* always sync to the exclusive fence */
> -	f = dma_resv_excl_fence(resv);
> -	dma_fence_chain_for_each(f, f) {
> -		struct dma_fence_chain *chain = to_dma_fence_chain(f);
> -
> -		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
> -					   chain->fence : f)) {
> -			r = amdgpu_sync_fence(sync, f);
> -			dma_fence_put(f);
> -			if (r)
> -				return r;
> -			break;
> -		}
> -	}
> -
> -	flist = dma_resv_shared_list(resv);
> -	if (!flist)
> -		return 0;
> -
> -	for (i = 0; i < flist->shared_count; ++i) {
> -		f = rcu_dereference_protected(flist->shared[i],
> -					      dma_resv_held(resv));
> -
> -		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
> -			r = amdgpu_sync_fence(sync, f);
> -			if (r)
> -				return r;
> +	dma_resv_for_each_fence(&cursor, resv, true, f) {
> +		dma_fence_chain_for_each(f, f) {
> +			struct dma_fence_chain *chain = to_dma_fence_chain(f);
> +
> +			if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
> +						   chain->fence : f)) {
> +				r = amdgpu_sync_fence(sync, f);
> +				dma_fence_put(f);
> +				if (r)
> +					return r;
> +				break;
> +			}
>  		}
>  	}
>  	return 0;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

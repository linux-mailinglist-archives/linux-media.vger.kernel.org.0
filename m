Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B1942C277
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 16:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhJMOOS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 10:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhJMOOS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 10:14:18 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD259C061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:12:14 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r10so8794205wra.12
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Eov6NzsPqJ03u6U/yFYdN6gMAiBoLKDNd4UpBJCGcZE=;
        b=CtLBJZfPhzgpKc7M/1wCGrEiESAs/IvWwg9YoHlZ81kt9abVn2f30KYiwdE5YearvT
         o0lWWUEdfOd0BlVyp0Hc8Y7pCE6sFdn2i83InhkGfmyUW1L88nsiRShHgNae22yr0USj
         DtC2d5TKsliJjLKgLL8lBCN3/k2khQ6FhMte4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Eov6NzsPqJ03u6U/yFYdN6gMAiBoLKDNd4UpBJCGcZE=;
        b=xW5uRH0BFTczmWYq5sAC1cckRT4Jr9gozl0H53SWTpJP58opM2ymLTNxdfi5amhOcq
         SoyfX24Y+35X0stSoeBmk3At5FD6Q5B2waP0wjpD0NyyVgsXfGUo8aXdJ6sgJlA+jj50
         1Br0KR6b1YL9+0Vu+rQRww/t2+e0CAXSs93MTf5NZqatY0sna9/W5xYvz0o+iYADvdGW
         gJuDNjsDw9iCjWVXQBmrR+xEE+HmOhUVohWuWz+ytMbklfmqquPD96zhfSoU8bEEYkR/
         trBMoStKFi+n8l1PEpe40k9QEAENwjQx5UjKjvXkPeFa0dx52WQIMn2yGcJt27CQYctH
         jKKA==
X-Gm-Message-State: AOAM532gIXF5kvlYCN7hGZCrSXHM1iwhucqUipjqkAMzYCiT4CWF0Jgx
        qq8gaowpZfG+iyakN0O+ZxAPlQ==
X-Google-Smtp-Source: ABdhPJyNN96SfRwIumBryA5fyxUQOvccr9DUg4zBuTBjaDmt4p0CZKGSFN1ZUdMbdKv1Wu07nHEXmw==
X-Received: by 2002:adf:aadc:: with SMTP id i28mr39788310wrc.320.1634134332273;
        Wed, 13 Oct 2021 07:12:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o6sm5742231wms.3.2021.10.13.07.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 07:12:11 -0700 (PDT)
Date:   Wed, 13 Oct 2021 16:12:09 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 13/28] drm/amdgpu: use new iterator in amdgpu_vm_prt_fini
Message-ID: <YWbpOcTGitW7O9KK@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-14-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-14-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 05, 2021 at 01:37:27PM +0200, Christian König wrote:
> No need to actually allocate an array of fences here.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 26 +++++---------------------
>  1 file changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 6b15cad78de9..e42dd79ed6f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2090,30 +2090,14 @@ static void amdgpu_vm_free_mapping(struct amdgpu_device *adev,
>  static void amdgpu_vm_prt_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>  {
>  	struct dma_resv *resv = vm->root.bo->tbo.base.resv;
> -	struct dma_fence *excl, **shared;
> -	unsigned i, shared_count;
> -	int r;
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
>  
> -	r = dma_resv_get_fences(resv, &excl, &shared_count, &shared);
> -	if (r) {
> -		/* Not enough memory to grab the fence list, as last resort
> -		 * block for all the fences to complete.
> -		 */
> -		dma_resv_wait_timeout(resv, true, false,
> -						    MAX_SCHEDULE_TIMEOUT);
> -		return;
> -	}
> -
> -	/* Add a callback for each fence in the reservation object */
> -	amdgpu_vm_prt_get(adev);

I was confused for a bit why the old code wouldn't leak a refcount for
!excl case, but it's all handled.

Not sure amdgpu_vm_add_prt_cb still needs to handle the !fence case, it's
a bit a gotcha but I guess can happen?

Either way, looks correct.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -	amdgpu_vm_add_prt_cb(adev, excl);
> -
> -	for (i = 0; i < shared_count; ++i) {
> +	dma_resv_for_each_fence(&cursor, resv, true, fence) {
> +		/* Add a callback for each fence in the reservation object */
>  		amdgpu_vm_prt_get(adev);
> -		amdgpu_vm_add_prt_cb(adev, shared[i]);
> +		amdgpu_vm_add_prt_cb(adev, fence);
>  	}
> -
> -	kfree(shared);
>  }
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

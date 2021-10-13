Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D1942C224
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 16:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235581AbhJMOJx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 10:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234903AbhJMOJx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 10:09:53 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132C8C061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:07:50 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id e3so8710006wrc.11
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MKxaZc1pgApmzpCUtsxcB625bqKcDpcD1a7kgFDuO2c=;
        b=L+k3W2pOKne4quT1JwDLgoYvBTDNcQO7CjmuZjq7JfRe+vfeIKBrKVplAhVpXWwuUa
         m50PhxWJ3zjFv8h5BW7Pe5vIfesh4gLNQbXQK1J+KKywDFrwP3zogV7U0QcHa2smoOZh
         bXCL/2qqYIwY+IrEwP/CBh9IGsi0ka4uPf54A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MKxaZc1pgApmzpCUtsxcB625bqKcDpcD1a7kgFDuO2c=;
        b=YYD/42Y+/34URNbBct33Z3npcKxnbBhSToHmPYGf0EBRAXfYljaV2dV+N88vCBkQc/
         Kxv27lGgzUhAthAOswCO0Sn3QDXusKNAbfrZtg/aJCJc1iGbeIjXLaRWR9lPwwHPOS+d
         Wgq1I1cBuuQabpP8VlgOzmOtZQ6KlyakyUw6yR0BzkpTTiMAeNQjqpQ/4ByRd10aOi+f
         4ZDW49HG1UPa8eI1zeuQ9jc73MVPCU8lTPC31Qw+f7WzZWlM1TbtxyGMwIfaFnsTaVsH
         6PoJD0Kf8qkEdD8UShPexNMZJDT2az4jkiXIHvzS4JDuof6jwIrRuawHer/ECGHxtnBK
         xbCA==
X-Gm-Message-State: AOAM531WjilAmrIzKYL4Veh8cNxooKs+ZgTBeLcdmTJrW58I1didWfEX
        Vl8f3YxRP2uJy5c5VlyMe6C7UQ==
X-Google-Smtp-Source: ABdhPJwpY3GMpSXEeLezpKBdLRdIlDqC60mIwmphTOUCOalzhlFSIcORR+wr7zU2kxe9TM1Th2J1mg==
X-Received: by 2002:a1c:f302:: with SMTP id q2mr13407345wmq.56.1634134068132;
        Wed, 13 Oct 2021 07:07:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id r27sm13404433wrr.70.2021.10.13.07.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 07:07:47 -0700 (PDT)
Date:   Wed, 13 Oct 2021 16:07:45 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 12/28] drm/amdgpu: use new iterator in
 amdgpu_ttm_bo_eviction_valuable
Message-ID: <YWboMfLOIjl1l7tF@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-13-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-13-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 05, 2021 at 01:37:26PM +0200, Christian König wrote:
> Simplifying the code a bit.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index e8d70b6e6737..722e3c9e8882 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1345,10 +1345,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>  					    const struct ttm_place *place)
>  {
>  	unsigned long num_pages = bo->resource->num_pages;
> +	struct dma_resv_iter resv_cursor;
>  	struct amdgpu_res_cursor cursor;
> -	struct dma_resv_list *flist;
>  	struct dma_fence *f;
> -	int i;
>  
>  	/* Swapout? */
>  	if (bo->resource->mem_type == TTM_PL_SYSTEM)
> @@ -1362,14 +1361,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>  	 * If true, then return false as any KFD process needs all its BOs to
>  	 * be resident to run successfully
>  	 */
> -	flist = dma_resv_shared_list(bo->base.resv);
> -	if (flist) {
> -		for (i = 0; i < flist->shared_count; ++i) {
> -			f = rcu_dereference_protected(flist->shared[i],
> -				dma_resv_held(bo->base.resv));
> -			if (amdkfd_fence_check_mm(f, current->mm))
> -				return false;
> -		}
> +	dma_resv_for_each_fence(&resv_cursor, bo->base.resv, true, f) {

							    ^false?

At least I'm not seeing the code look at the exclusive fence here.
-Daniel

> +		if (amdkfd_fence_check_mm(f, current->mm))
> +			return false;
>  	}
>  
>  	switch (bo->resource->mem_type) {
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

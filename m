Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06040EFBD5
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 11:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388264AbfKEKw6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 05:52:58 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41266 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388221AbfKEKw5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 05:52:57 -0500
Received: by mail-wr1-f67.google.com with SMTP id p4so20753421wrm.8
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2019 02:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=TKdpVF6TwvbB8GcetexoU9XGuRiB74mVvMztmY2qmqE=;
        b=OufcUF3IZvb8+A+1gXi/mEok00kj2665sxfBAhqyo3KY1zzui+yHNwCZ7Um0UXu1ei
         yT4y5RA2BeIqtK0ofuoxnDU8vxjMjDNWbOO4B4GtGGncNN+PjrzOJQ0da4zM3T/aG7zK
         vNQe58mOGBiEI7knRbpegwVEStvtstSqLVbfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=TKdpVF6TwvbB8GcetexoU9XGuRiB74mVvMztmY2qmqE=;
        b=UKJQqmEd6jbb+mD5WNpDifXgzfgfKldFuKK1hsmpy8YyOUg8gKDFDegIWcn5ZVFPA8
         UIyg7yUZ+KPzMSPG6vfHIDzKu//AAxCe991WGJlaO/QLdMqpWRqhDEtY3qWxpsx4kuEI
         IcqRigL8Zv+XotPso1S+wUXiL+hiO5i89v4yZGf2h8hKNYeiwx/7KkC1bO1OIiPtzH3d
         uUYwG/EdAPPg/6Gd8Dkbjuj0rRY6R72RubgNq6Ih9XYXSXkgKLWVCQqBzquMKStZ3mfh
         MvAFvXva0gfc/koIzCsaPj0195gMWvmaK8HejgpuO0BtNsnTHrQIvVkbVsmoRD5ttW1I
         020A==
X-Gm-Message-State: APjAAAVinyvWW8L2uto+Hb3zLwJR6LhrtUCYym+CwIxoXHyC5brH03P+
        weTvGuq45CQwcKYcvRXwrYymxg==
X-Google-Smtp-Source: APXvYqzVjJg/jeudj/TNfMBZc+K5TN26tQRpEYyYpCfKwy7Z6t1j5W3/5nw0wWhx7qCr4Pp9TdCCkw==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr12053221wrm.94.1572951175402;
        Tue, 05 Nov 2019 02:52:55 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id d11sm24319677wrf.80.2019.11.05.02.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:52:54 -0800 (PST)
Date:   Tue, 5 Nov 2019 11:52:52 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify
Message-ID: <20191105105252.GE10326@phenom.ffwll.local>
References: <20191029104049.9011-1-christian.koenig@amd.com>
 <20191029104049.9011-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029104049.9011-6-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 29, 2019 at 11:40:49AM +0100, Christian König wrote:
> Implement the importer side of unpinned DMA-buf handling.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 28 ++++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  6 +++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 3629cfe53aad..af39553c51ad 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -456,7 +456,33 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>  	return ERR_PTR(ret);
>  }
>  
> +/**
> + * amdgpu_dma_buf_move_notify - &attach.move_notify implementation
> + *
> + * @attach: the DMA-buf attachment
> + *
> + * Invalidate the DMA-buf attachment, making sure that the we re-create the
> + * mapping before the next use.
> + */
> +static void
> +amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
> +{
> +	struct ttm_operation_ctx ctx = { false, false };
> +	struct drm_gem_object *obj = attach->importer_priv;
> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> +	struct ttm_placement placement = {};
> +	int r;
> +
> +	if (bo->tbo.mem.mem_type == TTM_PL_SYSTEM)
> +		return;
> +
> +	r = ttm_bo_validate(&bo->tbo, &placement, &ctx);
> +	if (r)
> +		DRM_ERROR("Failed to invalidate DMA-buf import (%d))\n", r);

Where do you update pagetables?

The only thing I've found is in the amdgpu CS code, which is way to late
for this stuff here. Plus TTM doesn't handle virtual memory at all (aside
from the gart tt), so clearly you need to call into amdgpu code somewhere
for this. But I didn't find it, neither in your ->move_notify nor the
->move callback in ttm_bo_driver.

How does this work?
-Daniel

> +}
> +
>  static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops = {
> +	.move_notify = amdgpu_dma_buf_move_notify
>  };
>  
>  /**
> @@ -492,7 +518,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
>  		return obj;
>  
>  	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
> -					&amdgpu_dma_buf_attach_ops, NULL);
> +					&amdgpu_dma_buf_attach_ops, obj);
>  	if (IS_ERR(attach)) {
>  		drm_gem_object_put(obj);
>  		return ERR_CAST(attach);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index ac776d2620eb..cfa46341c9a7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -861,6 +861,9 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
>  		return 0;
>  	}
>  
> +	if (bo->tbo.base.import_attach)
> +		dma_buf_pin(bo->tbo.base.import_attach);
> +
>  	bo->flags |= AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
>  	/* force to pin into visible video ram */
>  	if (!(bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS))
> @@ -944,6 +947,9 @@ int amdgpu_bo_unpin(struct amdgpu_bo *bo)
>  
>  	amdgpu_bo_subtract_pin_size(bo);
>  
> +	if (bo->tbo.base.import_attach)
> +		dma_buf_unpin(bo->tbo.base.import_attach);
> +
>  	for (i = 0; i < bo->placement.num_placement; i++) {
>  		bo->placements[i].lpfn = 0;
>  		bo->placements[i].flags &= ~TTM_PL_FLAG_NO_EVICT;
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

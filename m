Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02AD92875C5
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 16:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730462AbgJHOMQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 10:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730388AbgJHOMQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 10:12:16 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBEBBC061755
        for <linux-media@vger.kernel.org>; Thu,  8 Oct 2020 07:12:15 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e17so6763332wru.12
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2020 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rvYAOVJXogxxs60AvatiGhoCAD5lEuVQbXIBOWYzXOw=;
        b=JUAS6we9ItPTvx30yPLehVBY2fF6mpTNcl8IMh4tL1Ja8Ql9/WavfERIxClan/3LTT
         2Csxi3BvCn21mfKuHWTkIBxBn+zJ2xIkOSfxE5++XiTy1CXQQBnE5bwjyUOqL7cJwohu
         Q9ta8Ix8TuH49cKU1pw/uUBX3/0UAP/gOFO6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=rvYAOVJXogxxs60AvatiGhoCAD5lEuVQbXIBOWYzXOw=;
        b=HuAAB9gZ3FXTjX5M3VNHjreWsRm+AYlEyJpqeX6OHgG2c2yfxMnyT/0OpIDwKGYOxC
         7nqPrnNocL3UAxTZ7J50ogggeN7lgqmjw9vMC0RwgRbWkYot3JxxjYt9Vcyrf62+jkNq
         NBT/e5NomTjQdXy/hbn1vLHKWDnjNLw7Gr/nIar1YM2LDqAeUlkh85NapExLykxZnYtb
         8gSMNwcTlIIawZEQhPcTCzm7WVwCyAqyLih9x1Dq/Jj5us9aXjivbgCYX3QBHIo78Y+r
         aTKY7dDvdji38tsQD+Y7L4gXP+R+otWEjAAkD67rpWp/rJAXJtwz0I4QFiEtKOzyn3Tt
         +zCQ==
X-Gm-Message-State: AOAM533r4chERyF1DPz2Si/RLVKuxXwSFkNvoxf3Dip+ZBlPV6uPJ1lB
        L6/4UjSgy58QwuVY7b8SFbG8cg==
X-Google-Smtp-Source: ABdhPJxJJzUjbio8gr3rObKztUTAE0TWFjhVuMPYzXPtxKz3HoY4fSG9+7MXuad7uC1WuambrSziqg==
X-Received: by 2002:adf:f084:: with SMTP id n4mr10118935wro.16.1602166334431;
        Thu, 08 Oct 2020 07:12:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t10sm7140007wmf.46.2020.10.08.07.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 07:12:13 -0700 (PDT)
Date:   Thu, 8 Oct 2020 16:12:11 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
Message-ID: <20201008141211.GG438822@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org,
        sumit.semwal@linaro.org
References: <20201008112342.9394-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201008112342.9394-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 08, 2020 at 01:23:39PM +0200, Christian K�nig wrote:
> Add the new vma_set_file() function to allow changing
> vma->vm_file with the necessary refcount dance.
> 
> v2: add more users of this.
> 
> Signed-off-by: Christian K�nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf.c                  | 16 +++++-----------
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c      |  4 +---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  3 +--
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  4 ++--
>  drivers/gpu/drm/msm/msm_gem.c              |  4 +---
>  drivers/gpu/drm/omapdrm/omap_gem.c         |  3 +--
>  drivers/gpu/drm/vgem/vgem_drv.c            |  3 +--
>  drivers/staging/android/ashmem.c           |  5 ++---
>  include/linux/mm.h                         |  2 ++
>  mm/mmap.c                                  | 16 ++++++++++++++++
>  10 files changed, 32 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index a6ba4d598f0e..e4316aa7e0f4 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1163,20 +1163,14 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>  		return -EINVAL;
>  
>  	/* readjust the vma */
> -	get_file(dmabuf->file);
> -	oldfile = vma->vm_file;
> -	vma->vm_file = dmabuf->file;
> +	oldfile = vma_set_file(vma, dmabuf->file);
>  	vma->vm_pgoff = pgoff;
>  
>  	ret = dmabuf->ops->mmap(dmabuf, vma);
> -	if (ret) {
> -		/* restore old parameters on failure */
> -		vma->vm_file = oldfile;
> -		fput(dmabuf->file);
> -	} else {
> -		if (oldfile)
> -			fput(oldfile);
> -	}
> +	/* restore old parameters on failure */
> +	if (ret)
> +		vma_set_file(vma, oldfile);

I think these two lines here are cargo-cult: If this fails, the mmap fails
and therefore the vma structure is kfreed. No point at all in restoring
anything.

With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  	return ret;
>  
>  }
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index 312e9d58d5a7..10ce267c0947 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -145,10 +145,8 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
>  		 * address_space (so unmap_mapping_range does what we want,
>  		 * in particular in the case of mmap'd dmabufs)
>  		 */
> -		fput(vma->vm_file);
> -		get_file(etnaviv_obj->base.filp);
>  		vma->vm_pgoff = 0;
> -		vma->vm_file  = etnaviv_obj->base.filp;
> +		vma_set_file(vma, etnaviv_obj->base.filp);
>  
>  		vma->vm_page_prot = vm_page_prot;
>  	}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index fec0e1e3dc3e..8ce4c9e28b87 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -119,8 +119,7 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
>  	if (ret)
>  		return ret;
>  
> -	fput(vma->vm_file);
> -	vma->vm_file = get_file(obj->base.filp);
> +	vma_set_file(vma, obj->base.filp);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 3d69e51f3e4d..c9d5f1a38af3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -893,8 +893,8 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>  	 * requires avoiding extraneous references to their filp, hence why
>  	 * we prefer to use an anonymous file for their mmaps.
>  	 */
> -	fput(vma->vm_file);
> -	vma->vm_file = anon;
> +	vma_set_file(vma, anon);
> +	fput(anon);
>  
>  	switch (mmo->mmap_type) {
>  	case I915_MMAP_TYPE_WC:
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index de915ff6f4b4..a71f42870d5e 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -223,10 +223,8 @@ int msm_gem_mmap_obj(struct drm_gem_object *obj,
>  		 * address_space (so unmap_mapping_range does what we want,
>  		 * in particular in the case of mmap'd dmabufs)
>  		 */
> -		fput(vma->vm_file);
> -		get_file(obj->filp);
>  		vma->vm_pgoff = 0;
> -		vma->vm_file  = obj->filp;
> +		vma_set_file(vma, obj->filp);
>  
>  		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>  	}
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> index 979d53a93c2b..0d4542ff1d7d 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -564,9 +564,8 @@ int omap_gem_mmap_obj(struct drm_gem_object *obj,
>  		 * address_space (so unmap_mapping_range does what we want,
>  		 * in particular in the case of mmap'd dmabufs)
>  		 */
> -		fput(vma->vm_file);
>  		vma->vm_pgoff = 0;
> -		vma->vm_file  = get_file(obj->filp);
> +		vma_set_file(vma, obj->filp);
>  
>  		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>  	}
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index fa54a6d1403d..ea0eecae5153 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -397,8 +397,7 @@ static int vgem_prime_mmap(struct drm_gem_object *obj,
>  	if (ret)
>  		return ret;
>  
> -	fput(vma->vm_file);
> -	vma->vm_file = get_file(obj->filp);
> +	vma_set_file(vma, obj->filp);
>  	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
>  	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>  
> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
> index 10b4be1f3e78..a51dc089896e 100644
> --- a/drivers/staging/android/ashmem.c
> +++ b/drivers/staging/android/ashmem.c
> @@ -450,9 +450,8 @@ static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
>  		vma_set_anonymous(vma);
>  	}
>  
> -	if (vma->vm_file)
> -		fput(vma->vm_file);
> -	vma->vm_file = asma->file;
> +	vma_set_file(vma, asma->file);
> +	fput(asma->file);
>  
>  out:
>  	mutex_unlock(&ashmem_mutex);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ca6e6a81576b..a558602afe1b 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2693,6 +2693,8 @@ static inline void vma_set_page_prot(struct vm_area_struct *vma)
>  }
>  #endif
>  
> +struct file *vma_set_file(struct vm_area_struct *vma, struct file *file);
> +
>  #ifdef CONFIG_NUMA_BALANCING
>  unsigned long change_prot_numa(struct vm_area_struct *vma,
>  			unsigned long start, unsigned long end);
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 40248d84ad5f..d3c3c510f643 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -136,6 +136,22 @@ void vma_set_page_prot(struct vm_area_struct *vma)
>  	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
>  }
>  
> +/*
> + * Change backing file, only valid to use during initial VMA setup.
> + */
> +struct file *vma_set_file(struct vm_area_struct *vma, struct file *file)
> +{
> +	if (file)
> +	        get_file(file);
> +
> +	swap(vma->vm_file, file);
> +
> +	if (file)
> +		fput(file);
> +
> +	return file;
> +}
> +
>  /*
>   * Requires inode->i_mapping->i_mmap_rwsem
>   */
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

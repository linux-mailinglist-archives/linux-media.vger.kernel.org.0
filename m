Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 741052883C5
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 09:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732205AbgJIHjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 03:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730740AbgJIHjG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 03:39:06 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04798C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 00:39:05 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e23so1775038wme.2
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 00:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sZlqTMev2axK+L8QGskQUcRRkpAH5XMokNBhQ4hT94w=;
        b=XGJKzicdcgyNT9WCo6lHE+Vhl0zKfbFtnO27PfqmkWZzYDv/lwI+6M2JJ9/FIh19d/
         WsK/Rn1Y5JEjxqP87VBCQWwW26vBL+Yo3YOedeQFFjO+9sYhFuw9vkaMAS9g8dOgob8h
         ZPJzNUZId2DdTQmzNKrQPOFFa/ZtxXVoI+C5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=sZlqTMev2axK+L8QGskQUcRRkpAH5XMokNBhQ4hT94w=;
        b=tSo4UUeeeXpYa4W+YoX/6QBca4TTm4iLxXcdxRg8ITG/H1rPy7BouwHWUfe8XodEL9
         k11Lv6viW0ZoD32GnLXMIS3aOqxdMF4Ua1ofkwJicBCXDyh1SCkZkzbzQEVsthRf72PA
         qojG0avGBMdPYF5+KmStPMJ7SQIuLFrUEC296pGNXZRQ0rFAyTO40s8QdxPK1zl7P68U
         URMDyXkMf47umU9K4ns4SEhySsXmYvDq3kQRVQY6cZIfjir/yOBTuYUb+YWQFAZQGZJl
         XYJ2e3VTqnIZQAKUEDBPMxtkxKlAuU69gKTw2VVyGszFV8t6um3+LmzGVl+jtc3IaSEl
         E0rg==
X-Gm-Message-State: AOAM532m5IIArEH8fZd/W8J2Od/D/h927IdAlRiibKNrWc54meeqFIK9
        5vZ2Y9uNKLoO/Tx8ypHTzumNNY/et3eltOsK
X-Google-Smtp-Source: ABdhPJwB+SCHsXIZFePeBmx2efSXKhvBZ14ZjEzhpHqw9aTG5M5yCwGybld1pOeJ58R6vQhlWGEVvQ==
X-Received: by 2002:a1c:2d4:: with SMTP id 203mr13145932wmc.144.1602229142898;
        Fri, 09 Oct 2020 00:39:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o186sm10546307wmb.12.2020.10.09.00.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 00:39:02 -0700 (PDT)
Date:   Fri, 9 Oct 2020 09:39:00 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     christian.koenig@amd.com
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org,
        sumit.semwal@linaro.org
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
Message-ID: <20201009073900.GL438822@phenom.ffwll.local>
Mail-Followup-To: christian.koenig@amd.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, airlied@redhat.com,
        akpm@linux-foundation.org, sumit.semwal@linaro.org
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <20201008141211.GG438822@phenom.ffwll.local>
 <8fc28dfa-4bae-bee1-5aca-4e3c6e88b994@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fc28dfa-4bae-bee1-5aca-4e3c6e88b994@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 09, 2020 at 09:16:49AM +0200, Christian König wrote:
> Am 08.10.20 um 16:12 schrieb Daniel Vetter:
> > On Thu, Oct 08, 2020 at 01:23:39PM +0200, Christian König wrote:
> > > Add the new vma_set_file() function to allow changing
> > > vma->vm_file with the necessary refcount dance.
> > > 
> > > v2: add more users of this.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/dma-buf/dma-buf.c                  | 16 +++++-----------
> > >   drivers/gpu/drm/etnaviv/etnaviv_gem.c      |  4 +---
> > >   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  3 +--
> > >   drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  4 ++--
> > >   drivers/gpu/drm/msm/msm_gem.c              |  4 +---
> > >   drivers/gpu/drm/omapdrm/omap_gem.c         |  3 +--
> > >   drivers/gpu/drm/vgem/vgem_drv.c            |  3 +--
> > >   drivers/staging/android/ashmem.c           |  5 ++---
> > >   include/linux/mm.h                         |  2 ++
> > >   mm/mmap.c                                  | 16 ++++++++++++++++
> > >   10 files changed, 32 insertions(+), 28 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index a6ba4d598f0e..e4316aa7e0f4 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -1163,20 +1163,14 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
> > >   		return -EINVAL;
> > >   	/* readjust the vma */
> > > -	get_file(dmabuf->file);
> > > -	oldfile = vma->vm_file;
> > > -	vma->vm_file = dmabuf->file;
> > > +	oldfile = vma_set_file(vma, dmabuf->file);
> > >   	vma->vm_pgoff = pgoff;
> > >   	ret = dmabuf->ops->mmap(dmabuf, vma);
> > > -	if (ret) {
> > > -		/* restore old parameters on failure */
> > > -		vma->vm_file = oldfile;
> > > -		fput(dmabuf->file);
> > > -	} else {
> > > -		if (oldfile)
> > > -			fput(oldfile);
> > > -	}
> > > +	/* restore old parameters on failure */
> > > +	if (ret)
> > > +		vma_set_file(vma, oldfile);
> > I think these two lines here are cargo-cult: If this fails, the mmap fails
> > and therefore the vma structure is kfreed. No point at all in restoring
> > anything.
> 
> This was explicitly added with this patch to fix a problem:
> 
> commit 495c10cc1c0c359871d5bef32dd173252fc17995
> Author: John Sheu <sheu@google.com>
> Date:   Mon Feb 11 17:50:24 2013 -0800
> 
>     CHROMIUM: dma-buf: restore args on failure of dma_buf_mmap
> 
>     Callers to dma_buf_mmap expect to fput() the vma struct's vm_file
>     themselves on failure.  Not restoring the struct's data on failure
>     causes a double-decrement of the vm_file's refcount.
> 
> > With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Can I keep that even with the error handling working? :)

Hm good find, I should have looked at git history myself.

I just noticed this here in the patch because everyone else does not do
this. But looking at the mmap_region() code in mmap.c we seem to indeed
have this problem for the error path:

unmap_and_free_vma:
	vma->vm_file = NULL;
	fput(file);

Note that the success path does things correctly (a bit above):

	file = vma->vm_file;
out:

So it indeed looks like dma-buf is the only one that does this fully
correctly. So maybe we should do a follow-up patch to change the
mmap_region exit code to pick up whatever vma->vm_file was set instead,
and fput that?

Anyway I correct, r-b: as-is.

Cheers, Daniel

> 
> Christian.
> 
> > 
> > > +
> > >   	return ret;
> > >   }
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > index 312e9d58d5a7..10ce267c0947 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > @@ -145,10 +145,8 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
> > >   		 * address_space (so unmap_mapping_range does what we want,
> > >   		 * in particular in the case of mmap'd dmabufs)
> > >   		 */
> > > -		fput(vma->vm_file);
> > > -		get_file(etnaviv_obj->base.filp);
> > >   		vma->vm_pgoff = 0;
> > > -		vma->vm_file  = etnaviv_obj->base.filp;
> > > +		vma_set_file(vma, etnaviv_obj->base.filp);
> > >   		vma->vm_page_prot = vm_page_prot;
> > >   	}
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > index fec0e1e3dc3e..8ce4c9e28b87 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > @@ -119,8 +119,7 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
> > >   	if (ret)
> > >   		return ret;
> > > -	fput(vma->vm_file);
> > > -	vma->vm_file = get_file(obj->base.filp);
> > > +	vma_set_file(vma, obj->base.filp);
> > >   	return 0;
> > >   }
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > index 3d69e51f3e4d..c9d5f1a38af3 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > @@ -893,8 +893,8 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> > >   	 * requires avoiding extraneous references to their filp, hence why
> > >   	 * we prefer to use an anonymous file for their mmaps.
> > >   	 */
> > > -	fput(vma->vm_file);
> > > -	vma->vm_file = anon;
> > > +	vma_set_file(vma, anon);
> > > +	fput(anon);
> > >   	switch (mmo->mmap_type) {
> > >   	case I915_MMAP_TYPE_WC:
> > > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > > index de915ff6f4b4..a71f42870d5e 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > > @@ -223,10 +223,8 @@ int msm_gem_mmap_obj(struct drm_gem_object *obj,
> > >   		 * address_space (so unmap_mapping_range does what we want,
> > >   		 * in particular in the case of mmap'd dmabufs)
> > >   		 */
> > > -		fput(vma->vm_file);
> > > -		get_file(obj->filp);
> > >   		vma->vm_pgoff = 0;
> > > -		vma->vm_file  = obj->filp;
> > > +		vma_set_file(vma, obj->filp);
> > >   		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> > >   	}
> > > diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> > > index 979d53a93c2b..0d4542ff1d7d 100644
> > > --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> > > +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> > > @@ -564,9 +564,8 @@ int omap_gem_mmap_obj(struct drm_gem_object *obj,
> > >   		 * address_space (so unmap_mapping_range does what we want,
> > >   		 * in particular in the case of mmap'd dmabufs)
> > >   		 */
> > > -		fput(vma->vm_file);
> > >   		vma->vm_pgoff = 0;
> > > -		vma->vm_file  = get_file(obj->filp);
> > > +		vma_set_file(vma, obj->filp);
> > >   		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> > >   	}
> > > diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> > > index fa54a6d1403d..ea0eecae5153 100644
> > > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> > > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> > > @@ -397,8 +397,7 @@ static int vgem_prime_mmap(struct drm_gem_object *obj,
> > >   	if (ret)
> > >   		return ret;
> > > -	fput(vma->vm_file);
> > > -	vma->vm_file = get_file(obj->filp);
> > > +	vma_set_file(vma, obj->filp);
> > >   	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
> > >   	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> > > diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
> > > index 10b4be1f3e78..a51dc089896e 100644
> > > --- a/drivers/staging/android/ashmem.c
> > > +++ b/drivers/staging/android/ashmem.c
> > > @@ -450,9 +450,8 @@ static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
> > >   		vma_set_anonymous(vma);
> > >   	}
> > > -	if (vma->vm_file)
> > > -		fput(vma->vm_file);
> > > -	vma->vm_file = asma->file;
> > > +	vma_set_file(vma, asma->file);
> > > +	fput(asma->file);
> > >   out:
> > >   	mutex_unlock(&ashmem_mutex);
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index ca6e6a81576b..a558602afe1b 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -2693,6 +2693,8 @@ static inline void vma_set_page_prot(struct vm_area_struct *vma)
> > >   }
> > >   #endif
> > > +struct file *vma_set_file(struct vm_area_struct *vma, struct file *file);
> > > +
> > >   #ifdef CONFIG_NUMA_BALANCING
> > >   unsigned long change_prot_numa(struct vm_area_struct *vma,
> > >   			unsigned long start, unsigned long end);
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index 40248d84ad5f..d3c3c510f643 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -136,6 +136,22 @@ void vma_set_page_prot(struct vm_area_struct *vma)
> > >   	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
> > >   }
> > > +/*
> > > + * Change backing file, only valid to use during initial VMA setup.
> > > + */
> > > +struct file *vma_set_file(struct vm_area_struct *vma, struct file *file)
> > > +{
> > > +	if (file)
> > > +	        get_file(file);
> > > +
> > > +	swap(vma->vm_file, file);
> > > +
> > > +	if (file)
> > > +		fput(file);
> > > +
> > > +	return file;
> > > +}
> > > +
> > >   /*
> > >    * Requires inode->i_mapping->i_mmap_rwsem
> > >    */
> > > -- 
> > > 2.17.1
> > > 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

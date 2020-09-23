Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A716C275C18
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 17:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgIWPjP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 11:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgIWPjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 11:39:14 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F29C0613D1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2020 08:39:13 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id v12so528016wmh.3
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2020 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=al56jIqR4bWL1qjG3SNb0hHo6kqyxkrb5RsbakRXXCU=;
        b=gVY0IQy3T5N0Rn09M2bVVqUsaKknwjDeCDKzu8KcgLePuHBC8kDlVg00N7APPi3AIV
         nySURb4oYaNnqsHnfGMGxPm6j5T9aEquB3LRe42hO8TwingO+yg9zvq6flVGJJPFKxkc
         HuXk1aqXiIpMxANnT8yJkznmXGXybofG70EJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=al56jIqR4bWL1qjG3SNb0hHo6kqyxkrb5RsbakRXXCU=;
        b=Ji6wk+jST8/bKbA+MJQuNdoqXHxEHGzCUMYYd6+YWKK+yQ5dbvaxZLQQPqf/tvPbSI
         CY7NUzj4S9irvzHnk/KDsr6JvRnQZVwfWk2KJ1jEtMxDejhJGZJlRYcuHBMObYuicjHD
         K4IIfD7bsbmcsVh/ECMAtRVKQzdDkNLLUuX6Gh7lbjqRXvsPPASYzMq3j3sdYv7zJ7wr
         kevVBqq7B7+YWtQmdnTtNShowzROA9PdNEBFzhTK9luAajhjVq+3jAYrsG2GA14YEnq6
         /JEXMtlblN20DW+0YSfLgK5D//shXX5Z94tE7Qjyn0wVHme6yEpS4rTicrLY7rnx+swP
         kd4w==
X-Gm-Message-State: AOAM531k+nHgUm/Cp/cYJxxe/wJ0+Ij+dxOh54sESdwHv8w1YFn6iY/S
        bCWKaeJbdYqv5X7f7aP+2fRXJg==
X-Google-Smtp-Source: ABdhPJxg1JOVrRefRZD7EIrm8otYZR0GS/Psd6dhUwhPv5o04ghW58AxFQ5wjYZDjV9CBPS4gthn4A==
X-Received: by 2002:a1c:b703:: with SMTP id h3mr116728wmf.131.1600875551738;
        Wed, 23 Sep 2020 08:39:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s17sm189626wrr.40.2020.09.23.08.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 08:39:10 -0700 (PDT)
Date:   Wed, 23 Sep 2020 17:39:08 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     sumit.semwal@linaro.org, christian.koenig@amd.com, afd@ti.com,
        corbet@lwn.net, benjamin.gaignard@linaro.org, lmark@codeaurora.org,
        labbott@redhat.com, Brian.Starkey@arm.com, john.stultz@linaro.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, mchehab@kernel.org,
        matthew.auld@intel.com, robin.murphy@arm.com,
        thomas.hellstrom@intel.com, sam@ravnborg.org, kraxel@redhat.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dma-buf: Use struct dma_buf_map in dma_buf_vmap()
 interfaces
Message-ID: <20200923153908.GT438822@phenom.ffwll.local>
References: <20200923123205.30671-1-tzimmermann@suse.de>
 <20200923123205.30671-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923123205.30671-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 23, 2020 at 02:32:04PM +0200, Thomas Zimmermann wrote:
> This patch updates dma_buf_vmap() and dma-buf's vmap callback to use
> struct dma_buf_map.
> 
> The interfaces used to return a buffer address. This address now gets
> stored in an instance of the structure that is given as an additional
> argument. The functions return an errno code on errors.
> 
> Users of the functions are updated accordingly. This is only an interface
> change. It is currently expected that dma-buf memory can be accessed with
> system memory load/store operations.
> 
> v2:
> 	* always clear map parameter in dma_buf_vmap() (Daniel)
> 	* include dma-buf-heaps and i915 selftests (kernel test robot)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Too lazy to check for all possible conversion issues, but I think I've
done a close look last time around. As long as this is build tested across
all drivers and architectures we care about we should be fine.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/dma-buf/dma-buf.c                     | 28 +++++++++++--------
>  drivers/dma-buf/heaps/heap-helpers.c          |  8 ++++--
>  drivers/gpu/drm/drm_gem_cma_helper.c          | 13 +++++----
>  drivers/gpu/drm/drm_gem_shmem_helper.c        | 14 ++++++----
>  drivers/gpu/drm/drm_prime.c                   |  8 ++++--
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  8 +++++-
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 11 ++++++--
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 12 ++++++--
>  .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  | 10 +++++--
>  drivers/gpu/drm/tegra/gem.c                   | 18 ++++++++----
>  .../common/videobuf2/videobuf2-dma-contig.c   | 14 +++++++---
>  .../media/common/videobuf2/videobuf2-dma-sg.c | 16 +++++++----
>  .../common/videobuf2/videobuf2-vmalloc.c      | 15 +++++++---
>  include/drm/drm_prime.h                       |  3 +-
>  include/linux/dma-buf-map.h                   | 13 +++++++++
>  include/linux/dma-buf.h                       |  6 ++--
>  16 files changed, 138 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 5e849ca241a0..61bd24d21b38 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1186,46 +1186,50 @@ EXPORT_SYMBOL_GPL(dma_buf_mmap);
>   * dma_buf_vmap - Create virtual mapping for the buffer object into kernel
>   * address space. Same restrictions as for vmap and friends apply.
>   * @dmabuf:	[in]	buffer to vmap
> + * @map:	[out]	returns the vmap pointer
>   *
>   * This call may fail due to lack of virtual mapping address space.
>   * These calls are optional in drivers. The intended use for them
>   * is for mapping objects linear in kernel space for high use objects.
>   * Please attempt to use kmap/kunmap before thinking about these interfaces.
>   *
> - * Returns NULL on error.
> + * Returns 0 on success, or a negative errno code otherwise.
>   */
> -void *dma_buf_vmap(struct dma_buf *dmabuf)
> +int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>  {
> -	void *ptr;
> +	struct dma_buf_map ptr;
> +	int ret = 0;
> +
> +	dma_buf_map_clear(map);
>  
>  	if (WARN_ON(!dmabuf))
> -		return NULL;
> +		return -EINVAL;
>  
>  	if (!dmabuf->ops->vmap)
> -		return NULL;
> +		return -EINVAL;
>  
>  	mutex_lock(&dmabuf->lock);
>  	if (dmabuf->vmapping_counter) {
>  		dmabuf->vmapping_counter++;
>  		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
> -		ptr = dmabuf->vmap_ptr.vaddr;
> +		*map = dmabuf->vmap_ptr;
>  		goto out_unlock;
>  	}
>  
>  	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
>  
> -	ptr = dmabuf->ops->vmap(dmabuf);
> -	if (WARN_ON_ONCE(IS_ERR(ptr)))
> -		ptr = NULL;
> -	if (!ptr)
> +	ret = dmabuf->ops->vmap(dmabuf, &ptr);
> +	if (WARN_ON_ONCE(ret))
>  		goto out_unlock;
>  
> -	dmabuf->vmap_ptr.vaddr = ptr;
> +	dmabuf->vmap_ptr = ptr;
>  	dmabuf->vmapping_counter = 1;
>  
> +	*map = dmabuf->vmap_ptr;
> +
>  out_unlock:
>  	mutex_unlock(&dmabuf->lock);
> -	return ptr;
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_vmap);
>  
> diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
> index d0696cf937af..aeb9e100f339 100644
> --- a/drivers/dma-buf/heaps/heap-helpers.c
> +++ b/drivers/dma-buf/heaps/heap-helpers.c
> @@ -235,7 +235,7 @@ static int dma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>  	return 0;
>  }
>  
> -static void *dma_heap_dma_buf_vmap(struct dma_buf *dmabuf)
> +static int dma_heap_dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>  {
>  	struct heap_helper_buffer *buffer = dmabuf->priv;
>  	void *vaddr;
> @@ -244,7 +244,11 @@ static void *dma_heap_dma_buf_vmap(struct dma_buf *dmabuf)
>  	vaddr = dma_heap_buffer_vmap_get(buffer);
>  	mutex_unlock(&buffer->lock);
>  
> -	return vaddr;
> +	if (!vaddr)
> +		return -ENOMEM;
> +	dma_buf_map_set_vaddr(map, vaddr);
> +
> +	return 0;
>  }
>  
>  static void dma_heap_dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 59b9ca207b42..1ece73fd3fe9 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -617,22 +617,23 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
>  {
>  	struct drm_gem_cma_object *cma_obj;
>  	struct drm_gem_object *obj;
> -	void *vaddr;
> +	struct dma_buf_map map;
> +	int ret;
>  
> -	vaddr = dma_buf_vmap(attach->dmabuf);
> -	if (!vaddr) {
> +	ret = dma_buf_vmap(attach->dmabuf, &map);
> +	if (ret) {
>  		DRM_ERROR("Failed to vmap PRIME buffer\n");
> -		return ERR_PTR(-ENOMEM);
> +		return ERR_PTR(ret);
>  	}
>  
>  	obj = drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
>  	if (IS_ERR(obj)) {
> -		dma_buf_vunmap(attach->dmabuf, vaddr);
> +		dma_buf_vunmap(attach->dmabuf, map.vaddr);
>  		return obj;
>  	}
>  
>  	cma_obj = to_drm_gem_cma_obj(obj);
> -	cma_obj->vaddr = vaddr;
> +	cma_obj->vaddr = map.vaddr;
>  
>  	return obj;
>  }
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index d77c9f8ff26c..6328cfbb828e 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -261,13 +261,16 @@ EXPORT_SYMBOL(drm_gem_shmem_unpin);
>  static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
> -	int ret;
> +	struct dma_buf_map map;
> +	int ret = 0;
>  
>  	if (shmem->vmap_use_count++ > 0)
>  		return shmem->vaddr;
>  
>  	if (obj->import_attach) {
> -		shmem->vaddr = dma_buf_vmap(obj->import_attach->dmabuf);
> +		ret = dma_buf_vmap(obj->import_attach->dmabuf, &map);
> +		if (!ret)
> +			shmem->vaddr = map.vaddr;
>  	} else {
>  		pgprot_t prot = PAGE_KERNEL;
>  
> @@ -279,11 +282,12 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
>  			prot = pgprot_writecombine(prot);
>  		shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
>  				    VM_MAP, prot);
> +		if (!shmem->vaddr)
> +			ret = -ENOMEM;
>  	}
>  
> -	if (!shmem->vaddr) {
> -		DRM_DEBUG_KMS("Failed to vmap pages\n");
> -		ret = -ENOMEM;
> +	if (ret) {
> +		DRM_DEBUG_KMS("Failed to vmap pages, error %d\n", ret);
>  		goto err_put_pages;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 11fe9ff76fd5..2b3fd01867e4 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -669,16 +669,18 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
>   *
>   * Returns the kernel virtual address or NULL on failure.
>   */
> -void *drm_gem_dmabuf_vmap(struct dma_buf *dma_buf)
> +int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
>  {
>  	struct drm_gem_object *obj = dma_buf->priv;
>  	void *vaddr;
>  
>  	vaddr = drm_gem_vmap(obj);
>  	if (IS_ERR(vaddr))
> -		vaddr = NULL;
> +		return PTR_ERR(vaddr);
>  
> -	return vaddr;
> +	dma_buf_map_set_vaddr(map, vaddr);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
>  
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 4aa3426a9ba4..80a9fc143bbb 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -85,9 +85,15 @@ static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
>  
>  static void *etnaviv_gem_prime_vmap_impl(struct etnaviv_gem_object *etnaviv_obj)
>  {
> +	struct dma_buf_map map;
> +	int ret;
> +
>  	lockdep_assert_held(&etnaviv_obj->lock);
>  
> -	return dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf);
> +	ret = dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
> +	if (ret)
> +		return NULL;
> +	return map.vaddr;
>  }
>  
>  static int etnaviv_gem_prime_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index 8dd295dbe241..6ee8f2cfd8c1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -77,11 +77,18 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attachment,
>  	i915_gem_object_unpin_pages(obj);
>  }
>  
> -static void *i915_gem_dmabuf_vmap(struct dma_buf *dma_buf)
> +static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
>  {
>  	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
> +	void *vaddr;
>  
> -	return i915_gem_object_pin_map(obj, I915_MAP_WB);
> +	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
> +	if (IS_ERR(vaddr))
> +		return PTR_ERR(vaddr);
> +
> +	dma_buf_map_set_vaddr(map, vaddr);
> +
> +	return 0;
>  }
>  
>  static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index 2a52b92586b9..f79ebc5329b7 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -82,6 +82,7 @@ static int igt_dmabuf_import(void *arg)
>  	struct drm_i915_gem_object *obj;
>  	struct dma_buf *dmabuf;
>  	void *obj_map, *dma_map;
> +	struct dma_buf_map map;
>  	u32 pattern[] = { 0, 0xaa, 0xcc, 0x55, 0xff };
>  	int err, i;
>  
> @@ -110,7 +111,8 @@ static int igt_dmabuf_import(void *arg)
>  		goto out_obj;
>  	}
>  
> -	dma_map = dma_buf_vmap(dmabuf);
> +	err = dma_buf_vmap(dmabuf, &map);
> +	dma_map = err ? NULL : map.vaddr;
>  	if (!dma_map) {
>  		pr_err("dma_buf_vmap failed\n");
>  		err = -ENOMEM;
> @@ -163,6 +165,7 @@ static int igt_dmabuf_import_ownership(void *arg)
>  	struct drm_i915_private *i915 = arg;
>  	struct drm_i915_gem_object *obj;
>  	struct dma_buf *dmabuf;
> +	struct dma_buf_map map;
>  	void *ptr;
>  	int err;
>  
> @@ -170,7 +173,8 @@ static int igt_dmabuf_import_ownership(void *arg)
>  	if (IS_ERR(dmabuf))
>  		return PTR_ERR(dmabuf);
>  
> -	ptr = dma_buf_vmap(dmabuf);
> +	err = dma_buf_vmap(dmabuf, &map);
> +	ptr = err ? NULL : map.vaddr;
>  	if (!ptr) {
>  		pr_err("dma_buf_vmap failed\n");
>  		err = -ENOMEM;
> @@ -212,6 +216,7 @@ static int igt_dmabuf_export_vmap(void *arg)
>  	struct drm_i915_private *i915 = arg;
>  	struct drm_i915_gem_object *obj;
>  	struct dma_buf *dmabuf;
> +	struct dma_buf_map map;
>  	void *ptr;
>  	int err;
>  
> @@ -228,7 +233,8 @@ static int igt_dmabuf_export_vmap(void *arg)
>  	}
>  	i915_gem_object_put(obj);
>  
> -	ptr = dma_buf_vmap(dmabuf);
> +	err = dma_buf_vmap(dmabuf, &map);
> +	ptr = err ? NULL : map.vaddr;
>  	if (!ptr) {
>  		pr_err("dma_buf_vmap failed\n");
>  		err = -ENOMEM;
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
> index be30b27e2926..becd9fb95d58 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
> @@ -61,11 +61,17 @@ static void mock_dmabuf_release(struct dma_buf *dma_buf)
>  	kfree(mock);
>  }
>  
> -static void *mock_dmabuf_vmap(struct dma_buf *dma_buf)
> +static int mock_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
>  {
>  	struct mock_dmabuf *mock = to_mock(dma_buf);
> +	void *vaddr;
>  
> -	return vm_map_ram(mock->pages, mock->npages, 0);
> +	vaddr = vm_map_ram(mock->pages, mock->npages, 0);
> +	if (!vaddr)
> +		return -ENOMEM;
> +	dma_buf_map_set_vaddr(map, vaddr);
> +
> +	return 0;
>  }
>  
>  static void mock_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index a2bac20ff19d..6f04d7855f95 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -132,14 +132,18 @@ static void tegra_bo_unpin(struct device *dev, struct sg_table *sgt)
>  static void *tegra_bo_mmap(struct host1x_bo *bo)
>  {
>  	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
> +	struct dma_buf_map map;
> +	int ret;
>  
> -	if (obj->vaddr)
> +	if (obj->vaddr) {
>  		return obj->vaddr;
> -	else if (obj->gem.import_attach)
> -		return dma_buf_vmap(obj->gem.import_attach->dmabuf);
> -	else
> +	} else if (obj->gem.import_attach) {
> +		ret = dma_buf_vmap(obj->gem.import_attach->dmabuf, &map);
> +		return ret ? NULL : map.vaddr;
> +	} else {
>  		return vmap(obj->pages, obj->num_pages, VM_MAP,
>  			    pgprot_writecombine(PAGE_KERNEL));
> +	}
>  }
>  
>  static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
> @@ -634,12 +638,14 @@ static int tegra_gem_prime_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
>  	return __tegra_gem_mmap(gem, vma);
>  }
>  
> -static void *tegra_gem_prime_vmap(struct dma_buf *buf)
> +static int tegra_gem_prime_vmap(struct dma_buf *buf, struct dma_buf_map *map)
>  {
>  	struct drm_gem_object *gem = buf->priv;
>  	struct tegra_bo *bo = to_tegra_bo(gem);
>  
> -	return bo->vaddr;
> +	dma_buf_map_set_vaddr(map, bo->vaddr);
> +
> +	return 0;
>  }
>  
>  static void tegra_gem_prime_vunmap(struct dma_buf *buf, void *vaddr)
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index ec3446cc45b8..11428287bdf3 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -81,9 +81,13 @@ static void *vb2_dc_cookie(void *buf_priv)
>  static void *vb2_dc_vaddr(void *buf_priv)
>  {
>  	struct vb2_dc_buf *buf = buf_priv;
> +	struct dma_buf_map map;
> +	int ret;
>  
> -	if (!buf->vaddr && buf->db_attach)
> -		buf->vaddr = dma_buf_vmap(buf->db_attach->dmabuf);
> +	if (!buf->vaddr && buf->db_attach) {
> +		ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
> +		buf->vaddr = ret ? NULL : map.vaddr;
> +	}
>  
>  	return buf->vaddr;
>  }
> @@ -365,11 +369,13 @@ vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>  	return 0;
>  }
>  
> -static void *vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf)
> +static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
>  {
>  	struct vb2_dc_buf *buf = dbuf->priv;
>  
> -	return buf->vaddr;
> +	dma_buf_map_set_vaddr(map, buf->vaddr);
> +
> +	return 0;
>  }
>  
>  static int vb2_dc_dmabuf_ops_mmap(struct dma_buf *dbuf,
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 0a40e00f0d7e..c51170e9c1b9 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -300,14 +300,18 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
>  static void *vb2_dma_sg_vaddr(void *buf_priv)
>  {
>  	struct vb2_dma_sg_buf *buf = buf_priv;
> +	struct dma_buf_map map;
> +	int ret;
>  
>  	BUG_ON(!buf);
>  
>  	if (!buf->vaddr) {
> -		if (buf->db_attach)
> -			buf->vaddr = dma_buf_vmap(buf->db_attach->dmabuf);
> -		else
> +		if (buf->db_attach) {
> +			ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
> +			buf->vaddr = ret ? NULL : map.vaddr;
> +		} else {
>  			buf->vaddr = vm_map_ram(buf->pages, buf->num_pages, -1);
> +		}
>  	}
>  
>  	/* add offset in case userptr is not page-aligned */
> @@ -489,11 +493,13 @@ vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>  	return 0;
>  }
>  
> -static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
> +static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
>  {
>  	struct vb2_dma_sg_buf *buf = dbuf->priv;
>  
> -	return vb2_dma_sg_vaddr(buf);
> +	dma_buf_map_set_vaddr(map, buf->vaddr);
> +
> +	return 0;
>  }
>  
>  static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index c66fda4a65e4..7b68e2379c65 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -318,11 +318,13 @@ static void vb2_vmalloc_dmabuf_ops_release(struct dma_buf *dbuf)
>  	vb2_vmalloc_put(dbuf->priv);
>  }
>  
> -static void *vb2_vmalloc_dmabuf_ops_vmap(struct dma_buf *dbuf)
> +static int vb2_vmalloc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
>  {
>  	struct vb2_vmalloc_buf *buf = dbuf->priv;
>  
> -	return buf->vaddr;
> +	dma_buf_map_set_vaddr(map, buf->vaddr);
> +
> +	return 0;
>  }
>  
>  static int vb2_vmalloc_dmabuf_ops_mmap(struct dma_buf *dbuf,
> @@ -374,10 +376,15 @@ static struct dma_buf *vb2_vmalloc_get_dmabuf(void *buf_priv, unsigned long flag
>  static int vb2_vmalloc_map_dmabuf(void *mem_priv)
>  {
>  	struct vb2_vmalloc_buf *buf = mem_priv;
> +	struct dma_buf_map map;
> +	int ret;
>  
> -	buf->vaddr = dma_buf_vmap(buf->dbuf);
> +	ret = dma_buf_vmap(buf->dbuf, &map);
> +	if (ret)
> +		return -EFAULT;
> +	buf->vaddr = map.vaddr;
>  
> -	return buf->vaddr ? 0 : -EFAULT;
> +	return 0;
>  }
>  
>  static void vb2_vmalloc_unmap_dmabuf(void *mem_priv)
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index 0f69f9fbf12c..5125f84c28f6 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -54,6 +54,7 @@ struct device;
>  struct dma_buf_export_info;
>  struct dma_buf;
>  struct dma_buf_attachment;
> +struct dma_buf_map;
>  
>  enum dma_data_direction;
>  
> @@ -82,7 +83,7 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
>  void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>  			   struct sg_table *sgt,
>  			   enum dma_data_direction dir);
> -void *drm_gem_dmabuf_vmap(struct dma_buf *dma_buf);
> +int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map);
>  void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr);
>  
>  int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> index d4b1bb3cc4b0..6b4f6e0e8b5d 100644
> --- a/include/linux/dma-buf-map.h
> +++ b/include/linux/dma-buf-map.h
> @@ -28,6 +28,19 @@ struct dma_buf_map {
>  	bool is_iomem;
>  };
>  
> +/**
> + * dma_buf_map_set_vaddr - Sets a dma-buf mapping structure to an address in system memory
> + * @map:	The dma-buf mapping structure
> + * @vaddr:	A system-memory address
> + *
> + * Sets the address and clears the I/O-memory flag.
> + */
> +static inline void dma_buf_map_set_vaddr(struct dma_buf_map *map, void *vaddr)
> +{
> +	map->vaddr = vaddr;
> +	map->is_iomem = false;
> +}
> +
>  /* API transition helper */
>  static inline bool dma_buf_map_is_vaddr(const struct dma_buf_map *map, const void *vaddr)
>  {
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index fcc2ddfb6d18..7237997cfa38 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -266,7 +266,7 @@ struct dma_buf_ops {
>  	 */
>  	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>  
> -	void *(*vmap)(struct dma_buf *);
> +	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  	void (*vunmap)(struct dma_buf *, void *vaddr);
>  };
>  
> @@ -503,6 +503,6 @@ int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
>  
>  int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
>  		 unsigned long);
> -void *dma_buf_vmap(struct dma_buf *);
> -void dma_buf_vunmap(struct dma_buf *, void *vaddr);
> +int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr);
>  #endif /* __DMA_BUF_H__ */
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

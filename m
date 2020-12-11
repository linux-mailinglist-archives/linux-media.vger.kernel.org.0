Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 887F22D777A
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 15:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395290AbgLKOKz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 09:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgLKOK2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 09:10:28 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B05C0613CF
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 06:09:47 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id w206so4753150wma.0
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 06:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4QhvW4KbXXIrp9+Qhj7o7xPQJp0jdiLySkXVIaapQ9Q=;
        b=cO5Or0b4RpqTYesEbknReAu2uAR5nHKX41QnjUTpFkWdUK++L6OGRDlqsVpsxksUi6
         dL3IGSSFLOWsWTcr68JnzcrnwiyQXP1nJPEuspJPLQLi1m1NWbUB0nwpuwhsWhgYAdj7
         AdFRrBPvulxqdp/MkfzcTh4HMnyks0TBdEpHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4QhvW4KbXXIrp9+Qhj7o7xPQJp0jdiLySkXVIaapQ9Q=;
        b=HioqFmpEcnrPUDJK9qckXNDnkGhyVj9fMoeYpRfD/7fHX0xF4guN/24l+rvt/B1/yd
         BJiGT6nc6KrNV1moLgbUprvkcFiw4BO0d798jrPyE8HLwEG5KnuJlb/tmdpMJh1dyDDJ
         +ZniyyQ5aGzjagVcRAVrVT85OVSBDU36PVu41fgGXc+G4vOaH2LC4UK5rVO/7Edfe8Pz
         zJYl4JGa6tNODb7h/R4FKQNucDiUdIkwBeWbwFw/4YvQrqs+QJRkUZ32TcX3Q6uHtoaq
         7DvO4c2oEf6LhFHATUeyf+wmGdadZtT2OH3hOhqa3QBPkoCmxabV4a08DGUSsF/4q30T
         SaVw==
X-Gm-Message-State: AOAM530D7S1gTv6An2CfbQV4+UdJfGFMBkBTF3wEIJCv1XuX5We4xs7H
        GSdq8l/KZUVDE+lNrmbv7JGqBQ==
X-Google-Smtp-Source: ABdhPJyqfafn2JBffE/PGu+/+8NsXlYe+FfW3m2tZDsukg2E3RoWHooF6Jrzhl9SEmASUvCargeJQw==
X-Received: by 2002:a1c:ba44:: with SMTP id k65mr13770646wmf.188.1607695786397;
        Fri, 11 Dec 2020 06:09:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a21sm13991329wmb.38.2020.12.11.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 06:09:45 -0800 (PST)
Date:   Fri, 11 Dec 2020 15:09:43 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
        sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v3 3/8] dma-buf: Add vmap_local and vnumap_local
 operations
Message-ID: <20201211140943.GT401619@phenom.ffwll.local>
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209142527.26415-4-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 09, 2020 at 03:25:22PM +0100, Thomas Zimmermann wrote:
> The existing dma-buf calls dma_buf_vmap() and dma_buf_vunmap() are
> allowed to pin the buffer or acquire the buffer's reservation object
> lock.
> 
> This is a problem for callers that only require a short-term mapping
> of the buffer without the pinning, or callers that have special locking
> requirements. These may suffer from unnecessary overhead or interfere
> with regular pin operations.
> 
> The new interfaces dma_buf_vmap_local(), dma_buf_vunmapo_local(), and
> their rsp callbacks in struct dma_buf_ops provide an alternative without
> pinning or reservation locking. Callers are responsible for these
> operations.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/dma-buf/dma-buf.c | 80 +++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-buf.h   | 34 +++++++++++++++++
>  2 files changed, 114 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index e63684d4cd90..be9f80190a66 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1265,6 +1265,86 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_vunmap);
>  
> +/**
> + * dma_buf_vmap_local - Create virtual mapping for the buffer object into kernel
> + * address space.
> + * @dmabuf:	[in]	buffer to vmap
> + * @map:	[out]	returns the vmap pointer
> + *
> + * This call may fail due to lack of virtual mapping address space.
> + * These calls are optional in drivers. The intended use for them
> + * is for mapping objects linear in kernel space for high use objects.
> + * Please attempt to use kmap/kunmap before thinking about these interfaces.

We also need to specify whether callers need to call dma_buf_begin/end_cpu
access around these or not. For current implementations it doesn't matter,
but if you want to convert udl/gm12u320, it will.

I think requiring an explicit call would be good, for more consistency
with how normal vmap works.
-Daniel

> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + */
> +int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map)
> +{
> +	struct dma_buf_map ptr;
> +	int ret = 0;
> +
> +	dma_buf_map_clear(map);
> +
> +	if (WARN_ON(!dmabuf))
> +		return -EINVAL;
> +
> +	dma_resv_assert_held(dmabuf->resv);
> +
> +	if (!dmabuf->ops->vmap_local)
> +		return -EINVAL;
> +
> +	mutex_lock(&dmabuf->lock);
> +	if (dmabuf->vmapping_counter) {
> +		dmabuf->vmapping_counter++;
> +		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
> +		*map = dmabuf->vmap_ptr;
> +		goto out_unlock;
> +	}
> +
> +	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
> +
> +	ret = dmabuf->ops->vmap_local(dmabuf, &ptr);
> +	if (WARN_ON_ONCE(ret))
> +		goto out_unlock;
> +
> +	dmabuf->vmap_ptr = ptr;
> +	dmabuf->vmapping_counter = 1;
> +
> +	*map = dmabuf->vmap_ptr;
> +
> +out_unlock:
> +	mutex_unlock(&dmabuf->lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_vmap_local);
> +
> +/**
> + * dma_buf_vunmap_local - Unmap a vmap obtained by dma_buf_vmap_local.
> + * @dmabuf:	[in]	buffer to vunmap
> + * @map:	[in]	vmap pointer to vunmap
> + */
> +void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map)
> +{
> +	if (WARN_ON(!dmabuf))
> +		return;
> +
> +	dma_resv_assert_held(dmabuf->resv);
> +
> +	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
> +	BUG_ON(dmabuf->vmapping_counter == 0);
> +	BUG_ON(!dma_buf_map_is_equal(&dmabuf->vmap_ptr, map));
> +
> +	mutex_lock(&dmabuf->lock);
> +	if (--dmabuf->vmapping_counter == 0) {
> +		if (dmabuf->ops->vunmap_local)
> +			dmabuf->ops->vunmap_local(dmabuf, map);
> +		dma_buf_map_clear(&dmabuf->vmap_ptr);
> +	}
> +	mutex_unlock(&dmabuf->lock);
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_vunmap_local);
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  {
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index cf72699cb2bc..f66580d23a9b 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -269,6 +269,38 @@ struct dma_buf_ops {
>  
>  	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +
> +	/**
> +	 * @vmap_local:
> +	 *
> +	 * Creates a virtual mapping for the buffer into kernel address space.
> +	 *
> +	 * This callback establishes short-term mappings for situations where
> +	 * callers only use the buffer for a bounded amount of time; such as
> +	 * updates to the framebuffer or reading back contained information.
> +	 * In contrast to the regular @vmap callback, vmap_local does never pin
> +	 * the buffer to a specific domain or acquire the buffer's reservation
> +	 * lock.
> +	 *
> +	 * This is called with the dmabuf->resv object locked. Callers must hold
> +	 * the lock until after removing the mapping with @vunmap_local.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * Returns:
> +	 *
> +	 * 0 on success or a negative error code on failure.
> +	 */
> +	int (*vmap_local)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +
> +	/**
> +	 * @vunmap_local:
> +	 *
> +	 * Removes a virtual mapping that wa sestablished by @vmap_local.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*vunmap_local)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  };
>  
>  /**
> @@ -506,4 +538,6 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
>  		 unsigned long);
>  int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  #endif /* __DMA_BUF_H__ */
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

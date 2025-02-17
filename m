Return-Path: <linux-media+bounces-26226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BE5A3890A
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 17:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2BD51648F6
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 16:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9805224B1C;
	Mon, 17 Feb 2025 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="BIv5dqWU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C8C29408
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739809477; cv=none; b=j/KQ1nIj1maRFJY+aw/uAzyQQdWAqrFFD7N8gTWkKoBeOPrt0JNhIB4NaAhBHyMY+LjvF2z2xE0VHgfh71hbST3a2jbTdaMIrSOLlJgaaXnSoQKAzl0C/+igvw0yWEDFzmuT00yhsC1vgBT5mHNJpfBZ7+9umViakQko7HrFrIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739809477; c=relaxed/simple;
	bh=H8Lz8GN0WaumWNVCZsJuaLKHtFeFLnUhKImXrdNxccM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZ9ASFi6YThs62PauZT/OL1EtabOnA2fVdHhWrTNj3cXsKRdtdlb+ZxV3Mn65Kpp6rDG2lRiOferVpUoZ/j1GYmtLUVc4wM3AUwonetg+uA2gTR6CkRmVmaSr7V3Yz93IlyD+LXJUbiG8hpbzcb1apc0aVtihPP+r9/7wDxKt0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=BIv5dqWU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4396d2e32b7so17438835e9.0
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 08:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1739809472; x=1740414272; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cVpiBEwmTZ+hIf3rfr0Tri2GW3LedUj1k1zkfGPuiS8=;
        b=BIv5dqWU1z0VBBqFHjzBfuNtOM3n/u3hZlepaG5V0C5F3X3gsdpqcGSUvOJei7ogfw
         nhDsRjgOXHhLtjTes6V1U8AAF872nldVnHbddOxALTvJSmHOhYaXK9Y2BTMcyprYovhY
         Lv/l2bh+F2+0ZABk5NnW1KEbn/AijGLdgqNZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739809472; x=1740414272;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cVpiBEwmTZ+hIf3rfr0Tri2GW3LedUj1k1zkfGPuiS8=;
        b=wwGUz91Pol9/PEX/AtowNzb6BAp3WGdIsGpMU92IrTb1KHUhgj5x1DQoDCgu4yVf3j
         HLNCde5T8lE2a+n2k1CrPuOhoRskEl7BqnHi5RNdd/QlDNACOwTbmLjmQIq8/aRXDt9g
         L7RSg1vYTEnpcrgDujA1HaG9faKlOBks4Xcuhbu2keOxZXTk92VmFVd5Z+08w4uujYqE
         Viq6HDL3pBaf4biHV8azjluwThPVyTKRpV0XSODOhfjqOl56+FddpxMSy7LVfigHdYub
         eurpiqbCfzOBtHBQGs4yxocPNc7onChWRuqq5bQfygnlGS3CjY5DpNXVh1aGUaqUFqn1
         eHqg==
X-Forwarded-Encrypted: i=1; AJvYcCWhKLQN2hnYEBJvLN8cop5SyVBOwlYOoqyXCoOXs+4thcZWPgp+RV4rIua5rRna7qTdjYNy4Aq2pSU5Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1fJZOIYeTUP5dC75s1Z6V0PFLTzurbVcLOSghCzUn0/PD3jWS
	8jfwbsUtLt8nHtSNC/FKT2qG0dWnAmeuMJbFkl2D2beW3BZnt89s1UEpVQTWu+Q=
X-Gm-Gg: ASbGncuiy0OKSW7LqLYCWUwgFWnyT45ZLZCBOCfyu8tUNjj4qsrEEgz91cG6utVpo0A
	01rCF/VV8mnblaHmfmpFDy7TqPBL7uYikkCndKacrPed1pCWaTWAGQ1GO55QKSy10BxRuRgfJD2
	SO1MTKw7B4K+lmMlPX71BmvhuUAqIv2aS6gO1OzTYxJYQLaktPohPz45wc1YL4ZajwWsY0MMdl0
	Lt8QUtEqZR4u/rEEkzRA6PBpFZb3NIjwCdMxDjEYr/FUQr5/TCaF+52qoat8drZGfBWqNMr0GkM
	PGGDGkGvpfHAPB3/XVSBMMlA2v0=
X-Google-Smtp-Source: AGHT+IFX0aTtATY/VLNjmT4pi2siZ81mv7Hi+dm14O+B6Sur7KDWc6qse8YbKRPTU1RFieIuBpqeNA==
X-Received: by 2002:a05:6000:154f:b0:38f:2093:6e75 with SMTP id ffacd0b85a97d-38f33f3599fmr10217014f8f.33.1739809472473;
        Mon, 17 Feb 2025 08:24:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4158sm12553149f8f.3.2025.02.17.08.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:24:31 -0800 (PST)
Date: Mon, 17 Feb 2025 17:24:30 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
	dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 3/4] dma-buf: dma-buf: stop mapping sg_tables on attach
Message-ID: <Z7NivTrXl5NiGw-k@phenom.ffwll.local>
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-4-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211163109.12200-4-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Tue, Feb 11, 2025 at 05:31:08PM +0100, Christian König wrote:
> As a workaround to smoothly transit from static to dynamic DMA-buf
> handling we cached the sg_table on attach if dynamic handling mismatched
> between exporter and importer.
> 
> Since Dmitry and Thomas cleaned that up and also documented the lock
> handling we can drop this workaround now.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf.c | 149 ++++++++++++++------------------------
>  include/linux/dma-buf.h   |  14 ----
>  2 files changed, 56 insertions(+), 107 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 5baa83b85515..357b94a3dbaa 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -782,7 +782,7 @@ static void mangle_sg_table(struct sg_table *sg_table)
>  
>  	/* To catch abuse of the underlying struct page by importers mix
>  	 * up the bits, but take care to preserve the low SG_ bits to
> -	 * not corrupt the sgt. The mixing is undone in __unmap_dma_buf
> +	 * not corrupt the sgt. The mixing is undone on unmap
>  	 * before passing the sgt back to the exporter.
>  	 */
>  	for_each_sgtable_sg(sg_table, sg, i)
> @@ -790,29 +790,20 @@ static void mangle_sg_table(struct sg_table *sg_table)
>  #endif
>  
>  }
> -static struct sg_table *__map_dma_buf(struct dma_buf_attachment *attach,
> -				       enum dma_data_direction direction)
> -{
> -	struct sg_table *sg_table;
> -	signed long ret;
> -
> -	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
> -	if (IS_ERR_OR_NULL(sg_table))
> -		return sg_table;
> -
> -	if (!dma_buf_attachment_is_dynamic(attach)) {
> -		ret = dma_resv_wait_timeout(attach->dmabuf->resv,
> -					    DMA_RESV_USAGE_KERNEL, true,
> -					    MAX_SCHEDULE_TIMEOUT);
> -		if (ret < 0) {
> -			attach->dmabuf->ops->unmap_dma_buf(attach, sg_table,
> -							   direction);
> -			return ERR_PTR(ret);
> -		}
> -	}
>  
> -	mangle_sg_table(sg_table);
> -	return sg_table;
> +/**
> + * dma_buf_pin_on_map - check if a DMA-buf should be pinned when mapped
> + * @attach: the DMA-buf attachment to check

Generally we don't do kerneldoc for static helper functions, the function
name should be clear enough here. I think you can just delete this.

> + *
> + * Returns: True if a DMA-buf export provided pin/unpin callbacks and we can't
> + * use the importers move notify for some reason.
> + */
> +static bool
> +dma_buf_pin_on_map(struct dma_buf_attachment *attach)
> +{
> +	return attach->dmabuf->ops->pin &&
> +		(!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) ||
> +		 !attach->importer_ops);

I think moving the dma_buf_attachment_is_dynamic helper into this file
right above as a static inline helper without kerneldoc would be good,
just as a piece of self-documentation of what this check here means. It's
a bit opaque otherwise, and if we add more importer_ops we might screw
this up otherwise.

>  }
>  
>  /**
> @@ -935,48 +926,11 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  	list_add(&attach->node, &dmabuf->attachments);
>  	dma_resv_unlock(dmabuf->resv);
>  
> -	/* When either the importer or the exporter can't handle dynamic
> -	 * mappings we cache the mapping here to avoid issues with the
> -	 * reservation object lock.
> -	 */
> -	if (dma_buf_attachment_is_dynamic(attach) !=
> -	    dma_buf_is_dynamic(dmabuf)) {
> -		struct sg_table *sgt;
> -
> -		dma_resv_lock(attach->dmabuf->resv, NULL);
> -		if (dma_buf_is_dynamic(attach->dmabuf)) {
> -			ret = dmabuf->ops->pin(attach);
> -			if (ret)
> -				goto err_unlock;
> -		}
> -
> -		sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
> -		if (!sgt)
> -			sgt = ERR_PTR(-ENOMEM);
> -		if (IS_ERR(sgt)) {
> -			ret = PTR_ERR(sgt);
> -			goto err_unpin;
> -		}
> -		dma_resv_unlock(attach->dmabuf->resv);
> -		attach->sgt = sgt;
> -		attach->dir = DMA_BIDIRECTIONAL;
> -	}
> -
>  	return attach;
>  
>  err_attach:
>  	kfree(attach);
>  	return ERR_PTR(ret);
> -
> -err_unpin:
> -	if (dma_buf_is_dynamic(attach->dmabuf))
> -		dmabuf->ops->unpin(attach);
> -
> -err_unlock:
> -	dma_resv_unlock(attach->dmabuf->resv);
> -
> -	dma_buf_detach(dmabuf, attach);
> -	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
>  
> @@ -995,16 +949,6 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
>  
> -static void __unmap_dma_buf(struct dma_buf_attachment *attach,
> -			    struct sg_table *sg_table,
> -			    enum dma_data_direction direction)
> -{
> -	/* uses XOR, hence this unmangles */
> -	mangle_sg_table(sg_table);
> -
> -	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
> -}
> -
>  /**
>   * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
>   * @dmabuf:	[in]	buffer to detach from.
> @@ -1022,11 +966,12 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>  	dma_resv_lock(dmabuf->resv, NULL);
>  
>  	if (attach->sgt) {
> +		mangle_sg_table(attach->sgt);
> +		attach->dmabuf->ops->unmap_dma_buf(attach, attach->sgt,
> +						   attach->dir);
>  
> -		__unmap_dma_buf(attach, attach->sgt, attach->dir);
> -
> -		if (dma_buf_is_dynamic(attach->dmabuf))
> -			dmabuf->ops->unpin(attach);
> +		if (dma_buf_pin_on_map(attach))
> +			dma_buf_unpin(attach);
>  	}
>  	list_del(&attach->node);
>  
> @@ -1058,7 +1003,7 @@ int dma_buf_pin(struct dma_buf_attachment *attach)
>  	struct dma_buf *dmabuf = attach->dmabuf;
>  	int ret = 0;
>  
> -	WARN_ON(!dma_buf_attachment_is_dynamic(attach));
> +	WARN_ON(!attach->importer_ops);
>  
>  	dma_resv_assert_held(dmabuf->resv);
>  
> @@ -1081,7 +1026,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
>  {
>  	struct dma_buf *dmabuf = attach->dmabuf;
>  
> -	WARN_ON(!dma_buf_attachment_is_dynamic(attach));
> +	WARN_ON(!attach->importer_ops);
>  
>  	dma_resv_assert_held(dmabuf->resv);
>  
> @@ -1115,7 +1060,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  					enum dma_data_direction direction)
>  {
>  	struct sg_table *sg_table;
> -	int r;
> +	signed long ret;
>  
>  	might_sleep();
>  
> @@ -1136,29 +1081,37 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  		return attach->sgt;
>  	}
>  
> -	if (dma_buf_is_dynamic(attach->dmabuf)) {
> -		if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> -			r = attach->dmabuf->ops->pin(attach);
> -			if (r)
> -				return ERR_PTR(r);
> -		}
> +	if (dma_buf_pin_on_map(attach)) {
> +		ret = attach->dmabuf->ops->pin(attach);
> +		if (ret)

I do wonder whether we should have a WARN_ON(ret = -EBUSY) or similar, to
catch drivers who've moved the memory to an unsuitable place despite
attachments existing?

> +			return ERR_PTR(ret);
>  	}
>  
> -	sg_table = __map_dma_buf(attach, direction);

> +	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
>  	if (!sg_table)
>  		sg_table = ERR_PTR(-ENOMEM);
> +	if (IS_ERR(sg_table))
> +		goto error_unpin;
>  
> -	if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
> -	     !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> -		attach->dmabuf->ops->unpin(attach);
> +	/*
> +	 * When not providing ops the importer doesn't wait for fences either.
> +	 */
> +	if (!attach->importer_ops) {

Yeah we definitely want to keep this static helper function to make this
check less opaque. Also I think this is strictly speaking only needed for
the dma_buf_pin_on_map case and not for everyone, plus there shouldn't be
any harm to do this after pinning, but before calling map_dma_buf. But
maybe better to leave as-is.

> +		ret = dma_resv_wait_timeout(attach->dmabuf->resv,
> +					    DMA_RESV_USAGE_KERNEL, true,
> +					    MAX_SCHEDULE_TIMEOUT);
> +		if (ret < 0)
> +			goto error_unmap;
> +	}
> +	mangle_sg_table(sg_table);
>  
> -	if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
> +	if (attach->dmabuf->ops->cache_sgt_mapping) {
>  		attach->sgt = sg_table;
>  		attach->dir = direction;
>  	}
>  
>  #ifdef CONFIG_DMA_API_DEBUG
> -	if (!IS_ERR(sg_table)) {
> +	{
>  		struct scatterlist *sg;
>  		u64 addr;
>  		int len;
> @@ -1175,6 +1128,16 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  	}
>  #endif /* CONFIG_DMA_API_DEBUG */
>  	return sg_table;
> +
> +error_unmap:
> +	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
> +	sg_table = ERR_PTR(ret);
> +
> +error_unpin:
> +	if (dma_buf_pin_on_map(attach))
> +		attach->dmabuf->ops->unpin(attach);
> +
> +	return sg_table;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, "DMA_BUF");
>  
> @@ -1230,11 +1193,11 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>  	if (attach->sgt == sg_table)
>  		return;
>  
> -	__unmap_dma_buf(attach, sg_table, direction);
> +	mangle_sg_table(sg_table);
> +	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>  
> -	if (dma_buf_is_dynamic(attach->dmabuf) &&
> -	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> -		dma_buf_unpin(attach);
> +	if (dma_buf_pin_on_map(attach))
> +		attach->dmabuf->ops->unpin(attach);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, "DMA_BUF");
>  
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 36216d28d8bd..c54ff2dda8cb 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -583,20 +583,6 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
>  	return !!dmabuf->ops->pin;
>  }
>  
> -/**
> - * dma_buf_attachment_is_dynamic - check if a DMA-buf attachment uses dynamic
> - * mappings
> - * @attach: the DMA-buf attachment to check
> - *
> - * Returns true if a DMA-buf importer wants to call the map/unmap functions with
> - * the dma_resv lock held.

Yeah this kerneldoc is a bit much outdated :-)

> - */
> -static inline bool
> -dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
> -{
> -	return !!attach->importer_ops;
> -}

With the nits addressed:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima


> -
>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  					  struct device *dev);
>  struct dma_buf_attachment *
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch


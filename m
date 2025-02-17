Return-Path: <linux-media+bounces-26227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E38FCA3891A
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 17:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E811B3AA438
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 16:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE9D2253BB;
	Mon, 17 Feb 2025 16:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Js6SHsiG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD842248B6
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 16:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739809691; cv=none; b=WNObGAn9IIFCxAtltZheyiV1fWNFdVUrSyFuc2+qtqPgXvJJIt2OGhb4a3M+WILL7b07zJqxXudK2yV5nfz7cT6wLYWLrtxlMAfiKBrOMaDCUC99YbvIUiKFPbBZYrNDME7z9OIkaX3Ir0VdIFuvHbiJlj3/V5xf8iq/zGu0rK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739809691; c=relaxed/simple;
	bh=flrHOU+d6jEGDtMoqHEY53uuQKbhM/oEEpKeCg9Kvyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D60zxmuPjevQMtjek4aMd9hFg+jiLaKyhY/ncvQKLkoelXk6fipOKXyGGEJSiqOGH+YvM4E4KRVH00vnNtLV/1p15vRiy3na70lYE4/Qk3thi4bmvZXJryUY+knylyIZvNJPDAGT8VxlSuiJALOlriLCmnt4uOVhV9SRPyRTfeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Js6SHsiG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so2736046f8f.0
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 08:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1739809688; x=1740414488; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N/MZAQpQPgkaOz9Nq3UpoejEMSS/cNqsJ8jUh5q1IAs=;
        b=Js6SHsiGbPgoPqmwYVajgwPspYV9viUcMXQrgW57ka79EoBSeMwZDUldkMRV+Wzh2q
         MA21mnLFr6YRia5Cc4B9VM1cN/g4IxguRFSF8JlePTSquqlR5NWsp8EnDok1TSKj3rAc
         eGO0tQWsZww7bOBpM5q60Ug9ZZsev4wIx73U4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739809688; x=1740414488;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/MZAQpQPgkaOz9Nq3UpoejEMSS/cNqsJ8jUh5q1IAs=;
        b=s2Cn3HPlMromGYPNtwWkAMPdWc/jxpsFGkjfRFqCWrv9zx+c+55wBV5ZaiZLIuMV7S
         xkQSaxkamcoXG9RS/wDzBb8yDZFT9wB4rPsuIfsDOilyqSlefDpOfeHhJyFxfqwyIu1S
         buiDA4gOAa5pwA5w7aGM695rW4eyIPFmBBubQFd0wc2cJlbfOy4lNZtAlwfp9F0mFYRD
         +a3o9MFFVIuPUTj2cN9JH8oeAciolkeG6pk+lPzqNN+K6C0zsWTtDHiceFX+x/qWXT4Q
         AsyCDbE3c/2wpruGJmbbvwj7k6q/9L+t2nLFlhERYFQTiMdFETWRk/Cp6RVcp9UfUquw
         PL+w==
X-Forwarded-Encrypted: i=1; AJvYcCWh6uxrTvYSlJRZBMjjv1HbPd1DV3s0FNF/dPZvEcdAQxYyHwgVkXmBfGckkiZdCr75bW4Jc+YU3xnbSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyRqoTX8wiaJAGOlQvSCGAs+MhFGbV5iKsAIe7qSSCYQkh4JZv
	bJA5JUw5KP7/45ORa+rVZjwNgiGMly1xloBLuUIw0DmvBqgXd+2WIbrfNld+aKE=
X-Gm-Gg: ASbGncusbHjsIkn/nIlIRL0KiAJa/2cUtLjqOLj5sQhOCJ+zx6br2tDz9ArhE7HyanJ
	pemb9z03NDiHyRRv4+YEQdyEaWkqRCVyYJB+dJ218WEewTf2Ny0mYd+KHdrvGEknslI/3biGCWB
	0PL+wp3D/iXGcyK85p4pgHZph4hdlqoZPEu7hZEoo8ydzoVgZ4KCyhGRCNhB42kQJjZJV7SyyrY
	YXFq+LkYYB3UaoFHlVnNb/7cTzIrlx4UpA3cTo+Q1cvOu4uzLFOzlLE4cPzy7JTuEgHd/VT2uYt
	kRPsFJFJL1iI3h9CKPBdohahxzc=
X-Google-Smtp-Source: AGHT+IHu9KoE7wj7SL+2GqP0NTYUrWqabVAskWhzzDZBN8Yy0ohp5PY3zQnOSOQ2f5sInwhpbEhIFA==
X-Received: by 2002:a5d:44d1:0:b0:38f:2176:45a0 with SMTP id ffacd0b85a97d-38f33f511edmr8418553f8f.33.1739809688126;
        Mon, 17 Feb 2025 08:28:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddbb2sm12438602f8f.40.2025.02.17.08.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:28:07 -0800 (PST)
Date: Mon, 17 Feb 2025 17:28:05 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
	dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 4/4] dma-buf: drop caching of sg_tables
Message-ID: <Z7NjlfKYlxhTgRqe@phenom.ffwll.local>
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-5-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211163109.12200-5-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Tue, Feb 11, 2025 at 05:31:09PM +0100, Christian König wrote:
> That was purely for the transition from static to dynamic dma-buf
> handling and can be removed again now.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Yay!

Might uncover some fun if people have meanwhile started to rely on this
for perf or something. But we'll figure that out when it happens.

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>


> ---
>  drivers/dma-buf/dma-buf.c              | 34 --------------------------
>  drivers/dma-buf/udmabuf.c              |  1 -
>  drivers/gpu/drm/drm_prime.c            |  1 -
>  drivers/gpu/drm/virtio/virtgpu_prime.c |  1 -
>  include/linux/dma-buf.h                | 13 ----------
>  5 files changed, 50 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 357b94a3dbaa..35221c4ddbf5 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -636,10 +636,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  		    || !exp_info->ops->release))
>  		return ERR_PTR(-EINVAL);
>  
> -	if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
> -		    (exp_info->ops->pin || exp_info->ops->unpin)))
> -		return ERR_PTR(-EINVAL);
> -
>  	if (WARN_ON(!exp_info->ops->pin != !exp_info->ops->unpin))
>  		return ERR_PTR(-EINVAL);
>  
> @@ -964,17 +960,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>  		return;
>  
>  	dma_resv_lock(dmabuf->resv, NULL);
> -
> -	if (attach->sgt) {
> -		mangle_sg_table(attach->sgt);
> -		attach->dmabuf->ops->unmap_dma_buf(attach, attach->sgt,
> -						   attach->dir);
> -
> -		if (dma_buf_pin_on_map(attach))
> -			dma_buf_unpin(attach);
> -	}
>  	list_del(&attach->node);
> -
>  	dma_resv_unlock(dmabuf->resv);
>  
>  	if (dmabuf->ops->detach)
> @@ -1069,18 +1055,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  
>  	dma_resv_assert_held(attach->dmabuf->resv);
>  
> -	if (attach->sgt) {
> -		/*
> -		 * Two mappings with different directions for the same
> -		 * attachment are not allowed.
> -		 */
> -		if (attach->dir != direction &&
> -		    attach->dir != DMA_BIDIRECTIONAL)
> -			return ERR_PTR(-EBUSY);
> -
> -		return attach->sgt;
> -	}
> -
>  	if (dma_buf_pin_on_map(attach)) {
>  		ret = attach->dmabuf->ops->pin(attach);
>  		if (ret)
> @@ -1105,11 +1079,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  	}
>  	mangle_sg_table(sg_table);
>  
> -	if (attach->dmabuf->ops->cache_sgt_mapping) {
> -		attach->sgt = sg_table;
> -		attach->dir = direction;
> -	}
> -
>  #ifdef CONFIG_DMA_API_DEBUG
>  	{
>  		struct scatterlist *sg;
> @@ -1190,9 +1159,6 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>  
>  	dma_resv_assert_held(attach->dmabuf->resv);
>  
> -	if (attach->sgt == sg_table)
> -		return;
> -
>  	mangle_sg_table(sg_table);
>  	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>  
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index cc7398cc17d6..2fa2c9135eac 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -285,7 +285,6 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
>  }
>  
>  static const struct dma_buf_ops udmabuf_ops = {
> -	.cache_sgt_mapping = true,
>  	.map_dma_buf	   = map_udmabuf,
>  	.unmap_dma_buf	   = unmap_udmabuf,
>  	.release	   = release_udmabuf,
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 32a8781cfd67..c284f306d597 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -810,7 +810,6 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
>  EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
>  
>  static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
> -	.cache_sgt_mapping = true,
>  	.attach = drm_gem_map_attach,
>  	.detach = drm_gem_map_detach,
>  	.map_dma_buf = drm_gem_map_dma_buf,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index fe6a0b018571..c6f3be3cb914 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -75,7 +75,6 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>  
>  static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>  	.ops = {
> -		.cache_sgt_mapping = true,
>  		.attach = virtio_dma_buf_attach,
>  		.detach = drm_gem_map_detach,
>  		.map_dma_buf = virtgpu_gem_map_dma_buf,
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index c54ff2dda8cb..544f8f8c3f44 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -34,15 +34,6 @@ struct dma_buf_attachment;
>   * @vunmap: [optional] unmaps a vmap from the buffer
>   */
>  struct dma_buf_ops {
> -	/**
> -	  * @cache_sgt_mapping:
> -	  *
> -	  * If true the framework will cache the first mapping made for each
> -	  * attachment. This avoids creating mappings for attachments multiple
> -	  * times.
> -	  */
> -	bool cache_sgt_mapping;
> -
>  	/**
>  	 * @attach:
>  	 *
> @@ -493,8 +484,6 @@ struct dma_buf_attach_ops {
>   * @dmabuf: buffer for this attachment.
>   * @dev: device attached to the buffer.
>   * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
> - * @sgt: cached mapping.
> - * @dir: direction of cached mapping.
>   * @peer2peer: true if the importer can handle peer resources without pages.
>   * @priv: exporter specific attachment data.
>   * @importer_ops: importer operations for this attachment, if provided
> @@ -514,8 +503,6 @@ struct dma_buf_attachment {
>  	struct dma_buf *dmabuf;
>  	struct device *dev;
>  	struct list_head node;
> -	struct sg_table *sgt;
> -	enum dma_data_direction dir;
>  	bool peer2peer;
>  	const struct dma_buf_attach_ops *importer_ops;
>  	void *importer_priv;
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch


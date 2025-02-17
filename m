Return-Path: <linux-media+bounces-26240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A06A38D3A
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 21:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01E6016E8CA
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 20:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D461B238D32;
	Mon, 17 Feb 2025 20:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="MFUxHXsC"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB47234970
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 20:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739823777; cv=pass; b=c5oGFIwTj6uGICRO9mrSo6sgGZ9pUxM+q7FxnuNON2KddE2tgSasPNHgAoXZNLCR/bXGJEHoWp1IEtVn8kuQn4tU7iOiqbiC2w+MTRqYnHvp2jC6iT75stFjvVNsIIa/Lh2qOJ90OskmBDWZrmgRldibDXjhwVChVXrku1a3+7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739823777; c=relaxed/simple;
	bh=Bj9UgiNlCGilZ7e2sUFLKyIxpgy2lzBt6YvF5L3M90Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=al69PSx2WuC/+PJKfGRF+GmbuI3mCitPrxRedfQy115d9EsUZNy4QzX8h3sqpoggvMV+XRleS7c67vPLfxU/WvNQQke4gvjJ8wTQrkTVjvyPKV4hsagsjdFASM/n9Kfj5w2IAFBBbvMLsv/fdLMwPr2/+zjlehwQgt/gdgEslHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=MFUxHXsC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739823755; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PLsXQ8xq6815PjCjxwan4JigXpbgSCW9xvOrUDQ7GuH2zs7/Mke0CSLnUvBr6Sc4viZ+oFZVbClU3D4CDuWBE1kDqh51OWg0cOf0mpYWSokqN6/tIxwvpNCF8qw6GJUg2GhMXBj/v0mhI2XlvbAGO0dOQQdulNbBuw6LXEyjl+E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739823755; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=oYK8HtL6hU83tHUOUvmkCOFreaCSI77gBPvO2xZzI8U=; 
	b=R8vBtO2uAtoudwTG9IBM3trB5sVW91RGLov4wMat657qPuGt9LTmHq9Wu5xDE1PqaNmvcOhckQ+0gCmkx4rnOYQAo9W6DG0WkUro5Bt0DTmyJF3wsxjFiGvpQBhkKmlZ7xxWY1FdEtioBkR2ARtVFeFrV6xt1xUfniyN18iM5Q0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739823755;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=oYK8HtL6hU83tHUOUvmkCOFreaCSI77gBPvO2xZzI8U=;
	b=MFUxHXsCPLys63oFu3NzZuSo6Dl7fbSW+7pkLswyTmr9N0NomWroB13izPpsfnZ+
	TDNfWE7hm/QBnFVxLC6vb8y6MQEcKTvKjtuIfjyA4Tnw+MBWh87V8utwsffXVbJp3QZ
	nmjOh3XUUzYA2oOX6NQrwSgOIlcX4BKizLUi75q8=
Received: by mx.zohomail.com with SMTPS id 1739823752381602.7783641410341;
	Mon, 17 Feb 2025 12:22:32 -0800 (PST)
Message-ID: <2a000258-5d07-438f-b8d2-77e138097698@collabora.com>
Date: Mon, 17 Feb 2025 23:22:28 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dma-buf: drop caching of sg_tables
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 tvrtko.ursulin@igalia.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-5-christian.koenig@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250211163109.12200-5-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 2/11/25 19:31, Christian König wrote:
> That was purely for the transition from static to dynamic dma-buf
> handling and can be removed again now.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
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

Recalling being very confused by this cached sgt many years ago when
faced it for the first time :)

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry


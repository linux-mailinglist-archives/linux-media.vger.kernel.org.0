Return-Path: <linux-media+bounces-60452-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULm6BM4Q+mntIgMAu9opvQ
	(envelope-from <linux-media+bounces-60452-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 17:46:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB404D080A
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 17:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CF06304F2EF
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 15:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A9548A2A8;
	Tue,  5 May 2026 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TVnQwlNn"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCFE17A31E;
	Tue,  5 May 2026 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995931; cv=none; b=iXgDxDVoR4PsQFw9sRpfkHxu4WDtPcZTedPqdFuhf6nTMaZ9/vL3/RFgcRMIADfEXEUg82AX5H4y95K5EH7UP9Q2rYG0sC5FkA/ovhc0+e+dFR7cYPrqcLmj0W/Xsj41/JEyiYqNT5Yr/tBEf3E+QczlTGiOrivn7vo/QDiwzP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995931; c=relaxed/simple;
	bh=jBx8nB9b6bnSOdq1Lg0Zmli8skt3ZB3P8uirgX2ef6E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OR7uv9DyYiOhSExN4X6+yYTqcz41LYBh5+uJTu2M6PVWhP36ZNXkxD3P9E2itNAAiQiiYiLwowGDdrQ1/JRZ395VVSvTDAIO9yUfgttO+y74/DfagBE45PSjVNsBxm0f3GFwGydP7ygdY7mwM1wTWSRidoqe3TT8FEULg0e0I4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TVnQwlNn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777995928;
	bh=jBx8nB9b6bnSOdq1Lg0Zmli8skt3ZB3P8uirgX2ef6E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TVnQwlNnhVc/ZN7PyO7X+H+GzfbfoPlX794s3ooDIRI2/+3CaYrrJAj4C1cGixQmm
	 ffGLgHU0nrOlGKWiilu4yeC9F13it7AtoUIgNOwvdcW50nxVRIGqM5GtSC6mn13eB3
	 PoC6ff/ZzvtEApEPYuMrfXvIDZoJyDLrTVDT+ie9R/Tl8nzLxoj9zyaWFaqH4hJjcL
	 Ig9Jr1fR2Z4PUXSFWKcdYcve2ERp2IZARnxBpjoZPk4mfgfrtZuVPNwtUY0aXYVgDK
	 vV0XSomsNSK3WR22a15kmCrueH0J2UVUXt7Yfywt7thP3sCEMTJ94J35SmX7qB/cLB
	 PfC+fcmM3+mEg==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 267D417E13B2;
	Tue,  5 May 2026 17:45:27 +0200 (CEST)
Date: Tue, 5 May 2026 17:45:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 2/8] dma-heap: Provide accessors so that in-kernel
 drivers can allocate dmabufs from specific heaps
Message-ID: <20260505174522.7d7f2756@fedora>
In-Reply-To: <20260505140516.1372388-3-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-3-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7DB404D080A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60452-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org,mediatek.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue,  5 May 2026 16:05:08 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> From: John Stultz <jstultz@google.com>
> 
> This allows drivers who don't want to create their own
> DMA-BUF exporter to be able to allocate DMA-BUFs directly
> from existing DMA-BUF Heaps.
> 
> There is some concern that the premise of DMA-BUF heaps is
> that userland knows better about what type of heap memory
> is needed for a pipeline, so it would likely be best for
> drivers to import and fill DMA-BUFs allocated by userland
> instead of allocating one themselves, but this is still
> up for debate.

I think this commit message needs to be updated with more details
around what it's actually needed for here (driver needing protected
buffer to boot FW and expose a char device, and no clean way to pass
dmabufs around before this cdev is exposed).

> 
> Signed-off-by: John Stultz <jstultz@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [Yong: Fix the checkpatch alignment warning]
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> [Florent: Rebase]
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> [Ketil: Rebase]
> ---
>  drivers/dma-buf/dma-heap.c | 80 ++++++++++++++++++++++++++++++--------
>  include/linux/dma-heap.h   |  6 +++
>  2 files changed, 70 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 9fd365ddbd517..854d40d789ff2 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -57,12 +57,24 @@ module_param(mem_accounting, bool, 0444);
>  MODULE_PARM_DESC(mem_accounting,
>  		 "Enable cgroup-based memory accounting for dma-buf heap allocations (default=false).");
>  
> -static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> -				 u32 fd_flags,
> -				 u64 heap_flags)
> +/**
> + * dma_heap_buffer_alloc - Allocate dma-buf from a dma_heap
> + * @heap:	DMA-Heap to allocate from
> + * @len:	size to allocate in bytes
> + * @fd_flags:	flags to set on returned dma-buf fd
> + * @heap_flags: flags to pass to the dma heap
> + *
> + * This is for internal dma-buf allocations only. Free returned buffers with dma_buf_put().
> + */
> +struct dma_buf *dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> +				      u32 fd_flags,
> +				      u64 heap_flags)
>  {
> -	struct dma_buf *dmabuf;
> -	int fd;
> +	if (fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
> +		return ERR_PTR(-EINVAL);

I'd probably move the flags checks to dma_heap_buffer_alloc() in a
separate patch, to keep the diff easier to read. Same for the
dma_heap_buffer_alloc()/dma_heap_bufferfd_alloc() split, though I'm not
too sure we need dma_heap_bufferfd_alloc(), we could just move the FD
allocation directly in dma_heap_ioctl_allocate().


>  
>  	/*
>  	 * Allocations from all heaps have to begin
> @@ -70,9 +82,20 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
>  	 */
>  	len = PAGE_ALIGN(len);
>  	if (!len)
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
> +
> +	return heap->ops->allocate(heap, len, fd_flags, heap_flags);
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_heap_buffer_alloc, "DMA_BUF_HEAP");
>  
> -	dmabuf = heap->ops->allocate(heap, len, fd_flags, heap_flags);
> +static int dma_heap_bufferfd_alloc(struct dma_heap *heap, size_t len,
> +				   u32 fd_flags,
> +				   u64 heap_flags)
> +{
> +	struct dma_buf *dmabuf;
> +	int fd;
> +
> +	dmabuf = dma_heap_buffer_alloc(heap, len, fd_flags, heap_flags);
>  	if (IS_ERR(dmabuf))
>  		return PTR_ERR(dmabuf);
>  
> @@ -110,15 +133,9 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
>  	if (heap_allocation->fd)
>  		return -EINVAL;
>  
> -	if (heap_allocation->fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
> -		return -EINVAL;
> -
> -	if (heap_allocation->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
> -		return -EINVAL;
> -
> -	fd = dma_heap_buffer_alloc(heap, heap_allocation->len,
> -				   heap_allocation->fd_flags,
> -				   heap_allocation->heap_flags);
> +	fd = dma_heap_bufferfd_alloc(heap, heap_allocation->len,
> +				     heap_allocation->fd_flags,
> +				     heap_allocation->heap_flags);
>  	if (fd < 0)
>  		return fd;
>  
> @@ -317,6 +334,36 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
>  
> +/**
> + * dma_heap_find - get the heap registered with the specified name
> + * @name: Name of the DMA-Heap to find
> + *
> + * Returns:
> + * The DMA-Heap with the provided name.
> + *
> + * NOTE: DMA-Heaps returned from this function MUST be released using
> + * dma_heap_put() when the user is done to enable the heap to be unloaded.
> + */
> +struct dma_heap *dma_heap_find(const char *name)

s/dma_heap_find/dma_heap_find_by_name/gc

> +{
> +	struct dma_heap *h;
> +
> +	mutex_lock(&heap_list_lock);
> +	list_for_each_entry(h, &heap_list, list) {
> +		if (!kref_get_unless_zero(&h->refcount))
> +			continue;
> +
> +		if (!strcmp(h->name, name)) {

I think we should go sysfs_streq(), to make sure we don't return a heap
whose name only starts with the searched name.

> +			mutex_unlock(&heap_list_lock);
> +			return h;
> +		}
> +		dma_heap_put(h);
> +	}
> +	mutex_unlock(&heap_list_lock);
> +	return NULL;

This could be simplified with something like:

	struct dma_heap *h, *ret = NULL;

	guard(mutex)(&heap_list_lock);
	list_for_each_entry(h, &heap_list, list) {
		if (!sysfs_streq(h->name, name))
			continue;

		if (kref_get_unless_zero(&h->refcount))
			ret = h;

		break;
	}

	return ret;

> +}


> +EXPORT_SYMBOL_NS_GPL(dma_heap_find, "DMA_BUF_HEAP");
> +
>  static void dma_heap_release(struct kref *ref)
>  {
>  	struct dma_heap *heap = container_of(ref, struct dma_heap, refcount);
> @@ -341,6 +388,7 @@ void dma_heap_put(struct dma_heap *heap)
>  {
>  	kref_put(&heap->refcount, dma_heap_release);
>  }
> +EXPORT_SYMBOL_NS_GPL(dma_heap_put, "DMA_BUF_HEAP");
>  
>  static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
>  {
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index ff57741700f5f..c3351f8a1f8cf 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -46,8 +46,14 @@ const char *dma_heap_get_name(struct dma_heap *heap);
>  
>  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
>  
> +struct dma_heap *dma_heap_find(const char *name);
> +
>  void dma_heap_put(struct dma_heap *heap);
>  
> +struct dma_buf *dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> +				      u32 fd_flags,
> +				      u64 heap_flags);
> +
>  extern bool mem_accounting;
>  
>  #endif /* _DMA_HEAPS_H */



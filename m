Return-Path: <linux-media+bounces-60449-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA35IY4L+mlsIgMAu9opvQ
	(envelope-from <linux-media+bounces-60449-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 17:23:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6C94D024D
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 17:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C80030744A7
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 15:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B3E480DD0;
	Tue,  5 May 2026 15:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HZ4LnhKu"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0DA156C6A;
	Tue,  5 May 2026 15:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994458; cv=none; b=qWtPsLil6006q88BHRinZXMkKtNY1z3uNaIk+FevNxckSUWgr6sxL5GTpnDvgMAe0XRys9NTGw4AwDDPPpeWPxR6OD9XKdzrSheVvGVPhfy6p1ZloRfbB7wI9n8zW3+jx5xdbHQ09PmwVr54E5srpNii05DATZipEaTq1/rs6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994458; c=relaxed/simple;
	bh=GB3l17/ekg1P4sEApX6f/ITXv7X2gefB+5c4kZ5bdhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UdKDMBmzNF//1YmPp8JXlAXpoO4rLNTcihtoSLJyr959Gt8UeLUwNYhKaAzWX6Pe5ih///YpKtiJ1XsjJPyrJu/5maFTlxIRlFfazr2r1T5wGBL0s/0oetPx86SbFcz1Y0P5POexUDXZUFP359KIbPvNOGEGB2+k2EO2gOSbL7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HZ4LnhKu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777994455;
	bh=GB3l17/ekg1P4sEApX6f/ITXv7X2gefB+5c4kZ5bdhQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HZ4LnhKuimVBHwguEpzHzUmKIga1uo5dFOtEZyWUTnmmq5oSmrqc6vzHcWnZmPR34
	 ISBs/7vrXXLNNZ4GzSz1AJXYG8mPv7GKqln6yQNsn7XEidgQgN3pkpnmUMh9E0By+E
	 zjJnyB/DCGYC3Db1gUTZLhyIJZHavG7xhlYHNvBDaTBBeHP54ab0vkUtayjvGW3SXh
	 U3zsKmmcKDqZX6/TTlXzVZGRMyLzcOvVBrNbm7mZ2626RA7Z4h0vMRsAI54zUqDGO5
	 G6+irU6LumaJMQzuJp99XhlFz158BBAuV1vb71KFVgPXYymXDUkC3hcxqWANL5gyVo
	 vIVXPlsHRlI0w==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 35D1417E13B2;
	Tue,  5 May 2026 17:20:54 +0200 (CEST)
Date: Tue, 5 May 2026 17:20:48 +0200
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
Subject: Re: [PATCH 1/8] dma-heap: Add proper kref handling on dma-buf heaps
Message-ID: <20260505172048.1c48e030@fedora>
In-Reply-To: <20260505140516.1372388-2-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-2-ketil.johnsen@arm.com>
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
X-Rspamd-Queue-Id: 1B6C94D024D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60449-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url,arm.com:email,mediatek.com:email]

Hi Ketil,

On Tue,  5 May 2026 16:05:07 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> From: John Stultz <jstultz@google.com>
> 
> Add proper reference counting on the dma_heap structure. While
> existing heaps are built-in, we may eventually have heaps loaded
> from modules, and we'll need to be able to properly handle the
> references to the heaps

It's weird that this "heap as module" thing is mentioned here, but
actual robustness to make this safe is not added in the commit or any
of the following ones.

> 
> Signed-off-by: John Stultz <jstultz@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [Yong: Just add comment for "minor" and "refcount"]
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [Yunfei: Change reviewer's comments]
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> [Florent: Rebase]
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> [Ketil: Rebase]
> ---
>  drivers/dma-buf/dma-heap.c | 29 +++++++++++++++++++++++++++++
>  include/linux/dma-heap.h   |  2 ++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index ac5f8685a6494..9fd365ddbd517 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -12,6 +12,7 @@
>  #include <linux/dma-heap.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
> +#include <linux/kref.h>
>  #include <linux/list.h>
>  #include <linux/nospec.h>
>  #include <linux/syscalls.h>
> @@ -31,6 +32,7 @@
>   * @heap_devt:		heap device node
>   * @list:		list head connecting to list of heaps
>   * @heap_cdev:		heap char device
> + * @refcount:		reference counter for this heap device
>   *
>   * Represents a heap of memory from which buffers can be made.
>   */
> @@ -41,6 +43,7 @@ struct dma_heap {
>  	dev_t heap_devt;
>  	struct list_head list;
>  	struct cdev heap_cdev;
> +	struct kref refcount;
>  };
>  
>  static LIST_HEAD(heap_list);
> @@ -248,6 +251,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  	if (!heap)
>  		return ERR_PTR(-ENOMEM);
>  
> +	kref_init(&heap->refcount);
>  	heap->name = exp_info->name;
>  	heap->ops = exp_info->ops;
>  	heap->priv = exp_info->priv;
> @@ -313,6 +317,31 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
>  
> +static void dma_heap_release(struct kref *ref)
> +{
> +	struct dma_heap *heap = container_of(ref, struct dma_heap, refcount);
> +	unsigned int minor = MINOR(heap->heap_devt);
> +
> +	mutex_lock(&heap_list_lock);
> +	list_del(&heap->list);
> +	mutex_unlock(&heap_list_lock);
> +
> +	device_destroy(dma_heap_class, heap->heap_devt);
> +	cdev_del(&heap->heap_cdev);
> +	xa_erase(&dma_heap_minors, minor);
> +
> +	kfree(heap);

That's actually problematic, because cdev_del() doesn't guarantee that
all opened FDs have been closed [1], it just guarantees that no new ones
can materialize. In order to make that safe, we'd need a

1. kref_get_unless_zero() in dma_heap_open(), with proper locking around
   the xa_load() to protect against the heap removal that's happening
   here
2. a dma_heap_put() in a new dma_heap_close() implementation
3. a guarantee that heap implementations won't go away until the last
   ref is dropped, which means ops and all the data needed for this heap
   to satisfy ioctl()s (and more generally every passed at
   dma_heap_add() time) have to stay valid until the last ref is
   dropped. Alternatively, we could restrict this only to in-flight
   ioctl()s, and have the ops replaced by some dummy ops using RCU or a
   rwlock. But I guess live dmabufs allocated on this heap have to
   retain the heap and its implementation anyway.

For record, #3 is already not satisfied by the current tee_heap
implementation (tee_dma_heap objects can vanish before the dma_heap
object is gone). The other implementations seem to be fine because they
are statically linked, and they either have exp_info.priv set to NULL,
or something that's never released.

TLDR; the whole assumption that adding refcounting to dma_heap is
enough to guarantee safety around device/module removal is not holding,
and adding in-kernel users acquiring dma_heap refs on top of this
design is just going to make it even more painful to fix.

I see two way forward from here, either we get the
dma_heap/dma_heap-producer lifetime right from the start the way I
suggested above (I might have missed corner cases there BTW), or we keep
assuming that heaps can only ever be created, never destroyed/removed
(which is basically what the current dma_heap.c logic does, except
tee_heap.c broke that), and just let dma_heap_find() return dma_heap
pointers whose lifetime is assumed to be static.

> +}
> +
> +/**
> + * dma_heap_put - drops a reference to a dmabuf heap, potentially freeing it
> + * @heap: DMA-Heap whose reference count to decrement
> + */
> +void dma_heap_put(struct dma_heap *heap)
> +{
> +	kref_put(&heap->refcount, dma_heap_release);

nit: I'd go

	if (heap)
		kref_put(&heap->refcount, dma_heap_release);

so users can call dma_heap_put() on NULL heaps, which usually simplify
error paths and/or destruction of partially initialized objects.

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v7.0.1/source/fs/char_dev.c#L594


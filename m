Return-Path: <linux-media+bounces-60466-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNdfJcUd+mkJJgMAu9opvQ
	(envelope-from <linux-media+bounces-60466-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:41:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB8D4D17E4
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5A49305D018
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 16:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0F948C8BD;
	Tue,  5 May 2026 16:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N7205ghH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD383DDDD2;
	Tue,  5 May 2026 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999231; cv=none; b=JqUYeEaEP1/GaEp1MZI9GHpiPt1+lqGqddRBQPV0blqWXiuDuLEzqqkXvLqbAuYnsQCuB4KZWMk70GBjLrAxxGNtCp6ZSysIHGA188HfOV6tQEOaynbmcj6UIPznq1adoQaSNhXfGIuMSb6DxDJ+W/0dGX4LndmEG/yHKUoktng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999231; c=relaxed/simple;
	bh=v1fIHwgfddcCmh6pGZRO/cpadp8xSOxN1BF2obFbABM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BzWLhlfrO6nGfh4Ds1wIsSIkgg3fhL4d6D1BbPVVnqQYClkDgap5A2aBJKVdiZ+MynEDvhDpnIPH4jRxyWKnDgpT9tQ5vVembF+vKJPwtxVCsfgNrODdfEYy4liTpDYhlw31snCyX7T5/78KXwwoJBRLQZeSE7UzTrfDi/PVx/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N7205ghH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777999227;
	bh=v1fIHwgfddcCmh6pGZRO/cpadp8xSOxN1BF2obFbABM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N7205ghHVDdafje5WfeBl5l41S/dIJAvAJo92TYcH0WldQVC6tZuQOpBbIkfp1HSC
	 IAbfHExmOTsVIZAn7J+1JqkufgEjWjnrqkYHlU8jqys8Qz2nFomi4tJMxrMyZrH4ZR
	 nIN0C+PRJ0keEzegdG3vnexsh2K3Yq1b/QKkO4mss0eOzmqUh0vZ9zZ9J6BDWrhHkw
	 fUQqbwO4bY/wbA7qpK+O/N+qlFBbiVBJ1fK45L4vtZeg+UA7GW/OZklM5JUs2PgTOc
	 1CN00qQU1Zllsyj9D54prWzFp6RUYSNBeraq/HSf2OBsyOWqSJV9KwNpELgAdBom15
	 H1hXEX6eJgwVQ==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD9A917E13B2;
	Tue,  5 May 2026 18:40:26 +0200 (CEST)
Date: Tue, 5 May 2026 18:40:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T.J. Mercier"
 <tjmercier@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 1/8] dma-heap: Add proper kref handling on dma-buf heaps
Message-ID: <20260505184021.3676f9af@fedora>
In-Reply-To: <20260505-spaniel-of-scientific-warranty-ca075e@houat>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-2-ketil.johnsen@arm.com>
	<20260505172048.1c48e030@fedora>
	<20260505-spaniel-of-scientific-warranty-ca075e@houat>
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
X-Rspamd-Queue-Id: 0EB8D4D17E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60466-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org,mediatek.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,collabora.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Tue, 5 May 2026 17:39:13 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi Boris,
> 
> On Tue, May 05, 2026 at 05:20:48PM +0200, Boris Brezillon wrote:
> > Hi Ketil,
> > 
> > On Tue,  5 May 2026 16:05:07 +0200
> > Ketil Johnsen <ketil.johnsen@arm.com> wrote:
> >   
> > > From: John Stultz <jstultz@google.com>
> > > 
> > > Add proper reference counting on the dma_heap structure. While
> > > existing heaps are built-in, we may eventually have heaps loaded
> > > from modules, and we'll need to be able to properly handle the
> > > references to the heaps  
> > 
> > It's weird that this "heap as module" thing is mentioned here, but
> > actual robustness to make this safe is not added in the commit or any
> > of the following ones.
> >   
> > > 
> > > Signed-off-by: John Stultz <jstultz@google.com>
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > [Yong: Just add comment for "minor" and "refcount"]
> > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > [Yunfei: Change reviewer's comments]
> > > Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> > > [Florent: Rebase]
> > > Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> > > [Ketil: Rebase]
> > > ---
> > >  drivers/dma-buf/dma-heap.c | 29 +++++++++++++++++++++++++++++
> > >  include/linux/dma-heap.h   |  2 ++
> > >  2 files changed, 31 insertions(+)
> > > 
> > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > > index ac5f8685a6494..9fd365ddbd517 100644
> > > --- a/drivers/dma-buf/dma-heap.c
> > > +++ b/drivers/dma-buf/dma-heap.c
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/dma-heap.h>
> > >  #include <linux/err.h>
> > >  #include <linux/export.h>
> > > +#include <linux/kref.h>
> > >  #include <linux/list.h>
> > >  #include <linux/nospec.h>
> > >  #include <linux/syscalls.h>
> > > @@ -31,6 +32,7 @@
> > >   * @heap_devt:		heap device node
> > >   * @list:		list head connecting to list of heaps
> > >   * @heap_cdev:		heap char device
> > > + * @refcount:		reference counter for this heap device
> > >   *
> > >   * Represents a heap of memory from which buffers can be made.
> > >   */
> > > @@ -41,6 +43,7 @@ struct dma_heap {
> > >  	dev_t heap_devt;
> > >  	struct list_head list;
> > >  	struct cdev heap_cdev;
> > > +	struct kref refcount;
> > >  };
> > >  
> > >  static LIST_HEAD(heap_list);
> > > @@ -248,6 +251,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
> > >  	if (!heap)
> > >  		return ERR_PTR(-ENOMEM);
> > >  
> > > +	kref_init(&heap->refcount);
> > >  	heap->name = exp_info->name;
> > >  	heap->ops = exp_info->ops;
> > >  	heap->priv = exp_info->priv;
> > > @@ -313,6 +317,31 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
> > >  }
> > >  EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
> > >  
> > > +static void dma_heap_release(struct kref *ref)
> > > +{
> > > +	struct dma_heap *heap = container_of(ref, struct dma_heap, refcount);
> > > +	unsigned int minor = MINOR(heap->heap_devt);
> > > +
> > > +	mutex_lock(&heap_list_lock);
> > > +	list_del(&heap->list);
> > > +	mutex_unlock(&heap_list_lock);
> > > +
> > > +	device_destroy(dma_heap_class, heap->heap_devt);
> > > +	cdev_del(&heap->heap_cdev);
> > > +	xa_erase(&dma_heap_minors, minor);
> > > +
> > > +	kfree(heap);  
> > 
> > That's actually problematic, because cdev_del() doesn't guarantee that
> > all opened FDs have been closed [1], it just guarantees that no new ones
> > can materialize. In order to make that safe, we'd need a
> > 
> > 1. kref_get_unless_zero() in dma_heap_open(), with proper locking around
> >    the xa_load() to protect against the heap removal that's happening
> >    here
> > 2. a dma_heap_put() in a new dma_heap_close() implementation
> > 3. a guarantee that heap implementations won't go away until the last
> >    ref is dropped, which means ops and all the data needed for this heap
> >    to satisfy ioctl()s (and more generally every passed at
> >    dma_heap_add() time) have to stay valid until the last ref is
> >    dropped. Alternatively, we could restrict this only to in-flight
> >    ioctl()s, and have the ops replaced by some dummy ops using RCU or a
> >    rwlock. But I guess live dmabufs allocated on this heap have to
> >    retain the heap and its implementation anyway.
> > 
> > For record, #3 is already not satisfied by the current tee_heap
> > implementation (tee_dma_heap objects can vanish before the dma_heap
> > object is gone). The other implementations seem to be fine because they
> > are statically linked, and they either have exp_info.priv set to NULL,
> > or something that's never released.  
> 
> That statement won't hold for long, see:
> https://lore.kernel.org/r/20260427-dma-buf-heaps-as-modules-v5-0-b6f5678feefc@kernel.org
> 
> However, all upstream heaps can be loaded as module, but not unloaded.
> So once you get a reference to it, you can assume it will live forever.
> That's why we didn't merge that patch before, even though it was discussed:
> 
> https://lore.kernel.org/all/CANDhNCqk9Uk4aXHhUsL4hR1GHNmWZnH3C9Np-A02wdi+J3D7tA@mail.gmail.com/

Hm, not too sure that makes the tee_heap implementation sane WRT
tee_heap removal though, unless we have a guarantee that
tee_device_unregister() will never be called...


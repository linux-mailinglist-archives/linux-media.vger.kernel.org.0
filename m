Return-Path: <linux-media+bounces-53108-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEw4NStEl2kiwQIAu9opvQ
	(envelope-from <linux-media+bounces-53108-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 18:11:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F63160F8B
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 18:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7497303A10E
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 17:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0122034D932;
	Thu, 19 Feb 2026 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YD3SyL0D";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="W7rMfmYM"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFC034B194
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 17:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521047; cv=none; b=dWs/3QB/fmreSdDngm3tgBUJ1jfTqWdYztBG6fG6H9xK7ILp5HgZtioj0OTH1oCRopZc7z6Gm/SnaFf9/03S7sfjM4NiSAz0s2VdRkkwzHMAqykYge8vgr9WIY7UzfL/IO7kaoGGa9/ekYayw4OHdLEqk9zrEsbqe4M1VnxCNvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521047; c=relaxed/simple;
	bh=QbyQavlhyozMCjXnRyzWHvLmvlB3aLyQrMvP1c9kYNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdDqCeoexybeT7mhAgWIszTjE+C1dh3hYpVqbP13nuC9GxkbuH1phRk+v2/MV+A1wKIP3ZhktSCBW2r3HZUTMz9ZcW97PZYG0LWSxmOY282kuihMVO86HluhTlmUKlJAxDqhN08sdSWmtGweLO1xWe7zzkhvVo9UzTaB/1QO8Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YD3SyL0D; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=W7rMfmYM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771521045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ufSHZcVh+Dpk6NOIfY9tkcU2Fx29sq1FQcHOa9iMf4=;
	b=YD3SyL0DtxRA91L5WAKXCYQ49f11bVorKkKPHTjx76X12k2V8XY093Hmdx/kmeAwV2kQIB
	c/Jfb1c0SKNR5acXyF7CZzISngRFYbe3wTfO3a6i8FAYN2X7mJaAMT9CCqjvcbIjPjedn2
	91+ainb9FsRHvogQ74qW1FkNQuY+aoU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-ls7zOIruMbeG2JuFFqyyTg-1; Thu, 19 Feb 2026 12:10:44 -0500
X-MC-Unique: ls7zOIruMbeG2JuFFqyyTg-1
X-Mimecast-MFC-AGG-ID: ls7zOIruMbeG2JuFFqyyTg_1771521043
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3d11b913so738854085a.1
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 09:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771521043; x=1772125843; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1ufSHZcVh+Dpk6NOIfY9tkcU2Fx29sq1FQcHOa9iMf4=;
        b=W7rMfmYMUAHGzUpxb1gboGht0D4GtVfcu6E69+I2FsjJE8m+kkuTfjvTJ6zvtYCtYS
         7qp2hwDxWL4ZoCUzfzA+0pmRHsyxHzfYzT20wFMGKZiRUL+leKprsRjU8OAqdrtv1iWw
         AlGc0Rb9/rU8hzgcABTCCEZ9WXq0cef/cTQQjwujtyEB9cZu+mm7hrFS5CJAP+FHoRQ/
         v8OgWm7pInylgZQaRY8VtIVbBBKByjAT5CRlmyCwQDccRX0ma6lCSmVuFSk6uGsBjJ9y
         cXSlrIdtp0tDenvh7aBR0cplvxrgfuHM6XNgabq/1Iks2f1RjI5reiFqK+YXHYP4Ztmv
         J2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521043; x=1772125843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ufSHZcVh+Dpk6NOIfY9tkcU2Fx29sq1FQcHOa9iMf4=;
        b=FtryiLkZz6wUdMahf1YZHSMfHdIGrXU6j9FAFd8RTIFLPkivim3XdzJW7Pk1Ogz/zx
         DCD/VFQIsC/b5+ehrLNAMWxcDDDeu+St4dygzdNdb8ajWlJFX5hFLOF1LdqYx0yKUbWJ
         1WgzfQtkLVBw3cR39U0x77rbvtREx7KrD9S+EctUar/R4qnscvb10t2Giut/bS7ngWLc
         ndsKeeETElD57O9YXPovOavcFmn/TRDizDWhuMBHCRvjXjJZht2pPsYVaDzet/NrbZAe
         U3qsrzWPyQDIWi90S97AgGzzFDovlUU7UvOE4161hTSA4ahIXiz46RdAN8T/VEUqKj2H
         dKHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJEsRnpyMy3oYAKVbhTuJUQ0Q7gH42nwlue9pllczQc5Uhb9EKFw2vrXATw8VbdRrwQpanV3pvTrxDnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww2GlbVmL1ura3PZQdG/fi/c72zDSCZm3G79ciE3XDxij2436F
	mZotY19AwUiSwNvEfyHTfYSaMsNR28Rxn8/4Fi5uDqYz9jl3ka1J0lRu8EcxCNPt6QVmTBztW2Z
	RLvSjlEv3JqBC4lgm/ropEtEK9f5Tly5oYurzxGK+Qt0/oQJ4Bj3biYgG1X739VQj
X-Gm-Gg: AZuq6aLGKK3BoCpfpjqyt4FK8zXe4x9MMd0EGMUkC/ZhP6sX6YaBsRoTbe/SRHQUFVB
	0EwQw2ZSYBnTVYacxkjQAC9cW/B3ae8Y32Up+QXhDg2+eBCnsk6fnM2FqADfKYGx0Otp3s0cPLb
	Nh7bcW4r9rQ/3PDyNqDzUgK4TZmI6sNPGxH5LMYIz0MD7TMsRJravUmTqHTxejXHy88nSm5Jp+1
	BqxJWX1Cl/wSdTnFw2r0w0XeA2s8C/Mk3e2+n3VsKG32da/moy5mzAB17gy8+hjUVtO4qbKuMBn
	U6H5HaDrKy3L9Hkf9JeXD2QapyTySJjQWq5Xb45e9CxgsJfZx8hfVmKOCOysly3cUOBUZIo6Yol
	OzqoezU1QZrT4lmFE7HMv79Aixw9BIdizOYZFosS2iiMZ4M+HWUoGDSDeBQiSV9k=
X-Received: by 2002:a05:620a:44c2:b0:8c7:fdc:e877 with SMTP id af79cd13be357-8cb740b5c53mr703610485a.41.1771521043238;
        Thu, 19 Feb 2026 09:10:43 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8c7:fdc:e877 with SMTP id af79cd13be357-8cb740b5c53mr703604885a.41.1771521042525;
        Thu, 19 Feb 2026 09:10:42 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net. [100.17.19.56])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0e12eesm2128955585a.15.2026.02.19.09.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:10:42 -0800 (PST)
Date: Thu, 19 Feb 2026 12:10:41 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, linux-mm@kvack.org
Subject: Re: [PATCH v2 3/3] dma-buf: heaps: cma: charge each cma heap's dmem
Message-ID: <aZdAOMBRdRw59fa0@fedora>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <20260218-dmabuf-heap-cma-dmem-v2-3-b249886fb7b2@redhat.com>
 <435330fd-ecdd-43c7-8527-f285c03c6421@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <435330fd-ecdd-43c7-8527-f285c03c6421@amd.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53108-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[echanude@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 39F63160F8B
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 08:17:28AM +0100, Christian König wrote:
> 
> 
> On 2/18/26 18:14, Eric Chanudet wrote:
> > The cma dma-buf heaps let userspace allocate buffers in CMA regions
> > without enforcing limits. Since each cma region registers in dmem,
> > charge against it when allocating a buffer in a cma heap.
> > 
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..bbd4f9495808da19256d97bd6a4dca3e1b0a30a0 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -27,6 +27,7 @@
> >  #include <linux/scatterlist.h>
> >  #include <linux/slab.h>
> >  #include <linux/vmalloc.h>
> > +#include <linux/cgroup_dmem.h>
> >  
> >  #define DEFAULT_CMA_NAME "default_cma_region"
> >  
> > @@ -58,6 +59,7 @@ struct cma_heap_buffer {
> >  	pgoff_t pagecount;
> >  	int vmap_cnt;
> >  	void *vaddr;
> > +	struct dmem_cgroup_pool_state *pool;
> >  };
> >  
> >  struct dma_heap_attachment {
> > @@ -276,6 +278,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
> >  	kfree(buffer->pages);
> >  	/* release memory */
> >  	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
> > +	dmem_cgroup_uncharge(buffer->pool, buffer->len);
> >  	kfree(buffer);
> >  }
> >  
> > @@ -319,9 +322,17 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> >  	if (align > CONFIG_CMA_ALIGNMENT)
> >  		align = CONFIG_CMA_ALIGNMENT;
> >  
> > +	if (mem_accounting) {
> 
> Since mem_accounting is a module parameter it is possible to make it changeable during runtime.
> 
> IIRC it currently is read only, but maybe add a one line comment that the cma heap now depends on that.
> 

Agreed, while read-only it is easily missed without at least a comment.
Alternatively, should that value be captured in the init callback to
guaranty it is set once and make this requirement clearer?

Thanks,

> Apart from that the series looks totally sane to me.
> 
> Regards,
> Christian.
> 
> > +		ret = dmem_cgroup_try_charge(
> > +			cma_get_dmem_cgroup_region(cma_heap->cma), size,
> > +			&buffer->pool, NULL);
> > +		if (ret)
> > +			goto free_buffer;
> > +	}
> > +
> >  	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
> >  	if (!cma_pages)
> > -		goto free_buffer;
> > +		goto uncharge_cgroup;
> >  
> >  	/* Clear the cma pages */
> >  	if (PageHighMem(cma_pages)) {
> > @@ -376,6 +387,8 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> >  	kfree(buffer->pages);
> >  free_cma:
> >  	cma_release(cma_heap->cma, cma_pages, pagecount);
> > +uncharge_cgroup:
> > +	dmem_cgroup_uncharge(buffer->pool, size);
> >  free_buffer:
> >  	kfree(buffer);
> >  
> > 
> 

-- 
Eric Chanudet



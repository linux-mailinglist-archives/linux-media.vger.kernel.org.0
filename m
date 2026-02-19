Return-Path: <linux-media+bounces-53109-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEBbEalGl2m2wQIAu9opvQ
	(envelope-from <linux-media+bounces-53109-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 18:21:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB23161204
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 18:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD8583032DCB
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 17:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122FC34DCD9;
	Thu, 19 Feb 2026 17:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RCydY3dT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lvBm1Hwk"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0839B34CFBA
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 17:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521690; cv=none; b=UCokfDcDhD0D/1np2YaFrvV5/0wjHsqoS6/1oYoVMW3QuT208qEdHJdBdK9ROfok3ALf+cCp52TPLsKfM3lvkh0Q0RrSthyFqn38TGrJI4+rgzgwvQWyfii9Z7jmDfntIcqJwp0lBrHsgxVfHkmhNnEIi+kyG5NoEp3LEsDs+O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521690; c=relaxed/simple;
	bh=CctkxF5c2z/goU09kMRIOU62BOJ7tyoO11bfcPniLO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkuDLjfP2+on57v+89td/67A3oZwZXAc7MY1974O/s1SuMIArdOyZn4/WEmV8eg9QU+81pZt2wE+jTajQmwyOVbA9KuZlrC/rXXAfr/VGlVrQYCue4jnbEMby2LIXSeC0ZVyq7X1NgoH2jQMdGrzMMFELNxsij9EC+diOSf8QrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RCydY3dT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lvBm1Hwk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771521687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a+MlxWO2a/5NxxDnoLl6rDcBacWRef25tqpr85yXgBM=;
	b=RCydY3dT5Jp4U4g1nemVhH64THAWDmlvyGQ3FaoONVfx2dx6Qlmkrzrap1h2QUfB9fiuV+
	lD3EHW4pVGKPc4vXXKRSYffU7151knNUkee6Sq6rMkn5NrYZxKgF6yAbyhdztaNUDQpBBT
	UzCpyfatzJCnkpizn6nsKx2uBnfLgIg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-TeeY1l0GN2mZ5xU_1xJ9ag-1; Thu, 19 Feb 2026 12:21:25 -0500
X-MC-Unique: TeeY1l0GN2mZ5xU_1xJ9ag-1
X-Mimecast-MFC-AGG-ID: TeeY1l0GN2mZ5xU_1xJ9ag_1771521685
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4e37a796so752640985a.2
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 09:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771521685; x=1772126485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a+MlxWO2a/5NxxDnoLl6rDcBacWRef25tqpr85yXgBM=;
        b=lvBm1HwkaeZN8eU8m3mxObIeOpfHwbtalZ8c4svUJjzoVBd2i7iNViSTPFs0wp5ik5
         6ymbgtNosQBGouh3fgitW5MM7Ubo3nNRP2E46pJwFVJLySIPz1OLsU40cQv5YRNqgt8i
         9i2MZqF/uyyTl5EbUwYrg8U3Tfxab4jzPtbyo/Lov2a/ATeZIzEMQXGmxIxbXRC3bryc
         Yt1Wc8WvVy2NRtj1zX5wzfUR4OyN2nG5OQ7nUCkSbEyNwtwYl2VzDmlLSBgZjNkfmbmI
         w+TOGhnWF2NiqphZaxsYKhodCzSRHLvkaRk+CBIugHPtzIvDIM9KaMBUPHG1MxquPpAt
         hZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521685; x=1772126485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+MlxWO2a/5NxxDnoLl6rDcBacWRef25tqpr85yXgBM=;
        b=mBtsTh1KUmDr+KZe+AcKdpcAFWf0szjOxXTE0LXjIrbZq7DZ82juSQW4kIG3DnL8TF
         YZtQ0ex12vGcZry6xDGN1WxZDWYBVoOLn9zWDHvlpLC+ufx7pkYEf47BIz97/9qxs/4/
         IeyRnPi/DY/YADAgcdRHo3cm2JmkuGWGESmDkfgqwsyvRKh9hPjA/8BlxVMNE+x2HPHI
         Pqbt7MpxE26s9XTi0ZdRHcclJh6dUr6arg22cBz3JA61hDyf3mduKpmcR7z7zsp6jsnZ
         4g/HqUnB4yePK6C/4/kdaSEUtP7DCTJ6irrnkne7Bv5o2DpmZcairY3Mg7hoSnRP+Vb8
         evbw==
X-Forwarded-Encrypted: i=1; AJvYcCWLvxh5otBslwl5ma3l0XYOBZy3Dg8zacZN5GIk3urAp7DTUsoGsW7a4OeJqz8KZ6WwMItU28tzFEEZBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA3KwVJRusFreax+6UuaBduWKH9meVfZO/L3XYupCTVQKI06bV
	GOU3zmvYF6xfQJKeu8LRrZrIcHQaFSWr4M4XFmcENFl4E4MK74mz2ifHDB9vdw2yLoobrq0LPhA
	oqNy0ye41fsvek2god+YmPL4/14HTjPRGgIKg9GRrA7TpNWBbYzTIw+oIMvQw8eht
X-Gm-Gg: AZuq6aI24+5kooAKlDd37CtsH9EqGfUfl49nnlKLENpxTf0FGW+dFNyRiLV8kZB0kJE
	XUYflIrB5vB+4a7iM4I+56tOnHvpjj0kBaHTz+WjQbVe9PKmFJ5RmpWd8kcZNomHXA0ANGKKf5E
	u0YIlva4jMW8XZ7ww/mcdEelCN9bXsKy9eYZOkaNDmmOfk4As2W8HLUjjJOfUOwiJ0bZxSXI4cO
	BHYMsKZslUd8vmIOCgjndzskPgxftWl1G4qZi3tD036OhUK7zypU0M3vSpJQieMRE+T9PeS87EK
	KXBPuMJDvcMxguPazZMKbQaqeYV+lTzFk9ysTIQk7YLS0J815eou+8F/4OrLm4AfqwPfepzJLPw
	TZ4a7suL3jYGpbGEMYg+ohtAvose26IwM28Jg/Ft8FzXR3cFrGw/B7zDLEtIryMQ=
X-Received: by 2002:a05:620a:4148:b0:8cb:3f0e:7740 with SMTP id af79cd13be357-8cb79f3269dmr425870385a.51.1771521685039;
        Thu, 19 Feb 2026 09:21:25 -0800 (PST)
X-Received: by 2002:a05:620a:4148:b0:8cb:3f0e:7740 with SMTP id af79cd13be357-8cb79f3269dmr425866385a.51.1771521684499;
        Thu, 19 Feb 2026 09:21:24 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net. [100.17.19.56])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684b94e9fsm210902201cf.24.2026.02.19.09.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:21:24 -0800 (PST)
Date: Thu, 19 Feb 2026 12:21:23 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, Albert Esteve <aesteve@redhat.com>, 
	linux-mm@kvack.org
Subject: Re: [PATCH v2 3/3] dma-buf: heaps: cma: charge each cma heap's dmem
Message-ID: <aZdEMlKE_kGheI-b@fedora>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <20260218-dmabuf-heap-cma-dmem-v2-3-b249886fb7b2@redhat.com>
 <20260219-illustrious-tungsten-starfish-5dad8c@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219-illustrious-tungsten-starfish-5dad8c@houat>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53109-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9FB23161204
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 10:16:37AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Feb 18, 2026 at 12:14:12PM -0500, Eric Chanudet wrote:
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
> 
> I guess we should add an #if IS_ENABLED #endif guard for dmem?
> 

Sure, I saw the other user (ttm) didn't, but that makes sense as the
field is useless if dmem is not enabled.

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
> > +		ret = dmem_cgroup_try_charge(
> > +			cma_get_dmem_cgroup_region(cma_heap->cma), size,
> > +			&buffer->pool, NULL);
> 
> This alone doesn't call for a new version, but adhering to the kernel
> coding style would look like this:
> 
> +		ret = dmem_cgroup_try_charge(cma_get_dmem_cgroup_region(cma_heap->cma),
> +					     size, &buffer->pool, NULL);

Will add to v3 with the other changes.

Thanks,

> 
> It looks good to me otherwise,
> Acked-by: Maxime Ripard <mripard@kernel.org>
> 
> Maxime



-- 
Eric Chanudet



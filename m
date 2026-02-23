Return-Path: <linux-media+bounces-53194-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIt2M919nGm6IQQAu9opvQ
	(envelope-from <linux-media+bounces-53194-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 17:18:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FDD17994C
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 17:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 961F4305FC78
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 16:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB4D30E0F5;
	Mon, 23 Feb 2026 16:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HnwnW1CQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yxppz+UJ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA488301474
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 16:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771863277; cv=none; b=aozs/xBjwhs8hbhUGpY8N99Fh7Mk02PIbIR3b6steMyHnd1LK4JQfCMbqs4VDmDBO51TCa82usnHfzOOBVy6TgxeBsmHxfZ/3glg/ilTplJleeUHkpykfwg3QH+04z1DsESd+Kkwy6ewjRNC8bFzcVhaWYD390gPM4vEjVfq/qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771863277; c=relaxed/simple;
	bh=4ZZB0H+PZ1LR+m9pOc6Gi7z51bep34GW+4L4SAtIGSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNOFoTcBMG5wztB8oozwR8nph8c5n4wxTsTz2Eid7xvGeGQxXzAEj3l4lk8oCzvcZnnyAX1J65UDj7aAJoP5mbqFtdmRfacodqKNEX/QwHIv+UV2WrSqgSBsIudmgo09q9OHOwxeiUg47tx+SfBv8oGp0Ze8Lr3zAliDExWKipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HnwnW1CQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yxppz+UJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771863274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sRIkg/BYhLPQ8g8f8DScTuB2QESp5uVFZC6HG+ckSTg=;
	b=HnwnW1CQPfQ6V7puB8YvwAYcm3p+oFT2uaivAmXeRtRIA5JSkLbiPMeUEE5gnmWKfkbTxz
	knLXc0NJJ7+iJ0CY8xUGPJBCSzfzTL/EwOdH7blLMt0RtlV1sXZ3AbbkkUI5cwA2Uzc7Hr
	GQsMR/HnF/GCs7Gg6q3eYvzXrc5ka4Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-KpPS3hYJM-CiQXFQ6-fZdw-1; Mon, 23 Feb 2026 11:14:31 -0500
X-MC-Unique: KpPS3hYJM-CiQXFQ6-fZdw-1
X-Mimecast-MFC-AGG-ID: KpPS3hYJM-CiQXFQ6-fZdw_1771863271
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-503342386a8so130146041cf.0
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 08:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771863271; x=1772468071; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sRIkg/BYhLPQ8g8f8DScTuB2QESp5uVFZC6HG+ckSTg=;
        b=Yxppz+UJY1oVKOWtlzyTZd+oF2+YsNPxIZSmRDCiG2lx/F3RfW8bXPiFmh4QiBTKXQ
         S/wnXyWjje6D6OR/iPHgNEw+Koqr5BGCATDaefS1OZHqyCnoHksaLpEmhme/zK9jFq2F
         fuZRI2mi4oyRdwM5wy6x96dc/LqS737AlboFkHIsZMQrx2PGQeYtE32ITqWiKgOLYsPz
         WasMrnYGPklUdDPVIQPsQlfdTPnniY2vgvuttvndyEXkPxKWOYbDnci35xUqhCQUGawE
         XYsi9QoD+XS2PJ7HpUzC30VO204ArCf+JXgUD1gn+hzpSUrkfWI6jXR8ME0F1IMQvQ6H
         jCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771863271; x=1772468071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sRIkg/BYhLPQ8g8f8DScTuB2QESp5uVFZC6HG+ckSTg=;
        b=ZdwZlDgIn1jxg3hlnLeGcyNLWZbRddYBdH7VFeycfLexP7X1C0gfS/tl74uUId1xa+
         mkjX/V/KiWl0jN2GEP44a+nAX6WZIEIsGxtCq83hcGybSMe6mRwt4Bz87ngWq7rk/l6d
         QWhg9xHCc/z/o8IHjFd69YMWXSS4UmoNj6B/tnkzcvm+sZR8WiHMZ1d8r4zbj+LK3UEX
         VQy96M5dNN2RqXjjfSr5Rv4V/ALba2nohkm1r4o2p2rpw1MipU2X9eOQJIWcS/jvZPUp
         EyUbPdAjtBlAxewWg/PBFbzKLSQ+zdVA9gnLvov8IqU8eggJePbb1dCS6NYIjXMkWuEu
         te7g==
X-Forwarded-Encrypted: i=1; AJvYcCXvUuFQYe/wv1p+QIG1TdgR0Ln0zYw8zW83OJe+F+/xc/xTL3Q07DqwrXemieukMR0PJs31DyUz3a6Y6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCGsxV+8o/ajgOOtyvkISadqjrzi8wTeI9ZcuaS0K4P4c11XmC
	TcP9t4yO+Dn39geN5Qz334+1mfUjTjkYKSzp5bP7aoClhrBq1yeJ1xsGNdeJbCrHS6x1e3M5ECD
	6e/hTzD5OQAM7cucBXpwV422Y3kCnGMMldhqy2QKY71zSywDyI7DooCecUYEj+hDM
X-Gm-Gg: AZuq6aILX1lHLKjg0mh4Q/mAWxPcBVw8QYjPdS1VFNYO5Cy7qshHvI6KmhytmAM25Vl
	QSesi3J7EHiR4LhO4k2YoOZ/DqVj+0rNoVPDkVQ6/yOYesM385TyBLTT/bKk7u6pxh14FmvqFD1
	yrjzwVFWwxGE5eyWaHpgc2v7vcGsILyAnfHglEoyLRn4NTqD4HywlQFzOPnwBc1DQ3RKphZGaHr
	1o9XAYjkFEAY08OR1/ZMEmuNvlAmcDGtNk7+omZPAoxhXT4fMPzeX3tVEac5mdzBiVFXZlO1ewE
	3YJyax3GFoflujrQp0kuep19jPSjsy+4spZDvc1pfYNfuTg1cbMgEU/jd3kxnvs6aZYLbLVhsHi
	3UJ0E+a+M7pXkPy6C+fw5MYv6y4dF/+5wXpgUa0ujprnbDyvFlEWbcIc+8BS1wPo=
X-Received: by 2002:a05:622a:1b9e:b0:501:17a9:5ff5 with SMTP id d75a77b69052e-5070bbd86aemr127614801cf.21.1771863270812;
        Mon, 23 Feb 2026 08:14:30 -0800 (PST)
X-Received: by 2002:a05:622a:1b9e:b0:501:17a9:5ff5 with SMTP id d75a77b69052e-5070bbd86aemr127614251cf.21.1771863270296;
        Mon, 23 Feb 2026 08:14:30 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net. [100.17.19.56])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5070d6a1ddasm71793581cf.21.2026.02.23.08.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:14:29 -0800 (PST)
Date: Mon, 23 Feb 2026 11:14:29 -0500
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
Message-ID: <aZxxGNRHvURLXU3E@x1nano>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <20260218-dmabuf-heap-cma-dmem-v2-3-b249886fb7b2@redhat.com>
 <435330fd-ecdd-43c7-8527-f285c03c6421@amd.com>
 <aZdAOMBRdRw59fa0@fedora>
 <0ff02d77-13e8-4b2c-b714-38037595d535@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ff02d77-13e8-4b2c-b714-38037595d535@amd.com>
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
	TAGGED_FROM(0.00)[bounces-53194-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47FDD17994C
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 09:16:15AM +0100, Christian König wrote:
> On 2/19/26 18:10, Eric Chanudet wrote:
> > On Thu, Feb 19, 2026 at 08:17:28AM +0100, Christian König wrote:
> >>
> >>
> >> On 2/18/26 18:14, Eric Chanudet wrote:
> >>> The cma dma-buf heaps let userspace allocate buffers in CMA regions
> >>> without enforcing limits. Since each cma region registers in dmem,
> >>> charge against it when allocating a buffer in a cma heap.
> >>>
> >>> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> >>> ---
> >>>  drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
> >>>  1 file changed, 14 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> >>> index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..bbd4f9495808da19256d97bd6a4dca3e1b0a30a0 100644
> >>> --- a/drivers/dma-buf/heaps/cma_heap.c
> >>> +++ b/drivers/dma-buf/heaps/cma_heap.c
> >>> @@ -27,6 +27,7 @@
> >>>  #include <linux/scatterlist.h>
> >>>  #include <linux/slab.h>
> >>>  #include <linux/vmalloc.h>
> >>> +#include <linux/cgroup_dmem.h>
> >>>  
> >>>  #define DEFAULT_CMA_NAME "default_cma_region"
> >>>  
> >>> @@ -58,6 +59,7 @@ struct cma_heap_buffer {
> >>>  	pgoff_t pagecount;
> >>>  	int vmap_cnt;
> >>>  	void *vaddr;
> >>> +	struct dmem_cgroup_pool_state *pool;
> >>>  };
> >>>  
> >>>  struct dma_heap_attachment {
> >>> @@ -276,6 +278,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
> >>>  	kfree(buffer->pages);
> >>>  	/* release memory */
> >>>  	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
> >>> +	dmem_cgroup_uncharge(buffer->pool, buffer->len);
> >>>  	kfree(buffer);
> >>>  }
> >>>  
> >>> @@ -319,9 +322,17 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> >>>  	if (align > CONFIG_CMA_ALIGNMENT)
> >>>  		align = CONFIG_CMA_ALIGNMENT;
> >>>  
> >>> +	if (mem_accounting) {
> >>
> >> Since mem_accounting is a module parameter it is possible to make it changeable during runtime.
> >>
> >> IIRC it currently is read only, but maybe add a one line comment that the cma heap now depends on that.
> >>
> > 
> > Agreed, while read-only it is easily missed without at least a comment.
> > Alternatively, should that value be captured in the init callback to
> > guaranty it is set once and make this requirement clearer?
> 
> It probably makes more sense to make nails with heads and make it runtime configurable.
> 
> I'm not sure how exactly dmem_cgroup_try_charge()/dmem_cgroup_uncharge() works, could be that it works correctly out of the box and you just need to initialize buffer->pool to NULL when mem_accounting is not enabled.
> 

dmem_cgroup_uncharge() is called unconditionally and checks for NULL
while buffer is kzalloc(), so buffer->pool is NULL from
cma_heap_allocate() if mem_accounting is not set.

Some buffers will be accounted for and some won't depending on when it's
toggled and when buffers are requested, which didn't seem to serve much
use and is why it's set read-only.

> Regards,
> Christian.
> 
> > 
> > Thanks,
> > 
> >> Apart from that the series looks totally sane to me.
> >>
> >> Regards,
> >> Christian.
> >>
> >>> +		ret = dmem_cgroup_try_charge(
> >>> +			cma_get_dmem_cgroup_region(cma_heap->cma), size,
> >>> +			&buffer->pool, NULL);
> >>> +		if (ret)
> >>> +			goto free_buffer;
> >>> +	}
> >>> +
> >>>  	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
> >>>  	if (!cma_pages)
> >>> -		goto free_buffer;
> >>> +		goto uncharge_cgroup;
> >>>  
> >>>  	/* Clear the cma pages */
> >>>  	if (PageHighMem(cma_pages)) {
> >>> @@ -376,6 +387,8 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> >>>  	kfree(buffer->pages);
> >>>  free_cma:
> >>>  	cma_release(cma_heap->cma, cma_pages, pagecount);
> >>> +uncharge_cgroup:
> >>> +	dmem_cgroup_uncharge(buffer->pool, size);
> >>>  free_buffer:
> >>>  	kfree(buffer);
> >>>  
> >>>
> >>
> > 
> 

-- 
Eric Chanudet



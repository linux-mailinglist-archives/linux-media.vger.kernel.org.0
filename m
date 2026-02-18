Return-Path: <linux-media+bounces-53058-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMwzBrrzlWlTWwIAu9opvQ
	(envelope-from <linux-media+bounces-53058-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 18:15:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 875031582C7
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 18:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6254230241B1
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 17:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299FE23909C;
	Wed, 18 Feb 2026 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YXCsPxHS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F0gdh3cK"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5163D2F99AE
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 17:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434910; cv=none; b=VWbUKIuZLzyaXsPmtQjk6P0Z1XRHAXW5cb7P51k9EiOZOUplNIRS5CtOXkpnPtjfeiwBIVWWNa67wxpCt8izwEfqect03Dtt/XnDhLxXY4GRyRyF5wI7uhK5oNbYDc5eDj2Nly/Yu2i9o7A+YINJUo+UmwJwoDdP6ZVZnhbzc88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434910; c=relaxed/simple;
	bh=J3KmHWHvAFmGVjG/uQfaIEu+JFw9VxdB6dh65Ea9/Tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jx/2jmB+ZSYHbqdswFyiKEsbouQvrdWq08Qj46bKQPsASv/GEUF/4H8W5D57aNOaz070m+pC59L0BFkC3dVwGE80DRN+lipgdpQeY1C4YuzanCpPVis5Zq122b9winFnQ/xqcniYHK0ofcGc3TIhTcUAVPTNGkYgO/bfmCOEdq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YXCsPxHS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F0gdh3cK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771434906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RWROfJdWhlgxA5rcp8Pj9VJ7m2fa4/nREAlFrPf4oa8=;
	b=YXCsPxHS1XoX08qE57J0uO7e/ABt0x88xarlYiF/w53DJw+CzcGQu5QZT03kWGkmUJR0I1
	ztPbZHxEQZdla14VZAnCtVR8tyT+aAIL4u/Ug64CWRL7fivBRVe//5hZEV92Iz+pjkNkw8
	m1aXzlNb8PAxpvuyAFbJtsArMQqkf7w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-2VRnJDWvO92ElpIgM0aU7w-1; Wed, 18 Feb 2026 12:15:05 -0500
X-MC-Unique: 2VRnJDWvO92ElpIgM0aU7w-1
X-Mimecast-MFC-AGG-ID: 2VRnJDWvO92ElpIgM0aU7w_1771434904
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8946f1b8691so1076716d6.3
        for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 09:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771434904; x=1772039704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWROfJdWhlgxA5rcp8Pj9VJ7m2fa4/nREAlFrPf4oa8=;
        b=F0gdh3cKANsc8PlxWm/gIXXZ9v0JL/LxS8F4SboQRC1zL4I8WltGooKoAfVdiwr2BX
         lzAbfjfdnG+YRNDKDauSLuT09ZrHcRGSTMO5teYztVud6EfxiNyQ1rBbNSFxS3QnKR37
         PxTBxMnO0ec+3J5THN4aieGhnvcnaEgxc1e7SNmZzYpVzA21zpInA8/8wm448Jgy1XAw
         qfxKPJ8f8K8otCtl636EWLazKiPzb2TOW7lmxMPzXlQZ8ah2QbpTMSRe2JFyDtY15HFM
         T5tVQgqdJRCvqpO0VNIEYaLIpacjmxByc5qz+bTkwTzevSehOelvL1e0h/uoZUchyPc/
         1cYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771434904; x=1772039704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RWROfJdWhlgxA5rcp8Pj9VJ7m2fa4/nREAlFrPf4oa8=;
        b=buNeB706crUwKiZmizW+3mRi1RAPK3YJ6dwcE14FhcH6iQ7+7eons3DBVREM8BixzS
         m+5qGTaxjmv4Z9N8VAd/DAAdBcT49dEP58qf67TfzbNPzpt1Q0OSxl9Gtf35oOxnqR1c
         wGDnJT4R9k5DVdDw3fpb04RWq2BxuB2XTDVKNOMbNq4mGUsONHhjRV2hdNMi2woTUUsI
         +iNO/OI4Z4NnoZMjpL4hau3eYMnQ8XQZAO2B2UX/H2trPcP1f4zVO/LqHE1ZuQ22n7nm
         StkJd6a2ea+nP2ndIAsNDeiHRFJXTYK0EkccbXc3O04Tx4g68eptjnP/7JFHuVy1WWwB
         oIUg==
X-Gm-Message-State: AOJu0YzsK8WKNzWecqx+F4SF1ViU44iP3voxcZ+8eRoqWFLaf8Vd3qWm
	WpLDtBl7AdCudtz/4MATKmoIi3o4Aj0VtYm8fnkEHtt2IkNWzw9t1c+80/8Q7MN6hNpx7Q4v8Wa
	J1J0PPWOE3pbWSSr6ghvNePVMHjGP0qNSdn0Zjcev+1DfCarlfojJk4oUQlHP3wGG
X-Gm-Gg: AZuq6aIz9FMVhDBj8qzlVGTkzhrek7fKEVIgPlCUcw+TGFuWIlCjkFW9DxpJaWEQgLB
	DOflOBgD7Vphra4bmYKITXXn3pULf6YUqIJXKgbmp2H1iG4Z9gbz3EeaAq5mlm/1O0PyoTgNAdw
	Td7Yzr1izmsuP/1GC2v5Buk0FYX0X3D6AFHnb+XXjfa3KOoeZsWW4X+eefNlDpIiG4FVuy9ady9
	8+XOgT4Nh4m9U1m9BVbaAqSVewOMMcQ2AlU5LNDj5NqXwoyUE5+d38uRYOCaqJsWDdOy1E48Wl2
	BAqJWNRGXBamRY46Opvsrf22LdewDW0lQYN/XI5n/DrwqpDxf6fA19LsetCI8L+3UAeyuwT06m8
	8Bp/9HVdtyK7J6yYDhDvK9eV6jz/jZcD52JcsWrpWZRYcj5S2cwnyqg8MUCXo6ws=
X-Received: by 2002:a05:6214:5194:b0:895:d652:e3a5 with SMTP id 6a1803df08f44-89957fd539fmr37373426d6.23.1771434904514;
        Wed, 18 Feb 2026 09:15:04 -0800 (PST)
X-Received: by 2002:a05:6214:5194:b0:895:d652:e3a5 with SMTP id 6a1803df08f44-89957fd539fmr37372786d6.23.1771434904004;
        Wed, 18 Feb 2026 09:15:04 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net. [100.17.19.56])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc7f82csm195307856d6.4.2026.02.18.09.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:15:02 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Wed, 18 Feb 2026 12:14:12 -0500
Subject: [PATCH v2 3/3] dma-buf: heaps: cma: charge each cma heap's dmem
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-dmabuf-heap-cma-dmem-v2-3-b249886fb7b2@redhat.com>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
In-Reply-To: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
 linux-mm@kvack.org, Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53058-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[echanude@redhat.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 875031582C7
X-Rspamd-Action: no action

The cma dma-buf heaps let userspace allocate buffers in CMA regions
without enforcing limits. Since each cma region registers in dmem,
charge against it when allocating a buffer in a cma heap.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..bbd4f9495808da19256d97bd6a4dca3e1b0a30a0 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -27,6 +27,7 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/cgroup_dmem.h>
 
 #define DEFAULT_CMA_NAME "default_cma_region"
 
@@ -58,6 +59,7 @@ struct cma_heap_buffer {
 	pgoff_t pagecount;
 	int vmap_cnt;
 	void *vaddr;
+	struct dmem_cgroup_pool_state *pool;
 };
 
 struct dma_heap_attachment {
@@ -276,6 +278,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
 	kfree(buffer->pages);
 	/* release memory */
 	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
+	dmem_cgroup_uncharge(buffer->pool, buffer->len);
 	kfree(buffer);
 }
 
@@ -319,9 +322,17 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 	if (align > CONFIG_CMA_ALIGNMENT)
 		align = CONFIG_CMA_ALIGNMENT;
 
+	if (mem_accounting) {
+		ret = dmem_cgroup_try_charge(
+			cma_get_dmem_cgroup_region(cma_heap->cma), size,
+			&buffer->pool, NULL);
+		if (ret)
+			goto free_buffer;
+	}
+
 	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
 	if (!cma_pages)
-		goto free_buffer;
+		goto uncharge_cgroup;
 
 	/* Clear the cma pages */
 	if (PageHighMem(cma_pages)) {
@@ -376,6 +387,8 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 	kfree(buffer->pages);
 free_cma:
 	cma_release(cma_heap->cma, cma_pages, pagecount);
+uncharge_cgroup:
+	dmem_cgroup_uncharge(buffer->pool, size);
 free_buffer:
 	kfree(buffer);
 

-- 
2.52.0



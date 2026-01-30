Return-Path: <linux-media+bounces-51869-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOxTBRA4fWlMQwIAu9opvQ
	(envelope-from <linux-media+bounces-51869-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 00:00:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A53BF468
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 00:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76C30300E5FE
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 23:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE483659F5;
	Fri, 30 Jan 2026 23:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aw5nmqXX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kEMZLIGH"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C44364E9D
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 23:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769814026; cv=none; b=OM2bI7yBFm9okv2I4IPuvhTfiM0cgpDNAWCbK4q2PPdrvSfbwu6ZKLm3eMDPLu/CmcWoEuoFGkeIaef4ayNNmKfSbV7F93Mz8PwyXWwFoSS9s6Qo79YdcI6dSNT8zLhyK+ibM6LOd53VEdFtVWupSUes5CMV3n/eykLnmaOKY2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769814026; c=relaxed/simple;
	bh=7IQzayO5L/U28ibpezLBMSzU5XVotlajkYPYqQBbwxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Whqw2kCbh5OLI/AqL4JkzEKQeUVIEMqvQkpm9K07DKTWhgyNsXHCpsQPe4TCaqK8Yrp7lTUodQLexgmbyGucSNsvn8eteFhSSjWVYsqWxSckYvNbGuzj/xpfIEaur5/SN8dMFTllG9BGUpMX/p4zXRNWvJIGLnlvxlu+dDElHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aw5nmqXX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kEMZLIGH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769814024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xpVWSYOjmpUvjd6bPS5vI/Dt/+7lbqD30OTCkZ3YauU=;
	b=aw5nmqXX3TAE49fXuG0Kp5WirzB5Alv28QmNKii/juzo6JDI/GvQr9E8A3lH4FcI5SRbxr
	37AV5wmxQ5yxsw69QSgUicqk6EV50qDxS1DF6GOefMrorHMNqcGKwL1nqbE5gUJDIB7RyX
	tLUrbQ6kc9R7i7cg9MvDownOmfhAc+Y=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-YjzDP9WlPte_F--NsTmstw-1; Fri, 30 Jan 2026 18:00:21 -0500
X-MC-Unique: YjzDP9WlPte_F--NsTmstw-1
X-Mimecast-MFC-AGG-ID: YjzDP9WlPte_F--NsTmstw_1769814021
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5019f8a18cdso80203621cf.2
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 15:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769814021; x=1770418821; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xpVWSYOjmpUvjd6bPS5vI/Dt/+7lbqD30OTCkZ3YauU=;
        b=kEMZLIGH09Z3pPkZPQ1yePCrJEjoBO2bzglyxZB0EzA5yag0VmBZnI7OVklCp7Gn5J
         wad7RK9tCXBk1JxURhhfDTgPZjsDkoNKPvsCKJjMzR4Do4/izQW+eIXXyzFQwlKvuJIF
         //977AlpdqVCvX5vQeNafAZ3LjOGRspsk3Wf29ABy9pPmowSWPsqmBv8tDo8CkVFhVKg
         iw4flRqLXanG0UwfcTX027cDm3Ft0ayN1jOhtMBoCpP2WqDOwUCtqA+AUqumPnYsbbnx
         O32f6presKhOU3+EQJ/6Jr312hJbtJhSIh1LUH+VlCLkySBvIX5kaaOpOKJuumj9kENB
         v15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769814021; x=1770418821;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpVWSYOjmpUvjd6bPS5vI/Dt/+7lbqD30OTCkZ3YauU=;
        b=okXqis43LKFkCWl1WcuN6/PHsxdy4HVBPggu6/LFR56QfHm1YeuUSAsUDouaLMUcy0
         qWvq4UzJQxMDliun8ndYPWf2fv1xdjCaKX3x+gTXXUxwbPybyKvGyTgqbhZlzbiGtuWh
         BwdCYAk/Raji9FdmI7rdjFeiyrleBm7q1uQJH/xxxgzG1vXUkvKYdTu+NEFhn/swm+ZT
         id5nPOulDFZR9gkWz0Z5Cdn68h2X+FBXEe4adQHFQxk1+qbbiY+ZT4MgU7EFZ5Js3gdW
         CgVEz33s6bkDRQOswXB8BKpEbEGU8WViP1bEAlp5KZbgmCqqNGWebHzk7e3XWFAjuTQS
         MSXA==
X-Gm-Message-State: AOJu0YxRTv4h4SxXITpStIyuWPofvwfPiSBxC9ZdMcmRf81dBi52ogC2
	VexI49YOpJv3xowBpPynLaIX4kYYXUBl1PLxVgh5gJvanDV2hhZp5Abx2mVQyNs0K7cmfcHGq95
	4FrlW83+DnsiKpl1MfyJsAqpz1e4ajBPDMycvYzt7qwZFTKhxLGhxjPsFecZOmIhK
X-Gm-Gg: AZuq6aLgfHAlRQ0cPvhS8rjKxXjcvhm33b91wTzgjbO5a+te1kc1VpX7OdeUwlMk+Wb
	HIEFO2WlZ1attFMDKRHrUFN7GdXxDhIsopFeaBKPFyt6ivrSDQ6RVPcEJNYGuH134zKY9g4DJ6J
	1ZuCfZe2jkeJhDSkBlMBasHaJ0cK4nPxonL1MAUBkkW+3KiKi8y2Eh2d6VvKKMTYAY0gQOd1tQ7
	o1U/7oA0N59eBfyNAqBlkAmHT1dtaZ/O5UtCVEaRGmKTjfxkUsDnHs3JDK7QDHYyH7RRODZISyz
	G6LzAmVpeZ+jtsTY1BBDCAbBIDfqh9aYBKNm7XvFcam9i2WkCpmkOB92cHqZ+YfVf/1/cB0ZN01
	jLGfg1g7IVXHCP3+xYLEhsvAejtzIN7WNrOM/kGiO9hfLDcUk9u0=
X-Received: by 2002:ac8:5ac7:0:b0:4f1:ca4f:d480 with SMTP id d75a77b69052e-505d2263fddmr58996101cf.45.1769814020753;
        Fri, 30 Jan 2026 15:00:20 -0800 (PST)
X-Received: by 2002:ac8:5ac7:0:b0:4f1:ca4f:d480 with SMTP id d75a77b69052e-505d2263fddmr58995451cf.45.1769814020240;
        Fri, 30 Jan 2026 15:00:20 -0800 (PST)
Received: from localhost (pool-100-17-18-12.bstnma.fios.verizon.net. [100.17.18.12])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d375e1c8sm70249956d6.48.2026.01.30.15.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 15:00:19 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 30 Jan 2026 17:55:30 -0500
Subject: [PATCH] dma-buf: heaps: cma: register a dmem region for each cma
 heap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-dmabuf-heap-cma-dmem-v1-1-3647ea993e99@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgNtEBGvIg7RpjZDq7Qognh3i
 +Mb/n+gSFYpMDYPZLm06J4qbNvAGjhtguqqgQz1xtKALvJyegzCB66RqyWi7ywZJuc7HqCmRxa
 v97+d5vf9AHWa3QpmAAAA
X-Change-ID: 20260128-dmabuf-heap-cma-dmem-f4120a2df4a8
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
 Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51869-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[echanude@redhat.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40A53BF468
X-Rspamd-Action: no action

The cma dma-buf heaps let userspace allocate buffers in CMA regions
without enforcing limits. Register a dmem region per cma heap and charge
against it when allocating a buffer in a cma heap.

For the default cma region, two heaps may be created for the same cma
range:
commit 854acbe75ff4 ("dma-buf: heaps: Give default CMA heap a fixed name")
  Introduced /dev/dma_heap/default_cma_region
commit 4f5f8baf7341 ("dma-buf: heaps: cma: Create CMA heap for each CMA
                      reserved region")
  Created a CMA heap for each CMA region, which might create a duplicate
  heap to the default one, e.g:
    /dev/dma_heap/default_cma_region
    /dev/dma_heap/reserved

Removing the legacy heap would break user API. So handle the special
case by using one dmem between the two heaps to account charges
correctly.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
In continuation with introducing cgroup for the system heap[1], this
behavior is enabled based on dma_heap.mem_accounting, disabled by
default.

dmem is chosen for CMA heaps as it allows limits to be set for each
region backing each heap. There is one caveat for the default cma range
that may accessible through two different cma heaps, which is treated as
a special case.

[1] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com/
---
 drivers/dma-buf/heaps/cma_heap.c | 51 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..608af8ad6bce7fe0321da6d8f1b65a69f5d8d950 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -27,6 +27,7 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/cgroup_dmem.h>
 
 #define DEFAULT_CMA_NAME "default_cma_region"
 
@@ -46,7 +47,9 @@ int __init dma_heap_cma_register_heap(struct cma *cma)
 struct cma_heap {
 	struct dma_heap *heap;
 	struct cma *cma;
+	struct dmem_cgroup_region *cg;
 };
+static struct dmem_cgroup_region *default_cma_cg;
 
 struct cma_heap_buffer {
 	struct cma_heap *heap;
@@ -58,6 +61,7 @@ struct cma_heap_buffer {
 	pgoff_t pagecount;
 	int vmap_cnt;
 	void *vaddr;
+	struct dmem_cgroup_pool_state *pool;
 };
 
 struct dma_heap_attachment {
@@ -276,6 +280,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
 	kfree(buffer->pages);
 	/* release memory */
 	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
+	dmem_cgroup_uncharge(buffer->pool, buffer->len);
 	kfree(buffer);
 }
 
@@ -319,9 +324,16 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 	if (align > CONFIG_CMA_ALIGNMENT)
 		align = CONFIG_CMA_ALIGNMENT;
 
+	if (mem_accounting) {
+		ret = dmem_cgroup_try_charge(cma_heap->cg, size,
+					     &buffer->pool, NULL);
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
@@ -376,6 +388,8 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 	kfree(buffer->pages);
 free_cma:
 	cma_release(cma_heap->cma, cma_pages, pagecount);
+uncharge_cgroup:
+	dmem_cgroup_uncharge(buffer->pool, size);
 free_buffer:
 	kfree(buffer);
 
@@ -390,25 +404,52 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
 {
 	struct dma_heap_export_info exp_info;
 	struct cma_heap *cma_heap;
+	struct dmem_cgroup_region *region;
+	int ret;
 
 	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
 	if (!cma_heap)
 		return -ENOMEM;
 	cma_heap->cma = cma;
 
+	/*
+	 * If two heaps are created for the default cma region, use the same
+	 * dmem for them. They both use the same memory pool.
+	 */
+	if (dev_get_cma_area(NULL) == cma && default_cma_cg)
+		region = default_cma_cg;
+	else {
+		region = dmem_cgroup_register_region(cma_get_size(cma), "cma/%s", name);
+		if (IS_ERR(region)) {
+			ret = PTR_ERR(region);
+			goto free_cma_heap;
+		}
+	}
+	cma_heap->cg = region;
+
 	exp_info.name = name;
 	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
 	cma_heap->heap = dma_heap_add(&exp_info);
 	if (IS_ERR(cma_heap->heap)) {
-		int ret = PTR_ERR(cma_heap->heap);
-
-		kfree(cma_heap);
-		return ret;
+		ret = PTR_ERR(cma_heap->heap);
+		goto cg_unregister;
 	}
 
+	if (dev_get_cma_area(NULL) == cma && !default_cma_cg)
+		default_cma_cg = region;
+
 	return 0;
+
+cg_unregister:
+	/* default_cma_cg == cma_heap->cg only for the duplicate heap. */
+	if (default_cma_cg != cma_heap->cg)
+		dmem_cgroup_unregister_region(cma_heap->cg);
+free_cma_heap:
+	kfree(cma_heap);
+
+	return ret;
 }
 
 static int __init add_cma_heaps(void)

---
base-commit: 3d65e4c276b32c03450261d114e495fda03c8e97
change-id: 20260128-dmabuf-heap-cma-dmem-f4120a2df4a8

Best regards,
-- 
Eric Chanudet <echanude@redhat.com>



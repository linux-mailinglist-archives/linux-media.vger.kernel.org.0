Return-Path: <linux-media+bounces-64451-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IPcEFHh1KWqbXAMAu9opvQ
	(envelope-from <linux-media+bounces-64451-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:32:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9620C66A3D9
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:32:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=QMvwJ3hN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64451-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64451-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DA07326605C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858BA32D7FA;
	Wed, 10 Jun 2026 14:23:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E7C285CB6
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 14:23:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101430; cv=none; b=dbEI65ETrY61DFZQ8XyIIrADo5z/gHMQflckFx+ovYqNyyzlIxRsxRAHyIwQClGlAREWpq0QEtT4U0A3c/CwlTbav76s+uemeNp2UqGkJdjEqw0P/NJEjExMpKDFXi9d1/YZYudAoEdEt6ODWYdR72Qhut6lQMDq+y6+qshuB9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101430; c=relaxed/simple;
	bh=8mPfyyoNCUBTEo0ky0/MzA0ZzyD72RHYKbfDkhMqGbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h8SgqA5YWMbhTMwMuAcB8EqIRV4kKj6K5UFn6C3XnrYXFJf53z08zqgP1RoJoOSCEalj0az8xHUaIm4QHMDZbnvoK24L4dqa1BICaSgM6MLi4DOHhGBx6WLa5joNKh6dqsKzlODwayS98oMfoRqLyhRTYqtCGlgRIhwLi/Dxb/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QMvwJ3hN; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso49372985ad.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781101428; x=1781706228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIgrfTieRwmLlw1dLE2AIE0y0j3JlRfXfzK5v3rBlwE=;
        b=QMvwJ3hNtNFZhRifyU09FGDQVs2MkJhnV7EpdE5BuxgPzIMXTAaKts1+HioKh99RAb
         +IfdudzaQRxi7/9wUMZs990u4vWyZHgKcgTMDaNdixZfJ7OuCXjvdsvIJMewpr+9G1EI
         zmnr1xngneECqAt9iuQcH9dM9Y9/3nM551BpEhCC6CT8tpEFpKRrCbRQIwuPS/ko+I9h
         8jBPtC6wqNw+omO7RASlIXrsxQAvK7ycH/47uBLNa+yWnMrqqVT0v3w/QrTKvQjl7n7s
         DXss2ibUQEfKNC5DKdGkYZqM2Dj9rcRkTSL3u8cHVSOhjUu7bfyBaKhEr7s3uGce+Lrz
         exDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781101428; x=1781706228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIgrfTieRwmLlw1dLE2AIE0y0j3JlRfXfzK5v3rBlwE=;
        b=MPcG+eb5Np3a80WZ+trK2J699TVUZx+elFGSxd7JbRqlW/FQcLeNnwN/lb7Ju1eag+
         kWh6aJG82b5XZzSbPV6x6NJrDh8qhgIsLRbmkeh357aIe2LGdk5QxOVDD+uoPymsS+qH
         aLmXNL8EYKkeqP5zKI47iKCdWfoUhThzrVjT3QrJx7aAriSx3q/+AnNZiIOCIsn7ZWVl
         hFfOEPt2RyXVbZBahz1aqAdXJWp++ZN7Uki6RCHYug5eAIx2nq26EdfIhm0D2F0R1Yr0
         4ODXTVsQUIbzZqkg35mvTEVeUvLCMXWqQ6JE2UcoYc2MoU3CkB4MXGBV510rCBj2/PUv
         4tEg==
X-Forwarded-Encrypted: i=1; AFNElJ9K0vjDIf878Kl/gAiKE63x0wlPUexhvFBRN442JNFgN/8G7c+HeA3dETX+TsGnU/GC6HDwfoPug4O/0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDRhL/4r/K2HmgloFHvxBnyCZt6SgRxxdJ2PCkBLnnE1i8jXCp
	+WsqtjyfuBklha0jNAta0nemxHjZcFEhGkYNPxrOZy4mnjxRhsrBtvYrjO9EJJtBE6w=
X-Gm-Gg: Acq92OFEKuLBLzxlPGa2m+VPCjqM2yrs8J/JXavHVyvFsffuQ2G3J8lPq4BfVlHrqdU
	VXSSUbPfK02zGQoEoFtuR4MZtUL4OIh9k8QvpPl3DQCFOZb9mA0QgKpy3Xr1VOzeXROXaANL3KZ
	m5h3uZuPqlYuCj/34XvH9DecVRc19pqriWB5ONJ4u6wQk4b5KhQjA0J0eG/0jv3rH/+xqaPAjsJ
	9uQ6dGfvx9xthZ4fVW5674V+y4wwXKXqZK5g+pfGmW5b4/B4F7NsdZ7QDEZ+NXrRdGG+whLOzrE
	zRVJy+SbjMvils1i240RxZUmb1MjoVtFblLaTQjuTkI3hQX3sOuIx99p0tTZQmbl6eRLo3NL5hT
	EzFna5olDFZ5g8lsaVnOFmdtFlrve/TuhR4CgF9d0awMoDDw2bMjCD2gDicJroOG+IrRh+l5aqI
	7cvu7fq+5c4AV0SsliBhovLl2+thaEOl2bL0+asiyorHvG7dvh6LCSNA==
X-Received: by 2002:a17:902:e752:b0:2b2:5515:661c with SMTP id d9443c01a7336-2c1e893d62dmr281727295ad.31.1781101427890;
        Wed, 10 Jun 2026 07:23:47 -0700 (PDT)
Received: from nagraj.tail8a2ac.ts.net ([2406:7400:98:3ab:da47:17e2:32f7:c4d3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d318sm265761935ad.15.2026.06.10.07.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:23:47 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: jgg@ziepe.ca,
	jiri@resnulli.us,
	hch@infradead.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lkp@intel.com,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	linux-s390@vger.kernel.org,
	djbw@kernel.org,
	thomas.lendacky@amd.com,
	x86@kernel.org,
	arnd@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	mripard@kernel.org,
	afd@ti.com,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] dma-buf: move system_cc_shared heap under separate Kconfig
Date: Wed, 10 Jun 2026 19:53:29 +0530
Message-ID: <20260610142329.3836808-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-64451-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ziepe.ca,resnulli.us,infradead.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,lists.ozlabs.org,intel.com,vger.kernel.org,amd.com,linaro.org,collabora.com,arm.com,google.com,ti.com,lists.freedesktop.org,lists.linaro.org,arndb.de];
	FORGED_SENDER(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:jiri@resnulli.us,m:hch@infradead.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:lkp@intel.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-s390@vger.kernel.org,m:djbw@kernel.org,m:thomas.lendacky@amd.com,m:x86@kernel.org,m:arnd@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:mripard@kernel.org,m:afd@ti.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:arnd@arndb.de,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9620C66A3D9

From: Arnd Bergmann <arnd@arndb.de>

While system heap and system_cc_shared heap share a lot of code
and hence the same source file, their users have different needs.

system heap users need it to be a loadable module, while
system_cc_shared heap users don't.

Building as a loadable module breaks system_cc_shared heap on
powerpc and s390 due to un-exported set_memory_encrypted /
set_memory_decrypted functions.

Fix these by reorganising code to put the system_cc_shared heap
under a new Kconfig symbol, which allows either building both
into the kernel, or leave encryption up to the consumers of the
system heap.

Fixes: fd55edff8a0a ("dma-buf: heaps: system: Turn the heap into a module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
---
 drivers/dma-buf/heaps/Kconfig       |  8 ++++++++
 drivers/dma-buf/heaps/system_heap.c | 16 ++++++++++------
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index e273fb18feca..a39decdcf067 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -5,6 +5,14 @@ config DMABUF_HEAPS_SYSTEM
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
 
+config DMABUF_HEAPS_CC_SYSTEM
+	bool "DMA-BUF System Heap for decrypted CoCo VMs"
+	depends on DMABUF_HEAPS && ARCH_HAS_MEM_ENCRYPT && DMABUF_HEAPS_SYSTEM=y
+	help
+	  Choose this option to enable the system_cc_shared dmabuf heap. This
+	  allows allocating shared (decrypted) memory for confidential computing
+	  (CoCo) VMs.
+
 config DMABUF_HEAPS_CMA
 	tristate "DMA-BUF CMA Heap"
 	depends on DMABUF_HEAPS && DMA_CMA
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index c92bdec356fc..71d9028cc3df 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -48,6 +48,9 @@ struct dma_heap_attachment {
 	bool cc_shared;
 };
 
+#define cc_shared_buffer(b) (IS_ENABLED(CONFIG_DMABUF_HEAPS_CC_SYSTEM) && \
+				(b)->cc_shared)
+
 #define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
 #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
 				| __GFP_NORETRY) & ~__GFP_RECLAIM) \
@@ -161,7 +164,7 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
 	unsigned long attrs;
 	int ret;
 
-	attrs = a->cc_shared ? DMA_ATTR_CC_SHARED : 0;
+	attrs = cc_shared_buffer(a) ? DMA_ATTR_CC_SHARED : 0;
 	ret = dma_map_sgtable(attachment->dev, table, direction, attrs);
 	if (ret)
 		return ERR_PTR(ret);
@@ -233,7 +236,7 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	int i, ret;
 
 	prot = vma->vm_page_prot;
-	if (buffer->cc_shared)
+	if (cc_shared_buffer(buffer))
 		prot = pgprot_decrypted(prot);
 
 	for_each_sgtable_sg(table, sg, i) {
@@ -282,7 +285,7 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
 	}
 
 	prot = PAGE_KERNEL;
-	if (buffer->cc_shared)
+	if (cc_shared_buffer(buffer))
 		prot = pgprot_decrypted(prot);
 	vaddr = vmap(pages, npages, VM_MAP, prot);
 	vfree(pages);
@@ -349,7 +352,7 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 		 * Intentionally leak pages that cannot be re-encrypted
 		 * to prevent shared memory from being reused.
 		 */
-		if (buffer->cc_shared &&
+		if (cc_shared_buffer(buffer) &&
 		    system_heap_set_page_encrypted(page))
 			continue;
 
@@ -456,7 +459,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 		list_del(&page->lru);
 	}
 
-	if (cc_shared) {
+	if (cc_shared_buffer(buffer)) {
 		for_each_sgtable_sg(table, sg, i) {
 			ret = system_heap_set_page_decrypted(sg_page(sg));
 			if (ret)
@@ -485,7 +488,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 		 * Intentionally leak pages that cannot be re-encrypted
 		 * to prevent shared memory from being reused.
 		 */
-		if (buffer->cc_shared &&
+		if (cc_shared_buffer(buffer) &&
 		    system_heap_set_page_encrypted(p))
 			continue;
 		__free_pages(p, compound_order(p));
@@ -525,6 +528,7 @@ static int __init system_heap_create(void)
 		return PTR_ERR(sys_heap);
 
 	if (IS_ENABLED(CONFIG_HIGHMEM) ||
+	    !IS_ENABLED(CONFIG_DMABUF_HEAPS_CC_SYSTEM) ||
 	    !cc_platform_has(CC_ATTR_MEM_ENCRYPT))
 		return 0;
 
-- 
2.43.0



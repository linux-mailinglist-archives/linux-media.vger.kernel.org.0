Return-Path: <linux-media+bounces-53178-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIhkFW4jnGkCAAQAu9opvQ
	(envelope-from <linux-media+bounces-53178-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:52:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE6C174430
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A25BD3031ADC
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C94355026;
	Mon, 23 Feb 2026 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="2T9XMgbv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35625350A39
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840303; cv=none; b=crYDMGNkZiJ5nD0qKYgBz9DmC2h9A2gfeR/oEoEq8sjatZ8216+BxkoswHCSS+iBpc+GtfTlmZ9po8j922M/DacbygQZ4PXUfEOBQ91c9vY45nWkj239c18nDDUM+c94L5y367sOt8fBemmVZQsE4eLwxXHkT49dy/2KU5/aJX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840303; c=relaxed/simple;
	bh=ZyM23UfEgVGntB1/zJ/cKUDJiF+dqS6IUYHE9p7QMok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1ET1Qah8LrHaguRP4+wTCR3IxoB3DbhW20mnqXXr0VtuOdhllyncUyEn/wWvylzhnBZ38+fwFq+SgZC/a4Ptmj7zMAubUFYDjxKPsEPQcK/+C0dGd8K7kP1A/u2g8dPlB+AiOiLeCADNlF3vmQpd2O1FFw0E5fN42k+nOi2gbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=2T9XMgbv; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso29904505e9.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1771840301; x=1772445101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mF8Zav5NAo2mpAKEgaciFJ2LFKzg7+sHGDJbJ7B58Uk=;
        b=2T9XMgbvPh2Aq9lnbZb4XwGLaCpfzZ4/85+bjHq2w6vgM3zvwF0jY2tBxF2ejXIBco
         PoAV1ekmdmwM8A3vLGjSj4vS0tCqa2rqqSlylfko6C+A5Y0flhnpTCmp9j2wc4Dbu+M/
         Vv81l+WA4NA6AYcc0ynVrXyuTGJxH6Tk8vQXp3QEWN4gVSUAHFGV7GyQy6IIZVCE/mp5
         U19ragHyFT6cA3VuxH2NQseySFU1SjdN7zTkTNlnKW3u5wKvPE02wQzSSD+aBUnyHFzg
         nwdSyt0MIjCf35GciYoC4Q9hTF42yuWaBPVGl7eXUHKcERF1ioHgiGRdNmlssE+Ir7po
         UdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840301; x=1772445101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mF8Zav5NAo2mpAKEgaciFJ2LFKzg7+sHGDJbJ7B58Uk=;
        b=TOrM29F3L2iLRZxMtM7Tud3dDWa8qVIB+/dt3hvLnbgfEDIPVP0XNj3ITk5N1ltoSf
         2LkO202soQlAwysFi7MusgMgWoh9bHW0s/lN4OmBJZchXILnUvJ3p99zU/uoZFbI6uO/
         xEisPghJAVYEMDRvKpRgNwTHZ4q/2kW/hk72Gi+XyLZ93dFzBa1kmHzK+pjSxC2SS48F
         1skvZPhHdUieEhUnCFVumYZkWciyGtho1u35f8H4dlfFC+qe5pTl7cwTjRYobhkjYcxU
         bEbCgg7+D+BDUrrdwK5xGiFn3lILaofPc3FAhKNou9bg3UYtjiLr37VNSawWPspLLXne
         l9dA==
X-Forwarded-Encrypted: i=1; AJvYcCXs/NWpjLI34m9JXwEsdEksIwWUDxHBExETT8nCsACZtQtJMZ/uu4ciDc5yEmgb6XnV3IGk9y+PMoRjLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJR7ZCdiWoQJnaLIpeup5TkeBDthts9Y/VkSWMfjatVjDizfXP
	tSrAmNM25Jn3qXBH4amG2/mfQNomFKr64JG6abKV+RUEMHRYscvw/kVCRCq354S+/Qc=
X-Gm-Gg: AZuq6aKLNeEhVjfXLLmOrZhD82dy0JxSbyIAwcDSxmdSzqcmq+6byA9C5d8D5x0BbL9
	Y/cwhtzPFu3YHPlXttmUIT7rp97ZwP94hUlMOMhVHDo7+aWIfyWzwWM7xUaL2y1fi1M0mfFu6jb
	3ghgETyPocJEPn0ymG5kupYkmavlVTUU4+9gSPSojJ1KMSXiCCoevnrXEE39MAzzm9eZhOdlmSD
	v/aTGevSZNbnh/qogvbOOtMq0WycZOwOXz2W7T4e2VW5Wqjq4wnyulQTp3zXZNC50mfjnzc98I1
	vVwQHDQCwOwcdn8ux8Km1DeRg/7TcYWAF/2MgdU0KPhp3848HmgaBnlZFl/MxRU9dkTudGmgRQP
	y8IYzg8YRHt7rJB66OzAA3sDh5nV2uWYxRmSQr8xcedCSC0rVEhMl7ZmJqyztUZ9CJ0uSIKpxzD
	cv9ek2dMWxm3x1wA==
X-Received: by 2002:a05:600c:c4a5:b0:483:7783:5382 with SMTP id 5b1f17b1804b1-483a95e6b64mr115865615e9.27.1771840300410;
        Mon, 23 Feb 2026 01:51:40 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9caadedsm152604565e9.10.2026.02.23.01.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:51:40 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	sean.anderson@linux.dev,
	ptesarik@suse.com,
	catalin.marinas@arm.com,
	aneesh.kumar@kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	thomas.lendacky@amd.com,
	john.allen@amd.com,
	ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: [PATCH v2 2/2] dma-buf: heaps: system: add system_cc_decrypted heap for explicitly decrypted memory
Date: Mon, 23 Feb 2026 10:51:36 +0100
Message-ID: <20260223095136.225277-3-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260223095136.225277-1-jiri@resnulli.us>
References: <20260223095136.225277-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53178-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,resnulli-us.20230601.gappssmtp.com:dkim,resnulli.us:mid,ti.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,exp_info.name:url]
X-Rspamd-Queue-Id: AFE6C174430
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

Add a new "system_cc_decrypted" dma-buf heap to allow userspace to
allocate decrypted (shared) memory for confidential computing (CoCo)
VMs.

On CoCo VMs, guest memory is encrypted by default. The hardware uses an
encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
Intel TDX) to control whether a given memory access is encrypted or
decrypted. The kernel's direct map is set up with encryption enabled,
so pages returned by alloc_pages() are encrypted in the direct map
by default. To make this memory usable for devices that do not support
DMA to encrypted memory (no TDISP support), it has to be explicitly
decrypted. A couple of things are needed to properly handle
decrypted memory for the dma-buf use case:

- set_memory_decrypted() on the direct map after allocation:
  Besides clearing the encryption bit in the direct map PTEs, this
  also notifies the hypervisor about the page state change. On free,
  the inverse set_memory_encrypted() must be called before returning
  pages to the allocator. If re-encryption fails, pages
  are intentionally leaked to prevent decrypted memory from being
  reused as private.

- pgprot_decrypted() for userspace and kernel virtual mappings:
  Any new mapping of the decrypted pages, be it to userspace via
  mmap or to kernel vmalloc space via vmap, creates PTEs independent
  of the direct map. These must also have the encryption bit cleared,
  otherwise accesses through them would see encrypted (garbage) data.

- DMA_ATTR_CC_DECRYPTED for DMA mapping:
  Since the pages are already decrypted, the DMA API needs to be
  informed via DMA_ATTR_CC_DECRYPTED so it can map them correctly
  as unencrypted for device access.

On non-CoCo VMs, the system_cc_decrypted heap is not registered
to prevent misuse by userspace that does not understand
the security implications of explicitly decrypted memory.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v1->v2:
- fixed build errors on s390 by including mem_encrypt.h
- converted system heap flag implementation to a separate heap
---
 drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
 include/linux/dma-heap.h            |   1 +
 include/uapi/linux/dma-heap.h       |   3 +-
 3 files changed, 100 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index b3650d8fd651..a525e9aaaffa 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -10,17 +10,25 @@
  *	Andrew F. Davis <afd@ti.com>
  */
 
+#include <linux/cc_platform.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-heap.h>
 #include <linux/err.h>
 #include <linux/highmem.h>
+#include <linux/mem_encrypt.h>
 #include <linux/mm.h>
+#include <linux/set_memory.h>
 #include <linux/module.h>
+#include <linux/pgtable.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+struct system_heap_priv {
+	bool decrypted;
+};
+
 struct system_heap_buffer {
 	struct dma_heap *heap;
 	struct list_head attachments;
@@ -29,6 +37,7 @@ struct system_heap_buffer {
 	struct sg_table sg_table;
 	int vmap_cnt;
 	void *vaddr;
+	bool decrypted;
 };
 
 struct dma_heap_attachment {
@@ -36,6 +45,7 @@ struct dma_heap_attachment {
 	struct sg_table table;
 	struct list_head list;
 	bool mapped;
+	bool decrypted;
 };
 
 #define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
@@ -52,6 +62,34 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
 static const unsigned int orders[] = {8, 4, 0};
 #define NUM_ORDERS ARRAY_SIZE(orders)
 
+static int system_heap_set_page_decrypted(struct page *page)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+	unsigned int nr_pages = 1 << compound_order(page);
+	int ret;
+
+	ret = set_memory_decrypted(addr, nr_pages);
+	if (ret)
+		pr_warn_ratelimited("dma-buf system heap: failed to decrypt page at %p\n",
+				    page_address(page));
+
+	return ret;
+}
+
+static int system_heap_set_page_encrypted(struct page *page)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+	unsigned int nr_pages = 1 << compound_order(page);
+	int ret;
+
+	ret = set_memory_encrypted(addr, nr_pages);
+	if (ret)
+		pr_warn_ratelimited("dma-buf system heap: failed to re-encrypt page at %p, leaking memory\n",
+				    page_address(page));
+
+	return ret;
+}
+
 static int dup_sg_table(struct sg_table *from, struct sg_table *to)
 {
 	struct scatterlist *sg, *new_sg;
@@ -90,6 +128,7 @@ static int system_heap_attach(struct dma_buf *dmabuf,
 	a->dev = attachment->dev;
 	INIT_LIST_HEAD(&a->list);
 	a->mapped = false;
+	a->decrypted = buffer->decrypted;
 
 	attachment->priv = a;
 
@@ -119,9 +158,11 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
 {
 	struct dma_heap_attachment *a = attachment->priv;
 	struct sg_table *table = &a->table;
+	unsigned long attrs;
 	int ret;
 
-	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	attrs = a->decrypted ? DMA_ATTR_CC_DECRYPTED : 0;
+	ret = dma_map_sgtable(attachment->dev, table, direction, attrs);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -188,8 +229,13 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	unsigned long addr = vma->vm_start;
 	unsigned long pgoff = vma->vm_pgoff;
 	struct scatterlist *sg;
+	pgprot_t prot;
 	int i, ret;
 
+	prot = vma->vm_page_prot;
+	if (buffer->decrypted)
+		prot = pgprot_decrypted(prot);
+
 	for_each_sgtable_sg(table, sg, i) {
 		unsigned long n = sg->length >> PAGE_SHIFT;
 
@@ -206,8 +252,7 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 		if (addr + size > vma->vm_end)
 			size = vma->vm_end - addr;
 
-		ret = remap_pfn_range(vma, addr, page_to_pfn(page),
-				size, vma->vm_page_prot);
+		ret = remap_pfn_range(vma, addr, page_to_pfn(page), size, prot);
 		if (ret)
 			return ret;
 
@@ -225,6 +270,7 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
 	struct page **pages = vmalloc(sizeof(struct page *) * npages);
 	struct page **tmp = pages;
 	struct sg_page_iter piter;
+	pgprot_t prot;
 	void *vaddr;
 
 	if (!pages)
@@ -235,7 +281,10 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
 		*tmp++ = sg_page_iter_page(&piter);
 	}
 
-	vaddr = vmap(pages, npages, VM_MAP, PAGE_KERNEL);
+	prot = PAGE_KERNEL;
+	if (buffer->decrypted)
+		prot = pgprot_decrypted(prot);
+	vaddr = vmap(pages, npages, VM_MAP, prot);
 	vfree(pages);
 
 	if (!vaddr)
@@ -296,6 +345,14 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 	for_each_sgtable_sg(table, sg, i) {
 		struct page *page = sg_page(sg);
 
+		/*
+		 * Intentionally leak pages that cannot be re-encrypted
+		 * to prevent decrypted memory from being reused.
+		 */
+		if (buffer->decrypted &&
+		    system_heap_set_page_encrypted(page))
+			continue;
+
 		__free_pages(page, compound_order(page));
 	}
 	sg_free_table(table);
@@ -347,6 +404,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	unsigned long size_remaining = len;
 	unsigned int max_order = orders[0];
+	struct system_heap_priv *priv = dma_heap_get_drvdata(heap);
+	bool decrypted = priv->decrypted;
 	struct dma_buf *dmabuf;
 	struct sg_table *table;
 	struct scatterlist *sg;
@@ -362,6 +421,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	mutex_init(&buffer->lock);
 	buffer->heap = heap;
 	buffer->len = len;
+	buffer->decrypted = decrypted;
 
 	INIT_LIST_HEAD(&pages);
 	i = 0;
@@ -396,6 +456,14 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 		list_del(&page->lru);
 	}
 
+	if (decrypted) {
+		for_each_sgtable_sg(table, sg, i) {
+			ret = system_heap_set_page_decrypted(sg_page(sg));
+			if (ret)
+				goto free_pages;
+		}
+	}
+
 	/* create the dmabuf */
 	exp_info.exp_name = dma_heap_get_name(heap);
 	exp_info.ops = &system_heap_buf_ops;
@@ -413,6 +481,13 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	for_each_sgtable_sg(table, sg, i) {
 		struct page *p = sg_page(sg);
 
+		/*
+		 * Intentionally leak pages that cannot be re-encrypted
+		 * to prevent decrypted memory from being reused.
+		 */
+		if (buffer->decrypted &&
+		    system_heap_set_page_encrypted(p))
+			continue;
 		__free_pages(p, compound_order(p));
 	}
 	sg_free_table(table);
@@ -428,6 +503,14 @@ static const struct dma_heap_ops system_heap_ops = {
 	.allocate = system_heap_allocate,
 };
 
+static struct system_heap_priv system_heap_priv = {
+	.decrypted = false,
+};
+
+static struct system_heap_priv system_heap_cc_decrypted_priv = {
+	.decrypted = true,
+};
+
 static int __init system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
@@ -435,8 +518,18 @@ static int __init system_heap_create(void)
 
 	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
-	exp_info.priv = NULL;
+	exp_info.priv = &system_heap_priv;
+
+	sys_heap = dma_heap_add(&exp_info);
+	if (IS_ERR(sys_heap))
+		return PTR_ERR(sys_heap);
+
+	if (IS_ENABLED(CONFIG_HIGHMEM) ||
+	    !cc_platform_has(CC_ATTR_MEM_ENCRYPT))
+		return 0;
 
+	exp_info.name = "system_cc_decrypted";
+	exp_info.priv = &system_heap_cc_decrypted_priv;
 	sys_heap = dma_heap_add(&exp_info);
 	if (IS_ERR(sys_heap))
 		return PTR_ERR(sys_heap);
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 648328a64b27..d97b668413c1 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -10,6 +10,7 @@
 #define _DMA_HEAPS_H
 
 #include <linux/types.h>
+#include <uapi/linux/dma-heap.h>
 
 struct dma_heap;
 
diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
index a4cf716a49fa..ab95bb355ed5 100644
--- a/include/uapi/linux/dma-heap.h
+++ b/include/uapi/linux/dma-heap.h
@@ -18,8 +18,7 @@
 /* Valid FD_FLAGS are O_CLOEXEC, O_RDONLY, O_WRONLY, O_RDWR */
 #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
 
-/* Currently no heap flags */
-#define DMA_HEAP_VALID_HEAP_FLAGS (0ULL)
+#define DMA_HEAP_VALID_HEAP_FLAGS (0)
 
 /**
  * struct dma_heap_allocation_data - metadata passed from userspace for
-- 
2.51.1



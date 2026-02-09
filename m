Return-Path: <linux-media+bounces-52428-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIsnLPsAimluFQAAu9opvQ
	(envelope-from <linux-media+bounces-52428-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:44:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21530112129
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5FE9306817E
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F279737FF61;
	Mon,  9 Feb 2026 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="HhReiw0s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC963803D6
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651498; cv=none; b=OARlX8gjfEWtL7PWT51UyzpgNCjHsXUZ/sKB87+lYQnl45y7al1FDVric7EdBxEC3+LJfZXOcR0HXmTP9NGT+5mzZxpmjwQA8c210ZXoxmPta9ZBa8KeXv/Xllcb1fzyqGmLNFoW9xqSH+sZOZ09tXFTqcAiXdQJr36jW7354yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651498; c=relaxed/simple;
	bh=iGVSUlByZ9R+Hf3KbnSMbzHFW1HHMLu5Fivqmkrt5c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ffB7f0gdS2u1B0lHP9E2skQ0t0aFa2jlFlQG/3c0XShZ1DM/DYeACJqnRUmTM0BSQpdN7TsdbYpBpT0SHi8hNw3JpGZ/9/JOfyF0tAQra2StynrM6PUcyWMm4p6LpJY8N02WMlxtnplN83kfAoA0zFBdFo45aEluM+f4Q1vJFb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=HhReiw0s; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4362507f0bcso2763068f8f.0
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 07:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770651496; x=1771256296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ee6Qt6P3kb+iUDKJmukIBp9eLArciL7f3fEMhhpVWQ=;
        b=HhReiw0staX5p5r/PzWw+T6Gx80rejRFl+HWo3LfAc7l1wYIBVtTu48JkvnlONCWip
         J2AuEN28cfW87lKQ6j/bUQ8OK5deTKJIDn5tr+T2bhJEGSU7tOeeJyNUiiLs3Y+N3QzV
         qya2EDOx72SlRq0ITwTa8shWl0qYotoMRljzPeTxm3LzqICUTZC+g1B3BR8lweMAN9jR
         5UFuQ7oqqecqDhPN36K9KRkVl0KlnEpC4BZdMjjGthqS4cDFqMpZOGh+7CTs2uYYYrFs
         fBuxdujw3WWfk1CLz+jLQNhT3ROSbhQgUfuVec4+kyqf+rMx9EalWWPbwji9ju0yQPcT
         MZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770651496; x=1771256296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ee6Qt6P3kb+iUDKJmukIBp9eLArciL7f3fEMhhpVWQ=;
        b=QxfTSNyLI14TJEP1rwsH4LGWA+sp8PjaecGKy1u7CxYibrQJA7Ts9TL2BkzAkd0ceR
         RBWGS7tYHiZ1LX46OvSvssSnDxR0V95aclPrCxzlIMdRGNQ3C5cPzXsK/S4V1Hic4cSP
         fUfvpVcfh/9Up5+8EHzeVivA9+IskGMapIc6smbGSLgNiyuoUB4U/2U3bfg2iH259mjF
         p314M0EDtEm1bn49fLqYjjdNLZHU6k+Cr6ulsmIw7+P0CRwQ1g+JgbclQzy5RpUZIU7J
         /49J+FtCZEPFp5DZ8wfB+hQZqQdSk+j6W7ZeropmMxvyH0OMukNUAvyWbbj12/mvhVPQ
         Qydw==
X-Forwarded-Encrypted: i=1; AJvYcCXDtDSwcAzxEs3trpr6g879pG5Kc9q8iN/Wv6916x8t7qP9SeGaiviQoZQhDrc0jIUa8PQIDY9TdP+8/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfMRnZ640PPRbuCp51EqyIuUiNJPyOBbpPCFydtcUEvEsykcwL
	QAWVFHowzmcqjk94xtnTud3W1XGR3bGFIpgYHVgkhIIybaTtQL6627grrAVGPwz9TFk=
X-Gm-Gg: AZuq6aJgMytNQrWtguEVPJZZfI82/l8HzfiKIySmz12mbxC0BzHxbqZ4jCgkI27Co3H
	FGRDj73hVLUUj8lu+hbPjlGHXl8ft/sAC7HbNsVwjHc/4AIvlD5cTt2EbJ05sSrszREQeFit8+q
	fCKYeposdnsEHfBYWEYKuPGohXLgP+IEKVsxbtIfH3hwLupJTiDp03fcA8Y0pWZuQ1ve3gUvnPG
	+KMwxvlBOOITVs08WO2vzbjppyolmV5u263WY6cQns5/sYJ2RO4YCZVrg7DQhg9veGd8Psv5Q8N
	+r+JDJ4AQhhQXqDTV7IbXEUP8LSgnipb6OH4KwkkiUF3XD/80HW08KdJZ1i2gJjK5OAwhcNkoeP
	qDc3Q3t2MmytvkabdzJlyR1XkI010wKeDdMQHU4Ib/dqMsT39DKNiWbaxhh4NhQicjqTBz1mnbR
	fCsWpJcivrEgcS
X-Received: by 2002:a05:6000:2c09:b0:436:42fb:153c with SMTP id ffacd0b85a97d-43642fb1705mr11442711f8f.30.1770651496419;
        Mon, 09 Feb 2026 07:38:16 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fa4csm26172323f8f.26.2026.02.09.07.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:38:15 -0800 (PST)
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
Subject: [PATCH 5/5] dma-buf: heaps: system: add an option to allocate explicitly decrypted memory
Date: Mon,  9 Feb 2026 16:38:09 +0100
Message-ID: <20260209153809.250835-6-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260209153809.250835-1-jiri@resnulli.us>
References: <20260209153809.250835-1-jiri@resnulli.us>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52428-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli-us.20230601.gappssmtp.com:dkim,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,resnulli.us:mid,ti.com:email]
X-Rspamd-Queue-Id: 21530112129
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

Add a new DMA_HEAP_FLAG_DECRYPTED heap flag to allow userspace to
allocate decrypted (shared) memory from the dma-buf system heap for
confidential computing (CoCo) VMs.

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

On non-CoCo VMs the flag is rejected with -EOPNOTSUPP to prevent
misuse by userspace that does not understand the security implications
of explicitly decrypted memory.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 drivers/dma-buf/heaps/system_heap.c | 87 +++++++++++++++++++++++++++--
 include/linux/dma-heap.h            |  1 +
 include/uapi/linux/dma-heap.h       | 12 +++-
 3 files changed, 94 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 124dca56e4d8..0f80ecb660ec 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -10,6 +10,7 @@
  *	Andrew F. Davis <afd@ti.com>
  */
 
+#include <linux/cc_platform.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-heap.h>
@@ -17,7 +18,9 @@
 #include <linux/highmem.h>
 #include <linux/mm.h>
 #include <linux/module.h>
+#include <linux/pgtable.h>
 #include <linux/scatterlist.h>
+#include <linux/set_memory.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
@@ -29,6 +32,7 @@ struct system_heap_buffer {
 	struct sg_table sg_table;
 	int vmap_cnt;
 	void *vaddr;
+	bool decrypted;
 };
 
 struct dma_heap_attachment {
@@ -36,6 +40,7 @@ struct dma_heap_attachment {
 	struct sg_table table;
 	struct list_head list;
 	bool mapped;
+	bool decrypted;
 };
 
 #define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
@@ -52,6 +57,34 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
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
@@ -90,6 +123,7 @@ static int system_heap_attach(struct dma_buf *dmabuf,
 	a->dev = attachment->dev;
 	INIT_LIST_HEAD(&a->list);
 	a->mapped = false;
+	a->decrypted = buffer->decrypted;
 
 	attachment->priv = a;
 
@@ -119,9 +153,11 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
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
 
@@ -188,8 +224,13 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
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
 
@@ -206,8 +247,7 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 		if (addr + size > vma->vm_end)
 			size = vma->vm_end - addr;
 
-		ret = remap_pfn_range(vma, addr, page_to_pfn(page),
-				size, vma->vm_page_prot);
+		ret = remap_pfn_range(vma, addr, page_to_pfn(page), size, prot);
 		if (ret)
 			return ret;
 
@@ -225,6 +265,7 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
 	struct page **pages = vmalloc(sizeof(struct page *) * npages);
 	struct page **tmp = pages;
 	struct sg_page_iter piter;
+	pgprot_t prot;
 	void *vaddr;
 
 	if (!pages)
@@ -235,7 +276,10 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
 		*tmp++ = sg_page_iter_page(&piter);
 	}
 
-	vaddr = vmap(pages, npages, VM_MAP, PAGE_KERNEL);
+	prot = PAGE_KERNEL;
+	if (buffer->decrypted)
+		prot = pgprot_decrypted(prot);
+	vaddr = vmap(pages, npages, VM_MAP, prot);
 	vfree(pages);
 
 	if (!vaddr)
@@ -296,6 +340,14 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
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
@@ -344,6 +396,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	unsigned long size_remaining = len;
 	unsigned int max_order = orders[0];
+	bool decrypted = heap_flags & DMA_HEAP_FLAG_DECRYPTED;
 	struct dma_buf *dmabuf;
 	struct sg_table *table;
 	struct scatterlist *sg;
@@ -351,6 +404,15 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	struct page *page, *tmp_page;
 	int i, ret = -ENOMEM;
 
+	if (decrypted) {
+		if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
+			return ERR_PTR(-EOPNOTSUPP);
+#ifdef CONFIG_HIGHMEM
+		/* Sanity check, should not happen. */
+		return ERR_PTR(-EINVAL);
+#endif
+	}
+
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
 	if (!buffer)
 		return ERR_PTR(-ENOMEM);
@@ -359,6 +421,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	mutex_init(&buffer->lock);
 	buffer->heap = heap;
 	buffer->len = len;
+	buffer->decrypted = decrypted;
 
 	INIT_LIST_HEAD(&pages);
 	i = 0;
@@ -393,6 +456,14 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
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
@@ -410,6 +481,13 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
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
@@ -430,6 +508,7 @@ static int __init system_heap_create(void)
 	struct dma_heap_export_info exp_info = {
 		.name = "system",
 		.ops = &system_heap_ops,
+		.valid_heap_flags = DMA_HEAP_FLAG_DECRYPTED,
 	};
 	struct dma_heap *sys_heap;
 
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 7cfb531a9281..295a7eaa19ca 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -10,6 +10,7 @@
 #define _DMA_HEAPS_H
 
 #include <linux/types.h>
+#include <uapi/linux/dma-heap.h>
 
 struct dma_heap;
 
diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
index a4cf716a49fa..6552c88e52f6 100644
--- a/include/uapi/linux/dma-heap.h
+++ b/include/uapi/linux/dma-heap.h
@@ -18,8 +18,16 @@
 /* Valid FD_FLAGS are O_CLOEXEC, O_RDONLY, O_WRONLY, O_RDWR */
 #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
 
-/* Currently no heap flags */
-#define DMA_HEAP_VALID_HEAP_FLAGS (0ULL)
+/**
+ * DMA_HEAP_FLAG_DECRYPTED - Allocate decrypted (shared) memory
+ *
+ * For confidential computing guests (AMD SEV, Intel TDX), this flag
+ * requests that the allocated memory be marked as decrypted (shared
+ * with the host).
+ */
+#define DMA_HEAP_FLAG_DECRYPTED		(1ULL << 0)
+
+#define DMA_HEAP_VALID_HEAP_FLAGS (DMA_HEAP_FLAG_DECRYPTED)
 
 /**
  * struct dma_heap_allocation_data - metadata passed from userspace for
-- 
2.51.1



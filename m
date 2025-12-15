Return-Path: <linux-media+bounces-48746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 553F5CBC90D
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 06:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33F4A300EE46
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 05:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44C631DD8A;
	Mon, 15 Dec 2025 05:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRhWlxBD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F85418C02E
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 05:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765776670; cv=none; b=tBl3FdnanuwwlVxMT28jG4NuGLzzyHH35szaZM2AHJ4y+dFrjdghKCwXGA+Y2vsqQRcZP64rIXz+QkxFDJUT/wb/tkPfqjZ6q2f2Aaq5AXBn2E2u2TkKZ1LMl2dei37rjsqtcd4smDUEconaWcDEhkbU0Y6nu10lilhaeu+jUXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765776670; c=relaxed/simple;
	bh=hvyFOzkBTCpYGInMchnhx4kBJ3GczXHnlx2IyopFapU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=c5kpM6W7eqq/3Lgx4Tq9dG1kTfGgNtEHUbGO0upMHCGM4XDuDfXCP/KyRqOS7k8hemrt3H6pJ6WTSjjCTSjYPf9CTHCRztbIOtNmM0DtYMnJxtnBssTeZe9IdWreSQ7rjhBqmbFAFTpp/wchzhjbJvNug2wHvR2B7+hPdbc2B88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRhWlxBD; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7aab7623f42so3581514b3a.2
        for <linux-media@vger.kernel.org>; Sun, 14 Dec 2025 21:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765776667; x=1766381467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uz3AkyAC19O+S8FUO5AbqCgspWmgP9i0gngDDNAJrGk=;
        b=NRhWlxBDWJjnUuz+RwMxs98gqeixWia0PIrlxnjM/TdpR5FkWBwpbvQxacCSZxhUwx
         Izh7WJWc5H6oq3VlktzFUSWynWJZA1L5kuPI2TRU+bfYru2jMa/teJsCi+OR3XNFWuPo
         geNtemtx410liO+JEGNpUCo5LeKp5ftSDiNXPRMCf/JP16dP4cZzRxL8kcoTjSENWCvr
         9iqy+qALh8MNH5Zmpn9GCkziwfDbsNXHvcAFFPcDcV6cRzUOS+arMxP0jMRyt2QjhQx9
         WtQ/e8a/vH2iuJB6UiIbwyWdRMJav4F6Wr7HcFau+T1J2Y4nEm23fUb5STCUXMqwJfy/
         VmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765776667; x=1766381467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uz3AkyAC19O+S8FUO5AbqCgspWmgP9i0gngDDNAJrGk=;
        b=J7wcCI7LMDu9q7umbVuhKhrfz2D63TjWqrJQuCDNvaV3frrKT0rhI5P5JMGAw8g4R7
         87gJfbJ17/JPM9fOj+a6SLWJeMp4xqGX4Qs/oMFTMmNhOTHNUQ1OUkPYpZq5FwYvXVv1
         cbHysqDfmagwNhBb9SHOHrZDsZc0g2CeAf+kViXSJzijTWivHQ67Ri5c/SiqUUrSKTCv
         q/ey3YvEk/zmDcRl808hu3BJMwQg+laTpkFPj4jKEMe4hxOC/W7uX0NEW9owajSJ3cxB
         +ZaN+0QOc4W9gOq63up1Nmu2thuxPkWTvOlCgfHVBceJOimnBlnmuE4WDlj38L80uOFf
         wY8g==
X-Forwarded-Encrypted: i=1; AJvYcCXr6SO6slIiky7LRQfF9r9CeMX2IPmssZ9cDMBbd50ebOYgPNvo99oiXQAA88kUJBIaGzih6X9bkXiN2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJI83wmtC7AG5qiQIKZftyO4BWoXbqceZxMETQXYICFyuH/5F
	mnvhpIfUIASxtmzAke9ZgaggFGMSTbIMkRHsHqV/C1CnY0um8ji4QNzh
X-Gm-Gg: AY/fxX6rvKfwftiYJKvnUwupdonFE9X6MJHoOo0YlHjCtqLc5t7QYQVJYzmLoEVuQlW
	W4CUNCJLKhLwemuq7XWuHiIcmwqgIrj998MDBR8P4kS6ExauICdkw4g/wKn2Ln652JcIjGz8lCk
	h9QiyyQJP3v1TaFiLjCxd/oDr400T3jvrwz7bqo183h5tz/qK+58e8kVLlp0RcvCSK5ftSQg1Kl
	Tsh/oBXmb4mailQFQmHveoGHs3KFen/di9IS8t4VndkgGFb9Ht8v5jQVJegjT/hxcapB7gQtTTR
	SbTr4vs1tHOtxLMaCNtRws6gRwXUU0gu15UU+/6fsX2jAdscHqBrbA8S2xNultuOtBCj2BLGl72
	wbe369qYY4r15PRtYvz89cHoE1xpRK9CvrXQAHxl7kydyK8NuiZ43TDYEpulJGDa5BQnNfDiXoU
	F7QAG8LZHSGX5Dox4Qq0HJ/fS55w==
X-Google-Smtp-Source: AGHT+IHNaawrkiaB8tEzN2LJvPo55x1qDp7wzj9Mb1MNnfFeFzZwkDr8l2UABw6Bq3fG7Z2E49LeWQ==
X-Received: by 2002:a05:6a00:a381:b0:7e8:4433:8fa1 with SMTP id d2e1a72fcca58-7f6694aa660mr7586764b3a.41.1765776666944;
        Sun, 14 Dec 2025 21:31:06 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c509cb51sm11409151b3a.54.2025.12.14.21.31.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Dec 2025 21:31:06 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	jstultz@google.com,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	David Hildenbrand <david@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap() whenever possible
Date: Mon, 15 Dec 2025 13:30:50 +0800
Message-Id: <20251215053050.11599-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Barry Song <v-songbaohua@oppo.com>

In many cases, the pages passed to vmap() may include high-order
pages allocated with __GFP_COMP flags. For example, the systemheap
often allocates pages in descending order: order 8, then 4, then 0.
Currently, vmap() iterates over every page individually—even pages
inside a high-order block are handled one by one.

This patch detects high-order pages and maps them as a single
contiguous block whenever possible.

An alternative would be to implement a new API, vmap_sg(), but that
change seems to be large in scope.

When vmapping a 128MB dma-buf using the systemheap, this patch
makes system_heap_do_vmap() roughly 17× faster.

W/ patch:
[   10.404769] system_heap_do_vmap took 2494000 ns
[   12.525921] system_heap_do_vmap took 2467008 ns
[   14.517348] system_heap_do_vmap took 2471008 ns
[   16.593406] system_heap_do_vmap took 2444000 ns
[   19.501341] system_heap_do_vmap took 2489008 ns

W/o patch:
[    7.413756] system_heap_do_vmap took 42626000 ns
[    9.425610] system_heap_do_vmap took 42500992 ns
[   11.810898] system_heap_do_vmap took 42215008 ns
[   14.336790] system_heap_do_vmap took 42134992 ns
[   16.373890] system_heap_do_vmap took 42750000 ns

Cc: David Hildenbrand <david@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: John Stultz <jstultz@google.com>
Cc: Maxime Ripard <mripard@kernel.org>
Tested-by: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 * diff with rfc:
 Many code refinements based on David's suggestions, thanks!
 Refine comment and changelog according to Uladzislau, thanks!
 rfc link:
 https://lore.kernel.org/linux-mm/20251122090343.81243-1-21cnbao@gmail.com/

 mm/vmalloc.c | 45 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 41dd01e8430c..8d577767a9e5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -642,6 +642,29 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static inline int get_vmap_batch_order(struct page **pages,
+		unsigned int stride, unsigned int max_steps, unsigned int idx)
+{
+	int nr_pages = 1;
+
+	/*
+	 * Currently, batching is only supported in vmap_pages_range
+	 * when page_shift == PAGE_SHIFT.
+	 */
+	if (stride != 1)
+		return 0;
+
+	nr_pages = compound_nr(pages[idx]);
+	if (nr_pages == 1)
+		return 0;
+	if (max_steps < nr_pages)
+		return 0;
+
+	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
+		return compound_order(pages[idx]);
+	return 0;
+}
+
 /*
  * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
  * flush caches.
@@ -655,23 +678,33 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
 	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
+	unsigned int stride;
 
 	WARN_ON(page_shift < PAGE_SHIFT);
 
+	/*
+	 * For vmap(), users may allocate pages from high orders down to
+	 * order 0, while always using PAGE_SHIFT as the page_shift.
+	 * We first check whether the initial page is a compound page. If so,
+	 * there may be an opportunity to batch multiple pages together.
+	 */
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
+			(page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
 		return vmap_small_pages_range_noflush(addr, end, prot, pages);
 
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
-		int err;
+	stride = 1U << (page_shift - PAGE_SHIFT);
+	for (i = 0; i < nr; ) {
+		int err, order;
 
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
+		order = get_vmap_batch_order(pages, stride, nr - i, i);
+		err = vmap_range_noflush(addr, addr + (1UL << (page_shift + order)),
 					page_to_phys(pages[i]), prot,
-					page_shift);
+					page_shift + order);
 		if (err)
 			return err;
 
-		addr += 1UL << page_shift;
+		addr += 1UL  << (page_shift + order);
+		i += 1U << (order + page_shift - PAGE_SHIFT);
 	}
 
 	return 0;
-- 
2.39.3 (Apple Git-146)



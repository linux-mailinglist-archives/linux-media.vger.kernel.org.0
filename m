Return-Path: <linux-media+bounces-47609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E1EC7CB10
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 10:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A80804E268F
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 09:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D04518FC80;
	Sat, 22 Nov 2025 09:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jitEC+Ef"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02392EBDC0
	for <linux-media@vger.kernel.org>; Sat, 22 Nov 2025 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763802237; cv=none; b=rK647M/gZss1VHChqzHYYthSgjoBnne3S8gaki3pfjTcRmIEUJXwX6OokBAVysjK0zum8dYeLktiCfqyyvMcwEKcUBreiWNQRdBsKzbVBshJmLu4xlIDjls2pSm1fHCnN1bOp4Sgx62wDZQWjDaSPVulDYQIS1IlFS8alzeXj9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763802237; c=relaxed/simple;
	bh=U/xhl13Y8Bu89uCI0yP4WX3zU48aYZVZiWrbkWM6UQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=V/fori+RcLmZlXLdHZ3f8wwGHL8k198B//wudsu7Hk93lkxfRsACf5wiCz5dKPNs01jJvxuLNlfS7goS4/H4O/CXOFBMML4gxKXTMDXncTf7cQpz8dMVUR6AzyhP8AsEsGqcPF68y8l37/rGCebbVVZd3rbQwh0sFAhxgPdDfxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jitEC+Ef; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3434700be69so4072413a91.1
        for <linux-media@vger.kernel.org>; Sat, 22 Nov 2025 01:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763802233; x=1764407033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gWSIc38wakQFkjPaEOd32h4AOI7qtYUllCcYDLleeHs=;
        b=jitEC+EfPeFm35omVyqHZ1fVO2sJxs3Spm1D50za9KMa6y6b1/Vp/ouvUAJ0gcQ/yk
         ss4yMXIwJWxRRQ7EnPtnbkTp9ea6MYMA/19uZ7r0NlfRyfa4jS1DHGjsW7rKRjAeUcAy
         f/brj0I+odTdxchK8EdZf75j2tfcRfoIJXC85+zJy+vxqVWjQ9lZKRm4wOmYERQgwmaa
         8VZ58/buNWg0kVWGurTty6CcRpoSD30LDmIY5ow5aEDM1vyTd82Dmj9A0Qy9+DlwreNI
         LB4Q110UTDLvssz32Y4zUVVPxiWfqb39MKN1KUD+v5pys4fOwTt3jvjA2awOEFpxOgAA
         OciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763802233; x=1764407033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWSIc38wakQFkjPaEOd32h4AOI7qtYUllCcYDLleeHs=;
        b=Eg56sK4DK6EvMv3V6OzZlrqNfTVRgUvxgb2nnn2Fkv6a6Pm2bXvxygk2qsXF+ZAr7G
         0w0x+tqLBCfItishX81izq4QcKnhxkXf7Ivp9poKwnQA84e/9z9waJrcFDcQs7jCEzDi
         +ym9rw1CGo9jFKlscak3IX3pr6xfZsZb6LOSvLjjPcklaKzEDzwnwnJNZ54yzlB2yC/E
         heBNOoEGKI3o++tscjTSLRUt4l8fGntaZhvWjmJRagWz1dxlrrj7olXwsJ65OpLaRRMc
         3mmcqdDTUewvAbLeJF1A2SjviKhFG9o0b8jugphI+S8ZSzY8n9IutjG9TwoAPGtV1Quc
         5pPA==
X-Gm-Message-State: AOJu0YzT2geAPRnwRGYh+8u8yeJ5aUwsUE3WFbukQNcFKAqKX4v7KRy9
	jtcPmCQMqjxEUTJopSTAaWwdM6bghxHVrJE/hRccD0ArLIhfWRMy0Lvx
X-Gm-Gg: ASbGncvKdjC/fP0PV5iOdzaMNmQuRkpx8kZzjwjvyYfu3Z9EF8JB2KuJzRz8LGpYAoq
	HVwkQIcuMjrni/9XGtus14Kr6NrhXqTKtyNcGYKBcAzIE20tYmQoae9iZpmgsek2jW9vKZ5cmPN
	nNCEXkVD3QHeeWgghHLurq0KfpN0vI0k6Oww044QSXIGvls/l5b6ERIbiDvYvCllRYEXHMAu84f
	9huhj1z/n2NeAlT4yNayL8Dp3xQP3jcSGK0sQkSLGj/B7mOcMnRQJLlSPuepgAnyXbmul2AGkRD
	fQ6jxmPfR8dmp+eMn+n9zKAu5Edn6Ka5G0vAhtgX8T55SIINHBb1WnqUQz6YkhbzmFg7WAjTZCV
	UmPUcX8kXuf/i+RGl27mMQ6rxL1Rxmj2y3OcjEb5hAf6WIxFQx4Mdx02fvT9HqJjNhiyNccUTa5
	JFcdtvJqBRTuhTiBqILpL/Yc0i
X-Google-Smtp-Source: AGHT+IFEXYWimQk4DcIAFQyt9lEPKtWhsqJCLh0YYLXBxKfxO64RbGZR0X6+cGmFQNdZPcXXMZdWtg==
X-Received: by 2002:a17:90b:540b:b0:33f:ebc2:634 with SMTP id 98e67ed59e1d1-34733e78ea2mr5873399a91.9.1763802232568;
        Sat, 22 Nov 2025 01:03:52 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692e5c8sm7842401a91.11.2025.11.22.01.03.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Nov 2025 01:03:52 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	John Stultz <jstultz@google.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever possible
Date: Sat, 22 Nov 2025 17:03:43 +0800
Message-Id: <20251122090343.81243-1-21cnbao@gmail.com>
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

In many cases, the pages passed to vmap() may include
high-order pages—for example, the systemheap often allocates
pages in descending order: order 8, then 4, then 0. Currently,
vmap() iterates over every page individually—even the pages
inside a high-order block are handled one by one. This patch
detects high-order pages and maps them as a single contiguous
block whenever possible.

Another possibility is to implement a new API, vmap_sg().
However, that change seems to be quite large in scope.

When vmapping a 128MB dma-buf using the systemheap,
this RFC appears to make system_heap_do_vmap() 16× faster:

W/ patch:
[   51.363682] system_heap_do_vmap took 2474000 ns
[   53.307044] system_heap_do_vmap took 2469008 ns
[   55.061985] system_heap_do_vmap took 2519008 ns
[   56.653810] system_heap_do_vmap took 2674000 ns

W/o patch:
[    8.260880] system_heap_do_vmap took 39490000 ns
[   32.513292] system_heap_do_vmap took 38784000 ns
[   82.673374] system_heap_do_vmap took 40711008 ns
[   84.579062] system_heap_do_vmap took 40236000 ns

Cc: Uladzislau Rezki <urezki@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: John Stultz <jstultz@google.com>
Cc: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/vmalloc.c | 49 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 0832f944544c..af2e3e8c052a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -642,6 +642,34 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static inline int get_vmap_batch_order(struct page **pages,
+		unsigned int stride,
+		int max_steps,
+		unsigned int idx)
+{
+	/*
+	 * Currently, batching is only supported in vmap_pages_range
+	 * when page_shift == PAGE_SHIFT.
+	 */
+	if (stride != 1)
+		return 0;
+
+	struct page *base = pages[idx];
+	if (!PageHead(base))
+		return 0;
+
+	int order = compound_order(base);
+	int nr_pages = 1 << order;
+
+	if (max_steps < nr_pages)
+		return 0;
+
+	for (int i = 0; i < nr_pages; i++)
+		if (pages[idx + i] != base + i)
+			return 0;
+	return order;
+}
+
 /*
  * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
  * flush caches.
@@ -655,23 +683,32 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
 	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
+	unsigned int stride;
 
 	WARN_ON(page_shift < PAGE_SHIFT);
 
+	/*
+	 * Some users may allocate pages from high-order down to order 0.
+	 * We roughly check if the first page is a compound page. If so,
+	 * there is a chance to batch multiple pages together.
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



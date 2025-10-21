Return-Path: <linux-media+bounces-45102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DA3BF4961
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 06:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CA673B7BD5
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 04:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BCA24A047;
	Tue, 21 Oct 2025 04:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNrO+JFQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C578123BCE4
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 04:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761020450; cv=none; b=SQELAZKG5O/bjs7mzLijgOp0Kx8UoLz4uVnJ6r+tEUNg2/5aXbyM1Fdtg8cAjSgkKjkHfOLeIz/G/gQLb3zWUJsSaDdCLVIgTEZFoafLcxTH3PUzNyC4s+p2vVBLPBLq2Q5ZXIzS9PcLyvEZYODu+0P69D6HC9teholOlLJZbOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761020450; c=relaxed/simple;
	bh=54IdDzBB1F8JHTZwkrbY0+nkyH6X9WaOpkcrR10tcBY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qbZ9azjgm6IcwIUNj3I5fTeo7M6aImYLEoRCxFPAsVBy4AynNQFEGyAM3TnBGC0T0/SSOcfQVzawq7lJXoxf4Gk7+YD7CBZW9QVK9bXgomq4VPJchUIf62RdBDg1exF//H3SoU/gT1i6v5rix7jxN3nt6i5QCv/QzfwmfY78W9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNrO+JFQ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b5f2c1a7e48so3214966a12.0
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 21:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761020447; x=1761625247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SRLdP4GmC8TAaehpYwLWmY0fXaXzRogSZM1ApFlMens=;
        b=aNrO+JFQJwug/LAS2SNfun1J0Oo0tsKhiEwpr+O2q/EBir7fDU95d6XxUiGFMDFKpd
         JlOeEWFYBfHtjDCp/vNaXAVgV8m8E9iJUrU382p2A19e98/SpIVZHusN/TT5m3qmmc7p
         yoPnq6V6yZr0aWQi4B/st3B4nRlmIVrIdo5uEp1mdZB0+b5pBDdzffOoM3/gvje9btHV
         snjMvoM0vYUZ6r2dK9GUyZk0zYGwFvaeWCYuDLBxoi726pfK7r0ZAsohijVKdhGhQtDM
         xTrTY5Wf8Fb94VThqLOYgNZkI4atjQfnv+Qc63bkexzNUHxVkkQ+wyKbSMD/SNCC2MOZ
         ethA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761020447; x=1761625247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRLdP4GmC8TAaehpYwLWmY0fXaXzRogSZM1ApFlMens=;
        b=KrLFYR2GTHaUEGp6guYSkDCQCCLyBPu5yjOg9hCZZ+mO03OrdOvu/r/iTZ+JC8X4XX
         ZXgje+MofMf+PyYH1Pey68s6KiaH7AI5EkTBN9/AOLFcwWnelNeH6JpRL/kOlygqibe4
         A0d84jRvKM3oqWbn+JjX1zCEshLuFV0tuwz+oOtM4MykCM35RltJr9smJF1Hqd4nwy73
         fWTo0rGx+KQ9sgpF03rG9Xer5lwCPPJ9KeHJSHAvtaxn/6tN/RTvCGWgJV2PXkFoST3R
         n47gB7QDBkKeJ8lWDY3iwP6HoLKjRM8Q2L75X0dUDHGgz7SX9Ux6i6KYfTwGqTsq6zXO
         f3fg==
X-Forwarded-Encrypted: i=1; AJvYcCX3Xxy1Oc+JiQ8GUhEiFQ617WTNimvLGE5r+q50dKJikFQrtDefGOftgnIsVxAnJ0QAeA8NYUk72Ha6CQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWljX4h2dDQDblK9uGXFuOVKByS3xxCPcJNawO2khbogZ3Ds74
	O5fQUhCHCFI+0JYY2rwC5ZlLX2itTynqupGAY0Zcxa877gFldXMqU3aL
X-Gm-Gg: ASbGncuCVxX+rwzzxe7boTYDSKarWhJXUtioUA7jNsvTx4CWErE1vejRtqZxIGUnCQ9
	vzvjwBbipejBejgJRbz76utzog8Go4GHqksgYju+fXMHiwLHJ1mn4/7/xhZIqmzigi6BSZVU/Jk
	QWzwI764ToFN9q3Gy1B/sgWiKxwiH4ScYiZ0ndLLJBq89UHwbeQghIwZQT4IvVzm/0cWE1YlDfd
	F8T1oD1ziHNt+6dC5VR4GSM4XwT2nlJNcQM+9Se0j6IFgIHH80AkfKHBQ4HJO6FKkrhwUw5MUEn
	AstJabx0TCd/rhv7s5Vn8pnnBtqTYVYXGuwmTNkmCS0tc0Gt6QS47BB8b5rBuIQLM5bDMYeVI94
	k8WOz35Fv+mP6CJyEZHDsnDDrpIvBx8uRTPgx8cqTnRqvWCg6Cun/iiKp46QziBZw2+HOFJdl1G
	x250Ojl+TqNNHMx8JV0Q6QXLGFfea2VE69DbQC4M2eyDQ=
X-Google-Smtp-Source: AGHT+IGuMYHt7WIQD1fK0EiihxrlnrbJ5cDcN1SmyPvVx87IncetjCE6sVwVUYILV4vleroj1LiXDQ==
X-Received: by 2002:a17:902:ce12:b0:27e:ec72:f62 with SMTP id d9443c01a7336-290c9c89b06mr180684945ad.6.1761020446906;
        Mon, 20 Oct 2025 21:20:46 -0700 (PDT)
Received: from Barrys-MBP.hub ([47.72.128.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fde15sm96162725ad.84.2025.10.20.21.20.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 20 Oct 2025 21:20:46 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	sumit.semwal@linaro.org
Cc: 21cnbao@gmail.com,
	Brian.Starkey@arm.com,
	benjamin.gaignard@collabora.com,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	jstultz@google.com,
	tjmercier@google.com,
	v-songbaohua@oppo.com,
	zhengtangquan@oppo.com
Subject: [PATCH v2] dma-buf: system_heap: use larger contiguous mappings instead of per-page mmap
Date: Tue, 21 Oct 2025 17:20:22 +1300
Message-Id: <20251021042022.47919-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Barry Song <v-songbaohua@oppo.com>

We can allocate high-order pages, but mapping them one by
one is inefficient. This patch changes the code to map
as large a chunk as possible. The code looks somewhat
complicated mainly because supporting mmap with a
non-zero offset is a bit tricky.

Using the micro-benchmark below, we see that mmap becomes
3.5X faster:

  #include <stdio.h>
  #include <fcntl.h>
  #include <linux/dma-heap.h>
  #include <sys/ioctl.h>
  #include <sys/mman.h>
  #include <time.h>
  #include <unistd.h>
  #include <stdlib.h>

  #define SIZE   (512UL * 1024 * 1024)
  #define PAGE   4096
  #define STRIDE (PAGE/sizeof(int))
  #define PAGES  (SIZE/PAGE)

  int main(void) {
      int heap = open("/dev/dma_heap/system", O_RDONLY);
      struct dma_heap_allocation_data d =
            { .len = SIZE, .fd_flags = O_RDWR|O_CLOEXEC };
      ioctl(heap, DMA_HEAP_IOCTL_ALLOC, &d);

      struct timespec t0, t1;
      clock_gettime(CLOCK_MONOTONIC, &t0);
      int *p = mmap(NULL, SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, d.fd, 0);
      clock_gettime(CLOCK_MONOTONIC, &t1);

      for (int i = 0; i < PAGES; i++) p[i*STRIDE] = i;
      for (int i = 0; i < PAGES; i++)
          if (p[i*STRIDE] != i) {
              fprintf(stderr, "mismatch at page %d\n", i);
              exit(1);
          }

      long ns = (t1.tv_sec-t0.tv_sec)*1000000000L +
                (t1.tv_nsec-t0.tv_nsec);
      printf("mmap 512MB took %.3f us, verify OK\n", ns/1000.0);
      return 0;
  }

W/ patch:

~ # ./a.out
mmap 512MB took 200266.000 us, verify OK
~ # ./a.out
mmap 512MB took 198151.000 us, verify OK
~ # ./a.out
mmap 512MB took 197069.000 us, verify OK
~ # ./a.out
mmap 512MB took 196781.000 us, verify OK
~ # ./a.out
mmap 512MB took 198102.000 us, verify OK
~ # ./a.out
mmap 512MB took 195552.000 us, verify OK

W/o patch:

~ # ./a.out
mmap 512MB took 6987470.000 us, verify OK
~ # ./a.out
mmap 512MB took 6970739.000 us, verify OK
~ # ./a.out
mmap 512MB took 6984383.000 us, verify OK
~ # ./a.out
mmap 512MB took 6971311.000 us, verify OK
~ # ./a.out
mmap 512MB took 6991680.000 us, verify OK

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
Acked-by: John Stultz <jstultz@google.com>
---
 -v2: collect John's ack. thanks!

 drivers/dma-buf/heaps/system_heap.c | 33 +++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index bbe7881f1360..4c782fe33fd4 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -186,20 +186,35 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	struct system_heap_buffer *buffer = dmabuf->priv;
 	struct sg_table *table = &buffer->sg_table;
 	unsigned long addr = vma->vm_start;
-	struct sg_page_iter piter;
-	int ret;
+	unsigned long pgoff = vma->vm_pgoff;
+	struct scatterlist *sg;
+	int i, ret;
+
+	for_each_sgtable_sg(table, sg, i) {
+		unsigned long n = sg->length >> PAGE_SHIFT;
 
-	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
-		struct page *page = sg_page_iter_page(&piter);
+		if (pgoff < n)
+			break;
+		pgoff -= n;
+	}
+
+	for (; sg && addr < vma->vm_end; sg = sg_next(sg)) {
+		unsigned long n = (sg->length >> PAGE_SHIFT) - pgoff;
+		struct page *page = sg_page(sg) + pgoff;
+		unsigned long size = n << PAGE_SHIFT;
+
+		if (addr + size > vma->vm_end)
+			size = vma->vm_end - addr;
 
-		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
-				      vma->vm_page_prot);
+		ret = remap_pfn_range(vma, addr, page_to_pfn(page),
+				size, vma->vm_page_prot);
 		if (ret)
 			return ret;
-		addr += PAGE_SIZE;
-		if (addr >= vma->vm_end)
-			return 0;
+
+		addr += size;
+		pgoff = 0;
 	}
+
 	return 0;
 }
 
-- 
2.39.3 (Apple Git-146)



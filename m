Return-Path: <linux-media+bounces-41379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A7CB3D043
	for <lists+linux-media@lfdr.de>; Sun, 31 Aug 2025 01:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED85A1787CC
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 23:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FE3263F43;
	Sat, 30 Aug 2025 23:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMbqwbnZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535551A9F87;
	Sat, 30 Aug 2025 23:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756598331; cv=none; b=hBmY74agt7g5vy47wJuKp6lQKBhhaoYsHj+k3uM8W0uS30CjIA9xrVQMMKCerCXdRk6akyjfmk4YVtW/BtTM2c/MkL/vllFGv3L50i1ajkPJ2YEzgJqW+0Do+g4uayy+rx3IPgMBT+tWSMJA+Za39AG3rggxpHFSugPHjQJUCEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756598331; c=relaxed/simple;
	bh=9/fwU/M1kM9mLSB2srs+ZcFYYBACpWPplFSQUL6Ryzo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=grEcfl2Y/3dDUchmgADsOS1zIp5faDBWo9XEOfq8odKmGwbPuBckkUVej1H/Oh7UsAwcQqHxsuK59kdjAKsMXLJJq3+ghFPje6L8vZxIPXPn2+KYsT26qIFM33P0BWdaATHIAWuX0OndRnwpj6iDqq3rTZCpjY32K7PQukXZVps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMbqwbnZ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b4c29d2ea05so3020233a12.0;
        Sat, 30 Aug 2025 16:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756598328; x=1757203128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PveN7MRoWDfCIrihbZGiJf7FxtVFx+3ubpFWOv24Cwk=;
        b=VMbqwbnZViuLTU4yeRv1LoQLasB4bLr8barO2mfXVLivyFeaXLF85G5eVaNuvIeAI9
         fn7QsH9gPjVb90t3L2VWd6Nu0dDvXN9TuTMCb9XxA54WWXeBEiRvuKpnUjFWTseGT7M3
         GHTLGBKV/dRQ34LrqJEjLmDWocWe490DavIa+NAy+eatUvbZpWMnUQeLR+sl/HBagvor
         aOUAmliiqMmrqoWhcBZm0q2m1VA5PEfgYR+WpYU0qMaHKEJP8TLQs2SHeddlE2BEfNs8
         8z/7qiftOLZt52LMV2FsethjasJokO93Qjq5MBqszgG4DvpCUV8cASchhWXYzkTsTns/
         lHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756598328; x=1757203128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PveN7MRoWDfCIrihbZGiJf7FxtVFx+3ubpFWOv24Cwk=;
        b=UNsi/OO3fsvTdMEVnsdpq/nUTsavAMs6R2FSh4xfXXH+AwqXABLX+93ZQ7629i/WFC
         bbaHFH1dclMh/ulmivpPMACoEyBM3Ub2XPLJc/A8K5si8j6tiN4xA7rUEhTDmgq1OZPh
         xIthW6P/RSUBu1ZACiHRovUNv/+SnMaGALerlfopt8AGHK9bH8+l0w/FZ98lqFZq2f2c
         PuHUqaNEFlreFBg43T6dwIWoc9L4ouzVdpND3JG3o6XuA0Z366XmkPrwEMRw4T1KyRVH
         NpNN4smGOsj5dBFun2mtzK5KiE4702vKaPR4CAu1MdL27Q2jj0W7as4ry0kxjT0nkC87
         sgXw==
X-Forwarded-Encrypted: i=1; AJvYcCWPrhRkCszVuPK/6zw3W1cA9mSqrEOauxONSolsRsfkoRdoXizKwC/GOy/mgnYP00hmmTTsM7EKCKXBROo=@vger.kernel.org, AJvYcCXbFatTeYfoBPzVGDQ2svuGcesy3BprMhQXfl+hcT87ztHkDI+xdCG+O+BWBiHLfhieBGrB2eJoXtPhYkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyswKkCY+rVqDxIect89fBaRhhYxI3OeIrZLp98mPmij5c1We24
	8pFDlwr6VQC5kPvFLTwK7Suo35BUysB0xNVR3ICTUqAI6jKNkC1DiqXb
X-Gm-Gg: ASbGnctUZ/PMmTe8aQGtkPsbDPoPG1cqPw4JJaSmEDKy+rJyk4u1kgHpgf3JV7piX5i
	cNR3baGqvyXWhsdWfEgkc1ztYzBvq2r6KoZxQllNv1Y8gCWjw+RGz+O8f/6NmoWaAtyNdbA9G9k
	EDMSFkR/kaOYEQAstrYGaPRPVqfyrcNTpGz3QnI9O/LJBo0vInuOl8QY1FH8NqMwhA6SGHb9zog
	gg8o3DF3/HXLJW6PaAalJ8zXjznY9vppA4c8MxH/PypI/UV5Ur8biHWVPiyekdh04BHJyvWYIS7
	2U2XkRE6/AgdKPb793u/95zYdXMF3gA/3HIeLe1m46dPYXmonuFCLGOeyTR/EvmgrzYAAuwNcyz
	sZJbDx7Xy1IETW12j8tZvcw11nZaHrT5v1h7e7A==
X-Google-Smtp-Source: AGHT+IHINaZd/OyqfQwD/ES7Eu7hfLJbxybfyzvV1FKp2OpH/dlzkxedX09+klQq8xVKQb/pnGM99g==
X-Received: by 2002:a17:902:e5cf:b0:248:fbba:964b with SMTP id d9443c01a7336-2493ee5428amr53871855ad.12.1756598328515;
        Sat, 30 Aug 2025 16:58:48 -0700 (PDT)
Received: from Barrys-MBP.hub ([47.72.128.212])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28ae414sm5618654a12.33.2025.08.30.16.58.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 30 Aug 2025 16:58:48 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	zhengtangquan@oppo.com,
	Barry Song <v-songbaohua@oppo.com>
Subject: [PATCH] dma-buf: system_heap: use larger contiguous mappings instead of per-page mmap
Date: Sun, 31 Aug 2025 07:58:38 +0800
Message-Id: <20250830235838.58067-1-21cnbao@gmail.com>
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
      struct dma_heap_allocation_data d = { .len = SIZE, .fd_flags = O_RDWR|O_CLOEXEC };
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

      long ns = (t1.tv_sec-t0.tv_sec)*1000000000L + (t1.tv_nsec-t0.tv_nsec);
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
---
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



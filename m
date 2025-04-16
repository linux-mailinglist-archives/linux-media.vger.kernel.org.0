Return-Path: <linux-media+bounces-30288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4A6A8AF12
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 06:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 423BD3BF5CF
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 04:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BC4229B0F;
	Wed, 16 Apr 2025 04:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D2XVE3e7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BEC4A1A
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 04:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744778112; cv=none; b=mKRSEXw/PSpY7K3fwAb5y91/0y8DWe7OB4xDWwGSo/e8se4wqXpgzh+/Jrn/3CV8CI29RerO1jYwoZ3N23U+JjEMRkyvsqCDJvY9snG4ab08Bbsm4J5u+8zd/i7pjvDsAW3FVxF0TrWXJl3By8AIhL5MUDgdphiyqcJtBbvAUog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744778112; c=relaxed/simple;
	bh=8CsF+IkoXaFNBlPgPOug1CHa+VnlOdgwWlLXBEhp+Vg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=b4wbuEI5sfuDbWogyAIE9xCrRZsB5YrTUzdnTY6NwjcPvW1YCAi4lgQDWNjS6GmFtdUnVkieNX4QHMKs0rhe1qDGxcdALX0an3SbgbR7780UnAvDg3kYCZ4ZrRZPjUoe+fqhagAp4AVlBoS7doWdpiKn8B4FcQftAJmCeFpegKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D2XVE3e7; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff78dd28ecso7493073a91.1
        for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 21:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744778110; x=1745382910; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NoVEwqwHV5q1ddAJeoGC7UZs2nQ52KxL1yB5sSPTYVI=;
        b=D2XVE3e7NUp8dsHRMe5qCh57zLXHwq4Cygaws06C9dD2MZhCh+WlFj0LSAPq6ONBDC
         qAkTvSmUzK0K8wa3CU3FDE0Vu0CyE1UnNPNL6G0jnfBmZxoPNQDbvbOo208Pt1XQu/Xv
         tdaPq/KjkXhl5PcbjtsbE2QT5M2CB5oB5iFnKITjiNKoCZjC9A4HpX7eFISNj0+hHSjU
         ohWKpebZslofHrRU9+Azoeeqfy/uZ3OfVtdSNguT4/F3wevxyx4zA2hfs/gXOtyTXxva
         DSuiaYqNZ3Xi1PKVJrChdVry+32jOQZNnW9Cxt/X/KIZS4tXLjn5Hxfyv21ncUEN0qRx
         lJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744778110; x=1745382910;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NoVEwqwHV5q1ddAJeoGC7UZs2nQ52KxL1yB5sSPTYVI=;
        b=oCgTJzmXzXhjX3oO2lZwNRhhGl5QXYfMsgYfqxuMb6+cxs/H7kWO93CnYIzaxfHSvX
         rZcJBT/GryGujPhDHNJr0hG7v4veLMgUktV4gg9DarjTrlXys1eqWvkolB2pjlXQEfjn
         q4pUkW1IWWD7dBWSAUCIjBIjRUFn9vfLzC8nt2YBT5EYdBHzS879ZHLkodAu6LnTTA+j
         uXc+2BZoeJjtjnPp8YqdYoDLhJPW3w4FxOiiworOf99cENzYcfr88JK8kRapoRuwARx8
         BxbQgwU5YRjeNh38PwMFyNexHrXtpY8UKBhZkzFKC0ug8mpEvwgNM2YJlbWL5/GgVoGI
         Z7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqdAmv7FjGA614C0pPSztV/PmEgckpvgpilLGMHYPocG4NWYQshmdO6XcA7fN7g5HI81MOuqqZRpOFxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAJ0PQ2CoUIpT420ua4wXJ5FMFJ2kqIGlAIq5l+FoiuTduXdG1
	LhVqnNwH/IyF2cDMgj7xU/7ZN4W6RHZvW/yTPHnpllxBHT/nK9Afcv2j48J2TLmM+K84Zhn3VAX
	M77UL+Q==
X-Google-Smtp-Source: AGHT+IG2G4ywQjj332C/QbLj2/w1uiBgiH97/ajraV5DPfnUNzqGgNveWJxxAqmA9rtK2oDi4bz8OSxgEbBN
X-Received: from pjci2.prod.google.com ([2002:a17:90a:3d82:b0:308:64af:7bb9])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c2:b0:2ff:6af3:b5fa
 with SMTP id 98e67ed59e1d1-3086415dde8mr408227a91.22.1744778110480; Tue, 15
 Apr 2025 21:35:10 -0700 (PDT)
Date: Tue, 15 Apr 2025 21:34:10 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416043412.956-1-jyescas@google.com>
Subject: [PATCH v2] dma-buf: system_heap: Set allocation orders for larger
 page sizes
From: Juan Yescas <jyescas@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Cc: jyescas@google.com, baohua@kernel.org, dmitry.osipenko@collabora.com, 
	jaewon31.kim@samsung.com, Guangming.Cao@mediatek.com, surenb@google.com, 
	kaleshsingh@google.com
Content-Type: text/plain; charset="UTF-8"

This change sets the allocation orders for the different page sizes
(4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
for large page sizes were calculated incorrectly, this caused system
heap to allocate from 2% to 4% more memory on 16KiB page size kernels.

This change was tested on 4k/16k page size kernels.

Signed-off-by: Juan Yescas <jyescas@google.com>
Acked-by: John Stultz <jstultz@google.com>
Reviewed-by: T.J. Mercier <tjmercier@google.com>
---

Changes in v2:
  - Add John's Acked-by tag.
  - Add TJ's Reviewed-by tag
  - Use dma-buf: system_heap: in the subject since this is specific to the
    system heap, as per TJ.
  - Remove extra space in if statement.


 drivers/dma-buf/heaps/system_heap.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea16..ffc8f488eca6 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -50,8 +50,15 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
  * to match with the sizes often found in IOMMUs. Using order 4 pages instead
  * of order 0 pages can significantly improve the performance of many IOMMUs
  * by reducing TLB pressure and time spent updating page tables.
+ *
+ * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The possible
+ * page sizes for ARM devices could be 4K, 16K and 64K.
  */
-static const unsigned int orders[] = {8, 4, 0};
+#define ORDER_1M (20 - PAGE_SHIFT)
+#define ORDER_64K (16 - PAGE_SHIFT)
+#define ORDER_FOR_PAGE_SIZE (0)
+static const unsigned int orders[] = {ORDER_1M, ORDER_64K, ORDER_FOR_PAGE_SIZE};
+
 #define NUM_ORDERS ARRAY_SIZE(orders)
 
 static struct sg_table *dup_sg_table(struct sg_table *table)
@@ -318,7 +325,7 @@ static struct page *alloc_largest_available(unsigned long size,
 	int i;
 
 	for (i = 0; i < NUM_ORDERS; i++) {
-		if (size <  (PAGE_SIZE << orders[i]))
+		if (size < (PAGE_SIZE << orders[i]))
 			continue;
 		if (max_order < orders[i])
 			continue;
-- 
2.49.0.604.gff1f9ca942-goog



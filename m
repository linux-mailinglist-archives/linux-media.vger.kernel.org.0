Return-Path: <linux-media+bounces-30272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4B7A8A536
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 19:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 276501901DB0
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 17:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C195C21C9E9;
	Tue, 15 Apr 2025 17:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wFiFHoyO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DC71422AB
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 17:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737655; cv=none; b=stI9RKD5JhID9CYzfYAOUwKIcYZlVDaEYszUnP5Q2GoFEgLMJcJyP+9s7uBCIryvpisQhwqrGy6Uz+qkzt9BYPylnsD8PzW8WRlG8qylxpci/+7tXvUQQLAbgqccrZkDeJG7m3sO/K9HakCHVJlweGO+kiwELz2PLNdxd6Muvag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737655; c=relaxed/simple;
	bh=/IJKFtHh06K+r6fw9+YnmvZdUdj2qCNjcOk8l8INVIQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EegZYT4P5g1FRmSHYQSWfgO6fgV+bfGChQPUqjY5oeHEIvBhqUOyqVFjpX0u7IoHHELd5a04dcpnRwXldUcMZM0vxBfTk04IgtE+D703niwTKTlyyjsdSJAWgJJkbr9u0wSNVv2ZIEphOr7RqtZCk6IINkVWb4ex9B+XGmeOq2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wFiFHoyO; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-73bfc657aefso1815095b3a.1
        for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 10:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744737653; x=1745342453; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZZKTzytUJ5gvm1rD+Ux7dnbHm6H7yF/Qpc+vR+tifvc=;
        b=wFiFHoyONavQQMToHC1E4DwlCsuPNLvHmGUWEH+zVeVDAycz0PUwvCe3nAAi2PgUdZ
         7bFqqzJLQwcsKtyOMZr2sVmLcmJxzpjO62HaO0dlttfHnelUwqCh3XmBIqszxgKxZdyf
         XHu1hUsWjuZ1FO21xSBNi2ii88P9uKGqTwiyprQlYsA2IUG2vEo+ZS7VqOA0awC8l8yb
         G4QmJyj6Y8WPP/i17EI/r6dsxAk3jjQQZlYOj+oRl6JpQd9ma3cOhVPLfokpplQFvBSt
         qMpiV0wGFbkrl9Is0nMD9tDSzMXG9/OMbXJ2BCIOsEMJf5oHQCWf5j1+nRosJbDmLwPA
         tUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737653; x=1745342453;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZZKTzytUJ5gvm1rD+Ux7dnbHm6H7yF/Qpc+vR+tifvc=;
        b=dC7gAmMGFmJqNBd9ZabIpDWjQSJ2jBSi/mSeZvV6GQH+/9rAy3t8uql+25mqJTipjf
         mBCsEZBekn4LVTZhUP8QHI76KXn/sOJ247z35KipKbj9GqO39c/f/2k1h1KNRPdxow/G
         g9BOME6mnP6nPavCKaEHrym5+upEFylABhz+k5Os/+V9s+Ub0bPyAsoMd82H0yWjSJH6
         yaDTmIAT84SihZ/7OgFMAPmApe6vt7birTaua37d+V2LQGbXXphOmXkXMImGUAEXQBi1
         Qk7NXHW9sdXh4SUNb8jP8jdkWxRb4cntHuJ29KotJYkAYNPGDQ/Tzg5lgmVSHYJ34//5
         mLrg==
X-Forwarded-Encrypted: i=1; AJvYcCWetvrFEKxm4OJZKYYheHoXoqNCyAxxBs+5FPXqYPQX3HG4lY302wT/nFrw6Yhkf/9HAgcqTVYWQPux0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5W3ZvT4P6Z6QnXye3QEnc1wY6Y04LsHgogjYR35G3AY+XO6T/
	m1bGJcjTP67Aumd3RGRQ1mvYolxCmLL9zVG7bsuoYcnSGoh97aBHSjOvNI+Qwa3F5gharUVeO6/
	CEVZIlA==
X-Google-Smtp-Source: AGHT+IEtqmOWyc2b0VefNP8+RxTxYVwyvsPccMVCWFhQFWDyZ1nHgtQ/5h+wSOOn5ob1foG8cOMdK2s8JDAm
X-Received: from pfbga15.prod.google.com ([2002:a05:6a00:620f:b0:732:2279:bc82])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:9308:0:b0:736:34ca:dee2
 with SMTP id d2e1a72fcca58-73c1f8c6b5emr422992b3a.4.1744737653056; Tue, 15
 Apr 2025 10:20:53 -0700 (PDT)
Date: Tue, 15 Apr 2025 10:19:53 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250415171954.3970818-1-jyescas@google.com>
Subject: [PATCH] dma-buf: heaps: Set allocation orders for larger page sizes
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
---
 drivers/dma-buf/heaps/system_heap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea16..54674c02dcb4 100644
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
-- 
2.49.0.604.gff1f9ca942-goog



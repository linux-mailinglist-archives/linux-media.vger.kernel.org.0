Return-Path: <linux-media+bounces-33205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32743AC14AA
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 21:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6775F189446B
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517292BE7B3;
	Thu, 22 May 2025 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fYEBNEeM"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC592BE7A8
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 19:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747941309; cv=none; b=g8rIyOTY0eBydCKHCyb8Qm+FzKnGIOKufh6TwtXDl9132qwdF2gJ9yVVHGrzfV/iPxiASe22CXpr6Sddif8YVAnOyTStpw2Q+yvEao79cJLkRcm31fQRmBXdFHxgojzdg/wHd8FTEAivjRS9FOcpBGiXlenWaLw7N/PqI8edFeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747941309; c=relaxed/simple;
	bh=fwAp6zae0IltZYma+nR+3onsEyeevpiXP5hiVsfvTKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yf3xsvmcHT+kxtatL1hZcGXEqj4/FgZ4IMTJsv6y4eGO+0iPNik1/cp5WyW8EzlO/4TPQd+zEVqLMQ8UEznLywSqsAiFEOkhPXLk08jNM/nP+1k0XFH9AqDyVEaMAV2TFQZ/vYKD5kC4u4YM6Klfg7PF+wGaNyGNO8MwybQUN8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fYEBNEeM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747941306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z6N8riCiMdEu0kVFdl/5VBbDqLppN8ZtAWlw8HDr1aA=;
	b=fYEBNEeMy0ZgEoAb0fIZzx9AdwPwWo/1Czub51c/ss7I5tOrXgP5+4M0Qjv6zJmhG+TWKJ
	5yoHNV4JYct23IY/Y2sdLhaDZY6g9Pg2i7fTI7Ur+wX7fiDbnhNdgoylZPJnnzze9ZqG1V
	3aQkWsac6tm9QkNUJdqFiZeLugNhtAo=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-w6ph-t67OcCmo1RKVsiUWA-1; Thu, 22 May 2025 15:15:05 -0400
X-MC-Unique: w6ph-t67OcCmo1RKVsiUWA-1
X-Mimecast-MFC-AGG-ID: w6ph-t67OcCmo1RKVsiUWA_1747941305
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4e07a379857so5881290137.2
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 12:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747941303; x=1748546103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6N8riCiMdEu0kVFdl/5VBbDqLppN8ZtAWlw8HDr1aA=;
        b=WuQ/pVEW0Yn8L3WpH7cSz31aca92trXWCAgux3ppL75qWZY92rzFCEvaE9Im5I6l9G
         Bl93D58kXGEThFDXGuT8ODxHlXu1H6LBGaL0kmLmR0ZAd4gfjUw86BlMMP2t2jfLVPRD
         i7pmbAS5mS4B0pEF8qtyquJbUm/S3cvXguaxfJY6LCxNRciOfe750PGwIjWU8Zq8u1S5
         Kg1tixxQ5KYphFzRYfcZxQjIc2hhkr64kFoX+QlDPzG1vDFNCTIw4DoLv9TEHkp3xC5k
         jKApWXcWoYiOl0Q7tXNEveLep2gSyzBacH/8BHO94z1jm1eUguEglPK8Zylo/+Y+ZHUf
         Y4vA==
X-Forwarded-Encrypted: i=1; AJvYcCXTfnLnQkD53x/qkY2qhyr2Xo++W7Jo4B1T+hs5I77xRTtpBELexw0DqzZUwlP+spMhz0gPwQprcanmrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKI6ZGdmgxkQpqbo+CntS/XhJosqHlHTriP5YenwXvupJbQHwQ
	+mvd4Aa2bkpi+vjtGzzOp41qtGC4du18Q83soEIV24D8GkCpGShFmsxCWsE9BsxxBKA9NLOj59p
	L0nbffbrp7lQDDj80thhFpOOdhpzWEXYlnL9gdSf1caO/AlpgM5xeoLCWXrfRw3Ls+TTIITeD
X-Gm-Gg: ASbGncvo8qXTaWFTkePncdDQiZzu2BhcQqda7gWbMnnnyB524nAyR7wLNB1prEjwwgs
	m76fZI9bORc0aCiZ2QDYPwSsT23Pckd9Gh3NwMKkikadKAMzmMOCDRQfxUz3kb7xhGeFL4HfRTk
	5EeViotdK4lxzaimOWY3N1BkW2ZI84qCmNWWA1WvoRs9GxfY/bY4IkPvfOl3YepI7W9V6A/5tAK
	f2Bg7ZXGoVvSQoPnTQD25AzlKS8eNYkZxzH+XohDRGVrVDrb1oVPdojY5nDm3FH160wra0CBekJ
	fQEOA05hZSSMp+Y9ivm+F1XVhvB3xviAzUG56adYC6U=
X-Received: by 2002:a05:6102:4194:b0:4dd:b259:ef34 with SMTP id ada2fe7eead31-4dfa6bc2153mr23769173137.10.1747941303018;
        Thu, 22 May 2025 12:15:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRddDlFxPUUR5F2gsJMHMOPx29VyzJ81B7uxRO7njSdbC+pQOzmu4VMwEnxIQSDZLDU8b5hA==
X-Received: by 2002:a05:6214:1c09:b0:6e8:97d2:9999 with SMTP id 6a1803df08f44-6f8b08ab1f9mr447262536d6.28.1747941291701;
        Thu, 22 May 2025 12:14:51 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ab862sm102862916d6.38.2025.05.22.12.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:14:51 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com
Cc: mripard@kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v3 3/3] dma-buf: heaps: Give default CMA heap a fixed name
Date: Thu, 22 May 2025 12:14:18 -0700
Message-ID: <20250522191418.442390-4-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522191418.442390-1-jkangas@redhat.com>
References: <20250522191418.442390-1-jkangas@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CMA heap's name in devtmpfs can vary depending on how the heap is
defined. Its name defaults to "reserved", but if a CMA area is defined
in the devicetree, the heap takes on the devicetree node's name, such as
"default-pool" or "linux,cma". To simplify naming, unconditionally name
it "default_cma_region", but keep a legacy node in place backed by the
same underlying allocator for backwards compatibility.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst |  7 +++++--
 drivers/dma-buf/heaps/Kconfig                 | 10 ++++++++++
 drivers/dma-buf/heaps/cma_heap.c              | 20 ++++++++++++++++++-
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 23bd0bd7b0654..1dfe5e7acd5a3 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -21,5 +21,8 @@ following heaps:
    usually created either through the kernel commandline through the
    ``cma`` parameter, a memory region Device-Tree node with the
    ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
-   ``CMA_SIZE_PERCENTAGE`` Kconfig options. Depending on the platform, it
-   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
+   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs is
+   ``default_cma_region``. For backwards compatibility, when the
+   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
+   created following legacy naming conventions; the legacy name might be
+   ``reserved``, ``linux,cma``, or ``default-pool``.
diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c42264..bb369b38b001a 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,13 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_CMA_LEGACY
+	bool "Legacy DMA-BUF CMA Heap"
+	default y
+	depends on DMABUF_HEAPS_CMA
+	help
+	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
+	  from the CMA area's devicetree node, or "reserved" if the area is not
+	  defined in the devicetree. This uses the same underlying allocator as
+	  CONFIG_DMABUF_HEAPS_CMA.
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index e998d8ccd1dc6..dfeccafc6ae3c 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -9,6 +9,9 @@
  * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
  *	Andrew F. Davis <afd@ti.com>
  */
+
+#define pr_fmt(fmt) "cma_heap: " fmt
+
 #include <linux/cma.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-heap.h>
@@ -22,6 +25,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#define DEFAULT_CMA_NAME "default_cma_region"
 
 struct cma_heap {
 	struct dma_heap *heap;
@@ -394,15 +398,29 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
 static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
+	const char *legacy_cma_name;
 	int ret;
 
 	if (!default_cma)
 		return 0;
 
-	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
+	ret = __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
 	if (ret)
 		return ret;
 
+	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY)) {
+		legacy_cma_name = cma_get_name(default_cma);
+		if (!strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
+			pr_warn("legacy name and default name are the same, skipping legacy heap\n");
+			return 0;
+		}
+
+		ret = __add_cma_heap(default_cma, legacy_cma_name);
+		if (ret)
+			pr_warn("failed to add legacy heap: %pe\n",
+				ERR_PTR(-ret));
+	}
+
 	return 0;
 }
 module_init(add_default_cma_heap);
-- 
2.49.0



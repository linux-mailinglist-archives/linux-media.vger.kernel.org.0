Return-Path: <linux-media+bounces-34442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86626AD38D4
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 15:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F389188AD47
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4535C29C35A;
	Tue, 10 Jun 2025 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TTfULFTk"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F9C29C321
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 13:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561177; cv=none; b=gjnzmnO0qiYVVm4nH4019LUaU1r/i5kDLeHrXwU255n216kHGw7jTcullgGu5RhGJ//4XdgIGutyOiJSymJ7HarO2K20B+l6cs3JmZRkcu9dQDeg/z4k9gvlSvhjfs7kQlkzAq43KvIxLGIsiV1X03Rc0oqXqQ18YpRAzzqMANo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561177; c=relaxed/simple;
	bh=yef15B0sGtKhMMnl4sHNnJ32U5IclmJDl8sy1R7VHnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODu/A3W26xllL9iwRcJd3SdHhGHb5OG4EYDf2GDfuB+2iCzCO8bnlAVeEBhEIDcGB34zL6TR26ICIw7cXPdMSCZHJPBPPW4hPuvZUPcPZwOJe0MJJzZI27+QWWBKIYvNeWkshRJSejqZ34Jk0G8mCFxNEiKAJCVafLxFK/pFXHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TTfULFTk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwNvAxSsZLHPNJHICSvYXU8WtA4BAcBKIAsdjIZgB+Y=;
	b=TTfULFTkpIfnSNXUL8Lgge2QFWXPIHXsTCBMSGhYG9VgpULgXNbi9I5Y1B1Gl3zzCVqJOB
	hoQ6CAiqfvJ/bxfAMIsEO3pChZBzROxX56aY3FcnWaR6T0AhT6CDgnACq/qcGiyMgnt9Uk
	os+jxATRSeoqgbpYhCUGbKzQ8VoFxh0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-Dzp_UfmYNOCSGTDXU16g-Q-1; Tue, 10 Jun 2025 09:12:53 -0400
X-MC-Unique: Dzp_UfmYNOCSGTDXU16g-Q-1
X-Mimecast-MFC-AGG-ID: Dzp_UfmYNOCSGTDXU16g-Q_1749561172
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so115211496d6.1
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 06:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561172; x=1750165972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwNvAxSsZLHPNJHICSvYXU8WtA4BAcBKIAsdjIZgB+Y=;
        b=FcOm70MD6AnJCvYkIpJ0ddq+EttpPQ8AiDLrMcyzfHU1m+qBpauNnAYu3FMbgaIUDU
         C3VTV0yMEuJWUGJGhOn8Xuq3sakQGjntMOX0TrtQJexGZXD+j0uE5hR/fHamG742rMkd
         U7JmQXk/w+Yvh9jegbb2XAJPVv3Iqd8aMy2yGj82j/sqSNJcQGLE8GymsXe2/DqpwLHN
         ipwEUG2q+b7Jdc3p1EejHitvd1G5m0iL56opBPWUADdh1eIpdWkjO6Bf0nJM3XcUcltj
         SoyxxSKLemsdwIjQgLusYJTXRWwXECOBUvi5N1IEmIgzvfMvpQL5HEuzH7SES3NRAP67
         8pRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNQBb1seHEwtwfhfqhDVnYY563uHbaRqoMPMY/BIrCRaOi/yJ9aN/P58qNRGZE7wKsWnTdqDY4cdqH4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm22e8cLobOrRfkGbmH3FT7l9yUbLj0XlHdV7w/FwBY05OVzXK
	B4JNYV11zVhOO4+MpfH/AAbkxXJkoj8F4zFLLGbz5PbbQu1FXrrzllhrZSWKTSIZnjuZ3AVXVns
	QND1Y2qQnBDW6ncVsPyih8v/FQFh0W5dGWqa3zM13tRg6W15t/WPbzxBGjFu8r0nS
X-Gm-Gg: ASbGncuKpHqkat0gSTr4Xsm4cAehVFMCNXE8U19ScRyT7etXjKDeVu2/YL/p+KRKcfr
	aGrzFW3kcuBRIi/EXchz9xdHaO0cZwWk6IGLRcToF87JdMnMjfKsu/hPpjJULG+BuduRfx+XItL
	J0reOc1jCetMHaFlS5ar1KrNxbltqTZVvIKYU+6FcEVkxpffxMmob6Lo0NWcWSex5rP5t3pIjeb
	lHGCbAzOgKDZ0wxssYW5MnASpK0s3Sl/Wjrs70eoWUI3D/0X7rD/P25Guc2BDxBDMCP0R6Vxj+o
	mDK/4kNMZPpxYD6u6jbhl9TKmpQlmT/2eCQtnVnZDpQnwUDs7eCfdw==
X-Received: by 2002:a05:6214:2501:b0:6f4:c742:7a7b with SMTP id 6a1803df08f44-6fb24cc1827mr35155796d6.43.1749561172555;
        Tue, 10 Jun 2025 06:12:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhwjqEuOk/V8BHIoXELyZMwDXwVFYf4ATZsDCoOS8jLuVTpHJJBi7SBGtQfW7GqBV1/L6ZsQ==
X-Received: by 2002:a05:6214:2501:b0:6f4:c742:7a7b with SMTP id 6a1803df08f44-6fb24cc1827mr35155466d6.43.1749561172028;
        Tue, 10 Jun 2025 06:12:52 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25170615bsm696832285a.9.2025.06.10.06.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:12:51 -0700 (PDT)
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
Subject: [PATCH v4 3/3] dma-buf: heaps: Give default CMA heap a fixed name
Date: Tue, 10 Jun 2025 06:12:31 -0700
Message-ID: <20250610131231.1724627-4-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610131231.1724627-1-jkangas@redhat.com>
References: <20250610131231.1724627-1-jkangas@redhat.com>
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

Reviewed-by: Maxime Ripard <mripard@kernel.org>
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
index e998d8ccd1dc6..0df0071119754 100644
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
+				ERR_PTR(ret));
+	}
+
 	return 0;
 }
 module_init(add_default_cma_heap);
-- 
2.49.0



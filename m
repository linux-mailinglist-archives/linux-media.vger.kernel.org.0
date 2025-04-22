Return-Path: <linux-media+bounces-30724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A97A972F7
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 18:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6B067AD045
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 16:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A252957D1;
	Tue, 22 Apr 2025 16:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MqbOsSas"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3AC2949F8
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 16:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340147; cv=none; b=Izak0wXJ7dQmxB+/7GE0HVn7uC4nOPDCYmNYmULXyNNgiBU0Lb+udWK7/Ptaux2cZ/NeDxaWX4X1dLRxleDPPGVNg578eiwGYgfSFFk/qCSHqAf+UOOdpAd2fof3AG1J0AN8dbwjGRn6enO1Naa3tZkZxE9FMUrBG1YkGMu8+84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340147; c=relaxed/simple;
	bh=VM06un6R4IE2G9FmNC/1gf+872pzwD+CPRTaFlma6MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jmir101OFQYX3svZdmF7CSOBJukrGIxMnWM14LzYQyINLDEseiQzXk7g3AsPFVTRqhmltfM/rkBluJY50yLmOrwf/i8FzLx3s3Dzi2yCH5seu4j+piHIkUFNRryd7XGR7kVg3/PlwC/EKZkoH/3/XM6GRyV3LquWPeCRuCOJi9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MqbOsSas; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745340144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Tmv3l4usOA2nic8/HFVk1c3fkYkDEF/+Vvfj6a/0Hk=;
	b=MqbOsSasZQChmEmB5EmacxHSX+Ve2e4FbXS2jZeQGjbMT9e56quHKL1DxbVbTfZ52v1yR7
	fDXX8hFA89UbMmga35XlG704TcA2RwqNExrrd9/2288ZCq7ec6kmPioGx16E+5gYVpb8Gc
	zx8q2dbjnY6DMosmV9VvdqeHqNPaklU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-HPzr-dESNWqPjKIQqDYo7w-1; Tue, 22 Apr 2025 12:42:23 -0400
X-MC-Unique: HPzr-dESNWqPjKIQqDYo7w-1
X-Mimecast-MFC-AGG-ID: HPzr-dESNWqPjKIQqDYo7w_1745340142
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5b9333642so660629885a.3
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 09:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745340142; x=1745944942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Tmv3l4usOA2nic8/HFVk1c3fkYkDEF/+Vvfj6a/0Hk=;
        b=u/Qpox9d+qE0iyCJAuRDwCxKiVm9g7r+ovnQw/EzqSdLqTARzy15cagkJJ4rYrjc9P
         mZnWgGYDsKhlKmdfhSpKTG/Nx454Mvyf1EB48ubDidDe6t2ybdQqgMq/xdeeGCvPZAS/
         obm/B+Zkv9qBS9X2na8hdHFLphNqgwbL23lPscNFaIRBwEg3Iqmbi+ii7e2oy2WzDVq2
         uwDN/C5eDRufhlSYoxE65yKghEZTKQZ37c2LO+F4lnqVPTzFQyw4jV81FRsO6vSj6ol9
         kmMpARI0FUe2glsCitmdSoVnFpLh81fghclaPjUCurh4iKfe/xtPHCOCIgh2uWFxo6mA
         YY/w==
X-Forwarded-Encrypted: i=1; AJvYcCXsFixnB2pEYUd2Z6P6kDJXI+Z/2azQNuUdi4ePienpdJhKCeILg+bJdpDuMf6GWQw639GgWYQ0cawlQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwHCJK0og7S42rxwYYvNVZbItzoUewdnikGhWi8VnwQ3Nza07s
	ZuCRVHEsQHmL5Ccw1QBmHi2nl6/7oVZTPhwNhYUtqsh5sY38e6yF4nlfWaUuToHzrtK9QcNkeI/
	bFvuc/HU05t+F7XT12jJfRFNMq4tz9yMn2RGYCroRuDukho0zdICYMVBa9UeP
X-Gm-Gg: ASbGnctPyNDBWvPdSDCsd2qJ+qBBITkS6jOveI5SgxPgFa1LLK8O2GATRypTRMRY9fi
	GFmtLXtQQIBdDq4waf7XI50sOh27v7JNdsMbb/sh7qHZzjMdhqQz+tD3HPMag7wdhFNV5sCeNej
	cD43NR6G1xc7V7BguIJl/EmAX5g40LVAOq5e2TEH4Y/F6YAeFKXt64Te4c5bVTexpIQlLF8zvDb
	8tUWqSuVpsIcr+79X4DrNyVnqixt4uc7NISar7y9DCgncxqbYKJGczmBqhi5Q392vUGDM2A9Ylp
	C2Crmima6+nOEg+n5HOLkp0NlL0mVDf/P3HWyOgXZvs=
X-Received: by 2002:a05:6214:c2f:b0:6ea:d604:9e49 with SMTP id 6a1803df08f44-6f2c464071amr310346426d6.34.1745340142534;
        Tue, 22 Apr 2025 09:42:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+ZRP1lhsHeFU6VqIk73sz8A2RHJZCwagmzI5I0mu0qrXjlrLozmeOZJ/CtBIvPj+DfegBnA==
X-Received: by 2002:a05:6214:c2f:b0:6ea:d604:9e49 with SMTP id 6a1803df08f44-6f2c464071amr310346026d6.34.1745340142119;
        Tue, 22 Apr 2025 09:42:22 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfd182sm59451376d6.80.2025.04.22.09.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:42:21 -0700 (PDT)
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
Subject: [PATCH 2/2] dma-buf: heaps: Give default CMA heap a fixed name
Date: Tue, 22 Apr 2025 09:41:48 -0700
Message-ID: <20250422164148.547798-3-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422164148.547798-1-jkangas@redhat.com>
References: <20250422164148.547798-1-jkangas@redhat.com>
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
"default-pool" or "linux,cma". To simplify naming, just name it
"default_cma", and keep a legacy node in place backed by the same
underlying structure for backwards compatibility.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 11 +++++++----
 drivers/dma-buf/heaps/Kconfig                 | 10 ++++++++++
 drivers/dma-buf/heaps/cma_heap.c              | 14 +++++++++++++-
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 535f49047ce64..577de813ba461 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -19,7 +19,10 @@ following heaps:
  - The ``cma`` heap allocates physically contiguous, cacheable,
    buffers. Only present if a CMA region is present. Such a region is
    usually created either through the kernel commandline through the
-   `cma` parameter, a memory region Device-Tree node with the
-   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
-   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
-   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
+   ``cma`` parameter, a memory region Device-Tree node with the
+   ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
+   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs is
+   ``default_cma``. For backwards compatibility, when the
+   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
+   created following legacy naming conventions; the legacy name might be
+   ``reserved``, ``linux,cma``, or ``default-pool``.
diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c42264..83f3770fa820a 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,13 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_CMA_LEGACY
+	bool "DMA-BUF CMA Heap"
+	default y
+	depends on DMABUF_HEAPS_CMA
+	help
+	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
+	  from the CMA area's devicetree node, or "reserved" if the area is not
+	  defined in the devicetree. This uses the same underlying allocator as
+	  CONFIG_DMABUF_HEAPS_CMA.
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index e998d8ccd1dc6..5533420d566b0 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#define DEFAULT_CMA_NAME "default_cma"
 
 struct cma_heap {
 	struct dma_heap *heap;
@@ -394,15 +395,26 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
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
 
+	legacy_cma_name = cma_get_name(default_cma);
+
+	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY) &&
+	    strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
+		ret = __add_cma_heap(default_cma, legacy_cma_name);
+		if (ret)
+			pr_warn("cma_heap: failed to add legacy heap: %pe\n",
+			        ERR_PTR(-ret));
+	}
+
 	return 0;
 }
 module_init(add_default_cma_heap);
-- 
2.49.0



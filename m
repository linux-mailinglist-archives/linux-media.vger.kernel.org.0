Return-Path: <linux-media+bounces-30731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99364A97557
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 21:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 292CC3B8E70
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 19:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F61298CBC;
	Tue, 22 Apr 2025 19:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GMe2LOgU"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ABF29899F
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 19:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349593; cv=none; b=R189HPfrdHcgqo2qTOuGCp95ACY2aeWBwJqGqyeIMkqWGqLEvWn3Zq/jWRWTAYAyhMcy5UnsJaIfAQ0EYbdmSiRcpc+ac3ocUlSWng5ftGgKKO7WXShSLG15SmIcEakv8n0AFkWqzSheI8nFFGvqA5hYDV5UDbWMyikOWw45qRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349593; c=relaxed/simple;
	bh=b6QisJyeOTkuZDTBO8XWIqRp1ITUALXyhmd2RYYjRZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7BdZwuaA7Jlh7kTglc1M1uBffHg0KocI7KH2Df7jkSl/8GzvWaA4xF8ahnJhc5wz1uRjTKJwK4Jbq1ugoFrWTYv2hA52AgamYgZUdxwK/gsxM5KazFCFmJXhYNfNG48ZjED51vT0TpJZ931SmAo0MzQrEGzImi6LbLxS6gLuZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GMe2LOgU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745349591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RFnYA+dIxtEPuPQn/ih3spX47Xz49Ahvw2hkrVXiNR8=;
	b=GMe2LOgUNXbMJgJlU3Sd0yFrK08i8CT++vSCVdgzshDdMgZe7t0XmdQ2Q5vzdATMhyOgY0
	lDlKEj92uxtOfsAcOd1dywiOwpXztErE6chwinaYXFpHiBt8H5MRwp9hjIbxHZexe0oXxR
	2iRzSVpJpG3RSxU0gmKPDTHOSGjJzyk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-Pfs43uL0NwGjya8HV-Ns6w-1; Tue, 22 Apr 2025 15:19:49 -0400
X-MC-Unique: Pfs43uL0NwGjya8HV-Ns6w-1
X-Mimecast-MFC-AGG-ID: Pfs43uL0NwGjya8HV-Ns6w_1745349589
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47682f9e7b9so88865511cf.2
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 12:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745349589; x=1745954389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFnYA+dIxtEPuPQn/ih3spX47Xz49Ahvw2hkrVXiNR8=;
        b=sWpZJE/yU4xrDBbMletnM5U6sASDjwRfCvWdwghqzHrkKFjsyvc6Vj6sWQ3Q3y7ZEt
         xIcxGmCvRRe/efw1sf7At7h9dcTi65qKbGF8O3X6j85uEsdukaxGBwqNsUycJcjjlUmI
         K2AhEsB9dlL9oLzFhhK36f+YsVoUVVuM+yCyvRsBYZ0AWHFSgz+40bY1e8Gc0WxtDZdj
         uQWLaxo4eZHTS24/dTNCio7DiMz7Tni4jmBzWNXcCavDda4BlG9Aa8EAGKeSTqo7bvLL
         NuXU+pEotNDaOhmAJwQBJmAhvUD9bVefClIIXUfmlSYtKQJObIkF+mXn4Zy8PydzBfaz
         02gA==
X-Forwarded-Encrypted: i=1; AJvYcCW1FDQMAUHCpCAgaTYmF0779IEKzk9jkiw1HFMRkv3mB0QCh2awbMK34GoC9WhWLQHdmDwx4KHNQ/uzPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp24dINDChIDuNHYiIrV+4tp7dDMB7mBPCop5mzQP7uaRT0fnC
	MhHjDqijqP3tjJMI0VkpiG3xL+GyyD7ARfb57OXfMqJEVyUlqGLaTH2K1ThTNve9fxz2cflVhq4
	spRk8MSfZ6vcorFD1jzj5/sV4uMBT8J3pwJCjQpDDz6x75tK4i8BAgHjUdl2Q
X-Gm-Gg: ASbGnctBLTkN5M0rWZ+dRp/6w+FqsK/IZivdaVwdk8BYjeQ3jzqaJMRFS2vFdW8/TZe
	RNq1gRxbMQttjRV/AMpOpGnpuKzazJST+nqo/CqAm+IZQ0O2/97uRxiSbm/nMjk/Mtst4JZl9bj
	3LYpOj4CTZ6tH97Ulzye4BxDjyAD4M7tPtSdhT7pSkCQiAQFz3eajqLaxdra3WOAmN3KN9YlvVC
	xSzIifa2+zTUZf83kAe2VGULQ7CVl121VelEQbabkooCzw2xrS8aksnzyFp1BjqWcjs9+Geyb7m
	AeGyp9iWIK/gUjF7UrViqoPPMdev/UIK0pJaqneldt4=
X-Received: by 2002:a05:622a:1388:b0:474:fc9b:d2a7 with SMTP id d75a77b69052e-47aec39a3a6mr260841561cf.6.1745349589062;
        Tue, 22 Apr 2025 12:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrsCIWzV36zFufAhZm9wW5P3gFY7s9s6X7f7vuJ7WpFXp1y42n/eSX7UrEzezKD5JlUheTtg==
X-Received: by 2002:a05:622a:1388:b0:474:fc9b:d2a7 with SMTP id d75a77b69052e-47aec39a3a6mr260841241cf.6.1745349588771;
        Tue, 22 Apr 2025 12:19:48 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47b01bef3ecsm40842141cf.55.2025.04.22.12.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:19:48 -0700 (PDT)
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
Subject: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
Date: Tue, 22 Apr 2025 12:19:39 -0700
Message-ID: <20250422191939.555963-3-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422191939.555963-1-jkangas@redhat.com>
References: <20250422191939.555963-1-jkangas@redhat.com>
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
index e998d8ccd1dc6..cd742c961190d 100644
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
+				ERR_PTR(-ret));
+	}
+
 	return 0;
 }
 module_init(add_default_cma_heap);
-- 
2.49.0



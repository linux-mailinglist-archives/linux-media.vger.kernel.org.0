Return-Path: <linux-media+bounces-44250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA95BD2183
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 10:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76EEC1899804
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 08:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68B02FB610;
	Mon, 13 Oct 2025 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udRzakzM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D2A2F9C32;
	Mon, 13 Oct 2025 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760344530; cv=none; b=TbxPjEWwTXCmCD9f940oVw5/uNeGUAtwYAbPyYHqEjslkRwCnAARTtML2mIVW1rEz+WW/JRgFDkSxBQ/ADO9zcrvfaTqYJsYX6lxnxNhTgUa6tSkWtFzWGl3GJBChCq+5RbCjUgfhxjj59ROIbJWPybhQbdAW+9zClL3Cs8Yx/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760344530; c=relaxed/simple;
	bh=M2vThTE/nI9A0eTijjOxBfcDZbixVCE8PiHlBxnoWQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtb05i4kEBv9Eg4OI1zScGqkbsVdBZhdlgrQUNGj0BNQqgUNpit1EAhhg06dsh2ZtFzKMtJdJ0YN/bZ4PV0qqvYA+5m19y1XULjhvc3CS6f6ahXpgB/Nsa8AcVrESdj4O1dW4VrF5ZaNanloBa5CFu6sRe0HC+iTG/u7BH7MA0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udRzakzM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCE1C4CEFE;
	Mon, 13 Oct 2025 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760344529;
	bh=M2vThTE/nI9A0eTijjOxBfcDZbixVCE8PiHlBxnoWQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=udRzakzMd65x34EnOiiJO3y0lmwBPB59JEsxf5CiiZGpioeiYJ2Z1WkKEAfdwPcSv
	 Y25ihnMa3oxJIV79BNsn3ZKjjqXaBYwzBtpJhmQZP4onwtG2wtoLNTH+eQDs2dxnfn
	 +1Mrwpopx9n9OrTNCi5M6vdZXhKwsn70zWwQCfL6R+AaTUKzmYhQjb4g/tePHoa5wN
	 /+CSa2Kbnisjnx1m+8ePqyi3EkHGDshcQ81sZ1iHIi7VHY5QcE47KKfoIS/vhzm5xH
	 e1y/V7epIlUYbY5eE3cQworkNeLzsbU4PmS72hjmcqL3M9fex5e+B4J/z37VpCMiVj
	 zI5bn+jm7XRhw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 13 Oct 2025 10:35:18 +0200
Subject: [PATCH v8 3/5] dma: contiguous: Register reusable CMA regions at
 boot
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-dma-buf-ecc-heap-v8-3-04ce150ea3d9@kernel.org>
References: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
In-Reply-To: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2

In order to create a CMA dma-buf heap instance for each CMA heap region
in the system, we need to collect all of them during boot.

They are created from two main sources: the reserved-memory regions in
the device tree, and the default CMA region created from the
configuration or command line parameters, if no default region is
provided in the device tree.

Let's collect all the device-tree defined CMA regions flagged as
reusable.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 kernel/dma/contiguous.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index d9b9dcba6ff7cf5904ac93b72c061fd59072c41b..d67e95094749d45f43c1809c175e491a3f55b2e1 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -40,10 +40,11 @@
 #include <asm/page.h>
 
 #include <linux/memblock.h>
 #include <linux/err.h>
 #include <linux/sizes.h>
+#include <linux/dma-buf/heaps/cma.h>
 #include <linux/dma-map-ops.h>
 #include <linux/cma.h>
 #include <linux/nospec.h>
 
 #ifdef CONFIG_CMA_SIZE_MBYTES
@@ -491,9 +492,13 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
 	rmem->priv = cma;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
 
+	err = dma_heap_cma_register_heap(cma);
+	if (err)
+		pr_warn("Couldn't register CMA heap.");
+
 	return 0;
 }
 RESERVEDMEM_OF_DECLARE(cma, "shared-dma-pool", rmem_cma_setup);
 #endif

-- 
2.51.0



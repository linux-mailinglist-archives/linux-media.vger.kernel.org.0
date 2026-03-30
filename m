Return-Path: <linux-media+bounces-57647-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFN8GGubymmg+QUAu9opvQ
	(envelope-from <linux-media+bounces-57647-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:48:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F9835E23F
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBF3530DF2F5
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C5E36EA8F;
	Mon, 30 Mar 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s9kszX8b"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFEF36C9CA;
	Mon, 30 Mar 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885216; cv=none; b=pCk0lt2mv9bOiA0rom+sip4wIK88MflBMuJqzruHAwIHF9ITDPVnjF+eFYc00pCEJjedWkkJc0xrRCAi0y12EL+kKYhq5SMo7OvwIW5nonAzGermaj1WaUAZWC9psZCqthxUxGvjfe+x9uBJkkesGxgKyDKPnB7GRcVohToZkf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885216; c=relaxed/simple;
	bh=qHM7oQRzY9ST2dUBFDQhLmzQd4QRKdkAaxvIMcjy50c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ew0SL7vBRTsesHWNd/aUu3uwCugVHh++Gd/gkC0AcGpVSyhp55iQutlhfiZ3DBtRy2S1kaVsZAdBWg0vwxwYYfmfuvHTphPnJrkpu2GSaF2WB/+0/GQvYlH1sV/Ah0rShHpxu4EDTPwvZmW8tvphgadGc05vppxBs+lP4urxmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s9kszX8b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7773FC4CEF7;
	Mon, 30 Mar 2026 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774885216;
	bh=qHM7oQRzY9ST2dUBFDQhLmzQd4QRKdkAaxvIMcjy50c=;
	h=From:Date:Subject:To:Cc:From;
	b=s9kszX8bGTBslpUJXFL5Lq/D5pP9huMGeBAeBbm7gRqrYjuQut2CQIdrwBHGzaJWV
	 BbK/5U1snRWILPPWfpCG348z8pmmSQBr07ZAv8X5+XVbsYPCcoWuQ/mxN65vtR+92q
	 xMRMry2fcHhNBYsRLeQMVUWGtBtDjkfBLV0VcWy5BirZwu1ZQvcLBnR31N24ViNt4M
	 rIK3mgJuoe23/CahEOA4ry1bTTOi+lN6uwFQuY+Lpm5niVXRWLre/4DTSGM3a0qg1j
	 Uz+jm33jUr+cxkb3p1VW7B/CtO77UiMIZGekm94DIdgQCl2r8rx2O2Xe9E2sWnY3zc
	 xlqe4yT1OwjzQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 30 Mar 2026 17:40:07 +0200
Subject: [PATCH v2] dma/contiguous: Fix broken build
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-dma-build-fix-v2-1-26d844575815@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMQQ6CMBAAv0L27JptIUA8+Q/DodgtbERqWm00p
 H+3cvc4k8xsEDkIRzhVGwROEsWvBfShguts1olRbGHQpFuqa0J7Nzi+ZLHo5I0dtaZxPBKTg9I
 8Ahe9/y5D4Vni04fPvk/qZ/+dkkKFXdOPbePI9sadbxxWXo4+TDDknL9ie8p0qwAAAA==
X-Change-ID: 20260330-dma-build-fix-706a4feb0e0f
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Albert Esteve <aesteve@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, Mark Brown <broonie@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5317; i=mripard@kernel.org;
 h=from:subject:message-id; bh=qHM7oQRzY9ST2dUBFDQhLmzQd4QRKdkAaxvIMcjy50c=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmnZsZYhk7q1tp/3PGvi+Xf/i/dwdNu/16+/pms0YVrP
 VMM721d1DGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmcvsjYzXbvirxL1umLbqk
 OOG3yJI1n/+lyDL1tr++k7Oi5fGs9nnvmibn1EyfVRIXfjW8+PY2hh2MdQrbnOMttT5zdf4zn7V
 E6lZPn5doesH856lTV8r/Sbo6Q/TmxY2Lmv8uWvnYsXErR/JuUwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57647-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10F9835E23F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 3a236f6a5cf2 ("dma: contiguous: Turn heap registration logic
around") didn't remove one last call to dma_heap_cma_register_heap()
that it removed, thus breaking the build.

That last call is in dma_contiguous_reserve(), to handle the
registration of the default CMA region heap instance.

The default CMA region instance is already somewhat handled by
retrieving it through the dev_get_cma_area() call in the CMA heap
driver. However, since commit 854acbe75ff4 ("dma-buf: heaps: Give
default CMA heap a fixed name"), we will create two heap instances for
the CMA default region.

The first one is always called "default_cma_region", and is the one
handled by the call to dev_get_cma_area() mentioned earlier. The second
one is the name it used to have prior to that last commit for backward
compatibility.

In the case where the default CMA region is defined in the DT, then that
region is registered through rmem_cma_setup() and that region is added
to the list of CMA regions to create a CMA heap instance for.

In the case where the default CMA region is not defined in the DT
though used to be the case covered by the now removed
dma_heap_cma_register_heap() in dma_contiguous_reserve(). If we only
remove the call to dma_heap_cma_register_heap(), then the legacy name of
the CMA heap will not be registered anymore. We thus need to replace
that call with a call to rmem_cma_insert_area() to make sure we queue
this instance, if created, to create a heap instance.

Once that call to dma_heap_cma_register_heap() replaced, we can also
remove the now unused function definition, its now empty header, and all
includes of this header.

Fixes: 3a236f6a5cf2 ("dma: contiguous: Turn heap registration logic around")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/linux-next/acbjaDJ1a-YQC64d@sirena.co.uk/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v2:
- Fix creation of the CMA heap instance with the legacy name when not
  declared in the DT. 
- Link to v1: https://lore.kernel.org/r/20260330-dma-build-fix-v1-1-748b64f0d8af@kernel.org
---
 drivers/dma-buf/heaps/cma_heap.c  |  1 -
 include/linux/dma-buf/heaps/cma.h | 16 ----------------
 kernel/dma/contiguous.c           | 14 +++++++++++---
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 7216a14262b04bb6130ddf26b7d009f7d15b03fd..9a8b36bc929f6daa483a0139a2919d95127e0d23 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -12,11 +12,10 @@
 
 #define pr_fmt(fmt) "cma_heap: " fmt
 
 #include <linux/cma.h>
 #include <linux/dma-buf.h>
-#include <linux/dma-buf/heaps/cma.h>
 #include <linux/dma-heap.h>
 #include <linux/dma-map-ops.h>
 #include <linux/err.h>
 #include <linux/highmem.h>
 #include <linux/io.h>
diff --git a/include/linux/dma-buf/heaps/cma.h b/include/linux/dma-buf/heaps/cma.h
deleted file mode 100644
index e751479e21e703e24a5f799b4a7fc8bd0df3c1c4..0000000000000000000000000000000000000000
--- a/include/linux/dma-buf/heaps/cma.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef DMA_BUF_HEAP_CMA_H_
-#define DMA_BUF_HEAP_CMA_H_
-
-struct cma;
-
-#ifdef CONFIG_DMABUF_HEAPS_CMA
-int dma_heap_cma_register_heap(struct cma *cma);
-#else
-static inline int dma_heap_cma_register_heap(struct cma *cma)
-{
-	return 0;
-}
-#endif // CONFIG_DMABUF_HEAPS_CMA
-
-#endif // DMA_BUF_HEAP_CMA_H_
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index ad50512d71d3088a73e4b1ac02d6e6122374888e..d5d15983060c5c54744d6a63f2b591e1a3455b86 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -40,11 +40,10 @@
 #include <asm/page.h>
 
 #include <linux/memblock.h>
 #include <linux/err.h>
 #include <linux/sizes.h>
-#include <linux/dma-buf/heaps/cma.h>
 #include <linux/dma-map-ops.h>
 #include <linux/cma.h>
 #include <linux/nospec.h>
 
 #ifdef CONFIG_CMA_SIZE_MBYTES
@@ -217,10 +216,19 @@ static void __init dma_numa_cma_reserve(void)
 static inline void __init dma_numa_cma_reserve(void)
 {
 }
 #endif
 
+#ifdef CONFIG_OF_RESERVED_MEM
+static int rmem_cma_insert_area(struct cma *cma);
+#else
+static inline int rmem_cma_insert_area(struct cma *cma)
+{
+	return 0;
+}
+#endif
+
 /**
  * dma_contiguous_reserve() - reserve area(s) for contiguous memory handling
  * @limit: End address of the reserved memory (optional, 0 for any).
  *
  * This function reserves memory from early allocator. It should be
@@ -271,13 +279,13 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
 						  &dma_contiguous_default_area,
 						  fixed);
 		if (ret)
 			return;
 
-		ret = dma_heap_cma_register_heap(dma_contiguous_default_area);
+		ret = rmem_cma_insert_area(dma_contiguous_default_area);
 		if (ret)
-			pr_warn("Couldn't register default CMA heap.");
+			pr_warn("Couldn't queue default CMA region for heap creation.");
 	}
 }
 
 void __weak
 dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)

---
base-commit: 6c683d5b1903a14e362c9f1628ce9fe61eac35e7
change-id: 20260330-dma-build-fix-706a4feb0e0f

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>



Return-Path: <linux-media+bounces-38166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E898B0C29C
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 13:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E545818C3BBE
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D9729E0F8;
	Mon, 21 Jul 2025 11:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eau9nt4A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E6929C355;
	Mon, 21 Jul 2025 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753096669; cv=none; b=A1oXj3VNaeJJ4HoUDFAlJfjzKSDj3g+Haqh5PjfsHfl56RWeRRxu11g06Sv3a3ESoSEjp8VxiDgdwRDaQ5fv7Ho9o987yxArF6oJFtDkMvv8Ed2WMg8nkH4Yg4KNk1I7JodTYR4D/SkkmWjP9Ppmz/SL5PRfzL77x1UZCsSMZ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753096669; c=relaxed/simple;
	bh=JC2kgPKoyopfcstm3FBIUDMnngpOTv3PR1mdR6IDQVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Isv4v0MYAo0AeAphdwlLTdH2s1C6TVvF/GObfgyz6GEAJShtgTpPAK9UOSj3LKXvKN2kiKtT7o7HFrcPB49Ierf3a8SlIifdNMa7SvmtDVsFBctubUmYS42c3IgRoOPj8U5GNUvZGfVN8Eis4CvAOJjoqrM5NMzGpaoh4800bBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eau9nt4A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FFEC4CEF1;
	Mon, 21 Jul 2025 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753096668;
	bh=JC2kgPKoyopfcstm3FBIUDMnngpOTv3PR1mdR6IDQVs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Eau9nt4AQV8tXUIP9uyzwmDBrWVu6v1xYLmnvytopjcWchfHjNFH8PZDJbI4ocH+m
	 Ixp9nVAmCp+H4t1BOl3KFPPCswjSnM6Gb/Rrb+QsQoScDc32hJ/9gnHl6xuc0EEWaM
	 bS3mM3nPP2MtG0ThHlc63yxPECmOGdldEahF6WTS8llEaQVwkKvN08U+cXI70ZspGu
	 dnWXIiRACxcabd5G3EhDdWhjwyfJEYC7SGwPk0GyQLN2N/hV0EDheb2fQtxp9BeKIe
	 SLwcIv9Kzgv0MJ4jGtXDEG80ep04wlWpUriFb7Zkxb6OmvyRyF5vWPyPHMmjW3e73q
	 PvH0T3UaY6pTQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 21 Jul 2025 13:17:32 +0200
Subject: [PATCH v7 3/5] dma: contiguous: Register reusable CMA regions at
 boot
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-dma-buf-ecc-heap-v7-3-031836e1a942@kernel.org>
References: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
In-Reply-To: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-doc@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JC2kgPKoyopfcstm3FBIUDMnngpOTv3PR1mdR6IDQVs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBl1iucP++yv60//o8bzs84oo+zI+/+/Ldc802ZYuKft+
 T6Gvx4BHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiXX8YGxaZfZjdv/2HM2+6
 Xf2L5KuCTzm5t6pH/5y3hyfzqMXBXfWTnFkfNP7k71lqwTV/deQuY8aGWRtcXty6WRr7M/nGp8j
 XGzycq7b6fv0SLGq1Q+BffNIiL6PZlgGu93eLnl+uub1mwh1xAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

In order to create a CMA dma-buf heap instance for each CMA heap region
in the system, we need to collect all of them during boot.

They are created from two main sources: the reserved-memory regions in
the device tree, and the default CMA region created from the
configuration or command line parameters, if no default region is
provided in the device tree.

Let's collect all the device-tree defined CMA regions flagged as
reusable.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 kernel/dma/contiguous.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 8df0dfaaca18eeb0a20145512ba64425d2e7601e..e81982c0ee8f5c0654731adb611df4bcc4637c7c 100644
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
@@ -490,9 +491,13 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
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
2.50.1



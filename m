Return-Path: <linux-media+bounces-11475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D36A8C659C
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 13:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4FABB21032
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 11:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6371E74E25;
	Wed, 15 May 2024 11:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YQumIjZ0"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53BD679E5;
	Wed, 15 May 2024 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715772265; cv=none; b=lZHgSf2fHfkCbaG51FnYdD3xftym9hZaMGlapN5+gvJOlkfo6m68y5dLiTZ+f9yJYjPQtThja2Wb86LMIsTvIzui+RreKb7+J1iLLWQLFDO6x4PV2crIQudDzmnN9SUxBjPkG4V6xdZhQv2n5JZwcGQlKip5aRuMZrm4H4WZerM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715772265; c=relaxed/simple;
	bh=7E6HAaHJNAoVbqGEt0CMrklDGWnVfVbWjDJ88RU5lng=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=INdgdxYD2Xwf9tXwXd1zgtWGXCmEwnxvW/zgqjJT9uwWppjCwjczlW1pm3WPTWeO+5yQQQm1Y9SaBUppUoRuc18/Fu9ZMBOqSq/lB5mNfcHt7IU4DuPtOoLbQE5t7EdhYjLs2DrIaSGbMETBr1xI9sqQ4uHudkaEYTwPTQdejR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YQumIjZ0; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ac07659012ad11ef8065b7b53f7091ad-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZycDoRHgb8vgKtLcfR6fMPIQ0VmfmuEndvjkm4NBacY=;
	b=YQumIjZ0JAVO8qn/33BLnP5zXL69v/+5pTNJT6SBFznnYhIYTlLvN3k9Dg+hpv5uDhffkSGZEA25FZfNy8632L4V2lfyFbohpkmunXL/xM8d+MpZDlUCS+BkY8He5iQ7W/7Al78gvZrpQzT0p8aCUZ7BUzTbqmEMsukc8/YdjCo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:1da434e8-e559-4b4a-a9e3-4b640effa333,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:e5776387-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ac07659012ad11ef8065b7b53f7091ad-20240515
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 176114905; Wed, 15 May 2024 19:24:19 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 19:24:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 19:24:16 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <christian.koenig@amd.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Andrew Morton <akpm@linux-foundation.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
	<tjmercier@google.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Vijayanand Jitta <quic_vjitta@quicinc.com>, Joakim Bech
	<joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, Pavel
 Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen
	<ppaalanen@gmail.com>, <willy@infradead.org>, Logan Gunthorpe
	<logang@deltatee.com>, Daniel Vetter <daniel@ffwll.ch>,
	<jianjiao.zeng@mediatek.com>, <kuohong.wang@mediatek.com>,
	<youlin.pei@mediatek.com>
Subject: [PATCH v5 4/9] dma-buf: heaps: Initialize a restricted heap
Date: Wed, 15 May 2024 19:23:03 +0800
Message-ID: <20240515112308.10171-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515112308.10171-1-yong.wu@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Initialize a restricted heap. Currently just add a null heap, Prepare for
the later patches.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/Kconfig           |  9 ++++
 drivers/dma-buf/heaps/Makefile          |  3 +-
 drivers/dma-buf/heaps/restricted_heap.c | 67 +++++++++++++++++++++++++
 drivers/dma-buf/heaps/restricted_heap.h | 22 ++++++++
 4 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 drivers/dma-buf/heaps/restricted_heap.c
 create mode 100644 drivers/dma-buf/heaps/restricted_heap.h

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..e54506f480ea 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,12 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_RESTRICTED
+	bool "DMA-BUF Restricted Heap"
+	depends on DMABUF_HEAPS
+	help
+	  Choose this option to enable dma-buf restricted heap. The purpose of this
+	  heap is to manage buffers that are inaccessible to the kernel and user space.
+	  There may be several ways to restrict it, for example it may be encrypted or
+	  protected by a TEE or hypervisor. If in doubt, say N.
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 974467791032..a2437c1817e2 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
+obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)	+= restricted_heap.o
+obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
new file mode 100644
index 000000000000..c2ae19ba7d7e
--- /dev/null
+++ b/drivers/dma-buf/heaps/restricted_heap.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DMABUF restricted heap exporter
+ *
+ * Copyright (C) 2024 MediaTek Inc.
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+
+#include "restricted_heap.h"
+
+static struct dma_buf *
+restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
+			 unsigned long fd_flags, unsigned long heap_flags)
+{
+	struct restricted_buffer *restricted_buf;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct dma_buf *dmabuf;
+	int ret;
+
+	restricted_buf = kzalloc(sizeof(*restricted_buf), GFP_KERNEL);
+	if (!restricted_buf)
+		return ERR_PTR(-ENOMEM);
+
+	restricted_buf->size = ALIGN(size, PAGE_SIZE);
+	restricted_buf->heap = heap;
+
+	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.size = restricted_buf->size;
+	exp_info.flags = fd_flags;
+	exp_info.priv = restricted_buf;
+
+	dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto err_free_buf;
+	}
+
+	return dmabuf;
+
+err_free_buf:
+	kfree(restricted_buf);
+	return ERR_PTR(ret);
+}
+
+static const struct dma_heap_ops rheap_ops = {
+	.allocate = restricted_heap_allocate,
+};
+
+int restricted_heap_add(struct restricted_heap *rheap)
+{
+	struct dma_heap_export_info exp_info;
+	struct dma_heap *heap;
+
+	exp_info.name = rheap->name;
+	exp_info.ops = &rheap_ops;
+	exp_info.priv = (void *)rheap;
+
+	heap = dma_heap_add(&exp_info);
+	if (IS_ERR(heap))
+		return PTR_ERR(heap);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(restricted_heap_add);
diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
new file mode 100644
index 000000000000..b448f77616ac
--- /dev/null
+++ b/drivers/dma-buf/heaps/restricted_heap.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Restricted heap Header.
+ *
+ * Copyright (C) 2024 MediaTek, Inc.
+ */
+
+#ifndef _DMABUF_RESTRICTED_HEAP_H_
+#define _DMABUF_RESTRICTED_HEAP_H_
+
+struct restricted_buffer {
+	struct dma_heap		*heap;
+	size_t			size;
+};
+
+struct restricted_heap {
+	const char		*name;
+};
+
+int restricted_heap_add(struct restricted_heap *rheap);
+
+#endif
-- 
2.25.1



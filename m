Return-Path: <linux-media+bounces-17213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA429965806
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 09:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60D9F1F23047
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 07:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A58D1667C2;
	Fri, 30 Aug 2024 07:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MB8koRi2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C863A15FD08
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 07:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725001486; cv=none; b=ZQAz9j6vm95ELmd3dQYzOKPAr5Nvog4IEnb4AgOIfA88areovnwMDQvXkn0UDnSJztM0Axi7Dh91LSLxZthhLk1Ud5fsyVM4r0HIQF1Q88zwDx9ZKfUOdYIw71kAw9/ABas/Nt7gAVZC6+uhgCabswEUhM6PKKzJkd3jKGZRCeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725001486; c=relaxed/simple;
	bh=kI/UXHauiF8++61m2LvIvOun+fgX4sFxPktQctCIRkA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l47HF3ww5C14cRe+IEDDuQ0eYFQAvBR/nqjBqY83AoFM+m38BjpjxN2eHsIHWExyLVZnKC8Nxo/bmjUCt3FnTTIrCRQ4yC5T1nt+R/rZ1C2COx8H5sRAkh153iLLz65h1t/C6ljfeaPIDnQCgazPZ+p1RiS1OLR/u0X+FXAwSXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MB8koRi2; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8682bb5e79so186791666b.2
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 00:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725001483; x=1725606283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tldNdGEbq2JT8UwGW+1a5h0B/fw6VCiuTMNVKqNaJKU=;
        b=MB8koRi26jgg1r2oCnPajH5326DFHXf6ekjG33sJyJbokGUD/dlWT/LUAJE3blR7aW
         BKSeoGOlD+Ybt2sqZn7Gl9SMPhLf18sxiQh97kTbFbcWRNdzMNcGSfmQOFRcWZrMcDLP
         QhXn6WohxlmNILoGuRbMdQ5zWevR4sDqOK2ah4c1iadOkkFZ3ds6v1QhwdTb1KyPUxvU
         Rwr8hbIiofzcCIiKOqNXlzDHQo26J8mRvH/1tQeLIPJIoII4GGk3CRuYPxsgwuw56VtV
         U05P/YdTapl4vMftTpVO5zogAVeixol16FZ/YPNoHIoRflyIBcWclxlKprcEsjvztaC1
         o8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725001483; x=1725606283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tldNdGEbq2JT8UwGW+1a5h0B/fw6VCiuTMNVKqNaJKU=;
        b=egF6mb8SYSRpfKW0jxcFCWeGjy/VzHkGu4/SMR9oiryriRRTVBqZhoPLMF+Byy68Fq
         dVAYXeHMmHgDNSQKlvX2fQBWSOkdIoO/LVjNtghli82ocGsauNLUpM54MrV/B1OjZOTR
         wcUs+/PADpYS+SK/xXAYpxeZ1UwPAGyLmKRwLyN0DIfi+00sDm/1Jqw9i/vP5iM0qXzq
         TsFpsWbQpInUh8UZcwSYtTAdbDx7xzRAU8gm8CSp69DNAFDr6GLnrZAIdH8pVMSZjvpp
         aVSrnCZFg4jqv9hnlxjc4WDV+KfLgUYdWUI8edIX91yEp7S8keE60lun53CbLpZ3NJrD
         i9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCU2IdJHD737ogLad7B0ZabTAobxb6P4WjUQvftSG3k1gpBxZ8gAX5jMVjj3MXgcBbVDIe3XlvuXcxaM3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMGTJZu7whaZD1udrKMW5LXS8t2bFDeQFyrJEMlS4PJ0sWhUc6
	X5Tzl7IYbhmhK396WeFW9xixbwOzjDAeT6Z8lKGF2GK6qxPCgTXQCGcNYlhzDI4=
X-Google-Smtp-Source: AGHT+IEjl8tdNQ8jnRsKsySyLyIRKzAgwSRLlK6Mh9bwxDbOAC7WmuH6DFlPs4IQfyp+DQUGhLPnww==
X-Received: by 2002:a17:907:2d25:b0:a86:80a8:cee7 with SMTP id a640c23a62f3a-a897f836ce9mr393312366b.27.1725001482962;
        Fri, 30 Aug 2024 00:04:42 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89892232c7sm178026866b.222.2024.08.30.00.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:04:42 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [RFC PATCH 4/4] dma-buf: heaps: add Linaro restricted dmabuf heap support
Date: Fri, 30 Aug 2024 09:03:51 +0200
Message-Id: <20240830070351.2855919-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830070351.2855919-1-jens.wiklander@linaro.org>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Linaro restricted heap using the linaro,restricted-heap bindings
implemented based on the generic restricted heap.

The bindings defines a range of physical restricted memory. The heap
manages this address range using genalloc. The allocated dma-buf file
descriptor can later be registered with the TEE subsystem for later use
via Trusted Applications in the secure world.

Co-developed-by: Olivier Masse <olivier.masse@nxp.com>
Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/dma-buf/heaps/Kconfig                 |  10 ++
 drivers/dma-buf/heaps/Makefile                |   1 +
 .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
 3 files changed, 176 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 58903bc62ac8..82e2c5d09242 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -28,3 +28,13 @@ config DMABUF_HEAPS_RESTRICTED_MTK
 	help
 	  Enable restricted dma-buf heaps for MediaTek platform. This heap is backed by
 	  TEE client interfaces. If in doubt, say N.
+
+config DMABUF_HEAPS_RESTRICTED_LINARO
+	bool "Linaro DMA-BUF Restricted Heap"
+	depends on DMABUF_HEAPS_RESTRICTED
+	help
+	  Choose this option to enable the Linaro restricted dma-buf heap.
+	  The restricted heap pools are defined according to the DT. Heaps
+	  are allocated in the pools using gen allocater.
+	  If in doubt, say N.
+
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 0028aa9d875f..66b2f67c47b5 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -2,4 +2,5 @@
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)	+= restricted_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)	+= restricted_heap_mtk.o
+obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_LINARO)	+= restricted_heap_linaro.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
diff --git a/drivers/dma-buf/heaps/restricted_heap_linaro.c b/drivers/dma-buf/heaps/restricted_heap_linaro.c
new file mode 100644
index 000000000000..4b08ed514023
--- /dev/null
+++ b/drivers/dma-buf/heaps/restricted_heap_linaro.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DMABUF secure heap exporter
+ *
+ * Copyright 2021 NXP.
+ * Copyright 2024 Linaro Limited.
+ */
+
+#define pr_fmt(fmt)     "rheap_linaro: " fmt
+
+#include <linux/dma-buf.h>
+#include <linux/err.h>
+#include <linux/genalloc.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+
+#include "restricted_heap.h"
+
+#define MAX_HEAP_COUNT	2
+#define HEAP_NAME_LEN	32
+
+struct resmem_restricted {
+	phys_addr_t base;
+	phys_addr_t size;
+
+	char name[HEAP_NAME_LEN];
+
+	bool no_map;
+};
+
+static struct resmem_restricted restricted_data[MAX_HEAP_COUNT] = {0};
+static unsigned int restricted_data_count;
+
+static int linaro_restricted_memory_allocate(struct restricted_heap *heap,
+					     struct restricted_buffer *buf)
+{
+	struct gen_pool *pool = heap->priv_data;
+	unsigned long pa;
+	int ret;
+
+	buf->size = ALIGN(buf->size, PAGE_SIZE);
+	pa = gen_pool_alloc(pool, buf->size);
+	if (!pa)
+		return -ENOMEM;
+
+	ret = sg_alloc_table(&buf->sg_table, 1, GFP_KERNEL);
+	if (ret) {
+		gen_pool_free(pool, pa, buf->size);
+		return ret;
+	}
+
+	sg_set_page(buf->sg_table.sgl, phys_to_page(pa), buf->size, 0);
+
+	return 0;
+}
+
+static void linaro_restricted_memory_free(struct restricted_heap *heap,
+					  struct restricted_buffer *buf)
+{
+	struct gen_pool *pool = heap->priv_data;
+	struct scatterlist *sg;
+	unsigned int i;
+
+	for_each_sg(buf->sg_table.sgl, sg, buf->sg_table.nents, i)
+		gen_pool_free(pool, page_to_phys(sg_page(sg)), sg->length);
+	sg_free_table(&buf->sg_table);
+}
+
+static const struct restricted_heap_ops linaro_restricted_heap_ops = {
+	.alloc = linaro_restricted_memory_allocate,
+	.free = linaro_restricted_memory_free,
+};
+
+static int add_heap(struct resmem_restricted *mem)
+{
+	struct restricted_heap *heap;
+	struct gen_pool *pool;
+	int ret;
+
+	if (mem->base == 0 || mem->size == 0) {
+		pr_err("restricted_data base or size is not correct\n");
+		return -EINVAL;
+	}
+
+	heap = kzalloc(sizeof(*heap), GFP_KERNEL);
+	if (!heap)
+		return -ENOMEM;
+
+	pool = gen_pool_create(PAGE_SHIFT, -1);
+	if (!pool) {
+		ret = -ENOMEM;
+		goto err_free_heap;
+	}
+
+	ret = gen_pool_add(pool, mem->base, mem->size, -1);
+	if (ret)
+		goto err_free_pool;
+
+	heap->no_map = mem->no_map;
+	heap->priv_data = pool;
+	heap->name = mem->name;
+	heap->ops = &linaro_restricted_heap_ops;
+
+	ret = restricted_heap_add(heap);
+	if (ret)
+		goto err_free_pool;
+
+	return 0;
+
+err_free_pool:
+	gen_pool_destroy(pool);
+err_free_heap:
+	kfree(heap);
+
+	return ret;
+}
+
+static int __init rmem_restricted_heap_setup(struct reserved_mem *rmem)
+{
+	size_t len = HEAP_NAME_LEN;
+	const char *s;
+	bool no_map;
+
+	if (WARN_ONCE(restricted_data_count >= MAX_HEAP_COUNT,
+		      "Cannot handle more than %u restricted heaps\n",
+		      MAX_HEAP_COUNT))
+		return -EINVAL;
+
+	no_map = of_get_flat_dt_prop(rmem->fdt_node, "no-map", NULL);
+	s = strchr(rmem->name, '@');
+	if (s)
+		len = umin(s - rmem->name + 1, len);
+
+	restricted_data[restricted_data_count].base = rmem->base;
+	restricted_data[restricted_data_count].size = rmem->size;
+	restricted_data[restricted_data_count].no_map = no_map;
+	strscpy(restricted_data[restricted_data_count].name, rmem->name, len);
+
+	restricted_data_count++;
+	return 0;
+}
+
+RESERVEDMEM_OF_DECLARE(linaro_restricted_heap, "linaro,restricted-heap",
+		       rmem_restricted_heap_setup);
+
+static int linaro_restricted_heap_init(void)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < restricted_data_count; i++) {
+		ret = add_heap(&restricted_data[i]);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+module_init(linaro_restricted_heap_init);
+MODULE_DESCRIPTION("Linaro Restricted Heap Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1



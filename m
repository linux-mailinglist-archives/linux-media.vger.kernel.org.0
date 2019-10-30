Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E70D1EA4C2
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 21:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfJ3Uaj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 16:30:39 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:36229 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbfJ3Uai (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 16:30:38 -0400
Received: by mail-yb1-f196.google.com with SMTP id c13so1468294ybq.3
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2019 13:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PkjdSrZ3E9zkQ9Ztn0Eu35FRE4gi9xnr1qako38BwjY=;
        b=bXWhFOKqFT4ecf1J8QwN8+Y/njrkZZAOULWzlmxqAyVEHq64jDkc3QDGlsqaqOTJxA
         RU6bJ3xXxaOnBsZhKwKaPxlRqNJTjXabdzjvYZZ9QVlOQIcKXPBeFNLcaMsBRWQjLuTS
         6pcTPLkuxNOgDV/5Sqxo7LHJ4Z1i0Z9P+EjQV1auh6+Pv3PQQqr2/HyA2eA7oKddotjj
         bn/XKr8hUdve6/9EQJ+I0PXOG4Y0xKkaVOsU6IZs0CBjBrmRf5+zjvNAFSdFXRKTmFNt
         w44k1rACUIKYxsoccnnr6GjrNe2tKV0R07MwGRgw52AFaVL8e8ezL4ZS8Z5A82i+eGQk
         EmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PkjdSrZ3E9zkQ9Ztn0Eu35FRE4gi9xnr1qako38BwjY=;
        b=PCpNISgGwWwfIJwOABi0In24T0Yr2igrhTpUBnE1471KNo4+CWZhqgpfcuqrAW/MkP
         ngnKyZoQq9ZXGDDGhkTN+vEXQV7zBkWPJKlMZ5H+fST0nhGK0XfgxBzfrFVvHBeDCba2
         b+Y6iZFTRukCfOJt2MfqFD99C3nuOyWoVhRMiWfY/Enrfm7+0v7XaxYsZgm066rFUlhT
         sr8rD7eP4JhWa8dNHJ4t9co7vmtkCJFCil6/ZURZjkZRSzuHh+RNZgSwxRPLLxRgBJWw
         z+f+LGoDTHwqYvpIkQL2euN3+xQZegZGV4kgJzAPocnuoyH0yumEFlshSoENA9cveiRO
         Rr6Q==
X-Gm-Message-State: APjAAAV8Pcet7ov/kMFuZ1oivLfj33P7Gcwa0zxp2vYqNSAS/0Jf3ez9
        XLScnc0FEHvuyPJaGmcNZAZAZg==
X-Google-Smtp-Source: APXvYqwxPm0bXgofifeJ0R7QvHZxz1P4sKd8T9IX39XjcztKk7AvxE3dV6X4teUseQWhwbXc6Z9NGw==
X-Received: by 2002:a25:868c:: with SMTP id z12mr960656ybk.441.1572467437614;
        Wed, 30 Oct 2019 13:30:37 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id h35sm416432ywk.63.2019.10.30.13.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 13:30:37 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Laura Abbott <labbott@redhat.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Pratik Patel <pratikp@codeaurora.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Vincent Donnefort <Vincent.Donnefort@arm.com>,
        Sudipto Paul <Sudipto.Paul@arm.com>,
        "Andrew F . Davis" <afd@ti.com>,
        Christoph Hellwig <hch@infradead.org>,
        Chenbo Feng <fengc@google.com>,
        Alistair Strachan <astrachan@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Hillf Danton <hdanton@sina.com>,
        Brian Starkey <brian.starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Sean Paul <sean@poorly.run>
Subject: [PATCH 3/5] Revert "dma-buf: heaps: Add system heap to dmabuf heaps"
Date:   Wed, 30 Oct 2019 16:29:52 -0400
Message-Id: <20191030203003.101156-4-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191030203003.101156-1-sean@poorly.run>
References: <20191030203003.101156-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This reverts commit 47a32f9c12266d450b92089148c6039591bd9909.

This patchset doesn't meet the UAPI requirements set out in [1] for the DRM
subsystem. Once the userspace component is reviewed and ready for merge
we can try again.

[1]- https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

Fixes: 47a32f9c1226 ("dma-buf: heaps: Add system heap to dmabuf heaps")
Cc: Laura Abbott <labbott@redhat.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Pratik Patel <pratikp@codeaurora.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Vincent Donnefort <Vincent.Donnefort@arm.com>
Cc: Sudipto Paul <Sudipto.Paul@arm.com>
Cc: Andrew F. Davis <afd@ti.com>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Chenbo Feng <fengc@google.com>
Cc: Alistair Strachan <astrachan@google.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Hillf Danton <hdanton@sina.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Sean Paul <sean@poorly.run>
---
 drivers/dma-buf/Kconfig             |   2 -
 drivers/dma-buf/heaps/Kconfig       |   6 --
 drivers/dma-buf/heaps/Makefile      |   1 -
 drivers/dma-buf/heaps/system_heap.c | 124 ----------------------------
 4 files changed, 133 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/Kconfig
 delete mode 100644 drivers/dma-buf/heaps/system_heap.c

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 0613bb7770f5..bffa58fc3e6e 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -53,6 +53,4 @@ menuconfig DMABUF_HEAPS
 	  allows userspace to allocate dma-bufs that can be shared
 	  between drivers.
 
-source "drivers/dma-buf/heaps/Kconfig"
-
 endmenu
diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
deleted file mode 100644
index 205052744169..000000000000
--- a/drivers/dma-buf/heaps/Kconfig
+++ /dev/null
@@ -1,6 +0,0 @@
-config DMABUF_HEAPS_SYSTEM
-	bool "DMA-BUF System Heap"
-	depends on DMABUF_HEAPS
-	help
-	  Choose this option to enable the system dmabuf heap. The system heap
-	  is backed by pages from the buddy allocator. If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index d1808eca2581..de49898112db 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y					+= heap-helpers.o
-obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
deleted file mode 100644
index 455782efbb32..000000000000
--- a/drivers/dma-buf/heaps/system_heap.c
+++ /dev/null
@@ -1,124 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * DMABUF System heap exporter
- *
- * Copyright (C) 2011 Google, Inc.
- * Copyright (C) 2019 Linaro Ltd.
- */
-
-#include <linux/dma-buf.h>
-#include <linux/dma-mapping.h>
-#include <linux/dma-heap.h>
-#include <linux/err.h>
-#include <linux/highmem.h>
-#include <linux/mm.h>
-#include <linux/module.h>
-#include <linux/scatterlist.h>
-#include <linux/slab.h>
-#include <linux/sched/signal.h>
-#include <asm/page.h>
-
-#include "heap-helpers.h"
-
-struct dma_heap *sys_heap;
-
-static void system_heap_free(struct heap_helper_buffer *buffer)
-{
-	pgoff_t pg;
-
-	for (pg = 0; pg < buffer->pagecount; pg++)
-		__free_page(buffer->pages[pg]);
-	kfree(buffer->pages);
-	kfree(buffer);
-}
-
-static int system_heap_allocate(struct dma_heap *heap,
-				unsigned long len,
-				unsigned long fd_flags,
-				unsigned long heap_flags)
-{
-	struct heap_helper_buffer *helper_buffer;
-	struct dma_buf *dmabuf;
-	int ret = -ENOMEM;
-	pgoff_t pg;
-
-	helper_buffer = kzalloc(sizeof(*helper_buffer), GFP_KERNEL);
-	if (!helper_buffer)
-		return -ENOMEM;
-
-	init_heap_helper_buffer(helper_buffer, system_heap_free);
-	helper_buffer->flags = heap_flags;
-	helper_buffer->heap = heap;
-	helper_buffer->size = len;
-
-	helper_buffer->pagecount = len / PAGE_SIZE;
-	helper_buffer->pages = kmalloc_array(helper_buffer->pagecount,
-					     sizeof(*helper_buffer->pages),
-					     GFP_KERNEL);
-	if (!helper_buffer->pages) {
-		ret = -ENOMEM;
-		goto err0;
-	}
-
-	for (pg = 0; pg < helper_buffer->pagecount; pg++) {
-		/*
-		 * Avoid trying to allocate memory if the process
-		 * has been killed by by SIGKILL
-		 */
-		if (fatal_signal_pending(current))
-			goto err1;
-
-		helper_buffer->pages[pg] = alloc_page(GFP_KERNEL | __GFP_ZERO);
-		if (!helper_buffer->pages[pg])
-			goto err1;
-	}
-
-	/* create the dmabuf */
-	dmabuf = heap_helper_export_dmabuf(helper_buffer, fd_flags);
-	if (IS_ERR(dmabuf)) {
-		ret = PTR_ERR(dmabuf);
-		goto err1;
-	}
-
-	helper_buffer->dmabuf = dmabuf;
-
-	ret = dma_buf_fd(dmabuf, fd_flags);
-	if (ret < 0) {
-		dma_buf_put(dmabuf);
-		/* just return, as put will call release and that will free */
-		return ret;
-	}
-
-	return ret;
-
-err1:
-	while (pg > 0)
-		__free_page(helper_buffer->pages[--pg]);
-	kfree(helper_buffer->pages);
-err0:
-	kfree(helper_buffer);
-
-	return -ENOMEM;
-}
-
-static const struct dma_heap_ops system_heap_ops = {
-	.allocate = system_heap_allocate,
-};
-
-static int system_heap_create(void)
-{
-	struct dma_heap_export_info exp_info;
-	int ret = 0;
-
-	exp_info.name = "system_heap";
-	exp_info.ops = &system_heap_ops;
-	exp_info.priv = NULL;
-
-	sys_heap = dma_heap_add(&exp_info);
-	if (IS_ERR(sys_heap))
-		ret = PTR_ERR(sys_heap);
-
-	return ret;
-}
-module_init(system_heap_create);
-MODULE_LICENSE("GPL v2");
-- 
Sean Paul, Software Engineer, Google / Chromium OS


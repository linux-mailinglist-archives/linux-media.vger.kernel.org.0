Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32BB1244B33
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 16:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbgHNOZa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 10:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgHNOZ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 10:25:29 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB39C061384
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 07:25:27 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E1C3329A5C9
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH] dma-buf: heap-helpers: Set dma-buf exporter name
Date:   Fri, 14 Aug 2020 11:25:16 -0300
Message-Id: <20200814142516.148934-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the heap helper uses DEFINE_DMA_BUF_EXPORT_INFO,
which uses KBUILD_MODNAME for the dma_buf_export_info.exp_name.

This effectively makes all dma-bufs exported by the heap
helper as coming from "heap-helpers", instead of the actual heap name
(cma, system, etc).

Fix this by adding a dma-heap name getter, and then setting
dma_buf_export_info.exp_name.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/dma-buf/dma-heap.c           | 5 +++++
 drivers/dma-buf/heaps/heap-helpers.c | 1 +
 include/linux/dma-heap.h             | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index afd22c9dbdcf..13d001ee381a 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -190,6 +190,11 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 	return heap->priv;
 }
 
+const char *dma_heap_get_name(struct dma_heap *heap)
+{
+	return heap->name;
+}
+
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
 	struct dma_heap *heap, *h, *err_ret;
diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
index 9f964ca3f59c..47ecf9518442 100644
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ b/drivers/dma-buf/heaps/heap-helpers.c
@@ -30,6 +30,7 @@ struct dma_buf *heap_helper_export_dmabuf(struct heap_helper_buffer *buffer,
 {
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 
+	exp_info.exp_name = dma_heap_get_name(buffer->heap);
 	exp_info.ops = &heap_helper_ops;
 	exp_info.size = buffer->size;
 	exp_info.flags = fd_flags;
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 454e354d1ffb..0acf7e71afb5 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -50,6 +50,8 @@ struct dma_heap_export_info {
  */
 void *dma_heap_get_drvdata(struct dma_heap *heap);
 
+const char *dma_heap_get_name(struct dma_heap *heap);
+
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
  * @exp_info:		information needed to register this heap
-- 
2.27.0


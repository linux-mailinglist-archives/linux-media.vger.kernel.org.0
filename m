Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A73C2CAA32
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 18:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389778AbgLARwh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 12:52:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731128AbgLARwh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 12:52:37 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D8CC0617A6;
        Tue,  1 Dec 2020 09:51:57 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w6so1610518pfu.1;
        Tue, 01 Dec 2020 09:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4zRLtJ0Q5wi/JJXSMnqzlxIlA9XB0kWpvTg/hxCouGQ=;
        b=Cc5oZnGf3sYZSv66LApJ0Hgee277p8MonRA3s85p2F4XlF/n+VuGbl8fU1lW2bHbjK
         VFN0bZnO7OxxcK23RWuO/DPEq3TRvvtTcqhdlvHY2d4aNv295MZTZ7bP0WiGEjaTnNST
         6dwK8wsxn5QoaHaqieK4GfYhbB6bKqHjaUnaNae7j8jIQJPFdW8cgPhBmCGdDlfGyWgB
         HkfsElLLP4bC+N3AQ7lBXPcGyLrKAmGUW5mJNOipjvY+6tty6wHAQ2pHxv8sdAjSNCuL
         9s4EOkHKhk/10a9sYS4fOVfuSjatOufSFolSqFs5bDdbIaHPy588RglVWiRtg6LK+UyI
         dtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=4zRLtJ0Q5wi/JJXSMnqzlxIlA9XB0kWpvTg/hxCouGQ=;
        b=Vo7eKO+3UyvaFK0UyYxEbi5WXgXH5TkXm4S1w8IpuuSSSbG0UUkG9j7ThmgOYiQJnn
         51A5k2OBUw6LGPoZZFqEiGXNdKqkSQBr547j79fCahniOzds0YXsdcMplky0EDCrlUOb
         Sr1H0FnbNLAbXCRBssLCQAHDmgSAXVWUxNka2hMzFaoHvG95It8NFbMnqbCbBFzJD+yf
         nCTIxZ2T1bGSZjb4jZqwDsANBBjXMT1IL/KWUaSCXGCV+DpPf3yF38WLl//KiqfghCzd
         LvZL+YpeuodhA1s0o5nG9ZuysFHrOrtRDGzNKge2CivWuZ8eAfYeTrEOWAiHjV2VRI8H
         UC8Q==
X-Gm-Message-State: AOAM530H1THXiW9K1mVe/L4wjin3H7mZHQdRirw3jIR6/tFZFaUvZodx
        Nw15sIGKgY4P2QiEHvC0jE4=
X-Google-Smtp-Source: ABdhPJzGe4cpt+aeqFv9FnQFMR/FJjDiGsrboHIU1DKsNNU7bUw3lkcdAv3MMGBbgCOWuQDUV/UPeQ==
X-Received: by 2002:a63:fb42:: with SMTP id w2mr3229528pgj.354.1606845116922;
        Tue, 01 Dec 2020 09:51:56 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id q23sm390082pfg.192.2020.12.01.09.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 09:51:55 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        hyesoo.yu@samsung.com, willy@infradead.org, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        sumit.semwal@linaro.org, john.stultz@linaro.org,
        Brian.Starkey@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
        Minchan Kim <minchan@kernel.org>
Subject: [PATCH v2 3/4] dma-buf: add export symbol for dma-heap
Date:   Tue,  1 Dec 2020 09:51:43 -0800
Message-Id: <20201201175144.3996569-4-minchan@kernel.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201201175144.3996569-1-minchan@kernel.org>
References: <20201201175144.3996569-1-minchan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hyesoo Yu <hyesoo.yu@samsung.com>

The heaps could be added as module, so some functions should
be exported to register dma-heaps. And dma-heap of module can use
cma area to allocate and free. However the function related cma
is not exported now. Let's export them for next patches.

Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 drivers/dma-buf/dma-heap.c | 2 ++
 kernel/dma/contiguous.c    | 1 +
 mm/cma.c                   | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index afd22c9dbdcf..cc6339cbca09 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -189,6 +189,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL_GPL(dma_heap_get_drvdata);
 
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
@@ -272,6 +273,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL_GPL(dma_heap_add);
 
 static char *dma_heap_devnode(struct device *dev, umode_t *mode)
 {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 3d63d91cba5c..7e9777119b29 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -58,6 +58,7 @@
 #endif
 
 struct cma *dma_contiguous_default_area;
+EXPORT_SYMBOL_GPL(dma_contiguous_default_area);
 
 /*
  * Default global CMA area size can be defined in kernel's .config.
diff --git a/mm/cma.c b/mm/cma.c
index 4459045fa717..d39cb7066b9e 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -33,6 +33,7 @@
 #include <linux/io.h>
 #include <linux/kmemleak.h>
 #include <linux/swap.h>
+#include <linux/module.h>
 #include <trace/events/cma.h>
 
 #include "cma.h"
@@ -54,6 +55,7 @@ const char *cma_get_name(const struct cma *cma)
 {
 	return cma->name;
 }
+EXPORT_SYMBOL_GPL(cma_get_name);
 
 static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
 					     unsigned int align_order)
@@ -499,6 +501,7 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 	pr_debug("%s(): returned %p\n", __func__, page);
 	return page;
 }
+EXPORT_SYMBOL_GPL(cma_alloc);
 
 /*
  * cma_alloc_bulk() - allocate high order bulk pages from contiguous area with
@@ -609,6 +612,7 @@ int cma_alloc_bulk(struct cma *cma, unsigned int align, bool fast,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(cma_alloc_bulk);
 
 /**
  * cma_release() - release allocated pages
@@ -642,6 +646,7 @@ bool cma_release(struct cma *cma, const struct page *pages, unsigned int count)
 
 	return true;
 }
+EXPORT_SYMBOL_GPL(cma_release);
 
 int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data)
 {
-- 
2.29.2.454.gaff20da3a2-goog


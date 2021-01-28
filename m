Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7995A306D95
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 07:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhA1GWy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 01:22:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbhA1GWg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 01:22:36 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F10C0613D6
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 22:21:56 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id 11so3346067pfu.4
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 22:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yF9oYLwsZ1KojzzdMIJNFHTIF6r0NLzbmizzA10msek=;
        b=hsKEFCeDBPBnnkjBCVVbIShSoY9OmkyTebKHBfnRXysY8Aciy3zWs6gv4DGrah5AUR
         Kgk8GtE3VPMyZIfJC9GLOdFwr3cweevE95L8zAHI7w4jMh4XLM4INu6IyB+g+HJLBlmF
         2VWmU9oDGSV48vRWYea9wgobgBN6PblZwrnvU08P8TWMIYyx2gE9KhZdeMIyUI6XERvf
         j4dM1keHxZSwBKHwQUvhgDpo6Knar8Q2d9DayeTfN08fkaezIs8XMJVj3etyG/QRb8sf
         DgbmVmJeCKRP5RLfjnoXiQHvZ6grT/ji6IS60unxI8Gt4+3+IQANaXu07ZV5fCkrWKq1
         bLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yF9oYLwsZ1KojzzdMIJNFHTIF6r0NLzbmizzA10msek=;
        b=icZlID/t+Gd53GT+uFw9VyDltT3CpegmrC0UdDKyVleXs+6LvWNY0ez/wIMBQpv/G1
         2wniMLOn5dL7wKaD06ALAIqTv97y9RFJQ0aW+nQi3Xnn539mdwIk1uLRSDvSVwGP9q30
         eWMwxpR31VPyuPkNJOR1/kiFMOa6GY1H8DvodlKOnSh2Qv3DQmQ2V/NBrF+zibfrY+22
         qPcwRb5fhoOUrt6SLreLqbpti6pDAKgsSxtOfhy3n7klKe9JjtCa1izMP+5Y5qKMUfy8
         o6JH62/CWwetVKQYYRVd1mTwnWnXUL1mtzAQN6PQaGH1klS0aRQdCMtmte4+ZxE3h1ya
         xyzw==
X-Gm-Message-State: AOAM5328QywX8MdWlCpLAqIlupUUtFm+yOQBfTJ99FBKlrTeozX3Z2Og
        p+lK/gNMpSI2/+zo8/f5H4gSdg==
X-Google-Smtp-Source: ABdhPJwxi586eEw48AejdKr0BVFHkCaeosEKpbkmcBQcanrMo5ek4fcHdf/tem0eB/as7f/hJ5B26g==
X-Received: by 2002:a63:1220:: with SMTP id h32mr15123978pgl.309.1611814916310;
        Wed, 27 Jan 2021 22:21:56 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id s9sm4477765pfd.38.2021.01.27.22.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 22:21:55 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/3] dma-buf: system_heap: Add deferred freeing to the system heap
Date:   Thu, 28 Jan 2021 06:21:47 +0000
Message-Id: <20210128062147.438413-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128062147.438413-1-john.stultz@linaro.org>
References: <20210128062147.438413-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Utilize the deferred free helper library in the system heap.

This provides a nice performance bump and puts the
system heap performance on par with ION.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2:
* Rework deferred-free api to use reason enum as suggested by
  Suren Baghdasaryan
---
 drivers/dma-buf/heaps/Kconfig       |  1 +
 drivers/dma-buf/heaps/system_heap.c | 32 ++++++++++++++++++++++-------
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 45c7d277448b..2276420ae905 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -6,6 +6,7 @@ config DMABUF_HEAPS_SYSTEM
 	depends on DMABUF_HEAPS
 	select NET
 	select PAGE_POOL
+	select DMABUF_HEAPS_DEFERRED_FREE
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 2addb6d832e0..fe122b5eff10 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -22,6 +22,8 @@
 #include <linux/vmalloc.h>
 #include <net/page_pool.h>
 
+#include "deferred-free-helper.h"
+
 static struct dma_heap *sys_heap;
 
 struct system_heap_buffer {
@@ -32,6 +34,7 @@ struct system_heap_buffer {
 	struct sg_table sg_table;
 	int vmap_cnt;
 	void *vaddr;
+	struct deferred_freelist_item deferred_free;
 };
 
 struct dma_heap_attachment {
@@ -301,30 +304,45 @@ static int system_heap_zero_buffer(struct system_heap_buffer *buffer)
 	return ret;
 }
 
-static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
+static void system_heap_buf_free(struct deferred_freelist_item *item,
+				 enum df_reason reason)
 {
-	struct system_heap_buffer *buffer = dmabuf->priv;
+	struct system_heap_buffer *buffer;
 	struct sg_table *table;
 	struct scatterlist *sg;
 	int i, j;
 
+	buffer = container_of(item, struct system_heap_buffer, deferred_free);
 	/* Zero the buffer pages before adding back to the pool */
-	system_heap_zero_buffer(buffer);
+	if (reason == DF_NORMAL)
+		if (system_heap_zero_buffer(buffer))
+			reason = DF_UNDER_PRESSURE; // On failure, just free
 
 	table = &buffer->sg_table;
 	for_each_sg(table->sgl, sg, table->nents, i) {
 		struct page *page = sg_page(sg);
 
-		for (j = 0; j < NUM_ORDERS; j++) {
-			if (compound_order(page) == orders[j])
-				break;
+		if (reason == DF_UNDER_PRESSURE) {
+			__free_pages(page, compound_order(page));
+		} else {
+			for (j = 0; j < NUM_ORDERS; j++) {
+				if (compound_order(page) == orders[j])
+					break;
+			}
+			page_pool_put_full_page(pools[j], page, false);
 		}
-		page_pool_put_full_page(pools[j], page, false);
 	}
 	sg_free_table(table);
 	kfree(buffer);
 }
 
+static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+
+	deferred_free(&buffer->deferred_free, system_heap_buf_free, buffer->len);
+}
+
 static const struct dma_buf_ops system_heap_buf_ops = {
 	.attach = system_heap_attach,
 	.detach = system_heap_detach,
-- 
2.25.1


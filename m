Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B722BC2C3
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 00:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgKUXuW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Nov 2020 18:50:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgKUXuL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Nov 2020 18:50:11 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB93C0613CF
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2020 15:50:11 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id s63so888386pgc.8
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2020 15:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yyirdj4xk4od70vm2gNFUUioiRcThuFO+Fi23OL2HUI=;
        b=YTsQpAnDUsZVN3fCsYb0tgTgegESCY86fmr83K+gFC+uTH55zkWebtXO6RBK6Txegv
         K12/4kROOwRukR4q3L2K0X/qDpQBfgGmwud40EyKSS1Juiyj6is8rYCeEWs3HQOMd/2G
         AuC4cfgO8ljcpDD7M/cReDK29S3IrSkWQACmgsajwWWWvBvwkTW3ipgGcp0M8nGFzKDY
         R774A1kgAkubeNwumXXRbYvHx8cqHImwTatrbAtaam6HRNa25o2v3dVXFF012GUYHTHF
         6J6m9WFdfl6xNzN/gIxC1s3KEKz8qrFQGQEyio0AmOdkm7VuvSddsiAKwCoYvaUkAAwN
         3Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yyirdj4xk4od70vm2gNFUUioiRcThuFO+Fi23OL2HUI=;
        b=W108/uKt/1l0FRhPZLvZx2v11OSXLa2kc/Yin1/0XqSammj4CAMqmg/++CRwU3tBq+
         RqUet7mP+CjITC+Vi3reXojLDSiwcURf6nqJaUJi0Sg/SfG9tFKh+dfM3JjGfOXaZ7i9
         /D6WA6Oif2BQIMBtD301K7xf3nHEutjYVVXRST4vOO3WyZ3yBXeiQmpXx6uQy1E8142q
         EFGZwdr3e8HAns9+DECsBoaFY1IEySEysKvprCz139eca/lyncAErtrprpueSHjnZElF
         Ez3ZoiUMpbe+HAbnEFco9TGl2JFeNrbRgHja/f8BWarTrTlx1qNB5BQOWqt/kfBCJKQz
         mArw==
X-Gm-Message-State: AOAM53162jeW0+hbLc3aR1yfx7BlDEdZ4swuPJP9gvTbW9xvi+7csl4b
        BQaVbUQzbxUV062uBi3UxkfL2Q==
X-Google-Smtp-Source: ABdhPJzabGiaEvcHswGfvWY3HwZXTWR5RUPiyAvUcDc+XsSgTJFr4pz0CJu21xOj/LbKI7KZuTGBpQ==
X-Received: by 2002:a63:781:: with SMTP id 123mr6883904pgh.358.1606002611441;
        Sat, 21 Nov 2020 15:50:11 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id v126sm7882525pfb.137.2020.11.21.15.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 15:50:10 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v7 4/5] dma-buf: heaps: Skip sync if not mapped
Date:   Sat, 21 Nov 2020 23:50:01 +0000
Message-Id: <20201121235002.69945-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201121235002.69945-1-john.stultz@linaro.org>
References: <20201121235002.69945-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is basically a port of Ørjan Eide's similar patch for ION
 https://lore.kernel.org/lkml/20200414134629.54567-1-orjan.eide@arm.com/

Only sync the sg-list of dma-buf heap attachment when the attachment
is actually mapped on the device.

dma-bufs may be synced at any time. It can be reached from user space
via DMA_BUF_IOCTL_SYNC, so there are no guarantees from callers on when
syncs may be attempted, and dma_buf_end_cpu_access() and
dma_buf_begin_cpu_access() may not be paired.

Since the sg_list's dma_address isn't set up until the buffer is used
on the device, and dma_map_sg() is called on it, the dma_address will be
NULL if sync is attempted on the dma-buf before it's mapped on a device.

Before v5.0 (commit 55897af63091 ("dma-direct: merge swiotlb_dma_ops
into the dma_direct code")) this was a problem as the dma-api (at least
the swiotlb_dma_ops on arm64) would use the potentially invalid
dma_address. How that failed depended on how the device handled physical
address 0. If 0 was a valid address to physical ram, that page would get
flushed a lot, while the actual pages in the buffer would not get synced
correctly. While if 0 is an invalid physical address it may cause a
fault and trigger a crash.

In v5.0 this was incidentally fixed by commit 55897af63091 ("dma-direct:
merge swiotlb_dma_ops into the dma_direct code"), as this moved the
dma-api to use the page pointer in the sg_list, and (for Ion buffers at
least) this will always be valid if the sg_list exists at all.

But, this issue is re-introduced in v5.3 with
commit 449fa54d6815 ("dma-direct: correct the physical addr in
dma_direct_sync_sg_for_cpu/device") moves the dma-api back to the old
behaviour and picks the dma_address that may be invalid.

dma-buf core doesn't ensure that the buffer is mapped on the device, and
thus have a valid sg_list, before calling the exporter's
begin_cpu_access.

Logic and commit message originally by: Ørjan Eide <orjan.eide@arm.com>

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Brian Starkey <brian.starkey@arm.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c    | 10 ++++++++++
 drivers/dma-buf/heaps/system_heap.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 05aaa4f29397..5e7c3436310c 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -43,6 +43,7 @@ struct dma_heap_attachment {
 	struct device *dev;
 	struct sg_table table;
 	struct list_head list;
+	bool mapped;
 };
 
 static int cma_heap_attach(struct dma_buf *dmabuf,
@@ -67,6 +68,7 @@ static int cma_heap_attach(struct dma_buf *dmabuf,
 
 	a->dev = attachment->dev;
 	INIT_LIST_HEAD(&a->list);
+	a->mapped = false;
 
 	attachment->priv = a;
 
@@ -101,6 +103,7 @@ static struct sg_table *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
 	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
 	if (ret)
 		return ERR_PTR(-ENOMEM);
+	a->mapped = true;
 	return table;
 }
 
@@ -108,6 +111,9 @@ static void cma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				   struct sg_table *table,
 				   enum dma_data_direction direction)
 {
+	struct dma_heap_attachment *a = attachment->priv;
+
+	a->mapped = false;
 	dma_unmap_sgtable(attachment->dev, table, direction, 0);
 }
 
@@ -122,6 +128,8 @@ static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 
 	mutex_lock(&buffer->lock);
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
@@ -140,6 +148,8 @@ static int cma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 
 	mutex_lock(&buffer->lock);
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sgtable_for_device(a->dev, &a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index b2d02f50f9ed..32b17a5c8079 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -37,6 +37,7 @@ struct dma_heap_attachment {
 	struct device *dev;
 	struct sg_table *table;
 	struct list_head list;
+	bool mapped;
 };
 
 static struct sg_table *dup_sg_table(struct sg_table *table)
@@ -84,6 +85,7 @@ static int system_heap_attach(struct dma_buf *dmabuf,
 	a->table = table;
 	a->dev = attachment->dev;
 	INIT_LIST_HEAD(&a->list);
+	a->mapped = false;
 
 	attachment->priv = a;
 
@@ -120,6 +122,7 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
 	if (ret)
 		return ERR_PTR(ret);
 
+	a->mapped = true;
 	return table;
 }
 
@@ -127,6 +130,9 @@ static void system_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				      struct sg_table *table,
 				      enum dma_data_direction direction)
 {
+	struct dma_heap_attachment *a = attachment->priv;
+
+	a->mapped = false;
 	dma_unmap_sgtable(attachment->dev, table, direction, 0);
 }
 
@@ -142,6 +148,8 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
 
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
@@ -161,6 +169,8 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
 
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sgtable_for_device(a->dev, a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
-- 
2.17.1


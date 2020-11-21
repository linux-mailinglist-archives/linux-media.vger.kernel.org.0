Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13DB22BBD11
	for <lists+linux-media@lfdr.de>; Sat, 21 Nov 2020 05:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgKUEuH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 23:50:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbgKUEuG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 23:50:06 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C2DC0613CF
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 20:50:06 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 34so9130142pgp.10
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 20:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8/ixTvQ2Zry3DTCO/KoZEMuJmBTKPEtfwzNBsOWjMeg=;
        b=xlZ1IdHnHFgs60OV/DrQAPIpBOgEvNLTm6jmy1ckIJf+cd/nnZGdo88FLHtPv0Cu20
         AhBIou4c8XuzhWUYe9EDB9kG6cXQI3vFgprETVjkuBXALH/fU1668D9lU57dtwkR8+/6
         7TiBM25khO78i/3MnBV6qW84iMcurAueKzm3bU6DfHlyMVQp5XtcLob1wtLeqhMFkyAI
         RTqIA88Xd2y75Es/9d1115o6t8tOmxvzFb5K/P6azp2M9yILYk1VvHsmasBX+Wd7WvC0
         vzrpYG2QdEA67Hd+TF8oyaB7kFcscr/9Mp8iXFETo3WP56YOj6UQnG9jsTZKoIjMIh0c
         7b2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/ixTvQ2Zry3DTCO/KoZEMuJmBTKPEtfwzNBsOWjMeg=;
        b=hHB9jQGYXg08fnf6V7uDuoQpDzt9AKtK8o/LtfW4sQgpS19sCRR9VNMaKMBUOsAL7Q
         VBiA0FDeD983AUtBpc9KKrR7uJDKvTsHZsypWVj5OynFdgYdivABPWqbBONOBYQjG9h6
         RHtxlOT/GuRGXAfhSW/BwF3geSXDhrKJW+vvxHESs9pziayJ4XdtOI+vKyyCEyj90FTm
         uFyAu8q0kiniPwRz8yiMcTtdMJYukvHEoSridB4daepypPbW32UP4ZGzjrCQ3PRcPSWz
         qbYyo71vbofxCMFAMPZYW3RYS2bllE5l3uT1hj0d1Ac9h43roa1Obu4ZgyOMmTY+lJxR
         /MCQ==
X-Gm-Message-State: AOAM530pxepHsk1uka4PxaQilpCvwS+8q7UbMy7MKuUpYaUkU8XoYmMm
        IcJcpT+S2VazA0aONH2T2PbbUQ==
X-Google-Smtp-Source: ABdhPJwkbIJx1k7xwrwwZK1EOfFVXpyarTDc/2XPaSAXtqk+Jnn/+DQIoqGFTNjhmRjDWU1ZphKyhA==
X-Received: by 2002:aa7:8801:0:b029:18b:5878:30d6 with SMTP id c1-20020aa788010000b029018b587830d6mr17144282pfo.77.1605934206209;
        Fri, 20 Nov 2020 20:50:06 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id w196sm5407692pfd.177.2020.11.20.20.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 20:50:05 -0800 (PST)
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
Subject: [PATCH v6 4/5] dma-buf: heaps: Skip sync if not mapped
Date:   Sat, 21 Nov 2020 04:49:54 +0000
Message-Id: <20201121044955.58215-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201121044955.58215-1-john.stultz@linaro.org>
References: <20201121044955.58215-1-john.stultz@linaro.org>
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
index 52459f3e60e2..2b468767a2af 100644
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
index e5f9f964b910..b1a7b355132f 100644
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
 		invalidate_kernel_vmap_range(buffer->map->vaddr, buffer->len);
 
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
@@ -161,6 +169,8 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 		flush_kernel_vmap_range(buffer->map->vaddr, buffer->len);
 
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sgtable_for_device(a->dev, a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
-- 
2.17.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 524002820FA
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 06:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725831AbgJCEDW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 00:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgJCEDO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Oct 2020 00:03:14 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348AFC0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 21:03:12 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id e10so2230125pfj.1
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 21:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/3T6DtyMdgIaqBLXnI/IP8eViK4GR+w936JVTX0oqqo=;
        b=pumPlKkppWyU+6tvZrtcIGLQrPzfL7DZXw2xIEL7N1BD4bqnhs4eXFAUn64o4Nn+nX
         HrWqWdezJ7Iv0l61f5U1GYVetpPGokCd+2dreOx84XOxe9YfzLy6R20suB4EDD27mkjg
         uYJrTDRBihA/lhdcA91c68fBm2ljxvaovtymqyWtTs7sHeTgdwClFfSoXHReGV+pltU3
         a2MU9TcOJDFuAPkf19EV/qr5VqEhwwpu+gtDWnIfFQTNyfbFjlrlBnSfd/qWeJMH99bz
         /B5ab7LGawktkvIzNmXHWHHvnogmlLssMAe/wpRtGOe16eviByyjRE4XlUqcHZocd4X6
         JQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/3T6DtyMdgIaqBLXnI/IP8eViK4GR+w936JVTX0oqqo=;
        b=Xbjcif4KXue5v6N3mCJuDFzacmJxKQ1t8VXRV+pgndxCpDg8BOhsq62W/y7FdzVFCV
         gkzad4nj0wL+nxFvm6dZZuXVauwAGWCla2WSyiPwqBEkWaW6vOhEJbswJg2JSXMBP0J3
         Umc6NNWow3Wkpnheg90PXPCr8Rj0bmA0MqySuPmiMmTxXKiPSxj1ZYR3SKhuuNrp+VKC
         63tffHvW40xoJoDbKWoCwhc+X2E/bsABWC9i81yzzXs1PYNuysQZKRQT9CnbB4D2zdJt
         nxZnnXGP2d1hzpoFWEX1CjSnaBf81bq1cVD1gQbTr1WDh5LZsd2a2jwA0RtkWVIc9GOQ
         xkcQ==
X-Gm-Message-State: AOAM530gmy6fsnlbz9uL58uZ8edjm4/ldKj16AzJ7zrlKlUrJngO+guy
        at91hNxFR8ldZg3Y1CoCqkCESw==
X-Google-Smtp-Source: ABdhPJyC/0wtN9vlme0BdjUqwt1Gpcijj0nApYBm+ZJ5owlf/V7bA8Y3GedcktbkKhwMga2K22EpjQ==
X-Received: by 2002:a63:a70d:: with SMTP id d13mr5033122pgf.65.1601697791699;
        Fri, 02 Oct 2020 21:03:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 190sm3909290pfy.22.2020.10.02.21.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 21:03:11 -0700 (PDT)
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
Subject: [PATCH v3 4/7] dma-buf: heaps: Skip sync if not mapped
Date:   Sat,  3 Oct 2020 04:02:54 +0000
Message-Id: <20201003040257.62768-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201003040257.62768-1-john.stultz@linaro.org>
References: <20201003040257.62768-1-john.stultz@linaro.org>
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
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c    | 10 ++++++++++
 drivers/dma-buf/heaps/system_heap.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 366963b94c72..fece9d7739ae 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -44,6 +44,7 @@ struct dma_heap_attachment {
 	struct device *dev;
 	struct sg_table table;
 	struct list_head list;
+	bool mapped;
 };
 
 static int cma_heap_attach(struct dma_buf *dmabuf,
@@ -68,6 +69,7 @@ static int cma_heap_attach(struct dma_buf *dmabuf,
 
 	a->dev = attachment->dev;
 	INIT_LIST_HEAD(&a->list);
+	a->mapped = false;
 
 	attachment->priv = a;
 
@@ -102,6 +104,7 @@ static struct sg_table *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
 	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
 	if (ret)
 		return ERR_PTR(-ENOMEM);
+	a->mapped = true;
 	return table;
 }
 
@@ -109,6 +112,9 @@ static void cma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				   struct sg_table *table,
 				   enum dma_data_direction direction)
 {
+	struct dma_heap_attachment *a = attachment->priv;
+
+	a->mapped = false;
 	dma_unmap_sgtable(attachment->dev, table, direction, 0);
 }
 
@@ -123,6 +129,8 @@ static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 
 	mutex_lock(&buffer->lock);
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
@@ -141,6 +149,8 @@ static int cma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 
 	mutex_lock(&buffer->lock);
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sgtable_for_device(a->dev, &a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 00ed107b3b76..ef8d47e5a7ff 100644
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


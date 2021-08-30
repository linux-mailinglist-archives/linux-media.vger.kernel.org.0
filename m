Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8B93FB385
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 12:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234178AbhH3KCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 06:02:04 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50626 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229901AbhH3KCD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 06:02:03 -0400
X-UUID: bd3f7cf9dd6f49a9be901ad15ee81456-20210830
X-UUID: bd3f7cf9dd6f49a9be901ad15ee81456-20210830
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <guangming.cao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1520126050; Mon, 30 Aug 2021 18:01:08 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 18:01:07 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas07.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 30 Aug 2021 18:01:06 +0800
From:   <guangming.cao@mediatek.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>,
        "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA-BUF HEAPS FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
CC:     <wsd_upstream@mediatek.com>,
        Guangming Cao <Guangming.Cao@mediatek.com>
Subject: [PATCH] dma-buf: heaps: remove duplicated cache sync
Date:   Mon, 30 Aug 2021 18:01:38 +0800
Message-ID: <20210830100139.15632-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Guangming Cao <Guangming.Cao@mediatek.com>

Current flow, one dmabuf maybe call cache sync many times if
it has beed mapped more than one time.

Is there any case that attachments of one dmabuf will points to
different memory? If not, seems do sync only one time is more better.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/heaps/system_heap.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 23a7e74ef966..909ef652a8c8 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -162,9 +162,10 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
 
 	list_for_each_entry(a, &buffer->attachments, list) {
-		if (!a->mapped)
-			continue;
-		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
+		if (a->mapped) {
+			dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
+			break;
+		}
 	}
 	mutex_unlock(&buffer->lock);
 
@@ -183,9 +184,10 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
 
 	list_for_each_entry(a, &buffer->attachments, list) {
-		if (!a->mapped)
-			continue;
-		dma_sync_sgtable_for_device(a->dev, a->table, direction);
+		if (!a->mapped) {
+			dma_sync_sgtable_for_device(a->dev, a->table, direction);
+			break;
+		}
 	}
 	mutex_unlock(&buffer->lock);
 
-- 
2.17.1


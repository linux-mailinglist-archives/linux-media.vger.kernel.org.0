Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C083145DBAF
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 14:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355391AbhKYNyq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 08:54:46 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:60436 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1355402AbhKYNwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 08:52:44 -0500
X-UUID: 622c73e086f749b79f51c32a8971b9ed-20211125
X-UUID: 622c73e086f749b79f51c32a8971b9ed-20211125
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <guangming.cao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1143569343; Thu, 25 Nov 2021 21:49:28 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 25 Nov 2021 21:49:27 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 25 Nov 2021 21:49:26 +0800
From:   <guangming.cao@mediatek.com>
To:     <robin.murphy@arm.com>
CC:     <Brian.Starkey@arm.com>, <benjamin.gaignard@linaro.org>,
        <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
        <guangming.cao@mediatek.com>, <john.stultz@linaro.org>,
        <labbott@redhat.com>, <linaro-mm-sig@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <lmark@codeaurora.org>,
        <matthias.bgg@gmail.com>, <sumit.semwal@linaro.org>,
        <wsd_upstream@mediatek.com>, Guangming <Guangming.Cao@mediatek.com>
Subject: [PATCH v2] dma_heap: use for_each_sgtable_sg in sg_table release flow
Date:   Thu, 25 Nov 2021 21:49:51 +0800
Message-ID: <20211125134951.62002-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <85eb9053-0ce4-2514-06dc-58b8910dc5f7@arm.com>
References: <85eb9053-0ce4-2514-06dc-58b8910dc5f7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Guangming <Guangming.Cao@mediatek.com>

Use (for_each_sgtable_sg) rather than (for_each_sg) to traverse
sg_table to free sg_table.
Use (for_each_sg) maybe will casuse some pages can't be freed
when send wrong nents number.

Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/heaps/system_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 23a7e74ef966..8660508f3684 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -289,7 +289,7 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 	int i;
 
 	table = &buffer->sg_table;
-	for_each_sg(table->sgl, sg, table->nents, i) {
+	for_each_sgtable_sg(table, sg, i) {
 		struct page *page = sg_page(sg);
 
 		__free_pages(page, compound_order(page));
-- 
2.17.1


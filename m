Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756F44277A8
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 07:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244214AbhJIFzY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 01:55:24 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:37822 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232529AbhJIFzW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Oct 2021 01:55:22 -0400
X-UUID: bb78f1369c79463db52dfa763b5575e2-20211009
X-UUID: bb78f1369c79463db52dfa763b5575e2-20211009
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <guangming.cao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 211365005; Sat, 09 Oct 2021 13:53:19 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 9 Oct 2021 13:53:18 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 9 Oct 2021 13:53:17 +0800
From:   <guangming.cao@mediatek.com>
To:     <rdunlap@infradead.org>
CC:     <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
        <guangming.cao@mediatek.com>, <linaro-mm-sig@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
        <sumit.semwal@linaro.org>, <wsd_upstream@mediatek.com>,
        Guangming Cao <Guangming.Cao@mediatek.com>
Subject: [PATCH v2] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
Date:   Sat, 9 Oct 2021 13:55:04 +0800
Message-ID: <20211009055504.68272-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <c23181a5-b75b-c04b-7cc4-020f2b2b44c1@infradead.org>
References: <c23181a5-b75b-c04b-7cc4-020f2b2b44c1@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Guangming Cao <Guangming.Cao@mediatek.com>

If dma-buf don't want userspace users to touch the dmabuf buffer,
it seems we should add this restriction into dma_buf_ops.mmap,
not in this IOCTL:DMA_BUF_SET_NAME.

With this restriction, we can only know the kernel users of the dmabuf
by attachments.
However, for many userspace users, such as userpsace users of dma_heap,
they also need to mark the usage of dma-buf, and they don't care about
who attached to this dmabuf, and seems it's no meaning to be waiting for
IOCTL:DMA_BUF_SET_NAME rather than mmap.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/dma-buf.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..db2f4efdec32 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 
 /**
  * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
- * The name of the dma-buf buffer can only be set when the dma-buf is not
- * attached to any devices. It could theoritically support changing the
- * name of the dma-buf if the same piece of memory is used for multiple
- * purpose between different devices.
+ * It could theoretically support changing the name of the dma-buf if the same
+ * piece of memory is used for multiple purpose between different devices.
  *
  * @dmabuf: [in]     dmabuf buffer that will be renamed.
  * @buf:    [in]     A piece of userspace memory that contains the name of
@@ -346,19 +344,11 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	if (IS_ERR(name))
 		return PTR_ERR(name);
 
-	dma_resv_lock(dmabuf->resv, NULL);
-	if (!list_empty(&dmabuf->attachments)) {
-		ret = -EBUSY;
-		kfree(name);
-		goto out_unlock;
-	}
 	spin_lock(&dmabuf->name_lock);
 	kfree(dmabuf->name);
 	dmabuf->name = name;
 	spin_unlock(&dmabuf->name_lock);
 
-out_unlock:
-	dma_resv_unlock(dmabuf->resv);
 	return ret;
 }
 
-- 
2.17.1


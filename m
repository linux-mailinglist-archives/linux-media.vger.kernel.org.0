Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4094276BA
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 04:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244025AbhJICrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 22:47:49 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:43202 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232267AbhJICrt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 22:47:49 -0400
X-UUID: 3c2e614b433e45a4bfdc23e2206201e8-20211009
X-UUID: 3c2e614b433e45a4bfdc23e2206201e8-20211009
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <guangming.cao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1214547654; Sat, 09 Oct 2021 10:45:49 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sat, 9 Oct 2021 10:45:47 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 9 Oct 2021 10:45:47 +0800
From:   <guangming.cao@mediatek.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
CC:     <wsd_upstream@mediatek.com>,
        Guangming Cao <Guangming.Cao@mediatek.com>
Subject: [PATCH] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
Date:   Sat, 9 Oct 2021 10:47:33 +0800
Message-ID: <20211009024733.65676-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
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
who attached to this dmabuf, and seems it's no meaning to waitting for
IOCTL:DMA_BUF_SET_NAME rather than mmap.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/dma-buf.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..afbd0a226639 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 
 /**
  * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
- * The name of the dma-buf buffer can only be set when the dma-buf is not
- * attached to any devices. It could theoritically support changing the
- * name of the dma-buf if the same piece of memory is used for multiple
- * purpose between different devices.
+ * It could theoritically support changing the name of the dma-buf if the same
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


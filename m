Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D394335D8
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 14:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhJSM0C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 08:26:02 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:52618 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230231AbhJSM0C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 08:26:02 -0400
X-UUID: 397e8be8ddc3439cbd8ea5e09e71b96b-20211019
X-UUID: 397e8be8ddc3439cbd8ea5e09e71b96b-20211019
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <guangming.cao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2146541762; Tue, 19 Oct 2021 20:23:44 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 19 Oct 2021 20:23:43 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 19 Oct 2021 20:23:42 +0800
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
Subject: [PATCH] dma-buf: add attachments empty check for dma_buf_release
Date:   Tue, 19 Oct 2021 20:23:45 +0800
Message-ID: <20211019122345.160555-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Guangming Cao <Guangming.Cao@mediatek.com>

Since there is no mandatory inspection for attachments in dma_buf_release.
There will be a case that dma_buf already released but attachment is still
in use, which can points to the dmabuf, and it maybe cause
some unexpected issues.

With IOMMU, when this cases occurs, there will have IOMMU address
translation fault(s) followed by this warning,
I think it's useful for dma devices to debug issue.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..672404857d6a 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -74,6 +74,29 @@ static void dma_buf_release(struct dentry *dentry)
 	 */
 	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
 
+	/* attachment check */
+	if (dma_resv_trylock(dmabuf->resv) && WARN(!list_empty(&dmabuf->attachments),
+	    "%s err, inode:%08lu size:%08zu name:%s exp_name:%s flags:0x%08x mode:0x%08x, %s\n",
+	    __func__, file_inode(dmabuf->file)->i_ino, dmabuf->size,
+	    dmabuf->name, dmabuf->exp_name,
+	    dmabuf->file->f_flags, dmabuf->file->f_mode,
+	    "Release dmabuf before detach all attachments, dump attach:\n")) {
+		int attach_cnt = 0;
+		dma_addr_t dma_addr;
+		struct dma_buf_attachment *attach_obj;
+		/* dump all attachment info */
+		list_for_each_entry(attach_obj, &dmabuf->attachments, node) {
+			dma_addr = (dma_addr_t)0;
+			if (attach_obj->sgt)
+				dma_addr = sg_dma_address(attach_obj->sgt->sgl);
+			pr_err("attach[%d]: dev:%s dma_addr:0x%-12lx\n",
+			       attach_cnt, dev_name(attach_obj->dev), dma_addr);
+			attach_cnt++;
+		}
+		pr_err("Total %d devices attached\n\n", attach_cnt);
+		dma_resv_unlock(dmabuf->resv);
+	}
+
 	dmabuf->ops->release(dmabuf);
 
 	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
-- 
2.17.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A29F14264B3
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 08:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhJHGhk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 02:37:40 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:47742 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229585AbhJHGhj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 02:37:39 -0400
X-UUID: eaea71e3e19d4ca6aede932f5f812b8e-20211008
X-UUID: eaea71e3e19d4ca6aede932f5f812b8e-20211008
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <guangming.cao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 49959066; Fri, 08 Oct 2021 14:35:42 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 8 Oct 2021 14:35:41 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 8 Oct 2021 14:35:40 +0800
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
Subject: [PATCH v2] dma-buf: acquire name lock before read/write dma_buf.name
Date:   Fri, 8 Oct 2021 14:37:22 +0800
Message-ID: <20211008063722.40181-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Guangming Cao <Guangming.Cao@mediatek.com>

Because dma-buf.name can be freed in func: "dma_buf_set_name",
so, we need to acquire lock first before we read/write dma_buf.name
to prevent Use After Free(UAF) issue.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/dma-buf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..9436483a9cfd 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -80,7 +80,9 @@ static void dma_buf_release(struct dentry *dentry)
 		dma_resv_fini(dmabuf->resv);
 
 	module_put(dmabuf->owner);
+	spin_lock(&dmabuf->name_lock);
 	kfree(dmabuf->name);
+	spin_unlock(&dmabuf->name_lock);
 	kfree(dmabuf);
 }
 
@@ -1372,6 +1374,8 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 		if (ret)
 			goto error_unlock;
 
+
+		spin_lock(&buf_obj->name_lock);
 		seq_printf(s, "%08zu\t%08x\t%08x\t%08ld\t%s\t%08lu\t%s\n",
 				buf_obj->size,
 				buf_obj->file->f_flags, buf_obj->file->f_mode,
@@ -1379,6 +1383,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 				buf_obj->exp_name,
 				file_inode(buf_obj->file)->i_ino,
 				buf_obj->name ?: "");
+		spin_unlock(&buf_obj->name_lock);
 
 		robj = buf_obj->resv;
 		fence = dma_resv_excl_fence(robj);
-- 
2.17.1


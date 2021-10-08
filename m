Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A23242649B
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 08:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbhJHG3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 02:29:19 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:33968 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229664AbhJHG3S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 02:29:18 -0400
X-UUID: 7b259ceebea74b16a99be15b1f92cd6c-20211008
X-UUID: 7b259ceebea74b16a99be15b1f92cd6c-20211008
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <guangming.cao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 291282554; Fri, 08 Oct 2021 14:27:20 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Oct 2021 14:27:19 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 8 Oct 2021 14:27:18 +0800
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
Subject: [PATCH] dma-buf: acquire name lock before read/write dma_buf.name
Date:   Fri, 8 Oct 2021 14:29:03 +0800
Message-ID: <20211008062903.39731-1-guangming.cao@mediatek.com>
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
index 511fe0d217a0..aebb51b3ff52 100644
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
+		spin_lock(&dmabuf->name_lock);
 		seq_printf(s, "%08zu\t%08x\t%08x\t%08ld\t%s\t%08lu\t%s\n",
 				buf_obj->size,
 				buf_obj->file->f_flags, buf_obj->file->f_mode,
@@ -1379,6 +1383,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 				buf_obj->exp_name,
 				file_inode(buf_obj->file)->i_ino,
 				buf_obj->name ?: "");
+		spin_unlock(&dmabuf->name_lock);
 
 		robj = buf_obj->resv;
 		fence = dma_resv_excl_fence(robj);
-- 
2.17.1


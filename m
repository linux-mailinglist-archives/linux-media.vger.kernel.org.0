Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93FD8631769
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 00:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbiKTXpE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 18:45:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiKTXpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 18:45:02 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F1E167FE
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 15:45:01 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1owtzf-0008Fq-LL; Mon, 21 Nov 2022 00:44:59 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1owtza-005XyP-Pm; Mon, 21 Nov 2022 00:44:55 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1owtzb-002Kfj-1Y; Mon, 21 Nov 2022 00:44:55 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     tfiga@chromium.org, m.szyprowski@samsung.com, kernel@pengutronix.de
Subject: [PATCH] media: videobuf2-dma-sg: use v{un,}map instead of vm_{un,}map_ram
Date:   Mon, 21 Nov 2022 00:44:41 +0100
Message-Id: <20221120234441.550908-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The comments before the vm_map_ram function state that it should be used
for up to 256 KB only, and video buffers are definitely much larger. It
recommends using vmap in that case.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/media/common/videobuf2/videobuf2-dma-sg.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index dcb8de5ab3e84a..e86621fba350f3 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -188,7 +188,7 @@ static void vb2_dma_sg_put(void *buf_priv)
 		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
 				  DMA_ATTR_SKIP_CPU_SYNC);
 		if (buf->vaddr)
-			vm_unmap_ram(buf->vaddr, buf->num_pages);
+			vunmap(buf->vaddr);
 		sg_free_table(buf->dma_sgt);
 		while (--i >= 0)
 			__free_page(buf->pages[i]);
@@ -289,7 +289,7 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
 	       __func__, buf->num_pages);
 	dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
 	if (buf->vaddr)
-		vm_unmap_ram(buf->vaddr, buf->num_pages);
+		vunmap(buf->vaddr);
 	sg_free_table(buf->dma_sgt);
 	if (buf->dma_dir == DMA_FROM_DEVICE ||
 	    buf->dma_dir == DMA_BIDIRECTIONAL)
@@ -312,7 +312,8 @@ static void *vb2_dma_sg_vaddr(struct vb2_buffer *vb, void *buf_priv)
 			ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
 			buf->vaddr = ret ? NULL : map.vaddr;
 		} else {
-			buf->vaddr = vm_map_ram(buf->pages, buf->num_pages, -1);
+			buf->vaddr = vmap(buf->pages, buf->num_pages, VM_MAP,
+					  PAGE_KERNEL);
 		}
 	}
 
-- 
2.30.2


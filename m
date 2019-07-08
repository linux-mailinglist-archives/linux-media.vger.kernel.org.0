Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA3FE61F48
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 15:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730971AbfGHNHw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 09:07:52 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44205 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728581AbfGHNHw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 09:07:52 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1hkTMt-0001TW-Rz; Mon, 08 Jul 2019 15:07:43 +0200
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH v2] media: vb2-dc: skip CPU sync in map/unmap dma_buf
Date:   Mon,  8 Jul 2019 15:07:42 +0200
Message-Id: <20190708130742.11151-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is rougly equivalent to ca0e68e21aae (drm/prime: skip CPU sync
in map/unmap dma_buf). The contig memory allocated is already device
coherent memory, so there is no point in doing a CPU sync when
mapping it to another deevice. Also most importers currently cache
the mapping so the CPU sync would only happen on the first import,
so we are better off with not pretending to do a cache synchronization
at all.

This gets rid of a lot of CPU overhead in uses where those dma-bufs
are regularily imported and detached again, like Weston is currently
doing in the DRM compositor.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2: Add comments why it is safe to skip the CPU sync.
---
 .../common/videobuf2/videobuf2-dma-contig.c   | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index ecbef266130b..1b8f86366290 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -267,8 +267,14 @@ static void vb2_dc_dmabuf_ops_detach(struct dma_buf *dbuf,
 
 	/* release the scatterlist cache */
 	if (attach->dma_dir != DMA_NONE)
-		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
-			attach->dma_dir);
+		/*
+		 * Cache sync can be skipped here, as the vb2_dc memory is
+		 * allocated from device coherent memory, which means the
+		 * memory locations do not require any explicit cache
+		 * maintenance prior or after being used by the device.
+		 */
+		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
+			attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sgt);
 	kfree(attach);
 	db_attach->priv = NULL;
@@ -293,14 +299,17 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
 
 	/* release any previous cache */
 	if (attach->dma_dir != DMA_NONE) {
-		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
-			attach->dma_dir);
+		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
+			attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
 		attach->dma_dir = DMA_NONE;
 	}
 
-	/* mapping to the client with new direction */
-	sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
-				dma_dir);
+	/*
+	 * mapping to the client with new direction, no cache sync
+	 * required see comment in vb2_dc_dmabuf_ops_detach()
+	 */
+	sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
+				dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
 	if (!sgt->nents) {
 		pr_err("failed to map scatterlist\n");
 		mutex_unlock(lock);
-- 
2.20.1


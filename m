Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2AC77DD916
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 00:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234922AbjJaXEw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 19:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235009AbjJaXEu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 19:04:50 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D348FF3
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 16:04:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qxxmw-0007Lm-Bi; Wed, 01 Nov 2023 00:04:46 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qxxmt-005fVt-3r; Wed, 01 Nov 2023 00:04:43 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.96)
        (envelope-from <mgr@pengutronix.de>)
        id 1qxxmt-00E55k-0B;
        Wed, 01 Nov 2023 00:04:43 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, tfiga@chromium.org, m.szyprowski@samsung.com,
        mchehab@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com, kernel@pengutronix.de, stable@kernel.org
Subject: [PATCH v3] media: videobuf2-dma-sg: fix vmap and vunmap callbacks
Date:   Wed,  1 Nov 2023 00:04:35 +0100
Message-Id: <20231031230435.3356103-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For dmabuf import users to be able to use the vaddr from another
videobuf2-dma-sg source, the exporter needs to set a proper vaddr on
vb2_dma_sg_dmabuf_ops_vmap callback.

This patch adds vmap on map if buf->vaddr was not set, and also
adds the vb2_dma_sg_dmabuf_ops_vunmap function to remove the mapping
afterwards.

Cc: stable@kernel.org
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v2 -> v3: resend as a single patch
v1 -> v2: using vmap and vunmap instead of vm_map_ram and vm_unmap_ram

 .../media/common/videobuf2/videobuf2-dma-sg.c    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 28f3fdfe23a298..05b43edda94a7e 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -489,11 +489,26 @@ static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf,
 {
 	struct vb2_dma_sg_buf *buf = dbuf->priv;
 
+	if (!buf->vaddr)
+		buf->vaddr = vmap(buf->pages, buf->num_pages, VM_MAP,
+				  PAGE_KERNEL);
+
 	iosys_map_set_vaddr(map, buf->vaddr);
 
 	return 0;
 }
 
+static void vb2_dma_sg_dmabuf_ops_vunmap(struct dma_buf *dbuf,
+				      struct iosys_map *map)
+{
+	struct vb2_dma_sg_buf *buf = dbuf->priv;
+
+	if (buf->vaddr)
+		vunmap(buf->vaddr);
+
+	buf->vaddr = NULL;
+}
+
 static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
 	struct vm_area_struct *vma)
 {
@@ -508,6 +523,7 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
 	.begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
 	.end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
 	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
+	.vunmap = vb2_dma_sg_dmabuf_ops_vunmap,
 	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
 	.release = vb2_dma_sg_dmabuf_ops_release,
 };
-- 
2.39.2


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B480E638D84
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 16:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiKYPfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 10:35:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiKYPe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 10:34:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B192A2BB1B
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:34:57 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oyaj9-0005nt-KE; Fri, 25 Nov 2022 16:34:55 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oyaj7-000Frc-V0; Fri, 25 Nov 2022 16:34:54 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oyaj8-001Rdc-5X; Fri, 25 Nov 2022 16:34:54 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, stable <stable@kernel.org>
Subject: [PATCH v2 1/2] media: videobuf2-dma-sg: fix vmap and vunmap callbacks
Date:   Fri, 25 Nov 2022 16:34:49 +0100
Message-Id: <20221125153450.344392-1-m.grzeschik@pengutronix.de>
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

For dmabuf import users to be able to use the vaddr from another
videobuf2-dma-sg source, the exporter needs to set a proper vaddr on
vb2_dma_sg_dmabuf_ops_vmap callback.

This patch adds vm_map_ram on map if buf->vaddr was not set, and also
adds the vb2_dma_sg_dmabuf_ops_vunmap function to remove the mapping
afterwards.

Cc: stable <stable@kernel.org>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: using vmap and vunmap instead of vm_map_ram and vm_unmap_ram

 .../media/common/videobuf2/videobuf2-dma-sg.c    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index fa69158a65b1fd..dcb8de5ab3e84a 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -496,11 +496,26 @@ static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf,
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
@@ -515,6 +530,7 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
 	.begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
 	.end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
 	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
+	.vunmap = vb2_dma_sg_dmabuf_ops_vunmap,
 	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
 	.release = vb2_dma_sg_dmabuf_ops_release,
 };
-- 
2.30.2


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFF660E78F
	for <lists+linux-media@lfdr.de>; Wed, 26 Oct 2022 20:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbiJZSmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Oct 2022 14:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234209AbiJZSmW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Oct 2022 14:42:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3802F6168
        for <linux-media@vger.kernel.org>; Wed, 26 Oct 2022 11:42:20 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1onlM3-0005To-6t; Wed, 26 Oct 2022 20:42:19 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1onlM3-000Ya6-7S; Wed, 26 Oct 2022 20:42:18 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1onlM1-001XX8-ME; Wed, 26 Oct 2022 20:42:17 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, stable <stable@kernel.org>
Subject: [PATCH 1/2] media: videobuf2-dma-sg: fix vmap and vunmap callbacks
Date:   Wed, 26 Oct 2022 20:42:11 +0200
Message-Id: <20221026184212.366897-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 drivers/media/common/videobuf2/videobuf2-dma-sg.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index fa69158a65b1fd..8d6e154bbbc8b0 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -496,11 +496,25 @@ static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf,
 {
 	struct vb2_dma_sg_buf *buf = dbuf->priv;
 
+	if (!buf->vaddr)
+		buf->vaddr = vm_map_ram(buf->pages, buf->num_pages, -1);
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
+		vm_unmap_ram(buf->vaddr, buf->num_pages);
+
+	buf->vaddr = NULL;
+}
+
 static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
 	struct vm_area_struct *vma)
 {
@@ -515,6 +529,7 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
 	.begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
 	.end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
 	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
+	.vunmap = vb2_dma_sg_dmabuf_ops_vunmap,
 	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
 	.release = vb2_dma_sg_dmabuf_ops_release,
 };
-- 
2.30.2


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E6028CE8C
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 14:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgJMMmC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 08:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgJMMmC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 08:42:02 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C21CC0613D0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 05:42:02 -0700 (PDT)
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id EAD02634C87;
        Tue, 13 Oct 2020 15:40:36 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] ipu3-cio2: Check receved the size against payload size, not buffer size
Date:   Tue, 13 Oct 2020 15:41:43 +0300
Message-Id: <20201013124143.12459-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Compare the received size of the payload size, not the allocated size of
the buffer that is page aligned. This way also images that aren't aligned
to page size are not warned about.

Also wrap a line over 80 characters.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 51c4dd6a8f9a..dffcc74acb7e 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -571,10 +571,11 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
 			b->vbb.vb2_buf.timestamp = ns;
 			b->vbb.field = V4L2_FIELD_NONE;
 			b->vbb.sequence = atomic_read(&q->frame_sequence);
-			if (b->vbb.vb2_buf.planes[0].length != bytes)
-				dev_warn(dev, "buffer length is %d received %d\n",
-					 b->vbb.vb2_buf.planes[0].length,
-					 bytes);
+			if (vb2_get_plane_payload(&b->vbb.vb2_buf, 0) != bytes)
+				dev_warn(dev,
+					 "payload length is %lu received %u\n",
+					 vb2_get_plane_payload(&b->vbb.vb2_buf,
+							       0), bytes);
 			vb2_buffer_done(&b->vbb.vb2_buf, VB2_BUF_STATE_DONE);
 		}
 		atomic_inc(&q->frame_sequence);
-- 
2.27.0


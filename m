Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F88D28D02B
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 16:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388536AbgJMOZk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 10:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388503AbgJMOZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 10:25:40 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0009DC0613D0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 07:25:39 -0700 (PDT)
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 28281634C87;
        Tue, 13 Oct 2020 17:24:29 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        "Tested-by : Jean-Michel Hautbois" <jeanmichel.hautbois@gmail.com>
Subject: [PATCH v2 1/1] ipu3-cio2: Check receved the size against payload size, not buffer size
Date:   Tue, 13 Oct 2020 17:25:35 +0300
Message-Id: <20201013142535.25547-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Jean-Michel Hautbois <jeanmichel.hautbois@gmail.com>
---
since v1:

- Use local variable for payload, rename bytes as received

- Add a comma to the warning message

 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 51c4dd6a8f9a..c557d189200b 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -561,7 +561,9 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
 
 		b = q->bufs[q->bufs_first];
 		if (b) {
-			unsigned int bytes = entry[1].second_entry.num_of_bytes;
+			unsigned int received = entry[1].second_entry.num_of_bytes;
+			unsigned long payload =
+				vb2_get_plane_payload(&b->vbb.vb2_buf, 0);
 
 			q->bufs[q->bufs_first] = NULL;
 			atomic_dec(&q->bufs_queued);
@@ -571,10 +573,10 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
 			b->vbb.vb2_buf.timestamp = ns;
 			b->vbb.field = V4L2_FIELD_NONE;
 			b->vbb.sequence = atomic_read(&q->frame_sequence);
-			if (b->vbb.vb2_buf.planes[0].length != bytes)
-				dev_warn(dev, "buffer length is %d received %d\n",
-					 b->vbb.vb2_buf.planes[0].length,
-					 bytes);
+			if (payload != received)
+				dev_warn(dev,
+					 "payload length is %lu, received %u\n",
+					 payload, received);
 			vb2_buffer_done(&b->vbb.vb2_buf, VB2_BUF_STATE_DONE);
 		}
 		atomic_inc(&q->frame_sequence);
-- 
2.27.0


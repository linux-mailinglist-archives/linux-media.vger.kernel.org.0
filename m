Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F62C55FDF1
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 12:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbiF2Kvv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 06:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233016AbiF2Kvt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 06:51:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B3B2654D;
        Wed, 29 Jun 2022 03:51:48 -0700 (PDT)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1EAA8B8;
        Wed, 29 Jun 2022 12:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656499902;
        bh=/ODml13RqBS0DDohC1cVSiUhCPL+LfhlCXeGHrabxhU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ny3mxfWpJZnww8kqv1pdRntIOtMZoPbDZfVzFEDG+C2eaha6JtJDHihI36pJ5vfSl
         ecejjAjTKjOI16COFQrwDx2oLFGpvnuHhV7dyYwsuMhFasAk7mRaocrhi+8XuY1yHu
         Ytsx13P7alamhFOB+/p0MTGL7xTUne9UoNtFxOi4=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 6/7] v4l: vsp1: Provide video node debugfs entries
Date:   Wed, 29 Jun 2022 11:51:34 +0100
Message-Id: <20220629105135.2652773-7-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220629105135.2652773-1-kieran.bingham+renesas@ideasonboard.com>
References: <20220629105135.2652773-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Expose a debugfs file for each video node such that useful statistics
and performance metrics can be identified

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1.h    |  1 +
 .../platform/renesas/vsp1/vsp1_debugfs.c      | 39 +++++++++++++++++++
 .../platform/renesas/vsp1/vsp1_debugfs.h      |  8 ++++
 .../media/platform/renesas/vsp1/vsp1_video.c  | 14 ++++++-
 .../media/platform/renesas/vsp1/vsp1_video.h  |  9 +++++
 5 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index 1951d350b60a..774f006d9b6a 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -38,6 +38,7 @@ struct vsp1_rwpf;
 struct vsp1_sru;
 struct vsp1_uds;
 struct vsp1_uif;
+struct vsp1_video;
 
 #define VSP1_MAX_LIF		2
 #define VSP1_MAX_RPF		5
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c b/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c
index 0340acd3209b..fbee914de47c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c
@@ -17,6 +17,7 @@
 #include "vsp1.h"
 #include "vsp1_rwpf.h"
 #include "vsp1_pipe.h"
+#include "vsp1_video.h"
 
 #include "vsp1_debugfs.h"
 
@@ -522,3 +523,41 @@ void vsp1_debugfs_remove(struct vsp1_device *vsp1)
 	debugfs_remove_recursive(vsp1->dbgroot);
 	vsp1_device_put(vsp1);
 }
+
+
+/*
+ * VSP1 Video Debugfs nodes
+ */
+static int vsp1_video_stats(struct seq_file *s, void *p)
+{
+	struct vsp1_video *video = s->private;
+
+	seq_puts(s, "Reading from a struct vsp1_video node\n");
+
+	seq_printf(s,	" buffer_queued %d\n"
+			" buffer_done %d\n"
+			" buffer_failed %d\n",
+			video->statistics.buffer_queued,
+			video->statistics.buffer_done,
+			video->statistics.buffer_failed);
+
+	return 0;
+}
+
+DEBUGFS_RO_ATTR(vsp1_video_stats);
+
+void vsp1_debugfs_create_video_stats(struct vsp1_video *video, const char *name)
+{
+	struct vsp1_device *vsp1 = video->vsp1;
+
+	/* dentry pointer discarded */
+	video->debugfs_file = debugfs_create_file(name,
+					0444, vsp1->dbgroot, video,
+					&vsp1_video_stats_fops);
+}
+
+void vsp1_debugfs_cleanup_video_stats(struct vsp1_video *video)
+{
+	debugfs_remove(video->debugfs_file);
+	video->debugfs_file = NULL;
+}
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_debugfs.h b/drivers/media/platform/renesas/vsp1/vsp1_debugfs.h
index c2a7f232ed44..2a6aac0a5940 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_debugfs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_debugfs.h
@@ -32,6 +32,10 @@
 int vsp1_debugfs_init(struct vsp1_device *vsp1);
 void vsp1_debugfs_remove(struct vsp1_device *vsp1);
 char *vsp1_reg_to_name(u32 offset);
+
+void vsp1_debugfs_create_video_stats(struct vsp1_video *video,
+		const char *name);
+void vsp1_debugfs_cleanup_video_stats(struct vsp1_video *video);
 #else
 static inline int vsp1_debugfs_init(struct vsp1_device *vsp1)
 {
@@ -44,6 +48,10 @@ static inline char *vsp1_reg_to_name(u32 offset)
 {
 	return "<>";
 }
+
+static inline vsp1_debugfs_create_video_stats(struct vsp1_video *video,
+		const char *name) { };
+static inline vsp1_debugfs_cleanup_video_stats(struct vsp1_video *video) { };
 #endif /* CONFIG_DEBUG_FS */
 
 #endif /* __VSP1_DEBUGFS_H__ */
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 51219b1b6ea9..813be13bb84b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -25,6 +25,7 @@
 
 #include "vsp1.h"
 #include "vsp1_brx.h"
+#include "vsp1_debugfs.h"
 #include "vsp1_dl.h"
 #include "vsp1_entity.h"
 #include "vsp1_hgo.h"
@@ -342,6 +343,7 @@ vsp1_video_complete_buffer(struct vsp1_video *video)
 		vb2_set_plane_payload(&done->buf.vb2_buf, i,
 				      vb2_plane_size(&done->buf.vb2_buf, i));
 	vb2_buffer_done(&done->buf.vb2_buf, VB2_BUF_STATE_DONE);
+	video->statistics.buffer_done++;
 
 	return next;
 }
@@ -768,6 +770,8 @@ static void vsp1_video_buffer_queue(struct vb2_buffer *vb)
 	list_add_tail(&buf->queue, &video->irqqueue);
 	spin_unlock_irqrestore(&video->irqlock, flags);
 
+	video->statistics.buffer_queued++;
+
 	if (!empty)
 		return;
 
@@ -839,8 +843,10 @@ static void vsp1_video_release_buffers(struct vsp1_video *video)
 
 	/* Remove all buffers from the IRQ queue. */
 	spin_lock_irqsave(&video->irqlock, flags);
-	list_for_each_entry(buffer, &video->irqqueue, queue)
+	list_for_each_entry(buffer, &video->irqqueue, queue) {
 		vb2_buffer_done(&buffer->buf.vb2_buf, VB2_BUF_STATE_ERROR);
+		video->statistics.buffer_failed++;
+	}
 	INIT_LIST_HEAD(&video->irqqueue);
 	spin_unlock_irqrestore(&video->irqlock, flags);
 }
@@ -1310,6 +1316,9 @@ struct vsp1_video *vsp1_video_create(struct vsp1_device *vsp1,
 		goto error;
 	}
 
+	/* Create a Video debugfs node */
+	vsp1_debugfs_create_video_stats(video, video->video.name);
+
 	return video;
 
 error:
@@ -1319,6 +1328,9 @@ struct vsp1_video *vsp1_video_create(struct vsp1_device *vsp1,
 
 void vsp1_video_cleanup(struct vsp1_video *video)
 {
+	/* Remove any debugfs entries */
+	vsp1_debugfs_cleanup_video_stats(video);
+
 	if (video_is_registered(&video->video))
 		video_unregister_device(&video->video);
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.h b/drivers/media/platform/renesas/vsp1/vsp1_video.h
index f3cf5e2fdf5a..a9499822c7d6 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.h
@@ -28,6 +28,12 @@ to_vsp1_vb2_buffer(struct vb2_v4l2_buffer *vbuf)
 	return container_of(vbuf, struct vsp1_vb2_buffer, buf);
 }
 
+struct vsp1_video_stats {
+	u32 buffer_queued;
+	u32 buffer_done;
+	u32 buffer_failed;
+};
+
 struct vsp1_video {
 	struct list_head list;
 	struct vsp1_device *vsp1;
@@ -44,6 +50,9 @@ struct vsp1_video {
 	struct vb2_queue queue;
 	spinlock_t irqlock;
 	struct list_head irqqueue;
+
+	struct dentry *debugfs_file;
+	struct vsp1_video_stats statistics;
 };
 
 static inline struct vsp1_video *to_vsp1_video(struct video_device *vdev)
-- 
2.34.1


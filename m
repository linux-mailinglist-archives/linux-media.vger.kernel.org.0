Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 997B71BE72
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 22:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfEMUOI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 16:14:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41516 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbfEMUOI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 16:14:08 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:c7f:1887:5d00:8d7a:f2f4:69ff:77c4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB0D5305;
        Mon, 13 May 2019 22:14:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557778445;
        bh=d1fVqiWjmbHvUY/E7xddPihlUmcvaHqOq8iihia6DRg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=H5KbOwSSOZE6Jqw5zotJEo5ALCjVLMQY4u4iDVZEBCeRaey9+EOQlids94KBTNNiA
         EhB3WDQU4UDDE6F2ZMt52ywEmopydmYepXaVv5wmAFc4M8QHtB80eCOeRdc7wq6zCk
         1KCzvkc2diZ2yokNiboWf1cAAKtCjQt4d2FsivQg=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v4 1/4] media: vsp1: Define partition algorithm helper
Date:   Mon, 13 May 2019 21:13:52 +0100
Message-Id: <20190513201355.994-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513201355.994-1-kieran.bingham+renesas@ideasonboard.com>
References: <20190513201355.994-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide a helper to describe when the partition algorithm is in use on a
given pipeline. This improves readability to the purpose of the code,
rather than obtusely checking the number of partitions.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v4:
 - Fix periods at the end of comments (adjacent comment included)

 drivers/media/platform/vsp1/vsp1_pipe.c  | 10 +++++++++-
 drivers/media/platform/vsp1/vsp1_pipe.h  |  1 +
 drivers/media/platform/vsp1/vsp1_rpf.c   |  2 +-
 drivers/media/platform/vsp1/vsp1_video.c |  2 +-
 drivers/media/platform/vsp1/vsp1_wpf.c   |  2 +-
 5 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_pipe.c b/drivers/media/platform/vsp1/vsp1_pipe.c
index f72ac01c21ea..e8a86771bde8 100644
--- a/drivers/media/platform/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/vsp1/vsp1_pipe.c
@@ -427,7 +427,15 @@ void vsp1_pipeline_propagate_alpha(struct vsp1_pipeline *pipe,
 }
 
 /*
- * Propagate the partition calculations through the pipeline
+ * Identify if the partition algorithm is in use or not.
+ */
+bool vsp1_pipeline_partitioned(struct vsp1_pipeline *pipe)
+{
+	return pipe->partitions > 1;
+}
+
+/*
+ * Propagate the partition calculations through the pipeline.
  *
  * Work backwards through the pipe, allowing each entity to update the partition
  * parameters based on its configuration, and the entity connected to its
diff --git a/drivers/media/platform/vsp1/vsp1_pipe.h b/drivers/media/platform/vsp1/vsp1_pipe.h
index ae646c9ef337..dd8b2cdc6452 100644
--- a/drivers/media/platform/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/vsp1/vsp1_pipe.h
@@ -164,6 +164,7 @@ void vsp1_pipeline_propagate_alpha(struct vsp1_pipeline *pipe,
 				   struct vsp1_dl_body *dlb,
 				   unsigned int alpha);
 
+bool vsp1_pipeline_partitioned(struct vsp1_pipeline *pipe);
 void vsp1_pipeline_propagate_partition(struct vsp1_pipeline *pipe,
 				       struct vsp1_partition *partition,
 				       unsigned int index,
diff --git a/drivers/media/platform/vsp1/vsp1_rpf.c b/drivers/media/platform/vsp1/vsp1_rpf.c
index 616afa7e165f..ef9bf5dd55a0 100644
--- a/drivers/media/platform/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/vsp1/vsp1_rpf.c
@@ -269,7 +269,7 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
 	 * matching the expected partition window. Only 'left' and
 	 * 'width' need to be adjusted.
 	 */
-	if (pipe->partitions > 1) {
+	if (vsp1_pipeline_partitioned(pipe)) {
 		crop.width = pipe->partition->rpf.width;
 		crop.left += pipe->partition->rpf.left;
 	}
diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
index 7ceaf3222145..ee2fb8261a6a 100644
--- a/drivers/media/platform/vsp1/vsp1_video.c
+++ b/drivers/media/platform/vsp1/vsp1_video.c
@@ -201,7 +201,7 @@ static void vsp1_video_calculate_partition(struct vsp1_pipeline *pipe,
 					    RWPF_PAD_SINK);
 
 	/* A single partition simply processes the output size in full. */
-	if (pipe->partitions <= 1) {
+	if (!vsp1_pipeline_partitioned(pipe)) {
 		window.left = 0;
 		window.width = format->width;
 
diff --git a/drivers/media/platform/vsp1/vsp1_wpf.c b/drivers/media/platform/vsp1/vsp1_wpf.c
index 32bb207b2007..9e8dbf99878b 100644
--- a/drivers/media/platform/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/vsp1/vsp1_wpf.c
@@ -376,7 +376,7 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
 	 * Cropping. The partition algorithm can split the image into
 	 * multiple slices.
 	 */
-	if (pipe->partitions > 1)
+	if (vsp1_pipeline_partitioned(pipe))
 		width = pipe->partition->wpf.width;
 
 	vsp1_wpf_write(wpf, dlb, VI6_WPF_HSZCLIP, VI6_WPF_SZCLIP_EN |
-- 
2.20.1


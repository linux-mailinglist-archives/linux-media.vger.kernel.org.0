Return-Path: <linux-media+bounces-13628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E2A90E097
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C2161F23A0F
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661BD4C74;
	Wed, 19 Jun 2024 00:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BXCYPc0i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2418863D0;
	Wed, 19 Jun 2024 00:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756279; cv=none; b=nHl1W8MEBP4cAZGQl0Txv8+fXAD3x4fuN5Mq75NVcSLc8X4SfcT7HI9fsHY22ENS967L6iK6dEYk2P7KPg4jRcZ4Nw9cSbKFCPZ4TWLMDL7vW3lRuOhEKIuPDMLHGTGVx5nofs0ppYnurJl4EBRTAa9EEzdfL5pBnYUGiwFilZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756279; c=relaxed/simple;
	bh=+U9710C46uZngN1V29seeDOVFKhzJddSk/xCT0ut/ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvRY+OnUT5A01rz8i3NdufPz1jUBhayJw9fM5gLmY7Bh6EANH8x+GWO2ttixqkSNSkkFmAu/IDwRHlWXHe3dfMqKHFF7b/dzh84uhisA5F2+yCxTUxM/cMXtKH7oy71qBONAHeRQM3D8WTUkgrhrwDR61zZqfSkgZnuHbCPad8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BXCYPc0i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6570121A;
	Wed, 19 Jun 2024 02:17:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756255;
	bh=+U9710C46uZngN1V29seeDOVFKhzJddSk/xCT0ut/ww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BXCYPc0ihyclMY51MmG9Id5dpsntj3ksKI2xufGpZCJ04K59XSpD5UMC8uRiSAmqI
	 GN2IaPMLx1FnvDbFys9uuKVUvaLN2K5oaSNzpOPsPF3oxe09PshF/FZiyhVAZJM15W
	 gJz2ewi1hBK6H7bKEEJVSbgw8pr1NUjpR2/rwZKA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 06/19] media: renesas: vsp1: Move partition calculation to vsp1_pipe.c
Date: Wed, 19 Jun 2024 03:17:09 +0300
Message-ID: <20240619001722.9749-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The partition calculation code, located in vsp1_video.c, is not specific
to video pipelines. To prepare for its usage in DRM pipelines, move it
to vsp1_pipe.c.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Changes since v1:

- Drop stray \t in comment
---
 .../media/platform/renesas/vsp1/vsp1_pipe.c   |  85 ++++++++-
 .../media/platform/renesas/vsp1/vsp1_pipe.h   |   6 +-
 .../media/platform/renesas/vsp1/vsp1_video.c  | 169 +++++-------------
 3 files changed, 130 insertions(+), 130 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index 68d05243c3ee..fc66dcfdb838 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -444,6 +444,10 @@ void vsp1_pipeline_propagate_alpha(struct vsp1_pipeline *pipe,
 	vsp1_uds_set_alpha(pipe->uds, dlb, alpha);
 }
 
+/* -----------------------------------------------------------------------------
+ * VSP1 Partition Algorithm support
+ */
+
 /*
  * Propagate the partition calculations through the pipeline
  *
@@ -452,10 +456,10 @@ void vsp1_pipeline_propagate_alpha(struct vsp1_pipeline *pipe,
  * source. Each entity must produce the partition required for the previous
  * entity in the pipeline.
  */
-void vsp1_pipeline_propagate_partition(struct vsp1_pipeline *pipe,
-				       struct vsp1_partition *partition,
-				       unsigned int index,
-				       struct vsp1_partition_window *window)
+static void vsp1_pipeline_propagate_partition(struct vsp1_pipeline *pipe,
+					      struct vsp1_partition *partition,
+					      unsigned int index,
+					      struct vsp1_partition_window *window)
 {
 	struct vsp1_entity *entity;
 
@@ -466,3 +470,76 @@ void vsp1_pipeline_propagate_partition(struct vsp1_pipeline *pipe,
 	}
 }
 
+/*
+ * vsp1_pipeline_calculate_partition - Calculate pipeline configuration for a
+ * partition
+ *
+ * @pipe: the pipeline
+ * @partition: partition that will hold the calculated values
+ * @div_size: pre-determined maximum partition division size
+ * @index: partition index
+ */
+void vsp1_pipeline_calculate_partition(struct vsp1_pipeline *pipe,
+				       struct vsp1_partition *partition,
+				       unsigned int div_size,
+				       unsigned int index)
+{
+	const struct v4l2_mbus_framefmt *format;
+	struct vsp1_partition_window window;
+	unsigned int modulus;
+
+	/*
+	 * Partitions are computed on the size before rotation, use the format
+	 * at the WPF sink.
+	 */
+	format = v4l2_subdev_state_get_format(pipe->output->entity.state,
+					      RWPF_PAD_SINK);
+
+	/* A single partition simply processes the output size in full. */
+	if (pipe->partitions <= 1) {
+		window.left = 0;
+		window.width = format->width;
+
+		vsp1_pipeline_propagate_partition(pipe, partition, index,
+						  &window);
+		return;
+	}
+
+	/* Initialise the partition with sane starting conditions. */
+	window.left = index * div_size;
+	window.width = div_size;
+
+	modulus = format->width % div_size;
+
+	/*
+	 * We need to prevent the last partition from being smaller than the
+	 * *minimum* width of the hardware capabilities.
+	 *
+	 * If the modulus is less than half of the partition size,
+	 * the penultimate partition is reduced to half, which is added
+	 * to the final partition: |1234|1234|1234|12|341|
+	 * to prevent this:        |1234|1234|1234|1234|1|.
+	 */
+	if (modulus) {
+		/*
+		 * pipe->partitions is 1 based, whilst index is a 0 based index.
+		 * Normalise this locally.
+		 */
+		unsigned int partitions = pipe->partitions - 1;
+
+		if (modulus < div_size / 2) {
+			if (index == partitions - 1) {
+				/* Halve the penultimate partition. */
+				window.width = div_size / 2;
+			} else if (index == partitions) {
+				/* Increase the final partition. */
+				window.width = (div_size / 2) + modulus;
+				window.left -= div_size / 2;
+			}
+		} else if (index == partitions) {
+			window.width = modulus;
+		}
+	}
+
+	vsp1_pipeline_propagate_partition(pipe, partition, index, &window);
+}
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
index 674b5748d929..02e98d843730 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
@@ -166,10 +166,10 @@ void vsp1_pipeline_propagate_alpha(struct vsp1_pipeline *pipe,
 				   struct vsp1_dl_body *dlb,
 				   unsigned int alpha);
 
-void vsp1_pipeline_propagate_partition(struct vsp1_pipeline *pipe,
+void vsp1_pipeline_calculate_partition(struct vsp1_pipeline *pipe,
 				       struct vsp1_partition *partition,
-				       unsigned int index,
-				       struct vsp1_partition_window *window);
+				       unsigned int div_size,
+				       unsigned int index);
 
 const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
 						    u32 fourcc);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 813699d372f6..6dbae2bf9b14 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -178,129 +178,6 @@ static int __vsp1_video_try_format(struct vsp1_video *video,
 	return 0;
 }
 
-/* -----------------------------------------------------------------------------
- * VSP1 Partition Algorithm support
- */
-
-/**
- * vsp1_video_calculate_partition - Calculate the active partition output window
- *
- * @pipe: the pipeline
- * @partition: partition that will hold the calculated values
- * @div_size: pre-determined maximum partition division size
- * @index: partition index
- */
-static void vsp1_video_calculate_partition(struct vsp1_pipeline *pipe,
-					   struct vsp1_partition *partition,
-					   unsigned int div_size,
-					   unsigned int index)
-{
-	const struct v4l2_mbus_framefmt *format;
-	struct vsp1_partition_window window;
-	unsigned int modulus;
-
-	/*
-	 * Partitions are computed on the size before rotation, use the format
-	 * at the WPF sink.
-	 */
-	format = v4l2_subdev_state_get_format(pipe->output->entity.state,
-					      RWPF_PAD_SINK);
-
-	/* A single partition simply processes the output size in full. */
-	if (pipe->partitions <= 1) {
-		window.left = 0;
-		window.width = format->width;
-
-		vsp1_pipeline_propagate_partition(pipe, partition, index,
-						  &window);
-		return;
-	}
-
-	/* Initialise the partition with sane starting conditions. */
-	window.left = index * div_size;
-	window.width = div_size;
-
-	modulus = format->width % div_size;
-
-	/*
-	 * We need to prevent the last partition from being smaller than the
-	 * *minimum* width of the hardware capabilities.
-	 *
-	 * If the modulus is less than half of the partition size,
-	 * the penultimate partition is reduced to half, which is added
-	 * to the final partition: |1234|1234|1234|12|341|
-	 * to prevent this:        |1234|1234|1234|1234|1|.
-	 */
-	if (modulus) {
-		/*
-		 * pipe->partitions is 1 based, whilst index is a 0 based index.
-		 * Normalise this locally.
-		 */
-		unsigned int partitions = pipe->partitions - 1;
-
-		if (modulus < div_size / 2) {
-			if (index == partitions - 1) {
-				/* Halve the penultimate partition. */
-				window.width = div_size / 2;
-			} else if (index == partitions) {
-				/* Increase the final partition. */
-				window.width = (div_size / 2) + modulus;
-				window.left -= div_size / 2;
-			}
-		} else if (index == partitions) {
-			window.width = modulus;
-		}
-	}
-
-	vsp1_pipeline_propagate_partition(pipe, partition, index, &window);
-}
-
-static int vsp1_video_pipeline_setup_partitions(struct vsp1_pipeline *pipe)
-{
-	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
-	const struct v4l2_mbus_framefmt *format;
-	struct vsp1_entity *entity;
-	unsigned int div_size;
-	unsigned int i;
-
-	/*
-	 * Partitions are computed on the size before rotation, use the format
-	 * at the WPF sink.
-	 */
-	format = v4l2_subdev_state_get_format(pipe->output->entity.state,
-					      RWPF_PAD_SINK);
-	div_size = format->width;
-
-	/*
-	 * Only Gen3+ hardware requires image partitioning, Gen2 will operate
-	 * with a single partition that covers the whole output.
-	 */
-	if (vsp1->info->gen >= 3) {
-		list_for_each_entry(entity, &pipe->entities, list_pipe) {
-			unsigned int entity_max;
-
-			if (!entity->ops->max_width)
-				continue;
-
-			entity_max = entity->ops->max_width(entity, pipe);
-			if (entity_max)
-				div_size = min(div_size, entity_max);
-		}
-	}
-
-	pipe->partitions = DIV_ROUND_UP(format->width, div_size);
-	pipe->part_table = kcalloc(pipe->partitions, sizeof(*pipe->part_table),
-				   GFP_KERNEL);
-	if (!pipe->part_table)
-		return -ENOMEM;
-
-	for (i = 0; i < pipe->partitions; ++i)
-		vsp1_video_calculate_partition(pipe, &pipe->part_table[i],
-					       div_size, i);
-
-	return 0;
-}
-
 /* -----------------------------------------------------------------------------
  * Pipeline Management
  */
@@ -788,6 +665,52 @@ static void vsp1_video_buffer_queue(struct vb2_buffer *vb)
 	spin_unlock_irqrestore(&pipe->irqlock, flags);
 }
 
+static int vsp1_video_pipeline_setup_partitions(struct vsp1_pipeline *pipe)
+{
+	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
+	const struct v4l2_mbus_framefmt *format;
+	struct vsp1_entity *entity;
+	unsigned int div_size;
+	unsigned int i;
+
+	/*
+	 * Partitions are computed on the size before rotation, use the format
+	 * at the WPF sink.
+	 */
+	format = v4l2_subdev_state_get_format(pipe->output->entity.state,
+					      RWPF_PAD_SINK);
+	div_size = format->width;
+
+	/*
+	 * Only Gen3+ hardware requires image partitioning, Gen2 will operate
+	 * with a single partition that covers the whole output.
+	 */
+	if (vsp1->info->gen >= 3) {
+		list_for_each_entry(entity, &pipe->entities, list_pipe) {
+			unsigned int entity_max;
+
+			if (!entity->ops->max_width)
+				continue;
+
+			entity_max = entity->ops->max_width(entity, pipe);
+			if (entity_max)
+				div_size = min(div_size, entity_max);
+		}
+	}
+
+	pipe->partitions = DIV_ROUND_UP(format->width, div_size);
+	pipe->part_table = kcalloc(pipe->partitions, sizeof(*pipe->part_table),
+				   GFP_KERNEL);
+	if (!pipe->part_table)
+		return -ENOMEM;
+
+	for (i = 0; i < pipe->partitions; ++i)
+		vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[i],
+						  div_size, i);
+
+	return 0;
+}
+
 static int vsp1_video_setup_pipeline(struct vsp1_pipeline *pipe)
 {
 	struct vsp1_entity *entity;
-- 
Regards,

Laurent Pinchart



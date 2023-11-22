Return-Path: <linux-media+bounces-700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED357F3CD4
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 05:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25117281FCC
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 04:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B751012B6D;
	Wed, 22 Nov 2023 04:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Oet5Mbt3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A36B198;
	Tue, 21 Nov 2023 20:30:21 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89F311434;
	Wed, 22 Nov 2023 05:29:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700627381;
	bh=b63L/bnqE52ON+MnUqXixVM/lHBYBvYtoq/r8YFxJsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oet5Mbt3UQVNkbSJkZCF9N4eqW27xwKjJqm0MTz6Ft5s/zj2MYUYYs04PaACwkVjd
	 9rCRGrK4btzJPvFC0vq+5SEw+Kb1IGiQx72CW/UpxAuNdwAwpT9c2rENPILtLX82Ak
	 E97Mh/4UTilX6gNmxZz2N3KBdcz9WwEFQZdRqCGE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC PATCH v1 06/19] media: renesas: vsp1: Move partition calculation to vsp1_pipe.c
Date: Wed, 22 Nov 2023 06:29:56 +0200
Message-ID: <20231122043009.2741-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
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
---
 .../media/platform/renesas/vsp1/vsp1_pipe.c   |  85 ++++++++-
 .../media/platform/renesas/vsp1/vsp1_pipe.h   |   6 +-
 .../media/platform/renesas/vsp1/vsp1_video.c  | 169 +++++-------------
 3 files changed, 130 insertions(+), 130 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index 68d05243c3ee..b90240b24b3a 100644
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
+ *	partition
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
index 9cb81b4c65ed..ea5773af54d6 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -172,129 +172,6 @@ static int __vsp1_video_try_format(struct vsp1_video *video,
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
@@ -782,6 +659,52 @@ static void vsp1_video_buffer_queue(struct vb2_buffer *vb)
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



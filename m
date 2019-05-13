Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78DCC1BE78
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 22:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfEMUOP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 16:14:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41526 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfEMUOO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 16:14:14 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:c7f:1887:5d00:8d7a:f2f4:69ff:77c4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBF6C9F0;
        Mon, 13 May 2019 22:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557778447;
        bh=a93VisiFcCuom6tLstPnIFUB+CHwTTnAEp8Y5CfN+v8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=S7QG2B9eJGkHaksnaecOxW9lGVaj5UdasFfFUKwLlBuDuXG4NnXUdzx29iQSEbXo/
         zHSt0KHlon6K2/sTdEQ1fAq9MKrqcdCVcV/UyPDgg+vwA3aVPvFBntVnJ5ML6WBRD4
         3acS2S5Ip0PaDHwHmNyxxHpuBHp/br9AqdVjpzmM=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v4 4/4] media: vsp1: Provide partition overlap algorithm
Date:   Mon, 13 May 2019 21:13:55 +0100
Message-Id: <20190513201355.994-5-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513201355.994-1-kieran.bingham+renesas@ideasonboard.com>
References: <20190513201355.994-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To improve image quality, entities involved within the image partition
algorithm may extend their partition window to account for their input
requirements and to take consideration of the number of taps in their
filters.

Extend the partition algorithm to sweep first backwards, then forwards
through the entity list. Each entity is given the opportunity to expand
its window on the reverse sweep, and clip or increase the offset on the
forwards sweep.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
v2:
 - Configure HSTP and HEDP in uds_configure_partition for single partitions
 - refactored to use individual functions for various phase and position calculations
 - squashed forwards and backwards propagation work to a single patch
 - Fixed a few 'off-by-ones'
 - considerable other changes :)

v3:
 - SRU comments updated
 - phase function parameter documentation updated
 - s/uds_left_src_pixel/uds_left_sink_pixel/
 - s/uds_right_src_pixel/uds_right_sink_pixel/

v4:
 - A full rework to the UDS overlap and phase calculations
 - Collapse split calculations into the single uds_partition() function
 - Document UDS calculations following procedure steps as per datasheet
 - Fix SRU -> UDS offset propagation bug
 - Remove SRU partition storage (no longer needed)
 - Use a bool for scale_up
 - Improve documentation
 - Fix vsp1_partition documentation
 - Fix UDS scaling margin to support 2 pixel overlap on downscaling
 - Improve documentation on UDS position steps
 - Expand on the UDS scaling operation documentation
 - Refactor start phase calculation
 - Rework vsp1_pipeline_propagate_partition documentation
 - Introduce vsp1_pipeline_partition_last helper

 drivers/media/platform/vsp1/vsp1_entity.h |   2 +-
 drivers/media/platform/vsp1/vsp1_pipe.c   |  60 +++++++++-
 drivers/media/platform/vsp1/vsp1_pipe.h   |  14 ++-
 drivers/media/platform/vsp1/vsp1_rpf.c    |   8 +-
 drivers/media/platform/vsp1/vsp1_sru.c    |  52 +++++++-
 drivers/media/platform/vsp1/vsp1_uds.c    | 137 ++++++++++++++++++++--
 drivers/media/platform/vsp1/vsp1_video.c  |   2 +
 drivers/media/platform/vsp1/vsp1_wpf.c    |  16 ++-
 8 files changed, 261 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_entity.h b/drivers/media/platform/vsp1/vsp1_entity.h
index 97acb7795cf1..772492877764 100644
--- a/drivers/media/platform/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/vsp1/vsp1_entity.h
@@ -88,7 +88,7 @@ struct vsp1_entity_operations {
 	unsigned int (*max_width)(struct vsp1_entity *, struct vsp1_pipeline *);
 	void (*partition)(struct vsp1_entity *, struct vsp1_pipeline *,
 			  struct vsp1_partition *, unsigned int,
-			  struct vsp1_partition_window *);
+			  struct vsp1_partition_window *, bool);
 };
 
 struct vsp1_entity {
diff --git a/drivers/media/platform/vsp1/vsp1_pipe.c b/drivers/media/platform/vsp1/vsp1_pipe.c
index e8a86771bde8..edcfbd206b69 100644
--- a/drivers/media/platform/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/vsp1/vsp1_pipe.c
@@ -434,13 +434,55 @@ bool vsp1_pipeline_partitioned(struct vsp1_pipeline *pipe)
 	return pipe->partitions > 1;
 }
 
+/*
+ * Identify the last (right-most) partition.
+ *
+ * The indexes commence at 0, but the pipe->partitions is a counter, thus we
+ * account for this accordingly.
+ */
+bool vsp1_pipeline_partition_last(struct vsp1_pipeline *pipe,
+				  unsigned int index)
+{
+	return pipe->partitions - 1 == index;
+}
+
 /*
  * Propagate the partition calculations through the pipeline.
  *
- * Work backwards through the pipe, allowing each entity to update the partition
- * parameters based on its configuration, and the entity connected to its
- * source. Each entity must produce the partition required for the previous
- * entity in the pipeline.
+ * Entities involved in the partition algorithm may have filters requiring
+ * extra pixels to be supplied on the left and right edges. The extra pixels
+ * produced allow the filter to correctly process all pixels which must be
+ * output with valid data while pixels which are based on copied data can be
+ * clipped by other entities in the pipeline.
+ *
+ * We determine the partition window size based on the image output size. Then
+ * perform two passes through the entities in the pipeline, first backwards
+ * then forwards calling the .partition operation on each entity if it is
+ * provided.
+ *
+ * The .partition function allows an entity to transform a partition window
+ * based on its current configuration in the direction the algorithm is
+ * currently processing.
+ *
+ * In the first pass, the entities shall process in the backwards direction
+ * and can expand the window to request a larger number of input pixels for
+ * processing from the previous entity.
+ *
+ * On the second pass, the entities shall process in the forwards direction
+ * and shall consider any cropping requirements as a result of previous
+ * entities producing an enlarged window, reporting this as an offset for the
+ * left edge. An entity can either consume the offset by cropping its input or
+ * propagate it forwards.
+ *
+ * Clipping only occurs on the left edge of a window as the right edge is
+ * handled by entities processing only as far as they need to satisfy the
+ * output width requested by the next entity in the pipeline. As the final
+ * entity, the WPF will only write out valid pixels through a combination of
+ * clipping the offset from the left edge, and writing only a valid width to
+ * meet the right edge of the image.
+ *
+ * Any information an entity stores in the vsp1_partition is private to that
+ * entity, and shall not be accessed outside of that entity.
  */
 void vsp1_pipeline_propagate_partition(struct vsp1_pipeline *pipe,
 				       struct vsp1_partition *partition,
@@ -449,10 +491,18 @@ void vsp1_pipeline_propagate_partition(struct vsp1_pipeline *pipe,
 {
 	struct vsp1_entity *entity;
 
+	/* Move backwards through the pipeline to propagate any expansion. */
 	list_for_each_entry_reverse(entity, &pipe->entities, list_pipe) {
 		if (entity->ops->partition)
 			entity->ops->partition(entity, pipe, partition, index,
-					       window);
+					       window, false);
+	}
+
+	/* Move forwards through the pipeline and propagate any updates. */
+	list_for_each_entry(entity, &pipe->entities, list_pipe) {
+		if (entity->ops->partition)
+			entity->ops->partition(entity, pipe, partition, index,
+					       window, true);
 	}
 }
 
diff --git a/drivers/media/platform/vsp1/vsp1_pipe.h b/drivers/media/platform/vsp1/vsp1_pipe.h
index dd8b2cdc6452..1cc6685eadec 100644
--- a/drivers/media/platform/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/vsp1/vsp1_pipe.h
@@ -58,26 +58,30 @@ enum vsp1_pipeline_state {
  * @left: horizontal coordinate of the partition start in pixels relative to the
  *	  left edge of the image
  * @width: partition width in pixels
+ * @offset: The number of pixels from the left edge of the window to clip
  */
 struct vsp1_partition_window {
 	unsigned int left;
 	unsigned int width;
+	unsigned int offset;
 };
 
 /*
  * struct vsp1_partition - A description of a slice for the partition algorithm
- * @rpf: The RPF partition window configuration
+ * @rpf: The RPF output partition window configuration
  * @uds_sink: The UDS input partition window configuration
  * @uds_source: The UDS output partition window configuration
- * @sru: The SRU partition window configuration
- * @wpf: The WPF partition window configuration
+ * @wpf: The WPF input partition window configuration
+ * @start_phase: The UDS start phase for this partition
+ * @end_phase: The UDS end phase for this partition
  */
 struct vsp1_partition {
 	struct vsp1_partition_window rpf;
 	struct vsp1_partition_window uds_sink;
 	struct vsp1_partition_window uds_source;
-	struct vsp1_partition_window sru;
 	struct vsp1_partition_window wpf;
+	unsigned int start_phase;
+	unsigned int end_phase;
 };
 
 /*
@@ -165,6 +169,8 @@ void vsp1_pipeline_propagate_alpha(struct vsp1_pipeline *pipe,
 				   unsigned int alpha);
 
 bool vsp1_pipeline_partitioned(struct vsp1_pipeline *pipe);
+bool vsp1_pipeline_partition_last(struct vsp1_pipeline *pipe,
+				  unsigned int index);
 void vsp1_pipeline_propagate_partition(struct vsp1_pipeline *pipe,
 				       struct vsp1_partition *partition,
 				       unsigned int index,
diff --git a/drivers/media/platform/vsp1/vsp1_rpf.c b/drivers/media/platform/vsp1/vsp1_rpf.c
index ef9bf5dd55a0..46d270644fe2 100644
--- a/drivers/media/platform/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/vsp1/vsp1_rpf.c
@@ -324,9 +324,13 @@ static void rpf_partition(struct vsp1_entity *entity,
 			  struct vsp1_pipeline *pipe,
 			  struct vsp1_partition *partition,
 			  unsigned int partition_idx,
-			  struct vsp1_partition_window *window)
+			  struct vsp1_partition_window *window,
+			  bool forwards)
 {
-	partition->rpf = *window;
+	if (forwards)
+		*window = partition->rpf;
+	else
+		partition->rpf = *window;
 }
 
 static const struct vsp1_entity_operations rpf_entity_ops = {
diff --git a/drivers/media/platform/vsp1/vsp1_sru.c b/drivers/media/platform/vsp1/vsp1_sru.c
index b1617cb1f2b9..d019bd2127aa 100644
--- a/drivers/media/platform/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/vsp1/vsp1_sru.c
@@ -327,24 +327,68 @@ static void sru_partition(struct vsp1_entity *entity,
 			  struct vsp1_pipeline *pipe,
 			  struct vsp1_partition *partition,
 			  unsigned int partition_idx,
-			  struct vsp1_partition_window *window)
+			  struct vsp1_partition_window *window,
+			  bool forwards)
 {
 	struct vsp1_sru *sru = to_sru(&entity->subdev);
 	struct v4l2_mbus_framefmt *input;
 	struct v4l2_mbus_framefmt *output;
+	bool scale_up;
 
 	input = vsp1_entity_get_pad_format(&sru->entity, sru->entity.config,
 					   SRU_PAD_SINK);
 	output = vsp1_entity_get_pad_format(&sru->entity, sru->entity.config,
 					    SRU_PAD_SOURCE);
 
-	/* Adapt if SRUx2 is enabled. */
-	if (input->width != output->width) {
+	scale_up = (input->width != output->width);
+
+	if (forwards) {
+		/* Propagate the clipping offsets forwards. */
+		if (window->left != 0)
+			window->offset++;
+
+		if (scale_up)
+			window->offset *= 2;
+
+		return;
+	}
+
+	/*
+	 * The SRU has a 3-tap pre-filter that generates the same number of
+	 * pixels as it consumes. Edge output pixels are computed using edge
+	 * pixel duplication at the input. This results in one incorrect output
+	 * pixel on each side of the partition window after the pre-filter. To
+	 * compensate for this, require one additional input pixel on each side
+	 * before the pre-filter (thus before scaling).
+	 *
+	 * Additionally, the 2x up-scaler uses a bilinear post-filter and
+	 * generates odd pixels from their two neighbours. The rightmost output
+	 * pixel is thus computed using edge pixel duplication on the right side
+	 * of the input (the leftmost output pixel is an even pixel, aligned
+	 * with the leftmost input pixel and thus depends only on the
+	 * corresponding pixel after the pre-filter). To compensate for this,
+	 * require one additional input pixel on the right side when up-scaling.
+	 */
+
+	if (scale_up) {
+		/* Clipping offsets are not back-propagated. */
 		window->width /= 2;
 		window->left /= 2;
+
+		/* SRUx2 requires an extra pixel at the right edge. */
+		if (!vsp1_pipeline_partition_last(pipe, partition_idx))
+			window->width++;
+	}
+
+	/* Expand to the left edge. */
+	if (window->left != 0) {
+		window->left--;
+		window->width++;
 	}
 
-	partition->sru = *window;
+	/* Expand to the right edge. */
+	if (!vsp1_pipeline_partition_last(pipe, partition_idx))
+		window->width++;
 }
 
 static const struct vsp1_entity_operations sru_entity_ops = {
diff --git a/drivers/media/platform/vsp1/vsp1_uds.c b/drivers/media/platform/vsp1/vsp1_uds.c
index effebfc0c862..65f8fe77d822 100644
--- a/drivers/media/platform/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/vsp1/vsp1_uds.c
@@ -274,6 +274,7 @@ static void uds_configure_stream(struct vsp1_entity *entity,
 	const struct v4l2_mbus_framefmt *input;
 	unsigned int hscale;
 	unsigned int vscale;
+	bool manual_phase = vsp1_pipeline_partitioned(pipe);
 	bool multitap;
 
 	input = vsp1_entity_get_pad_format(&uds->entity, uds->entity.config,
@@ -298,7 +299,8 @@ static void uds_configure_stream(struct vsp1_entity *entity,
 
 	vsp1_uds_write(uds, dlb, VI6_UDS_CTRL,
 		       (uds->scale_alpha ? VI6_UDS_CTRL_AON : 0) |
-		       (multitap ? VI6_UDS_CTRL_BC : 0));
+		       (multitap ? VI6_UDS_CTRL_BC : 0) |
+		       (manual_phase ? VI6_UDS_CTRL_AMDSLH : 0));
 
 	vsp1_uds_write(uds, dlb, VI6_UDS_PASS_BWIDTH,
 		       (uds_passband_width(hscale)
@@ -326,7 +328,8 @@ static void uds_configure_partition(struct vsp1_entity *entity,
 
 	/* Input size clipping. */
 	vsp1_uds_write(uds, dlb, VI6_UDS_HSZCLIP, VI6_UDS_HSZCLIP_HCEN |
-		       (0 << VI6_UDS_HSZCLIP_HCL_OFST_SHIFT) |
+		       (partition->uds_sink.offset
+				<< VI6_UDS_HSZCLIP_HCL_OFST_SHIFT) |
 		       (partition->uds_sink.width
 				<< VI6_UDS_HSZCLIP_HCL_SIZE_SHIFT));
 
@@ -336,6 +339,12 @@ static void uds_configure_partition(struct vsp1_entity *entity,
 				<< VI6_UDS_CLIP_SIZE_HSIZE_SHIFT) |
 		       (output->height
 				<< VI6_UDS_CLIP_SIZE_VSIZE_SHIFT));
+
+	vsp1_uds_write(uds, dlb, VI6_UDS_HPHASE,
+		       (partition->start_phase
+				<< VI6_UDS_HPHASE_HSTP_SHIFT) |
+		       (partition->end_phase
+				<< VI6_UDS_HPHASE_HEDP_SHIFT));
 }
 
 static unsigned int uds_max_width(struct vsp1_entity *entity,
@@ -378,26 +387,132 @@ static void uds_partition(struct vsp1_entity *entity,
 			  struct vsp1_pipeline *pipe,
 			  struct vsp1_partition *partition,
 			  unsigned int partition_idx,
-			  struct vsp1_partition_window *window)
+			  struct vsp1_partition_window *window,
+			  bool forwards)
 {
 	struct vsp1_uds *uds = to_uds(&entity->subdev);
 	const struct v4l2_mbus_framefmt *output;
 	const struct v4l2_mbus_framefmt *input;
-
-	/* Initialise the partition state. */
-	partition->uds_sink = *window;
-	partition->uds_source = *window;
+	unsigned int hscale;
+	unsigned int margin;
+	unsigned int mp;
+	unsigned int src_left;
+	unsigned int src_right;
+	unsigned int dst_left;
+	unsigned int dst_right;
+	unsigned int remainder;
+
+	if (forwards) {
+		/* Accept and consume any input offset (clipping) request. */
+		partition->uds_sink.offset = window->offset;
+		window->offset = 0;
+
+		/* pass on the output we computed in the backwards pass. */
+		*window = partition->uds_source;
+
+		return;
+	}
 
 	input = vsp1_entity_get_pad_format(&uds->entity, uds->entity.config,
 					   UDS_PAD_SINK);
 	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.config,
 					    UDS_PAD_SOURCE);
 
-	partition->uds_sink.width = window->width * input->width
-				  / output->width;
-	partition->uds_sink.left = window->left * input->width
-				 / output->width;
+	/*
+	 * Quantify the margin required for discontinuous overlap, and expand
+	 * the window no further than the limits of the image.
+	 *
+	 * When downscaling, the UDS has a pre-scaling binning filter which
+	 * reduces the input by either 2 or 4 depending on the downscale ratio,
+	 * which we must align with. The output is then fed into a 5 tap
+	 * bi-cubic filter requiring us to expand our output window by 2 pixels
+	 * on each side.
+	 *
+	 * When upscaling the extra margin is required from the input side and
+	 * we round up the expansion to a power of 2.
+	 */
+	hscale = uds_compute_ratio(input->width, output->width);
+	margin = hscale < 0x0200 ? 32 : /* 8 <  scale */
+		 hscale < 0x0400 ? 16 : /* 4 <  scale <= 8 */
+		 hscale < 0x0800 ?  8 : /* 2 <  scale <= 4 */
+		 hscale < 0x1000 ?  4 : /* 1 <  scale <= 2 */
+				    2;  /*	scale <= 1 (downscaling) */
+
+	dst_left = max_t(int, 0, window->left - margin);
+	dst_right = min_t(int, output->width - 1,
+			  window->left + window->width - 1 + margin);
+
+	/*
+	 * We must correctly identify the input positions which represent the
+	 * output positions taking into account all of the processing the
+	 * hardware does. This requires several operations (Steps 1-5 below).
+	 *
+	 * First convert output positions to input positions, then convert
+	 * back to output positions to account for any rounding requirements.
+	 * Once adjusted, the final input positions are determined.
+	 */
+
+	mp = uds_pre_scaling_divisor(hscale);
+
+	/* Step 1: Calculate temporary src_left (src_pos0) position. */
+	/* Step 2: Calculate temporary dst_left (dst_pos0_pb) position. */
+	if (partition_idx == 0) {
+		src_left = 0;
+		dst_left = 0;
+	} else {
+		unsigned int sub_src = mp == 1 ? 1 : 2;
+
+		src_left = ((dst_left * hscale) / (4096 * mp) - sub_src) * mp;
+		dst_left = src_left * 4096 / hscale;
+	}
+
+	/*
+	 * Step 3: Pull back dst_left (dst_pos0_pb) to the left to satisfy
+	 * alignment restrictions (the input of the bicubic filter must be
+	 * aligned to a multiple of the pre-filter divisor).
+	 */
+	remainder = (dst_left * hscale) % mp;
+	if (remainder)
+		/* Remainder can only be two when mp == 4. */
+		dst_left = round_down(dst_left, hscale % mp == 2 ? 2 : mp);
+
+	/* Step 4: Recalculate src_left from newly adjusted dst_left. */
+	src_left = DIV_ROUND_UP(dst_left * hscale, 4096 * mp) * mp;
+
+	/* Step 5: Calculate src_right (src_pos1). */
+	if (partition_idx == pipe->partitions - 1)
+		src_right = input->width - 1;
+	else
+		src_right = (((dst_right * hscale) / (mp * 4096)) + 2)
+			  * mp + (mp / 2);
+
+	/* Step 6: Calculate start phase (hstp). */
+	remainder = (src_left * hscale) % (mp * 4096);
+	partition->start_phase = (4096 - remainder / mp) % 4096;
+
+	/*
+	 * Step 7: Calculate end phase (hedp).
+	 *
+	 * We do not currently use VI6_UDS_CTRL_AMD from VI6_UDS_CTRL.
+	 * In the event that we enable VI6_UDS_CTRL_AMD, we must set the end
+	 * phase for the final partition to the phase_edge.
+	 */
+	partition->end_phase = 0;
+
+	/*
+	 * Fill in our partition windows with the updated positions, and
+	 * configure our output offset to allow extraneous pixels to be
+	 * clipped by later entities.
+	 */
+	partition->uds_sink.left = src_left;
+	partition->uds_sink.width = src_right - src_left + 1;
+
+	partition->uds_source.left = dst_left;
+	partition->uds_source.width = dst_right - dst_left + 1;
+
+	partition->uds_source.offset = window->left - dst_left;
 
+	/* Pass a copy of our sink down to the previous entity. */
 	*window = partition->uds_sink;
 }
 
diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
index 9bb8a24870bd..91439dda0a0f 100644
--- a/drivers/media/platform/vsp1/vsp1_video.c
+++ b/drivers/media/platform/vsp1/vsp1_video.c
@@ -212,6 +212,7 @@ static void vsp1_video_calculate_partition(struct vsp1_pipeline *pipe,
 	if (!vsp1_pipeline_partitioned(pipe)) {
 		window.left = 0;
 		window.width = format->width;
+		window.offset = 0;
 
 		vsp1_pipeline_propagate_partition(pipe, partition, index,
 						  &window);
@@ -221,6 +222,7 @@ static void vsp1_video_calculate_partition(struct vsp1_pipeline *pipe,
 	/* Initialise the partition with sane starting conditions. */
 	window.left = index * div_size;
 	window.width = div_size;
+	window.offset = 0;
 
 	modulus = format->width % div_size;
 
diff --git a/drivers/media/platform/vsp1/vsp1_wpf.c b/drivers/media/platform/vsp1/vsp1_wpf.c
index 9e8dbf99878b..2e8cc4195c31 100644
--- a/drivers/media/platform/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/vsp1/vsp1_wpf.c
@@ -371,16 +371,19 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
 						 RWPF_PAD_SINK);
 	width = sink_format->width;
 	height = sink_format->height;
+	offset = 0;
 
 	/*
 	 * Cropping. The partition algorithm can split the image into
 	 * multiple slices.
 	 */
-	if (vsp1_pipeline_partitioned(pipe))
+	if (vsp1_pipeline_partitioned(pipe)) {
 		width = pipe->partition->wpf.width;
+		offset = pipe->partition->wpf.offset;
+	}
 
 	vsp1_wpf_write(wpf, dlb, VI6_WPF_HSZCLIP, VI6_WPF_SZCLIP_EN |
-		       (0 << VI6_WPF_SZCLIP_OFST_SHIFT) |
+		       (offset << VI6_WPF_SZCLIP_OFST_SHIFT) |
 		       (width << VI6_WPF_SZCLIP_SIZE_SHIFT));
 	vsp1_wpf_write(wpf, dlb, VI6_WPF_VSZCLIP, VI6_WPF_SZCLIP_EN |
 		       (0 << VI6_WPF_SZCLIP_OFST_SHIFT) |
@@ -491,8 +494,15 @@ static void wpf_partition(struct vsp1_entity *entity,
 			  struct vsp1_pipeline *pipe,
 			  struct vsp1_partition *partition,
 			  unsigned int partition_idx,
-			  struct vsp1_partition_window *window)
+			  struct vsp1_partition_window *window,
+			  bool forwards)
 {
+	if (forwards) {
+		/* Only handle incoming cropping requirements. */
+		partition->wpf.offset = window->offset;
+		return;
+	}
+
 	partition->wpf = *window;
 }
 
-- 
2.20.1


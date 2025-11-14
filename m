Return-Path: <linux-media+bounces-47070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D653C5CC6D
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 12:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 344334EB363
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 11:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D35D41C71;
	Fri, 14 Nov 2025 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z83OdgV9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B42E9EA4
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118276; cv=none; b=FJetYz3nwMioVvel69V+qZlVjklFWIzSTseqZwzu9EXWIKOG9iN/0yYDsh4MMPudWjgI79dkKjN/VHKOtcgMZ9DfWGX2kACoKPAdAcJtKvGqItBN2xrX6rZj3/5z6UyTQtwA7PeTEvWs9+3zmIzfE62LvgJIaxvy8XIjVw4wdpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118276; c=relaxed/simple;
	bh=wr2Uppp7JHDsB3+YRezDYxGLsI0WfK06XoFO4Rwrggw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRHkEQAP1YKZU5q84crBA6tGL/3kuRE8fgk5f46T0LciuTZZzXCamcbZ0X7MexLXO1pS3Cdfv2ho0xgEzrPND+lGIPlLIgktyUWbdSfagY47j7JaambdT8nfIGVBmhxHjzlVbzvOTMTYn4m7LMhB/Ax1PQX20siQYX9FreeUskw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z83OdgV9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E33FABD2;
	Fri, 14 Nov 2025 12:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763118149;
	bh=wr2Uppp7JHDsB3+YRezDYxGLsI0WfK06XoFO4Rwrggw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z83OdgV9fGjXSbwahIqVqnn8NNwAfxFabnrpLgYhKgNcPwsDsGSfBLLrcTUBid500
	 2NGI/ipzKB2fXgtSd7BkNPIvri3xeYz9yR4dNMGI110oorFA9xSUPKzEDDmAAROKef
	 9gY4KIv7k5x6ylJt9bK5nLNY557yOGpPidt5tQnw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: hans@jjverkuil.nl,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: v4l2-isp: Rename block_info to block_type_info
Date: Fri, 14 Nov 2025 12:02:11 +0100
Message-ID: <20251114110213.523187-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114110213.523187-1-jacopo.mondi@ideasonboard.com>
References: <20251114110213.523187-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_isp_params_block_info structure contains validation information
that apply to a block -type- and not only to a specific ISP block
implementation.

Clarify this by renaming v4l2_isp_params_block_info in
v4l2_isp_params_block_type_info and update the documentation and the
users of v4l2-isp accordingly.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../platform/amlogic/c3/isp/c3-isp-params.c   |  9 ++++---
 .../platform/arm/mali-c55/mali-c55-params.c   |  7 ++---
 .../platform/rockchip/rkisp1/rkisp1-params.c  |  9 ++++---
 drivers/media/v4l2-core/v4l2-isp.c            | 16 ++++++------
 include/media/v4l2-isp.h                      | 26 +++++++++----------
 5 files changed, 35 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index c2339d6dc107..6f9ca7a7dd88 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -536,7 +536,8 @@ static const c3_isp_block_handler c3_isp_params_handlers[] = {
 		.size = sizeof(struct c3_isp_params_ ## data), \
 	}
 
-static const struct v4l2_isp_params_block_info c3_isp_params_blocks_info[] = {
+static const struct v4l2_isp_params_block_type_info
+c3_isp_params_block_types_info[] = {
 	C3_ISP_PARAMS_BLOCK_INFO(AWB_GAINS, awb_gains),
 	C3_ISP_PARAMS_BLOCK_INFO(AWB_CONFIG, awb_config),
 	C3_ISP_PARAMS_BLOCK_INFO(AE_CONFIG, ae_config),
@@ -548,7 +549,7 @@ static const struct v4l2_isp_params_block_info c3_isp_params_blocks_info[] = {
 };
 
 static_assert(ARRAY_SIZE(c3_isp_params_handlers) ==
-	      ARRAY_SIZE(c3_isp_params_blocks_info));
+	      ARRAY_SIZE(c3_isp_params_block_types_info));
 
 static void c3_isp_params_cfg_blocks(struct c3_isp_params *params)
 {
@@ -781,8 +782,8 @@ static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
 
 	return v4l2_isp_params_validate_buffer(params->isp->dev, vb,
 					(struct v4l2_isp_params_buffer *)cfg,
-					c3_isp_params_blocks_info,
-					ARRAY_SIZE(c3_isp_params_blocks_info));
+					c3_isp_params_block_types_info,
+					ARRAY_SIZE(c3_isp_params_block_types_info));
 }
 
 static int c3_isp_params_vb2_buf_init(struct vb2_buffer *vb)
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index e46b7c7b5e69..cfa79a50083e 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -428,7 +428,8 @@ static const mali_c55_params_handler mali_c55_params_handlers[] = {
 	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = &mali_c55_params_lsc_selection,
 };
 
-static const struct v4l2_isp_params_block_info mali_c55_params_blocks_info[] = {
+static const struct v4l2_isp_params_block_type_info
+mali_c55_params_block_types_info[] = {
 	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = {
 		.size = sizeof(struct mali_c55_params_sensor_off_preshading),
 	},
@@ -599,8 +600,8 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
 	memcpy(buf->config, config, v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
 
 	return v4l2_isp_params_validate_buffer(mali_c55->dev, vb, buf->config,
-					       mali_c55_params_blocks_info,
-					       ARRAY_SIZE(mali_c55_params_blocks_info));
+					       mali_c55_params_block_types_info,
+					       ARRAY_SIZE(mali_c55_params_block_types_info));
 }
 
 static void mali_c55_params_buf_queue(struct vb2_buffer *vb)
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 2dde0c62c8e6..c9f88635224c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2198,7 +2198,8 @@ static const struct rkisp1_ext_params_handler {
 		.size = sizeof(struct rkisp1_ext_params_ ## data ## _config), \
 	}
 
-static const struct v4l2_isp_params_block_info rkisp1_ext_params_blocks_info[] = {
+static const struct v4l2_isp_params_block_type_info
+rkisp1_ext_params_block_types_info[] = {
 	RKISP1_PARAMS_BLOCK_INFO(BLS, bls),
 	RKISP1_PARAMS_BLOCK_INFO(DPCC, dpcc),
 	RKISP1_PARAMS_BLOCK_INFO(SDG, sdg),
@@ -2223,7 +2224,7 @@ static const struct v4l2_isp_params_block_info rkisp1_ext_params_blocks_info[] =
 };
 
 static_assert(ARRAY_SIZE(rkisp1_ext_params_handlers) ==
-	      ARRAY_SIZE(rkisp1_ext_params_blocks_info));
+	      ARRAY_SIZE(rkisp1_ext_params_block_types_info));
 
 static void rkisp1_ext_params_config(struct rkisp1_params *params,
 				     struct rkisp1_ext_params_cfg *cfg,
@@ -2677,8 +2678,8 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
 
 	return v4l2_isp_params_validate_buffer(params->rkisp1->dev, vb,
 				(struct v4l2_isp_params_buffer *)cfg,
-				rkisp1_ext_params_blocks_info,
-				ARRAY_SIZE(rkisp1_ext_params_blocks_info));
+				rkisp1_ext_params_block_types_info,
+				ARRAY_SIZE(rkisp1_ext_params_block_types_info));
 }
 
 static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index 756d2b4996cc..29831f7032e9 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -38,8 +38,8 @@ EXPORT_SYMBOL_GPL(v4l2_isp_params_validate_buffer_size);
 
 int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 				    const struct v4l2_isp_params_buffer *buffer,
-				    const struct v4l2_isp_params_block_info *info,
-				    size_t num_blocks)
+				    const struct v4l2_isp_params_block_type_info *type_info,
+				    size_t num_block_types)
 {
 	size_t header_size = offsetof(struct v4l2_isp_params_buffer, data);
 	size_t payload_size = vb2_get_plane_payload(vb, 0);
@@ -71,13 +71,13 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 	/* Walk the list of ISP configuration blocks and validate them. */
 	buffer_size = buffer->data_size;
 	while (buffer_size >= sizeof(struct v4l2_isp_params_block_header)) {
-		const struct v4l2_isp_params_block_info *block_info;
+		const struct v4l2_isp_params_block_type_info *info;
 		const struct v4l2_isp_params_block_header *block;
 
 		block = (const struct v4l2_isp_params_block_header *)
 			(buffer->data + block_offset);
 
-		if (block->type >= num_blocks) {
+		if (block->type >= num_block_types) {
 			dev_dbg(dev,
 				"Invalid block type %u at offset %zu\n",
 				block->type, block_offset);
@@ -100,17 +100,17 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 		}
 
 		/*
-		 * Match the block reported size against the info provided
+		 * Match the block reported size against the type info provided
 		 * one, but allow the block to only contain the header in
 		 * case it is going to be disabled.
 		 */
-		block_info = &info[block->type];
-		if (block->size != block_info->size &&
+		info = &type_info[block->type];
+		if (block->size != info->size &&
 		    (!(block->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) ||
 		    block->size != sizeof(*block))) {
 			dev_dbg(dev,
 				"Invalid block size %u (expected %zu) at offset %zu\n",
-				block->size, block_info->size, block_offset);
+				block->size, info->size, block_offset);
 			return -EINVAL;
 		}
 
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index 8b4695663699..f3a6d0edcb24 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -49,18 +49,18 @@ int v4l2_isp_params_validate_buffer_size(struct device *dev,
 					 size_t max_size);
 
 /**
- * struct v4l2_isp_params_block_info - V4L2 ISP per-block info
- * @size: the block expected size
+ * struct v4l2_isp_params_block_type_info - V4L2 ISP per-block-type info
+ * @size: the block type expected size
  *
- * The v4l2_isp_params_block_info collects information of the ISP configuration
- * blocks for validation purposes. It currently only contains the expected
- * block size.
+ * The v4l2_isp_params_block_type_info collects information of the ISP
+ * configuration block types for validation purposes. It currently only contains
+ * the expected block type size.
  *
- * Drivers shall prepare a list of block info, indexed by block type, one for
- * each supported ISP block and correctly populate them with the expected block
- * size.
+ * Drivers shall prepare a list of block type info, indexed by block type, one
+ * for each supported ISP block type and correctly populate them with the
+ * expected block type size.
  */
-struct v4l2_isp_params_block_info {
+struct v4l2_isp_params_block_type_info {
 	size_t size;
 };
 
@@ -69,8 +69,8 @@ struct v4l2_isp_params_block_info {
  * @dev: the driver's device pointer
  * @vb: the videobuf2 buffer
  * @buffer: the V4L2 ISP parameters buffer
- * @info: the list of per-block validation info
- * @num_blocks: the number of blocks
+ * @type_info: the array of per-block-type validation info
+ * @num_block_types: the number of block types in the type_info array
  *
  * This function completes the validation of a V4L2 ISP parameters buffer,
  * verifying each configuration block correctness before the driver can use
@@ -85,7 +85,7 @@ struct v4l2_isp_params_block_info {
  */
 int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 				    const struct v4l2_isp_params_buffer *buffer,
-				    const struct v4l2_isp_params_block_info *info,
-				    size_t num_blocks);
+				    const struct v4l2_isp_params_block_type_info *type_info,
+				    size_t num_block_types);
 
 #endif /* _V4L2_ISP_H_ */
-- 
2.51.1



Return-Path: <linux-media+bounces-31229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACBCA9F573
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 18:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6B0B4624F1
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 16:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61EF27A913;
	Mon, 28 Apr 2025 16:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2piPjwO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC9C26FA75
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 16:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857029; cv=none; b=Ey2ACPeGF7ZFnuYdo8LJYWjY+RsnMnHB78QmnzIw3pj07j31mljS4jFbvKVrJiDTh1F0Jymi7r7pEYo3W7WCZu0gvT5nSvSP/MDk9r/C7U+3UiLNTxbIwg7J7ZNXtCDw4VadFExeD8VCWcmN/B8pT8Rnwe9rZEc3DoODhZLcBm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857029; c=relaxed/simple;
	bh=YzaJRrx7W7U+3QJHliKu4/bLXc1EUb+6iHZ7IwuArU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KiTvmE0EA1P/xmGDKxLi+5a+8umEYE1a/P4emTY0mAOLogHBMC+dzrum8D+hFh1E+cWLyAkhxarn6fh+PO3g+3/TFIKSldCQJEpSjWRHF4P+zLjlXsWXP8+luT5Xs9vlT7qKDm9q8GthpBtPKZP7XzhFffZdqiw4OHmLf6uEDhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2piPjwO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745857027; x=1777393027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YzaJRrx7W7U+3QJHliKu4/bLXc1EUb+6iHZ7IwuArU0=;
  b=K2piPjwOcBFElTGt2Bw6PCWYE6sUW8X8F7nhLO7HnllvXpeLDE4slx47
   YEpIcjb2srcSLamnzzXOrsAAhA8gjL3/S+ofdAuuS4pO6KS+OBzPumEOG
   oBtFX09tGLb5gETgsYi2BSsPE0iTVVIhbmpVWNEdcwwoICKtNn0NuZqZf
   xeMa9cJGEAEVT8qU/cHJyxrrntuBC7nAd33j7G7UCBkkJvkuwlB4Wh9B4
   MYRtDs8+WkOI46WUUKqlMeNdYjPxuY6XZXK2BhDbWQm6m5KWsBTSy8R/H
   Q5S80JyiOnf0w2O10BT6VMThcLhxTgr/B222sIOgSJXnrbfvmGpyq5nnO
   w==;
X-CSE-ConnectionGUID: juSzjIdqT0+NHTrBwKII0w==
X-CSE-MsgGUID: M5XnfJKmSSiPDytha7xw5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47547152"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="47547152"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:17:07 -0700
X-CSE-ConnectionGUID: VzanNwUPS4KGMVe218wQIw==
X-CSE-MsgGUID: 4xN6c1qtTXe0nOb/8oNHHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="164522951"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.253.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:17:07 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 5/5] media: intel/ipu6: Move ipu_isys_subdev functions to common code
Date: Mon, 28 Apr 2025 18:16:43 +0200
Message-Id: <20250428161643.321617-6-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428161643.321617-1-stanislaw.gruszka@linux.intel.com>
References: <20250428161643.321617-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move more functions (those that utilize ipu_isys_subdev structure
internally), to common code to be shared with ipu7 driver.

Additionally use isd variable name for ipu_isys_subdevice, asd name
is used for historical reason - precursor of the drier was atomisp driver,
the variables names stayed unchanged, what is a little confusing.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu-isys-subdev.c    | 161 ++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu-isys.h       |  11 ++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |   8 +-
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 179 +-----------------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  11 +-
 5 files changed, 178 insertions(+), 192 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu-isys-subdev.c
index 27b816a7303c..9f6e09a19140 100644
--- a/drivers/media/pci/intel/ipu6/ipu-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu-isys-subdev.c
@@ -92,3 +92,164 @@ int ipu_isys_subdev_set_routing(struct v4l2_subdev *sd,
 {
 	return subdev_set_routing(sd, state, routing);
 }
+
+int ipu_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    struct v4l2_subdev_format *format)
+{
+	struct ipu_isys_subdev *isd = to_ipu_isys_subdev(sd);
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_rect *crop;
+	u32 code = isd->supported_codes[0];
+	u32 other_pad, other_stream;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; isd->supported_codes[i]; i++) {
+		if (isd->supported_codes[i] == format->format.code) {
+			code = isd->supported_codes[i];
+			break;
+		}
+	}
+	format->format.code = code;
+	format->format.field = V4L2_FIELD_NONE;
+
+	/* Store the format and propagate it to the source pad. */
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	if (!(sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_SINK))
+		return 0;
+
+	/* propagate format to following source pad */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
+						    format->pad, format->stream,
+						    &other_pad, &other_stream);
+	if (ret)
+		return -EINVAL;
+
+	crop = v4l2_subdev_state_get_crop(state, other_pad, other_stream);
+	/* reset crop */
+	crop->left = 0;
+	crop->top = 0;
+	crop->width = fmt->width;
+	crop->height = fmt->height;
+
+	return 0;
+}
+
+int ipu_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ipu_isys_subdev *isd = to_ipu_isys_subdev(sd);
+	const u32 *supported_codes = isd->supported_codes;
+	u32 index;
+
+	for (index = 0; supported_codes[index]; index++) {
+		if (index == code->index) {
+			code->code = supported_codes[index];
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int ipu_isys_subdev_init_state(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route route = {
+		.sink_pad = 0,
+		.sink_stream = 0,
+		.source_pad = 1,
+		.source_stream = 0,
+		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+	};
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = 1,
+		.routes = &route,
+	};
+
+	return subdev_set_routing(sd, state, &routing);
+}
+
+static const struct v4l2_subdev_internal_ops ipu_isys_subdev_internal_ops = {
+	.init_state = ipu_isys_subdev_init_state,
+};
+
+int ipu_isys_subdev_init(struct ipu_isys_subdev *isd, struct device *dev,
+			 const struct v4l2_subdev_ops *ops,
+			 unsigned int nr_ctrls, unsigned int num_sink_pads,
+			 unsigned int num_source_pads)
+{
+	unsigned int num_pads = num_sink_pads + num_source_pads;
+	unsigned int i;
+	int ret;
+
+	v4l2_subdev_init(&isd->sd, ops);
+
+	isd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			 V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
+	isd->sd.owner = THIS_MODULE;
+	isd->sd.dev = dev;
+	isd->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	isd->sd.internal_ops = &ipu_isys_subdev_internal_ops;
+
+	isd->pad = devm_kcalloc(dev, num_pads, sizeof(*isd->pad), GFP_KERNEL);
+	if (!isd->pad)
+		return -ENOMEM;
+
+	for (i = 0; i < num_sink_pads; i++)
+		isd->pad[i].flags = MEDIA_PAD_FL_SINK |
+				    MEDIA_PAD_FL_MUST_CONNECT;
+
+	for (i = num_sink_pads; i < num_pads; i++)
+		isd->pad[i].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&isd->sd.entity, num_pads, isd->pad);
+	if (ret)
+		return ret;
+
+	if (isd->ctrl_init) {
+		ret = v4l2_ctrl_handler_init(&isd->ctrl_handler, nr_ctrls);
+		if (ret)
+			goto out_media_entity_cleanup;
+
+		isd->ctrl_init(&isd->sd);
+		if (isd->ctrl_handler.error) {
+			ret = isd->ctrl_handler.error;
+			goto out_v4l2_ctrl_handler_free;
+		}
+
+		isd->sd.ctrl_handler = &isd->ctrl_handler;
+	}
+
+	isd->source = -1;
+
+	return 0;
+
+out_v4l2_ctrl_handler_free:
+	v4l2_ctrl_handler_free(&isd->ctrl_handler);
+
+out_media_entity_cleanup:
+	media_entity_cleanup(&isd->sd.entity);
+
+	return ret;
+}
+
+void ipu_isys_subdev_cleanup(struct ipu_isys_subdev *isd)
+{
+	media_entity_cleanup(&isd->sd.entity);
+	v4l2_ctrl_handler_free(&isd->ctrl_handler);
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu-isys.h b/drivers/media/pci/intel/ipu6/ipu-isys.h
index c476d9119c1f..d39dbb11a4a7 100644
--- a/drivers/media/pci/intel/ipu6/ipu-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu-isys.h
@@ -30,4 +30,15 @@ int ipu_isys_subdev_set_routing(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state,
 				enum v4l2_subdev_format_whence which,
 				struct v4l2_subdev_krouting *routing);
+int ipu_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    struct v4l2_subdev_format *format);
+int ipu_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_mbus_code_enum *code);
+int ipu_isys_subdev_init(struct ipu_isys_subdev *isd, struct device *dev,
+			 const struct v4l2_subdev_ops *ops,
+			 unsigned int nr_ctrls, unsigned int num_sink_pads,
+			 unsigned int num_source_pads);
+void ipu_isys_subdev_cleanup(struct ipu_isys_subdev *isd);
 #endif
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 703a5112ba95..74bbacad67c5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -487,7 +487,7 @@ static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
 	.set_fmt = ipu6_isys_subdev_set_fmt,
 	.get_selection = ipu6_isys_csi2_get_sel,
 	.set_selection = ipu6_isys_csi2_set_sel,
-	.enum_mbus_code = ipu6_isys_subdev_enum_mbus_code,
+	.enum_mbus_code = ipu_isys_subdev_enum_mbus_code,
 	.set_routing = ipu_isys_subdev_set_routing,
 	.enable_streams = ipu6_isys_csi2_enable_streams,
 	.disable_streams = ipu6_isys_csi2_disable_streams,
@@ -510,7 +510,7 @@ void ipu6_isys_csi2_cleanup(struct ipu6_isys_csi2 *csi2)
 
 	v4l2_device_unregister_subdev(&csi2->asd.sd);
 	v4l2_subdev_cleanup(&csi2->asd.sd);
-	ipu6_isys_subdev_cleanup(&csi2->asd);
+	ipu_isys_subdev_cleanup(&csi2->asd);
 	csi2->isys = NULL;
 }
 
@@ -526,8 +526,8 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 	csi2->port = index;
 
 	csi2->asd.sd.entity.ops = &csi2_entity_ops;
-	ret = ipu6_isys_subdev_init(&csi2->asd, dev, &csi2_sd_ops, 0,
-				    NR_OF_CSI2_SINK_PADS, NR_OF_CSI2_SRC_PADS);
+	ret = ipu_isys_subdev_init(&csi2->asd, dev, &csi2_sd_ops, 0,
+				   NR_OF_CSI2_SINK_PADS, NR_OF_CSI2_SRC_PADS);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index 180eeb6fc981..42015f160d67 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -141,14 +141,6 @@ int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *format)
 {
-	struct ipu_isys_subdev *asd = to_ipu_isys_subdev(sd);
-	struct v4l2_mbus_framefmt *fmt;
-	struct v4l2_rect *crop;
-	u32 code = asd->supported_codes[0];
-	u32 other_pad, other_stream;
-	unsigned int i;
-	int ret;
-
 	/* No transcoding, source and sink formats must match. */
 	if ((sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_SOURCE) &&
 	    sd->entity.num_pads > 1)
@@ -160,174 +152,5 @@ int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
 				      IPU6_ISYS_MIN_HEIGHT,
 				      IPU6_ISYS_MAX_HEIGHT);
 
-	for (i = 0; asd->supported_codes[i]; i++) {
-		if (asd->supported_codes[i] == format->format.code) {
-			code = asd->supported_codes[i];
-			break;
-		}
-	}
-	format->format.code = code;
-	format->format.field = V4L2_FIELD_NONE;
-
-	/* Store the format and propagate it to the source pad. */
-	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
-	if (!fmt)
-		return -EINVAL;
-
-	*fmt = format->format;
-
-	if (!(sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_SINK))
-		return 0;
-
-	/* propagate format to following source pad */
-	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
-							   format->stream);
-	if (!fmt)
-		return -EINVAL;
-
-	*fmt = format->format;
-
-	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
-						    format->pad,
-						    format->stream,
-						    &other_pad,
-						    &other_stream);
-	if (ret)
-		return -EINVAL;
-
-	crop = v4l2_subdev_state_get_crop(state, other_pad, other_stream);
-	/* reset crop */
-	crop->left = 0;
-	crop->top = 0;
-	crop->width = fmt->width;
-	crop->height = fmt->height;
-
-	return 0;
-}
-
-int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_state *state,
-				    struct v4l2_subdev_mbus_code_enum *code)
-{
-	struct ipu_isys_subdev *asd = to_ipu_isys_subdev(sd);
-	const u32 *supported_codes = asd->supported_codes;
-	u32 index;
-
-	for (index = 0; supported_codes[index]; index++) {
-		if (index == code->index) {
-			code->code = supported_codes[index];
-			return 0;
-		}
-	}
-
-	return -EINVAL;
-}
-
-static int subdev_set_routing(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *state,
-			      struct v4l2_subdev_krouting *routing)
-{
-	static const struct v4l2_mbus_framefmt format = {
-		.width = 4096,
-		.height = 3072,
-		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
-		.field = V4L2_FIELD_NONE,
-	};
-	int ret;
-
-	ret = v4l2_subdev_routing_validate(sd, routing,
-					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
-	if (ret)
-		return ret;
-
-	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
-}
-
-static int ipu6_isys_subdev_init_state(struct v4l2_subdev *sd,
-				       struct v4l2_subdev_state *state)
-{
-	struct v4l2_subdev_route route = {
-		.sink_pad = 0,
-		.sink_stream = 0,
-		.source_pad = 1,
-		.source_stream = 0,
-		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
-	};
-	struct v4l2_subdev_krouting routing = {
-		.num_routes = 1,
-		.routes = &route,
-	};
-
-	return subdev_set_routing(sd, state, &routing);
-}
-
-static const struct v4l2_subdev_internal_ops ipu6_isys_subdev_internal_ops = {
-	.init_state = ipu6_isys_subdev_init_state,
-};
-
-int ipu6_isys_subdev_init(struct ipu_isys_subdev *asd, struct device *dev,
-			  const struct v4l2_subdev_ops *ops,
-			  unsigned int nr_ctrls, unsigned int num_sink_pads,
-			  unsigned int num_source_pads)
-{
-	unsigned int num_pads = num_sink_pads + num_source_pads;
-	unsigned int i;
-	int ret;
-
-	v4l2_subdev_init(&asd->sd, ops);
-
-	asd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			 V4L2_SUBDEV_FL_HAS_EVENTS |
-			 V4L2_SUBDEV_FL_STREAMS;
-	asd->sd.owner = THIS_MODULE;
-	asd->sd.dev = dev;
-	asd->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	asd->sd.internal_ops = &ipu6_isys_subdev_internal_ops;
-
-	asd->pad = devm_kcalloc(dev, num_pads, sizeof(*asd->pad), GFP_KERNEL);
-	if (!asd->pad)
-		return -ENOMEM;
-
-	for (i = 0; i < num_sink_pads; i++)
-		asd->pad[i].flags = MEDIA_PAD_FL_SINK |
-				    MEDIA_PAD_FL_MUST_CONNECT;
-
-	for (i = num_sink_pads; i < num_pads; i++)
-		asd->pad[i].flags = MEDIA_PAD_FL_SOURCE;
-
-	ret = media_entity_pads_init(&asd->sd.entity, num_pads, asd->pad);
-	if (ret)
-		return ret;
-
-	if (asd->ctrl_init) {
-		ret = v4l2_ctrl_handler_init(&asd->ctrl_handler, nr_ctrls);
-		if (ret)
-			goto out_media_entity_cleanup;
-
-		asd->ctrl_init(&asd->sd);
-		if (asd->ctrl_handler.error) {
-			ret = asd->ctrl_handler.error;
-			goto out_v4l2_ctrl_handler_free;
-		}
-
-		asd->sd.ctrl_handler = &asd->ctrl_handler;
-	}
-
-	asd->source = -1;
-
-	return 0;
-
-out_v4l2_ctrl_handler_free:
-	v4l2_ctrl_handler_free(&asd->ctrl_handler);
-
-out_media_entity_cleanup:
-	media_entity_cleanup(&asd->sd.entity);
-
-	return ret;
-}
-
-void ipu6_isys_subdev_cleanup(struct ipu_isys_subdev *asd)
-{
-	media_entity_cleanup(&asd->sd.entity);
-	v4l2_ctrl_handler_free(&asd->ctrl_handler);
+	return ipu_isys_subdev_set_fmt(sd, state, format);
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
index a58d2e80f7a2..954abaed2881 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (C) 2013--2024 Intel Corporation */
+/* Copyright (C) 2013-2025 Intel Corporation */
 
 #ifndef IPU6_ISYS_SUBDEV_H
 #define IPU6_ISYS_SUBDEV_H
@@ -16,13 +16,4 @@ u32 ipu6_isys_convert_bayer_order(u32 code, int x, int y);
 int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *fmt);
-int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_state *state,
-				    struct v4l2_subdev_mbus_code_enum
-				    *code);
-int ipu6_isys_subdev_init(struct ipu_isys_subdev *asd, struct device *dev,
-			  const struct v4l2_subdev_ops *ops,
-			  unsigned int nr_ctrls, unsigned int num_sink_pads,
-			  unsigned int num_source_pads);
-void ipu6_isys_subdev_cleanup(struct ipu_isys_subdev *asd);
 #endif /* IPU6_ISYS_SUBDEV_H */
-- 
2.34.1



Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84DB27AB380
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 16:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234284AbjIVOXT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 10:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234282AbjIVOXS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 10:23:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77175100
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 07:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695392591; x=1726928591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z3gzvSNH3TjcrYdaGe2KiouAkKXz3pqqtTet/7UrTsU=;
  b=Jq9TWMnfOS03n0E8cL6KFxhT0fGVZKmjkE/4yukX1dF0gycgf3NX/Zh8
   hy6JXrsfR5WqzuhTjzhdVD0MIgaFojVOp7X/54u7U9cC6U8LDydH6VR5c
   msIPsbbLjQOwp4uFn8lL5uhb1fitkcckcK5bLFFeWOb/3VBI/yHfzsn3J
   YlEKxNbd/rvqDmsL1+ctWbM/NO4e9F0ny4sbVK44l0eJiTxyvh1RfTepQ
   5+Kin84fkVk/JT3gUBZ1pATf1jG/723df3a2WbwR1kC7QbIlQXzf5suwq
   jO0thQtVsn2+lTiZl7QHZ5HBAjCYTS8P5TCvPqq1djo+7iUu3KlJOXGfx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360218962"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360218962"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="741112503"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="741112503"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:08 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 959E5120810;
        Fri, 22 Sep 2023 17:23:04 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v4 15/23] media: ccs: Add support for embedded data stream
Date:   Fri, 22 Sep 2023 17:22:31 +0300
Message-Id: <20230922142239.259425-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
References: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for embedded data stream, in UAPI and frame descriptor.

This patch adds also a new embedded data pad (2) to the source sub-device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 331 +++++++++++++++++++++++++++++--
 drivers/media/i2c/ccs/ccs.h      |  17 +-
 2 files changed, 324 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index b6614edf123b..29b2a10852e9 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2018,6 +2018,57 @@ static const struct ccs_csi_data_format
 	return sensor->csi_format;
 }
 
+#define CCS_EMBEDDED_CODE_DEPTH(depth, half_depth)			\
+	depth,								\
+	CCS_EMB_DATA_CAPABILITY_TWO_BYTES_PER_RAW##depth,		\
+	CCS_EMB_DATA_CAPABILITY_NO_ONE_BYTE_PER_RAW##depth,		\
+	CCS_EMB_DATA_CTRL_RAW##half_depth##_PACKING_FOR_RAW##depth,	\
+	MEDIA_BUS_FMT_META_##half_depth,				\
+	MEDIA_BUS_FMT_META_##depth,					\
+
+static const struct ccs_embedded_code {
+	u8 depth;
+	u8 cap_two_bytes_per_sample;
+	u8 cap_no_legacy;
+	u8 ctrl;
+	u32 code_two_bytes;
+	u32 code_legacy;
+} ccs_embedded_codes[] = {
+	{ CCS_EMBEDDED_CODE_DEPTH(16, 8) },
+	{ CCS_EMBEDDED_CODE_DEPTH(20, 10) },
+	{ CCS_EMBEDDED_CODE_DEPTH(24, 12) },
+};
+
+static const struct ccs_embedded_code *ccs_embedded_code(unsigned int bpp)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ccs_embedded_codes); i++)
+		if (ccs_embedded_codes[i].depth == bpp)
+			return ccs_embedded_codes + i;
+
+	WARN_ON(1);
+
+	return ccs_embedded_codes;
+}
+
+static u32
+ccs_default_embedded_code(struct ccs_sensor *sensor,
+			  const struct ccs_embedded_code *embedded_code)
+{
+	if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+	    BIT(embedded_code->cap_two_bytes_per_sample))
+		return embedded_code->code_two_bytes;
+
+	if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+	      BIT(embedded_code->cap_no_legacy)))
+		return embedded_code->code_legacy;
+
+	WARN_ON(1);
+
+	return embedded_code->code_legacy;
+}
+
 static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
@@ -2033,6 +2084,69 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
 		subdev->name, code->pad, code->index);
 
+	if (subdev == &sensor->src->sd) {
+		if (code->pad == CCS_PAD_META) {
+			if (code->index)
+				goto out;
+
+			code->code = MEDIA_BUS_FMT_CCS_EMBEDDED;
+
+			rval = 0;
+			goto out;
+		}
+		if (code->stream == CCS_STREAM_META) {
+			struct v4l2_mbus_framefmt *pix_fmt =
+				v4l2_subdev_state_get_stream_format(sd_state,
+								    CCS_PAD_SRC,
+								    CCS_STREAM_PIXEL);
+			const struct ccs_csi_data_format *csi_format =
+				ccs_validate_csi_data_format(sensor,
+							     pix_fmt->code);
+			unsigned int i = 0;
+			u32 codes[2];
+
+			switch (csi_format->compressed) {
+			case 8:
+				codes[i++] = MEDIA_BUS_FMT_META_8;
+				break;
+			case 10:
+				codes[i++] = MEDIA_BUS_FMT_META_10;
+				break;
+			case 12:
+				codes[i++] = MEDIA_BUS_FMT_META_12;
+				break;
+			case 14:
+				codes[i++] = MEDIA_BUS_FMT_META_14;
+				break;
+			case 16:
+			case 20:
+			case 24: {
+				const struct ccs_embedded_code *embedded_code =
+					ccs_embedded_code(csi_format->compressed);
+
+				if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+				    BIT(embedded_code->cap_two_bytes_per_sample))
+					codes[i++] =
+						embedded_code->code_two_bytes;
+
+				if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+				      BIT(embedded_code->cap_no_legacy)))
+					codes[i++] = embedded_code->code_legacy;
+				break;
+			}
+			default:
+				WARN_ON(1);
+			}
+
+			if (WARN_ON(i > ARRAY_SIZE(codes)) || code->index >= i)
+				goto out;
+
+			code->code = codes[code->index];
+			rval = 0;
+			goto out;
+		}
+	}
+
 	if (subdev != &sensor->src->sd || code->pad != CCS_PAD_SRC) {
 		if (code->index)
 			goto out;
@@ -2075,8 +2189,10 @@ static int __ccs_get_format(struct v4l2_subdev *subdev,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
-	fmt->format = *v4l2_subdev_get_pad_format(subdev, sd_state, fmt->pad);
-	fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
+	fmt->format = *v4l2_subdev_get_fmt_ptr(subdev, sd_state, fmt->pad, fmt->stream);
+
+	if (fmt->pad != CCS_PAD_META && fmt->stream != CCS_STREAM_META)
+		fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
 
 	return 0;
 }
@@ -2106,10 +2222,12 @@ static void ccs_get_crop_compose(struct v4l2_subdev *subdev,
 	if (crops)
 		for (i = 0; i < subdev->entity.num_pads; i++)
 			crops[i] =
-				v4l2_subdev_get_pad_crop(subdev, sd_state, i);
+				v4l2_subdev_get_crop_ptr(subdev, sd_state, i,
+							 CCS_STREAM_PIXEL);
 	if (comps)
-		*comps = v4l2_subdev_get_pad_compose(subdev, sd_state,
-						     ssd->sink_pad);
+		*comps = v4l2_subdev_get_compose_ptr(subdev, sd_state,
+						     ssd->sink_pad,
+						     CCS_STREAM_PIXEL);
 }
 
 /* Changes require propagation only on sink pad. */
@@ -2202,6 +2320,79 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 	return ccs_pll_update(sensor);
 }
 
+static int ccs_set_format_meta(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_mbus_framefmt *fmt)
+{
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	const struct ccs_csi_data_format *csi_format;
+	struct v4l2_mbus_framefmt *pix_fmt;
+	struct v4l2_mbus_framefmt *meta_fmt;
+	struct v4l2_mbus_framefmt *meta_out_fmt;
+	u32 code;
+
+	pix_fmt = v4l2_subdev_state_get_stream_format(sd_state, CCS_PAD_SRC,
+						      CCS_STREAM_PIXEL);
+	meta_fmt = v4l2_subdev_state_get_stream_format(sd_state, CCS_PAD_META,
+						       0);
+	meta_out_fmt = v4l2_subdev_state_get_stream_format(sd_state,
+							   CCS_PAD_SRC,
+							   CCS_STREAM_META);
+
+	code = fmt ? fmt->code : meta_out_fmt->code;
+
+	meta_out_fmt->width = meta_fmt->width = pix_fmt->width;
+	meta_out_fmt->height = meta_fmt->height =
+		sensor->embedded_end - sensor->embedded_start;
+	meta_fmt->code = MEDIA_BUS_FMT_CCS_EMBEDDED;
+
+	csi_format = ccs_validate_csi_data_format(sensor, pix_fmt->code);
+
+	switch (csi_format->compressed) {
+	case 8:
+		meta_out_fmt->code = MEDIA_BUS_FMT_META_8;
+		break;
+	case 10:
+		meta_out_fmt->code = MEDIA_BUS_FMT_META_10;
+		break;
+	case 12:
+		meta_out_fmt->code = MEDIA_BUS_FMT_META_12;
+		break;
+	case 14:
+		meta_out_fmt->code = MEDIA_BUS_FMT_META_14;
+		break;
+	case 16:
+	case 20:
+	case 24: {
+		const struct ccs_embedded_code *embedded_code;
+
+		embedded_code = ccs_embedded_code(csi_format->compressed);
+		meta_out_fmt->code =
+			ccs_default_embedded_code(sensor, embedded_code);
+
+		if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+		      BIT(embedded_code->cap_no_legacy)) &&
+		    code == embedded_code->code_legacy)
+			meta_out_fmt->code = embedded_code->code_legacy;
+
+		if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+		    BIT(embedded_code->cap_two_bytes_per_sample) &&
+		    code == embedded_code->code_two_bytes)
+			meta_out_fmt->code = embedded_code->code_two_bytes;
+
+		break;
+	}
+	default:
+		WARN_ON(1);
+		return 0;
+	}
+
+	if (fmt)
+		*fmt = *meta_out_fmt;
+
+	return 0;
+}
+
 static int ccs_set_format(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
@@ -2210,12 +2401,24 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *crops[CCS_PADS];
 
+	if (subdev == &sensor->src->sd && fmt->pad == CCS_PAD_META)
+		return ccs_get_format(subdev, sd_state, fmt);
+
 	mutex_lock(&sensor->mutex);
 
+	if (subdev == &sensor->src->sd && fmt->stream == CCS_STREAM_META) {
+		ccs_set_format_meta(subdev, sd_state, &fmt->format);
+
+		mutex_unlock(&sensor->mutex);
+
+		return 0;
+	}
+
 	if (fmt->pad == ssd->source_pad) {
 		int rval;
 
 		rval = ccs_set_format_source(subdev, sd_state, fmt);
+		ccs_set_format_meta(subdev, sd_state, 0);
 
 		mutex_unlock(&sensor->mutex);
 
@@ -2490,6 +2693,12 @@ static int ccs_sel_supported(struct v4l2_subdev *subdev,
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 
+	if (sel->stream != CCS_STREAM_PIXEL)
+		return -EINVAL;
+
+	if (sel->pad == CCS_PAD_META)
+		return -EINVAL;
+
 	/* We only implement crop in three places. */
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
@@ -2534,7 +2743,8 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 
 	if (sel->pad == ssd->sink_pad) {
 		struct v4l2_mbus_framefmt *mfmt =
-			v4l2_subdev_get_pad_format(subdev, sd_state, sel->pad);
+			v4l2_subdev_get_fmt_ptr(subdev, sd_state, sel->pad,
+						CCS_STREAM_PIXEL);
 
 		src_size.width = mfmt->width;
 		src_size.height = mfmt->height;
@@ -2594,8 +2804,10 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
 			ccs_get_native_size(ssd, &sel->r);
 		} else if (sel->pad == ssd->sink_pad) {
 			struct v4l2_mbus_framefmt *sink_fmt =
-				v4l2_subdev_get_pad_format(subdev, sd_state,
-							   ssd->sink_pad);
+				v4l2_subdev_get_fmt_ptr(subdev, sd_state,
+							ssd->sink_pad,
+							CCS_STREAM_PIXEL);
+
 			sel->r.top = sel->r.left = 0;
 			sel->r.width = sink_fmt->width;
 			sel->r.height = sink_fmt->height;
@@ -2681,6 +2893,13 @@ static int ccs_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
 	entry++;
 	desc->num_entries++;
 
+	if (sensor->embedded_start != sensor->embedded_end) {
+		entry->stream = CCS_STREAM_META;
+		entry->bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
+		entry++;
+		desc->num_entries++;
+	}
+
 	return 0;
 }
 
@@ -3042,18 +3261,23 @@ static void ccs_create_subdev(struct ccs_sensor *sensor,
 	ssd->sensor = sensor;
 
 	ssd->npads = num_pads;
-	ssd->source_pad = num_pads - 1;
+	ssd->source_pad =
+		ssd == sensor->pixel_array ? CCS_PA_PAD_SRC : CCS_PAD_SRC;
 
 	v4l2_i2c_subdev_set_name(&ssd->sd, client, sensor->minfo.name, name);
 
+	ssd->sd.entity.ops = &ccs_entity_ops;
+
 	ssd->pads[ssd->source_pad].flags = MEDIA_PAD_FL_SOURCE;
 	if (ssd != sensor->pixel_array)
 		ssd->pads[ssd->sink_pad].flags = MEDIA_PAD_FL_SINK;
 
-	ssd->sd.entity.ops = &ccs_entity_ops;
-
-	if (ssd == sensor->src)
+	if (ssd == sensor->src) {
+		ssd->sd.flags |= V4L2_SUBDEV_FL_STREAMS;
+		ssd->pads[CCS_PAD_META].flags =
+			MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
 		return;
+	}
 
 	ssd->sd.owner = THIS_MODULE;
 	ssd->sd.dev = &client->dev;
@@ -3071,11 +3295,16 @@ static int ccs_init_cfg(struct v4l2_subdev *sd,
 
 	for (i = 0; i < ssd->npads; i++) {
 		struct v4l2_mbus_framefmt *fmt =
-			v4l2_subdev_get_pad_format(sd, sd_state, i);
+			v4l2_subdev_get_fmt_ptr(sd, sd_state, i,
+						CCS_STREAM_PIXEL);
 		struct v4l2_rect *crop =
-			v4l2_subdev_get_pad_crop(sd, sd_state, i);
+			v4l2_subdev_get_crop_ptr(sd, sd_state, i,
+						 CCS_STREAM_PIXEL);
 		struct v4l2_rect *comp;
 
+		if (!fmt)
+			continue;
+
 		ccs_get_native_size(ssd, crop);
 
 		fmt->width = crop->width;
@@ -3086,7 +3315,8 @@ static int ccs_init_cfg(struct v4l2_subdev *sd,
 		if (ssd == sensor->pixel_array)
 			continue;
 
-		comp = v4l2_subdev_get_pad_compose(sd, sd_state, i);
+		comp = v4l2_subdev_get_compose_ptr(sd, sd_state, i,
+						   CCS_STREAM_PIXEL);
 		*comp = *crop;
 	}
 
@@ -3095,6 +3325,46 @@ static int ccs_init_cfg(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ccs_src_init_cfg(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = CCS_PAD_SINK,
+			.source_pad = CCS_PAD_SRC,
+			.source_stream = CCS_STREAM_PIXEL,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		}, {
+			.sink_pad = CCS_PAD_META,
+			.source_pad = CCS_PAD_SRC,
+			.source_stream = CCS_STREAM_META,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		}
+	};
+	struct v4l2_subdev_krouting routing = {
+		.routes = routes,
+		.num_routes = 1,
+	};
+	struct ccs_subdev *ssd = to_ccs_subdev(sd);
+	struct ccs_sensor *sensor = ssd->sensor;
+	int rval;
+
+	if (sensor->embedded_start != sensor->embedded_end)
+		routing.num_routes++;
+
+	rval = v4l2_subdev_set_routing(sd, sd_state, &routing);
+	if (rval)
+		return rval;
+
+	rval = ccs_init_cfg(sd, sd_state);
+	if (rval)
+		return rval;
+
+	if (sensor->embedded_start != sensor->embedded_end)
+		ccs_set_format_meta(sd, sd_state, NULL);
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops ccs_video_ops = {
 	.s_stream = ccs_set_stream,
 	.pre_streamon = ccs_pre_streamon,
@@ -3108,6 +3378,15 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
 	.set_fmt = ccs_set_format,
 	.get_selection = ccs_get_selection,
 	.set_selection = ccs_set_selection,
+};
+
+static const struct v4l2_subdev_pad_ops ccs_src_pad_ops = {
+	.init_cfg = ccs_src_init_cfg,
+	.enum_mbus_code = ccs_enum_mbus_code,
+	.get_fmt = ccs_get_format,
+	.set_fmt = ccs_set_format,
+	.get_selection = ccs_get_selection,
+	.set_selection = ccs_set_selection,
 	.get_frame_desc = ccs_get_frame_desc,
 };
 
@@ -3122,6 +3401,12 @@ static const struct v4l2_subdev_ops ccs_ops = {
 	.sensor = &ccs_sensor_ops,
 };
 
+static const struct v4l2_subdev_ops ccs_src_ops = {
+	.video = &ccs_video_ops,
+	.pad = &ccs_src_pad_ops,
+	.sensor = &ccs_sensor_ops,
+};
+
 static const struct media_entity_operations ccs_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -3275,7 +3560,7 @@ static int ccs_probe(struct i2c_client *client)
 
 	sensor->src = &sensor->ssds[sensor->ssds_used];
 
-	v4l2_i2c_subdev_init(&sensor->src->sd, client, &ccs_ops);
+	v4l2_i2c_subdev_init(&sensor->src->sd, client, &ccs_src_ops);
 	sensor->src->sd.internal_ops = &ccs_internal_src_ops;
 
 	sensor->regulators = devm_kcalloc(&client->dev,
@@ -3534,9 +3819,15 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
 
-	ccs_create_subdev(sensor, sensor->scaler, " scaler", 2,
+	ccs_create_subdev(sensor, sensor->scaler, " scaler",
+			  sensor->ssds_used != CCS_SUBDEVS ? CCS_PADS_NOMETA :
+			  sensor->embedded_start == sensor->embedded_end ?
+			  CCS_PADS_NOMETA : CCS_PADS,
 			  MEDIA_ENT_F_PROC_VIDEO_SCALER);
-	ccs_create_subdev(sensor, sensor->binner, " binner", 2,
+	ccs_create_subdev(sensor, sensor->binner, " binner",
+			  sensor->ssds_used == CCS_SUBDEVS ? CCS_PADS_NOMETA :
+			  sensor->embedded_start == sensor->embedded_end ?
+			  CCS_PADS_NOMETA : CCS_PADS,
 			  MEDIA_ENT_F_PROC_VIDEO_SCALER);
 	ccs_create_subdev(sensor, sensor->pixel_array, " pixel_array", 1,
 			  MEDIA_ENT_F_CAM_SENSOR);
@@ -3572,8 +3863,8 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->streaming = false;
 	sensor->dev_init_done = true;
 
-	rval = media_entity_pads_init(&sensor->src->sd.entity, 2,
-				 sensor->src->pads);
+	rval = media_entity_pads_init(&sensor->src->sd.entity,
+				      sensor->src->npads, sensor->src->pads);
 	if (rval < 0)
 		goto out_media_entity_cleanup;
 
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index d1099f6a36db..fdd9b42dafde 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -172,11 +172,18 @@ struct ccs_csi_data_format {
 #define CCS_SUBDEVS			3
 
 #define CCS_PA_PAD_SRC			0
-#define CCS_PAD_SINK			0
-#define CCS_PAD_SRC			1
-#define CCS_PADS			2
+enum {
+	CCS_PAD_SINK,
+	CCS_PAD_SRC,
+	CCS_PAD_META,
+	CCS_PADS_NOMETA = CCS_PAD_META,
+	CCS_PADS,
+};
 
-#define CCS_STREAM_PIXEL		0
+enum {
+	CCS_STREAM_PIXEL,
+	CCS_STREAM_META,
+};
 
 struct ccs_binning_subtype {
 	u8 horizontal:4;
@@ -226,6 +233,8 @@ struct ccs_sensor {
 	int default_pixel_order;
 	struct ccs_data_container sdata, mdata;
 
+	u32 embedded_mbus_code;
+
 	u8 binning_horizontal;
 	u8 binning_vertical;
 
-- 
2.39.2


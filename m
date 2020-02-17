Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B154161B62
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 20:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729610AbgBQTQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 14:16:35 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43594 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729477AbgBQTQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 14:16:35 -0500
Received: from localhost.localdomain (p200300CB87166A0024B68010760D030E.dip0.t-ipconnect.de [IPv6:2003:cb:8716:6a00:24b6:8010:760d:30e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9630C2925E7;
        Mon, 17 Feb 2020 19:16:32 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: [PATCH 1/2] media: staging: rkisp1: remove mbus field from rkisp1_sensor_async
Date:   Mon, 17 Feb 2020 20:16:18 +0100
Message-Id: <20200217191619.28976-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217191619.28976-1-dafna.hirschfeld@collabora.com>
References: <20200217191619.28976-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'struct v4l2_mbus_config' is a legacy struct that should not be used
in new drivers. So replace it with the fields:

enum v4l2_mbus_type mbus_type;
unsigned int parallel_bus_flags;

The field 'parallel_bus_flags' is used only for buses of types
V4L2_MBUS_BT656, V4L2_MBUS_PARALLEL which are not yet supported
so they are set to 0.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h |  3 +-
 drivers/staging/media/rkisp1/rkisp1-dev.c    | 22 ++-------
 drivers/staging/media/rkisp1/rkisp1-isp.c    | 52 +++++++-------------
 3 files changed, 24 insertions(+), 53 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 4e773d611d1b..743916940965 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -80,8 +80,9 @@ enum rkisp1_isp_pad {
  */
 struct rkisp1_sensor_async {
 	struct v4l2_async_subdev asd;
-	struct v4l2_mbus_config mbus;
 	unsigned int lanes;
+	enum v4l2_mbus_type mbus_type;
+	unsigned int parallel_bus_flags;
 	struct v4l2_subdev *sd;
 	struct v4l2_ctrl *pixel_rate_ctrl;
 	struct phy *dphy;
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index 21837d4dc9e1..72ab08a4e42d 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -251,26 +251,14 @@ static int rkisp1_fwnode_parse(struct device *dev,
 		return -EINVAL;
 	}
 
-	s_asd->mbus.type = vep->bus_type;
-	s_asd->mbus.flags = vep->bus.mipi_csi2.flags;
+	s_asd->mbus_type = vep->bus_type;
 	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
 
-	switch (vep->bus.mipi_csi2.num_data_lanes) {
-	case 1:
-		s_asd->mbus.flags |= V4L2_MBUS_CSI2_1_LANE;
-		break;
-	case 2:
-		s_asd->mbus.flags |= V4L2_MBUS_CSI2_2_LANE;
-		break;
-	case 3:
-		s_asd->mbus.flags |= V4L2_MBUS_CSI2_3_LANE;
-		break;
-	case 4:
-		s_asd->mbus.flags |= V4L2_MBUS_CSI2_4_LANE;
-		break;
-	default:
+	/* Parallel bus is currently not supported */
+	s_asd->parallel_bus_flags = 0;
+
+	if (s_asd->lanes < 1 || s_asd->lanes > 4)
 		return -EINVAL;
-	}
 
 	return 0;
 }
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 2b0513e826fe..2738d09b5981 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -291,7 +291,7 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 	if (sink_fmt->fmt_type == RKISP1_FMT_BAYER) {
 		acq_mult = 1;
 		if (src_fmt->fmt_type == RKISP1_FMT_BAYER) {
-			if (sensor->mbus.type == V4L2_MBUS_BT656)
+			if (sensor->mbus_type == V4L2_MBUS_BT656)
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT_ITU656;
 			else
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT;
@@ -299,17 +299,17 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 			rkisp1_write(rkisp1, RKISP1_CIF_ISP_DEMOSAIC_TH(0xc),
 				     RKISP1_CIF_ISP_DEMOSAIC);
 
-			if (sensor->mbus.type == V4L2_MBUS_BT656)
+			if (sensor->mbus_type == V4L2_MBUS_BT656)
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU656;
 			else
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU601;
 		}
 	} else if (sink_fmt->fmt_type == RKISP1_FMT_YUV) {
 		acq_mult = 2;
-		if (sensor->mbus.type == V4L2_MBUS_CSI2_DPHY) {
+		if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
 			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
 		} else {
-			if (sensor->mbus.type == V4L2_MBUS_BT656)
+			if (sensor->mbus_type == V4L2_MBUS_BT656)
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656;
 			else
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
@@ -319,17 +319,17 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 	}
 
 	/* Set up input acquisition properties */
-	if (sensor->mbus.type == V4L2_MBUS_BT656 ||
-	    sensor->mbus.type == V4L2_MBUS_PARALLEL) {
-		if (sensor->mbus.flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+	if (sensor->mbus_type == V4L2_MBUS_BT656 ||
+	    sensor->mbus_type == V4L2_MBUS_PARALLEL) {
+		if (sensor->parallel_bus_flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
 			signal = RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE;
 	}
 
-	if (sensor->mbus.type == V4L2_MBUS_PARALLEL) {
-		if (sensor->mbus.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
+	if (sensor->mbus_type == V4L2_MBUS_PARALLEL) {
+		if (sensor->parallel_bus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
 			signal |= RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW;
 
-		if (sensor->mbus.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
+		if (sensor->parallel_bus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
 			signal |= RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW;
 	}
 
@@ -401,29 +401,11 @@ static int rkisp1_config_dvp(struct rkisp1_device *rkisp1)
 static int rkisp1_config_mipi(struct rkisp1_device *rkisp1)
 {
 	const struct rkisp1_isp_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
-	unsigned int lanes;
+	unsigned int lanes = rkisp1->active_sensor->lanes;
 	u32 mipi_ctrl;
 
-	/*
-	 * rkisp1->active_sensor->mbus is set in isp or d-phy notifier_bound
-	 * function
-	 */
-	switch (rkisp1->active_sensor->mbus.flags & V4L2_MBUS_CSI2_LANES) {
-	case V4L2_MBUS_CSI2_4_LANE:
-		lanes = 4;
-		break;
-	case V4L2_MBUS_CSI2_3_LANE:
-		lanes = 3;
-		break;
-	case V4L2_MBUS_CSI2_2_LANE:
-		lanes = 2;
-		break;
-	case V4L2_MBUS_CSI2_1_LANE:
-		lanes = 1;
-		break;
-	default:
+	if (lanes < 1 || lanes > 4)
 		return -EINVAL;
-	}
 
 	mipi_ctrl = RKISP1_CIF_MIPI_CTRL_NUM_LANES(lanes - 1) |
 		    RKISP1_CIF_MIPI_CTRL_SHUTDOWNLANES(0xf) |
@@ -470,11 +452,11 @@ static int rkisp1_config_path(struct rkisp1_device *rkisp1)
 	u32 dpcl = rkisp1_read(rkisp1, RKISP1_CIF_VI_DPCL);
 	int ret = 0;
 
-	if (sensor->mbus.type == V4L2_MBUS_BT656 ||
-	    sensor->mbus.type == V4L2_MBUS_PARALLEL) {
+	if (sensor->mbus_type == V4L2_MBUS_BT656 ||
+	    sensor->mbus_type == V4L2_MBUS_PARALLEL) {
 		ret = rkisp1_config_dvp(rkisp1);
 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_PARALLEL;
-	} else if (sensor->mbus.type == V4L2_MBUS_CSI2_DPHY) {
+	} else if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
 		ret = rkisp1_config_mipi(rkisp1);
 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_MIPI;
 	}
@@ -563,7 +545,7 @@ static int rkisp1_isp_start(struct rkisp1_device *rkisp1)
 	rkisp1_config_clk(rkisp1);
 
 	/* Activate MIPI */
-	if (sensor->mbus.type == V4L2_MBUS_CSI2_DPHY) {
+	if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
 		val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
 		rkisp1_write(rkisp1, val | RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA,
 			     RKISP1_CIF_MIPI_CTRL);
@@ -974,7 +956,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	if (ret)
 		return ret;
 
-	if (rkisp1->active_sensor->mbus.type != V4L2_MBUS_CSI2_DPHY)
+	if (rkisp1->active_sensor->mbus_type != V4L2_MBUS_CSI2_DPHY)
 		return -EINVAL;
 
 	ret = rkisp1_mipi_csi2_start(&rkisp1->isp, rkisp1->active_sensor);
-- 
2.17.1


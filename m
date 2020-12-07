Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA332D1C0B
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbgLGV0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgLGV0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 16:26:49 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94889C0611CB
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 13:23:22 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 3804F634C97;
        Mon,  7 Dec 2020 23:23:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 13/24] ccs: Add shading correction and luminance correction level controls
Date:   Mon,  7 Dec 2020 23:15:19 +0200
Message-Id: <20201207211530.21180-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add controls for supporting lens shading correction, including colour
shading and luminance correction level.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 46 ++++++++++++++++++++++++++++++++
 drivers/media/i2c/ccs/ccs.h      |  1 +
 2 files changed, 47 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 7591a52a41a4..12c30fb0f37a 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -756,6 +756,19 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_TEST_PATTERN_GREENB:
 		rval = ccs_write(sensor, TEST_DATA_GREENB, ctrl->val);
 
+		break;
+	case V4L2_CID_CCS_SHADING_CORRECTION:
+		rval = ccs_write(sensor, SHADING_CORRECTION_EN,
+				 ctrl->val ? CCS_SHADING_CORRECTION_EN_ENABLE :
+				 0);
+
+		if (!rval && sensor->luminance_level)
+			v4l2_ctrl_activate(sensor->luminance_level, ctrl->val);
+
+		break;
+	case V4L2_CID_CCS_LUMINANCE_CORRECTION_LEVEL:
+		rval = ccs_write(sensor, LUMINANCE_CORRECTION_LEVEL, ctrl->val);
+
 		break;
 	case V4L2_CID_PIXEL_RATE:
 		/* For v4l2_ctrl_s_ctrl_int64() used internally. */
@@ -877,6 +890,39 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 	}
 	}
 
+	if (CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
+	    (CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING |
+	     CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION)) {
+		const struct v4l2_ctrl_config ctrl_cfg = {
+			.name = "Shading Correction",
+			.type = V4L2_CTRL_TYPE_BOOLEAN,
+			.id = V4L2_CID_CCS_SHADING_CORRECTION,
+			.ops = &ccs_ctrl_ops,
+			.max = 1,
+			.step = 1,
+		};
+
+		v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
+				     &ctrl_cfg, NULL);
+	}
+
+	if (CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
+	    CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION) {
+		const struct v4l2_ctrl_config ctrl_cfg = {
+			.name = "Luminance Correction Level",
+			.type = V4L2_CTRL_TYPE_BOOLEAN,
+			.id = V4L2_CID_CCS_LUMINANCE_CORRECTION_LEVEL,
+			.ops = &ccs_ctrl_ops,
+			.max = 255,
+			.step = 1,
+			.def = 128,
+		};
+
+		sensor->luminance_level =
+			v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
+					     &ctrl_cfg, NULL);
+	}
+
 	if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
 	    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL ||
 	    CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 9fc3333f6c4e..cc33c9ba3165 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -268,6 +268,7 @@ struct ccs_sensor {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *pixel_rate_parray;
+	struct v4l2_ctrl *luminance_level;
 	/* src controls */
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate_csi;
-- 
2.29.2


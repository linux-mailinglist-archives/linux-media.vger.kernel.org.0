Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB77A27ECAE
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731077AbgI3P3V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:21 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44650 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731073AbgI3P3T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:19 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 92451634C8E
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:54 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 099/100] ccs: Add shading correction and luminance correction level controls
Date:   Wed, 30 Sep 2020 18:28:57 +0300
Message-Id: <20200930152858.8471-100-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add controls for supporting lens shading correction.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 74 ++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index c68c11e8e9f3..d2ffb48c9a30 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -755,6 +755,25 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_TEST_PATTERN_GREENB:
 		rval = ccs_write(sensor, TEST_DATA_GREENB, ctrl->val);
 
+		break;
+	case V4L2_CID_CCS_SHADING_CORRECTION:
+		if (!(CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
+		      (CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING |
+		       CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION)))
+			break;
+
+		rval = ccs_write(sensor, SHADING_CORRECTION_EN,
+				 ctrl->val ? CCS_SHADING_CORRECTION_EN_ENABLE :
+				 0);
+
+		break;
+	case V4L2_CID_CCS_LUMINANCE_SHADING_CORRECTION:
+		if (!(CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
+		      CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION))
+			break;
+
+		rval = ccs_write(sensor, LUMINANCE_CORRECTION_LEVEL, ctrl->val);
+
 		break;
 	case V4L2_CID_PIXEL_RATE:
 		/* For v4l2_ctrl_s_ctrl_int64() used internally. */
@@ -876,6 +895,61 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 	}
 	}
 
+	if (CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
+	    CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING) {
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
+			.name = "Luminance Shading Correction",
+			.type = V4L2_CTRL_TYPE_BOOLEAN,
+			.id = V4L2_CID_CCS_LUMINANCE_SHADING_CORRECTION,
+			.ops = &ccs_ctrl_ops,
+			.max = 255,
+			.step = 1,
+			.def = 128,
+		};
+
+		v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
+				     &ctrl_cfg, NULL);
+	}
+
+	if (CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
+	    (CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING |
+	     CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION)) {
+		u32 val =
+			((CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
+			  CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING) ?
+			 V4L2_CCS_SHADING_CORRECTION_COLOUR : 0) |
+			((CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
+			   CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION) ?
+			 V4L2_CCS_SHADING_CORRECTION_LUMINANCE : 0);
+		const struct v4l2_ctrl_config ctrl_cfg = {
+			.name = "Shading Correction Capability",
+			.type = V4L2_CTRL_TYPE_BITMASK,
+			.id = V4L2_CID_CCS_SHADING_CORRECTION_CAPABILITY,
+			.ops = &ccs_ctrl_ops,
+			.max = val,
+			.def = val,
+			.flags = V4L2_CTRL_FLAG_READ_ONLY,
+		};
+
+		v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
+				     &ctrl_cfg, NULL);
+	}
+
 	if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
 	    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL ||
 	    CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
-- 
2.27.0


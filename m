Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4531E2D1BFC
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgLGVZG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:25:06 -0500
Received: from retiisi.eu ([95.216.213.190]:34588 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726264AbgLGVZG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 16:25:06 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 019D4634C94;
        Mon,  7 Dec 2020 23:23:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 10/24] ccs: Add support for alternate analogue global gain
Date:   Mon,  7 Dec 2020 23:15:16 +0200
Message-Id: <20201207211530.21180-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CCS spec defines an alternative implementation for global analogue
gain. Add support for that in the driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 55 ++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index c51197318c3a..7591a52a41a4 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -673,6 +673,17 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		break;
 
+	case V4L2_CID_CCS_ANALOGUE_LINEAR_GAIN:
+		rval = ccs_write(sensor, ANALOG_LINEAR_GAIN_GLOBAL, ctrl->val);
+
+		break;
+
+	case V4L2_CID_CCS_ANALOGUE_EXPONENTIAL_GAIN:
+		rval = ccs_write(sensor, ANALOG_EXPONENTIAL_GAIN_GLOBAL,
+				 ctrl->val);
+
+		break;
+
 	case V4L2_CID_DIGITAL_GAIN:
 		if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
 		    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL) {
@@ -819,6 +830,50 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 				  max(CCS_LIM(sensor, ANALOG_GAIN_CODE_STEP),
 				      1U),
 				  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN));
+	}
+		break;
+
+	case CCS_ANALOG_GAIN_CAPABILITY_ALTERNATE_GLOBAL: {
+		struct {
+			const char *name;
+			u32 id;
+			u16 min, max, step;
+		} const gain_ctrls[] = {
+			{
+				"Analogue Linear Gain",
+				V4L2_CID_CCS_ANALOGUE_LINEAR_GAIN,
+				CCS_LIM(sensor, ANALOG_LINEAR_GAIN_MIN),
+				CCS_LIM(sensor, ANALOG_LINEAR_GAIN_MAX),
+				max(CCS_LIM(sensor,
+					    ANALOG_LINEAR_GAIN_STEP_SIZE),
+				    1U),
+			},
+			{
+				"Analogue Exponential Gain",
+				V4L2_CID_CCS_ANALOGUE_EXPONENTIAL_GAIN,
+				CCS_LIM(sensor, ANALOG_EXPONENTIAL_GAIN_MIN),
+				CCS_LIM(sensor, ANALOG_EXPONENTIAL_GAIN_MAX),
+				max(CCS_LIM(sensor,
+					    ANALOG_EXPONENTIAL_GAIN_STEP_SIZE),
+				    1U),
+			},
+		};
+		struct v4l2_ctrl_config ctrl_cfg = {
+			.type = V4L2_CTRL_TYPE_INTEGER,
+			.ops = &ccs_ctrl_ops,
+		};
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(gain_ctrls); i++) {
+			ctrl_cfg.name = gain_ctrls[i].name;
+			ctrl_cfg.min = ctrl_cfg.def = gain_ctrls[i].min;
+			ctrl_cfg.max = gain_ctrls[i].max;
+			ctrl_cfg.step = gain_ctrls[i].step;
+			ctrl_cfg.id = gain_ctrls[i].id;
+
+			v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
+					     &ctrl_cfg, NULL);
+		}
 	}
 	}
 
-- 
2.29.2


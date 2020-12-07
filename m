Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0688D2D1C09
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgLGV0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgLGV0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 16:26:49 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF88C06138C
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 13:23:20 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id CC145634C92;
        Mon,  7 Dec 2020 23:23:12 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 08/24] ccs: Add support for analogue gain coefficient controls
Date:   Mon,  7 Dec 2020 23:15:14 +0200
Message-Id: <20201207211530.21180-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add four controls for reading CCS analogue gain coefficients. The
values are constants that are device specific.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 38 ++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 47879f9bfe20..c51197318c3a 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -28,6 +28,7 @@
 #include <linux/v4l2-mediabus.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-device.h>
+#include <uapi/linux/ccs.h>
 
 #include "ccs.h"
 
@@ -771,14 +772,46 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
-	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 13);
+	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 17);
 	if (rval)
 		return rval;
 
 	sensor->pixel_array->ctrl_handler.lock = &sensor->mutex;
 
 	switch (CCS_LIM(sensor, ANALOG_GAIN_CAPABILITY)) {
-	case CCS_ANALOG_GAIN_CAPABILITY_GLOBAL:
+	case CCS_ANALOG_GAIN_CAPABILITY_GLOBAL: {
+		struct {
+			const char *name;
+			u32 id;
+			s32 value;
+		} const gain_ctrls[] = {
+			{ "Analogue Gain m0", V4L2_CID_CCS_ANALOGUE_GAIN_M0,
+			  CCS_LIM(sensor, ANALOG_GAIN_M0), },
+			{ "Analogue Gain c0", V4L2_CID_CCS_ANALOGUE_GAIN_C0,
+			  CCS_LIM(sensor, ANALOG_GAIN_C0), },
+			{ "Analogue Gain m1", V4L2_CID_CCS_ANALOGUE_GAIN_M1,
+			  CCS_LIM(sensor, ANALOG_GAIN_M1), },
+			{ "Analogue Gain c1", V4L2_CID_CCS_ANALOGUE_GAIN_C1,
+			  CCS_LIM(sensor, ANALOG_GAIN_C1), },
+		};
+		struct v4l2_ctrl_config ctrl_cfg = {
+			.type = V4L2_CTRL_TYPE_INTEGER,
+			.ops = &ccs_ctrl_ops,
+			.flags = V4L2_CTRL_FLAG_READ_ONLY,
+			.step = 1,
+		};
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(gain_ctrls); i++) {
+			ctrl_cfg.name = gain_ctrls[i].name;
+			ctrl_cfg.id = gain_ctrls[i].id;
+			ctrl_cfg.min = ctrl_cfg.max = ctrl_cfg.def =
+				gain_ctrls[i].value;
+
+			v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
+					     &ctrl_cfg, NULL);
+		}
+
 		v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler,
 				  &ccs_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 				  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN),
@@ -787,6 +820,7 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 				      1U),
 				  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN));
 	}
+	}
 
 	if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
 	    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL ||
-- 
2.29.2


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 799D12D1BF8
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgLGVZF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:25:05 -0500
Received: from retiisi.eu ([95.216.213.190]:34568 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725808AbgLGVZE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 16:25:04 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 66D0E634C8B;
        Mon,  7 Dec 2020 23:23:12 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 02/24] ccs: Add support for old-style SMIA digital gain
Date:   Mon,  7 Dec 2020 23:15:08 +0200
Message-Id: <20201207211530.21180-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SMIA only has per-component digital gain. Add support for it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c        | 33 +++++++++++++++++++++++--
 drivers/media/i2c/ccs/smiapp-reg-defs.h |  2 ++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index f1fecc72e247..4b765ac62c0c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -673,7 +673,34 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
-		rval = ccs_write(sensor, DIGITAL_GAIN_GLOBAL, ctrl->val);
+		if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
+		    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL) {
+			rval = ccs_write(sensor, DIGITAL_GAIN_GLOBAL,
+					 ctrl->val);
+			break;
+		}
+
+		rval = ccs_write_addr(sensor,
+				      SMIAPP_REG_U16_DIGITAL_GAIN_GREENR,
+				      ctrl->val);
+		if (rval)
+			break;
+
+		rval = ccs_write_addr(sensor,
+				      SMIAPP_REG_U16_DIGITAL_GAIN_RED,
+				      ctrl->val);
+		if (rval)
+			break;
+
+		rval = ccs_write_addr(sensor,
+				      SMIAPP_REG_U16_DIGITAL_GAIN_BLUE,
+				      ctrl->val);
+		if (rval)
+			break;
+
+		rval = ccs_write_addr(sensor,
+				      SMIAPP_REG_U16_DIGITAL_GAIN_GREENB,
+				      ctrl->val);
 
 		break;
 	case V4L2_CID_EXPOSURE:
@@ -759,7 +786,9 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 		CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN));
 
 	if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
-	    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL)
+	    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL ||
+	    CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
+	    SMIAPP_DIGITAL_GAIN_CAPABILITY_PER_CHANNEL)
 		v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler,
 				  &ccs_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
 				  CCS_LIM(sensor, DIGITAL_GAIN_MIN),
diff --git a/drivers/media/i2c/ccs/smiapp-reg-defs.h b/drivers/media/i2c/ccs/smiapp-reg-defs.h
index e80c110ebf3a..177e3e51207a 100644
--- a/drivers/media/i2c/ccs/smiapp-reg-defs.h
+++ b/drivers/media/i2c/ccs/smiapp-reg-defs.h
@@ -535,6 +535,8 @@
 #define SMIAPP_DIGITAL_CROP_CAPABILITY_NONE		0
 #define SMIAPP_DIGITAL_CROP_CAPABILITY_INPUT_CROP	1
 
+#define SMIAPP_DIGITAL_GAIN_CAPABILITY_PER_CHANNEL	1
+
 #define SMIAPP_BINNING_CAPABILITY_NO			0
 #define SMIAPP_BINNING_CAPABILITY_YES			1
 
-- 
2.29.2


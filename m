Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3A427ECA9
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731082AbgI3P3S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:18 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44664 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731039AbgI3P3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:16 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id C9BF6634CFC
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 089/100] ccs: Add support for old-style SMIA digital gain
Date:   Wed, 30 Sep 2020 18:28:47 +0300
Message-Id: <20200930152858.8471-90-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
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
index 1cb46de003e5..37016855df43 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -672,7 +672,34 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -758,7 +785,9 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
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
2.27.0


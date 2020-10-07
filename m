Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2AF285AFB
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgJGIqd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:33 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57072 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728046AbgJGIqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:16 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id AA7A8634C89
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:22 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 094/106] ccs: Add digital gain support
Date:   Wed,  7 Oct 2020 11:45:45 +0300
Message-Id: <20201007084557.25843-85-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CCS supports global (all-component) digital gain. Add support for it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index d1a9a28f29ae..7975b3900017 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -671,6 +671,11 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_ANALOGUE_GAIN:
 		rval = ccs_write(sensor, ANALOG_GAIN_CODE_GLOBAL, ctrl->val);
 
+		break;
+
+	case V4L2_CID_DIGITAL_GAIN:
+		rval = ccs_write(sensor, DIGITAL_GAIN_GLOBAL, ctrl->val);
+
 		break;
 	case V4L2_CID_EXPOSURE:
 		rval = ccs_write(sensor, COARSE_INTEGRATION_TIME, ctrl->val);
@@ -740,7 +745,7 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
-	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 12);
+	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 13);
 	if (rval)
 		return rval;
 
@@ -754,6 +759,16 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 		max(CCS_LIM(sensor, ANALOG_GAIN_CODE_STEP), 1U),
 		CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN));
 
+	if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
+	    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL)
+		v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler,
+				  &ccs_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+				  CCS_LIM(sensor, DIGITAL_GAIN_MIN),
+				  CCS_LIM(sensor, DIGITAL_GAIN_MAX),
+				  max(CCS_LIM(sensor, DIGITAL_GAIN_STEP_SIZE),
+				      1U),
+				  0x100);
+
 	/* Exposure limits will be updated soon, use just something here. */
 	sensor->exposure = v4l2_ctrl_new_std(
 		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
-- 
2.27.0


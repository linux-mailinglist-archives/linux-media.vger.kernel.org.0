Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9F32D1BF7
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgLGVZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgLGVZE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 16:25:04 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B16C061793
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 13:23:18 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 55F80634C89;
        Mon,  7 Dec 2020 23:23:12 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 01/24] ccs: Add digital gain support
Date:   Mon,  7 Dec 2020 23:15:07 +0200
Message-Id: <20201207211530.21180-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
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
index b39ae5f8446b..f1fecc72e247 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -670,6 +670,11 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -739,7 +744,7 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
-	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 12);
+	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 13);
 	if (rval)
 		return rval;
 
@@ -753,6 +758,16 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
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
2.29.2


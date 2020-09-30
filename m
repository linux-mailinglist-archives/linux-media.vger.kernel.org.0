Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA8727ECB4
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731097AbgI3P32 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:28 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44656 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731063AbgI3P3R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:17 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id DDBCA634D07
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 090/100] ccs: Remove analogue gain field
Date:   Wed, 30 Sep 2020 18:28:48 +0300
Message-Id: <20200930152858.8471-91-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The analogue gain control was stored to the device specific struct but was
never used. Remove it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 13 ++++++-------
 drivers/media/i2c/ccs/ccs.h      |  1 -
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 37016855df43..0a59bc13ac56 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -776,13 +776,12 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 
 	sensor->pixel_array->ctrl_handler.lock = &sensor->mutex;
 
-	sensor->analog_gain = v4l2_ctrl_new_std(
-		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
-		V4L2_CID_ANALOGUE_GAIN,
-		CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN),
-		CCS_LIM(sensor, ANALOG_GAIN_CODE_MAX),
-		max(CCS_LIM(sensor, ANALOG_GAIN_CODE_STEP), 1U),
-		CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN));
+	v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
+			  V4L2_CID_ANALOGUE_GAIN,
+			  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN),
+			  CCS_LIM(sensor, ANALOG_GAIN_CODE_MAX),
+			  max(CCS_LIM(sensor, ANALOG_GAIN_CODE_STEP), 1U),
+			  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN));
 
 	if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
 	    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL ||
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 6b07e4143ff0..b97e55b57a69 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -262,7 +262,6 @@ struct ccs_sensor {
 	unsigned long *valid_link_freqs;
 
 	/* Pixel array controls */
-	struct v4l2_ctrl *analog_gain;
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *hflip;
 	struct v4l2_ctrl *vflip;
-- 
2.27.0


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26FD2285AED
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgJGIqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:21 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57058 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728050AbgJGIqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:17 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id C21CD634CA9
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:22 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 096/106] ccs: Remove analogue gain field
Date:   Wed,  7 Oct 2020 11:45:47 +0300
Message-Id: <20201007084557.25843-87-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
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
index b58cfb308251..6601ed8e72be 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -778,13 +778,12 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 
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
index 356b87c33405..9fc3333f6c4e 100644
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


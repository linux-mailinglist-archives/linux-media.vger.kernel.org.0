Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0D8285AF7
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgJGIqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:30 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57052 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727458AbgJGIqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:18 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D3051634CA5
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:22 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 097/106] ccs: Only add analogue gain control if the device supports it
Date:   Wed,  7 Oct 2020 11:45:48 +0300
Message-Id: <20201007084557.25843-88-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some devices do not implement analogue gain this way. Only add the control
when a device does have the support.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 6601ed8e72be..d6d6aeceb415 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -778,12 +778,16 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 
 	sensor->pixel_array->ctrl_handler.lock = &sensor->mutex;
 
-	v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
-			  V4L2_CID_ANALOGUE_GAIN,
-			  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN),
-			  CCS_LIM(sensor, ANALOG_GAIN_CODE_MAX),
-			  max(CCS_LIM(sensor, ANALOG_GAIN_CODE_STEP), 1U),
-			  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN));
+	switch (CCS_LIM(sensor, ANALOG_GAIN_CAPABILITY)) {
+	case CCS_ANALOG_GAIN_CAPABILITY_GLOBAL:
+		v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler,
+				  &ccs_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+				  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN),
+				  CCS_LIM(sensor, ANALOG_GAIN_CODE_MAX),
+				  max(CCS_LIM(sensor, ANALOG_GAIN_CODE_STEP),
+				      1U),
+				  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN));
+	}
 
 	if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
 	    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL ||
-- 
2.27.0


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A016C2D1BF4
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgLGVZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:25:04 -0500
Received: from retiisi.eu ([95.216.213.190]:34576 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbgLGVZD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 16:25:03 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 89CE5634C8D;
        Mon,  7 Dec 2020 23:23:12 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 04/24] ccs: Only add analogue gain control if the device supports it
Date:   Mon,  7 Dec 2020 23:15:10 +0200
Message-Id: <20201207211530.21180-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
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
index 706fa811d9b5..47879f9bfe20 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -777,12 +777,16 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 
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
2.29.2


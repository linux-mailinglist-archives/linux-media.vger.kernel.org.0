Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0412E27ECAA
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731086AbgI3P3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:19 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44680 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731064AbgI3P3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:16 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id F0CB4634D0D
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 091/100] ccs: Only add analogue gain control if the device supports it
Date:   Wed, 30 Sep 2020 18:28:49 +0300
Message-Id: <20200930152858.8471-92-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
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
index 0a59bc13ac56..0b0165f5a28b 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -776,12 +776,16 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 
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


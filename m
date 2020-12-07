Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8980E2D1BF6
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgLGVZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgLGVZE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 16:25:04 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D573CC061794
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 13:23:18 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 78413634C8C;
        Mon,  7 Dec 2020 23:23:12 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 03/24] ccs: Remove analogue gain field
Date:   Mon,  7 Dec 2020 23:15:09 +0200
Message-Id: <20201207211530.21180-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
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
index 4b765ac62c0c..706fa811d9b5 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -777,13 +777,12 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 
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
2.29.2


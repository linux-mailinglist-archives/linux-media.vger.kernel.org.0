Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF1E4DAB15
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 13:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405757AbfJQLWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 07:22:16 -0400
Received: from retiisi.org.uk ([95.216.213.190]:39726 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405529AbfJQLWQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 07:22:16 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 0A6C2634C8A
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 14:21:47 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/7] smiapp: Move binning configuration to streaming start
Date:   Thu, 17 Oct 2019 14:18:51 +0300
Message-Id: <20191017111856.10270-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017111856.10270-1-sakari.ailus@linux.intel.com>
References: <20191017111856.10270-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only write the binning configuration at stream start. It has no effect
otherwise.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 43 +++++++++++++-------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index bf054b2e8e8b..edaeebaada79 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -857,29 +857,8 @@ static void smiapp_update_blanking(struct smiapp_sensor *sensor)
 static int smiapp_update_mode(struct smiapp_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	unsigned int binning_mode;
 	int rval;
 
-	/* Binning has to be set up here; it affects limits */
-	if (sensor->binning_horizontal == 1 &&
-	    sensor->binning_vertical == 1) {
-		binning_mode = 0;
-	} else {
-		u8 binning_type =
-			(sensor->binning_horizontal << 4)
-			| sensor->binning_vertical;
-
-		rval = smiapp_write(
-			sensor, SMIAPP_REG_U8_BINNING_TYPE, binning_type);
-		if (rval < 0)
-			return rval;
-
-		binning_mode = 1;
-	}
-	rval = smiapp_write(sensor, SMIAPP_REG_U8_BINNING_MODE, binning_mode);
-	if (rval < 0)
-		return rval;
-
 	rval = smiapp_pll_update(sensor);
 	if (rval < 0)
 		return rval;
@@ -1351,6 +1330,7 @@ static int smiapp_power_off(struct device *dev)
 static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	unsigned int binning_mode;
 	int rval;
 
 	mutex_lock(&sensor->mutex);
@@ -1361,6 +1341,27 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	if (rval)
 		goto out;
 
+	/* Binning configuration */
+	if (sensor->binning_horizontal == 1 &&
+	    sensor->binning_vertical == 1) {
+		binning_mode = 0;
+	} else {
+		u8 binning_type =
+			(sensor->binning_horizontal << 4)
+			| sensor->binning_vertical;
+
+		rval = smiapp_write(
+			sensor, SMIAPP_REG_U8_BINNING_TYPE, binning_type);
+		if (rval < 0)
+			return rval;
+
+		binning_mode = 1;
+	}
+	rval = smiapp_write(sensor, SMIAPP_REG_U8_BINNING_MODE, binning_mode);
+	if (rval < 0)
+		return rval;
+
+	/* Set up PLL */
 	rval = smiapp_pll_configure(sensor);
 	if (rval)
 		goto out;
-- 
2.20.1


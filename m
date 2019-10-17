Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBA2DAB14
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 13:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405712AbfJQLWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 07:22:16 -0400
Received: from retiisi.org.uk ([95.216.213.190]:39724 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405515AbfJQLWQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 07:22:16 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id E6F55634C89
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 14:21:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/7] smiapp: Don't get binning limits dynamically
Date:   Thu, 17 Oct 2019 14:18:50 +0300
Message-Id: <20191017111856.10270-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017111856.10270-1-sakari.ailus@linux.intel.com>
References: <20191017111856.10270-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver implementation assumed the binning limits could change
dynamically based on the binning configuration. This is not actually the
case; these limits are static and suitable to be used with all binning
configurations but possibly not optimal limit for many of those
configurations.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 65 --------------------------
 1 file changed, 65 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index a274527987b8..bf054b2e8e8b 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -682,66 +682,6 @@ static int smiapp_get_all_limits(struct smiapp_sensor *sensor)
 	return 0;
 }
 
-static int smiapp_get_limits_binning(struct smiapp_sensor *sensor)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	static u32 const limits[] = {
-		SMIAPP_LIMIT_MIN_FRAME_LENGTH_LINES_BIN,
-		SMIAPP_LIMIT_MAX_FRAME_LENGTH_LINES_BIN,
-		SMIAPP_LIMIT_MIN_LINE_LENGTH_PCK_BIN,
-		SMIAPP_LIMIT_MAX_LINE_LENGTH_PCK_BIN,
-		SMIAPP_LIMIT_MIN_LINE_BLANKING_PCK_BIN,
-		SMIAPP_LIMIT_FINE_INTEGRATION_TIME_MIN_BIN,
-		SMIAPP_LIMIT_FINE_INTEGRATION_TIME_MAX_MARGIN_BIN,
-	};
-	static u32 const limits_replace[] = {
-		SMIAPP_LIMIT_MIN_FRAME_LENGTH_LINES,
-		SMIAPP_LIMIT_MAX_FRAME_LENGTH_LINES,
-		SMIAPP_LIMIT_MIN_LINE_LENGTH_PCK,
-		SMIAPP_LIMIT_MAX_LINE_LENGTH_PCK,
-		SMIAPP_LIMIT_MIN_LINE_BLANKING_PCK,
-		SMIAPP_LIMIT_FINE_INTEGRATION_TIME_MIN,
-		SMIAPP_LIMIT_FINE_INTEGRATION_TIME_MAX_MARGIN,
-	};
-	unsigned int i;
-	int rval;
-
-	if (sensor->limits[SMIAPP_LIMIT_BINNING_CAPABILITY] ==
-	    SMIAPP_BINNING_CAPABILITY_NO) {
-		for (i = 0; i < ARRAY_SIZE(limits); i++)
-			sensor->limits[limits[i]] =
-				sensor->limits[limits_replace[i]];
-
-		return 0;
-	}
-
-	rval = smiapp_get_limits(sensor, limits, ARRAY_SIZE(limits));
-	if (rval < 0)
-		return rval;
-
-	/*
-	 * Sanity check whether the binning limits are valid. If not,
-	 * use the non-binning ones.
-	 */
-	if (sensor->limits[SMIAPP_LIMIT_MIN_FRAME_LENGTH_LINES_BIN]
-	    && sensor->limits[SMIAPP_LIMIT_MIN_LINE_LENGTH_PCK_BIN]
-	    && sensor->limits[SMIAPP_LIMIT_MIN_LINE_BLANKING_PCK_BIN])
-		return 0;
-
-	for (i = 0; i < ARRAY_SIZE(limits); i++) {
-		dev_dbg(&client->dev,
-			"replace limit 0x%8.8x \"%s\" = %d, 0x%x\n",
-			smiapp_reg_limits[limits[i]].addr,
-			smiapp_reg_limits[limits[i]].what,
-			sensor->limits[limits_replace[i]],
-			sensor->limits[limits_replace[i]]);
-		sensor->limits[limits[i]] =
-			sensor->limits[limits_replace[i]];
-	}
-
-	return 0;
-}
-
 static int smiapp_get_mbus_formats(struct smiapp_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
@@ -940,11 +880,6 @@ static int smiapp_update_mode(struct smiapp_sensor *sensor)
 	if (rval < 0)
 		return rval;
 
-	/* Get updated limits due to binning */
-	rval = smiapp_get_limits_binning(sensor);
-	if (rval < 0)
-		return rval;
-
 	rval = smiapp_pll_update(sensor);
 	if (rval < 0)
 		return rval;
-- 
2.20.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D64815BC0A
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 10:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbgBMJti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 04:49:38 -0500
Received: from retiisi.org.uk ([95.216.213.190]:59674 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729629AbgBMJti (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 04:49:38 -0500
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 1A2AD634C91
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 11:49:19 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 6/7] smiapp: Refactor reading SMIA limits
Date:   Thu, 13 Feb 2020 11:49:33 +0200
Message-Id: <20200213094934.18595-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213094934.18595-1-sakari.ailus@linux.intel.com>
References: <20200213094934.18595-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Combine the two trivial functions reading limits into one. Also rename
smiapp_get_all_limits() as smiapp_read_all_smia_limits().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 32 ++++++++------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index a6800e5c495d..5e4f6a2ef78e 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -69,37 +69,25 @@ static u32 smiapp_get_limit(struct smiapp_sensor *sensor,
 #define SMIA_LIM(sensor, limit) \
 	smiapp_get_limit(sensor, SMIAPP_LIMIT_##limit)
 
-static int smiapp_get_limits(struct smiapp_sensor *sensor, int const *limit,
-			     unsigned int n)
+static int smiapp_read_all_smia_limits(struct smiapp_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	unsigned int i;
-	u32 val;
 	int rval;
 
-	for (i = 0; i < n; i++) {
+	for (i = 0; i < SMIAPP_LIMIT_LAST; i++) {
+		u32 val;
+
 		rval = smiapp_read(
-			sensor, smiapp_reg_limits[limit[i]].addr, &val);
+			sensor, smiapp_reg_limits[i].addr, &val);
 		if (rval)
 			return rval;
-		sensor->limits[limit[i]] = val;
-		dev_dbg(&client->dev, "0x%8.8x \"%s\" = %u, 0x%x\n",
-			smiapp_reg_limits[limit[i]].addr,
-			smiapp_reg_limits[limit[i]].what, val, val);
-	}
 
-	return 0;
-}
+		sensor->limits[i] = val;
 
-static int smiapp_get_all_limits(struct smiapp_sensor *sensor)
-{
-	unsigned int i;
-	int rval;
-
-	for (i = 0; i < SMIAPP_LIMIT_LAST; i++) {
-		rval = smiapp_get_limits(sensor, &i, 1);
-		if (rval < 0)
-			return rval;
+		dev_dbg(&client->dev, "0x%8.8x \"%s\" = %u, 0x%x\n",
+			smiapp_reg_limits[i].addr,
+			smiapp_reg_limits[i].what, val, val);
 	}
 
 	if (SMIA_LIM(sensor, SCALER_N_MIN) == 0)
@@ -2938,7 +2926,7 @@ static int smiapp_probe(struct i2c_client *client)
 		goto out_power_off;
 	}
 
-	rval = smiapp_get_all_limits(sensor);
+	rval = smiapp_read_all_smia_limits(sensor);
 	if (rval) {
 		rval = -ENODEV;
 		goto out_power_off;
-- 
2.20.1


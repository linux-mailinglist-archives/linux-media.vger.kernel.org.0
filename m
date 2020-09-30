Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22DD27ECD6
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730980AbgI3P37 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:59 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44648 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730975AbgI3P3J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:09 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 02FBC634C95
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 041/100] ccs: Read ireal numbers correctly
Date:   Wed, 30 Sep 2020 18:27:59 +0300
Message-Id: <20200930152858.8471-42-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some limit values are available in q16.q16 format, referred to as 32-bit
unsigned ireal in CCS. Read these correctly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c       | 10 ++--------
 drivers/media/i2c/ccs/ccs-reg-access.c | 23 +++++++++++++++++++++--
 drivers/media/i2c/ccs/ccs.h            |  9 +++++++++
 3 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 34878678bc5f..40e0fc84205c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -120,8 +120,8 @@ void ccs_replace_limit(struct ccs_sensor *sensor,
 	ccs_assign_limit(ptr, ccs_reg_width(linfo->reg), val);
 }
 
-static u32 ccs_get_limit(struct ccs_sensor *sensor,
-			 unsigned int limit, unsigned int offset)
+u32 ccs_get_limit(struct ccs_sensor *sensor, unsigned int limit,
+		  unsigned int offset)
 {
 	void *ptr;
 	u32 val;
@@ -149,12 +149,6 @@ static u32 ccs_get_limit(struct ccs_sensor *sensor,
 	return ccs_reg_conv(sensor, ccs_limits[limit].reg, val);
 }
 
-#define CCS_LIM(sensor, limit) \
-	ccs_get_limit(sensor, CCS_L_##limit, 0)
-
-#define CCS_LIM_AT(sensor, limit, offset)	\
-	ccs_get_limit(sensor, CCS_L_##limit, CCS_L_##limit##_OFFSET(offset))
-
 static int ccs_read_all_limits(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index fe6112cba6be..91ccbca11577 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -15,6 +15,7 @@
 #include <linux/i2c.h>
 
 #include "ccs.h"
+#include "ccs-limits.h"
 
 static uint32_t float_to_u32_mul_1000000(struct i2c_client *client,
 					 uint32_t phloat)
@@ -143,12 +144,30 @@ unsigned int ccs_reg_width(u32 reg)
 	return sizeof(uint8_t);
 }
 
+static u32 ireal32_to_u32_mul_1000000(struct i2c_client *client, u32 val)
+{
+	if (val >> 10 > U32_MAX / 15625) {
+		dev_warn(&client->dev, "value %u overflows!\n", val);
+		return U32_MAX;
+	}
+
+	return ((val >> 10) * 15625) +
+		(val & GENMASK(9, 0)) * 15625 / 1024;
+}
+
 u32 ccs_reg_conv(struct ccs_sensor *sensor, u32 reg, u32 val)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 
-	if (reg & CCS_FL_FLOAT_IREAL)
-		val = float_to_u32_mul_1000000(client, val);
+	if (reg & CCS_FL_FLOAT_IREAL) {
+		if (CCS_LIM(sensor, CLOCK_CAPA_TYPE_CAPABILITY) &
+		    CCS_CLOCK_CAPA_TYPE_CAPABILITY_IREAL)
+			val = ireal32_to_u32_mul_1000000(client, val);
+		else
+			val = float_to_u32_mul_1000000(client, val);
+	} else if (reg & CCS_FL_IREAL) {
+		val = ireal32_to_u32_mul_1000000(client, val);
+	}
 
 	return val;
 }
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index cbcd93b519da..f60d1801c469 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -17,6 +17,7 @@
 #include <media/v4l2-subdev.h>
 
 #include "ccs-data.h"
+#include "ccs-limits.h"
 #include "ccs-quirk.h"
 #include "ccs-regs.h"
 #include "ccs-reg-access.h"
@@ -50,6 +51,12 @@
 #define CCS_DFL_I2C_ADDR	(0x20 >> 1) /* Default I2C Address */
 #define CCS_ALT_I2C_ADDR	(0x6e >> 1) /* Alternate I2C Address */
 
+#define CCS_LIM(sensor, limit) \
+	ccs_get_limit(sensor, CCS_L_##limit, 0)
+
+#define CCS_LIM_AT(sensor, limit, offset)	\
+	ccs_get_limit(sensor, CCS_L_##limit, CCS_L_##limit##_OFFSET(offset))
+
 /*
  * Sometimes due to board layout considerations the camera module can be
  * mounted rotated. The typical rotation used is 180 degrees which can be
@@ -277,5 +284,7 @@ struct ccs_sensor {
 
 void ccs_replace_limit(struct ccs_sensor *sensor,
 		       unsigned int limit, unsigned int offset, u32 val);
+u32 ccs_get_limit(struct ccs_sensor *sensor, unsigned int limit,
+		  unsigned int offset);
 
 #endif /* __CCS_H__ */
-- 
2.27.0


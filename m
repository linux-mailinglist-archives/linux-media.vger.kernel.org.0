Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C69782C21B6
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 10:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731510AbgKXJih (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 04:38:37 -0500
Received: from retiisi.eu ([95.216.213.190]:45008 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731491AbgKXJif (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 04:38:35 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 583DF634CA3;
        Tue, 24 Nov 2020 11:37:52 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 17/30] ccs: Read ireal numbers correctly
Date:   Tue, 24 Nov 2020 11:32:13 +0200
Message-Id: <20201124093226.23737-18-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
References: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
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
index 57efc34fc67d..074b246538d2 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -126,8 +126,8 @@ void ccs_replace_limit(struct ccs_sensor *sensor,
 	ccs_assign_limit(ptr, ccs_reg_width(linfo->reg), val);
 }
 
-static u32 ccs_get_limit(struct ccs_sensor *sensor,
-			 unsigned int limit, unsigned int offset)
+u32 ccs_get_limit(struct ccs_sensor *sensor, unsigned int limit,
+		  unsigned int offset)
 {
 	void *ptr;
 	u32 val;
@@ -155,12 +155,6 @@ static u32 ccs_get_limit(struct ccs_sensor *sensor,
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


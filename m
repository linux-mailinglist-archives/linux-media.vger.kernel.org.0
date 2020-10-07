Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF8D285ACD
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbgJGIp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:45:58 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57020 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727914AbgJGIp6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:45:58 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id A7274634C89
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:15 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 002/106] smiapp: Use CCS register flags
Date:   Wed,  7 Oct 2020 11:44:22 +0300
Message-Id: <20201007084557.25843-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the CCS register flags instead of the old smia flags. The
new flags include the register width information that was separate from
the register flags previously.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-reg-defs.h |  8 ++++----
 drivers/media/i2c/smiapp/smiapp-regs.c     | 20 +++++++++++++-------
 drivers/media/i2c/smiapp/smiapp-regs.h     | 13 ++++---------
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-reg-defs.h b/drivers/media/i2c/smiapp/smiapp-reg-defs.h
index 865488befc09..ec574007908b 100644
--- a/drivers/media/i2c/smiapp/smiapp-reg-defs.h
+++ b/drivers/media/i2c/smiapp/smiapp-reg-defs.h
@@ -7,11 +7,11 @@
  * Copyright (C) 2011--2012 Nokia Corporation
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
  */
-#define SMIAPP_REG_MK_U8(r) ((SMIAPP_REG_8BIT << 16) | (r))
-#define SMIAPP_REG_MK_U16(r) ((SMIAPP_REG_16BIT << 16) | (r))
-#define SMIAPP_REG_MK_U32(r) ((SMIAPP_REG_32BIT << 16) | (r))
+#define SMIAPP_REG_MK_U8(r)	(r)
+#define SMIAPP_REG_MK_U16(r)	(CCS_FL_16BIT | (r))
+#define SMIAPP_REG_MK_U32(r)	(CCS_FL_32BIT | (r))
 
-#define SMIAPP_REG_MK_F32(r) (SMIAPP_REG_FLAG_FLOAT | (SMIAPP_REG_32BIT << 16) | (r))
+#define SMIAPP_REG_MK_F32(r)	(CCS_FL_FLOAT_IREAL | CCS_FL_32BIT | (r))
 
 #define SMIAPP_REG_U16_MODEL_ID					SMIAPP_REG_MK_U16(0x0000)
 #define SMIAPP_REG_U8_REVISION_NUMBER_MAJOR			SMIAPP_REG_MK_U8(0x0002)
diff --git a/drivers/media/i2c/smiapp/smiapp-regs.c b/drivers/media/i2c/smiapp/smiapp-regs.c
index 1b58b7c6c839..904054d303ba 100644
--- a/drivers/media/i2c/smiapp/smiapp-regs.c
+++ b/drivers/media/i2c/smiapp/smiapp-regs.c
@@ -133,6 +133,16 @@ static int ____smiapp_read_8only(struct smiapp_sensor *sensor, u16 reg,
 	return 0;
 }
 
+unsigned int ccs_reg_width(u32 reg)
+{
+	if (reg & CCS_FL_16BIT)
+		return sizeof(uint16_t);
+	if (reg & CCS_FL_32BIT)
+		return sizeof(uint32_t);
+
+	return sizeof(uint8_t);
+}
+
 /*
  * Read a 8/16/32-bit i2c register.  The value is returned in 'val'.
  * Returns zero if successful, or non-zero otherwise.
@@ -141,13 +151,9 @@ static int __smiapp_read(struct smiapp_sensor *sensor, u32 reg, u32 *val,
 			 bool only8)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	u8 len = SMIAPP_REG_WIDTH(reg);
+	unsigned int len = ccs_reg_width(reg);
 	int rval;
 
-	if (len != SMIAPP_REG_8BIT && len != SMIAPP_REG_16BIT
-	    && len != SMIAPP_REG_32BIT)
-		return -EINVAL;
-
 	if (!only8)
 		rval = ____smiapp_read(sensor, SMIAPP_REG_ADDR(reg), len, val);
 	else
@@ -156,7 +162,7 @@ static int __smiapp_read(struct smiapp_sensor *sensor, u32 reg, u32 *val,
 	if (rval < 0)
 		return rval;
 
-	if (reg & SMIAPP_REG_FLAG_FLOAT)
+	if (reg & CCS_FL_FLOAT_IREAL)
 		*val = float_to_u32_mul_1000000(client, *val);
 
 	return 0;
@@ -204,7 +210,7 @@ int smiapp_write_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val)
 	struct i2c_msg msg;
 	unsigned char data[6];
 	unsigned int retries;
-	u8 len = SMIAPP_REG_WIDTH(reg);
+	unsigned int len = ccs_reg_width(reg);
 	int r;
 
 	if (len > sizeof(data) - 2)
diff --git a/drivers/media/i2c/smiapp/smiapp-regs.h b/drivers/media/i2c/smiapp/smiapp-regs.h
index 8fda6ed5668c..7223f5f89109 100644
--- a/drivers/media/i2c/smiapp/smiapp-regs.h
+++ b/drivers/media/i2c/smiapp/smiapp-regs.h
@@ -14,16 +14,9 @@
 #include <linux/i2c.h>
 #include <linux/types.h>
 
-#define SMIAPP_REG_ADDR(reg)		((u16)reg)
-#define SMIAPP_REG_WIDTH(reg)		((u8)(reg >> 16))
-#define SMIAPP_REG_FLAGS(reg)		((u8)(reg >> 24))
-
-/* Use upper 8 bits of the type field for flags */
-#define SMIAPP_REG_FLAG_FLOAT		(1 << 24)
+#include "ccs-regs.h"
 
-#define SMIAPP_REG_8BIT			1
-#define SMIAPP_REG_16BIT		2
-#define SMIAPP_REG_32BIT		4
+#define SMIAPP_REG_ADDR(reg)		((u16)reg)
 
 struct smiapp_sensor;
 
@@ -33,4 +26,6 @@ int smiapp_read_8only(struct smiapp_sensor *sensor, u32 reg, u32 *val);
 int smiapp_write_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val);
 int smiapp_write(struct smiapp_sensor *sensor, u32 reg, u32 val);
 
+unsigned int ccs_reg_width(u32 reg);
+
 #endif
-- 
2.27.0


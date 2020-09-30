Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFEB27ECDA
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731148AbgI3PaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:03 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44670 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730969AbgI3P3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:08 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id CC564634CD5
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:49 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 039/100] ccs: Make real to integer number conversion optional
Date:   Wed, 30 Sep 2020 18:27:57 +0300
Message-Id: <20200930152858.8471-40-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The limit values will be raw soon, and the conversion takes place later
on. Prepare for that.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-reg-access.c | 35 +++++++++++++++++++-------
 drivers/media/i2c/ccs/ccs-reg-access.h |  2 ++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index abec746f3c93..fe6112cba6be 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -143,14 +143,23 @@ unsigned int ccs_reg_width(u32 reg)
 	return sizeof(uint8_t);
 }
 
+u32 ccs_reg_conv(struct ccs_sensor *sensor, u32 reg, u32 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+
+	if (reg & CCS_FL_FLOAT_IREAL)
+		val = float_to_u32_mul_1000000(client, val);
+
+	return val;
+}
+
 /*
  * Read a 8/16/32-bit i2c register.  The value is returned in 'val'.
  * Returns zero if successful, or non-zero otherwise.
  */
 static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
-			   bool only8)
+			   bool only8, bool conv)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	unsigned int len = ccs_reg_width(reg);
 	int rval;
 
@@ -162,14 +171,16 @@ static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
 	if (rval < 0)
 		return rval;
 
-	if (reg & CCS_FL_FLOAT_IREAL)
-		*val = float_to_u32_mul_1000000(client, *val);
+	if (!conv)
+		return 0;
+
+	*val = ccs_reg_conv(sensor, reg, *val);
 
 	return 0;
 }
 
 static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
-			     bool force8, bool quirk)
+			     bool force8, bool quirk, bool conv)
 {
 	int rval;
 
@@ -182,22 +193,28 @@ static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
 			return rval;
 
 		if (force8)
-			return __ccs_read_addr(sensor, reg, val, true);
+			return __ccs_read_addr(sensor, reg, val, true, conv);
 	}
 
 	return __ccs_read_addr(sensor, reg, val,
 			       ccs_needs_quirk(sensor,
-					       CCS_QUIRK_FLAG_8BIT_READ_ONLY));
+					       CCS_QUIRK_FLAG_8BIT_READ_ONLY),
+			       conv);
 }
 
 int ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val)
 {
-	return ccs_read_addr_raw(sensor, reg, val, false, true);
+	return ccs_read_addr_raw(sensor, reg, val, false, true, true);
 }
 
 int ccs_read_addr_8only(struct ccs_sensor *sensor, u32 reg, u32 *val)
 {
-	return ccs_read_addr_raw(sensor, reg, val, true, true);
+	return ccs_read_addr_raw(sensor, reg, val, true, true, true);
+}
+
+int ccs_read_addr_noconv(struct ccs_sensor *sensor, u32 reg, u32 *val)
+{
+	return ccs_read_addr_raw(sensor, reg, val, false, true, false);
 }
 
 int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val)
diff --git a/drivers/media/i2c/ccs/ccs-reg-access.h b/drivers/media/i2c/ccs/ccs-reg-access.h
index 9fdf5659ed09..5f6ff9c57698 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.h
+++ b/drivers/media/i2c/ccs/ccs-reg-access.h
@@ -24,10 +24,12 @@ struct ccs_sensor;
 int ccs_read_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 *val);
 int ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val);
 int ccs_read_addr_8only(struct ccs_sensor *sensor, u32 reg, u32 *val);
+int ccs_read_addr_noconv(struct ccs_sensor *sensor, u32 reg, u32 *val);
 int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val);
 int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val);
 
 unsigned int ccs_reg_width(u32 reg);
+u32 ccs_reg_conv(struct ccs_sensor *sensor, u32 reg, u32 val);
 
 #define ccs_read(sensor, reg_name, val) \
 	ccs_read_addr(sensor, CCS_R_##reg_name, val)
-- 
2.27.0


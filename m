Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7DE27ECD7
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731145AbgI3PaC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:02 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44680 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730984AbgI3P3J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:09 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 69F8A634C91
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 045/100] ccs: Use static data read-only registers
Date:   Wed, 30 Sep 2020 18:28:03 +0300
Message-Id: <20200930152858.8471-46-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Access read-only registers from CCS static data.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-reg-access.c | 64 ++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index 9fda16b221a7..02af2b0abdaf 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -198,11 +198,67 @@ static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
 	return 0;
 }
 
+static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
+			   u32 reg, u32 *val)
+{
+	unsigned int width = ccs_reg_width(reg);
+	size_t i;
+
+	for (i = 0; i < num_regs; i++, regs++) {
+		uint8_t *data;
+
+		if (regs->addr + regs->len < CCS_REG_ADDR(reg) + width)
+			continue;
+
+		if (regs->addr > CCS_REG_ADDR(reg))
+			break;
+
+		data = &regs->value[CCS_REG_ADDR(reg) - regs->addr];
+
+		switch (width) {
+		case sizeof(uint8_t):
+			*val = *data;
+			break;
+		case sizeof(uint16_t):
+			*val = get_unaligned_be16(data);
+			break;
+		case sizeof(uint32_t):
+			*val = get_unaligned_be32(data);
+			break;
+		default:
+			WARN_ON(1);
+			return -EINVAL;
+		}
+
+		return 0;
+	}
+
+	return -ENOENT;
+}
+
+static int ccs_read_data(struct ccs_sensor *sensor, u32 reg, u32 *val)
+{
+	if (!__ccs_read_data(sensor->sdata.sensor_read_only_regs,
+			     sensor->sdata.num_sensor_read_only_regs,
+			     reg, val))
+		return 0;
+
+	return __ccs_read_data(sensor->mdata.module_read_only_regs,
+			       sensor->mdata.num_module_read_only_regs,
+			       reg, val);
+}
+
 static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
-			     bool force8, bool quirk, bool conv)
+			     bool force8, bool quirk, bool conv, bool data)
 {
 	int rval;
 
+	if (data) {
+		rval = ccs_read_data(sensor, reg, val);
+		if (!rval)
+			return 0;
+	}
+
 	if (quirk) {
 		*val = 0;
 		rval = ccs_call_quirk(sensor, reg_access, false, &reg, val);
@@ -223,17 +279,17 @@ static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
 
 int ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val)
 {
-	return ccs_read_addr_raw(sensor, reg, val, false, true, true);
+	return ccs_read_addr_raw(sensor, reg, val, false, true, true, true);
 }
 
 int ccs_read_addr_8only(struct ccs_sensor *sensor, u32 reg, u32 *val)
 {
-	return ccs_read_addr_raw(sensor, reg, val, true, true, true);
+	return ccs_read_addr_raw(sensor, reg, val, true, true, true, true);
 }
 
 int ccs_read_addr_noconv(struct ccs_sensor *sensor, u32 reg, u32 *val)
 {
-	return ccs_read_addr_raw(sensor, reg, val, false, true, false);
+	return ccs_read_addr_raw(sensor, reg, val, false, true, false, true);
 }
 
 static int ccs_write_retry(struct i2c_client *client, struct i2c_msg *msg)
-- 
2.27.0


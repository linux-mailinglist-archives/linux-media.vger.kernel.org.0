Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23CB42D1C16
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727449AbgLGV1P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:27:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgLGV1O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 16:27:14 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35566C0611E4
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 13:23:28 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 07ACA634CBE;
        Mon,  7 Dec 2020 23:23:14 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 23/24] ccs: Switch from standard integer types to kernel ones
Date:   Mon,  7 Dec 2020 23:15:29 +0200
Message-Id: <20201207211530.21180-24-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The preferred integer types in the kernel are the Linux specific ones,
switch from standard C types to u32 and alike.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c       |  2 +-
 drivers/media/i2c/ccs/ccs-reg-access.c | 21 ++++++++++-----------
 drivers/media/i2c/ccs/ccs.h            |  6 +++---
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a8f591c95bc2..15afbb4f5b31 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1190,7 +1190,7 @@ static void ccs_update_blanking(struct ccs_sensor *sensor)
 {
 	struct v4l2_ctrl *vblank = sensor->vblank;
 	struct v4l2_ctrl *hblank = sensor->hblank;
-	uint16_t min_fll, max_fll, min_llp, max_llp, min_lbp;
+	u16 min_fll, max_fll, min_llp, max_llp, min_lbp;
 	int min, max;
 
 	if (sensor->binning_vertical > 1 || sensor->binning_horizontal > 1) {
diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index 5f0705952198..25993445f4fe 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -17,11 +17,10 @@
 #include "ccs.h"
 #include "ccs-limits.h"
 
-static uint32_t float_to_u32_mul_1000000(struct i2c_client *client,
-					 uint32_t phloat)
+static u32 float_to_u32_mul_1000000(struct i2c_client *client, u32 phloat)
 {
-	int32_t exp;
-	uint64_t man;
+	s32 exp;
+	u64 man;
 
 	if (phloat >= 0x80000000) {
 		dev_err(&client->dev, "this is a negative number\n");
@@ -137,11 +136,11 @@ static int ____ccs_read_addr_8only(struct ccs_sensor *sensor, u16 reg,
 unsigned int ccs_reg_width(u32 reg)
 {
 	if (reg & CCS_FL_16BIT)
-		return sizeof(uint16_t);
+		return sizeof(u16);
 	if (reg & CCS_FL_32BIT)
-		return sizeof(uint32_t);
+		return sizeof(u32);
 
-	return sizeof(uint8_t);
+	return sizeof(u8);
 }
 
 static u32 ireal32_to_u32_mul_1000000(struct i2c_client *client, u32 val)
@@ -205,7 +204,7 @@ static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
 	size_t i;
 
 	for (i = 0; i < num_regs; i++, regs++) {
-		uint8_t *data;
+		u8 *data;
 
 		if (regs->addr + regs->len < CCS_REG_ADDR(reg) + width)
 			continue;
@@ -216,13 +215,13 @@ static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
 		data = &regs->value[CCS_REG_ADDR(reg) - regs->addr];
 
 		switch (width) {
-		case sizeof(uint8_t):
+		case sizeof(u8):
 			*val = *data;
 			break;
-		case sizeof(uint16_t):
+		case sizeof(u16):
 			*val = get_unaligned_be16(data);
 			break;
-		case sizeof(uint32_t):
+		case sizeof(u32):
 			*val = get_unaligned_be32(data);
 			break;
 		default:
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index cc33c9ba3165..6beac375cc48 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -84,11 +84,11 @@ struct ccs_hwconfig {
 	unsigned short i2c_addr_dfl;	/* Default i2c addr */
 	unsigned short i2c_addr_alt;	/* Alternate i2c addr */
 
-	uint32_t ext_clk;		/* sensor external clk */
+	u32 ext_clk;			/* sensor external clk */
 
 	unsigned int lanes;		/* Number of CSI-2 lanes */
-	uint32_t csi_signalling_mode;	/* CCS_CSI_SIGNALLING_MODE_* */
-	uint64_t *op_sys_clock;
+	u32 csi_signalling_mode;	/* CCS_CSI_SIGNALLING_MODE_* */
+	u64 *op_sys_clock;
 
 	enum ccs_module_board_orient module_board_orient;
 
-- 
2.29.2


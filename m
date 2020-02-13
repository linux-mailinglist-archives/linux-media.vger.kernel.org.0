Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A310315BC07
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 10:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729675AbgBMJti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 04:49:38 -0500
Received: from retiisi.org.uk ([95.216.213.190]:59668 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729617AbgBMJtg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 04:49:36 -0500
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id B37EA634C8E
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 11:49:18 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 3/7] smiapp: Use unaligned get and put functions
Date:   Thu, 13 Feb 2020 11:49:30 +0200
Message-Id: <20200213094934.18595-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213094934.18595-1-sakari.ailus@linux.intel.com>
References: <20200213094934.18595-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use get_unaligned_be* and put_unaligned_be* functions to convert register
values to CPU endianness. Consequently, two instances of BUG() are
removed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-regs.c | 69 +++++++-------------------
 1 file changed, 19 insertions(+), 50 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-regs.c b/drivers/media/i2c/smiapp/smiapp-regs.c
index cc93a7dbf8a6..1b58b7c6c839 100644
--- a/drivers/media/i2c/smiapp/smiapp-regs.c
+++ b/drivers/media/i2c/smiapp/smiapp-regs.c
@@ -8,6 +8,8 @@
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
  */
 
+#include <asm/unaligned.h>
+
 #include <linux/delay.h>
 #include <linux/i2c.h>
 
@@ -69,18 +71,19 @@ static int ____smiapp_read(struct smiapp_sensor *sensor, u16 reg,
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	struct i2c_msg msg;
-	unsigned char data[4];
-	u16 offset = reg;
+	unsigned char data_buf[sizeof(u32)] = { 0 };
+	unsigned char offset_buf[sizeof(u16)];
 	int r;
 
+	if (len > sizeof(data_buf))
+		return -EINVAL;
+
 	msg.addr = client->addr;
 	msg.flags = 0;
-	msg.len = 2;
-	msg.buf = data;
+	msg.len = sizeof(offset_buf);
+	msg.buf = offset_buf;
+	put_unaligned_be16(reg, offset_buf);
 
-	/* high byte goes out first */
-	data[0] = (u8) (offset >> 8);
-	data[1] = (u8) offset;
 	r = i2c_transfer(client->adapter, &msg, 1);
 	if (r != 1) {
 		if (r >= 0)
@@ -90,6 +93,8 @@ static int ____smiapp_read(struct smiapp_sensor *sensor, u16 reg,
 
 	msg.len = len;
 	msg.flags = I2C_M_RD;
+	msg.buf = &data_buf[sizeof(data_buf) - len];
+
 	r = i2c_transfer(client->adapter, &msg, 1);
 	if (r != 1) {
 		if (r >= 0)
@@ -97,27 +102,12 @@ static int ____smiapp_read(struct smiapp_sensor *sensor, u16 reg,
 		goto err;
 	}
 
-	*val = 0;
-	/* high byte comes first */
-	switch (len) {
-	case SMIAPP_REG_32BIT:
-		*val = (data[0] << 24) + (data[1] << 16) + (data[2] << 8) +
-			data[3];
-		break;
-	case SMIAPP_REG_16BIT:
-		*val = (data[0] << 8) + data[1];
-		break;
-	case SMIAPP_REG_8BIT:
-		*val = data[0];
-		break;
-	default:
-		BUG();
-	}
+	*val = get_unaligned_be32(data_buf);
 
 	return 0;
 
 err:
-	dev_err(&client->dev, "read from offset 0x%x error %d\n", offset, r);
+	dev_err(&client->dev, "read from offset 0x%x error %d\n", reg, r);
 
 	return r;
 }
@@ -214,13 +204,10 @@ int smiapp_write_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val)
 	struct i2c_msg msg;
 	unsigned char data[6];
 	unsigned int retries;
-	u8 flags = SMIAPP_REG_FLAGS(reg);
 	u8 len = SMIAPP_REG_WIDTH(reg);
-	u16 offset = SMIAPP_REG_ADDR(reg);
 	int r;
 
-	if ((len != SMIAPP_REG_8BIT && len != SMIAPP_REG_16BIT &&
-	     len != SMIAPP_REG_32BIT) || flags)
+	if (len > sizeof(data) - 2)
 		return -EINVAL;
 
 	msg.addr = client->addr;
@@ -228,27 +215,8 @@ int smiapp_write_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val)
 	msg.len = 2 + len;
 	msg.buf = data;
 
-	/* high byte goes out first */
-	data[0] = (u8) (reg >> 8);
-	data[1] = (u8) (reg & 0xff);
-
-	switch (len) {
-	case SMIAPP_REG_8BIT:
-		data[2] = val;
-		break;
-	case SMIAPP_REG_16BIT:
-		data[2] = val >> 8;
-		data[3] = val;
-		break;
-	case SMIAPP_REG_32BIT:
-		data[2] = val >> 24;
-		data[3] = val >> 16;
-		data[4] = val >> 8;
-		data[5] = val;
-		break;
-	default:
-		BUG();
-	}
+	put_unaligned_be16(SMIAPP_REG_ADDR(reg), data);
+	put_unaligned_be32(val << (8 * (sizeof(val) - len)), data + 2);
 
 	for (retries = 0; retries < 5; retries++) {
 		/*
@@ -269,7 +237,8 @@ int smiapp_write_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val)
 	}
 
 	dev_err(&client->dev,
-		"wrote 0x%x to offset 0x%x error %d\n", val, offset, r);
+		"wrote 0x%x to offset 0x%x error %d\n", val,
+		SMIAPP_REG_ADDR(reg), r);
 
 	return r;
 }
-- 
2.20.1


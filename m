Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABD8E2CA8BC
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 17:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403992AbgLAQtr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 11:49:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403988AbgLAQtq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 11:49:46 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA47C061A49
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 08:48:06 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 21140634CBD;
        Tue,  1 Dec 2020 18:45:14 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 22/30] ccs: Add support for manufacturer regs from sensor and module files
Date:   Tue,  1 Dec 2020 18:42:38 +0200
Message-Id: <20201201164246.18003-23-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
References: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Write manufacturer specific registers (MSRs) from file to the sensor on
sensor power-on.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c       | 23 +++++++
 drivers/media/i2c/ccs/ccs-reg-access.c | 94 ++++++++++++++++++++------
 drivers/media/i2c/ccs/ccs-reg-access.h |  2 +
 3 files changed, 97 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index c53911b1c78b..5e01f22608d7 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1278,6 +1278,21 @@ static int ccs_setup_flash_strobe(struct ccs_sensor *sensor)
  * Power management
  */
 
+static int ccs_write_msr_regs(struct ccs_sensor *sensor)
+{
+	int rval;
+
+	rval = ccs_write_data_regs(sensor,
+				   sensor->sdata.sensor_manufacturer_regs,
+				   sensor->sdata.num_sensor_manufacturer_regs);
+	if (rval)
+		return rval;
+
+	return ccs_write_data_regs(sensor,
+				   sensor->mdata.module_manufacturer_regs,
+				   sensor->mdata.num_module_manufacturer_regs);
+}
+
 static int ccs_power_on(struct device *dev)
 {
 	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
@@ -1383,6 +1398,10 @@ static int ccs_power_on(struct device *dev)
 	if (rval < 0)
 		goto out_cci_addr_fail;
 
+	rval = ccs_write_msr_regs(sensor);
+	if (rval)
+		goto out_cci_addr_fail;
+
 	rval = ccs_call_quirk(sensor, post_poweron);
 	if (rval) {
 		dev_err(dev, "post_poweron quirks failed\n");
@@ -3220,6 +3239,10 @@ static int ccs_probe(struct i2c_client *client)
 	if (rval < 0)
 		goto out_media_entity_cleanup;
 
+	rval = ccs_write_msr_regs(sensor);
+	if (rval)
+		goto out_media_entity_cleanup;
+
 	pm_runtime_set_active(&client->dev);
 	pm_runtime_get_noresume(&client->dev);
 	pm_runtime_enable(&client->dev);
diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index 79efed5e0dad..918bc98c226f 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -236,12 +236,38 @@ int ccs_read_addr_noconv(struct ccs_sensor *sensor, u32 reg, u32 *val)
 	return ccs_read_addr_raw(sensor, reg, val, false, true, false);
 }
 
+static int ccs_write_retry(struct i2c_client *client, struct i2c_msg *msg)
+{
+	unsigned int retries;
+	int r;
+
+	for (retries = 0; retries < 10; retries++) {
+		/*
+		 * Due to unknown reason sensor stops responding. This
+		 * loop is a temporaty solution until the root cause
+		 * is found.
+		 */
+		r = i2c_transfer(client->adapter, msg, 1);
+		if (r != 1) {
+			usleep_range(1000, 2000);
+			continue;
+		}
+
+		if (retries)
+			dev_err(&client->dev,
+				"sensor i2c stall encountered. retries: %d\n",
+				retries);
+		return 0;
+	}
+
+	return r;
+}
+
 int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	struct i2c_msg msg;
 	unsigned char data[6];
-	unsigned int retries;
 	unsigned int len = ccs_reg_width(reg);
 	int r;
 
@@ -256,27 +282,11 @@ int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val)
 	put_unaligned_be16(CCS_REG_ADDR(reg), data);
 	put_unaligned_be32(val << (8 * (sizeof(val) - len)), data + 2);
 
-	for (retries = 0; retries < 10; retries++) {
-		/*
-		 * Due to unknown reason sensor stops responding. This
-		 * loop is a temporaty solution until the root cause
-		 * is found.
-		 */
-		r = i2c_transfer(client->adapter, &msg, 1);
-		if (r == 1) {
-			if (retries)
-				dev_err(&client->dev,
-					"sensor i2c stall encountered. retries: %d\n",
-					retries);
-			return 0;
-		}
-
-		usleep_range(1000, 2000);
-	}
-
-	dev_err(&client->dev,
-		"wrote 0x%x to offset 0x%x error %d\n", val,
-		CCS_REG_ADDR(reg), r);
+	r = ccs_write_retry(client, &msg);
+	if (r)
+		dev_err(&client->dev,
+			"wrote 0x%x to offset 0x%x error %d\n", val,
+			CCS_REG_ADDR(reg), r);
 
 	return r;
 }
@@ -297,3 +307,43 @@ int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val)
 
 	return ccs_write_addr_no_quirk(sensor, reg, val);
 }
+
+#define MAX_WRITE_LEN	32U
+
+int ccs_write_data_regs(struct ccs_sensor *sensor, struct ccs_reg *regs,
+			size_t num_regs)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	unsigned char buf[2 + MAX_WRITE_LEN];
+	struct i2c_msg msg = {
+		.addr = client->addr,
+		.buf = buf,
+	};
+	size_t i;
+
+	for (i = 0; i < num_regs; i++, regs++) {
+		unsigned char *regdata = regs->value;
+		unsigned int j;
+
+		for (j = 0; j < regs->len;
+		     j += msg.len - 2, regdata += msg.len - 2) {
+			int rval;
+
+			msg.len = min(regs->len - j, MAX_WRITE_LEN);
+
+			put_unaligned_be16(regs->addr + j, buf);
+			memcpy(buf + 2, regdata, msg.len);
+			msg.len += 2;
+
+			rval = ccs_write_retry(client, &msg);
+			if (rval) {
+				dev_err(&client->dev,
+					"error writing %u octets to address 0x%4.4x\n",
+					msg.len, regs->addr + j);
+				return rval;
+			}
+		}
+	}
+
+	return 0;
+}
diff --git a/drivers/media/i2c/ccs/ccs-reg-access.h b/drivers/media/i2c/ccs/ccs-reg-access.h
index cfad2e520fe2..78c43f92d99a 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.h
+++ b/drivers/media/i2c/ccs/ccs-reg-access.h
@@ -27,6 +27,8 @@ int ccs_read_addr_8only(struct ccs_sensor *sensor, u32 reg, u32 *val);
 int ccs_read_addr_noconv(struct ccs_sensor *sensor, u32 reg, u32 *val);
 int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val);
 int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val);
+int ccs_write_data_regs(struct ccs_sensor *sensor, struct ccs_reg *regs,
+			size_t num_regs);
 
 unsigned int ccs_reg_width(u32 reg);
 u32 ccs_reg_conv(struct ccs_sensor *sensor, u32 reg, u32 val);
-- 
2.27.0


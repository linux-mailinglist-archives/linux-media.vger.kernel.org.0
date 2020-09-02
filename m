Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436C025B6A0
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 00:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgIBWsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 18:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbgIBWsY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 18:48:24 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 712A6C061261
        for <linux-media@vger.kernel.org>; Wed,  2 Sep 2020 15:48:22 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c15so994281wrs.11
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 15:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QMDZGv3ZPBBYj+FbkhUGXnWiSbuYYgZwozAwRBqiscE=;
        b=RAtIb8pwDv43CIa4W1TtitcIqQiCSVRWWyc+oLJFuOBiazyOa3MAge3T8SuiNYvFrv
         ah+Cd1lgygFjkI6MCFehSmvkV9Wc8OWBJzm78qNWm79s717pZNNup9gMfdeVOARQBwDG
         CwSywDH9C2wZZPeCRcLFJJIvJYIJUca7Jbpzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QMDZGv3ZPBBYj+FbkhUGXnWiSbuYYgZwozAwRBqiscE=;
        b=p5xGIBlEGvEBqgU/sCdsuMRj+cmv6GLPlIi27tac0EDfYhcyk5Yqd7bw7hhw9tRYaM
         XZc2OR/Rg//XMRf/Cry7vX3xzdN8jKkagwoBQNb0DKJSosX9KNx+jJsoS9cScqNEPtNY
         L5NaPuqeel9+p7ebuREX7AeMrorSr9MRq9zalqq/jbYhxTPdPzofQXkUpniiYRJpnckN
         d12ySdR0ejLdoqzm6UakQcMzc4bo6M8igkquwYvzseC635ot79I29VKaTdGuD2hoQ0QZ
         zo0LBJX4u8lMo8Duu6qBFP7BZWrJKQcL4EnA+tExqz1fYAGZchlA6JctsBSno1NJaFyt
         ASZA==
X-Gm-Message-State: AOAM530iRaV7sETGfGSYH8KadAWYUMxYkQRUczsXxekrRjiblUfTx/jQ
        m6qsZEQ3mjmVsm0aMX9cXBgdlYXbg0VUew==
X-Google-Smtp-Source: ABdhPJy8TzIYGpYGv0Zx8StjrJAk4i6UTv2z1JZC8ADKajlPdQwzcGxJXKB+C4h6p0n6d9797Jv1BA==
X-Received: by 2002:a5d:5602:: with SMTP id l2mr405221wrv.410.1599086900693;
        Wed, 02 Sep 2020 15:48:20 -0700 (PDT)
Received: from tfiga.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id m125sm1557568wme.35.2020.09.02.15.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 15:48:20 -0700 (PDT)
From:   Tomasz Figa <tfiga@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hao He <hao.he@bitland.com.cn>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, drinkcat@chromium.org,
        Xingyu Wu <wuxy@bitland.com.cn>, dongchun.zhu@mediatek.com,
        sj.huang@mediatek.com, darfur_liu@gcoreinc.com, hao.he7@gmail.com,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v4 4/4] media: i2c: gc5035: Add OTP configuration handling
Date:   Wed,  2 Sep 2020 22:48:13 +0000
Message-Id: <20200902224813.14283-5-tfiga@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
In-Reply-To: <20200902224813.14283-1-tfiga@chromium.org>
References: <20200902224813.14283-1-tfiga@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hao He <hao.he@bitland.com.cn>

The sensor OTP holds values for various configuration registers
deteremined at manufacturing time and dead pixel correction tables. Add
code to load both from the OTP and initialize the sensor appropriately.

Signed-off-by: Hao He <hao.he@bitland.com.cn>
Signed-off-by: Xingyu Wu <wuxy@bitland.com.cn>
Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/media/i2c/gc5035.c | 478 +++++++++++++++++++++++++++++++++++++
 1 file changed, 478 insertions(+)

diff --git a/drivers/media/i2c/gc5035.c b/drivers/media/i2c/gc5035.c
index 12e1b3a430b5..61645cec6948 100644
--- a/drivers/media/i2c/gc5035.c
+++ b/drivers/media/i2c/gc5035.c
@@ -81,6 +81,57 @@
 #define GC5035_TEST_PATTERN_ENABLE			0x11
 #define GC5035_TEST_PATTERN_DISABLE			0x10
 
+/* Page 2 registers */
+
+/* OTP access registers */
+#define GC5035_REG_OTP_MODE				0xf3
+#define GC5035_OTP_PRE_READ				0x20
+#define GC5035_OTP_READ_MODE				0x12
+#define GC5035_OTP_READ_DONE				0x00
+#define GC5035_REG_OTP_DATA				0x6c
+#define GC5035_REG_OTP_ACCESS_ADDR_H			0x69
+#define GC5035_REG_OTP_ACCESS_ADDR_L			0x6a
+#define GC5035_OTP_ACCESS_ADDR_H_MASK			0x1f
+#define GC5035_OTP_ADDR_MASK				0x1fff
+#define GC5035_OTP_ADDR_SHIFT				3
+#define GC5035_REG_DD_TOTALNUM_H			0x01
+#define GC5035_REG_DD_TOTALNUM_L			0x02
+#define GC5035_DD_TOTALNUM_H_MASK			0x07
+#define GC5035_REG_DD_LOAD_STATUS			0x06
+#define GC5035_OTP_BIT_LOAD				BIT(0)
+
+/* OTP-related definitions */
+
+#define GC5035_OTP_ID_SIZE				9
+#define GC5035_OTP_ID_DATA_OFFSET			0x0020
+#define GC5035_OTP_DATA_LENGTH				1024
+
+/* OTP DPC parameters */
+#define GC5035_OTP_DPC_FLAG_OFFSET			0x0068
+#define GC5035_OTP_DPC_FLAG_MASK			0x03
+#define GC5035_OTP_FLAG_EMPTY				0x00
+#define GC5035_OTP_FLAG_VALID				0x01
+#define GC5035_OTP_DPC_TOTAL_NUMBER_OFFSET		0x0070
+#define GC5035_OTP_DPC_ERROR_NUMBER_OFFSET		0x0078
+
+/* OTP register parameters */
+#define GC5035_OTP_REG_FLAG_OFFSET			0x0880
+#define GC5035_OTP_REG_DATA_OFFSET			0x0888
+#define GC5035_OTP_REG_ADDR_OFFSET			1
+#define GC5035_OTP_REG_VAL_OFFSET			2
+#define GC5035_OTP_PAGE_FLAG_OFFSET			3
+#define GC5035_OTP_PER_PAGE_SIZE			4
+#define GC5035_OTP_REG_PAGE_MASK			0x07
+#define GC5035_OTP_REG_MAX_GROUP			5
+#define GC5035_OTP_REG_BYTE_PER_GROUP			5
+#define GC5035_OTP_REG_PER_GROUP			2
+#define GC5035_OTP_REG_BYTE_PER_REG			2
+#define GC5035_OTP_REG_DATA_SIZE			25
+#define GC5035_OTP_REG_SIZE				10
+
+#define GC5035_DD_DELAY_US				(10 * 1000)
+#define GC5035_DD_TIMEOUT_US				(100 * 1000)
+
 static const char * const gc5035_supplies[] = {
 	/*
 	 * Requested separately due to power sequencing needs:
@@ -95,6 +146,21 @@ struct gc5035_regval {
 	u8 val;
 };
 
+struct gc5035_reg {
+	u8 page;
+	struct gc5035_regval regval;
+};
+
+struct gc5035_otp_regs {
+	unsigned int num_regs;
+	struct gc5035_reg regs[GC5035_OTP_REG_SIZE];
+};
+
+struct gc5035_dpc {
+	bool valid;
+	unsigned int total_num;
+};
+
 struct gc5035_mode {
 	u32 width;
 	u32 height;
@@ -122,6 +188,11 @@ struct gc5035 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 
+	bool otp_read;
+	u8 otp_id[GC5035_OTP_ID_SIZE];
+	struct gc5035_dpc dpc;
+	struct gc5035_otp_regs otp_regs;
+
 	/*
 	 * Serialize control access, get/set format, get selection
 	 * and start streaming.
@@ -136,6 +207,69 @@ static inline struct gc5035 *to_gc5035(struct v4l2_subdev *sd)
 	return container_of(sd, struct gc5035, subdev);
 }
 
+static const struct gc5035_regval gc5035_otp_init_regs[] = {
+	{0xfc, 0x01},
+	{0xf4, 0x40},
+	{0xf5, 0xe9},
+	{0xf6, 0x14},
+	{0xf8, 0x49},
+	{0xf9, 0x82},
+	{0xfa, 0x00},
+	{0xfc, 0x81},
+	{0xfe, 0x00},
+	{0x36, 0x01},
+	{0xd3, 0x87},
+	{0x36, 0x00},
+	{0x33, 0x00},
+	{0xf7, 0x01},
+	{0xfc, 0x8e},
+	{0xfe, 0x00},
+	{0xee, 0x30},
+	{0xfa, 0x10},
+	{0xf5, 0xe9},
+	{0xfe, 0x02},
+	{0x67, 0xc0},
+	{0x59, 0x3f},
+	{0x55, 0x84},
+	{0x65, 0x80},
+	{0x66, 0x03},
+	{0xfe, 0x00},
+};
+
+static const struct gc5035_regval gc5035_otp_exit_regs[] = {
+	{0xfe, 0x02},
+	{0x67, 0x00},
+	{0xfe, 0x00},
+	{0xfa, 0x00},
+};
+
+static const struct gc5035_regval gc5035_dd_auto_load_regs[] = {
+	{0xfe, 0x02},
+	{0xbe, 0x00},
+	{0xa9, 0x01},
+	{0x09, 0x33},
+};
+
+static const struct gc5035_regval gc5035_otp_dd_regs[] = {
+	{0x03, 0x00},
+	{0x04, 0x80},
+	{0x95, 0x0a},
+	{0x96, 0x30},
+	{0x97, 0x0a},
+	{0x98, 0x32},
+	{0x99, 0x07},
+	{0x9a, 0xa9},
+	{0xf3, 0x80},
+};
+
+static const struct gc5035_regval gc5035_otp_dd_enable_regs[] = {
+	{0xbe, 0x01},
+	{0x09, 0x00},
+	{0xfe, 0x01},
+	{0x80, 0x02},
+	{0xfe, 0x00},
+};
+
 /*
  * Xclk 24Mhz
  * Pclk 87.6Mhz
@@ -763,6 +897,346 @@ static int gc5035_read_reg(struct gc5035 *gc5035, u8 reg, u8 *val)
 	return 0;
 }
 
+static int gc5035_otp_read_data(struct gc5035 *gc5035, u16 bit_addr, u8 *data,
+				size_t length)
+{
+	size_t i;
+	int ret;
+
+	if (WARN_ON(bit_addr % 8))
+		return -EINVAL;
+
+	if (WARN_ON(bit_addr / 8 + length > GC5035_OTP_DATA_LENGTH))
+		return -EINVAL;
+
+	ret = gc5035_write_reg(gc5035, GC5035_PAGE_REG, 2);
+	if (ret)
+		return ret;
+
+	ret = gc5035_write_reg(gc5035, GC5035_REG_OTP_ACCESS_ADDR_H,
+			       (bit_addr >> 8) &
+			       GC5035_OTP_ACCESS_ADDR_H_MASK);
+	if (ret)
+		return ret;
+
+	ret = gc5035_write_reg(gc5035, GC5035_REG_OTP_ACCESS_ADDR_L,
+			       bit_addr & 0xff);
+	if (ret)
+		return ret;
+
+	ret = gc5035_write_reg(gc5035, GC5035_REG_OTP_MODE,
+			       GC5035_OTP_PRE_READ);
+	if (ret)
+		goto out_read_done;
+
+	ret = gc5035_write_reg(gc5035, GC5035_REG_OTP_MODE,
+			       GC5035_OTP_READ_MODE);
+	if (ret)
+		goto out_read_done;
+
+	for (i = 0; i < length; i++) {
+		ret = gc5035_read_reg(gc5035, GC5035_REG_OTP_DATA, &data[i]);
+		if (ret)
+			goto out_read_done;
+	}
+
+out_read_done:
+	gc5035_write_reg(gc5035, GC5035_REG_OTP_MODE, GC5035_OTP_READ_DONE);
+
+	return ret;
+}
+
+static int gc5035_read_otp_regs(struct gc5035 *gc5035)
+{
+	struct device *dev = &gc5035->client->dev;
+	struct gc5035_otp_regs *otp_regs = &gc5035->otp_regs;
+	u8 regs[GC5035_OTP_REG_DATA_SIZE] = {0};
+	unsigned int i, j;
+	u8 flag;
+	int ret;
+
+	ret = gc5035_otp_read_data(gc5035, GC5035_OTP_REG_FLAG_OFFSET,
+				   &flag, 1);
+	if (ret) {
+		dev_err(dev, "failed to read otp reg flag\n");
+		return ret;
+	}
+
+	dev_dbg(dev, "register update flag = 0x%x\n", flag);
+
+	gc5035->otp_regs.num_regs = 0;
+	if (flag != GC5035_OTP_FLAG_VALID)
+		return 0;
+
+	ret = gc5035_otp_read_data(gc5035, GC5035_OTP_REG_DATA_OFFSET,
+				   regs, sizeof(regs));
+	if (ret) {
+		dev_err(dev, "failed to read otp reg data\n");
+		return ret;
+	}
+
+	for (i = 0; i < GC5035_OTP_REG_MAX_GROUP; i++) {
+		unsigned int base_group = i * GC5035_OTP_REG_BYTE_PER_GROUP;
+
+		for (j = 0; j < GC5035_OTP_REG_PER_GROUP; j++) {
+			struct gc5035_reg *reg;
+
+			if (!(regs[base_group] &
+			      BIT((GC5035_OTP_PER_PAGE_SIZE * j +
+				  GC5035_OTP_PAGE_FLAG_OFFSET))))
+				continue;
+
+			reg = &otp_regs->regs[otp_regs->num_regs++];
+			reg->page = (regs[base_group] >>
+					(GC5035_OTP_PER_PAGE_SIZE * j)) &
+					GC5035_OTP_REG_PAGE_MASK;
+			reg->regval.addr = regs[base_group + j *
+					GC5035_OTP_REG_BYTE_PER_REG +
+					GC5035_OTP_REG_ADDR_OFFSET];
+			reg->regval.val = regs[base_group + j *
+					GC5035_OTP_REG_BYTE_PER_REG +
+					GC5035_OTP_REG_VAL_OFFSET];
+		}
+	}
+
+	return 0;
+}
+
+static int gc5035_read_dpc(struct gc5035 *gc5035)
+{
+	struct device *dev = &gc5035->client->dev;
+	struct gc5035_dpc *dpc = &gc5035->dpc;
+	u8 dpc_flag = 0;
+	u8 error_number = 0;
+	u8 total_number = 0;
+	int ret;
+
+	ret = gc5035_otp_read_data(gc5035, GC5035_OTP_DPC_FLAG_OFFSET,
+				   &dpc_flag, 1);
+	if (ret) {
+		dev_err(dev, "failed to read dpc flag\n");
+		return ret;
+	}
+
+	dev_dbg(dev, "dpc flag = 0x%x\n", dpc_flag);
+
+	dpc->valid = false;
+
+	switch (dpc_flag & GC5035_OTP_DPC_FLAG_MASK) {
+	case GC5035_OTP_FLAG_EMPTY:
+		dev_dbg(dev, "dpc info is empty!!\n");
+		break;
+
+	case GC5035_OTP_FLAG_VALID:
+		dev_dbg(dev, "dpc info is valid!\n");
+		ret = gc5035_otp_read_data(gc5035,
+					   GC5035_OTP_DPC_TOTAL_NUMBER_OFFSET,
+					   &total_number, 1);
+		if (ret) {
+			dev_err(dev, "failed to read dpc total number\n");
+			return ret;
+		}
+
+		ret = gc5035_otp_read_data(gc5035,
+					   GC5035_OTP_DPC_ERROR_NUMBER_OFFSET,
+					   &error_number, 1);
+		if (ret) {
+			dev_err(dev, "failed to read dpc error number\n");
+			return ret;
+		}
+
+		dpc->total_num = total_number + error_number;
+		dpc->valid = true;
+		dev_dbg(dev, "total_num = %d\n", dpc->total_num);
+		break;
+
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int gc5035_otp_read_sensor_info(struct gc5035 *gc5035)
+{
+	int ret;
+
+	ret = gc5035_read_dpc(gc5035);
+	if (ret)
+		return ret;
+
+	return gc5035_read_otp_regs(gc5035);
+}
+
+static int gc5035_check_dd_load_status(struct gc5035 *gc5035)
+{
+	u8 status;
+	int ret;
+
+	ret = gc5035_read_reg(gc5035, GC5035_REG_DD_LOAD_STATUS, &status);
+	if (ret)
+		return ret;
+
+	if (status & GC5035_OTP_BIT_LOAD)
+		return status;
+	else
+		return 0;
+}
+
+static int gc5035_otp_update_dd(struct gc5035 *gc5035)
+{
+	struct device *dev = &gc5035->client->dev;
+	struct gc5035_dpc *dpc = &gc5035->dpc;
+	int val, ret;
+
+	if (!dpc->valid) {
+		dev_dbg(dev, "DPC table invalid, not updating DD.\n");
+		return 0;
+	}
+
+	dev_dbg(dev, "DD auto load start\n");
+
+	ret = gc5035_write_array(gc5035, gc5035_dd_auto_load_regs,
+				 ARRAY_SIZE(gc5035_dd_auto_load_regs));
+	if (ret) {
+		dev_err(dev, "failed to write dd auto load reg\n");
+		return ret;
+	}
+
+	ret = gc5035_write_reg(gc5035, GC5035_REG_DD_TOTALNUM_H,
+			       (dpc->total_num >> 8) &
+			       GC5035_DD_TOTALNUM_H_MASK);
+	if (ret)
+		return ret;
+
+	ret = gc5035_write_reg(gc5035, GC5035_REG_DD_TOTALNUM_L,
+			       dpc->total_num & 0xff);
+	if (ret)
+		return ret;
+
+	ret = gc5035_write_array(gc5035, gc5035_otp_dd_regs,
+				 ARRAY_SIZE(gc5035_otp_dd_regs));
+	if (ret)
+		return ret;
+
+	/* Wait for DD to finish loading automatically */
+	ret = readx_poll_timeout(gc5035_check_dd_load_status, gc5035,
+				val, val <= 0, GC5035_DD_DELAY_US,
+				GC5035_DD_TIMEOUT_US);
+	if (ret < 0) {
+		dev_err(dev, "DD load timeout\n");
+		return -EFAULT;
+	}
+	if (val < 0) {
+		dev_err(dev, "DD load failure\n");
+		return val;
+	}
+
+	ret = gc5035_write_array(gc5035, gc5035_otp_dd_enable_regs,
+				 ARRAY_SIZE(gc5035_otp_dd_enable_regs));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int gc5035_otp_update_regs(struct gc5035 *gc5035)
+{
+	struct device *dev = &gc5035->client->dev;
+	struct gc5035_otp_regs *otp_regs = &gc5035->otp_regs;
+	unsigned int i;
+	int ret;
+
+	dev_dbg(dev, "reg count = %d\n", otp_regs->num_regs);
+
+	for (i = 0; i < otp_regs->num_regs; i++) {
+		ret = gc5035_write_reg(gc5035, GC5035_PAGE_REG,
+				       otp_regs->regs[i].page);
+		if (ret)
+			return ret;
+
+		ret = gc5035_write_reg(gc5035,
+				       otp_regs->regs[i].regval.addr,
+				       otp_regs->regs[i].regval.val);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int gc5035_otp_update(struct gc5035 *gc5035)
+{
+	struct device *dev = &gc5035->client->dev;
+	int ret;
+
+	ret = gc5035_otp_update_dd(gc5035);
+	if (ret) {
+		dev_err(dev, "failed to update otp dd\n");
+		return ret;
+	}
+
+	ret = gc5035_otp_update_regs(gc5035);
+	if (ret) {
+		dev_err(dev, "failed to update otp regs\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int gc5035_set_otp_config(struct gc5035 *gc5035)
+{
+	struct device *dev = &gc5035->client->dev;
+	u8 otp_id[GC5035_OTP_ID_SIZE];
+	int ret;
+
+	ret = gc5035_write_array(gc5035, gc5035_otp_init_regs,
+				 ARRAY_SIZE(gc5035_otp_init_regs));
+	if (ret) {
+		dev_err(dev, "failed to write otp init reg\n");
+		return ret;
+	}
+
+	ret = gc5035_otp_read_data(gc5035, GC5035_OTP_ID_DATA_OFFSET,
+				   &otp_id[0], GC5035_OTP_ID_SIZE);
+	if (ret) {
+		dev_err(dev, "failed to read otp id\n");
+		goto out_otp_exit;
+	}
+
+	if (!gc5035->otp_read || memcmp(gc5035->otp_id, otp_id, sizeof(otp_id))) {
+		dev_dbg(dev, "reading OTP configuration\n");
+
+		memset(&gc5035->otp_regs, 0, sizeof(gc5035->otp_regs));
+		memset(&gc5035->dpc, 0, sizeof(gc5035->dpc));
+
+		memcpy(gc5035->otp_id, otp_id, sizeof(gc5035->otp_id));
+
+		ret = gc5035_otp_read_sensor_info(gc5035);
+		if (ret < 0) {
+			dev_err(dev, "failed to read otp info\n");
+			goto out_otp_exit;
+		}
+
+		gc5035->otp_read = true;
+	}
+
+	ret = gc5035_otp_update(gc5035);
+	if (ret < 0)
+		return ret;
+
+out_otp_exit:
+	ret = gc5035_write_array(gc5035, gc5035_otp_exit_regs,
+				 ARRAY_SIZE(gc5035_otp_exit_regs));
+	if (ret) {
+		dev_err(dev, "failed to write otp exit reg\n");
+		return ret;
+	}
+
+	return ret;
+}
+
 static int gc5035_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_pad_config *cfg,
 			  struct v4l2_subdev_format *fmt)
@@ -859,6 +1333,10 @@ static int __gc5035_start_stream(struct gc5035 *gc5035)
 	if (ret)
 		return ret;
 
+	ret = gc5035_set_otp_config(gc5035);
+	if (ret)
+		return ret;
+
 	ret = gc5035_write_array(gc5035, gc5035->cur_mode->reg_list,
 				 gc5035->cur_mode->num_regs);
 	if (ret)
-- 
2.28.0.402.g5ffc5be6b7-goog

